unit FormWaiting;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Types,
  GIFImg,
  Dialogs,
  StdCtrls,
  ExtCtrls,
//  pngimage,
  DateUtils,
  Math,
  uSkinBufferBitmap,
  uSkinWindowsControl, uSkinLabelType;

type
  TfrmWaiting = class(TForm)
    imgWaiting: TImage;
    tmrWaiting: TTimer;
    tmrTiming: TTimer;
    tmrCheckWindowValid: TTimer;
    lblWaiting: TSkinWinLabel;
    procedure tmrCheckWindowValidTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //提示内容
    FHintStr:String;
    //显示在这个窗体之上
    FWindowParent:THandle;
//    //检测的窗体句柄
//    FCheckWindowHandle:HWND;
    //跟随的窗体句柄
    FFollowWindowHandle:HWND;
    { Private declarations }
  protected
    procedure CreateParams(var AParams:TCreateParams);override;
  public
    constructor Create(AOwner:TComponent;AWindowParent:THandle);
    procedure SetHintStr(AHintStr: PWideChar);
//    procedure SetCheckWindow(ACheckWindowHandle:HWND);
    procedure SetFollowWindow(AFollowWindowHandle:HWND);
    procedure AdjustFormSize(out AWidth, AHeight: Integer);
    { Public declarations }
  end;

var
  frmWaiting:TfrmWaiting;

implementation

{$R *.dfm}

constructor TfrmWaiting.Create(AOwner: TComponent; AWindowParent: THandle);
begin
  //显示在父窗体之上
  FWindowParent:=AWindowParent;
  Inherited Create(AOwner);
end;

procedure TfrmWaiting.CreateParams(var AParams: TCreateParams);
begin
  inherited CreateParams(AParams);
  //指定显示在这个窗体之上
  //AParams.WndParent:=FWindowParent;
  //不在任务栏显示
  AParams.ExStyle:=AParams.ExStyle and Not WS_EX_APPWINDOW;
end;

procedure TfrmWaiting.FormPaint(Sender: TObject);
var
  AWindowRgn:HRGN;
begin
  AWindowRgn:=Windows.CreateRoundRectRgn(0,0,Width,Height,4,4);
  Try
    SetWindowRgn(Handle,AWindowRgn,False);
    Self.Canvas.Pen.Color:=$00E0E0E0;
    Self.Canvas.Pen.Width:=4;
    Self.Canvas.RoundRect(0,0,Width,Height,4,4);
  Finally
    DeleteObject(AWindowRgn);
  End;
end;

procedure TfrmWaiting.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
end;

//procedure TfrmWaiting.SetCheckWindow(ACheckWindowHandle: HWND);
//begin
//  //设置检查窗体，显示检测计时器
//  FCheckWindowHandle:=ACheckWindowHandle;
////  Self.tmrCheckWindowValid.Enabled:=ACheckWindowHandle<>0;
//end;

procedure TfrmWaiting.SetFollowWindow(AFollowWindowHandle: HWND);
begin
  //设置跟随窗体
  FFollowWindowHandle:=AFollowWindowHandle;
end;

procedure TfrmWaiting.SetHintStr(AHintStr: PWideChar);
begin
  //设置提示文本
  FHintStr:=AHintStr;
  lblWaiting.Caption:=AHintStr;
  lblWaiting.Invalidate;
end;

procedure TfrmWaiting.AdjustFormSize(out AWidth, AHeight: Integer);
//var
//  DC:HDC;
//  Graphics:IGPGraphics;
//  Gap:Integer;
//  DigitWidth,DigitHeight:Integer;
//  ColonWidth,ColonHeight:Integer;
begin
//  DC:=GetDC(0);
//  Try
//    Graphics:=TSkinHelper.CreateGraphicsByDC(DC);

    //根据字符串计算需要显示的窗体大小
    AHeight:=70;
    AWidth:=190;

    //设置Label的宽茺
//    lblWaiting.Width:=uBufferBitmap.CalcFontWidth(Graphics,FHintStr+'......',lblWaiting.Font)+10;
    lblWaiting.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(FHintStr+'......',
                        lblWaiting.SelfOwnMaterialToDefault.DrawCaptionParam.FontSize))+10;

    //居中显示进度条和Label
    AWidth:=10
            +imgWaiting.Width
            +10
            +lblWaiting.Width
            +10;
    SetBounds(0,0,AWidth,AHeight);

    imgWaiting.Top:=(AHeight-imgWaiting.Height) div 2 -2;
    imgWaiting.Left:=10;
    //滚动进度条
    TGIFImage(imgWaiting.Picture.Graphic).Animate:=True;

    lblWaiting.Top:=(AHeight-lblWaiting.Height) div 2;// -2;
    lblWaiting.Left:=imgWaiting.Left+imgWaiting.Width+6;


//  Finally
//    ReleaseDC(0,DC);
//  End;
end;

procedure TfrmWaiting.tmrCheckWindowValidTimer(Sender: TObject);
begin
//  if Not Windows.IsWindow(FCheckWindowHandle) then
//  begin
//    Self.tmrCheckWindowValid.Enabled:=False;
//    SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
//              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
////    Hide;
////    WaitingForm.Free;
//  end;
end;


end.
