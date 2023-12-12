unit HintFrame_VCL;

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
  uGraphicCommon,
  uComponentType,
  Math,
  uSkinBufferBitmap,
  uSkinWindowsControl, uSkinLabelType;

type
  TfrmHint = class(TForm)
    tmrWaiting: TTimer;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrWaitingTimer(Sender: TObject);
  private
    //提示内容
    FHintStr:String;
    //显示在这个窗体之上
    FWindowParent:THandle;
//    //检测的窗体句柄
//    FCheckWindowHandle:HWND;
//    //跟随的窗体句柄
//    FFollowWindowHandle:HWND;
    { Private declarations }
  protected
    procedure CreateParams(var AParams:TCreateParams);override;
  public
    constructor Create(AOwner:TComponent;AWindowParent:THandle);
    procedure SetHintStr(AHintStr: String);
//    procedure SetCheckWindow(ACheckWindowHandle:HWND);
//    procedure SetFollowWindow(AFollowWindowHandle:HWND);
//    procedure AdjustFormSize(out AWidth, AHeight: Integer);
    { Public declarations }
  end;

//var
//  frmHint:TfrmHint;

procedure ShowHintFrame(AParent:TForm;AHint:String;AChangeOpacityInterval:Integer=100);

implementation

{$R *.dfm}

procedure ShowHintFrame(AParent:TForm;AHint:String;AChangeOpacityInterval:Integer);
var
  AfrmHint:TfrmHint;
  AParentTop:Integer;
  AParentLeft:Integer;
  AParentWidth:Integer;
  AParentHeight:Integer;
//  AParentForm:TForm;
begin
//  ShowMessage(AHint);
  AParentTop:=0;
  AParentLeft:=0;
  AParentWidth:=Screen.Width;
  AParentHeight:=Screen.Height;

  if AParent=nil then
  begin
    AParent:=Application.MainForm;
  end;

  if AParent<>nil then
  begin
    AParentTop:=AParent.Top;
    AParentLeft:=AParent.Left;
    AParentWidth:=AParent.Width;
    AParentHeight:=AParent.Height;
  end;


  AfrmHint:=TfrmHint.Create(Application,AParent.Handle);
  AfrmHint.SetHintStr(AHint);

//  AfrmHint.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(AHint,14))+20;
//  AfrmHint.Height:=Ceil(uSkinBufferBitmap.GetStringHeight(AHint,14))+20;
  AfrmHint.Canvas.Font.Size:=14;
  AfrmHint.Width:=AfrmHint.Canvas.TextWidth(AHint)+ScreenScaleSizeInt(20);
  AfrmHint.Height:=AfrmHint.Canvas.TextHeight(AHint)+ScreenScaleSizeInt(20);


  AfrmHint.Top:=AParentTop+AParentHeight-AfrmHint.Height-ScreenScaleSizeInt(100);
  AfrmHint.Left:=AParentLeft+(AParentWidth-AfrmHint.Width) div 2;


  AfrmHint.Show;
end;

constructor TfrmHint.Create(AOwner: TComponent; AWindowParent: THandle);
begin
  //显示在父窗体之上
  FWindowParent:=AWindowParent;
  Inherited Create(AOwner);
end;

procedure TfrmHint.CreateParams(var AParams: TCreateParams);
begin
  inherited CreateParams(AParams);
  //指定显示在这个窗体之上
  //AParams.WndParent:=FWindowParent;
  //不在任务栏显示
  AParams.ExStyle:=AParams.ExStyle and Not WS_EX_APPWINDOW;
end;

procedure TfrmHint.FormPaint(Sender: TObject);
var
  AWindowRgn:HRGN;
  ATextSize:TSize;
begin
  AWindowRgn:=Windows.CreateRoundRectRgn(0,0,Width,Height,4,4);
  Try
    SetWindowRgn(Handle,AWindowRgn,False);

//    Self.Canvas.Pen.Color:=clGray;
//    Self.Canvas.Pen.Width:=4;

//    lblWaiting.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(FHintStr,
//                        lblWaiting.SelfOwnMaterialToDefault.DrawCaptionParam.FontSize))+10;

    Self.Canvas.Font.Color:=clWhite;
    Self.Canvas.Font.Size:=14;

    ATextSize:=Self.Canvas.TextExtent(FHintStr);

    Self.Canvas.TextOut((Width-ATextSize.cx) div 2,
                        (Height-ATextSize.cy) div 2,
                        FHintStr);

//    Self.Canvas.RoundRect(0,0,Width,Height,4,4);
  Finally
    DeleteObject(AWindowRgn);
  End;
end;

procedure TfrmHint.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
  Self.tmrWaiting.Enabled:=True;
end;

//procedure TfrmHint.SetCheckWindow(ACheckWindowHandle: HWND);
//begin
//  //设置检查窗体，显示检测计时器
//  FCheckWindowHandle:=ACheckWindowHandle;
////  Self.tmrCheckWindowValid.Enabled:=ACheckWindowHandle<>0;
//end;

//procedure TfrmHint.SetFollowWindow(AFollowWindowHandle: HWND);
//begin
//  //设置跟随窗体
//  FFollowWindowHandle:=AFollowWindowHandle;
//end;

procedure TfrmHint.SetHintStr(AHintStr: String);
begin
  //设置提示文本
  FHintStr:=AHintStr;
//  lblWaiting.Caption:=AHintStr;
//  lblWaiting.Invalidate;
end;

//procedure TfrmHint.AdjustFormSize(out AWidth, AHeight: Integer);
////var
////  DC:HDC;
////  Graphics:IGPGraphics;
////  Gap:Integer;
////  DigitWidth,DigitHeight:Integer;
////  ColonWidth,ColonHeight:Integer;
//begin
////  DC:=GetDC(0);
////  Try
////    Graphics:=TSkinHelper.CreateGraphicsByDC(DC);
//
////    //根据字符串计算需要显示的窗体大小
////    AHeight:=70;
////    AWidth:=190;
////
////    //设置Label的宽茺
//////    lblWaiting.Width:=uBufferBitmap.CalcFontWidth(Graphics,FHintStr+'......',lblWaiting.Font)+10;
////    lblWaiting.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(FHintStr,
////                        lblWaiting.SelfOwnMaterialToDefault.DrawCaptionParam.FontSize))+10;
////
////    //居中显示进度条和Label
////    AWidth:=10
////            +lblWaiting.Width
////            +10;
////    SetBounds(0,0,AWidth,AHeight);
//
//
////    lblWaiting.Top:=(AHeight-lblWaiting.Height) div 2;// -2;
////    lblWaiting.Left:=imgWaiting.Left+imgWaiting.Width+6;
//
//
////  Finally
////    ReleaseDC(0,DC);
////  End;
//end;

procedure TfrmHint.tmrWaitingTimer(Sender: TObject);
begin
  Self.tmrWaiting.Tag:=Self.tmrWaiting.Tag+1;
  if Self.tmrWaiting.Interval*Self.tmrWaiting.Tag<3000 then
  begin
    //正常显示三秒
  end
  else if Self.tmrWaiting.Interval*Self.tmrWaiting.Tag<5000 then
  begin
    if Self.AlphaBlendValue-20>0 then
    begin
      Self.AlphaBlendValue:=Self.AlphaBlendValue-20;
    end;
  end
  else
  begin
    Self.Free;
  end;
end;

end.
