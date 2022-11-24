unit uVersionChecker;



interface
//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
//  {$DEFINE FMX}
//{$IFEND}



////���ڹ����·���FrameWork.inc
////�����ڹ�������������FMX����ָ��
//{$IFNDEF FMX}
//  {$IFNDEF VCL}
//    {$I FrameWork.inc}
//  {$ENDIF}
//{$ENDIF}


uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,


//  uManager,
  uFileCommon,
  uBaseLog,
  uOpenCommon,
//  uOpenClientCommon,
//  uOpenClientCommon,

//  uConst,

  WaitingFrame,
  HintFrame,
  MessageBoxFrame,

  uTimerTask,
  uUIFunction,
  FMX.Dialogs,

  XSuperObject,
  XSuperJson,


  uBaseHttpControl,

  {$IFDEF MSWINDOWS}
//  Winapi.ShellAPI,
//  Winapi.Windows,

    {$IFDEF USE_AUTO_UPGRADER_PRO}
    auHTTP,
    auAutoUpgrader,
    {$ENDIF}
  {$ENDIF}

  {$IFDEF ANDROID}
  Androidapi.JNI.JavaTypes,Androidapi.JNI.Telephony,
  Androidapi.JNI.Net,Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,FMX.Helpers.Android,
  Androidapi.JNI.Embarcadero,
  FMX.VirtualKeyboard,
  Androidapi.JNI.App, Androidapi.JNIBridge,
  System.SyncObjs,
  FMX.Platform.Android,
  Androidapi.JNI.Provider,
  {$ENDIF}

  IniFiles,

  IdURI,
  StrUtils,

  Math,
  System.IOUtils,
  uMobileUtils;



type
  //�汾���
  TVersionChecker=class
  private
    {$IFDEF MSWINDOWS}
      {$IFDEF USE_AUTO_UPGRADER_PRO}
        auAutoUpgrader1: TauAutoUpgrader;
      {$ENDIF}
    {$ENDIF}
    procedure DoAUEndUpgradeEvent(Sender: TObject;var RestartImediately: Boolean);
  private
    FUpdateConfigIniUrl:String;
    FUpdatePackageBaseUrl:String;

    //��APK���ص�·��
    FDownloadPackageURL:String;


    //Version.ini�У�Windows��IOS��Android�İ汾���½ڵ�Ҫ�ֿ�
    function ReadSection:String;

    //ȷ������
    procedure DoSureUpdate;


    //����°汾
    procedure DoCheckNewVersionExecute(ATimerTask:TObject);
    procedure DoCheckNewVersionExecuteEnd(ATimerTask:TObject);

    //ѡ���Ƿ����
    procedure DoSelectAppUpdateMethodUseSelectMessageBoxModalResult(Sender:TObject);
  public
    //�Ƿ��ֶ�������,������ֶ����,��ô����Ҫ��ʾ�ˣ��ض�����Ҫ������
    FIsManualCheckUpdate:Boolean;
    FIsNeedHint:Boolean;
    //�Ƿ����ڼ���°汾
    FIsCheckingNewVersion:Boolean;

    //��ǰӦ���Ƿ��ǹȸ�ר��(��ô�����ٴӷ����������ذ�������)
    //Ĭ�ϲ���
    IsGooglePlayVersion:Boolean;
//    //����°汾
//    procedure CheckNewVersion(
//                              //��һ����ַ
//                              //ƴ�������ַ���FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+AppUserTypeName+'/Version.ini'
//                              AAppUpdateServerUrl:String;
//                              //�ڶ�����ַ
//                              AImageHttpServerUrl:String='');
    //����°汾
    procedure CheckNewVersionByIni(AUpdateConfigIniUrl:String;
                                  AUpdatePackageBaseUrl:String;
                                  AIsNeedHint:Boolean=False);

  public
    constructor Create;
    destructor Destroy;override;
  end;





var
  GlobalVersionChecker:TVersionChecker;



implementation

uses
//  MainForm,
  UpdateFrame;



{ TVersionChecker }

