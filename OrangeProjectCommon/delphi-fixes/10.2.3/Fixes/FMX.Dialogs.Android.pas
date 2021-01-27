(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2013-09-19　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)

{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2015-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Dialogs.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Generics.Collections, System.UITypes,
  Androidapi.JNIBridge, Androidapi.JNI.Embarcadero, Androidapi.Jni.JavaTypes,
  FMX.Dialogs;

type

  TFMXDialogListener = class;
  TFMXDialogListenerParentList = class(TList<TFmxDialogListener>)
  end;
  TFMXDialogListener = class(TJavaLocal, JFMXDialogListener)
  private
    //Fix By Flying Wang
    FDefaultCancelButtonIndex: Integer;
    [Weak] FParentList: TFMXDialogListenerParentList;
    FValues: array of string;
    FDefaultValues: array of string;
    FModalResult: TModalResult;
    FInputCloseQueryProc: TInputCloseQueryProc;
    FCallerThread: TThread;
    procedure DoDialogClosed;
    procedure SetParentList(const AList: TFMXDialogListenerParentList);
  public
//    constructor Create(const AInputCloseQueryProc: TInputCloseQueryProc);
//Fix By Flying Wang
    constructor Create(const AInputCloseQueryProc: TInputCloseQueryProc; ADefaultCancelButtonIndex: Integer = 0);
    procedure onDialogClosed(modalResult: Integer; values: TJavaObjectArray<JString>); cdecl;
    property ParentList: TFMXDialogListenerParentList read FParentList write SetParentList;
  end;

//Fix By Flying Wang
var
  /// <summary>
  ///   <para>
  ///     是否允许点击对话框区域之外
  ///   </para>
  ///   <para>
  ///     对于默认返回值为 mbHelp 或错误默认值的对话框，本选项无效，肯定禁止
  ///   </para>
  /// </summary>
  MessageDialog_CanceledOnTouchOutsid: Boolean = True;
  /// <summary>
  ///   <para>
  ///     是否允许用返回按钮取消对话框
  ///   </para>
  ///   <para>
  ///     对于默认返回值为 mbHelp 或错误默认值的对话框，本选项无效，肯定禁止
  ///   </para>
  ///   <para>
  ///     目前不起作用
  ///   </para>
  ///   <para>
  ///     也可能是用来决定是否在右上角显示一个关闭按钮。
  ///   </para>
  /// </summary>
  MessageDialog_Canceleable: Boolean = True;
  /// <summary>
  ///   模式化(Modaled or Blocking)对话框内部用等待毫秒数
  /// </summary>
  BlockingMessageWaitMilliSeconds: Integer = 5;

implementation

uses
  System.SysUtils, System.IOUtils, System.Math, System.Types,
  Androidapi.Jni, Androidapi.Helpers,
  FMX.Platform.Android, FMX.Helpers.Android,
  FMX.Platform, FMX.Consts, FMX.Forms;

type
  TFMXDialogService = class(TInterfacedObject, IFMXDialogServiceAsync, IFMXDialogService)
  public const
    MsgCaptions: array [TMsgDlgType] of string = (SMsgDlgWarning, SMsgDlgError, SMsgDlgInformation, SMsgDlgConfirm, '');
  strict private
    constructor Create;
    class var FCurrent: TFMXDialogService;
    class function GetCurrent: TFMXDialogService; static;
  private
    FAlertListeners: TFMXDialogListenerParentList;

    { IFMXDialogService }
    function DialogOpenFiles(const ADialog: TOpenDialog; var AFiles: TStrings; AType: TDialogType): Boolean;
    function DialogPrint(var ACollate, APrintToFile: Boolean;
      var AFromPage, AToPage, ACopies: Integer; AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange;
      AOptions: TPrintDialogOptions): Boolean;
    function PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
      AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
    function DialogPageSetup(var AMargin, AMinMargin :TRect; var APaperSize: TPointF;
      var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
    function DialogSaveFiles(const ADialog: TOpenDialog; var AFiles: TStrings): Boolean;
    function DialogPrinterSetup: Boolean;
    function MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
      const AHelpFileName: string): Integer; overload;
    procedure MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext; const AHelpFileName: string;
      const ACloseDialogProc: TInputCloseDialogProc); overload;
    function InputQuery(const ACaption: string; const APrompts: array of string;
      var AValues: array of string; const ACloseQueryFunc: TInputCloseQueryFunc = nil): Boolean; overload;
    procedure InputQuery(const ACaption: string; const APrompts, ADefaultValues: array of string;
      const ACloseQueryProc: TInputCloseQueryProc); overload;

    { IFMXDialogServiceAsync }
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string); overload;
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc); overload;
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject = nil); overload;

    /// <summary>Shows custom message dialog with specified buttons on it.</summary>
    procedure MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogProc: TInputCloseDialogProc); overload;
    /// <summary>Shows custom message dialog with specified buttons on it.</summary>
    procedure MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject = nil); overload;

    /// <summary>Shows an input message dialog with the specified promps and values on it. </summary>
    procedure InputQueryAsync(const ACaption: string; const APrompts: array of string; const ADefaultValues: array of string;
      const ACloseQueryProc: TInputCloseQueryProc); overload;
    /// <summary>Shows an input message dialog with the specified promps and values on it. </summary>
    procedure InputQueryAsync(const ACaption: string; const APrompts: array of string; const ADefaultValues: array of string;
      const ACloseQueryEvent: TInputCloseQueryWithResultEvent; const AContext: TObject = nil); overload;

  public
    destructor Destroy; override;
    class destructor UnInitialize;
    class property Current: TFMXDialogService read GetCurrent;
  end;

