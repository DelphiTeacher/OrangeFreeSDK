unit uVersionChecker;



interface
//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
//  {$DEFINE FMX}
//{$IFEND}



////请在工程下放置FrameWork.inc
////或者在工程设置中配置FMX编译指令
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
  //版本检测
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

    //新APK下载的路径
    FDownloadPackageURL:String;


    //Version.ini中，Windows、IOS和Android的版本更新节点要分开
    function ReadSection:String;

    //确定更新
    procedure DoSureUpdate;


    //检测新版本
    procedure DoCheckNewVersionExecute(ATimerTask:TObject);
    procedure DoCheckNewVersionExecuteEnd(ATimerTask:TObject);

    //选择是否更新
    procedure DoSelectAppUpdateMethodUseSelectMessageBoxModalResult(Sender:TObject);
  public
    //是否手动检查更新,如果是手动检测,那么不需要提示了，必定是需要升级的
    FIsManualCheckUpdate:Boolean;
    FIsNeedHint:Boolean;
    //是否正在检测新版本
    FIsCheckingNewVersion:Boolean;

    //当前应用是否是谷歌专版(那么不能再从服务器中下载包更新了)
    //默认不是
    IsGooglePlayVersion:Boolean;
//    //检测新版本
//    procedure CheckNewVersion(
//                              //第一检测地址
//                              //拼接如下字符串FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+AppUserTypeName+'/Version.ini'
//                              AAppUpdateServerUrl:String;
//                              //第二检测地址
//                              AImageHttpServerUrl:String='');
    //检测新版本
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
//  //APP更新的服务器
//  FAppUpdateServerUrl:String;
//begin
//
//  FAppUpdateServerUrl:=AAppUpdateServerUrl;
//
//  //为空,取开放平台的APP更新目录
//  if FAppUpdateServerUrl='' then
//  begin
//    FAppUpdateServerUrl:=AAppUpdateServerUrl;
//  end;
//
//
//  //为空,取开放平台的图片上传下载目录
//  if FAppUpdateServerUrl='' then
//  begin
//    FAppUpdateServerUrl:=AImageHttpServerUrl;
//  end;
//
//
//
//  //升级配置文件的下载地址
//  FUpdateConfigIniUrl:=FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+AppUserTypeName+'/'+'Version.ini';
//  //新安装包的下载基址
//  FUpdatePackageBaseUrl:=FAppUpdateServerUrl+'/Upload/'+IntToStr(AppID)+'/'+'Update/'+APPUserTypeName;
//  //Windows下面的下载控件包
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
      //立即启动
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


  ShowHintFrame(Application.MainForm,'更新结束!');
end;

procedure TVersionChecker.DoCheckNewVersionExecute(ATimerTask: TObject);
var
  AMustUpdate:Integer;
  AHttpControl:THttpControl;
  AResponseStream:TMemoryStream;
