//convert pas to utf8 by ¥

unit HintFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Widget,
  {$ENDIF}

  uSkinBufferBitmap,
  uLang,
  uComponentType,
//  uUIFunction,
  uFrameContext,
  uSkinCommonFrames,

  uSkinFireMonkeyControl, uSkinFireMonkeyImage, uSkinFireMonkeyLabel,
  uBaseSkinControl, uSkinLabelType;




type
  TFrameHint = class(TFrame)
    tmrChangeOpacity: TTimer;
    lblHint: TSkinFMXLabel;
    procedure tmrChangeOpacityTimer(Sender: TObject);
  private
    FChangeOpacityInterval:Integer;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
  public
    procedure ShowHint(AParent:TFmxObject;AHint:String;AChangeOpacityInterval:Integer=100;AMarginBottom:Integer=80);
    { Public declarations }
  end;



var
  GlobalFrameHint:TFrameHint;


procedure ShowHintFrame(AParent:TFmxObject;AHint:String;AChangeOpacityInterval:Integer=100;AMarginBottom:Integer=80);


implementation


{$R *.fmx}

procedure DoShowHintForCommonFrame(AParent:TFmxObject;AHint:String);
begin
  ShowHintFrame(AParent,AHint);
end;

procedure ShowHintFrame(AParent:TFmxObject;AHint:String;AChangeOpacityInterval:Integer;AMarginBottom:Integer);
{$IFDEF ANDROID}
var
  LStr: JString;
{$ENDIF}
begin
  {$IFDEF ANDROID}
      //Android平台直接使用Toast来实现
      CallInUIThread(
      procedure
      begin
        LStr := TAndroidHelper.StringToJString(AHint);
        TJToast.JavaClass.makeText(
              TAndroidHelper.Context,
              LStr.subSequence(0, LStr.length),
              TJToast.JavaClass.LENGTH_SHORT
              ).show;
      end);
  {$ELSE}
      //其他平台使用Frame来实现
      if GlobalFrameHint=nil then
      begin
        GlobalFrameHint:=TFrameHint.Create(Application);
      end;
      GlobalFrameHint.ShowHint(
                                AParent,//Application.MainForm,//
                                AHint,
                                AChangeOpacityInterval,
                                AMarginBottom);
  {$ENDIF}
end;


{ TFrameConnectHint }

constructor TFrameHint.Create(AOwner: TComponent);
begin
  inherited;

//  RecordSubControlsLang(Self);
//  TranslateSubControlsLang(Self);

end;

procedure TFrameHint.ShowHint(AParent:TFmxObject;AHint:String;AChangeOpacityInterval:Integer;AMarginBottom:Integer);
begin

  Self.Visible:=True;


  //在OrangeUI控件中调用的时候,传入nil,默认是主窗体
  if AParent=nil then
  begin
      //用主Form
      AParent:=Application.MainForm;
  end
  else
  begin
//      if GetReleatedForm(AParent)<>nil then
//      begin
//        //用AParent所在的Form
//        AParent:=GetReleatedForm(AParent);
//      end
//      else
//      begin
//        //还是用原来的AParent
//      end;

//      //有可能是Frame中的子Frame,
//      //显示MessageBoxFrame的时候,位置会不对,而且蒙板盖不全,很丑
//      if AParent is TFrame then
//      begin
//          //找到Frame的窗体,到时候如果找不到,就用Form
//          AParentForm:=GetReleatedForm(AParent);
//
//          if AParentForm<>nil then
//          begin
//              //找到Parent中最合适的Frame,
//              //有时候Frame是显示在Frame中的,
//              //或者PageControl中的
//              AIsFindSuitParent:=False;
//              ASuitParent:=AParent;
//              while (ASuitParent is TControl) and (ASuitParent<>nil) do
//              begin
//                //和窗体的高度
//                if (ASuitParent is TFrame) and (TControl(ASuitParent).Height=AParentForm.ClientHeight) then
//                begin
//                  AIsFindSuitParent:=True;
//                  Break;
//                end
//                else
//                begin
//                  ASuitParent:=TControl(ASuitParent).Parent;
//                end;
//              end;
//              if AIsFindSuitParent then
//              begin
//                AParent:=ASuitParent;
//              end;
//          end;
//      end
//      else if AParent is TForm then
//      begin
//
//      end;
  end;




  Self.Parent:=AParent;




  Width:=GetStringWidth(AHint,
                        RectF(0,0,GetControlParentWidth(AParent),Height),
                        Self.lblHint.SelfOwnMaterialToDefault.DrawCaptionParam
                        )
                        +20;//加上误差
  if Width>GetControlParentWidth(AParent)-20 then
  begin
    //宽度的最大值
    Width:=GetControlParentWidth(AParent);
  end;
  Height:=GetStringHeight(AHint,
                          RectF(0,0,Width,MaxInt),
                          Self.lblHint.SelfOwnMaterialToDefault.DrawCaptionParam
                          )
                          +20;//加上误差
  //居中
  Self.Position.X:=(GetControlParentWidth(AParent)-Self.Width)/2;
  Self.Position.Y:=GetControlParentHeight(AParent)-Height-AMarginBottom;



  FChangeOpacityInterval:=AChangeOpacityInterval;
  //先显示一秒,一秒之后再递减
  Self.tmrChangeOpacity.Interval:=1000;
  Self.tmrChangeOpacity.Enabled:=True;


  Self.Opacity:=1;
  Self.lblHint.Caption:=AHint;

  Self.BringToFront;

  if (GlobalTopMostFrameList<>nil) and (GlobalTopMostFrameList.IndexOf(Self)=-1) then
  begin
    GlobalTopMostFrameList.Add(Self);
  end;
end;

procedure TFrameHint.tmrChangeOpacityTimer(Sender: TObject);
begin
//  Self.BringToFront;

  //恢复时间间隔
  Self.tmrChangeOpacity.Interval:=FChangeOpacityInterval;
  if Opacity-0.1>0 then
  begin
    //透明度递减,最后隐藏
    Opacity:=Opacity-0.1;
  end
  else
  begin
    //隐藏
    Self.Visible:=False;

    //避免Parent被释放的时候,波及到它自己会被释放
    Parent:=nil;

    Self.tmrChangeOpacity.Enabled:=False;


    if GlobalTopMostFrameList<>nil then
    begin
      GlobalTopMostFrameList.Remove(Self,False);
    end;
  end;

end;


initialization
  GlobalDoShowHint:=DoShowHintForCommonFrame;


end.