{ TFMXDialogListener }

//constructor TFMXDialogListener.Create(const AInputCloseQueryProc: TInputCloseQueryProc);
//Fix By Flying Wang.
constructor TFMXDialogListener.Create(const AInputCloseQueryProc: TInputCloseQueryProc;
      ADefaultCancelButtonIndex: Integer);
begin
  inherited Create;
//Fix By Flying Wang.
  FDefaultCancelButtonIndex := ADefaultCancelButtonIndex;
  FInputCloseQueryProc := AInputCloseQueryProc;
  FCallerThread := TThread.Current;
end;

procedure TFMXDialogListener.DoDialogClosed;
begin
  //Fix By Flying Wang.
  //非常幸运的是，正常的返回都大于 0 。
  if FModalResult <= 0 then
    FModalResult := FDefaultCancelButtonIndex;
  FInputCloseQueryProc(FModalResult, FValues);
  if FParentList <> nil then
    FParentList.Remove(Self);
end;

procedure TFMXDialogListener.onDialogClosed(modalResult: Integer; values: TJavaObjectArray<JString>);
var
  I: Integer;
begin
  FModalResult := modalResult;
  if values <> nil then
  begin
    SetLength(FValues, values.Length);
    for I := 0 to values.Length - 1 do
    begin
        if FModalResult = mrOk then
          FValues[I] := JStringToString(values.Items[I])
        else if FDefaultValues <> nil then
          FValues[I] := FDefaultValues[I];
    end
  end;
  TThread.Queue(FCallerThread, DoDialogClosed);
end;

procedure TFMXDialogListener.SetParentList(const AList: TFMXDialogListenerParentList);
begin
  FParentList := AList;
  if FParentList <> nil then
    FParentList.Add(Self);
end;

{ TFMXDialogService }

constructor TFMXDialogService.Create;
begin
  inherited;
  FAlertListeners := TFMXDialogListenerParentList.Create;
end;

destructor TFMXDialogService.Destroy;
begin
  FAlertListeners.Free;
  inherited;
end;

function TFMXDialogService.DialogOpenFiles(const ADialog: TOpenDialog; var AFiles: TStrings;
  AType: TDialogType): Boolean;
begin
  Result := False;
end;

