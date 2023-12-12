//convert pas to utf8 by ¥

//convert pas to utf8 by ¥
unit WaitingFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  Math,

  uFrameContext,
  uComponentType,
  uSkinCommonFrames,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyMemo,
  uProcessNativeControlModalShowPanel,

  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uSkinFireMonkeyImageListPlayer, uSkinFireMonkeyControl,
  uSkinFireMonkeyImage, uSkinImageList, FMX.Objects, uSkinFireMonkeyLabel,
  uDrawPicture, uSkinLabelType, uBaseSkinControl, uSkinImageListPlayerType,
  uSkinPanelType, uSkinFireMonkeyPanel;

type
  TFrameWaiting = class(TFrame)
    imglistWaiting: TSkinImageList;
    tmrTimeOut: TTimer;
    BackRectangle: TSkinFMXPanel;
    BackGround: TRectangle;
    imgWaiting: TSkinFMXImageListPlayer;
    lblWaiting: TSkinFMXLabel;
    SkinImageList2: TSkinImageList;
    procedure FrameResize(Sender: TObject);
    procedure tmrTimeOutTimer(Sender: TObject);
//    procedure tmrBringToFrontTimer(Sender: TObject);
  private
    procedure DoParentResize(Sender: TObject);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure ShowWaiting(AParent:TFmxObject;Hint:String;TimeOut:Integer=0);
    procedure HideWaiting;
    { Public declarations }
  end;


var
  GlobalWaitingFrame:TFrameWaiting;
  //等待页面的显示计数
  GlobalShowWaitingFrameCount:Integer;


//最多只能超时20秒,避免死掉
procedure ShowWaitingFrame(AParent:TFmxObject;AHint:String;ATimeOut:Integer=0);overload;
procedure ShowWaitingFrame(AHint:String;ATimeOut:Integer=0);overload;
procedure HideWaitingFrame;

implementation

{$R *.fmx}

procedure DoShowWaitingForCommonFrame(AParent:TFmxObject;AHint:String);
begin
  ShowWaitingFrame(AParent,AHint);
end;

procedure DoHideWaitingForCommonFrame;
begin
  HideWaitingFrame;
end;

procedure ShowWaitingFrame(AHint:String;ATimeOut:Integer=0);
begin
  ShowWaitingFrame(nil,AHint,ATimeOut);
end;

procedure ShowWaitingFrame(AParent:TFmxObject;AHint:String;ATimeOut:Integer);
begin
  Inc(GlobalShowWaitingFrameCount);



  if GlobalWaitingFrame=nil then
  begin
    GlobalWaitingFrame:=TFrameWaiting.Create(Application);
  end;


  //先隐藏原生控件,再显示WaitingFrame,避免WaitingFrame被盖住
  SetGlobalEditListAsStyleType;
  SetGlobalMemoListAsStyleType;
  ProcessNativeControlBeginModalShow;


  GlobalWaitingFrame.ShowWaiting(
                                  AParent,
                                  AHint,
                                  ATimeOut);
end;

procedure HideWaitingFrame;
begin

  Dec(GlobalShowWaitingFrameCount);

  if GlobalShowWaitingFrameCount<=0 then
  begin
    GlobalShowWaitingFrameCount:=0;

    if GlobalWaitingFrame<>nil then
    begin
      GlobalWaitingFrame.HideWaiting;
    end;
  end;




  //一定要放在隐藏WaitingFrame的后面
  //先隐藏WaitingFrame,再还原显示原生控件,免得WaitingFrame被盖住
  RestoreGlobalEditListAsPlatformType;
  RestoreGlobalMemoListAsPlatformType;
  ProcessNativeControlEndModalShow;

end;



{ TFrameWaiting }

constructor TFrameWaiting.Create(AOwner: TComponent);
begin
  inherited;

  Self.Visible:=False;

  Self.OnResize:=Self.FrameResize;
end;

destructor TFrameWaiting.Destroy;
begin
  GlobalWaitingFrame:=nil;
  inherited;