begin
  //下载版本文件Version.ini

  //出错
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
            //异常
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
              //Windows下面要转换成默认的格式,不然UTF-8格式的ini文件读不出来的
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
                  //检查新版本成功

                  //检测版本
                  if AIniFile.ReadString(ReadSection,'Version','')>CurrentVersion then
                  begin

                      FDownloadPackageURL:=AIniFile.ReadString(ReadSection,'Url','');


                      //检测是否必须升级
                      AMustUpdate:=AIniFile.ReadInteger(ReadSection,'MustUpdate',0);
                      if AMustUpdate=1 then
                      begin
                          //提示有新版本,必须升级
                          ShowMessageBoxFrame(Application.MainForm,
                                              AIniFile.ReadString(ReadSection,'UpdateLog',''),
                                              '',
                                              TMsgDlgType.mtCustom,
                                              ['立即更新'],
                                              Self.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult,
                                              nil,
                                              '程序更新(更新版本:'+AIniFile.ReadString(ReadSection,'Version','')+')'
                                              );
                      end
                      else if AMustUpdate=2 then
                      begin
                          //马上更新
                          ShowHintFrame(Application.MainForm,
                                        '程序更新(更新版本:'+AIniFile.ReadString(ReadSection,'Version','')+')'+#13#10
                                        +AIniFile.ReadString(ReadSection,'UpdateLog','')
                                         );
                          DoSureUpdate;
                      end
                      else if (AMustUpdate=3) and not FIsManualCheckUpdate then
                      begin
                          //不更新,仅提示
                          ShowHintFrame(Application.MainForm,
                                        '有新版本:'+AIniFile.ReadString(ReadSection,'Version','')+')'//+#13#10
                                        //+AIniFile.ReadString(ReadSection,'UpdateLog','')
                                         );
                      end
                      else
                      begin
                          //默认
                          //有新版本,不强制升级
                          ShowMessageBoxFrame(Application.MainForm,
                                              AIniFile.ReadString(ReadSection,'UpdateLog',''),
                                              '',
                                              TMsgDlgType.mtCustom,
                                              ['立即更新','稍后再说'],
                                              Self.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult,
                                              nil,
                                              '程序更新(更新版本:'+AIniFile.ReadString(ReadSection,'Version','')+')');
                      end;


                  end
                  else
                  begin
                      //不需要更新
                      FIsCheckingNewVersion:=False;

                      if FIsNeedHint then
                      begin
                        ShowHintFrame(nil,'已是最新版本');
                      end;

                  end;

              finally
                FreeAndNil(AIniFile);
              end;

              //不需要更新
              FIsCheckingNewVersion:=False;

          end
          else
          begin
              FIsCheckingNewVersion:=False;
              //检查新版本失败
              HandleException(nil,'TVersionChecker.DoCheckNewVersionExecuteEnd Version.ini Not Existed');
          end;

      end
      else
      begin
          //检查新版本失败
          HandleException(nil,'TVersionChecker.DoCheckNewVersionExecuteEnd Version.ini Not Existed');
      end;
  finally
      //不能在这里设置为True,检测完还要下载apk
    FIsCheckingNewVersion:=False;
  end;

end;

procedure TVersionChecker.DoSelectAppUpdateMethodUseSelectMessageBoxModalResult(Sender: TObject);
begin
  //选择升级方式
  if GlobalMessageBoxFrame.ModalResult='立即更新' then
  begin
      DoSureUpdate;
  end
  else
  begin
      //不更新,更新结束
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
        //直接就是整体的http链接
        ADownloadPackageURL:=FDownloadPackageURL;
    end
    else
    begin
        //加上基址
        ADownloadPackageURL:=FUpdatePackageBaseUrl+'/'+FDownloadPackageURL;
    end;



    {$IFDEF IOS}
    FIsCheckingNewVersion:=False;
    //IOS跳到AppStore
//    ShowMessage(FDownloadPackageURL);
    OpenWebBrowserAndNavigateURL(TIdURI.URLEncode(FDownloadPackageURL));
    {$ENDIF}



    {$IFDEF ANDROID}
        if Self.IsGooglePlayVersion then
        begin
            //跳转到谷歌应用商店
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
                     //没有应用市场，通过浏览器跳转到Google Play
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


                //Android跳转到更新页面
                //老版本
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
            //跳转到更新页面
            //老版本
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


  //如何判断APP是从GooglePlay中下载的
  //那么根据包名自动从谷歌获取版本号
  //然后比对版本,是否需要跳转到谷歌进行更新
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
              //    intent.setPackage(GoogleMarket.GOOGLE_PLAY);//这里对应的是谷歌商店，跳转别的商店改成对应的即可
              //    if (intent.resolveActivity(context.getPackageManager()) != null) {
              //        context.startActivity(intent);
              //    } else {//没有应用市场，通过浏览器跳转到Google Play
              //        Intent intent2 = new Intent(Intent.ACTION_VIEW);
              //        intent2.setData(Uri.parse("https://play.google.com/store/apps/details?id=" + getPackageName()));
              //        if (intent2.resolveActivity(context.getPackageManager()) != null) {
              //            context.startActivity(intent2);
              //        } else {
              //            //没有Google Play 也没有浏览器
              //        }
              //    }
              //} catch (ActivityNotFoundException activityNotFoundException1) {
              //    Log.e(AppRater.class.getSimpleName(), "GoogleMarket Intent not found");
              //}