function TFMXDialogService.DialogPageSetup(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
  var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
begin
  Result := False;
end;

function TFMXDialogService.DialogPrint(var ACollate, APrintToFile: Boolean; var AFromPage, AToPage, ACopies: Integer;
  AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange; AOptions: TPrintDialogOptions): Boolean;
begin
  Result := False;
end;

function TFMXDialogService.DialogPrinterSetup: Boolean;
begin
  Result := False;
end;

function TFMXDialogService.DialogSaveFiles(const ADialog: TOpenDialog; var AFiles: TStrings): Boolean;
begin
  Result := False;
end;

class function TFMXDialogService.GetCurrent: TFMXDialogService;
begin
  if FCurrent = nil then
    FCurrent := TFMXDialogService.Create;
  Result := FCurrent;
end;

class destructor TFMXDialogService.UnInitialize;
begin
  FCurrent.DisposeOf;
  FCurrent := nil;
end;

{ IFMXDialogServiceAsync }

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string);
begin
  MessageDialogAsync(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOk], TMsgDlgBtn.mbOk, 0, nil);
end;

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc);
begin
  MessageDialogAsync(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOk], TMsgDlgBtn.mbOk, 0, ACloseDialogProc);
end;

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject);
begin
  MessageDialogAsync(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOk], TMsgDlgBtn.mbOk, 0, ACloseDialogEvent, AContext);
end;

procedure TFMXDialogService.MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
  const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogProc: TInputCloseDialogProc);
var
  DialogFactory: JFMXDialogFactory;
  DialogListener: TFMXDialogListener;
  AlertDialog: JFMXStandardDialog;
  PosButton, NegButton, NeutralButton: Integer;
  B: TMsgDlgBtn;
//Fix By Flying Wang
  DefaultCancelButton,
  ButtonIndex: Integer;
  ButtonsCount: Integer;
  LCaptions: TJavaObjectArray<JString>;
  I: TMsgDlgBtn;
begin
  MessageDialogCheckInUIThread;
  ButtonsCount := 0;
  ButtonIndex := 0;
  PosButton := -1;
  NegButton := -1;
  NeutralButton := -1;
  //Fix By Flying Wang
  //这里不能用 -1;
  DefaultCancelButton := 0;

  for I := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    if I in AButtons then
      Inc(ButtonsCount);
  ButtonsCount := Min(ButtonsCount, 3);

  LCaptions := TJavaObjectArray<JString>.Create(ButtonsCount);

  for B in AButtons do
  begin
    if ButtonIndex < ButtonsCount then
    begin
      LCaptions.Items[ButtonIndex] := StringToJString(ButtonCaptions[B]);
      //Fix By Flying Wang
      if ADefaultButton = B then
      begin
        DefaultCancelButton := ModalResults[B];
      end;
      case ButtonIndex of
        0: PosButton := ModalResults[B];
        1: NegButton := ModalResults[B];
        2: NeutralButton := ModalResults[B];
      end;
    end;
    Inc(ButtonIndex);
  end;

  DialogFactory := TJFMXDialogFactory.JavaClass.getFactory;
  if DialogFactory <> nil then
  begin
    AlertDialog := DialogFactory.createMessageDialog(MainActivity, GetNativeTheme, StringToJString(AMessage),
      Ord(ADialogType), LCaptions, PosButton, NegButton, NeutralButton);

    if AlertDialog <> nil then
    begin
      //Fix By Flying Wang
      if DefaultCancelButton > 0 then
      begin
        AlertDialog.getRealDialog.setCancelable(MessageDialog_Canceleable);
        AlertDialog.getRealDialog.setCanceledOnTouchOutside(
          MessageDialog_CanceledOnTouchOutsid);
      end
      else
      begin
        AlertDialog.getRealDialog.setCancelable(False);
        AlertDialog.getRealDialog.setCanceledOnTouchOutside(False);
      end;
      if Assigned(ACloseDialogProc) then
      begin
        DialogListener := TFMXDialogListener.Create(
          procedure (const AResult: TModalResult; const AValues: array of string)
          begin
            ACloseDialogProc(AResult);
          //end);
          //Fix By Flying Wang
          end, DefaultCancelButton);
        DialogListener.ParentList := FAlertListeners;
        AlertDialog.setListener(DialogListener);
      end;
      AlertDialog.show;
    end;
  end;
