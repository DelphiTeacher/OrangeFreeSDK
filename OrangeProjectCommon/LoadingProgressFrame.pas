unit LoadingProgressFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,


  uFileCommon,

  uComponentType,
  uSkinMaterial,
//  HintFrame,
  WaitingFrame,
  MessageBoxFrame,

  uTimerTask,
  uUIFunction,




  uBaseHttpControl,


  IdURI,
  StrUtils,
//  uIdHttpControl,

  Math,
  System.IOUtils,
//  uMobileUtils,


  FMX.Dialogs, FMX.StdCtrls, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  FMX.Edit, uSkinFireMonkeyEdit, uSkinFireMonkeyImage, uSkinFireMonkeyLabel,
  uSkinFireMonkeyButton, uSkinFireMonkeyCheckBox, uSkinFireMonkeyProgressBar,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.Objects, uSkinProgressBarType, uSkinLabelType, uSkinPanelType,
  uBaseSkinControl;



type
  TFrameLoadingProgress = class(TFrame)
    tmrSyncLoadProgress: TTimer;
    BackRectangle: TRectangle;
    pnlMessageBox: TSkinFMXPanel;
    pnlTop: TSkinFMXPanel;
    lblType: TSkinFMXLabel;
    pnlContent: TSkinFMXPanel;
    lblCaption: TSkinFMXLabel;
    pnlTopDevide: TSkinFMXPanel;
    pnlBottomDevide: TSkinFMXPanel;
    pbLoading: TSkinFMXProgressBar;
    procedure tmrSyncLoadProgressTimer(Sender: TObject);
  private
    procedure DoParentResize(Sender: TObject);
    { Private declarations }
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //�Ա����߳���ֱ���޸�
    FLoadedPosition:Int64;
    FLoadMax:Int64;
    procedure ShowLoading(AParent: TFmxObject;ACaption:String;AMessage:String;ALoadMax:Int64);
    procedure HideLoading;

    //����
    procedure SyncLoading(AMessage:String;ALoadedPosition:Int64;ALoadMax:Int64);
//    procedure DoLoadApp(ATimerTask:TObject);
//    procedure DoLoadAppExecuteEnd(ATimerTask:TObject);
    { Public declarations }
  end;






var
  GlobalLoadingProgressFrame:TFrameLoadingProgress;


procedure ShowLoadingProgressFrame(AParent: TFmxObject;ACaption:String;AMessage:String;ALoadMax:Int64);
procedure HideLoadingProgressFrame;


implementation

//uses
//  MainForm;

{$R *.fmx}


procedure ShowLoadingProgressFrame(AParent: TFmxObject;ACaption:String;AMessage:String;ALoadMax:Int64);
begin

  if GlobalLoadingProgressFrame=nil then
  begin
    GlobalLoadingProgressFrame:=TFrameLoadingProgress.Create(Application);
  end;

  GlobalLoadingProgressFrame.ShowLoading(AParent,ACaption,AMessage,ALoadMax);
end;

procedure HideLoadingProgressFrame;
begin
  if GlobalLoadingProgressFrame<>nil then
  begin
    GlobalLoadingProgressFrame.HideLoading;
  end;

end;




{ TFrameLoadingProgress }

constructor TFrameLoadingProgress.Create(AOwner: TComponent);
begin
  inherited;

  //����������ɫ
  lblType.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=SkinThemeColor;
  pnlTopDevide.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameLoadingProgress.Destroy;
begin
//  FreeAndNil(FLoadAppThread);
  inherited;
end;

procedure TFrameLoadingProgress.DoParentResize(Sender: TObject);
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


end;

procedure TFrameLoadingProgress.HideLoading;
begin

  Self.tmrSyncLoadProgress.Enabled:=False;

  //����
  Self.Parent:=nil;
  Self.Visible:=False;


end;