//procedure TVersionChecker.CheckNewVersion(AAppUpdateServerUrl:String;AImageHttpServerUrl:String);
//var
//  //APP���µķ�����
//  FAppUpdateServerUrl:String;
//begin
//
//  FAppUpdateServerUrl:=AAppUpdateServerUrl;
//
//  //Ϊ��,ȡ����ƽ̨��APP����Ŀ¼
//  if FAppUpdateServerUrl='' then
//  begin
//    FAppUpdateServerUrl:=AAppUpdateServerUrl;
//  end;
//
//
//  //Ϊ��,ȡ����ƽ̨��ͼƬ�ϴ�����Ŀ¼
//  if FAppUpdateServerUrl='' then
//  begin
//    FAppUpdateServerUrl:=AImageHttpServerUrl;
//  end;
//
//
//
//  //���������ļ������ص�ַ
//  FUpdateConfigIniUrl:=FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+AppUserTypeName+'/'+'Version.ini';
//  //�°�װ�������ػ�ַ
//  FUpdatePackageBaseUrl:=FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+APPUserTypeName;
//  //Windows��������ؿؼ���
////  FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+GetUserTypeStr(AppUserType)+'/'+'Version.inf';
//
//
//
//  CheckNewVersionByIni(FUpdateConfigIniUrl,FUpdatePackageBaseUrl);
//
//end;


procedure TVersionChecker.CheckNewVersionByIni(AUpdateConfigIniUrl: String;
                                              AUpdatePackageBaseUrl:String;
                                              AIsNeedHint:Boolean);
begin
  FUpdateConfigIniUrl:=AUpdateConfigIniUrl;
  FUpdatePackageBaseUrl:=AUpdatePackageBaseUrl;
  FIsNeedHint:=AIsNeedHint;

  if Not FIsCheckingNewVersion then
  begin
      FIsCheckingNewVersion:=True;
      //��������
      GetGlobalTimerThread.RunTempTask(
                                      DoCheckNewVersionExecute,
                                      DoCheckNewVersionExecuteEnd,
                                      'CheckNewVersion',
                                      True
                                      );
  end;

end;

constructor TVersionChecker.Create;
begin

end;

destructor TVersionChecker.Destroy;
begin
  inherited;
end;

procedure TVersionChecker.DoAUEndUpgradeEvent(Sender: TObject;
  var RestartImediately: Boolean);
begin
  FIsCheckingNewVersion:=False;


  ShowHintFrame(Application.MainForm,'���½���!');
end;

procedure TVersionChecker.DoCheckNewVersionExecute(ATimerTask: TObject);
var
  AMustUpdate:Integer;
  AHttpControl:THttpControl;
  AResponseStream:TMemoryStream;
begin
  //���ذ汾�ļ�Version.ini

  //����
  TTimerTask(ATimerTask).TaskTag:=1;

  AHttpControl:=TSystemHttpControl.Create;
  AResponseStream:=TMemoryStream.Create;
  try


        try
            if AHttpControl.Get(
                              TIdURI.URLEncode(FUpdateConfigIniUrl),
                              AResponseStream
                              ) then
            begin
                AResponseStream.Position:=0;
                AResponseStream.SaveToFile(uFileCommon.GetApplicationPath+'Version.ini');

                TTimerTask(ATimerTask).TaskTag:=0;
            end;

        except
          on E:Exception do
          begin
            //�쳣
            HandleException(E,'TVersionChecker.DoCheckNewVersionExecute');
            TTimerTask(ATimerTask).TaskDesc:=E.Message;
          end;
        end;


  finally
    System.SysUtils.FreeAndNil(AHttpControl);
    System.SysUtils.FreeAndNil(AResponseStream);
  end;
end;

procedure TVersionChecker.DoCheckNewVersionExecuteEnd(ATimerTask: TObject);
var
  AMustUpdate:Integer;
  AIniFile:TIniFile;
  AStringList:TStringList;
