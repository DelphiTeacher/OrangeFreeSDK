unit FMX.WebBrowserEx;

interface

uses
  System.Classes,
  FMX.Types,
  uFuncCommon,
  FMX.WebBrowser;

type
  [
    ComponentPlatformsAttribute(
      pidWin32
      or pidWin64
      or pidOSX32
      or pidiOSSimulator
      or pidiOSDevice or pidiOSDevice32 or pidiOSDevice64
      or pidAndroid
    )
  ]
  TWebBrowserEx = class(TWebBrowser)
  {$IF DEFINED(VER270) OR DEFINED(VER280)}
  private
    procedure ParentResize(Sender: TObject);
  protected
    procedure SetParent(const Value: TFmxObject); override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure CheckBounds;
    [Weak] function GetWeb: ICustomBrowser;
    procedure CallJS(const iFunction: String; const iParams: array of String);
    function GetTagValue(const iTagName, iValueName: String): String;
  {$ENDIF}
  end;


implementation

  {$IF DEFINED(VER270) OR DEFINED(VER280)}

uses
  System.Rtti
  , FMX.Controls
  {$IFDEF MSWINDOWS}
    , FMX.WebBrowser.Win
  {$ENDIF}
//  {$IFDEF _MACOS}
//    , FMX.WebBrowser.Mac
//  {$ENDIF}
  ;


{ TWebBrowserEx }

procedure TWebBrowserEx.CallJS(
  const iFunction: String;
  const iParams: array of String);
begin
//  {$IFDEF MSWINDOWS}
//    FMX.WebBrowser.Win.CallJS(Self, iFunction, iParams);
//  {$ENDIF}
//  {$IFDEF _MACOS}
//    FMX.WebBrowser.Mac.CallJS(Self, iFunction, iParams);
//    CheckBounds;
//  {$ENDIF}
end;

function TWebBrowserEx.GetTagValue(const iTagName, iValueName: String): String;
begin
//  {$IFDEF MSWINDOWS}
//    Result := FMX.WebBrowser.Win.GetTagValue(Self, iTagName, iValueName);
//  {$ENDIF}
//  {$IFDEF _MACOS}
//    Result := FMX.WebBrowser.Mac.GetTagValue(Self, iTagName, iValueName);
//    CheckBounds;
//  {$ENDIF}
end;

procedure TWebBrowserEx.CheckBounds;
var
  [Weak] Web: ICustomBrowser;
begin
  Web := GetWeb;

  if (Web <> nil) then
    Web.UpdateContentFromControl;
end;

constructor TWebBrowserEx.Create(Owner: TComponent);
begin
  inherited;

  HitTest := False;
end;

destructor TWebBrowserEx.Destroy;
var
  [Weak] Web: ICustomBrowser;
begin
  Web := GetWeb;

  inherited;

  if (Web <> nil)  then
    Web.Hide;
end;

[Weak] function TWebBrowserEx.GetWeb: ICustomBrowser;
var
  Context: TRttiContext;
  RttiType: TRttiType;
  [Weak] Web: ICustomBrowser;
begin
  Context := TRttiContext.Create;
  try
    RttiType := Context.GetType(TWebBrowser);
    Web :=
      ICustomBrowser(RttiType.GetField('FWeb').GetValue(Self).AsInterface);
  finally
    Context.Free;
  end;

  Result := Web;
end;

procedure TWebBrowserEx.ParentResize(Sender: TObject);
begin
  CheckBounds;
end;

procedure TWebBrowserEx.SetParent(const Value: TFmxObject);
var
  [Weak] Web: ICustomBrowser;
begin
  if (Parent <> nil) and (Parent is TControl) then
    TControl(Parent).OnResize := nil;

  inherited;

  if (Parent <> nil) then begin
    if (Parent is TControl) then
      TControl(Parent).OnResize := ParentResize;

    Web := GetWeb;
    Web.SetWebBrowserControl(Self);

    Show;
  end;
end;

initialization
  RegisterFmxClasses([TWebBrowser]);
  {$ENDIF}

end.

