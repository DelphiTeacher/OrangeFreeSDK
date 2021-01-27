{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Printer.Win;

{$R-,T-,X+,H+}

interface

{$SCOPEDENUMS ON}

uses
  Winapi.Windows, Winapi.WinSpool, Winapi.Messages, System.Classes, System.UITypes,
  FMX.Types, FMX.Canvas.GDIP, FMX.Forms, FMX.Printer, FMX.Graphics;

type
{ TPrinterWin }

  TPrinterWin = class(TPrinter)
  protected
    FPrinterIndex: Integer;
    FState: TPrinterState;
    FDC: HDC;
    FPrinterHandle: THandle;
    FDevMode: PDeviceMode;
    FDeviceMode: THandle;
    FOrientation: TPrinterOrientation;
    FCapabilities: TPrinterCapabilities;
    procedure SetCanvasDefaultSettings;
    procedure RefreshActivePrinter;
    procedure ActivePrinterChanged; override;
    procedure DoAbortDoc; override;
    procedure DoBeginDoc; override;
    procedure DoEndDoc; override;
    procedure DoNewPage; override;
    procedure SetState(Value: TPrinterState);
    function GetCanvas: TCanvas; override;
    function GetNumCopies: Integer; override;
    function GetHandle: HDC;
    function GetOrientation: TPrinterOrientation; override;
    function GetPageHeight: Integer; override;
    function GetPageWidth: Integer; override;
    procedure RefreshFonts; override;
    procedure RefreshPrinterDevices; override;
    procedure SetPrinterCapabilities(Value: Integer);
    procedure SetOrientation(Value: TPrinterOrientation); override;
    procedure SetNumCopies(Value: Integer); override;
    procedure SetDefaultPrinter; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure GetPrinter(ADevice, ADriver, APort: PChar; var ADeviceMode: THandle);
    procedure SetPrinter(ADevice, ADriver, APort: PChar; ADeviceMode: THandle);
    property Handle: HDC read GetHandle;
  end;

  { Printer function - Replaces the Printer global variable of previous versions,
    to improve smart linking (reduce exe size by 2.5k in projects that don't use
    the printer).  Code which assigned to the Printer global variable
    must call SetPrinter instead.  SetPrinter returns current printer object
    and makes the new printer object the current printer.  It is the caller's
    responsibility to free the old printer, if appropriate.  (This allows
    toggling between different printer objects without destroying configuration
    settings.) }

function ActualPrinterClass: TPrinterClass;

implementation

uses
  System.SysUtils, System.Types, FMX.Consts;

type
  TWinPrinterDevice = class(TPrinterDevice)
  private
    FTitle: string;

    procedure UnlockFree(MemHandle: THandle);
  protected
    function GetTitle: string; override;

    procedure PrinterSettingsReadError(const AdditionalMsg: String = '');
    procedure PrinterSettingsWriteError(const AdditionalMsg: String = '');

    procedure RefreshDPIList; override;
    procedure ActiveDPIChanged; override;
  public
    constructor Create(const ATitle, ADriver, ADevice, APort: string);
    function Equals(Obj: TObject): Boolean; override;
  end;

{ TWinPrinterDevice }

procedure TWinPrinterDevice.ActiveDPIChanged;
const
  CSafetySize = 512;
var
  PrinterName: PChar;
  PrinterHandle: THandle;
  HandleIn: THandle; // memory handle for DevMode input
  HandleOut: THandle; // memory handle for DevMode output
  HandleSettings: THandle; // memory handle for PrnStngs
  DevModeIn: PDevMode;
  DevModeOut: PDevMode;
  Settings: PPrinterInfo2;
  PrinterDefaults: TPrinterDefaults;
  DevModeSize: Integer;
  SettingsSize: Integer; // printer settings size
begin
  inherited;

  HandleIn := 0;
  HandleOut := 0;
  HandleSettings := 0;
  PrinterName := PChar(Device);

  ZeroMemory(@PrinterDefaults, SizeOf(PrinterDefaults));
  PrinterDefaults.DesiredAccess := PRINTER_ALL_ACCESS;
  if OpenPrinter(PrinterName, PrinterHandle, @PrinterDefaults) then
  try
    // obtain the correct size for the DevModeIn struct and allocate memory
    DevModeSize := DocumentProperties(0, PrinterHandle, PrinterName, nil, nil, 0);
    DevModeSize := DevModeSize + CSafetySize; // some drivers report wrong size
    HandleIn := GlobalAlloc(GHND, DevModeSize);
    HandleOut := GlobalAlloc(GHND, DevModeSize);

     // could not allocate memory
    if (HandleIn = 0) or (HandleOut = 0) then
      OutOfMemoryError;

    // lock mem and gain access to the mem zone
    DevModeIn := GlobalLock(HandleIn);
    DevModeOut := GlobalLock(HandleOut);

    // get the default DevModeIn struct
    if DocumentProperties(0, PrinterHandle, PrinterName, DevModeOut, nil, DM_OUT_BUFFER) <> IDOK then
      PrinterSettingsReadError(SysErrorMessage(GetLastError));

    // part 1 : setting the new resolution to the printer device;
    // change the device resolution to the one in ActivePPI
    CopyMemory(DevModeIn, DevModeOut, DevModeSize);
    DevModeIn^.dmFields := DM_PRINTQUALITY or DM_YRESOLUTION;
    DevModeIn^.dmPrintQuality := DPI[ActiveDPIIndex].X;
    DevModeIn^.dmYResolution := DPI[ActiveDPIIndex].Y;

    // don't reset the current options for the active printer
    if Printer.ActivePrinter = Self then
    begin
      DevModeIn^.dmFields := DevModeIn^.dmFields or DM_COPIES or DM_ORIENTATION;
      DevModeIn^.dmCopies := Printer.Copies;
      if Printer.Orientation = TPrinterOrientation.poPortrait then
        DevModeIn^.dmOrientation := DMORIENT_PORTRAIT
      else
        DevModeIn^.dmOrientation := DMORIENT_LANDSCAPE;
    end;

    DocumentProperties(0, PrinterHandle, PrinterName, DevModeOut, DevModeIn, DM_IN_BUFFER or DM_OUT_BUFFER);

    // part 2 : some printers can have their resolution set only by using SetPrinter;
    // allocate the correct mem size for PRINTER_INFO_2 struct
    GetPrinter(PrinterHandle, 2, nil, 0, @SettingsSize);
    HandleSettings := GlobalAlloc(GHND, SettingsSize);
    // could not allocate memory
    if HandleSettings = 0 then
      OutOfMemoryError;
    Settings := GlobalLock(HandleSettings);

    // get printer settings information
    if not GetPrinter(PrinterHandle, 2, Settings, SettingsSize, @SettingsSize) then
      PrinterSettingsReadError(SysErrorMessage(GetLastError));
    // the driver-dependent part may need to be updated from the driver-independent part
    DocumentProperties(0, PrinterHandle, PrinterName, DevModeIn, DevModeIn, DM_IN_BUFFER or DM_OUT_BUFFER);

    // try to set the new settings
    Settings^.pDevMode := DevModeIn;
    Settings^.pSecurityDescriptor := nil; // do not set the security descriptor
    if not Winapi.WinSpool.SetPrinter(PrinterHandle, 2, Settings, 0) then
      PrinterSettingsWriteError(SysErrorMessage(GetLastError));

    // notify system about the printer settings
    SendMessageTimeout(HWND_BROADCAST, WM_DEVMODECHANGE, 0, LPARAM(PrinterName),
      SMTO_ABORTIFHUNG, 1000, nil);

    // refresh the internal handles to update the property values such as
    // PageWidth and PageHeight
    TPrinterWin(Printer).RefreshActivePrinter;
  finally
    ClosePrinter(PrinterHandle);

    // unlock and free memory
    UnlockFree(HandleIn);
    UnlockFree(HandleOut);
    UnlockFree(HandleSettings);
  end;
end;

constructor TWinPrinterDevice.Create(const ATitle, ADriver, ADevice, APort: string);
begin
  inherited Create(ADriver, ADevice, APort);
  FTitle := ATitle;
end;

function TWinPrinterDevice.Equals(Obj: TObject): Boolean;
begin
  Result := (Obj is TPrinterDevice) and SameText(TPrinterDevice(Obj).Device, Device) and ((Port = '') or SameText(TPrinterDevice(Obj).Port, Port));
end;

function TWinPrinterDevice.GetTitle: string;
begin
  Result := FTitle;
end;

procedure TWinPrinterDevice.PrinterSettingsReadError(
  const AdditionalMsg: String);
begin
  raise EPrinterSettingsError.CreateFmt(SPrinterSettingsReadError, [AdditionalMsg]);
end;

procedure TWinPrinterDevice.PrinterSettingsWriteError(
  const AdditionalMsg: String);
begin
  raise EPrinterSettingsError.CreateFmt(SPrinterSettingsWriteError, [AdditionalMsg]);
end;

procedure TWinPrinterDevice.RefreshDPIList;
var
  DPIs: TArray<TPoint>;
  Count: Integer;
begin
  inherited;

  // obtain the range of pixel-per-inch resolutions
  Count := DeviceCapabilities(TMarshal.InString(Device), nil, DC_ENUMRESOLUTIONS, nil, nil);

  FDPIList.Clear;

  if Count > 0 then
  begin
    SetLength(DPIs, Count);
    DeviceCapabilities(TMarshal.InString(Device), nil, DC_ENUMRESOLUTIONS,
      MarshaledString(DPIs), nil);

    // add them to the list
    FDPIList.AddRange(DPIs);
  end;
end;

procedure TWinPrinterDevice.UnlockFree(MemHandle: THandle);
begin
  if MemHandle <> 0 then
  begin
    GlobalUnlock(MemHandle);
    GlobalFree(MemHandle);
  end;
end;

{ TPrinterWin }

constructor TPrinterWin.Create;
begin
  inherited;
  FPrinterIndex := -1;
end;

procedure TPrinterWin.ActivePrinterChanged;
begin
  RefreshActivePrinter;
end;

procedure TPrinterWin.SetState(Value: TPrinterState);
type
  TCreateHandleFunc = function(DriverName, DeviceName, Output: PChar; InitData: PDeviceMode): HDC stdcall;
var
  CreateHandleFunc: TCreateHandleFunc;
begin
  if Value <> FState then
  begin
    CreateHandleFunc := nil;
    case Value of
      TPrinterState.psNoHandle:
        begin
          CheckPrinting(False);
          { if Assigned(FCanvas) then
            FCanvas.FreeBuffer; }
          DeleteDC(FDC);
          FDC := 0;
        end;
      TPrinterState.psHandleIC:
        if FState <> TPrinterState.psHandleDC then
          CreateHandleFunc := CreateIC
        else
          Exit;
      TPrinterState.psHandleDC:
        begin
          // if FCanvas <> nil then
          // FCanvas.Handle := 0;
          if FDC <> 0 then
            DeleteDC(FDC);
          CreateHandleFunc := CreateDC;
        end;
    end;
    if Assigned(CreateHandleFunc) then
    begin
      FDC := CreateHandleFunc(PChar(ActivePrinter.Driver), PChar(ActivePrinter.Device),
                               PChar(ActivePrinter.Port), FDevMode);
      if FDC = 0 then
        RaiseError(SInvalidPrinter);
      // if FCanvas <> nil then
      // FCanvas.Handle := DC;
    end;
    FState := Value;
  end;
end;

function TPrinterWin.GetCanvas: TCanvas;
begin
  if FCanvas = nil then
  begin
    FCanvas := TCanvasManager.CreateFromPrinter(Self);
    SetCanvasDefaultSettings;
  end;
  Result := FCanvas;
end;

function TPrinterWin.GetNumCopies: Integer;
begin
  if FDeviceMode = 0 then
    RaiseError(SInvalidPrinterOp);
  Result := FDevMode.dmCopies;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  if Data <> nil then
    TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function TPrinterWin.GetHandle: HDC;
begin
  SetState(TPrinterState.psHandleIC);
  Result := FDC;
end;

function TPrinterWin.GetOrientation: TPrinterOrientation;
begin
  if FPrinterIndex = -1 then
    SetDefaultPrinter;
  if FDeviceMode = 0 then
    RaiseError(SInvalidPrinterOp);
  if FDevMode.dmOrientation = DMORIENT_PORTRAIT then
    Result := TPrinterOrientation.poPortrait
  else
    Result := TPrinterOrientation.poLandscape;
end;

procedure TPrinterWin.SetOrientation(Value: TPrinterOrientation);
const
  Orientations: array [TPrinterOrientation] of Integer = (DMORIENT_PORTRAIT,
    DMORIENT_LANDSCAPE);
begin
  inherited SetOrientation(Value);
  if FPrinterIndex = -1 then
    SetDefaultPrinter;
  if FDeviceMode = 0 then
    RaiseError(SInvalidPrinterOp);
  SetState(TPrinterState.psNoHandle);
  FDevMode^.dmOrientation := Orientations[Value];
end;

function TPrinterWin.GetPageHeight: Integer;
begin
  SetState(TPrinterState.psHandleIC);
  Result := GetDeviceCaps(FDC, VertRes);
end;

function TPrinterWin.GetPageWidth: Integer;
begin
  SetState(TPrinterState.psHandleIC);
  Result := GetDeviceCaps(FDC, HorzRes);
end;

procedure TPrinterWin.GetPrinter(ADevice, ADriver, APort: PChar; var ADeviceMode: THandle);
begin
  StrCopy(ADevice, PChar(ActivePrinter.Device));
  StrCopy(ADriver, PChar(ActivePrinter.Driver));
  StrCopy(APort, PChar(ActivePrinter.Port));
  ADeviceMode := FDeviceMode;
end;

procedure TPrinterWin.SetPrinter(ADevice, ADriver, APort: PChar; ADeviceMode: THandle);
var
  I, J: Integer;
begin
  CheckPrinting(False);
  if ADeviceMode <> FDeviceMode then
  begin  // free the devmode block we have, and take the one we're given
    if FDeviceMode <> 0 then
    begin
      GlobalUnlock(FDeviceMode);
      GlobalFree(FDeviceMode);
      FDevMode := nil;
    end;
    FDeviceMode := ADeviceMode;
  end;
  if FDeviceMode <> 0 then
  begin
    FDevMode := GlobalLock(FDeviceMode);
    SetPrinterCapabilities(FDevMode.dmFields);
  end;
  FreeFonts;
  if FPrinterHandle <> 0 then
  begin
    ClosePrinter(FPrinterHandle);
    FPrinterHandle := 0;
  end;
  SetState(TPrinterState.psNoHandle);
  J := -1;
  for I := 0 to Count - 1 do
  begin
    if TWinPrinterDevice(Printers[I]).Equals(ADriver, ADevice, APort) then
    begin
      TWinPrinterDevice(Printers[I]).Port := APort;
      J := I;
      Break;
    end;
  end;
  if J = -1 then
  begin
    J := Count;
    FPrinters.Add(TWinPrinterDevice.Create(Format(SDeviceOnPort, [ADevice, APort]), ADriver,
      ADevice, APort));
  end;
  FPrinterIndex := J;
  ActivePrinter := Printers[FPrinterIndex];
  if OpenPrinter(ADevice, FPrinterHandle, nil) then
  begin
    if FDeviceMode = 0 then  // alloc new device mode block if one was not passed in
    begin
      FDeviceMode := GlobalAlloc(GHND,
        DocumentProperties(0, FPrinterHandle, ADevice, nil, nil, 0));

      if FDeviceMode <> 0 then
      begin
        FDevMode := GlobalLock(FDeviceMode);
        if DocumentProperties(0, FPrinterHandle, ADevice, FDevMode^, FDevMode^, DM_OUT_BUFFER) < 0 then
        begin
          GlobalUnlock(FDeviceMode);
          GlobalFree(FDeviceMode);
          FDeviceMode := 0;
          FDevMode := nil;
        end
      end;
    end;
    if FDeviceMode <> 0 then
      SetPrinterCapabilities(FDevMode.dmFields);
  end;
end;

procedure TPrinterWin.SetPrinterCapabilities(Value: Integer);
begin
  FCapabilities := [];
  if (Value and DM_ORIENTATION) <> 0 then
    Include(FCapabilities, TPrinterCapability.pcOrientation);
  if (Value and DM_COPIES) <> 0 then
    Include(FCapabilities, TPrinterCapability.pcCopies);
  if (Value and DM_COLLATE) <> 0 then
    Include(FCapabilities, TPrinterCapability.pcCollation);
end;

function FetchStr(var Str: PChar): PChar;
var
  P: PChar;
begin
  Result := Str;
  if Str = nil then
    Exit;
  P := Str;
  while P^ = ' ' do
    Inc(P);
  Result := P;
  while (P^ <> #0) and (P^ <> ',') do
    Inc(P);
  if P^ = ',' then
  begin
    P^ := #0;
    Inc(P);
  end;
  Str := P;
end;

procedure TPrinterWin.RefreshActivePrinter;
var
  LDevice: PChar;
begin
  GlobalUnlock(FDeviceMode);
  GlobalFree(FDeviceMode);
  FDeviceMode := 0;
  if FFonts <> nil then
    FFonts.Clear;
  if FPrinterHandle <> 0 then
  begin
    ClosePrinter(FPrinterHandle);
    FPrinterHandle := 0;
  end;
  SetState(TPrinterState.psNoHandle);
  LDevice := PChar(ActivePrinter.Device);
  if OpenPrinter(LDevice, FPrinterHandle, nil) then
  begin
    if FDeviceMode = 0 then
    // alloc new device mode block if one was not passed in
    begin
      FDeviceMode := GlobalAlloc(GHND, DocumentProperties(0, FPrinterHandle,
        LDevice, nil, nil, 0));

      if FDeviceMode <> 0 then
      begin
        FDevMode := GlobalLock(FDeviceMode);
        if DocumentProperties(0, FPrinterHandle, LDevice, FDevMode^, FDevMode^,
          DM_OUT_BUFFER) < 0 then
        begin
          GlobalUnlock(FDeviceMode);
          GlobalFree(FDeviceMode);
          FDeviceMode := 0;
          FDevMode := nil;
        end
      end;
    end;
    if FDeviceMode <> 0 then
      SetPrinterCapabilities(FDevMode^.dmFields);
  end;
end;

procedure TPrinterWin.RefreshFonts;
begin
  SetState(TPrinterState.psHandleIC);
  EnumFonts(FDC, nil, @EnumFontsProc, Pointer(FFonts));
end;

procedure TPrinterWin.RefreshPrinterDevices;
var
  Flags, Count, NumInfo: DWORD;
  I: Integer;
  Level: Byte;
  LineCur, Port: PChar;
  Buffer, PrinterInfo: PByte;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
    Level := 4;
  end
  else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;
  Count := 0;
  EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
  if Count = 0 then
    Exit;
  GetMem(Buffer, Count);
  try
    if not EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count,
      NumInfo) then
      Exit;
    PrinterInfo := Buffer;
    for I := 0 to NumInfo - 1 do
    begin
      if Level = 4 then
      begin
        FPrinters.Add(TWinPrinterDevice.Create(PPrinterInfo4(PrinterInfo)^.pPrinterName,
            '', PPrinterInfo4(PrinterInfo)^.pPrinterName, ''));
        Inc(PrinterInfo, sizeof(TPrinterInfo4));
      end
      else
      begin
        LineCur := PPrinterInfo5(PrinterInfo)^.pPortName;
        Port := FetchStr(LineCur);
        while Port^ <> #0 do
        begin
          FPrinters.Add(TWinPrinterDevice.Create(Format(SDeviceOnPort, [PPrinterInfo5(PrinterInfo)^.pPrinterName, Port]),
            '', PPrinterInfo5(PrinterInfo)^.pPrinterName, Port));
          Port := FetchStr(LineCur);
        end;
        Inc(PrinterInfo, sizeof(TPrinterInfo5));
      end;
    end;
  finally
    FreeMem(Buffer, Count);
  end;
end;

procedure TPrinterWin.SetNumCopies(Value: Integer);
begin
  inherited SetNumCopies(Value);
  CheckPrinting(False);
  if FPrinterIndex = -1 then
    SetDefaultPrinter;
  if FDeviceMode = 0 then
    RaiseError(SInvalidPrinterOp);
  SetState(TPrinterState.psNoHandle);
  FDevMode^.dmCopies := Value;
end;

procedure TPrinterWin.SetCanvasDefaultSettings;
begin
  if FCanvas <> nil then
  begin
    FCanvas.Fill.Kind := TBrushKind.Solid;
    FCanvas.Fill.Color := TAlphaColors.Black;
  end;
end;

procedure TPrinterWin.SetDefaultPrinter;
var
  I: Integer;
  ByteCnt, StructCnt: DWORD;
  DefaultPrinter: array[0..1023] of Char;
  Cur, Device: PChar;
  PrinterInfo: PPrinterInfo5;
  Printer: TPrinterDevice;
begin
  ByteCnt := 0;
  StructCnt := 0;
  if not EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, nil, 0, ByteCnt, StructCnt)
    and (GetLastError <> ERROR_INSUFFICIENT_BUFFER) then
  begin
    // With no printers installed, Win95/98 fails above with "Invalid filename".
    // NT succeeds and returns a StructCnt of zero.
    if GetLastError = ERROR_INVALID_NAME then
      RaiseError(SNoDefaultPrinter)
    else
      RaiseLastOSError;
  end;
  PrinterInfo := AllocMem(ByteCnt);
  try
    EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, PrinterInfo, ByteCnt, ByteCnt,
      StructCnt);
    if StructCnt > 0 then
      Device := PrinterInfo.pPrinterName
    else
    begin
      I := Length(DefaultPrinter);
      if not GetDefaultPrinter(DefaultPrinter, @I) then
        ZeroMemory(@DefaultPrinter[0], I * sizeof(Char));
      Cur := DefaultPrinter;
      Device := FetchStr(Cur);
    end;
    for I := 0 to Count - 1 do
    begin
      Printer := Printers[I];
      if AnsiSameText(Printer.Device, Device) then
      begin
        FPrinterIndex := I;
        ActivePrinter := Printer;
        Exit;
      end;
    end;
  finally
    FreeMem(PrinterInfo);
  end;
  RaiseError(SNoDefaultPrinter);