begin
  try
      if TTimerTask(ATimerTask).TaskTag=0 then
      begin

          if FileExists(uFileCommon.GetApplicationPath+'Version.ini') then
          begin


              {$IFDEF MSWINDOWS}
              //Windows����Ҫת����Ĭ�ϵĸ�ʽ,��ȻUTF-8��ʽ��ini�ļ�����������
              AStringList:=TStringList.Create;
              try
                AStringList.LoadFromFile(uFileCommon.GetApplicationPath+'Version.ini',TEncoding.UTF8);
                AStringList.SaveToFile(uFileCommon.GetApplicationPath+'Version.ini',TEncoding.ANSI);
              finally
                FreeAndNil(AStringList);
              end;
              {$ENDIF}


              AIniFile:=TIniFile.Create(uFileCommon.GetApplicationPath+'Version.ini'{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});

              try
                  //����°汾�ɹ�

                  //���汾
                  if AIniFile.ReadString(ReadSection,'Version','')>CurrentVersion then
                  begin

                      FDownloadPackageURL:=AIniFile.ReadString(ReadSection,'Url','');


                      //����Ƿ��������
                      AMustUpdate:=AIniFile.ReadInteger(ReadSection,'MustUpdate',0);
                      if AMustUpdate=1 then
                      begin
                          //��ʾ���°汾,��������
                          ShowMessageBoxFrame(Application.MainForm,
                                              AIniFile.ReadString(ReadSection,'UpdateLog',''),
                                              '',
                                              TMsgDlgType.mtCustom,
                                              ['��������'],
                                              Self.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult,
                                              nil,
                                              '�������(���°汾:'+AIniFile.ReadString(ReadSection,'Version','')+')'
                                              );
                      end
                      else if AMustUpdate=2 then
                      begin
                          //���ϸ���
                          ShowHintFrame(Application.MainForm,
                                        '�������(���°汾:'+AIniFile.ReadString(ReadSection,'Version','')+')'+#13#10
                                        +AIniFile.ReadString(ReadSection,'UpdateLog','')
                                         );
                          DoSureUpdate;
                      end
                      else if (AMustUpdate=3) and not FIsManualCheckUpdate then
                      begin
                          //������,����ʾ
                          ShowHintFrame(Application.MainForm,
                                        '���°汾:'+AIniFile.ReadString(ReadSection,'Version','')+')'//+#13#10
                                        //+AIniFile.ReadString(ReadSection,'UpdateLog','')
                                         );
                      end
                      else
                      begin
                          //Ĭ��
                          //���°汾,��ǿ������
                          ShowMessageBoxFrame(Application.MainForm,
                                              AIniFile.ReadString(ReadSection,'UpdateLog',''),
                                              '',
                                              TMsgDlgType.mtCustom,
                                              ['��������','�Ժ���˵'],
                                              Self.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult,
                                              nil,
                                              '�������(���°汾:'+AIniFile.ReadString(ReadSection,'Version','')+')');
                      end;


                  end
                  else
                  begin
                      //����Ҫ����
                      FIsCheckingNewVersion:=False;

                      if FIsNeedHint then
                      begin
                        ShowHintFrame(nil,'�������°汾');
                      end;

                  end;

              finally
                FreeAndNil(AIniFile);
              end;

              //����Ҫ����
              FIsCheckingNewVersion:=False;

          end
          else
          begin
              FIsCheckingNewVersion:=False;
              //����°汾ʧ��
              HandleException(nil,'TVersionChecker.DoCheckNewVersionExecuteEnd Version.ini Not Existed');
          end;

      end
      else
      begin
          //����°汾ʧ��
          HandleException(nil,'TVersionChecker.DoCheckNewVersionExecuteEnd Version.ini Not Existed');
      end;
  finally
      //��������������ΪTrue,����껹Ҫ����apk
    FIsCheckingNewVersion:=False;
  end;

end;

procedure TVersionChecker.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult(Sender: TObject);
begin
  //ѡ��������ʽ
  if GlobalMessageBoxFrame.ModalResult='��������' then
  begin
      DoSureUpdate;
  end
  else
  begin
      //������,���½���
      FIsCheckingNewVersion:=False;
  end;
end;


procedure TVersionChecker.DoSureUpdate;
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
var
  ADownloadPackageURL:String;
begin
    ADownloadPackageURL:=LowerCase(FDownloadPackageURL);
    if (ADownloadPackageURL.IndexOf('http:')>=0)
      or (ADownloadPackageURL.IndexOf('https:')>=0) then
    begin
        //ֱ�Ӿ��������http����
        ADownloadPackageURL:=FDownloadPackageURL;
    end
    else
    begin
        //���ϻ�ַ
        ADownloadPackageURL:=FUpdatePackageBaseUrl+'/'+FDownloadPackageURL;
    end;



    {$IFDEF IOS}
    FIsCheckingNewVersion:=False;
    //IOS����AppStore
//    ShowMessage(FDownloadPackageURL);
    OpenWebBrowserAndNavigateURL(TIdURI.URLEncode(FDownloadPackageURL));
    {$ENDIF}



    {$IFDEF ANDROID}
        if Self.IsGooglePlayVersion then
        begin
            //��ת���ȸ�Ӧ���̵�
                  FIsCheckingNewVersion:=False;

//              try
                  Intent:=TJIntent.Create;
                  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
                  Intent.setData(StrToJURI('market://details?id=' + JStringToString(SharedActivity.getPackageName())));
                  Intent.setPackage(StringToJString('com.android.vending'));
                  if (Intent.resolveActivity(SharedActivity.getPackageManager)<>nil) then
                  begin
                      SharedActivity.startActivity(Intent);
                  end
                  else
                  begin
                     //û��Ӧ���г���ͨ���������ת��Google Play
                     OpenWebBrowserAndNavigateURL('https://play.google.com/store/apps/details?id='
                                                + JStringToString(SharedActivity.getPackageName())
                                                );
                  end;