end;

function TFMXDialogService.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
  const AHelpFileName: string): Integer;
begin
  raise ENotImplemented.CreateFmt(SNotImplementedOnPlatform, [SBlockingDialogs]);
  Result := -1;
////Fix By Flying Wang
//var
//  ARetVal: Integer;
//begin
//  ARetVal := -1;
//  MessageDialog(AMessage, ADialogType, AButtons, ADefaultButton, AX, AY, AHelpCtx, AHelpFileName,
//    procedure(const AResult: TModalResult)
//      begin
//        ARetVal := AResult;
//      end);
//  while ARetVal < 0 do
//  begin
//    Sleep(BlockingMessageWaitMilliSeconds);
//    Application.ProcessMessages;
//  end;
//  Result := ARetVal;
end;

procedure TFMXDialogService.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
  const AHelpFileName: string; const ACloseDialogProc: TInputCloseDialogProc);
var
  DialogFactory: JFMXDialogFactory;
  DialogListener: TFMXDialogListener;
  AlertDialog: JFMXStandardDialog;
  PosButton, NegButton, NeutralButton: Integer;
  B: TMsgDlgBtn;
//Fix By Flying Wang
  DefaultCancelButton,
  ButtonIndex: Integer;
  ButtonsCount: Integer;
  LCaptions: TJavaObjectArray<JString>;
  I: TMsgDlgBtn;
begin
  ButtonsCount := 0;
  ButtonIndex := 0;
  PosButton := -1;
  NegButton := -1;
  NeutralButton := -1;
//Fix By Flying Wang
  //这里不能用 -1;
  DefaultCancelButton := 0;

  for I := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    if I in AButtons then
      Inc(ButtonsCount);
  ButtonsCount := Min(ButtonsCount, 3);

  LCaptions := TJavaObjectArray<JString>.Create(ButtonsCount);

  for B in AButtons do
  begin
    if ButtonIndex < ButtonsCount then
    begin
      LCaptions.Items[ButtonIndex] := StringToJString(ButtonCaptions[B]);
      //Fix By Flying Wang
      if ADefaultButton = B then
      begin
        DefaultCancelButton := ModalResults[B];
      end;
      case ButtonIndex of
        0: PosButton := ModalResults[B];
        1: NegButton := ModalResults[B];
        2: NeutralButton := ModalResults[B];
      end;
    end;
    Inc(ButtonIndex);
  end;

  DialogFactory := TJFMXDialogFactory.JavaClass.getFactory;
  if DialogFactory <> nil then
  begin
    AlertDialog := DialogFactory.createMessageDialog(MainActivity, GetNativeTheme, StringToJString(AMessage),
      Ord(ADialogType), LCaptions, PosButton, NegButton, NeutralButton);

    if AlertDialog <> nil then
    begin
      //Fix By Flying Wang
      if DefaultCancelButton > 0 then
      begin
        AlertDialog.getRealDialog.setCancelable(MessageDialog_Canceleable);
        AlertDialog.getRealDialog.setCanceledOnTouchOutside(
          MessageDialog_CanceledOnTouchOutsid);
      end
      else
      begin
        AlertDialog.getRealDialog.setCancelable(False);
        AlertDialog.getRealDialog.setCanceledOnTouchOutside(False);
      end;
      if Assigned(ACloseDialogProc) then
      begin
        DialogListener := TFMXDialogListener.Create(
          procedure (const AResult: TModalResult; const AValues: array of string)
          begin
            ACloseDialogProc(AResult);
          //end);
          //Fix By Flying Wang
          end, DefaultCancelButton);
        DialogListener.ParentList := FAlertListeners;
        AlertDialog.setListener(DialogListener);
      end;
      AlertDialog.show;
    end;
  end;
end;

procedure TFMXDialogService.MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
  const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogEvent: TInputCloseDialogEvent;
  const AContext: TObject);
begin
  MessageDialogAsync(AMessage, ADialogType, AButtons, ADefaultButton, AHelpCtx,
      procedure (const AResult: TModalResult)
      begin
        if Assigned(ACloseDialogEvent) then
          AcloseDialogEvent(AContext, AResult);
      end);