end;

function AbortProc(Prn: HDC; Error: Integer): Bool; stdcall;
begin
  Application.ProcessMessages;
  Result := not Printer.Aborted;
end;

destructor TPrinterWin.Destroy;
begin
  SetState(TPrinterState.psNoHandle);

  inherited;

  if FPrinterHandle <> 0 then
    ClosePrinter(FPrinterHandle);
  if FDeviceMode <> 0 then
  begin
    GlobalUnlock(FDeviceMode);
    GlobalFree(FDeviceMode);
    FDeviceMode := 0;
  end;
end;

procedure TPrinterWin.DoAbortDoc;
begin
  AbortDoc(FDC);
end;

procedure TPrinterWin.DoBeginDoc;
var
  DocInfo: TDocInfo;
begin
  // create a new DC for printing and destroy the previous DC
  SetState(TPrinterState.psNoHandle);
  SetState(TPrinterState.psHandleDC);
  // on a second document printing process, the canvas must reconnect its
  // underlying objects to the new DC
  TCanvasManager.RecreateFromPrinter(Canvas, Self);
  SetCanvasDefaultSettings;

  // Canvas.Refresh;
  // TPrinterCanvas(Canvas).UpdateFont;
  FillChar(DocInfo, sizeof(DocInfo), 0);
  DocInfo.cbSize := sizeof(DocInfo);
  DocInfo.lpszDocName := PChar(Title);
  SetAbortProc(FDC, AbortProc);
  StartDoc(FDC, DocInfo);
  StartPage(FDC);
end;

procedure TPrinterWin.DoEndDoc;
begin
  EndPage(FDC);
  if not Aborted then
    Winapi.Windows.EndDoc(FDC);
end;

procedure TPrinterWin.DoNewPage;
begin
  EndPage(FDC);
  StartPage(FDC);
  // Canvas.Refresh;
end;

function ActualPrinterClass : TPrinterClass;
begin
  Result := TPrinterWin;
end;

end.