//              except
//                on E: Exception do
//                begin
//                end;
//              end;


        end
        else
        begin
//                FMX.Types.Log.d('OrangeUI '+FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+FDownloadPackageURL);


                //Android��ת������ҳ��
                //�ϰ汾
                ShowFrame(TFrame(GlobalUpdateFrame),TFrameUpdate,Application.MainForm,nil,nil,nil,Application,False,False,ufsefNone);
                GlobalUpdateFrame.UpdateApp(
                                            ADownloadPackageURL,
                                            System.IOUtils.TPath.GetSharedDownloadsPath+PathDelim+ExtractFileName(ReplaceStr(FDownloadPackageURL,'/','\'))
                                            );


        end;

    {$ENDIF}




    {$IFDEF MSWINDOWS}
        {$IFDEF USE_AUTO_UPGRADER_PRO}
          if auAutoUpgrader1=nil then
          begin
            auAutoUpgrader1:=TauAutoUpgrader.Create(Application);
          end;
          auAutoUpgrader1.InfoFileURL:=FUpdatePackageBaseUrl+'/'+'Version.inf';
    //          FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+GetUserTypeStr(AppUserType)+'/'+'Version.inf';
          auAutoUpgrader1.VersionControl:=byNumber;
          auAutoUpgrader1.VersionNumber := CurrentVersion;//'1.0.0';
          auAutoUpgrader1.ShowMessages := [mConnLost, mLostFile];
          auAutoUpgrader1.Wizard.Enabled:=False;
          auAutoUpgrader1.OnEndUpgrade:=Self.DoAUEndUpgradeEvent;
          auAutoUpgrader1.CheckUpdate();
    //        if FileExists(GetApplicationPath+'OrangeUIAppUpdate.exe') then
    //        begin
    //            ShellExecuteW(0, nil, PWideChar(GetApplicationPath+'OrangeUIAppUpdate.exe'), nil,nil, SW_SHOW);
    //        end;
        {$ELSE}
            //��ת������ҳ��
            //�ϰ汾
            ShowFrame(TFrame(GlobalUpdateFrame),TFrameUpdate,Application.MainForm,nil,nil,nil,Application,False,False,ufsefNone);
            GlobalUpdateFrame.UpdateApp(
                                        ADownloadPackageURL,
                                        System.IOUtils.TPath.GetSharedDownloadsPath+PathDelim+ExtractFileName(ReplaceStr(FDownloadPackageURL,'/','\'))
                                        );
        {$ENDIF}
    {$ENDIF}


end;

function TVersionChecker.ReadSection: String;
begin
  Result:='Windows';


  {$IFDEF ANDROID}
  Result:='Android';


  //����ж�APP�Ǵ�GooglePlay�����ص�
  //��ô���ݰ����Զ��ӹȸ��ȡ�汾��
  //Ȼ��ȶ԰汾,�Ƿ���Ҫ��ת���ȸ���и���
  if Self.IsGooglePlayVersion then
  begin
    Result:='GooglePlay';
  end;
  {$ENDIF}



  {$IFDEF IOS}
  Result:='IOS';
  {$ENDIF}

end;

initialization
  GlobalVersionChecker:=TVersionChecker.Create;





finalization
  System.SysUtils.FreeAndNil(GlobalVersionChecker);



end.


              //try {
              //    Intent intent = new Intent(Intent.ACTION_VIEW);
              //    intent.setData(Uri.parse("market://details?id=" + getPackageName()));
              //    intent.setPackage(GoogleMarket.GOOGLE_PLAY);//�����Ӧ���ǹȸ��̵꣬��ת����̵�ĳɶ�Ӧ�ļ���
              //    if (intent.resolveActivity(context.getPackageManager()) != null) {
              //        context.startActivity(intent);
              //    } else {//û��Ӧ���г���ͨ���������ת��Google Play
              //        Intent intent2 = new Intent(Intent.ACTION_VIEW);
              //        intent2.setData(Uri.parse("https://play.google.com/store/apps/details?id=" + getPackageName()));
              //        if (intent2.resolveActivity(context.getPackageManager()) != null) {
              //            context.startActivity(intent2);
              //        } else {
              //            //û��Google Play Ҳû�������
              //        }
              //    }
              //} catch (ActivityNotFoundException activityNotFoundException1) {
              //    Log.e(AppRater.class.getSimpleName(), "GoogleMarket Intent not found");
              //}