//procedure TFrameLoadingProgress.DoLoadApp(ATimerTask: TObject);
//var
//  AppLocalFileStream:TFileStream;
//begin
//  AppLocalFileStream:=TFileStream.Create(TTimerTask(ATimerTask).TaskOtherInfo[1],fmCreate or fmOpenWrite);
//  try
//    try
//      Self.idhttpLoad.Get(TTimerTask(ATimerTask).TaskOtherInfo[0],AppLocalFileStream);
//      FIsLoadSucc:=True;
//    except
//      on E:Exception do
//      begin
//        //���س���
//        FLoadErrorMsg:=E.Message;
//      end;
//    end;
//  finally
//    FIsLoadCompleted:=True;
//    AppLocalFileStream.Free;
//    Self.tmrSyncLoadProgress.Enabled:=False;
//  end;
//end;
//
//procedure TFrameLoadingProgress.DoLoadAppExecuteEnd(ATimerTask: TObject);
//begin
//  if not FIsLoadSucc then
//  begin
//      //����ʧ��
//      lblCaption.Caption:='����ʧ��('+Self.FLoadErrorMsg+')';
//      ShowHintFrame(nil,'����ʧ��('+Self.FLoadErrorMsg+')');
//
//
//  //    Sleep(1000);
//      HideFrame;//(Self,hfcttBeforeReturnFrame);
//      ReturnFrame(FrameHistroy);
//
//  end
//  else
//  begin
//      //���سɹ�,��װ
//      pbLoading.Properties.Position:=100;
//      lblCaption.Caption:='���سɹ�,��ʼ��װ...';
//      ShowHintFrame(nil,'���سɹ�,��ʼ��װ...');
//
//
//  //    Sleep(1000);
//      HideFrame;//(Self,hfcttBeforeReturnFrame);
//      ReturnFrame(FrameHistroy);
//
//
//      Self.DoInstallApp;
//  end;
//
//end;
//
//procedure TFrameLoadingProgress.DoInstallApp;
//begin
//  InstallAppPackage(Self.FAppLocalFilePath);
//end;
//
//procedure TFrameLoadingProgress.DoUpdateApp;
//var
//  ATimerTask:TTimerTask;
//begin
////  if FLoadAppThread=nil then
////  begin
////    //��������
////    FLoadAppThread:=TTimerThread.Create(False);
////  end;
//
//
//  FIsLoadSucc:=False;
//  FIsLoadCompleted:=False;
//  FLoadErrorMsg:='';
//
//  FLoadedPosition:=0;
//  FLoadMax:=0;
//
//  pbLoading.Properties.Position:=0;
//  lblCaption.Caption:='�������أ����Ժ�...';
//  tmrSyncLoadProgress.Enabled:=True;
//
//
//  ATimerTask:=TTimerTask.Create(0);
//  ATimerTask.OnExecute:=DoLoadApp;
//  ATimerTask.OnExecuteEnd:=DoLoadAppExecuteEnd;
//  ATimerTask.TaskOtherInfo.Add(FAppLoadUrl);
//  ATimerTask.TaskOtherInfo.Add(FAppLocalFilePath);
//
//  GetGlobalTimerThread2.RunTask(ATimerTask);
//
//end;

procedure TFrameLoadingProgress.tmrSyncLoadProgressTimer(Sender: TObject);
begin
  if FLoadMax>0 then
  begin
    pbLoading.Properties.Position:=Ceil(FLoadedPosition/FLoadMax*100);
  end
  else
  begin
    pbLoading.Properties.Position:=0;
  end;
end;

procedure TFrameLoadingProgress.ShowLoading(AParent: TFmxObject;ACaption:String;AMessage:String;ALoadMax:Int64);
begin

//  DoUpdateApp;

  FLoadedPosition:=0;
  FLoadMax:=ALoadMax;

  pbLoading.Properties.Position:=0;
  Self.lblType.Caption:=ACaption;//'���ڼ��أ����Ժ�...';
  lblCaption.Caption:=AMessage;//'���ڼ��أ����Ժ�...';
  //����ˢ�½���Ķ�ʱ��
  tmrSyncLoadProgress.Enabled:=True;


  //��OrangeUI�ؼ��е��õ�ʱ��,����nil
  //��OrangeUI�ؼ��е��õ�ʱ��,����nil
  if AParent=nil then
  begin
    AParent:=Application.MainForm;
  end
  else
  begin
      if GetReleatedForm(AParent)<>nil then
      begin
        //��AParent���ڵ�Form
        AParent:=GetReleatedForm(AParent);
      end
      else
      begin
        //������ԭ����AParent
      end;
  end;




  Self.Parent:=AParent;
  Self.DoParentResize(Parent);



  Self.BringToFront;


  Self.Visible:=True;

end;


procedure TFrameLoadingProgress.SyncLoading(AMessage: String; ALoadedPosition,
  ALoadMax: Int64);
begin
  lblCaption.Caption:=AMessage;//'���ڼ��أ����Ժ�...';
  FLoadedPosition:=ALoadedPosition;
  FLoadMax:=ALoadMax;

  Self.tmrSyncLoadProgressTimer(Self.tmrSyncLoadProgress);

end;

end.