end;

function TFMXDialogService.PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
  AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
begin
  Result := False;
end;

procedure TFMXDialogService.InputQueryAsync(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; const ACloseQueryProc: TInputCloseQueryProc);
var
  QueryDialog: JFMXStandardDialog;
  DialogListener: TFMXDialogListener;
  DialogFactory: JFMXDialogFactory;
  JavaPrompts: TJavaObjectArray<JString>;
  JavaDefaultValues: TJavaObjectArray<JString>;
  LCaptions: TJavaObjectArray<JString>;
  LDefaultValues: array of string;
  I: Integer;
begin
  MessageDialogCheckInUIThread;
  if Length(ADefaultValues) < Length(APrompts) then
    raise EInvalidOperation.Create(SPromptArrayTooShort);
  if Length(APrompts) = 0 then
    raise EInvalidOperation.Create(SPromptArrayEmpty);

  JavaPrompts := TJavaObjectArray<JString>.Create(Length(APrompts));
  JavaDefaultValues := TJavaObjectArray<JString>.Create(Length(ADefaultValues));
  for I := 0 to Length(APrompts) - 1 do
    JavaPrompts[I] := StringToJString(APrompts[I]);
  for I := 0 to Length(ADefaultValues) - 1 do
    JavaDefaultValues[I] := StringToJString(ADefaultValues[I]);
  LCaptions := TJavaObjectArray<JString>.Create(2);
  LCaptions.Items[0] := StringToJString(ButtonCaptions[TMsgDlgBtn.mbOK]);
  LCaptions.Items[1] := StringToJString(ButtonCaptions[TMsgDlgBtn.mbCancel]);

  SetLength(LDefaultValues, Length(ADefaultValues));
  TArray.Copy<string>(ADefaultValues, LDefaultValues, Length(ADefaultValues));

  DialogFactory := TJFMXDialogFactory.JavaClass.getFactory;
  if DialogFactory <> nil then
  begin
    QueryDialog := DialogFactory.createInputQueryDialog(MainActivity, GetNativeTheme, StringToJString(ACaption),
      JavaPrompts, JavaDefaultValues, LCaptions);
    if QueryDialog <> nil then
    begin
      //Fix By Flying Wang
      QueryDialog.getRealDialog.setCancelable(MessageDialog_Canceleable);
      QueryDialog.getRealDialog.setCanceledOnTouchOutside(
        MessageDialog_CanceledOnTouchOutsid);
      if Assigned(ACloseQueryProc) then
      begin
        //DialogListener := TFMXDialogListener.Create(ACloseQueryProc);
        //Fix By Flying Wang
        DialogListener := TFMXDialogListener.Create(ACloseQueryProc, ModalResults[TMsgDlgBtn.mbCancel]);
        DialogListener.ParentList := FAlertListeners;
        SetLength(DialogListener.FDefaultValues, Length(LDefaultValues));
        TArray.Copy<string>(LDefaultValues, DialogListener.FDefaultValues, Length(LDefaultValues));
        QueryDialog.setListener(DialogListener);
      end;
      QueryDialog.show;
    end;
  end;
end;

procedure TFMXDialogService.InputQuery(const ACaption: string; const APrompts, ADefaultValues: array of string;
  const ACloseQueryProc: TInputCloseQueryProc);
var
  DialogFactory: JFMXDialogFactory;
  QueryDialog: JFMXStandardDialog;
  JavaPrompts: TJavaObjectArray<JString>;
  JavaDefaultValues: TJavaObjectArray<JString>;
  DialogListener: TFMXDialogListener;
  LCaptions: TJavaObjectArray<JString>;
  I: Integer;