end;

procedure TFrameWaiting.DoParentResize(Sender: TObject);
begin

  Self.Left:=0;
  Self.Top:=0;

  if (Parent<>nil) and (Parent is TControl) then
  begin
    Width:=TControl(Parent).Width;
    Height:=TControl(Parent).Height;
  end;
  if (Parent<>nil) and (Parent is TForm) then
  begin
    Width:=TForm(Parent).ClientWidth;
    Height:=TForm(Parent).ClientHeight;
  end;

  Self.BackRectangle.Left:=(Width-BackRectangle.Width)/2;
  Self.BackRectangle.Top:=(Height-BackRectangle.Height)/2;


end;

procedure TFrameWaiting.FrameResize(Sender: TObject);
begin
  Self.imgWaiting.Left:=Ceil(Self.Width-Self.imgWaiting.Width) div 2;
  Self.imgWaiting.Top:=Ceil(Self.Height-Self.imgWaiting.Height) div 2-10;

  Self.lblWaiting.Position.X:=Ceil(Self.Width-Self.lblWaiting.Width) div 2;
  Self.lblWaiting.Position.Y:=Self.imgWaiting.Top+Self.imgWaiting.Height+10;

  Self.BackRectangle.Position.X:=Ceil(Self.Width-Self.BackRectangle.Width) div 2;
  Self.BackRectangle.Position.Y:=Ceil(Self.Height-Self.BackRectangle.Height) div 2;
end;

procedure TFrameWaiting.HideWaiting;
begin
  if GlobalTopMostFrameList<>nil then
  begin
    GlobalTopMostFrameList.Remove(Self,False);
  end;

//  tmrBringToFront.Enabled:=False;

  Self.tmrTimeOut.Enabled:=False;
  Self.imgWaiting.Properties.ImageListAnimated:=False;

  //隐藏
  Self.Parent:=nil;
  Self.Visible:=False;



end;

procedure TFrameWaiting.ShowWaiting(AParent: TFmxObject;Hint:String; TimeOut: Integer);
begin


  if (GlobalTopMostFrameList<>nil) and (GlobalTopMostFrameList.IndexOf(Self)=-1) then
  begin
    GlobalTopMostFrameList.Add(Self);
  end;


  //在OrangeUI控件中调用的时候,传入nil
  if AParent=nil then
  begin
    AParent:=Application.MainForm;
  end
  else
  begin
      if GetReleatedForm(AParent)<>nil then
      begin
        //用AParent所在的Form
        AParent:=GetReleatedForm(AParent);
      end
      else
      begin
        //还是用原来的AParent
      end;
  end;




  Self.Parent:=AParent;


  Self.lblWaiting.Caption:=Hint;

  Self.DoParentResize(Parent);

  Self.BringToFront;

  Self.imgWaiting.Properties.ImageListAnimated:=True;



  Self.Visible:=True;




  //是否设置了超时
  if TimeOut>0 then
  begin
    Self.tmrTimeOut.Interval:=TimeOut;
  end
  else
  begin
    //最多只能超时20秒,避免死掉
    Self.tmrTimeOut.Interval:=40*1000;
  end;
  Self.tmrTimeOut.Enabled:=True;



//  tmrBringToFront.Enabled:=True;
end;

//procedure TFrameWaiting.tmrBringToFrontTimer(Sender: TObject);
//begin
////  Self.SetBounds(0,0,GetControlParentWidth(Parent),GetControlParentHeight(Parent));
//  Self.BringToFront;
//
//end;

procedure TFrameWaiting.tmrTimeOutTimer(Sender: TObject);
begin
  //超时
  Self.tmrTimeOut.Enabled:=False;
  HideWaitingFrame;
end;


initialization
  GlobalShowWaitingFrameCount:=0;

  GlobalDoShowWaiting:=DoShowWaitingForCommonFrame;
  GlobalDoHideWaiting:=DoHideWaitingForCommonFrame;



end.