begin
  if Length(ADefaultValues) < Length(APrompts) then
    raise EInvalidOperation.Create(SPromptArrayTooShort);
  if Length(APrompts) = 0 then
    raise EInvalidOperation.Create(SPromptArrayEmpty);

  JavaPrompts := TJavaObjectArray<JString>.Create(Length(APrompts));
  JavaDefaultValues := TJavaObjectArray<JString>.Create(Length(ADefaultValues));
  for I := 0 to Length(APrompts) - 1 do
    JavaPrompts[I] := StringToJString(APrompts[I]);
  for I := 0 to Length(ADefaultValues) - 1 do
    JavaDefaultValues[I] := StringToJString(ADefaultValues[I]);
  LCaptions := TJavaObjectArray<JString>.Create(2);
  LCaptions.Items[0] := StringToJString(ButtonCaptions[TMsgDlgBtn.mbOK]);
  LCaptions.Items[1] := StringToJString(ButtonCaptions[TMsgDlgBtn.mbCancel]);
  DialogFactory := TJFMXDialogFactory.JavaClass.getFactory;
  if DialogFactory <> nil then
  begin
    QueryDialog := DialogFactory.createInputQueryDialog(MainActivity, GetNativeTheme, StringToJString(ACaption),
      JavaPrompts, JavaDefaultValues, LCaptions);
    if QueryDialog <> nil then
    begin
      //Fix By Flying Wang
      QueryDialog.getRealDialog.setCancelable(MessageDialog_Canceleable);
      QueryDialog.getRealDialog.setCanceledOnTouchOutside(
        MessageDialog_CanceledOnTouchOutsid);
      if Assigned(ACloseQueryProc) then
      begin
        //DialogListener := TFMXDialogListener.Create(ACloseQueryProc);
        //Fix By Flying Wang
        DialogListener := TFMXDialogListener.Create(ACloseQueryProc,
          ModalResults[TMsgDlgBtn.mbCancel]);
        DialogListener.ParentList := FAlertListeners;
        QueryDialog.setListener(DialogListener);
      end;
      QueryDialog.show;
    end;
  end;
end;

function TFMXDialogService.InputQuery(const ACaption: string; const APrompts: array of string;
  var AValues: array of string; const ACloseQueryFunc: TInputCloseQueryFunc): Boolean;
begin
  raise ENotImplemented.CreateFmt(SNotImplementedOnPlatform + sLineBreak + SInputQueryAndroidOverloads,
    [SBlockingDialogs]);
  Result := False;
////Fix By Flying Wang
//var
//  ARetVal: Integer;
//  I, J: Integer;
//  CValues: array of string;
//begin
//  ARetVal := -1;
//  InputQuery(ACaption, APrompts, AValues,
//    procedure(const AResult: TModalResult; const BValues: array of string)
//      var
//        I, J: Integer;
//      begin
//        ARetVal := AResult;
//        if ARetVal = mrOK then
//        begin
//          if Assigned(ACloseQueryFunc) then
//            ACloseQueryFunc(BValues);
//          SetLength(CValues, Length(BValues));
//          for I := Low(BValues) to High(BValues) do
//          begin
//            J := Low(CValues) + I - Low(BValues);
//            if J <= High(CValues) then
//              CValues[J] := BValues[I];
//          end;
//        end;
//      end);
//  while ARetVal < 0 do
//  begin
//    Sleep(BlockingMessageWaitMilliSeconds);
//    Application.ProcessMessages;
//  end;
//  Result := ARetVal = mrOK;
//  if Result then
//  begin
//    for I := Low(CValues) to High(CValues) do
//    begin
//      J := Low(AValues) + I - Low(AValues);
//      if J <= High(AValues) then
//        AValues[J] := CValues[I];
//    end;
//  end;
end;

procedure TFMXDialogService.InputQueryAsync(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; const ACloseQueryEvent: TInputCloseQueryWithResultEvent;
  const AContext: TObject);
begin
  InputQueryAsync(ACaption, APrompts, ADefaultValues,
    procedure(const AResult: TModalResult; const AValues: array of string)
      begin
        if Assigned(ACloseQueryEvent) then
          ACloseQueryEvent(AContext, AResult, AValues);
      end
    );
end;

initialization
  TPlatformServices.Current.AddPlatformService(IFMXDialogServiceAsync, TFMXDialogService.Current);
  TPlatformServices.Current.AddPlatformService(IFMXDialogService, TFMXDialogService.Current);
end.
