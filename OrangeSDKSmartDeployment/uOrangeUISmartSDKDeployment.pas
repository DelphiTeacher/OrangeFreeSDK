//convert pas to utf8 by ¥
unit uOrangeUISmartSDKDeployment;

interface

uses
  {$IFDEF MSWINDOWS}
  ShlwApi,
//  FileCtrl,
  ShellAPI,
  ActiveX,
  Winapi.Windows,
//  Winapi.Messages,
//  Vcl.Graphics,
  System.Win.Registry,
  {$ENDIF MSWINDOWS}

  System.SysUtils,
  System.Variants,

  XMLDoc,
  XMLIntf,

  uBaseList_Copy,
  uBaseLog_Copy,
  uLang_Copy,
  uFuncCommon_Copy,

  IniFiles,
  Math,

//uses
  StrUtils,
  FMX.Forms,
  FMX.Dialogs,

  {$IFNDEF IN_ORANGESDK}
  ZLib,
  VCLUnZip,
  VCLZip,
  {$ENDIF}

  XSuperObject_Copy,



//  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
//  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Imaging.pngimage,
//  Vcl.ExtDlgs
  System.Classes
  ;




const
  //生成jar的临时目录
  CONST_JAR_TEMP_DIR='OrangeSDK_JarGen';
  Const_OrangeSDKConfig_FileExt='.OrangeSDKConfig';



const
  Langs_AppCaption : array[Low(TLangKind)..High(TLangKind)] of string =
      ('三方SDK智能布署工具 - 作者:DelphiTeacher(ggggcexx@163.com),欢迎加入FMX三方SDK付费群670563729,拥有地图、支付、推送等更多SDK',
      'Smart Deploy Tools For SDK - Author:DelphiTeacher(ggggcexx@163.com)','');
  Langs_NewConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('新建配置文件','New Config','');
  Langs_OpenConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('打开配置文件','Open Config','');
  Langs_SaveConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('保存配置文件','Save Config','');
  Langs_CurrentConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('当前配置文件:','Current Config:','');

  Langs_SelectProject : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选择工程文件','Select Project','');
  Langs_ProcessConfigToProject : array[Low(TLangKind)..High(TLangKind)] of string =
      ('配置到该工程','Process Config','');
  Langs_CurrentProject : array[Low(TLangKind)..High(TLangKind)] of string =
      ('待处理工程文件:','Current Project:','');


  Langs_DeployConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('布署配置','Deployment','');
  Langs_SDKVariableConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('SDK变量配置','SDK Variable','');
  Langs_AndroidPermissionConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('Android权限配置','Android Permission','');
  Langs_AndroidJarConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('AndroidJar配置','Android Jar','');
  Langs_IOSFrameworkConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('IOS库配置','IOS Framework','');
  Langs_IconAndLaunchConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('APP图标和启动图片设置','AppIcon LaunchImage','');


  Langs_DeployTargetPlatform : array[Low(TLangKind)..High(TLangKind)] of string =
      ('布署目标平台:','Target platform:','');
  Langs_DeployLocalDirOrFile : array[Low(TLangKind)..High(TLangKind)] of string =
      ('资源的本地目录或文件:','Local Directory or File:','');
  Langs_DeployRemoteDirOrFile : array[Low(TLangKind)..High(TLangKind)] of string =
      ('布署到远程目录或文件:','Remote Directory or File:','');
  Langs_DeploySelectDir : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选择文件夹','Select Directory','');
  Langs_DeploySelectFile : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选择文件','Select File','');
  Langs_DeployAddToGrid : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加到表格','Add to Grid','');
  Langs_DeploySaveToGrid : array[Low(TLangKind)..High(TLangKind)] of string =
      ('保存修改','Save','');
  Langs_DeployDelToGrid : array[Low(TLangKind)..High(TLangKind)] of string =
      ('删除项','Delete Selected','');

  Langs_DeployPreviewFileList : array[Low(TLangKind)..High(TLangKind)] of string =
      ('预览所需布署的文件列表','Preview need deployed files','');
  Langs_DeployPreviewTargetPlatform : array[Low(TLangKind)..High(TLangKind)] of string =
      ('预览的目标平台:','Preview target platform:','');
  Langs_PreviewDeployConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('预览文件布署','Preview','');
  Langs_ProcessDeployConfig : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理文件布署','Process','');


  Langs_VariableHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('SDK变量的作用:当一个SDK应用到不同的APP时，有些参数是不同的，比如包名、AppID等，把这个参数作为变量，以便让该配置文件适用于所有工程',
      'Use of SDK-Variable:When an SDK is applied to different apps, some parameters are different, such as package name, appid, etc. take this parameter as a variable to make the configuration file applicable to all projects','');


  Langs_AndroidPermissionHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('Android权限项:','Android Permissions:','');
  Langs_ProcessAndroidPermissions : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理权限项','Process Permissions','');
  Langs_AndroidComponentHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('Android组件(Activity/Service/BroadCast Recevicer/Content provider):',
      'Android Components(Activity/Service/BroadCast Recevicer/Content provider):','');
  Langs_ProcessAndroidApplicationChildNodes : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理Android组件','Process Components','');


  Langs_AddAndroidJar : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加AndroidJar','Add Android Jar','');
  Langs_ProcessAndroidJar : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理AndroidJar','Process Android Jar','');
  Langs_AddAndroidAar : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加AndroidAar','Add Android Aar','');
  Langs_ProcessAndroidAAR : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理AndroidAar','Process Android Aar','');
  Langs_GenerateAndroidAAR : array[Low(TLangKind)..High(TLangKind)] of string =
      ('生成R.jar','Generate R.jar','');


  Langs_IOSLinkerOptionsHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('链接参数(Project Options->Building->Delphi Compiler->Linking->options passed to LD linker):',
      'Linker Options(Project Options->Building->Delphi Compiler->Linking->options passed to LD linker):','');
  Langs_ProcessIOSLinkerOptions : array[Low(TLangKind)..High(TLangKind)] of string =
      ('处理链接参数','Process IOS Linker Options','');
  Langs_AddIOSFrameworkHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('注意:添加完之后还需要在SDK Manager中给每个SDK点击"Upate Local File Cache"',
      'Attention:After do that,you must click "Upate Local File Cache" button on every iPhoneSDK at SDK Manager','');
  Langs_AddFrameworksToAllIOSSDK : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加下面的框架到所有的iPhone SDK','Add Frameworks below to All iPhone SDKs','');
  Langs_AddDylibsToAllIOSSDK : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加下面的库到所有的iPhone SDK','Add Dylibs below to All iPhone SDKs','');
  Langs_ProcessIOSPlistRootNodes : array[Low(TLangKind)..High(TLangKind)] of string =
      ('添加下面的配置到info.plist.TemplateiOS.xml','Add Configs below to info.plist.TemplateiOS.xml','');


  Langs_AppIcon : array[Low(TLangKind)..High(TLangKind)] of string =
      ('App图标:','App Icon:','');
  Langs_SelectProjectIcon : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选取图标文件','Select App Icon','');
  Langs_GenerateProjectIconEverySize : array[Low(TLangKind)..High(TLangKind)] of string =
      ('生成各种尺寸到工程目录','Generate every size to project directory','');
  Langs_SetAsProjectIcon : array[Low(TLangKind)..High(TLangKind)] of string =
      ('设置为工程图标','Set as project icon','');


  Langs_AppLaunchImage : array[Low(TLangKind)..High(TLangKind)] of string =
      ('App启动图片:','App LaunchImage:','');
  Langs_SelectProjectLaunchImage : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选择启动图片或图标','Select App LaunchImage or Icon','');
  Langs_GenerateProjectLaunchImageEverySize : array[Low(TLangKind)..High(TLangKind)] of string =
      ('直接生成各种尺寸到工程目录','Generate every size to project directory','');
  Langs_SetAsProjectLaunchImage : array[Low(TLangKind)..High(TLangKind)] of string =
      ('设置为工程启动图片','Set as project launch image','');

  Langs_LaunchImageScaleBaseHeightHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('图片放大的基准高度:','Base height of scale image:','');
  Langs_LaunchImageBackColorHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('选择合成的背景颜色:','Select backgroud-color for combine:','');
  Langs_BackColorHexCodeHint : array[Low(TLangKind)..High(TLangKind)] of string =
      ('或背景颜色16进制代码:','Or Hex of backgroud-color:','');
  Langs_CombineLaunchImageByBackColor : array[Low(TLangKind)..High(TLangKind)] of string =
      ('或根据背景颜色合成启动图片','Combine launch image to project directory','');





type
  TDeployConfigLogEvent=procedure(Sender:TObject;const ALog:String) of object;



  //<DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
  //  <Platform Name="Android">
  //      <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
  //      <RemoteName>libTbDemuxer.so</RemoteName>
  //      <Overwrite>true</Overwrite>
  //      <Enabled>true</Enabled>
  //  </Platform>
  //</DeployFile>
  //布署文件项的平台项
  TDeployFilePlatform=class
  public
    //Android,iOSDevice32
    Platform_:String;
    //远程的目录
    RemoteDir:String;
    //远程的文件名
    RemoteName:String;
    //每次布署打包时是否覆盖
    Overwrite:String;
    //是否启用
    Enabled:String;
  end;
  TDeployFilePlatformList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDeployFilePlatform;
  public
    function FindItemByPlatform(APlatform:String):TDeployFilePlatform;
    property Items[Index:Integer]:TDeployFilePlatform read GetItem;default;
  end;




  //布署文件项,一个本地文件可以布署到多个平台
  TDeployFile=class
  public
    LocalName:String;
    //文件类别
    Class_:String;
    //所属工程配置
    Configuration:String;
    //此文件要布署到的平台列表
    Platforms:TDeployFilePlatformList;
  public
    constructor Create;
    destructor Destroy;override;
  public
    //支持的平台
    function PlatformsCommaText:String;
    function FindPlatform(APlatform:String):TDeployFilePlatform;
  end;
  TDeployFileList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDeployFile;
  public
    property Items[Index:Integer]:TDeployFile read GetItem;default;
  public
    //判断本地文件是否已经存在
    function FindItemByLocalName(ALocalName:String):TDeployFile;
    //判断远程文件是否已经存在
    function FindItemByRemoteName(ARemotePath:String;APlatform:String):TDeployFile;
  end;






  //布暑配置项
  //将本地文件夹布署到远程目录
  //布署时先清除原远程目录的项
  //如果两个本地文件同时布署到远程,那么需要合并,现在不合并了,就直接重命名即可
  //布署时需要先备份
  TDeployConfig=class
  public
    Platform_:String;
    //相对目录
    LocalDir:String;
    //布署到的远程目录
    RemoteDir:String;
  public
    //加载后的需要布署的文件列表
    LocalFiles:TStringList;
    RemoteFiles:TStringList;
    constructor Create;
    destructor Destroy;override;
  public
    //加载本地文件或本地目录下面所有的文件列表
    procedure LoadFileList(AProjectDir:String);
  end;

  //布署配置项的列表
  TDeployConfigList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDeployConfig;
  public
    property Items[Index:Integer]:TDeployConfig read GetItem;default;
  public
    FPreviewDeployFileList:TDeployFileList;
    //生成需要布署的所有文件列表
    function GeneratePreviewDeployFileList(AProjectPath:String):Boolean;
  public
    constructor Create(
                        const AObjectOwnership:TObjectOwnership=ooOwned;
                        const AIsCreateObjectChangeManager:Boolean=True
                        );override;
    destructor Destroy;override;
  end;






  //配置变量,以便配置文件可以应用于不同的项目
  TConfigVariable=class
  public
    //变量名,比如ANDROID_PACKAGE_NAME,APPID,APPSECRET
    Name:String;
    Value:String;
    Desc:String;
  end;
  TConfigVariableList=class(TBaseList)
  private
    function GetItem(Index: Integer): TConfigVariable;
  public
    property Items[Index:Integer]:TConfigVariable read GetItem;default;
    function FindItemByName(AName:String):TConfigVariable;
  end;





  //工程文件的配置
  TProjectConfig=class
  public
    //上次工程文件路径
    FLastProjectFilePath:String;

    //工程当前的布署文件列表,预览后的
    FCurrentDeployFileList:TDeployFileList;

  public
    //布署配置
    FDeployConfigList:TDeployConfigList;


    //Jar配置
    FAndroidJarList:TStringList;
    FAndroidAarList:TStringList;
    //配置变量
    FAndroidVariableList:TConfigVariableList;
//    //是否禁用系统自带的Jar
//    FIsDisableSysJars:Boolean;
    //Anroid权限列表
    FAndroidUsersPermissions:TStringList;
    //Android的子节点
    FAndroidApplicationChildNodes:TStringList;



    //IOS Plist的配置
    FIOSPlistRootNodes:TStringList;
    //IOS链接参数
    FIOSLinkerOptions:String;
  private
    //找到文件布署的XMLNode
    //应该要根据远程目录和文件名来判断
    function FindDeployFileXMLNode(ADeployFile:TDeployFile;
                                   AXMLNode: IXMLNode;
//                                    var ADeployFilePlatformXMLNode:IXMLNode;
//                                    var AEnabledDeployFileXMLNode:IXMLNode;
                                    AExistsLocalNameList:TStringList;
                                    //是否少了一些平台没有布署
                                    var AIsLostSomePlatform:Boolean
                                    ):IXMLNode;
    //找到文件布署的平台的XMLNode
    function FindDeployFilePlatformXMLNode(APlatform:String;
                                          ADeployFileXMLNode: IXMLNode):IXMLNode;
  public
    constructor Create;
    destructor Destroy;override;
  public
//    //获取Android的包名
//    function GetAndroidPackageName(AProjectFilePath:String):String;
    //从工程文件加载文件布署列表
    function LoadDeployFileListFromProject(AProjectFilePath:String):Boolean;



    //把文件布署列表保存到工程
    function SaveDeployFileListToProject(ADeployFileList:TDeployFileList;
                                          AProjectFilePath:String):Boolean;
    //把文件布署项保存到XMLNode
    function SaveDeployFileToXMLNode(ADeployFile:TDeployFile;
                                      AXMLNode: IXMLNode;
                                      AProjectFilePath:String):Boolean;
    function AddDeployFileToXMLNode(ADeployFile:TDeployFile;
                                      AXMLNode: IXMLNode):Boolean;
    function AddDeployFilePlatformToXMLNode(ADeployFile:TDeployFile;
                                            ADeployFilePlatform:TDeployFilePlatform;
                                            ADeployFileXMLNode: IXMLNode):Boolean;



    //把AndroidJar列表保存到工程
    function SaveAndroidJarListToProject(AAndroidJarList:TStringList;
                                          AProjectFilePath:String):Boolean;
    //把AndroidAar列表保存到工程
    function SaveAndroidAarListToProject(AAndroidAarList:TStringList;
                                          AProjectFilePath:String):Boolean;
    //从工程中获取到Jar文件列表
    function LoadAndroidJarListFromProject(AAndroidJarList:TStringList;
                                          AProjectFilePath:String):Boolean;
    //判断是否存在AndroidManifest.template.xml,不存在则创建
    procedure CheckAndroidManifestTemplateXmlFile(AProjectFilePath:String);
    //保存Android权限到AndroidManifest.template.xml
    function SaveAndroidUsersPermissionsToProject(AAndroidUsersPermissions:TStringList;
                                                  AConfigVariables:TConfigVariableList;
                                                  AProjectFilePath:String):Boolean;
    //保存Application子节点到AndroidManifest.template.xml
    function SaveAndroidApplicationChildNodesToProject(AAndroidApplicationChildNodes:TStringList;
                                                        AConfigVariables:TConfigVariableList;
                                                        AProjectFilePath:String):Boolean;


    //设置工程图标
    function SaveProjectIconToProject(AProjectFilePath:String):Boolean;
    //把一个图标保存到xml结点
    function SaveProjectPictureToProjectXMLNode(AIconWidth:Integer;
                                                AIconHeight:Integer;
                                                ANodeName:String;
                                                AXMLNode: IXMLNode;
                                                AText:String=''):Boolean;

    //设置工程启动图片
    function SaveProjectLaunchImageToProject(AProjectFilePath:String):Boolean;
//    function ClearIOSLaunchImageToProject(AProjectFilePath:String):Boolean;

    //判断info.plist.TemplateiOS.xml是否存在,不存在则创建
    procedure CheckInfoPlistTemplateiOSXmlFile(AProjectFilePath:String);
    //判断Entitlement.TemplateiOS.xml是否存在,不存在则创建
    procedure CheckEntitlementTemplateiOSXmlFile(AProjectFilePath:String);
    //添加CFBundleURLTypes到info.plist
    function SaveIOSInfoPlistToProject(AProjectFilePath:String;
                                          AInfoPlistRootNodes:TStringList;
                                          AConfigVariables:TConfigVariableList
                                          ):Boolean;

    //设置IOS链接参数
    function SaveIOSLinkerOptionsToProject(AProjectFilePath:String;
                                          ALinkerOptions:String
                                          ):Boolean;

    //获取AndroidSDK的配置
    function GetAndroidSDKSetting(
                          //19.0,20
                          ADelphiVersion:String;
                          var AJDKDir:String;
                          var AAndroidSDKDir:String;
                          var AAndroidSDKPlatform:String;
                          var AAndroidSDKBuildTools:String
                          ):Boolean;


  public
//      //是否需要生成jar
//      FIsNeedGenerateJar:Boolean;
//      //Jar源码目录,JarSource
//      FJarSourceCodeDir:Boolean;
//      //jar中的包名com.ggggcexx.orangeui.wxapi
//      FGeneratedJarPackage:String;
//      //wxapi.jar
//      FGeneratedJarFileName:String;
//      //WeixinSDK
//      FGeneratedJarDir:String;
      //删除aar文件生成的R.java没用引用到的资源ID  阿蒙 2020-11-10
      procedure RemoveNoUseResource(RTextFileName, RJavaFileName:string; NewRJavaFileName:string='');

      function GenerateJar(AProjectFilePath:String;

                            //WeixinSDK
                            AGeneratedJarDir:String;
                            //Jar源码目录,JarSource
                            AJarSourceCodeDir:String;
                            //jar中的包名com.ggggcexx.orangeui.wxapi
                            AGeneratedJarPackage:String;
                            AAndroidPackage:String;
                            //wxapi.jar
                            AGeneratedJarFileName:String;
                            //生成jar所需要的其他包
                            AUsedAndroidJars:TStrings;

                            AJDKDir:String;
                            AAndroidSDKDir:String;
                            AAndroidSDKPlatform:String;
                            AAndroidSDKBuildTools:String
                            ):Boolean;
    //传入AndroidManifest.xml列表和工程的res目录
    //生成R.java的bat文件和R.jar的bat文件
    procedure GenerateR_Java_And_Jar_BatStringList(
                                        //jar生成目录
                                        ATempRootDir:String;
                                        //工程生成目录中的res目录
                                        AProjectResPath:String;
                                        //AndroidManifest.xml的路径
                                        AAndroidManifestXmlFilePath:String;
                                        //Jar名称,比如Project1,ZBar等等,没有后缀的文件名
                                        AGenJarFileNameNoExt:String;
                                        AJDKDir:String;
                                        AAndroidSDKDir:String;
                                        AAndroidSDKPlatform:String;
                                        AAndroidSDKBuildTools:String;

                                        ABatStringList:TStringList
                                        );
//    procedure GenerateR_Java_And_Jar_Bat_List(ATempRootDir:String;
//                                          AProjectResPath:String;
//                                          AAndroidManifestXmlFilePaths:TStringList;
//                                          AGenJarFileNamesNoExt:TStringList
//                                          );
  public

    //从配置文件加载
    procedure LoadFromINI(AINIFilePath:String);
    //保存到配置文件
    procedure SaveToINI(AINIFilePath:String);


    //将配置应用到工程
    function ProcessAll(AProjectFilePath:String):Boolean;
  public
  end;







var
  //常用的布署远程目录列表
  GlobalDeployConfigRemoteDirList:TStringList;
  //常用的IOS框架列表
  GlobalIOSFrameworkList:TStringList;
  //常用的IOS库列表
  GlobalIOSDylibList:TStringList;
  //记录布署日志
  OnDeployConfigLog:TDeployConfigLogEvent;



//根据节点名找到最后一个节点下标,
//用于布署文件时,添加子节点在此节点下面
function FindLastChildXMLNodeIndex(ANodeName:String;
                                    AXMLNode: IXMLNode):Integer;overload;
function FindChildXMLNodeIndex(ANodeName:String;
                               ANodeText:String;
                               AXMLNode: IXMLNode):Integer;
function FindKeyValueNode(ADictNode: IXMLNode;AKey:String):IXMLNode;
//根据节点的name来判断是否存在
function FindSameAndroidResourceNode(AXMLNode: IXMLNode;ANeedFindXMLNode:IXMLNode): IXMLNode;
//复制子节点
procedure CopyXMLNode(ASrcNode:IXMLNode;ADestNode:IXMLNode);


//合并XML节点,将ASrcNode的内容合并到ADestNode
//procedure CombineXMLNode(ASrcNode:IXMLNode;ADestNode:IXMLNode);
//合并XML
//procedure CombineXML(AXMLAFilePath:String;AXMLBFilePath:String;ADestXMLFilePath:String);



//把相对目录转换成绝对目录
//.\baidumap\ 转换成 D:\aaa\baidumap\
function ConvertRelativePathToAbsolutePath(ABaseDirPath:String;ARelativePath:String):String;
//把绝对目录转换成相对目录
//D:\aaa\baidumap\ 转换成 baidumap\
function ConvertAbsolutePathToRelativePath(ABaseDirPath:String;AAbsolutePath:String):String;
procedure ReplaceStringList(AFrom:String;ATo:String;AStringList:TStrings);


//生成Jar的批处理字符串列表
function GenerateJarBatStringList(ATempJarDirPath:String;

                                  AJDKDir:String;
                                  AAndroidSDKDir:String;
                                  AAndroidSDKPlatform:String;
                                  AAndroidSDKBuildTools:String;


                                  AJarFilePath:String;
                                  AUsedAndroidJars:TStrings;
                                  AJavaSourceFiles:TStrings;
                                  AAndroidPackageName:String;
                                  ATempDexedJarFilePath:String;

                                  ABatStringList:TStringList
                                  ):Boolean;

//生成Jar的批处理文件并运行
function GenerateJarBatToProject(ATempJarDirPath:String;

                                  AJDKDir:String;
                                  AAndroidSDKDir:String;
                                  AAndroidSDKPlatform:String;
                                  AAndroidSDKBuildTools:String;

                                  AJarFilePath:String;
                                  AUsedAndroidJars:TStrings;
                                  AJavaSourceFiles:TStrings;
                                  AGenJarBatFilePath:String;
                                  AAndroidPackageName:String;
                                  ATempDexedJarFilePath:String=''
                                  ):Boolean;

//生成微信Jar
function GenerateWeiXinJarBatToProject(ATempRootDir:String;
                                        ATempJarDir:String;
                                        AJDKDir:String;
                                        AAndroidSDKDir:String;
                                        AAndroidSDKPlatform:String;
                                        AAndroidSDKBuildTools:String;
                                        AJarFilePath:String;
                                        AUsedAndroidJars:TStrings;

                                        AAndroidPackage:String;
                                        AWXEntryActivityLines:TStrings;
                                        AWXPayEntryActivityLines:TStrings;
                                        AOnWeixinListenerLines:TStrings;
                                        AWxApiPasLines:TStrings
                                        ):Boolean;

//生成R.Java的命令
function GenerateResJavaBatString(
                          AGenResJavaSrcDirPath:String;
                          //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt
                          AAndroidSDKAaptExeFilePath:String;
                          //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar
                          AAndroidSystemJarFilePath:String;
                          //res目录
                          AProjectResPath:String;
                          //AndroidManifest.xml的路径
                          AAndroidManifestXmlFilePath:String;
//                          //
//                          AGenRJavaBatFilePath:String;

                          var AGenR_Java_Command:String
                          ):Boolean;
//function GenerateResJavaBat(
//                          AGenResJavaSrcDirPath:String;
//                          //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt
//                          AAndroidSDKAaptExeFilePath:String;
//                          //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar
//                          AAndroidSystemJarFilePath:String;
//                          //res目录
//                          AProjectResPath:String;
//                          //AndroidManifest.xml的路径
//                          AAndroidManifestXmlFilePath:String;
//                          //
//                          AGenRJavaBatFilePath:String
//                          ):Boolean;




//输出日志
procedure DoDeployConfigLog(Sender:TObject;const ALog:String);

//获取目录里面的文件列表
procedure DoGetFileList(dirName:string;AFilePathList:TStringList);

//取出AndroidManifest.xml中的包名
function GetAndroidPackageName(AAndroidManifestXmlFilePath:String):String;

procedure ProcessConfigVariables(AStringList:TStringList;AConfigVariableList:TConfigVariableList);


procedure AddLibraryToIOSSDK(
              //Delphi的版本,比如18,0
              ADelphiVersion:String;
              //IOS SDK的版本号,比如iPhoneOS10.3.sdk
              AIOS_SDK:String;
              //框架类型,
              //比如Include Paths,0
              //Library Paths,1
              //Frameworks,2
              APathType:Integer;
              //框架名称,比如SystemConfiguration
              APathName:String;
              //路径,$(SDKROOT)/System/Library/Frameworks,$(SDKROOT)/usr/lib
              APathDir:String;
              //是否包含子路径,0,1
              AIncludeSubDir:String
              );
//获取已安装的Delphi版本列表
function GetInstalledDelphiVersions:TStringList;
function GetInstalledDelphiVersionsCommaText:String;
//获取已添加的IOS SDK列表,//Delphi的版本,比如18,0
function GetInstalledPlatforms(ADelphiVersion:String):TStringList;

procedure AddLibraryToAllIOSSDK(
              //框架类型,
              //比如Include Paths,0
              //Library Paths,1
              //Frameworks,2
              APathType:Integer;
              //框架名称,比如SystemConfiguration
              APathName:String;
              //路径,$(SDKROOT)/System/Library/Frameworks,$(SDKROOT)/usr/lib
              APathDir:String;
              //是否包含子路径,0,1
              AIncludeSubDir:String
              );



////获取info.plist.TemplateiOS.xml自定义节点的字符串
//function GetInfoPlistTemplateFileCustomNodeStr(AInfoPlistFilePath:String;var ACustomNodeStr:String):Boolean;


//保存工程所启用的SDK
function SaveEnabledSDKS(AProjectFilePath:String;
                        ASDKs:TStringList):Boolean;
function ProcessEnabledSDKS(AProjectFilePath:String;
                          ASDKConfigFilePath:String):Boolean;

function ExtractFileNameNoExt(AFilePath:String):String;
function ChangeFileExt(AFilePath:String;ANewFileExt:String):String;



implementation



function ChangeFileExt(AFilePath:String;ANewFileExt:String):String;
var
  AConfigFileExt:String;
begin
  Result:=ExtractFileName(AFilePath);
  AConfigFileExt:=ExtractFileExt(Result);
  Result:=ExtractFilePath(AFilePath)+Copy(Result,1,Length(Result)-Length(AConfigFileExt));
  Result:=Result+ANewFileExt;
end;

function ExtractFileNameNoExt(AFilePath:String):String;
var
  AConfigFileExt:String;
begin
  Result:=ExtractFileName(AFilePath);
  AConfigFileExt:=ExtractFileExt(Result);
  Result:=Copy(Result,1,Length(Result)-Length(AConfigFileExt));
end;


function ProcessEnabledSDKS(AProjectFilePath:String;
                          ASDKConfigFilePath:String):Boolean;
var
  I: Integer;
  ASDK:String;
  ASuperObject:ISuperObject;
  AProjectConfig:TProjectConfig;
begin
  if not FileExists(ASDKConfigFilePath) then
  begin
    raise Exception.Create(QuotedStr(ASDKConfigFilePath)+' is not exist');
    Exit;
  end;


  ASuperObject:=TSuperObject.ParseFile(ASDKConfigFilePath);



  for I := 0 to ASuperObject.A['enabled_sdks'].Length-1 do
  begin

      ASDK:=ExtractFilePath(AProjectFilePath)+ASuperObject.A['enabled_sdks'].S[I];


//      //是个aar文件
//      if ExtractFileExt(ASDK)='.aar' then
//      begin
//
//
//        Continue;
//      end;


      //SDK是个目录
      if not DirectoryExists(ASDK) then
      begin
          raise Exception.Create(QuotedStr(ASDK)+'不存在,请拷贝该SDK目录到工程目录下');
          Exit;
      end
      else
      begin
          AProjectConfig:=TProjectConfig.Create;
          try
            AProjectConfig.LoadFromINI(
              ASDK+'\'+'DeployConfig.ini'
              );
            if not AProjectConfig.ProcessAll(AProjectFilePath) then
            begin
              ShowMessage(ASuperObject.A['enabled_sdks'].S[I]+'布署失败');
              Exit;
            end;
          finally
            AProjectConfig.Free;
          end;
      end;

  end;

end;



function SaveEnabledSDKS(AProjectFilePath: String;
                          ASDKs:TStringList): Boolean;
var
  ASuperObject:ISuperObject;
  ASuperArray:ISuperArray;
  I: Integer;
  AConfigFileName:String;
  AConfigFileExt:String;
  AConfigFilePath:String;
begin

  AConfigFileName:=ExtractFileName(AProjectFilePath);
  AConfigFileExt:=ExtractFileExt(AConfigFileName);
  AConfigFileName:=Copy(AConfigFileName,1,Length(AConfigFileName)-Length(AConfigFileExt));
  AConfigFilePath:=ExtractFilePath(AProjectFilePath)
                    +AConfigFileName+'.OrangeSDKConfig';


  //先判断配置文件是否存在
  ASuperObject:=TSuperObject.Create();
  ASuperObject.S['version']:='1.0.0';
  ASuperArray:=TSuperArray.Create;
  ASuperObject.A['enabled_sdks']:=ASuperArray;
  for I := 0 to ASDKs.Count-1 do
  begin
    ASuperArray.S[I]:=ASDKs[I];
  end;

  SaveStringToFile(ASuperObject.AsJSON,AConfigFilePath,TEncoding.UTF8);


end;



//function GetInfoPlistTemplateCustomNodeStr(AInfoPlistFilePath:String;var ACustomNodeStr:String):Boolean;
//var
//  ADataString:String;
//  AStartIndex:Integer;
//  AEndIndex:Integer;
//  AStringStream:TStringStream;
//begin
//  Result:=False;
//  ACustomNodeStr:='';
//
//  if FileExists(AInfoPlistFilePath) then
//  begin
//    AStringStream:=TStringStream.Create;
//    try
//      AStringStream.LoadFromFile(AInfoPlistFilePath);
//      ADataString:=AStringStream.DataString;
//
//      //再找到最后一个</dict>
//      AEndIndex:=0;
//      AStartIndex:=Pos('</dict>',ADataString,0);
//      while AStartIndex>0 do
//      begin
//        AEndIndex:=AStartIndex;
//        AStartIndex:=Pos('</dict>',ADataString,AEndIndex+1);
//      end;
//
//      if AEndIndex>0 then
//      begin
//
//        AStartIndex:=Pos('<%ExtraInfoPListKeys%>',ADataString);
//        if AStartIndex>0 then
//        begin
//          AStartIndex:=AStartIndex+Length('<%ExtraInfoPListKeys%>');
//          ACustomNodeStr:=Copy(ADataString,AStartIndex,AEndIndex-AStartIndex);
//
//          Result:=True;
//        end
//        else
//        begin
//          //不存在最后一个<%ExtraInfoPListKeys%>
//          DoDeployConfigLog(nil,'不存在<%ExtraInfoPListKeys%>');
//        end;
//
//      end
//      else
//      begin
//        //不存在最后一个</dict>
//        DoDeployConfigLog(nil,'不存在最后一个</dict>');
//      end;
//
//
//    finally
//      FreeAndNil(AStringStream);
//    end;
//  end;
//end;


procedure AddLibraryToAllIOSSDK(
                                //框架类型,
                                //比如Include Paths,0
                                //Library Paths,1
                                //Frameworks,2
                                APathType:Integer;
                                //框架名称,比如SystemConfiguration
                                APathName:String;
                                //路径,$(SDKROOT)/System/Library/Frameworks,$(SDKROOT)/usr/lib
                                APathDir:String;
                                //是否包含子路径,0,1
                                AIncludeSubDir:String
                                );
var
  ADelphiVersions:TStringList;
  APlatforms:TStringList;
  I: Integer;
  J:Integer;
begin
  ADelphiVersions:=GetInstalledDelphiVersions;
  try
    for I := 0 to ADelphiVersions.Count-1 do
    begin
      APlatforms:=GetInstalledPlatforms(ADelphiVersions[I]);
      try
        for J := 0 to APlatforms.Count-1 do
        begin
          if Copy(APlatforms[J],1,Length('iPhoneOS'))='iPhoneOS' then
          begin
            AddLibraryToIOSSDK(
                  ADelphiVersions[I],
                  APlatforms[J],
                  APathType,
                  APathName,
                  APathDir,
                  AIncludeSubDir
                  );
          end;
        end;
      finally
        FreeAndNil(APlatforms);
      end;
    end;
  finally
    FreeAndNil(ADelphiVersions);
  end;
end;

function GetInstalledPlatforms(ADelphiVersion:String):TStringList;
{$IFDEF MSWINDOWS}
var
  AKey:String;
  AReg:TRegistry;
{$ENDIF}
begin
  Result:=TStringList.Create;

  {$IFDEF MSWINDOWS}
  AReg:=TRegistry.Create;
  try
      AReg.RootKey:=HKEY_CURRENT_USER;


      AKey:='\Software\Embarcadero\BDS\'
              +ADelphiVersion+'\'
              +'PlatformSDKs'+'\';

      if AReg.OpenKey(AKey,True) then
      begin

          AReg.GetKeyNames(Result);

      end;
  finally
    FreeAndNil(AReg);
  end;
  {$ENDIF}
end;

function GetInstalledDelphiVersionsCommaText:String;
var
  ADelphiVersions:TStringList;
begin
  ADelphiVersions:=GetInstalledDelphiVersions;
  Result:=ADelphiVersions.CommaText;
  ADelphiVersions.Free;
end;

function GetInstalledDelphiVersions:TStringList;
{$IFDEF MSWINDOWS}
var
  AKey:String;
  AReg:TRegistry;
{$ENDIF}
begin
  Result:=TStringList.Create;

  {$IFDEF MSWINDOWS}
  AReg:=TRegistry.Create;
  try
      AReg.RootKey:=HKEY_CURRENT_USER;


      AKey:='\Software\Embarcadero\BDS\';

      if AReg.OpenKey(AKey,True) then
      begin

          AReg.GetKeyNames(Result);

      end;
  finally
    FreeAndNil(AReg);
  end;
  {$ENDIF}
end;



//HKEY_CURRENT_USER\Software\Embarcadero\BDS\
//18.0\
//PlatformSDKs
procedure AddLibraryToIOSSDK(
                            //Delphi的版本,比如18,0
                            ADelphiVersion:String;
                            //IOS SDK的版本号,比如iPhoneOS10.3.sdk
                            AIOS_SDK:String;
                            //框架类型,
                            //比如Include Paths,0
                            //Library Paths,1
                            //Frameworks,2
                            APathType:Integer;
                            //框架名称,比如SystemConfiguration,或者库名libicucore.tbd
                            APathName:String;
                            //路径,$(SDKROOT)/System/Library/Frameworks,$(SDKROOT)/usr/lib
                            APathDir:String;
                            //是否包含子路径,0,1
                            AIncludeSubDir:String
                            );
{$IFDEF MSWINDOWS}
var
  I: Integer;
  AKey:String;
  APathCount:Integer;
  AReg:TRegistry;
  AIsExists:Boolean;
  ATempStr:String;
  AKeyStringList:TStringList;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  //设置注册表
  AReg:=TRegistry.Create;
  AKeyStringList:=TStringList.Create;
  try
      AReg.RootKey:=HKEY_CURRENT_USER;


      AKey:='\Software\Embarcadero\BDS\'
              +ADelphiVersion+'\'
              +'PlatformSDKs'+'\'
              +AIOS_SDK+'\';

      //不需要创建
      if AReg.OpenKey(AKey,False) then
      begin

          AIsExists:=False;
          if AReg.ValueExists('PathCount') then
          begin
              try
                  APathCount:=AReg.ReadInteger('PathCount');


                  AReg.GetValueNames(AKeyStringList);
                  for I := 0 to AKeyStringList.Count-1 do
                  begin
                    if Copy(AKeyStringList[I],1,4)='Mask' then
                    begin

                        ATempStr:=Copy(AKeyStringList[I],5,MaxInt);

                        //取出值,比对是否存在
                        if AReg.ReadString(AKeyStringList[I])=APathName then
                        begin
                          //已经存在,不用添加了
                          AIsExists:=True;
                          Break;
                        end;


                    end;
                  end;


                  //注册表里没有
                  if Not AIsExists then
                  begin
                    AReg.WriteInteger('Type'+IntToStr(APathCount),APathType);
                    AReg.WriteString('Mask'+IntToStr(APathCount),APathName);
                    AReg.WriteString('Path'+IntToStr(APathCount),APathDir);
                    AReg.WriteString('IncludeSubDir'+IntToStr(APathCount),AIncludeSubDir);

                    AReg.WriteInteger('PathCount',APathCount+1);
                  end;
              except
                on E:Exception do
                begin
                  DoDeployConfigLog(nil,'AddLibraryToIOSSDK Error:'+E.Message);
                end;
              end;
          end
          else
          begin
              DoDeployConfigLog(nil,'AddLibraryToIOSSDK PathCount is not exist!');
          end;

      end
      else
      begin
          DoDeployConfigLog(nil,'AddLibraryToIOSSDK Open key "'+AKey+'" fail!');
      end;
  finally
    FreeAndNil(AReg);
    FreeAndNil(AKeyStringList);
  end;
  {$ENDIF}
end;

function GetAndroidPackageName(AAndroidManifestXmlFilePath:String):String;
var
  AXMLDocument: TXMLDocument;
  AXMLNode:IXMLNode;
begin
  Result:='';
  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
      AXMLDocument.LoadFromFile(AAndroidManifestXmlFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

      //<?xml version="1.0" encoding="utf-8"?>
      //<manifest xmlns:android="http://schemas.android.com/apk/res/android"
      //    package="tb.audio"
      //    android:versionCode="1"
      //    android:versionName="1.0" >

      Result:=AXMLNode.Attributes['package'];

  finally
    AXMLDocument.Free;
  end;

end;

//procedure CombineXML(AXMLAFilePath:String;AXMLBFilePath:String;ADestXMLFilePath:String);
//var
//  AXMLADocument: TXMLDocument;
//  AXMLBDocument: TXMLDocument;
//  AXMLANode: IXMLNode;
//  AXMLBNode: IXMLNode;
//  I: Integer;
//  AXMLNode:IXMLNode;
//begin
//  //创建XML文档
//  AXMLADocument:=TXMLDocument.Create(Application);
//  AXMLBDocument:=TXMLDocument.Create(Application);
//  try
//      AXMLADocument.LoadFromFile(AXMLAFilePath);
//      AXMLADocument.Active:=True;
//      AXMLANode:=AXMLADocument.DocumentElement;
//
//      AXMLBDocument.LoadFromFile(AXMLBFilePath);
//      AXMLBDocument.Active:=True;
//      AXMLBNode:=AXMLBDocument.DocumentElement;
//
//      //再把XMLB合进来
//      for I := 0 to AXMLBNode.ChildNodes.Count-1 do
//      begin
//
//          //判断是否存在重复的节点
//          AXMLNode:=FindSameAndroidResourceNode(AXMLANode,AXMLBNode.ChildNodes[I]);
//          if AXMLNode=nil then
//          begin
//              //不存在此名称的
//              //直接复制
//              AXMLANode.ChildNodes.Add(AXMLBNode.ChildNodes[I]);
//          end
//          else
//          begin
//              //已经存在此节点
//              DoDeployConfigLog(nil,GetLangString(['此XML节点已存在',
//                                                  'The xml node is not exist']));
//          end;
//
//      end;
//
//
//      AXMLADocument.SaveToFile(ADestXMLFilePath);
//
//  finally
//    AXMLADocument.Free;
//    AXMLBDocument.Free;
//  end;
//
//end;

procedure DoDeployConfigLog(Sender:TObject;const ALog:String);
begin
  uBaseLog_Copy.HandleException(nil,ALog);
  if Assigned(OnDeployConfigLog) then
  begin
    OnDeployConfigLog(Sender,ALog);
  end;
end;


//把相对目录转换成绝对目录
//.\baidumap\ 转换成 D:\aaa\baidumap\
function ConvertRelativePathToAbsolutePath(ABaseDirPath:String;ARelativePath:String):String;
var
  Dest:array [0..MAX_PATH] of char;
begin
  {$IFDEF MSWINDOWS}
  FillChar(Dest,MAX_PATH+1,0);
  PathCombine(Dest,PChar(ABaseDirPath), PChar(ARelativePath));
  Result:=string(Dest);
  {$ENDIF}
end;


//把绝对目录转换成相对目录
//D:\aaa\baidumap\ 转换成 .\baidumap\
function ConvertAbsolutePathToRelativePath(ABaseDirPath:String;AAbsolutePath:String):String;
var
  p: array[0..MAX_PATH] of Char;
begin
  ABaseDirPath:=ExtractFilePath(ABaseDirPath);

  {$IFDEF MSWINDOWS}
//  if FileExists(AAbsolutePath) then
  if AAbsolutePath[Length(AAbsolutePath)]='\' then
  begin
    //是目录
    PathRelativePathTo(p, PChar(ABaseDirPath), FILE_ATTRIBUTE_DIRECTORY, PChar(AAbsolutePath), FILE_ATTRIBUTE_DIRECTORY);
  end
  else
  begin
    //是文件
    PathRelativePathTo(p, PChar(ABaseDirPath), FILE_ATTRIBUTE_DIRECTORY, PChar(AAbsolutePath), FILE_ATTRIBUTE_NORMAL);
  end;
  {$ENDIF}



  Result := StrPas(p);

  if Copy(Result,1,2)='.\' then
  begin
    //去掉
    Result:=Copy(Result,3,MaxInt);
  end;
  
end;

procedure DoGetFileList(dirName:string;AFilePathList:TStringList);
var
  sr: TSearchRec;
  dLen: Integer;
  str: string;
begin
  dLen := length(dirName);
  if dirName[dLen] <> '\' then dirName := dirName + '\';
  if FindFirst(dirName + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
        if (sr.Name = '.') or (sr.Name = '..') then continue;
        str := dirname + sr.Name;

        if (sr.Attr and faDirectory) = faDirectory then
        begin
            DoGetFileList(str,AFilePathList);
        end
        else
        begin
            if sr.Name<>'Thumbs.db' then
            begin
              AFilePathList.Add(str);
            end;
        end;


    until FindNext(sr) <> 0;
    FindClose(sr);
  end;

end;

function GenerateJarBatStringList(ATempJarDirPath:String;

                                  AJDKDir:String;
                                  AAndroidSDKDir:String;
                                  AAndroidSDKPlatform:String;
                                  AAndroidSDKBuildTools:String;


                                  AJarFilePath:String;
                                  AUsedAndroidJars:TStrings;
                                  AJavaSourceFiles:TStrings;
                                  AAndroidPackageName:String;
                                  ATempDexedJarFilePath:String;

                                  ABatStringList:TStringList
                                  ):Boolean;
var
  I: Integer;
  ANeedJars:String;
begin

  Result:=False;

  ForceDirectories(ATempJarDirPath);


//  //生成Jar
//  //创建bat
//  Result:=TStringList.Create;


  //先删除临时文件

  //R_JAVA_TwitterLogin-dexed.jar
//  if ATempDexedJarFilePath<>'' then
//  begin
//    ABatStringList.Add('del '+'"'+ATempDexedJarFilePath+'"');
//  end;



  ABatStringList.Add('@echo off');
  ABatStringList.Add('cd '+ATempJarDirPath);
  ABatStringList.Add(Copy(ATempJarDirPath,1,2));
  ABatStringList.Add('');
  ABatStringList.Add('setlocal');
  ABatStringList.Add('');
  ABatStringList.Add('set JarOutName='+AJarFilePath);
  ABatStringList.Add('');
  ABatStringList.Add('set JDKDir='+AJDKDir);
  ABatStringList.Add('');
  ABatStringList.Add('set ANDROID='+AAndroidSDKDir);
  ABatStringList.Add('');
  ABatStringList.Add('set ANDROID_PLATFORM='+AAndroidSDKPlatform);
  ABatStringList.Add('');
  ABatStringList.Add('set ANDROID_BT='+AAndroidSDKBuildTools);
  ABatStringList.Add('');
  ABatStringList.Add('set DX_LIB=%ANDROID_BT%\lib');
  ABatStringList.Add('');
  ABatStringList.Add('set PROJ_DIR=%CD%');
  ABatStringList.Add('');
  ABatStringList.Add('set VERBOSE=0');
  ABatStringList.Add('');
  ABatStringList.Add('mkdir output 2> nul');
  ABatStringList.Add('');
  ABatStringList.Add('mkdir output\classes 2> nul');
  ABatStringList.Add('');
  ABatStringList.Add('if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose');
  ABatStringList.Add('');




  //编译多个java源文件,要写多条
//    ABatStringList.Add('"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp '
//          +' "%ANDROID_PLATFORM%\android.jar;%EMBO_LIB%\fmx.jar;" '
//          +' -d output\classes '
//          +'src\com\ggggcexx\orangeui\wxapi\*.java');

  ANeedJars:='';
  if AUsedAndroidJars<>nil then
  begin
      for I := 0 to AUsedAndroidJars.Count-1 do
      begin
        ANeedJars:=ANeedJars+AUsedAndroidJars[I]+';';
      end;
  end;



  //要编译哪些源码,输出到output目录
  for I := 0 to AJavaSourceFiles.Count-1 do
  begin
    ABatStringList.Add(
            '"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp '
//            +' "%ANDROID_PLATFORM%\android.jar;%EMBO_LIB%\fmx.jar;" '
          +' "'+ANeedJars+'" '

          //class文件输出目录
//          +' -d output\classes '
          +' -d '+'"'+ATempJarDirPath+'output\classes'+'"'

          //不能用引号"，不然java文件找不到
//          +'"'+AJavaSourceFiles[I]+'"'
          +' '+AJavaSourceFiles[I]+''
//            +'src\com\ggggcexx\orangeui\wxapi\*.java'

          );
    ABatStringList.Add('');
  end;




  ABatStringList.Add('if x%VERBOSE% == x1 SET VERBOSE_FLAG=v');
  ABatStringList.Add('');


//  ABatStringList.Add('"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C output\classes com');
  if Pos('.',AAndroidPackageName)>0 then
  begin
      //有com.**.***
      ABatStringList.Add('"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C '
                  +'"'+ATempJarDirPath+'output\classes'+'"'
                  //并不是每个jar都是com.****
    //              +' '+'com'
    //              com.gggcexx.orangeui
                  +' '+'.'//Copy(AAndroidPackageName,1,Pos('.',AAndroidPackageName)-1)
                  );
  end
  else
  begin
      //没有com.***.***,而是直接用jkm7ems
      ABatStringList.Add('"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C '
                  +'"'+ATempJarDirPath+'output\classes'+'"'
                  //并不是每个jar都是com.****
    //              +' '+'jkm7ems'
    //              jkm7ems
                  +' '+'.'//+AAndroidPackageName
                  );
  end;


  ABatStringList.Add('');
//  ABatStringList.Add('cd '+ATempDir);
//  ABatStringList.Add(Copy(ATempDir,1,2));
//  ABatStringList.Add('explorer.exe /e,'
//            +' /select, '+ATempDir+AJarFileName
////            +' /root, '+ATempDir
//
//            );
  ABatStringList.Add('');



  //调试
  ABatStringList.Add('');
  ABatStringList.Add('endlocal');


  ABatStringList.Add('');
//  ABatStringList.Add('pause');
  ABatStringList.Add('');
  ABatStringList.Add('');
  ABatStringList.Add('');
  ABatStringList.Add('');
  ABatStringList.Add('');
  ABatStringList.Add('');
  ABatStringList.Add('');




  Result:=True;

end;


procedure ReplaceStringList(AFrom:String;ATo:String;AStringList:TStrings);
var
  I: Integer;
begin
  for I := 0 to AStringList.Count-1 do
  begin
    AStringList[I]:=ReplaceStr(AStringList[I],AFrom,ATo);
  end;
end;



{ TDeployFile }

constructor TDeployFile.Create;
begin
  Platforms:=TDeployFilePlatformList.Create;
end;

destructor TDeployFile.Destroy;
begin
  FreeAndNil(Platforms);
  inherited;
end;

function TDeployFile.FindPlatform(APlatform: String): TDeployFilePlatform;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Platforms.Count-1 do
  begin
    if Self.Platforms[I].Platform_=APlatform then
    begin
      Result:=Self.Platforms[I];
      Break;
    end;
  end;
end;

function TDeployFile.PlatformsCommaText: String;
var
  I: Integer;
begin
  Result:='';
  for I := 0 to Self.Platforms.Count-1 do
  begin
    if I<>Self.Platforms.Count-1 then
    begin
      Result:=Result+Self.Platforms[I].Platform_+',';
    end
    else
    begin
      Result:=Result+Self.Platforms[I].Platform_;
    end;
  end;
end;

{ TDeployFilePlatformList }

function TDeployFilePlatformList.FindItemByPlatform(APlatform: String): TDeployFilePlatform;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
//    if Pos(LowerCase(APlatform),LowerCase(Self.Items[I].Platform_))>0 then
    if LowerCase(APlatform)=LowerCase(Self.Items[I].Platform_) then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TDeployFilePlatformList.GetItem(Index: Integer): TDeployFilePlatform;
begin
  Result:=TDeployFilePlatform(Inherited Items[Index]);
end;

{ TDeployFileList }

function TDeployFileList.FindItemByLocalName(ALocalName: String): TDeployFile;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].LocalName,ALocalName) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TDeployFileList.FindItemByRemoteName(ARemotePath: String;APlatform:String): TDeployFile;
var
  I: Integer;
  J:Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    for J := 0 to Items[I].Platforms.Count-1 do
    begin
      if (Items[I].Platforms[J].RemoteDir+Items[I].Platforms[J].RemoteName=ARemotePath)
        and (Items[I].Platforms[J].Platform_=APlatform) then
      begin
        Result:=Items[I];
        Break;
      end;
    end;
  end;
end;

function TDeployFileList.GetItem(Index: Integer): TDeployFile;
begin
  Result:=TDeployFile(Inherited Items[Index]);
end;


//{ TDeployConfigList }
//
//function TDeployConfigList.GetItem(Index: Integer): TDeployConfig;
//begin
//  Result:=TDeployConfig(Inherited Items[Index]);
//end;

{ TProjectConfig }

//function AddDeployFileToXMLNodeWithPlatform():Boolean;
//begin
//
//end;

function TProjectConfig.AddDeployFilePlatformToXMLNode(ADeployFile: TDeployFile;
                                            ADeployFilePlatform:TDeployFilePlatform;
                                            ADeployFileXMLNode: IXMLNode): Boolean;
var
  ADeployFilePlatformXMLNode:IXMLNode;
  ARemoteDirNode:IXMLNode;
  ARemoteNameNode:IXMLNode;
  APlatformOverwriteNode:IXMLNode;
  APlatformEnabledNode:IXMLNode;
begin

      Result:=False;


      //判断这个本地文件是否存在
      ADeployFilePlatformXMLNode:=FindDeployFilePlatformXMLNode(
                                      ADeployFilePlatform.Platform_,
                                      ADeployFileXMLNode);
      if ADeployFilePlatformXMLNode=nil then
      begin
        ADeployFilePlatformXMLNode:=ADeployFileXMLNode.AddChild('Platform');
      end;
      //哪个平台
      ADeployFilePlatformXMLNode.Attributes['Name']:=ADeployFilePlatform.Platform_;



      //布署到哪个目录
      ARemoteDirNode:=ADeployFilePlatformXMLNode.ChildNodes.FindNode('RemoteDir');
      //FindChildXMLNode('RemoteDir',ADeployFilePlatformXMLNode);
      if ARemoteDirNode=nil then
      begin
        ARemoteDirNode:=ADeployFilePlatformXMLNode.AddChild('RemoteDir');
      end;
      //如果之前是布署到res\drawable\,现在要布署到res\drawable-hdpi\
      ARemoteDirNode.Text:=ADeployFilePlatform.RemoteDir;



      //布署到远程目录中的哪个文件
      ARemoteNameNode:=ADeployFilePlatformXMLNode.ChildNodes.FindNode('RemoteName');
      //FindChildXMLNode('RemoteName',ADeployFilePlatformXMLNode);
      if ARemoteNameNode=nil then
      begin
        ARemoteNameNode:=ADeployFilePlatformXMLNode.AddChild('RemoteName');
      end;
      ARemoteNameNode.Text:=ADeployFilePlatform.RemoteName;




      //是否覆盖
      APlatformOverwriteNode:=ADeployFilePlatformXMLNode.ChildNodes.FindNode('Overwrite');
      //FindChildXMLNode('Overwrite',ADeployFilePlatformXMLNode);
      if APlatformOverwriteNode=nil then
      begin
        APlatformOverwriteNode:=ADeployFilePlatformXMLNode.AddChild('Overwrite');
      end;
      APlatformOverwriteNode.Text:=ADeployFilePlatform.Overwrite;


      //是否启用
      if ADeployFilePlatform.Enabled<>'' then
      begin
        APlatformEnabledNode:=ADeployFilePlatformXMLNode.ChildNodes.FindNode('Enabled');
        if APlatformEnabledNode=nil then
        begin
          APlatformEnabledNode:=ADeployFilePlatformXMLNode.AddChild('Enabled');
        end;
        APlatformEnabledNode.Text:=ADeployFilePlatform.Enabled;
      end;


      Result:=True;

end;

function TProjectConfig.AddDeployFileToXMLNode(ADeployFile: TDeployFile;
  AXMLNode: IXMLNode): Boolean;
var
  ALastDeployFileNodeIndex:Integer;
  ADeployFileXMLNode:IXMLNode;
//  ADeployFilePlatformXMLNode:IXMLNode;
  I: Integer;
//  ARemoteDirNode:IXMLNode;
//  ARemoteNameNode:IXMLNode;
//  APlatformOverwriteNode:IXMLNode;
//  APlatformEnabledNode:IXMLNode;
begin
  //不存在,则添加
  //添加到最后一个
  ALastDeployFileNodeIndex:=FindLastChildXMLNodeIndex('DeployFile',AXMLNode);
  ADeployFileXMLNode:=AXMLNode.AddChild('DeployFile',ALastDeployFileNodeIndex);




  //不需要Configuration,因为都是Debug+Release
  ADeployFileXMLNode.Attributes['LocalName']:=ADeployFile.LocalName;
  ADeployFileXMLNode.Attributes['Class']:=ADeployFile.Class_;





  //<Platform Name="Android">
  //    <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
  //    <RemoteName>libTbDemuxer.so</RemoteName>
  //    <Overwrite>true</Overwrite>
  //</Platform>
  //这个文件要布署到哪些平台
  for I := 0 to ADeployFile.Platforms.Count-1 do
  begin


    AddDeployFilePlatformToXMLNode(ADeployFile,
                                   ADeployFile.Platforms[I],
                                   ADeployFileXMLNode
                                    );

  end;
end;



procedure TProjectConfig.CheckAndroidManifestTemplateXmlFile(AProjectFilePath: String);
var
  AFileContentList:TStringList;
begin
  if not FileExists(ExtractFilePath(AProjectFilePath)+'AndroidManifest.template.xml') then
  begin
    AFileContentList:=TStringList.Create;

    AFileContentList.Add('<?xml version="1.0" encoding="utf-8"?>');
    AFileContentList.Add('<!-- BEGIN_INCLUDE(manifest) -->');
    AFileContentList.Add('<manifest xmlns:android="http://schemas.android.com/apk/res/android"');
    AFileContentList.Add('        package="%package%"');
    AFileContentList.Add('        android:versionCode="%versionCode%"');
    AFileContentList.Add('        android:versionName="%versionName%"');
    AFileContentList.Add('        android:installLocation="%installLocation%">');
    AFileContentList.Add('                                                     ');
    AFileContentList.Add('    <uses-sdk android:minSdkVersion="%minSdkVersion%" android:targetSdkVersion="%targetSdkVersion%" />');
    AFileContentList.Add('    <%uses-permission%>');
    AFileContentList.Add('    <uses-feature android:glEsVersion="0x00020000" android:required="True"/>');
    AFileContentList.Add('    <application android:persistent="%persistent%"');
    AFileContentList.Add('        android:restoreAnyVersion="%restoreAnyVersion%"');
    AFileContentList.Add('        android:label="%label%"');
    AFileContentList.Add('        android:debuggable="%debuggable%"');
    AFileContentList.Add('        android:largeHeap="%largeHeap%"');
    AFileContentList.Add('        android:icon="%icon%"');
    AFileContentList.Add('        android:theme="%theme%"');
    AFileContentList.Add('        android:hardwareAccelerated="%hardwareAccelerated%"');
    AFileContentList.Add('        android:resizeableActivity="false">');
    AFileContentList.Add('                                            ');
    AFileContentList.Add('        <%provider%>');
    AFileContentList.Add('        <%application-meta-data%>');
    AFileContentList.Add('        <%services%>');
    AFileContentList.Add('        <!-- Our activity is a subclass of the built-in NativeActivity framework class.');
    AFileContentList.Add('             This will take care of integrating with our NDK code. -->');
    AFileContentList.Add('        <activity android:name="com.embarcadero.firemonkey.FMXNativeActivity"');
    AFileContentList.Add('                android:label="%activityLabel%"');
    AFileContentList.Add('                android:configChanges="orientation|keyboard|keyboardHidden|screenSize"');
    AFileContentList.Add('                android:launchMode="singleTask">');
    AFileContentList.Add('            <!-- Tell NativeActivity the name of our .so -->');
    AFileContentList.Add('            <meta-data android:name="android.app.lib_name"');
    AFileContentList.Add('                android:value="%libNameValue%" />');
    AFileContentList.Add('            <intent-filter>');
    AFileContentList.Add('                <action android:name="android.intent.action.MAIN" />');
    AFileContentList.Add('                <category android:name="android.intent.category.LAUNCHER" />');
    AFileContentList.Add('            </intent-filter>');
    AFileContentList.Add('        </activity>');
    AFileContentList.Add('        <%activity%>');
    AFileContentList.Add('        <%receivers%>');
    AFileContentList.Add('    </application>');
    AFileContentList.Add('</manifest>');
    AFileContentList.Add('<!-- END_INCLUDE(manifest) -->');


    AFileContentList.SaveToFile(ExtractFilePath(AProjectFilePath)+'AndroidManifest.template.xml',TEncoding.UTF8);
    AFileContentList.Free;
  end;

end;

procedure TProjectConfig.CheckEntitlementTemplateiOSXmlFile(AProjectFilePath: String);
var
  AFileContentList:TStringList;
begin
  if not FileExists(ExtractFilePath(AProjectFilePath)+'Entitlement.TemplateiOS.xml') then
  begin
    AFileContentList:=TStringList.Create;



    AFileContentList.Add('<?xml version="1.0" encoding="UTF-8"?>');
    AFileContentList.Add('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">');
    AFileContentList.Add('<plist version="1.0">');
    AFileContentList.Add('<dict>');
    AFileContentList.Add('	<%getTaskAllowKey%>');
    AFileContentList.Add('	<%applicationIdentifier%>');
    AFileContentList.Add('	<%pushNotificationKey%>');
    AFileContentList.Add('	<%keychainAccessGroups%>');
    AFileContentList.Add('</dict>');
    AFileContentList.Add('</plist>');



    AFileContentList.SaveToFile(ExtractFilePath(AProjectFilePath)+'Entitlement.TemplateiOS.xml',TEncoding.UTF8);
    AFileContentList.Free;
  end;


end;

procedure TProjectConfig.CheckInfoPlistTemplateiOSXmlFile(AProjectFilePath:String);
var
  AFileContentList:TStringList;
begin
  if not FileExists(ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml') then
  begin
    AFileContentList:=TStringList.Create;


    AFileContentList.Add('<?xml version="1.0" encoding="UTF-8"?>');
    AFileContentList.Add('<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">');
    AFileContentList.Add('<plist version="1.0">');
    AFileContentList.Add('<dict>');
    AFileContentList.Add('<%VersionInfoPListKeys%>');
    AFileContentList.Add('<%ExtraInfoPListKeys%>');
    AFileContentList.Add('</dict>');
    AFileContentList.Add('</plist>');


    AFileContentList.SaveToFile(ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml',TEncoding.UTF8);
    AFileContentList.Free;
  end;
end;

//function TProjectConfig.ClearIOSLaunchImageToProject(AProjectFilePath: String): Boolean;
//var
//  AXMLNode: IXMLNode;
//  AXMLChildNode: IXMLNode;
//  AXMLDocument: TXMLDocument;
//  I: Integer;
//begin
//  Result:=False;
//
//  //因为需要计算出相对目录
//  if (AProjectFilePath='') then
//  begin
//    DoDeployConfigLog(nil,
//                    GetLangString(['请选择工程文件','Please select projet file'])
//                    );
//    Exit;
//  end;
//
//  if Not FileExists(AProjectFilePath) then
//  begin
//    DoDeployConfigLog(nil,
//                        //'工程文件不存在'
//                        GetLangString(['工程文件不存在','Projet file is not exist'])
//                        );
//    Exit;
//  end;
//
//
//
//
//  //创建XML文档
//  AXMLDocument:=TXMLDocument.Create(Application);
//  try
//      AXMLDocument.LoadFromFile(AProjectFilePath);
//      AXMLDocument.Active:=True;
//      AXMLNode:=AXMLDocument.DocumentElement;
//
////    <PropertyGroup Condition="'$(Cfg_2_Android)'!=''">
////        <PF_KeyStorePass>857E479A5FCF07DFCF26E560A4467BA2E44808467EBBECAD97E40FA78E273CF6DB5EA3DEE3551C63C1A4572EFACFC36ABAB3361C046522D316204584E58822A2C958F35CD507FA8FBFBAAF0007301D44921D3E131DF90939EB006E7F</PF_KeyStorePass>
////        <PF_AliasKey>police</PF_AliasKey>
////        <PF_KeyStore>E:\MyFiles\OrangeUIProduct\粤警党风\APP\police_138575wangneng.keystore</PF_KeyStore>
////        <PF_AliasKeyPass>857E479A5FCF07DFCF26E560D171E33F81850535A05F97C997AA0FF88E783C8ADB56A385E3111C2FC1E2577DFAC4C363BA95367E043722D3163A459DE5E4229DC938F341D558FA9BBFF8AF117237859AF7D53319C3477255EB006E7F</PF_AliasKeyPass>
////        <BT_BuildType>AppStore</BT_BuildType>
//
////        <Android_LauncherIcon36>android36.png</Android_LauncherIcon36>
////        <Android_LauncherIcon48>android48.png</Android_LauncherIcon48>
////        <Android_LauncherIcon72>android72.png</Android_LauncherIcon72>
////        <Android_LauncherIcon96>android96.png</Android_LauncherIcon96>
//
////        <Android_LauncherIcon144>android144.png</Android_LauncherIcon144>
//
////        <VerInfo_Build>1</VerInfo_Build>
////        <Android_SplashTileMode>disabled</Android_SplashTileMode>
////        <Android_SplashGravity>fill</Android_SplashGravity>
//
////        <Android_SplashImage426>android_fill_426x320.png</Android_SplashImage426>
////        <Android_SplashImage470>android_fill_470x320.png</Android_SplashImage470>
////        <Android_SplashImage640>android_fill_640x480.png</Android_SplashImage640>
////        <Android_SplashImage960>android_fill_960x720.png</Android_SplashImage960>
//
////        <VerInfo_Keys>package=com.ggggcexx.policepartywind;label=粤警党风;versionCode=1;versionName=1.2.0;persistent=False;restoreAnyVersion=False;installLocation=auto;largeHeap=False;theme=TitleBar;hardwareAccelerated=true;apiKey=</VerInfo_Keys>
////    </PropertyGroup>
//
////                <DeployFile LocalName="android144.png" Configuration="Release" Class="Android_LauncherIcon144">
////                    <Platform Name="Android">
////                        <RemoteName>ic_launcher.png</RemoteName>
////                        <Overwrite>true</Overwrite>
////                    </Platform>
////                </DeployFile>
//
//
//
////    <PropertyGroup Condition="'$(Cfg_2_iOSDevice32)'!=''">
////        <VerInfo_MinorVer>2</VerInfo_MinorVer>
////        <PF_AutoMobileProvisionAdHoc>False</PF_AutoMobileProvisionAdHoc>
////        <PF_MobileProvisionAdHoc>2f334ed2-a196-42bd-8a75-fd893d9fe907</PF_MobileProvisionAdHoc>
////        <PF_DevAdHoc>iPhone Distribution: silin fang (L7K5FEPWXY)</PF_DevAdHoc>
////        <PF_AutoCertificateAdHoc>False</PF_AutoCertificateAdHoc>
////        <PF_DevDebug>iPhone Developer: silin fang (2K9E4G72YV)</PF_DevDebug>
////        <PF_AutoCertificateDebug>False</PF_AutoCertificateDebug>
////        <PF_AutoMobileProvisionDebug>False</PF_AutoMobileProvisionDebug>
////        <VerInfo_UIDeviceFamily>iPhoneAndiPad</VerInfo_UIDeviceFamily>
////        <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
////        <VerInfo_BundleId>com.ggggcexx.policepartywind</VerInfo_BundleId>
////        <PF_MobileProvisionDebug>fe1056dd-7240-4fda-8aff-4af81ceeb5b8</PF_MobileProvisionDebug>
////
////        <iPad_SpotLight40>iphone40.png</iPad_SpotLight40>
////        <iPad_SpotLight50>iphone50.png</iPad_SpotLight50>
////        <iPad_SpotLight80>iphone80.png</iPad_SpotLight80>
////        <iPad_SpotLight100>iphone100.png</iPad_SpotLight100>
////        <iPhone_Spotlight29>iphone29.png</iPhone_Spotlight29>
////        <iPhone_Spotlight40>iphone40.png</iPhone_Spotlight40>
////        <iPhone_Spotlight58>iphone58.png</iPhone_Spotlight58>
////        <iPhone_Spotlight80>iphone80.png</iPhone_Spotlight80>
////
////        <iPad_Setting29>iphone29.png</iPad_Setting29>
////        <iPad_Setting58>iphone58.png</iPad_Setting58>
////
////        <iPhone_AppIcon57>iphone57.png</iPhone_AppIcon57>
////        <iPhone_AppIcon60>iphone60.png</iPhone_AppIcon60>
////        <iPhone_AppIcon87>iphone87.png</iPhone_AppIcon87>
////        <iPhone_AppIcon114>iphone114.png</iPhone_AppIcon114>
////        <iPhone_AppIcon120>iphone120.png</iPhone_AppIcon120>
////        <iPhone_AppIcon180>iphone180.png</iPhone_AppIcon180>
////        <iPad_AppIcon72>iphone72.png</iPad_AppIcon72>
////        <iPad_AppIcon76>iphone76.png</iPad_AppIcon76>
////        <iPad_AppIcon144>ipad144.png</iPad_AppIcon144>
////        <iPad_AppIcon152>ipad152.png</iPad_AppIcon152>
////
////        <iPad_Setting29>iphone29.png</iPad_Setting29>
////        <iPad_Setting58>iphone58.png</iPad_Setting58>
////
////        <iPad_Launch768>ipad768_1004.png</iPad_Launch768>
////        <iPad_Launch768x1024>ipad768_1024.png</iPad_Launch768x1024>
////        <iPad_Launch1024>ipad1024_748.png</iPad_Launch1024>
////        <iPad_Launch1024x768>ipad1024_768.png</iPad_Launch1024x768>
////        <iPad_Launch1536>ipad1536_2008.png</iPad_Launch1536>
////        <iPad_Launch1536x2048>ipad1536_2048.png</iPad_Launch1536x2048>
////        <iPad_Launch2048>ipad2048_1496.png</iPad_Launch2048>
////        <iPad_Launch2048x1536>ipad2048_1536.png</iPad_Launch2048x1536>
////
////        <iPhone_Launch320>iphone320_480.png</iPhone_Launch320>
////        <iPhone_Launch640>iphone640_960.png</iPhone_Launch640>
////        <iPhone_Launch640x1136>iphone640_1136.png</iPhone_Launch640x1136>
////        <iPhone_Launch750>iphone750_1334.png</iPhone_Launch750>
////        <iPhone_Launch1242>iphone1242_2208.png</iPhone_Launch1242>
////        <iPhone_Launch2208>iphone2208_1242.png</iPhone_Launch2208>
////
////        <VerInfo_Keys>
////            CFBundleName=$(MSBuildProjectName);
////            CFBundleDevelopmentRegion=en;
////            CFBundleDisplayName=粤警党风;
////            CFBundleIdentifier=com.ggggcexx.policepartywind;
////            CFBundleInfoDictionaryVersion=7.1;
////            CFBundleVersion=1.2.0;
////            CFBundlePackageType=APPL;
////            CFBundleSignature=????;
////            LSRequiresIPhoneOS=true;
////            CFBundleAllowMixedLocalizations=YES;
////            CFBundleExecutable=$(MSBuildProjectName);
////            UIDeviceFamily=iPhone &amp; iPad;
////            CFBundleResourceSpecification=ResourceRules.plist;
////            NSLocationAlwaysUsageDescription=The reason for accessing the location information of the user;
////            NSLocationWhenInUseUsageDescription=The reason for accessing the location information of the user;
////            FMLocalNotificationPermission=false;
////            UIBackgroundModes=;
////            DTSDKName=iphoneos7.0;
////            DTPlatformVersion=7.0;
////            UIStatusBarStyle=UIStatusBarStyleLightContent;
////            DTPlatFormName=iphoneos;
////            NSContactsUsageDescription=The reason for accessing the contacts;
////            NSPhotoLibraryUsageDescription=The reason for accessing the photo library;
////            NSCameraUsageDescription=The reason for accessing the camera</VerInfo_Keys>
////    </PropertyGroup>
//
//
////      AXMLNode:=AXMLDocument.DocumentElement;
////      if AXMLNode<>nil then
////      begin
////        for I := 0 to AXMLNode.ChildNodes.Count-1 do
////        begin
////          AXMLChildNode:=AXMLNode.ChildNodes[I];
////
////
//////            //Android
//////            if (AXMLChildNode.NodeName='PropertyGroup')
//////              and (
//////                   (AXMLChildNode.Attributes['Condition']='''$(Base_Android)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_Android)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_Android)''!=''''')
//////                ) then
//////            begin
//////
//////              SaveProjectPictureToProjectXMLNode(426,320,'Android_SplashImage426',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(470,320,'Android_SplashImage470',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(640,480,'Android_SplashImage640',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(960,720,'Android_SplashImage960',AXMLNode.ChildNodes[I]);
//////
//////            end;
////
////
//////            //IOS
//////            if (AXMLChildNode.NodeName='PropertyGroup')
//////              and (
//////                   (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice32)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice32)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice32)''!=''''')
//////
//////                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice64)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice64)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice64)''!=''''')
//////
//////                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSSimulator)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSSimulator)''!=''''')
//////                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSSimulator)''!=''''')
//////                ) then
//////            begin
//////    //        <iPad_Launch768>ipad768_1004.png</iPad_Launch768>
//////    //        <iPad_Launch768x1024>ipad768_1024.png</iPad_Launch768x1024>
//////    //        <iPad_Launch1024>ipad1024_748.png</iPad_Launch1024>
//////    //        <iPad_Launch1024x768>ipad1024_768.png</iPad_Launch1024x768>
//////    //        <iPad_Launch1536>ipad1536_2008.png</iPad_Launch1536>
//////    //        <iPad_Launch1536x2048>ipad1536_2048.png</iPad_Launch1536x2048>
//////    //        <iPad_Launch2048>ipad2048_1496.png</iPad_Launch2048>
//////    //        <iPad_Launch2048x1536>ipad2048_1536.png</iPad_Launch2048x1536>
//////    //
//////    //        <iPhone_Launch320>iphone320_480.png</iPhone_Launch320>
//////    //        <iPhone_Launch640>iphone640_960.png</iPhone_Launch640>
//////    //        <iPhone_Launch640x1136>iphone640_1136.png</iPhone_Launch640x1136>
//////    //        <iPhone_Launch750>iphone750_1334.png</iPhone_Launch750>
//////    //        <iPhone_Launch1242>iphone1242_2208.png</iPhone_Launch1242>
//////    //        <iPhone_Launch2208>iphone2208_1242.png</iPhone_Launch2208>
//////
//////              SaveProjectPictureToProjectXMLNode(768,1004,'iPad_Launch768',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(768,1024,'iPad_Launch768x1024',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(1024,748,'iPad_Launch1024',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(1024,768,'iPad_Launch1024x768',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(1536,2008,'iPad_Launch1536',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(1536,2048,'iPad_Launch1536x2048',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(2048,1496,'iPad_Launch2048',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(2048,1536,'iPad_Launch2048x1536',AXMLNode.ChildNodes[I]);
//////
//////              SaveProjectPictureToProjectXMLNode(320,480,'iPhone_Launch320',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(640,960,'iPhone_Launch640',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(640,1136,'iPhone_Launch640x1136',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(750,1334,'iPhone_Launch750',AXMLNode.ChildNodes[I]);
//////
//////              SaveProjectPictureToProjectXMLNode(1242,2208,'iPhone_Launch1242',AXMLNode.ChildNodes[I]);
//////              SaveProjectPictureToProjectXMLNode(2208,1242,'iPhone_Launch2208',AXMLNode.ChildNodes[I]);
//////
//////
//////            end;
////
////
////
////        end;
////      end;
//
//
//
//
//
//
//      AXMLNode:=AXMLNode.ChildNodes.FindNode('ProjectExtensions');
//      if AXMLNode<>nil then
//      begin
//        AXMLNode:=AXMLNode.ChildNodes.FindNode('BorlandProject');
//        if AXMLNode<>nil then
//        begin
//          AXMLNode:=AXMLNode.ChildNodes.FindNode('Deployment');
//          if (AXMLNode<>nil) then
//          begin
//            if (AXMLNode.Attributes['Version']='3') then
//            begin
//
//                    //把IOS的启动图片都删除掉
////
////                <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPad\FM_LaunchImagePortrait_1536x2008.png" Configuration="Release" Class="iPad_Launch1536"/>
////                <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPad\FM_LaunchImageLandscape_2388x1668.png" Configuration="Release" Class="iPad_Launch2388x1668">
////                    <Platform Name="iOSDevice64">
////                        <RemoteName>Default-Landscape-1668w-2388h@2x~ipad.png</RemoteName>
////                        <Overwrite>true</Overwrite>
////                    </Platform>
////                </DeployFile>
////                <DeployFile LocalName="640x1136.png" Configuration="Release" Class="iPhone_Launch640x1136">
////                    <Platform Name="iOSDevice64">
////                        <RemoteName>Default-568h@2x.png</RemoteName>
////                        <Overwrite>true</Overwrite>
////                    </Platform>
////                </DeployFile>
//
//                    for I := AXMLNode.ChildNodes.Count-1 downto 0 do
//                    begin
//                        AXMLChildNode:=AXMLNode.ChildNodes[I];
//
//                        if (AXMLChildNode.NodeName='DeployFile')
//                           and
//                              ((Pos('iPad_Launch',AXMLChildNode.Attributes['Class'])>0)
//                              or (Pos('iPhone_Launch',AXMLChildNode.Attributes['Class'])>0)) then
//                        begin
//
//                            AXMLNode.ChildNodes.Delete(I);
//                        end;
//
//                    end;
//
//                    Result:=True;
//
//            end
//            else
//            begin
//              DoDeployConfigLog(nil,GetLangString(['不支持此Deployment版本', 'not support this Deployment version']));
//                                    //'不支持此Deployment版本');
//            end;
//          end
//          else
//          begin
//            DoDeployConfigLog(nil,GetLangString(['不存在Deployment节点','Deployment node is not exist']));
//                                    //'不存在Deployment节点');
//          end;
//          end
//        else
//        begin
//          DoDeployConfigLog(nil,GetLangString(['不存在BorlandProject节点','BorlandProject node is not exist']));
//                                    //'不存在BorlandProject节点');
//        end;
//      end
//      else
//      begin
//        DoDeployConfigLog(nil,GetLangString(['不存在ProjectExtensions节点','ProjectExtensions node is not exist']));
//                                    //'不存在ProjectExtensions节点');
//      end;
//
//
//      AXMLDocument.SaveToFile(AProjectFilePath);
//  finally
//    AXMLDocument.Free;
//  end;
//
//
//end;

constructor TProjectConfig.Create;
begin

  FCurrentDeployFileList:=TDeployFileList.Create;
  FDeployConfigList:=TDeployConfigList.Create;
  FAndroidJarList:=TStringList.Create;
  FAndroidAarList:=TStringList.Create;
  FAndroidVariableList:=TConfigVariableList.Create;
  FAndroidUsersPermissions:=TStringList.Create;
  FAndroidApplicationChildNodes:=TStringList.Create;

  FIOSPlistRootNodes:=TStringList.Create;

  {$IFDEF MSWINDOWS}
  //XML要用到
  ActiveX.CoInitialize(nil);
  {$ENDIF}
end;

destructor TProjectConfig.Destroy;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoUnInitialize();
  {$ENDIF}


  FreeAndNil(FAndroidApplicationChildNodes);
  FreeAndNil(FAndroidUsersPermissions);
  FreeAndNil(FCurrentDeployFileList);
  FreeAndNil(FDeployConfigList);
  FreeAndNil(FAndroidJarList);
  FreeAndNil(FAndroidAarList);
  FreeAndNil(FAndroidVariableList);

  FreeAndNil(FIOSPlistRootNodes);
  inherited;
end;

//function TProjectConfig.FindChildXMLNode(ANodeName: String;AXMLNode: IXMLNode): IXMLNode;
//var
//  I: Integer;
//begin
//  Result:=nil;
//
//  for I := 0 to AXMLNode.ChildNodes.Count-1 do
//  begin
//      if (AXMLNode.ChildNodes[I].NodeName=ANodeName) then
//      begin
//          Result:=AXMLNode.ChildNodes[I];
//          Break;
//      end;
//  end;
//
//end;

function FindLastChildXMLNodeIndex(ANodeName: String;AXMLNode: IXMLNode): Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANodeName) then
      begin
          Result:=I;
      end;
  end;

end;

function FindChildXMLNodeIndex(ANodeName:String;
                               ANodeText:String;
                               AXMLNode: IXMLNode):Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANodeName)
        and (AXMLNode.ChildNodes[I].Text=ANodeText) then
      begin
          Result:=I;
          Break;
      end;
  end;
end;

function FindKeyValueNode(ADictNode: IXMLNode;AKey:String):IXMLNode;
var
  AFindNodeIndex:Integer;
begin
  Result:=nil;

  AFindNodeIndex:=FindChildXMLNodeIndex('key',AKey,ADictNode);
  if (AFindNodeIndex<>-1) and (AFindNodeIndex+1<ADictNode.ChildNodes.Count) then
  begin
      Result:=ADictNode.ChildNodes[AFindNodeIndex+1];
  end;
end;

procedure CopyXMLNode(ASrcNode:IXMLNode;ADestNode:IXMLNode);
var
  I: Integer;
  AChildNode:IXMLNode;
begin
  if ASrcNode.IsTextElement then
  begin
    ADestNode.Text:=ASrcNode.Text;
  end
  else
  begin
      //只复制子节点
      for I := 0 to ASrcNode.ChildNodes.Count-1 do
      begin
        AChildNode:=ADestNode.AddChild(ASrcNode.ChildNodes[I].NodeName);
        if ASrcNode.ChildNodes[I].IsTextElement then
        begin
          AChildNode.Text:=ASrcNode.ChildNodes[I].Text;
        end
        else
        begin
          CopyXMLNode(ASrcNode.ChildNodes[I],AChildNode);
        end;
      end;
  end;
end;

function FindSameAndroidResourceNode(AXMLNode: IXMLNode;ANeedFindXMLNode:IXMLNode): IXMLNode;
var
  I:Integer;
begin
  Result:=nil;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANeedFindXMLNode.NodeName)

        //values.xml
        and (
              ANeedFindXMLNode.HasAttribute('name')
              and AXMLNode.ChildNodes[I].HasAttribute('name')
              and (AXMLNode.ChildNodes[I].Attributes['name']=ANeedFindXMLNode.Attributes['name'])
              )
       then
      begin
          Result:=AXMLNode.ChildNodes[I];
          Break;
      end;
  end;



//  if AXMLNode=nil then
//  begin
//      //不存在此名称的
//      //直接复制
//      Exit;
//  end
//  else
//  begin
//      //存在重名的,但是Attribute可能不一样
//      if ANeedFindXMLNode.HasAttribute('name')
//        and (FindSameNameButDiffAttrNode(ANeedFindXMLNode.NodeName,
//                                      'name',
//                                      ANeedFindXMLNode.Attributes['name'],
//                                      AXMLNode)=nil)
//                                      then
//      begin
//        //不相同,复制
//        ADestXMLNode.ChildNodes.Add(AXMLNode);
//      end;
//
//
//  end;

end;

//function FindSameNameButDiffAttrNode(ANodeName: String;
//                                      AAttrName:String;
//                                      AAttrValue:Variant;
//                                      AXMLNode: IXMLNode): IXMLNode;
//var
//  I: Integer;
//begin
//  Result:=nil;
//
//  for I := 0 to AXMLNode.ChildNodes.Count-1 do
//  begin
//      if (AXMLNode.ChildNodes[I].NodeName=ANodeName)
//      and (AXMLNode.ChildNodes[I].Attributes[AAttrName]=AAttrValue)
//       then
//      begin
//          Result:=AXMLNode.ChildNodes[I];
//      end;
//  end;
//
//end;

function GenerateJarBatToProject(ATempJarDirPath:String;

                                  AJDKDir:String;
                                  AAndroidSDKDir:String;
                                  AAndroidSDKPlatform:String;
                                  AAndroidSDKBuildTools:String;


                                  AJarFilePath:String;
                                  AUsedAndroidJars:TStrings;
                                  AJavaSourceFiles:TStrings;
                                  AGenJarBatFilePath:String;
                                  AAndroidPackageName:String;
                                  ATempDexedJarFilePath:String): Boolean;
var
  AJarBatList:TStringList;
begin
  AJarBatList:=TStringList.Create;


  //生成jar
  GenerateJarBatStringList(ATempJarDirPath,

                            AJDKDir,
                            AAndroidSDKDir,
                            AAndroidSDKPlatform,
                            AAndroidSDKBuildTools,


                            AJarFilePath,
                            AUsedAndroidJars,
                            AJavaSourceFiles,
                            AAndroidPackageName,
                            ATempDexedJarFilePath,
                            AJarBatList
                            );

  //保存到文件
  AJarBatList.SaveToFile(AGenJarBatFilePath);

  AJarBatList.Free;

  {$IFDEF MSWINDOWS}
  ShellExecute(0, nil, PChar(AGenJarBatFilePath), nil, nil, SW_SHOWMAXIMIZED);
  {$ENDIF}

end;

function GenerateResJavaBatString(
                            //R.java生成后放在哪个目录
                            AGenResJavaSrcDirPath:String;
                            //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt
                            AAndroidSDKAaptExeFilePath:String;
                            //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar
                            AAndroidSystemJarFilePath:String;
                            //res目录
                            AProjectResPath:String;
                            //需要生成多少个R.java
                            AAndroidManifestXmlFilePath:String;
//                            //Main.Gen_R_Java.bat
//                            AGenRJavaBatFilePath:String;

                            var AGenR_Java_Command:String
                            ):Boolean;
{$IFDEF MSWINDOWS}
var
  AAnsiGenR_Java_Command:AnsiString;
{$ENDIF MSWINDOWS}
begin
  Result:=False;


//  //生成bat
//  Result:=TStringList.Create;

  //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt.exe
  //package -f -m

  //生成R.java的路径
  //-J E:\test

  //根据res目录来生成,后面不能有\,不然生成不了
  //-S res

  //所需要引用的android.jar
  //-I C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar

  //根据这个项目的程序清单文件
  //-M AndroidManifest.xml



  //对应每个aar也要生成R.java
//  AGenR_JavaBatList.Add('CD '+ExtractFilePath(AAndroidManifestXmlFilePath));
//  AGenR_JavaBatList.Add(Copy(AAndroidManifestXmlFilePath,1,2));


//  ABatStringList.Add('ECHO AGenResJavaSrcDirPath '+AGenResJavaSrcDirPath);
//  ABatStringList.Add('ECHO AProjectResPath '+AProjectResPath);
//  ABatStringList.Add('ECHO AAndroidManifestXmlFilePath '+AAndroidManifestXmlFilePath);

  {$IFDEF MSWINDOWS}

  AGenR_Java_Command:=
      '"'+AAndroidSDKAaptExeFilePath+'"'
      +' '+'package -f -m'
      //生成的源码目录
      +' '+'-J '+'"'+AGenResJavaSrcDirPath+'"'
      //资源目录
      +' '+'-S '+'"'+AProjectResPath+'"'
      //所使用的系统jar
      +' '+'-I '+'"'+AAndroidSystemJarFilePath+'"'
//      +' '+'-M '+'"'+'AndroidManifest.xml'+'"'
      //AndroidManifest.xml路径,主要使用了里面的包名
      +' '+'-M '+'"'+AAndroidManifestXmlFilePath+'"'
      ;
  //立即执行
  //ShellExecute不立即生成
//  ShellExecute(0, nil, PChar(AGenR_Java_Command), nil, nil, SW_SHOWMAXIMIZED);

  //WinExec立即生成
  AAnsiGenR_Java_Command:=AGenR_Java_Command;
  WinExec(PAnsiChar(AAnsiGenR_Java_Command),SW_SHOWMAXIMIZED);
  {$ENDIF MSWINDOWS}



//  ABatStringList.Add(AGenR_Java_Command);
//
//  //调试
////  ABatStringList.Add('pause');
//  ABatStringList.Add('');
//  ABatStringList.Add('');
//  ABatStringList.Add('');
//  ABatStringList.Add('');





//  //保存到文件
//  Result.SaveToFile(AGenRJavaBatFilePath);
//
//  Result.Free;
//
//  //运行
//  ShellExecute(0, nil, PChar(AGenRJavaBatFilePath), nil, nil, SW_SHOWMAXIMIZED);


  Result:=True;
end;

function GenerateWeiXinJarBatToProject(ATempRootDir:String;
                                        ATempJarDir:String;
                                        AJDKDir:String;
                                        AAndroidSDKDir:String;
                                        AAndroidSDKPlatform:String;
                                        AAndroidSDKBuildTools:String;
                                        AJarFilePath:String;
                                        AUsedAndroidJars:TStrings;

                                        AAndroidPackage:String;
                                        AWXEntryActivityLines:TStrings;
                                        AWXPayEntryActivityLines:TStrings;
                                        AOnWeixinListenerLines:TStrings;
                                        AWxApiPasLines:TStrings): Boolean;
var
//  ATempRootDir:String;
//  ATempJarDir:String;
  AJavaSources:TStringList;
  AJavaSourceDir:String;
  AWxJavaSourceFiles:TStringList;
begin
//  //因为需要计算出相对目录
//  if (AProjectFilePath='') then
//  begin
//    DoDeployConfigLog(nil,'请选择工程文件');
//    Exit;
//  end;
//
//  if Not FileExists(AProjectFilePath) then
//  begin
//    DoDeployConfigLog(nil,'工程文件不存在');
//    Exit;
//  end;
//
//
//
//  //先创建临时文件夹Temp
//  //先创建临时文件夹Temp,以aar为命名
//  //ProjectFilePath\JarGen\Main_R_Java\
//  ATempRootDir:=ExtractFilePath(AProjectFilePath)+CONST_JAR_TEMP_DIR+'\';
////  ATempRootDir:=ExtractFilePath(AProjectFilePath)+'WeiXinSDK'+'\';
//
//  ATempJarDir:=ATempRootDir+'wxapi'+'\';


  ForceDirectories(ATempRootDir);
  AJavaSourceDir:=ATempJarDir
                  +'src'+'\'
                  +ReplaceStr(AAndroidPackage,'.','\')+'\'
                  +'wxapi'+'\';
  ForceDirectories(AJavaSourceDir);




  AWxJavaSourceFiles:=TStringList.Create;
  AJavaSources:=TStringList.Create;
  try
        AJavaSources.Clear;
        AJavaSources.Assign(AWXEntryActivityLines);
        ReplaceStringList('com.ggggcexx.orangeui',AAndroidPackage,AJavaSources);
        AJavaSources.SaveToFile(AJavaSourceDir+'WXEntryActivity.java');

        AJavaSources.Clear;
        AJavaSources.Assign(AWXPayEntryActivityLines);
        ReplaceStringList('com.ggggcexx.orangeui',AAndroidPackage,AJavaSources);
        AJavaSources.SaveToFile(AJavaSourceDir+'WXPayEntryActivity.java');

        AJavaSources.Clear;
        AJavaSources.Assign(AOnWeixinListenerLines);
        ReplaceStringList('com.ggggcexx.orangeui',AAndroidPackage,AJavaSources);
        AJavaSources.SaveToFile(AJavaSourceDir+'OnWeixinListener.java');


        //JNI单元
        AJavaSources.Clear;
        AJavaSources.Assign(AWxApiPasLines);
        ReplaceStringList('com.ggggcexx.orangeui',AAndroidPackage,AJavaSources);
        ReplaceStringList('com/ggggcexx/orangeui',ReplaceStr(AAndroidPackage,'.','/'),AJavaSources);
        AJavaSources.SaveToFile(ATempJarDir+'Androidapi.JNI.wxapi.pas');




        //要编译这些源文件
        AWxJavaSourceFiles.Add(AJavaSourceDir+'*.java');

        //生成微信jar
        GenerateJarBatToProject(
                                ATempJarDir,

                                AJDKDir,
                                AAndroidSDKDir,
                                AAndroidSDKPlatform,
                                AAndroidSDKBuildTools,

                                AJarFilePath,
                                AUsedAndroidJars,
                                AWxJavaSourceFiles,
                                ATempRootDir+'Gen_Jar_'+'wxapi'+'.bat',
                                AAndroidPackage
                                );


  finally
    AJavaSources.Free;
    AWxJavaSourceFiles.Free;
  end;

end;

function TProjectConfig.FindDeployFilePlatformXMLNode(APlatform: String;ADeployFileXMLNode: IXMLNode): IXMLNode;
var
  I: Integer;
begin
  Result:=nil;


    //<DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
    //    <Platform Name="Android">
    //        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
    //        <RemoteName>libTbDemuxer.so</RemoteName>
    //        <Overwrite>true</Overwrite>

    for I := 0 to ADeployFileXMLNode.ChildNodes.Count-1 do
    begin
//                    <Platform Name="Android">
        if (ADeployFileXMLNode.ChildNodes[I].NodeName='Platform')
          and (ADeployFileXMLNode.ChildNodes[I].Attributes['Name']=APlatform) then
        begin
            Result:=ADeployFileXMLNode.ChildNodes[I];
            Break;
        end;
    end;

end;

function TProjectConfig.FindDeployFileXMLNode(ADeployFile: TDeployFile;
                                              AXMLNode: IXMLNode;
                                              //文件布署节点下面的子平台节点
//                                              var ADeployFilePlatformXMLNode:IXMLNode;
                                              //大的文件布署节点
//                                              var AEnabledDeployFileXMLNode:IXMLNode;
                                              AExistsLocalNameList:TStringList;
                                              //是否少了一些平台没有布署
                                              var AIsLostSomePlatform:Boolean):IXMLNode;
var
  I: Integer;
  J: Integer;
  ADeployFileXMLNode:IXMLNode;

  ATempDeployFilePlatformXMLNode:IXMLNode;

  ARemoteDirNode:IXMLNode;
  ARemoteNameNode:IXMLNode;
  AEnabledNode:IXMLNode;
  ARemoteDir:String;
  ARemoteName:String;
  AEnabled:String;
begin

      //列出所有DeployFile
      //要根据远程目录来判断RemoteDir+RemoteName
      Result:=nil;
//      ADeployFilePlatformXMLNode:=nil;
//      AEnabledDeployFileXMLNode:=nil;
      AIsLostSomePlatform:=False;
      AExistsLocalNameList.Clear;



      //<DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so"
      //            Configuration="Release"
      //            Class="File">
      //    <Platform Name="Android">
      //        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
      //        <RemoteName>libTbDemuxer.so</RemoteName>
      //        <Overwrite>true</Overwrite>
      for I := 0 to AXMLNode.ChildNodes.Count-1 do
      begin

          //必须要DeployFile的节点才可以
          if (AXMLNode.ChildNodes[I].NodeName='DeployFile') then
          begin

                ADeployFileXMLNode:=AXMLNode.ChildNodes[I];




                //方法一:
                //如果存在LocalName一致的节点,那么直接返回
                if (ADeployFile.LocalName=AXMLNode.ChildNodes[I].Attributes['LocalName'])
                  or ('\'+ADeployFile.LocalName='\'+AXMLNode.ChildNodes[I].Attributes['LocalName'])
                  then
                begin
                    //Inc(ASameCount);
                    Result:=AXMLNode.ChildNodes[I];
                    //Break;
                end
                else
                begin
                    Continue;
                end;





                //方法二:
                //判断一下是否远程目录相同
                //如果相同,那么是同一个文件

                //<DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
                //    <Platform Name="Android">
                //        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
                //        <RemoteName>libTbDemuxer.so</RemoteName>
                //        <Overwrite>true</Overwrite>

                for J := 0 to ADeployFile.Platforms.Count-1 do
                begin
                    //找到当前平台的<Platform>布署结点,如下:
                    //    <Platform Name="Android">
                    //        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
                    //        <RemoteName>libTbDemuxer.so</RemoteName>
                    //        <Overwrite>true</Overwrite>
                    ATempDeployFilePlatformXMLNode:=
                      FindDeployFilePlatformXMLNode(ADeployFile.Platforms[J].Platform_,
                                                    ADeployFileXMLNode);




                    if ATempDeployFilePlatformXMLNode<>nil then
                    begin
                        //有这个平台的节点


                        ARemoteDir:='';
                        ARemoteName:='';
                        AEnabled:='true';

                        //远程路径
                        ARemoteDirNode:=ATempDeployFilePlatformXMLNode.ChildNodes.FindNode('RemoteDir');
                        if ARemoteDirNode<>nil then
                        begin
                          ARemoteDir:=ARemoteDirNode.Text;
                        end;

                        //远程文件名
                        ARemoteNameNode:=ATempDeployFilePlatformXMLNode.ChildNodes.FindNode('RemoteName');
                        if ARemoteNameNode<>nil then
                        begin
                          ARemoteName:=ARemoteNameNode.Text;
                        end;

                        //是否启用
                        AEnabledNode:=ATempDeployFilePlatformXMLNode.ChildNodes.FindNode('Enabled');
                        if AEnabledNode<>nil then
                        begin
                          AEnabled:=AEnabledNode.Text;
                        end;


                        //ADeployFile在XML中已经存在
                        //'.\res\values\'='res\values\'
                        if (ARemoteDir=ADeployFile.Platforms[J].RemoteDir)
                          and (ARemoteName=ADeployFile.Platforms[J].RemoteName) then
                        begin
                            Result:=ADeployFileXMLNode;
//                            ADeployFilePlatformXMLNode:=ATempDeployFilePlatformXMLNode;

                            AExistsLocalNameList.Add(ADeployFileXMLNode.Attributes['LocalName']);


//                            //启用的布署项才行
//                            if SameText(AEnabled,'true') then
//                            begin
//                                if AEnabledDeployFileXMLNode=nil then
//                                begin
//                                    AEnabledDeployFileXMLNode:=ADeployFileXMLNode;
//                                end
//                                else
//                                begin
//                                    //已经有启用的,那么这个不再启用
//                                    if AEnabledNode=nil then
//                                    begin
//                                        AEnabledNode:=ATempDeployFilePlatformXMLNode.AddChild('Enabled');
//                                    end;
//                                    AEnabledNode.Text:='false';
//
//                                end;
//                            end;




                            //Break;
                        end;


                    end
                    else
                    begin
                        //没有这个平台的布署节点,则需要添加
                        AIsLostSomePlatform:=True;

                    end;




                end;

                Break;
          end;

      end;

end;


procedure TProjectConfig.RemoveNoUseResource(RTextFileName, RJavaFileName:string; NewRJavaFileName:string='');
var
  lstResource: TStringList;
  lstText: TStringList;
  lstJava: TStringList;
  lstNew: TStringList;
  lstTmp: TStringList;

  i: integer;
  strLine: string;
  strClassName: string;
  strKeyName: string;
  AEncoding:TEncoding;
begin
  AEncoding:=TMBCSEncoding.Create(936);


  if NewRJavaFileName = '' then
     NewRJavaFileName := RJavaFileName;
  if not FileExists(RTextFileName) then
     raise Exception.Create('文件' +RTextFileName+'找不到!');
  if not FileExists(RJavaFileName) then
     raise Exception.Create('文件' +RJavaFileName+'找不到!');
  lstText := TStringList.Create;
  lstText.LoadFromFile(RTextFileName);
  lstJava := TStringList.Create;
  lstJava.LoadFromFile(RJavaFileName,AEncoding);
  lstResource := TStringList.Create;
  lstNew := TStringList.Create;


  // 先提取资源ID Key
  lstTmp := TStringList.Create;

  try

    for i := 0 to lstText.Count - 1 do
    begin
      strLine := lstText.Strings[i];
      strLine := StringReplace(strLine, ' ', ',', [rfReplaceAll]);
      lstTmp.CommaText := strLine;
      lstResource.Add(lstTmp[1] + '-' + lstTmp[2]); // 要第2和第3栏
    end;

    //
    i := 0;
    while i <= lstJava.Count - 1 do
    begin
      strLine := lstJava.Strings[i];
      if Pos('/*', strLine) > 0 then // 备注行
      begin
        lstNew.Add(strLine);

        // 一直找下一行的 */
        i := i + 1;
        strLine := lstJava.Strings[i];
        while (Pos('*/', strLine) <= 0) and (i < lstJava.Count - 1) do
        begin
          lstNew.Add(strLine);

          i := i + 1;
          strLine := lstJava.Strings[i];
        end;
        lstNew.Add(strLine);

        i := i + 1;
        strLine := lstJava.Strings[i];
      end;

      if Pos('public static final class', strLine) > 0 then
      begin
        lstNew.Add(strLine);
        strClassName := Trim(StringReplace(strLine,
          'public static final class', '', []));
        strClassName := Trim(StringReplace(strClassName, '{', '', []));
        i := i + 1;
        strLine := lstJava.Strings[i];
        while (Trim(strLine) <> '}') and (Trim(strLine) <> '};') and (i <= lstJava.Count - 1) do // 一直找到下一个 }
        begin
          if Pos('public static final ', strLine) > 0 then
          begin
            strKeyName := Trim(StringReplace(strLine,
              'public static final ', '', []));
            strKeyName := Copy(strKeyName, Pos(' ', strKeyName) + 1, 255);
            strKeyName := Trim(Copy(strKeyName, 1, Pos('=', strKeyName) - 1));
            if lstResource.IndexOf(strClassName + '-' + strKeyName) > -1 then
            begin
              // 找到就加进去
              lstNew.Add(strLine);
              if Pos('[]', strLine) > 0 then // 是数组一直加到 '}'
              begin
                i := i + 1;
                strLine := lstJava.Strings[i];
                while (Pos('}', strLine) <= 0) and (i <= lstJava.Count - 1) do
                begin
                  lstNew.Add(strLine);
                  i := i + 1;
                  strLine := lstJava.Strings[i];
                end;

                if Pos('}', strLine) > 0 then
                begin
                  lstNew.Add(strLine);
                end;
              end
            end
            else
            begin
              // 在RText中资源找不到
              if Pos('[]', strLine) > 0 then // 是数组  一直到 '}' 都不要
              begin
                i := i + 1;
                strLine := lstJava.Strings[i];
                while (Pos('}', strLine) <= 0) and (i <= lstJava.Count - 1) do
                begin
                  i := i + 1;
                  strLine := lstJava.Strings[i];
                end;
              end;

              //删除上一行的注解
              if Copy(Trim(lstNew.Strings[lstNew.Count-1]),1,1) = '@' then
              begin
                lstNew.Delete(lstNew.Count-1);
              end;

            end;
          end
          else
          begin
            lstNew.Add(strLine); // 不是 'public static final ' 行
          end;
          i := i + 1;
          strLine := lstJava.Strings[i];
        end;

        if (Trim(strLine) = '}') or (Trim(strLine) = '};') then
        begin
          lstNew.Add(strLine);
          i := i + 1;
        end;
      end
      else
      begin
        lstNew.Add(strLine);
        i := i + 1;
      end;
    end;

    lstNew.SaveToFile(NewRJavaFileName,AEncoding);
    //Form

  finally
    lstText.Free;
    lstJava.Free;
    lstResource.Free;
    lstNew.Free;
    lstTmp.Free;
    AEncoding.Free;
  end;

end;



function TProjectConfig.GenerateJar(AProjectFilePath:String;
                                    //WeixinSDK
                                    AGeneratedJarDir:String;
                                    //Jar源码目录,JarSource
                                    AJarSourceCodeDir:String;
                                    //jar中的包名com.ggggcexx.orangeui.wxapi
                                    AGeneratedJarPackage:String;
                                    AAndroidPackage:String;
                                    //wxapi.jar
                                    AGeneratedJarFileName:String;
                                    AUsedAndroidJars:TStrings;

                                    AJDKDir:String;
                                    AAndroidSDKDir:String;
                                    AAndroidSDKPlatform:String;
                                    AAndroidSDKBuildTools:String
                                    ): Boolean;
var
  ATempRootDir:String;
  AGeneratedJavaSourceDir:String;
  AJarSouceFileList:TStringList;
  I: Integer;
  AJavaSources:TStringList;

begin
  Result:=False;

  AJarSouceFileList:=TStringList.Create;
  AJavaSources:=TStringList.Create;



  ATempRootDir:=ExtractFilePath(AProjectFilePath)+AGeneratedJarDir+'\';

  //生成jar源码目录
  ForceDirectories(ATempRootDir);
  AGeneratedJavaSourceDir:=ATempRootDir
                          +'src'+'\'
                          +ReplaceStr(AGeneratedJarPackage,'.','\')+'\';
  ForceDirectories(AGeneratedJavaSourceDir);



  //读取jar源码文件列表
  //将源码拷到生成目录
  DoGetFileList(ATempRootDir+AJarSourceCodeDir,AJarSouceFileList);
  for I := 0 to AJarSouceFileList.Count-1 do
  begin
    {$IFDEF MSWINDOWS}
    CopyFile(PWideChar(AJarSouceFileList[I]),PWideChar(AGeneratedJavaSourceDir+ExtractFileName(AJarSouceFileList[I])),False);
    {$ENDIF}
  end;




  //读取生成目录的jar源码文件列表
  //替换包名
  AJarSouceFileList.Clear;
  DoGetFileList(AGeneratedJavaSourceDir,AJarSouceFileList);
  for I := 0 to AJarSouceFileList.Count-1 do
  begin
    AJavaSources.Clear;
    AJavaSources.LoadFromFile(AJarSouceFileList[I]);
    ReplaceStringList('com.ggggcexx.orangeui',AAndroidPackage,AJavaSources);
    AJavaSources.SaveToFile(AJarSouceFileList[I]);
  end;


  AJarSouceFileList.Clear;
  AJarSouceFileList.Add(AGeneratedJavaSourceDir+'*.java');



  //生成微信jar
  GenerateJarBatToProject(
                          ATempRootDir,

                          AJDKDir,
                          AAndroidSDKDir,
                          AAndroidSDKPlatform,
                          AAndroidSDKBuildTools,

                          ATempRootDir+AGeneratedJarFileName,

                          //%ANDROID_PLATFORM%\android.jar
                          AUsedAndroidJars,


                          AJarSouceFileList,
                          ATempRootDir+AGeneratedJarFileName+'.bat',
                          AAndroidPackage
                          );



  AJarSouceFileList.Free;
  AJavaSources.Free;
end;


//procedure TProjectConfig.GenerateR_Java_And_Jar_Bat_List(ATempRootDir:String;
//                                                    AProjectResPath:String;
//                                                    AAndroidManifestXmlFilePaths:TStringList;
//                                                    AGenJarFileNamesNoExt:TStringList
//                                                    );
//var
//  I:Integer;
//  ATempJarDir:String;
//  AGenResJavaSrcDirPath:String;
//  AJavaSourceFiles:TStringList;
//
//  AAndroidSDKAaptExeFilePath:String;
//  AAndroidSystemJarFilePath:String;
//begin
//  for I := 0 to AAndroidManifestXmlFilePaths.Count-1 do
//  begin
//
//      //先创建临时文件夹Temp,以aar为命名
//      //ProjectFilePath\JarGen\Main_R_Java\
//      ATempJarDir:=ATempRootDir+AGenJarFileNamesNoExt[I]+'\';
//
//
//      //ProjectFilePath\JarGen\Main_R_Java\main\src
//      //src后面不能有\,不然生成不了
//      AGenResJavaSrcDirPath:=ATempJarDir+'src';
//
//
//      ForceDirectories(ATempRootDir);
//      ForceDirectories(ATempJarDir);
//      ForceDirectories(AGenResJavaSrcDirPath+'\');
//
//
//      //生成R.java的批处理文件
//      GenerateResJavaBat( //R.java文件要生成在哪个目录
//
//                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\JarGen\TwitterLogin\src
//                          AGenResJavaSrcDirPath,
//
//
////                          'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt.exe',
//                          Self.edtAndroidSDKBuildTools.Text+'\'+'aapt.exe',
////                          'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar',
//                          Self.edtAndroidSDKPlatform.Text+'\'+'android.jar',
//
//
//                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\Android\Release\TwitterLogin\res
//                          //要编译的res目录
//                          AProjectResPath,
//
//                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\Android\Release\TwitterLogin\AndroidManifest.xml
//                          //要编译的AndroidManifest.xml中路径
//                          AAndroidManifestXmlFilePaths[I],
//
//                          //生成R.Java的.bat文件路径
//                          ATempRootDir+'1.Gen_R_Java_'+AGenJarFileNamesNoExt[I]+'.bat'
//                          );
//
//
//
//      //等待R.java生成
//      Sleep(3000);
//
//
//
//      AJavaSourceFiles:=TStringList.Create;
//      //遍历有哪些Java源文件需要编译
//      DoGetFileList(AGenResJavaSrcDirPath,AJavaSourceFiles);
//      //打包成Jar
//      GenerateJarBatToProject(
//                              //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\JarGen\TwitterLogin\
//                              ATempJarDir,
//
//
//                              //C:\Program Files\Java\jdk1.8.0_151
//                              Self.edtJDKDir.Text,
//                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows
//                              Self.edtAndroidSDKDir.Text,
//                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22
//                              Self.edtAndroidSDKPlatform.Text,
//                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1
//                              Self.edtAndroidSDKBuildTools.Text,
//
//
//                              //生成的jar文件名
//                              'R_JAVA_'+AGenJarFileNamesNoExt[I]+'.jar',
//                              nil,
//                              //java源文件
//                              AJavaSourceFiles,
//
//
//                              //生成的.bat文件路径
//                              ATempRootDir+'2.Gen_R_Jar_'+AGenJarFileNamesNoExt[I]+'.bat',
//                              //com.embarcadero.TwitterLogin
//                              GetAndroidPackageName(AAndroidManifestXmlFilePaths[I]),
//
//                              ExtractFilePath(AAndroidManifestXmlFilePaths[I])
//                                  +'..\'
//                                  +'R_JAVA_'+AGenJarFileNamesNoExt[I]+'-dexed'+'.jar'
//
//                              );
//
//
//      AJavaSourceFiles.Free;
//
//  end;
//
//end;


procedure TProjectConfig.GenerateR_Java_And_Jar_BatStringList(ATempRootDir:String;
                                                    AProjectResPath:String;
                                                    AAndroidManifestXmlFilePath:String;
                                                    AGenJarFileNameNoExt:String;
                                                    AJDKDir:String;
                                                    AAndroidSDKDir:String;
                                                    AAndroidSDKPlatform:String;
                                                    AAndroidSDKBuildTools:String;

                                                    ABatStringList:TStringList
                                                    );
var
  I:Integer;
  ATempJarDir:String;
  AGenResJavaSrcDirPath:String;
  AJavaSourceFiles:TStringList;

  AAndroidSDKAaptExeFilePath:String;
  AAndroidSystemJarFilePath:String;

  AGenR_Java_Command:String;
  AR_TXT_FilePath:String;
  AR_JAVA_FilePath:String;
  AR_JAVA_FilePath1:String;
begin
      //ATempRootDir为ProjectFilePath\JarGen\Project1\

      //先创建临时文件夹Temp,以aar为命名
      //ProjectFilePath\JarGen\Project1\  +  jar包名Project1\
      ATempJarDir:=ATempRootDir;//+AGenJarFileNameNoExt+'\';


      //ProjectFilePath\JarGen\Project1\Project1\    src
      //src后面不能有\,不然生成不了
      AGenResJavaSrcDirPath:=ATempJarDir+'src';


      ForceDirectories(ATempRootDir);
      ForceDirectories(ATempJarDir);
      ForceDirectories(AGenResJavaSrcDirPath+'\');


      //判断aar中是否存在R.txt,如果存在,那么要去除R.java中多余的资源ID
      AR_TXT_FilePath:=ExtractFilePath(AAndroidManifestXmlFilePath)+'R.txt';
      AR_JAVA_FilePath:=AGenResJavaSrcDirPath+'\'+ReplaceStr(GetAndroidPackageName(AAndroidManifestXmlFilePath),'.','\')+'\R.java';
      AR_JAVA_FilePath1:=AR_JAVA_FilePath;//AGenResJavaSrcDirPath+'\'+ReplaceStr(GetAndroidPackageName(AAndroidManifestXmlFilePath),'.','\')+'\R1.java';
      if FileExists(AR_JAVA_FilePath) then
      begin
        DeleteFile(AR_JAVA_FilePath);
      end;


      //生成R.java源码的批处理文件
      GenerateResJavaBatString(


                          //准备生成的jar源码的目录
                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\JarGen\TwitterLogin\src
                          AGenResJavaSrcDirPath,


                          //aapt.exe路径
//                          'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1\aapt.exe',
//                          Self.edtAndroidSDKBuildTools.Text+'\'+'aapt.exe',
//                          AAndroidSDKBuildTools+'\'+'aapt.exe',
                          AAndroidSDKBuildTools+'aapt.exe',
                          //Android系统jar包android.jar路径
//                          'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22\android.jar',
//                          Self.edtAndroidSDKPlatform.Text+'\'+'android.jar',
//                          AAndroidSDKPlatform+'\'+'android.jar',
                          AAndroidSDKPlatform+'\'+'android.jar',


                          //工程的res生成目录
                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\Android\Release\TwitterLogin\res
                          //要编译的res目录
                          AProjectResPath,



                          //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\Android\Release\TwitterLogin\AndroidManifest.xml
                          //要编译的AndroidManifest.xml中路径
                          AAndroidManifestXmlFilePath,



//                          //生成R.Java的.bat文件路径
//                          ATempRootDir+'1.Gen_R_Java_'+AGenJarFileNameNoExt+'.bat',

                          AGenR_Java_Command//ABatStringList
                          );


//      ABatStringList.Add(AGenR_Java_Command);

//      //等待R.java生成
//      Sleep(3000);

      //判断是否生成成功


      if FileExists(AR_TXT_FilePath) then
      begin
        //等R.Java生成好
        while not FileExists(AR_JAVA_FilePath) do
        begin
          Application.ProcessMessages;
          Sleep(1000);
        end;
        Sleep(3000);


        if FileExists(AR_JAVA_FilePath) then
        begin
          RemoveNoUseResource(AR_TXT_FilePath,AR_JAVA_FilePath,AR_JAVA_FilePath1);
        end;
      end;


      AJavaSourceFiles:=TStringList.Create;




      //遍历有哪些Java源文件需要编译
      //C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\JarGen\Project1\src\
      //加上包名com\embarcadero\Project1
      //加上\R.java
      //DoGetFileList(AGenResJavaSrcDirPath,AJavaSourceFiles);
      //bat不执行了,所以要自已生成了
      AJavaSourceFiles.Add(AGenResJavaSrcDirPath+'\'
                           +ReplaceStr(GetAndroidPackageName(AAndroidManifestXmlFilePath),'.','\')
                           +'\R.java');

      //将jar源码打包成Jar
      GenerateJarBatStringList(
                              //E:\MyFiles\ThirdPartySDK\Twitter接口\Twitter_Core\JarGen\TwitterLogin\
                              ATempJarDir,


                              //生成Jar所需要的Android SDK配置
                              //C:\Program Files\Java\jdk1.8.0_151
//                              Self.edtJDKDir.Text,
                              AJDKDir,
                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows
//                              Self.edtAndroidSDKDir.Text,
                              AAndroidSDKDir,
                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\platforms\android-22
//                              ASelf.edtAndroidSDKPlatform.Text,
                              AAndroidSDKPlatform,
                              //C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\android-sdk-windows\build-tools\22.0.1
//                              Self.edtAndroidSDKBuildTools.Text,
                              AAndroidSDKBuildTools,


                              //生成的jar文件名,生成在哪个路径呢?
//                              '..\'+
                              'R_JAVA_'+AGenJarFileNameNoExt+'.jar',


                              //编译所需要引用的jar
                              nil,
                              //java源文件列表
                              AJavaSourceFiles,


//                              //生成的.bat文件路径
//                              ATempRootDir+'2.Gen_R_Jar_'+AGenJarFileNameNoExt+'.bat',


                              //Jar的包名
                              //com.embarcadero.TwitterLogin
                              GetAndroidPackageName(AAndroidManifestXmlFilePath),

                              //需要删除的临时文件
                              ExtractFilePath(AAndroidManifestXmlFilePath)
                                  +'..\'
                                  +'R_JAVA_'+AGenJarFileNameNoExt+'-dexed'+'.jar',

                              ABatStringList

                              );





      AJavaSourceFiles.Free;

end;


function TProjectConfig.GetAndroidSDKSetting(ADelphiVersion: String; var AJDKDir,
  AAndroidSDKDir, AAndroidSDKPlatform, AAndroidSDKBuildTools: String): Boolean;
{$IFDEF MSWINDOWS}
var
  I: Integer;
  AKey:String;
//  APathCount:Integer;
  AReg:TRegistry;
//  AIsExists:Boolean;
  ATempStr:String;
  AKeyStringList:TStringList;
{$ENDIF}
begin
  Result:=False;

  {$IFDEF MSWINDOWS}
  //设置注册表
  AReg:=TRegistry.Create;
  AKeyStringList:=TStringList.Create;
  try
      AReg.RootKey:=HKEY_CURRENT_USER;


      AKey:='\Software\Embarcadero\BDS\'+ADelphiVersion+'\'+'PlatformSDKs'+'\';

      //找到AndroidSDK
      if AReg.OpenKey(AKey,False) then
      begin
          ATempStr:=AReg.ReadString('Default_Android');

          if ATempStr<>'' then
          begin
              if AReg.OpenKey(AKey+ATempStr,False) then
              begin

                  //C:\Program Files\Java\jdk1.8.0_202\bin\KeyTool.exe

                  AJDKDir:=AReg.ReadString('JDKKeyToolPath');
                  AJDKDir:=ExtractFilePath(AJDKDir);
                  AJDKDir:=AJDKDir.Substring(0,AJDKDir.Length-1);
                  AJDKDir:=ExtractFilePath(AJDKDir);
                  AJDKDir:=AJDKDir.Substring(0,AJDKDir.Length-1);



                  AAndroidSDKDir:=AReg.ReadString('SystemRoot');
                  AAndroidSDKPlatform:=AReg.ReadString('SDKApiLevelPath');
                  AAndroidSDKBuildTools:=ExtractFilePath(AReg.ReadString('SDKAaptPath'));

                  if DirectoryExists(AJDKDir)
                    or DirectoryExists(AAndroidSDKDir)
                    or DirectoryExists(AAndroidSDKPlatform)
                    or DirectoryExists(AAndroidSDKBuildTools)
                     then
                  begin
                    Result:=True;
                  end;

              end;
          end;

      end
      else
      begin
          DoDeployConfigLog(nil,'AddLibraryToIOSSDK Open key "'+AKey+'" fail!');
          Exit;
      end;


//          AIsExists:=False;
//          if AReg.ValueExists('PathCount') then
//          begin
//              try
//                  APathCount:=AReg.ReadInteger('PathCount');
//
//
//                  AReg.GetValueNames(AKeyStringList);
//                  for I := 0 to AKeyStringList.Count-1 do
//                  begin
//                    if Copy(AKeyStringList[I],1,4)='Mask' then
//                    begin
//
//                        ATempStr:=Copy(AKeyStringList[I],5,MaxInt);
//
//                        //取出值,比对是否存在
//                        if AReg.ReadString(AKeyStringList[I])=APathName then
//                        begin
//                          //已经存在,不用添加了
//                          AIsExists:=True;
//                          Break;
//                        end;
//
//
//                    end;
//                  end;
//
//
//                  //注册表里没有
//                  if Not AIsExists then
//                  begin
//                    AReg.WriteInteger('Type'+IntToStr(APathCount),APathType);
//                    AReg.WriteString('Mask'+IntToStr(APathCount),APathName);
//                    AReg.WriteString('Path'+IntToStr(APathCount),APathDir);
//                    AReg.WriteString('IncludeSubDir'+IntToStr(APathCount),AIncludeSubDir);
//
//                    AReg.WriteInteger('PathCount',APathCount+1);
//                  end;
//              except
//                on E:Exception do
//                begin
//                  DoDeployConfigLog(nil,'AddLibraryToIOSSDK Error:'+E.Message);
//                end;
//              end;
//          end
//          else
//          begin
//              DoDeployConfigLog(nil,'AddLibraryToIOSSDK PathCount is not exist!');
//          end;

  finally
    FreeAndNil(AReg);
    FreeAndNil(AKeyStringList);
  end;
  {$ENDIF}

end;

function TProjectConfig.LoadAndroidJarListFromProject(
  AAndroidJarList: TStringList; AProjectFilePath: String): Boolean;
var
  I: Integer;
  AXMLNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  AJavaReferenceNode:IXMLNode;
begin
  Result:=False;

  AAndroidJarList.Clear;


  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
    //  AXMLDocument.Version:='1.0';
    //  AXMLDocument.Encoding:='GB2312';
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

//    <ItemGroup>
//        <DelphiCompile Include="$(MainSource)">
//            <MainSource>MainSource</MainSource>
//        </DelphiCompile>
//        <DCCReference Include="MapForm.pas">
//            <Form>frmMap</Form>
//        </DCCReference>
//        <JavaReference Include="BaiduMapSDK\BaiduLBS_Android.jar">
//            <Disabled/>
//        </JavaReference>
//        <JavaReference Include="BaiduNaviSDK\BaiduNaviSDK_3.1.1.jar">
//            <Disabled/>
//        </JavaReference>

      AXMLNode:=AXMLNode.ChildNodes.FindNode('ItemGroup');
      if AXMLNode<>nil then
      begin

          //加载已经添加过的jar
          for I := 0 to AXMLNode.ChildNodes.Count-1 do
          begin
              if AXMLNode.ChildNodes[I].NodeName='JavaReference' then
              begin
                  AJavaReferenceNode:=AXMLNode.ChildNodes[I];

                  AAndroidJarList.Add(AJavaReferenceNode.Attributes['Include']);

              end;
          end;

      end;

  finally
    AXMLDocument.Free;
  end;


  Result:=True;

end;

function TProjectConfig.LoadDeployFileListFromProject(AProjectFilePath: String): Boolean;
var
  XMLNode: IXMLNode;
  ADeployFileXMLNode:IXMLNode;
  ADeployFilePlatformXMLNode:IXMLNode;
  AXMLDocument: TXMLDocument;
  I: Integer;
  J: Integer;
  K: Integer;
  ADeployFile:TDeployFile;
  ADeployFilePlatform:TDeployFilePlatform;
begin
  Result:=False;

  //预览
  Self.FCurrentDeployFileList.Clear(True);

  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
      //  AXMLDocument.Version:='1.0';
      //  AXMLDocument.Encoding:='GB2312';
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      XMLNode:=AXMLDocument.DocumentElement;


      //<Project
      //  <ProjectExtensions>
      //    <BorlandProject>
      //        <Deployment Version="3">
      //            <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPad\FM_LaunchImageLandscape_1024x768.png" Configuration="Release" Class="iPad_Launch1024x768"/>
      //            <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPhone\FM_SpotlightSearchIcon_29x29.png" Configuration="Debug" Class="iPhone_Spotlight29"/>
      //            <DeployFile LocalName="BaiduMapSDK\BaiduMapAPIFramework\BaiduMapAPI_Map.framework\Resources\mapapi.bundle\files\DVDirectory.cfg" Configuration="Release" Class="File">
      //                <Platform Name="iOSDevice32">
      //                    <RemoteDir>.\mapapi.bundle\files\</RemoteDir>
      //                    <RemoteName>DVDirectory.cfg</RemoteName>
      //                    <Overwrite>true</Overwrite>
      //                </Platform>
      //            </DeployFile>



      //                <DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
      //                    <Platform Name="Android">
      //                        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
      //                        <RemoteName>libTbDemuxer.so</RemoteName>
      //                        <Overwrite>true</Overwrite>
      //                    </Platform>
      //                </DeployFile>

      //                <DeployFile LocalName="$(BDS)\bin\Artwork\Android\FM_NotificationIcon_24x24.png" Configuration="Release" Class="Android_NotificationIcon24">
      //                    <Platform Name="Android64">
      //                        <RemoteName>ic_notification.png</RemoteName>
      //                        <Overwrite>true</Overwrite>
      //                    </Platform>
      //                </DeployFile>


      XMLNode:=XMLNode.ChildNodes.FindNode('ProjectExtensions');
      if XMLNode<>nil then
      begin
        XMLNode:=XMLNode.ChildNodes.FindNode('BorlandProject');
        if XMLNode<>nil then
        begin
          XMLNode:=XMLNode.ChildNodes.FindNode('Deployment');
          if (XMLNode<>nil) then
          begin
            if (XMLNode.Attributes['Version']='3') then
            begin
                    //列出所有DeployFile

                    for I := 0 to XMLNode.ChildNodes.Count-1 do
                    begin
                      if (XMLNode.ChildNodes[I].NodeName='DeployFile') then
                      begin

                          ADeployFileXMLNode:=XMLNode.ChildNodes[I];

                          ADeployFile:=TDeployFile.Create;



              //                <DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
                          ADeployFile.LocalName:=ADeployFileXMLNode.Attributes['LocalName'];
                          if ADeployFileXMLNode.HasAttribute('Configuration') then
                          begin
                            //是否只适用于Debug或Release
                            ADeployFile.Configuration:=ADeployFileXMLNode.Attributes['Configuration'];
                          end;
                          if ADeployFileXMLNode.HasAttribute('Class') then
                          begin
                            //文件类型
                            ADeployFile.Class_:=ADeployFileXMLNode.Attributes['Class'];
                          end;




                          //列举出此文件需要布署到哪些平台(IOS,Android,Mac,Windows)
              //                <DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
              //                    <Platform Name="Android">
              //                        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
              //                        <RemoteName>libTbDemuxer.so</RemoteName>
              //                        <Overwrite>true</Overwrite>

                          for J := 0 to ADeployFileXMLNode.ChildNodes.Count-1 do
                          begin
              //                    <Platform Name="Android">
                            if (ADeployFileXMLNode.ChildNodes[J].NodeName='Platform') then
                            begin


                                ADeployFilePlatformXMLNode:=ADeployFileXMLNode.ChildNodes[J];

                                ADeployFilePlatform:=TDeployFilePlatform.Create;

                                ADeployFilePlatform.Platform_:=ADeployFilePlatformXMLNode.Attributes['Name'];

                                for K := 0 to ADeployFilePlatformXMLNode.ChildNodes.Count-1 do
                                begin
                                    //布署到哪个远程文件夹
                                    if (ADeployFilePlatformXMLNode.ChildNodes[K].NodeName='RemoteDir') then
                                    begin
                                        ADeployFilePlatform.RemoteDir:=ADeployFilePlatformXMLNode.ChildNodes[K].Text;
                                    end;
                                    //布署之后的文件名
                                    if (ADeployFilePlatformXMLNode.ChildNodes[K].NodeName='RemoteName') then
                                    begin
                                        ADeployFilePlatform.RemoteName:=ADeployFilePlatformXMLNode.ChildNodes[K].Text;
                                    end;
                                    //是否需要覆盖
                                    if (ADeployFilePlatformXMLNode.ChildNodes[K].NodeName='Overwrite') then
                                    begin
                                        ADeployFilePlatform.Overwrite:=ADeployFilePlatformXMLNode.ChildNodes[K].Text;
                                    end;
                                    //是否启用
                                    if (ADeployFilePlatformXMLNode.ChildNodes[K].NodeName='Enabled') then
                                    begin
                                        ADeployFilePlatform.Enabled:=ADeployFilePlatformXMLNode.ChildNodes[K].Text;
                                    end;
                                end;

                                ADeployFile.Platforms.Add(ADeployFilePlatform);

                            end;
                          end;



                          Self.FCurrentDeployFileList.Add(ADeployFile);

                      end;

                    end;

                    Result:=True;

            end
            else
            begin
              DoDeployConfigLog(nil,GetLangString(['不支持此Deployment版本',
                                    'Not support this deployment version']));
                                    //'不支持此Deployment版本');
            end;
          end
          else
          begin
            DoDeployConfigLog(nil,GetLangString(['不存在Deployment节点',
                                    'Deployment node is not exist']));
                                    //'不存在Deployment节点');
          end;
          end
        else
        begin
          DoDeployConfigLog(nil,GetLangString(['不存在BorlandProject节点',
                                    'BorlandProject node is not exist']));
                                    //'不存在BorlandProject节点');
        end;
      end
      else
      begin
        DoDeployConfigLog(nil,GetLangString(['不存在ProjectExtensions节点',
                                    'ProjectExtensions node is not exist']));
                                    //'不存在ProjectExtensions节点');
      end;



  finally
    AXMLDocument.Free;
  end;

end;

procedure TProjectConfig.LoadFromINI(AINIFilePath: String);
var
  I: Integer;
  ASectionName:String;
  AIniFile:TIniFile;
  ADeployConfig:TDeployConfig;
  AConfigVariable:TConfigVariable;
begin

  if not FileExists(AINIFilePath) then
  begin
    raise Exception.Create(QuotedStr(AINIFilePath)+' is not exist');
    Exit;
  end;


  AIniFile:=TIniFile.Create(AINIFilePath);


  //上次打开的工程
  Self.FLastProjectFilePath:=AIniFile.ReadString('','LastProjectFilePath','');


  //布署配置
  Self.FDeployConfigList.Clear(True);



  for I := 0 to 100 do
  begin
    ASectionName:='DeployConfigList '+IntToStr(I);


    if AIniFile.SectionExists(ASectionName) then
    begin

      ADeployConfig:=TDeployConfig.Create;
      ADeployConfig.Platform_:=AIniFile.ReadString(ASectionName,'Platform','');
      ADeployConfig.LocalDir:=AIniFile.ReadString(ASectionName,'LocalDir','');
      ADeployConfig.RemoteDir:=AIniFile.ReadString(ASectionName,'RemoteDir','');

      Self.FDeployConfigList.Add(ADeployConfig);
    end;



  end;





  //加载Jar配置
  Self.FAndroidJarList.Clear;
  for I := 0 to 100 do
  begin
    if AIniFile.ReadString('AndroidJar',IntToStr(I),'')<>'' then
    begin
      FAndroidJarList.Add(AIniFile.ReadString('AndroidJar',IntToStr(I),''));
    end;
  end;
//  FIsDisableSysJars:=AIniFile.ReadBool('AndroidJar','IsDisableSysJars',False);




  //加载Aar配置
  Self.FAndroidAarList.Clear;
  for I := 0 to 100 do
  begin
    if AIniFile.ReadString('AndroidAar',IntToStr(I),'')<>'' then
    begin
      FAndroidAarList.Add(AIniFile.ReadString('AndroidAar',IntToStr(I),''));
    end;
  end;






  //保存变量
  Self.FAndroidVariableList.Clear;
  for I := 0 to 100 do
  begin
    if AIniFile.ReadString('AndroidVariable','Name'+IntToStr(I),'')<>'' then
    begin
      AConfigVariable:=TConfigVariable.Create;
      AConfigVariable.Name:=AIniFile.ReadString('AndroidVariable','Name'+IntToStr(I),'');
      AConfigVariable.Value:=AIniFile.ReadString('AndroidVariable','Value'+IntToStr(I),'');
      AConfigVariable.Desc:=AIniFile.ReadString('AndroidVariable','Desc'+IntToStr(I),'');
      FAndroidVariableList.Add(AConfigVariable);
    end;
  end;



  //加载AndroidManifest.xml中的权限配置
  Self.FAndroidUsersPermissions.Clear;
  for I := 0 to 400 do
  begin
    if AIniFile.ReadString('AndroidUsersPermissions',IntToStr(I),'')<>'' then
    begin
      FAndroidUsersPermissions.Add(AIniFile.ReadString('AndroidUsersPermissions',IntToStr(I),''));
    end;
  end;




  //加载AndroidManifest.xml中的Application子节点
  Self.FAndroidApplicationChildNodes.Clear;
  for I := 0 to 300 do
  begin
    if AIniFile.ReadString('AndroidApplicationChildNodes',IntToStr(I),'')<>'' then
    begin
      FAndroidApplicationChildNodes.Add(AIniFile.ReadString('AndroidApplicationChildNodes',IntToStr(I),''));
    end;
  end;




  //加载IOSPlistRootNodes子节点
  Self.FIOSPlistRootNodes.Clear;
  for I := 0 to 100 do
  begin
    if AIniFile.ReadString('IOSPlistRootNodes',IntToStr(I),'')<>'' then
    begin
      FIOSPlistRootNodes.Add(AIniFile.ReadString('IOSPlistRootNodes',IntToStr(I),''));
    end;
  end;



  //IOS链接参数
  Self.FIOSLinkerOptions:=AIniFile.ReadString('','IOSLinkerOptions','');



  FreeAndNil(AIniFile);

end;

function TProjectConfig.ProcessAll(AProjectFilePath:String):Boolean;
var
  I: Integer;
begin
  Result:=False;



  //根据工程文件
  //生成需要布署的所有文件列表
  if not Self.FDeployConfigList.GeneratePreviewDeployFileList(
            AProjectFilePath
            ) then Exit;





  //把文件布署列表处理到工程文件
  if not Self.SaveDeployFileListToProject(
      Self.FDeployConfigList.FPreviewDeployFileList,
      AProjectFilePath
      ) then Exit;






  //保存Applcation子节点列表
  if not Self.SaveAndroidApplicationChildNodesToProject(
              Self.FAndroidApplicationChildNodes,
              Self.FAndroidVariableList,
              AProjectFilePath) then Exit;



  //保存Android权限列表
  if not Self.SaveAndroidUsersPermissionsToProject(
              Self.FAndroidUsersPermissions,
              Self.FAndroidVariableList,
              AProjectFilePath) then Exit;




  //保存AndroidJar到
  if not Self.SaveAndroidJarListToProject(
              Self.FAndroidJarList,
              AProjectFilePath) then Exit;



  //保存AndroidAar到
  if not Self.SaveAndroidAarListToProject(
              Self.FAndroidAarList,
              AProjectFilePath) then Exit;







  //保存IOS链接参数
  if not Self.SaveIOSLinkerOptionsToProject(
        AProjectFilePath,
        Self.FIOSLinkerOptions
        ) then Exit;





  //保存IOS Plist RootNodes
  if not Self.SaveIOSInfoPlistToProject(
        AProjectFilePath,
        Self.FIOSPlistRootNodes,
        Self.FAndroidVariableList
        ) then Exit;





  //获取有哪些Delphi Version
  //获取有哪个IOS SDK
  //再逐一添加所需要的Frameworks
  for I := 0 to GlobalIOSFrameworkList.Count-1 do
  begin
    AddLibraryToAllIOSSDK(
        2,
        GlobalIOSFrameworkList[I],
        '$(SDKROOT)/System/Library/Frameworks',
        '0'
        );
  end;




  //获取有哪些Delphi Version
  //获取有哪个IOS SDK
  //再逐一添加所需要的Dylibs
  for I := 0 to GlobalIOSDylibList.Count-1 do
  begin
    AddLibraryToAllIOSSDK(
        1,
        GlobalIOSDylibList[I],
        '$(SDKROOT)/usr/lib',
        '0'
        );
  end;





  Result:=True;
end;

function TProjectConfig.SaveAndroidApplicationChildNodesToProject(
  AAndroidApplicationChildNodes: TStringList;
  AConfigVariables:TConfigVariableList;
  AProjectFilePath: String): Boolean;
var
  AAndroidManifestFilePath:String;
  AAndroidManifestList:TStringList;
  APorcessedAndroidApplicationChildNodes:TStringList;
  ATrimAndroidManifestList:TStringList;
  I: Integer;
  AIsAllExists:Boolean;
  AUsesFeatureIndex:Integer;
begin
  Result:=False;


  //判断是否有内容
  if AAndroidApplicationChildNodes.Count=0 then
  begin
    Result:=True;
    Exit;
  end;


  //判断内容的XML格式是否能正常解析
  CheckAndroidManifestTemplateXmlFile(AProjectFilePath);


  //找到所在的AndroidManifest.template.xml的路径
  AAndroidManifestFilePath:=ExtractFilePath(AProjectFilePath)+'AndroidManifest.template.xml';



  if not FileExists(AAndroidManifestFilePath) then
  begin
      ShowMessage(GetLangString(['AndroidManifest.template.xml文件不存在,请先在Android平台下编译生成该文件',
                                    'AndroidManifest.template.xml is not exist,Please build at Android platform first']));
                                    //'AndroidManifest.template.xml文件不存在,请先在Android平台下编译生成该文件');
      Exit;
  end;



  //是utf-8编码的
  AAndroidManifestList:=TStringList.Create;
  ATrimAndroidManifestList:=TStringList.Create;
  APorcessedAndroidApplicationChildNodes:=TStringList.Create;
  try


      //先替换AAndroidUsersPermissions中的变量为指定值
      APorcessedAndroidApplicationChildNodes.Assign(AAndroidApplicationChildNodes);
      ProcessConfigVariables(APorcessedAndroidApplicationChildNodes,
                            AConfigVariables);


      try
        AAndroidManifestList.LoadFromFile(AAndroidManifestFilePath,TEncoding.UTF8);
      except
        AAndroidManifestList.LoadFromFile(AAndroidManifestFilePath,TEncoding.ANSI);
      end;


      //去掉空格
      for I := 0 to AAndroidManifestList.Count-1 do
      begin
        ATrimAndroidManifestList.Add(Trim(AAndroidManifestList[I]));
      end;



      //先判断一下整体是否存在
      AIsAllExists:=True;
      for I := 0 to APorcessedAndroidApplicationChildNodes.Count-1 do
      begin
        if ATrimAndroidManifestList.IndexOf(Trim(APorcessedAndroidApplicationChildNodes[I]))=-1 then
        begin
          //整体不存在
          AIsAllExists:=False;
          Break;
        end;
      end;



      //整体不存在
      //那么添加
      //添加在</application>前面
      if Not AIsAllExists then
      begin


          //定位</application>
          //在哪一行
          AUsesFeatureIndex:=-1;
          for I := 0 to AAndroidManifestList.Count-1 do
          begin
            if Pos('</application>',AAndroidManifestList[I])>0 then
            begin
              AUsesFeatureIndex:=I;
              Break;
            end;
          end;





          //插入在</application>
          //上面
          if AUsesFeatureIndex>-1 then
          begin

              //插入8个空白行
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
              AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');


              //插入节点列表
              for I := 0 to APorcessedAndroidApplicationChildNodes.Count-1 do
              begin
                AAndroidManifestList.Insert(AUsesFeatureIndex+4+I,APorcessedAndroidApplicationChildNodes[I]);
              end;



              AAndroidManifestList.SaveToFile(AAndroidManifestFilePath,TEncoding.UTF8);

          end
          else
          begin
              ShowMessage(GetLangString(['AndroidManifest.template.xml格式不正确,无法定位</application>',
                                        'Can not find </application> in AndroidManifest.template.xml']));
                                        //'AndroidManifest.template.xml格式不正确,无法定位</application>');
              Exit;
          end;

      end
      else
      begin
          DoDeployConfigLog(nil,GetLangString(['AndroidManifest.template.xml中已经存在该SDK所需要的应用节点',
                                                'AndroidManifest.template.xml has been exist all need']));
                                                //'AndroidManifest.template.xml中已经存在该SDK所需要的应用节点');
      end;

      Result:=True;
  finally
    AAndroidManifestList.Free;
    ATrimAndroidManifestList.Free;
    APorcessedAndroidApplicationChildNodes.Free;
  end;

end;

function TProjectConfig.SaveAndroidJarListToProject(AAndroidJarList: TStringList; AProjectFilePath: String): Boolean;
var
  I: Integer;
  AXMLNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  AJavaReferenceNode:IXMLNode;
  J: Integer;
  AExistedAndroidJarNameList:TStringList;
begin
  Result:=False;


  if AAndroidJarList.Count=0 then
  begin
    Result:=True;
    Exit;
  end;


  AExistedAndroidJarNameList:=TStringList.Create;





  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
    //  AXMLDocument.Version:='1.0';
    //  AXMLDocument.Encoding:='GB2312';
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

//    <ItemGroup>
//        <DelphiCompile Include="$(MainSource)">
//            <MainSource>MainSource</MainSource>
//        </DelphiCompile>
//        <DCCReference Include="MapForm.pas">
//            <Form>frmMap</Form>
//        </DCCReference>
//        <JavaReference Include="BaiduMapSDK\BaiduLBS_Android.jar">
//            <Disabled/>
//        </JavaReference>
//        <JavaReference Include="BaiduNaviSDK\BaiduNaviSDK_3.1.1.jar">
//            <Disabled/>
//        </JavaReference>

      AXMLNode:=AXMLNode.ChildNodes.FindNode('ItemGroup');
      if AXMLNode<>nil then
      begin

          //加载已经添加过的jar
          for I := 0 to AXMLNode.ChildNodes.Count-1 do
          begin
              if AXMLNode.ChildNodes[I].NodeName='JavaReference' then
              begin
                  AJavaReferenceNode:=AXMLNode.ChildNodes[I];

                  AExistedAndroidJarNameList.Add(
                        ExtractFileName(AJavaReferenceNode.Attributes['Include'])
                        );

              end;
          end;





          //添加不存在的Jar
          for I := 0 to AAndroidJarList.Count-1 do
          begin
            if Trim(AAndroidJarList[I])='' then Continue;

            if AExistedAndroidJarNameList.IndexOf(ExtractFileName(AAndroidJarList[I]))=-1 then
            begin
              AJavaReferenceNode:=AXMLNode.AddChild('JavaReference');
              AJavaReferenceNode.Attributes['Include']:=AAndroidJarList[I];
              AJavaReferenceNode.AddChild('Disabled');
            end
            else
            begin
              DoDeployConfigLog(nil,GetLangString(['工程文件中已经添加过该Jar'+AAndroidJarList[I],
                                                  'This Jar is already exist:'+AAndroidJarList[I]  ]));
                                                  //'工程文件中已经添加过该jar:'+AAndroidJarList[I]);
            end;
          end;



          AXMLDocument.SaveToFile(AProjectFilePath);

          Result:=True;

      end
      else
      begin
          DoDeployConfigLog(nil,GetLangString(['工程文件中不存在ItemGroup节点',
                                                'ItemGroup node is not exist in project file'  ]));
                                                //'工程文件中不存在ItemGroup节点');
          Exit;
      end;



  finally
    AXMLDocument.Free;
    AExistedAndroidJarNameList.Free;
  end;


end;

function TProjectConfig.SaveAndroidAarListToProject(AAndroidAarList: TStringList; AProjectFilePath: String): Boolean;
var
  I: Integer;
  AAndroidJarList:TStringList;
  AAndroidAarFilePath:String;
  AAndroidAarRelativeDirPath:String;
  AAndroidAarDirPath:String;
  {$IFNDEF IN_ORANGESDK}
  ziper:TVCLZip;
  {$ENDIF}
  ADeployConfig:TDeployConfig;
  ADeployConfigList:TDeployConfigList;
begin
  Result:=False;


  if AAndroidAarList.Count=0 then
  begin
    Result:=True;
    Exit;
  end;


  AAndroidJarList:=TStringList.Create;
  ADeployConfigList:=TDeployConfigList.Create;
  try


      //先解压aar文件
      for I := 0 to AAndroidAarList.Count-1 do
      begin
          if Trim(AAndroidAarList[I])='' then Continue;
          

          //dmcBig_MediaPicker\support-compat-28.0.0.aar
          AAndroidAarFilePath:=AAndroidAarList[I];
          AAndroidAarRelativeDirPath:=ChangeFileExt(AAndroidAarList[I],'_aar')+'\';

          AAndroidAarFilePath:=ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectFilePath),AAndroidAarFilePath);
          AAndroidAarDirPath:=ChangeFileExt(AAndroidAarFilePath,'_aar')+'\';
          //dmcBig_MediaPicker\support-compat-28.0.0_aar\support-compat-28.0.0.aar.jar
          AAndroidJarList.Add(AAndroidAarRelativeDirPath+ExtractFileName(AAndroidAarList[I])+'.jar');


          if not DirectoryExists(AAndroidAarDirPath) then
          begin

            {$IFNDEF IN_ORANGESDK}
            //目录不存在,则解压
            ziper:=TVCLZip.Create(application);
            ziper.ZipName:=AAndroidAarFilePath;//获取压缩文件名
            ziper.DestDir:=AAndroidAarDirPath;
            ziper.DoAll := True;
            ziper.OverwriteMode := Always;
            ziper.RelativePaths:=true;//是否保持目录bai结构
            ziper.AddDirEntriesOnRecurse:=true;
            ziper.RecreateDirs:=true;//创建目录
            ziper.UnZip;
            ziper.Free;
            {$ENDIF}

            //将里面的classes.jar重命名
            ReNameFile(AAndroidAarDirPath+'\'+'classes.jar',
                        AAndroidAarDirPath+'\'+ExtractFileName(AAndroidAarFilePath)+'.jar');

          end;


          //判断res目录是否存在需要布署的文件,如果有,则需要布署
          //无论有没有,都布署即可,省事
          if DirectoryExists(AAndroidAarDirPath+'res') then
          begin

            ADeployConfig:=TDeployConfig.Create;
            ADeployConfig.Platform_:='Android';
            ADeployConfig.LocalDir:=AAndroidAarRelativeDirPath+'res\';
            ADeployConfig.RemoteDir:='res\';

            ADeployConfigList.Add(ADeployConfig);


          end;

          //判断jni目录是否存在需要布署的文件,如果有,则需要布署
          //无论有没有,都布署即可,省事
          if DirectoryExists(AAndroidAarDirPath+'jni') then
          begin

            ADeployConfig:=TDeployConfig.Create;
            ADeployConfig.Platform_:='Android';
            ADeployConfig.LocalDir:=AAndroidAarRelativeDirPath+'jni\';
            ADeployConfig.RemoteDir:='library\lib\';

            ADeployConfigList.Add(ADeployConfig);

          end;



      end;





      Self.SaveAndroidJarListToProject(AAndroidJarList,AProjectFilePath);



      //根据工程文件
      //生成需要布署的所有文件列表
      if not ADeployConfigList.GeneratePreviewDeployFileList(
                AProjectFilePath
                ) then Exit;

      //把文件布署列表处理到工程文件
      if not Self.SaveDeployFileListToProject(
          ADeployConfigList.FPreviewDeployFileList,
          AProjectFilePath
          ) then Exit;


      Result:=True;



  finally
    AAndroidJarList.Free;
    ADeployConfigList.Free;
  end;


end;

procedure ProcessConfigVariables(AStringList:TStringList;AConfigVariableList:TConfigVariableList);
var
  I: Integer;
  J: Integer;
begin
  for I := 0 to AStringList.Count-1 do
  begin
    for J := 0 to AConfigVariableList.Count-1 do
    begin
      if Pos(AConfigVariableList[J].Name,AStringList[I])>0 then
      begin
        AStringList[I]:=ReplaceStr(AStringList[I],
                                  AConfigVariableList[J].Name,
                                  AConfigVariableList[J].Value
                                  );
      end;
    end;
  end;
end;

function TProjectConfig.SaveAndroidUsersPermissionsToProject(
  AAndroidUsersPermissions: TStringList;
  AConfigVariables:TConfigVariableList;
  AProjectFilePath: String): Boolean;
var
  AAndroidManifestFilePath:String;
  AAndroidManifestList:TStringList;
  ATrimAndroidManifestList:TStringList;
  I: Integer;
  AIsAllExists:Boolean;
  AUsesFeatureIndex:Integer;
  AProcessedAndroidUsersPermissions: TStringList;
begin
  Result:=False;


  if AAndroidUsersPermissions.Count=0 then
  begin
    Result:=True;
    Exit;
  end;



  //判断Android模板文件是否存在
  //不存在的话从工具的exe目录拷一个出来
  //判断内容的XML格式是否能正常解析
  CheckAndroidManifestTemplateXmlFile(AProjectFilePath);



  AAndroidManifestFilePath:=ExtractFilePath(AProjectFilePath)+'AndroidManifest.template.xml';

  if not FileExists(AAndroidManifestFilePath) then
  begin
      ShowMessage(GetLangString(['AndroidManifest.template.xml文件不存在,请先在Android平台下编译生成该文件',
                                    'AndroidManifest.template.xml is not exist,Please build at Android platform first'  ]));
                                    //'AndroidManifest.template.xml文件不存在,请先在Android平台下编译生成该文件');
      Exit;
  end;


      //文件存在
      //是utf-8编码的
      AAndroidManifestList:=TStringList.Create;
      ATrimAndroidManifestList:=TStringList.Create;
      AProcessedAndroidUsersPermissions:=TStringList.Create;
      try

          //先替换AAndroidUsersPermissions中的变量
          AProcessedAndroidUsersPermissions.Assign(AAndroidUsersPermissions);
          ProcessConfigVariables(AProcessedAndroidUsersPermissions,
                                AConfigVariables);
          //解析出里面的xml



          //
          try
            AAndroidManifestList.LoadFromFile(AAndroidManifestFilePath,TEncoding.UTF8);
          except
            AAndroidManifestList.LoadFromFile(AAndroidManifestFilePath,TEncoding.ANSI);
          end;


          for I := 0 to AAndroidManifestList.Count-1 do
          begin
            ATrimAndroidManifestList.Add(Trim(AAndroidManifestList[I]));
          end;



          //先判断一下权限设置整体是否存在
          AIsAllExists:=True;
          for I := 0 to AProcessedAndroidUsersPermissions.Count-1 do
          begin
            if ATrimAndroidManifestList.IndexOf(Trim(AProcessedAndroidUsersPermissions[I]))=-1 then
            begin
              //整体不存在
              AIsAllExists:=False;
              Break;
            end;
          end;



          //整体不存在
          //那么添加
          //添加在<uses-feature android:glEsVersion="0x00020000" android:required="True"/>前面
          if Not AIsAllExists then
          begin


              //定位<uses-feature android:glEsVersion="0x00020000" android:required="True"/>
              //在哪一行
              AUsesFeatureIndex:=-1;
              for I := 0 to AAndroidManifestList.Count-1 do
              begin
                if Pos('<uses-feature',AAndroidManifestList[I])>0 then
                begin
                  AUsesFeatureIndex:=I;
                  Break;
                end;
              end;


              //插入在<uses-feature android:glEsVersion="0x00020000" android:required="True"/>
              //上面
              if AUsesFeatureIndex>-1 then
              begin

                  //插入8个空白行
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  AAndroidManifestList.Insert(AUsesFeatureIndex-1,'');
                  //插入权限列表
                  for I := 0 to AProcessedAndroidUsersPermissions.Count-1 do
                  begin
                    AAndroidManifestList.Insert(AUsesFeatureIndex+4+I,AProcessedAndroidUsersPermissions[I]);
                  end;

                  AAndroidManifestList.SaveToFile(AAndroidManifestFilePath,TEncoding.UTF8);

              end
              else
              begin
                  ShowMessage(GetLangString(['AndroidManifest.template.xml格式不正确,无法定位<uses-feature',
                                              'Can not find <uses-feature in AndroidManifest.template.xml'  ]));
                                              //'AndroidManifest.template.xml格式不正确,无法定位<uses-feature');
                  Exit;
              end;

          end
          else
          begin
              DoDeployConfigLog(nil,GetLangString(['AndroidManifest.template.xml中已经存在该SDK所需要的权限',
                                                  'AndroidManifest.template.xml has existed all need'  ]));
                                                  //'AndroidManifest.template.xml中已经存在该SDK所需要的权限');
          end;


          Result:=True;
      finally
        AAndroidManifestList.Free;
        ATrimAndroidManifestList.Free;
        AProcessedAndroidUsersPermissions.Free;
      end;


end;

function TProjectConfig.SaveIOSInfoPlistToProject(AProjectFilePath: String;
                                          AInfoPlistRootNodes:TStringList;
                                          AConfigVariables:TConfigVariableList): Boolean;
var
  AInfoPlistTemplateFilePath:String;
  AStringStream:TStringStream;
  AInfoPlistXMLStr:String;
  AInfoPlistRootNodesStr:String;
  AProcessedInfoPlistRootNodes:TStringList;
  I: Integer;
  AXMLNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  AFindNodeIndex:Integer;
  ACFBundleURLTypesArrayNode:IXMLNode;
  ACFBundleURLTypesArrayDictNode:IXMLNode;
  ACFBundleURLSchemesArrayNode:IXMLNode;
  ACFBundleURLSchemesList:TStringList;

  AInsertXMLNode: IXMLNode;
  AInsertXMLDocument: TXMLDocument;
  AInsertCFBundleURLTypesArrayNode:IXMLNode;
  AInsertCFBundleURLTypesArrayDictNode:IXMLNode;
  AInsertCFBundleURLSchemesArrayNode:IXMLNode;

  J:Integer;
  AIsExisted:Boolean;
  AIndex:Integer;
begin
  Result:=False;


  if AInfoPlistRootNodes.Count=0 then
  begin
    Result:=True;
    Exit;
  end;


  if Not FileExists(AProjectFilePath) then
  begin
    ShowMessage(GetLangString(['工程文件不存在',
                                'Project file is not exist'  ]));
                                //'工程文件不存在');
    Exit;
  end;

  CheckInfoPlistTemplateiOSXmlFile(AProjectFilePath);


  AInfoPlistTemplateFilePath:=ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml';
  if not FileExists(AInfoPlistTemplateFilePath) then
  begin
    ShowMessage(GetLangString(['info.plist.TemplateiOS.xml文件不存在,请先在IOS平台下运行一下,它会自动生成',
                                'info.plist.TemplateiOS.xml is not exist,Please build at IOS platform first'  ]));
                                //'info.plist.TemplateiOS.xml文件不存在,请先在IOS平台下运行一下,它会自动生成');
    Exit;
  end;



  if AInfoPlistRootNodes.Count=0 then
  begin
    Result:=True;
    Exit;
  end;



  //工程文件中的info.plist.TemplateiOS.xml
  AStringStream:=TStringStream.Create('',TEncoding.UTF8);
  try
      AStringStream.LoadFromFile(AInfoPlistTemplateFilePath);
      AInfoPlistXMLStr:=AStringStream.DataString;
      //去掉这两个变量,才是合法的XML格式文档,后面再加上去
      AInfoPlistXMLStr:=ReplaceStr(AInfoPlistXMLStr,'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">','');
      AInfoPlistXMLStr:=ReplaceStr(AInfoPlistXMLStr,'<%VersionInfoPListKeys%>','');
      AInfoPlistXMLStr:=ReplaceStr(AInfoPlistXMLStr,'<%ExtraInfoPListKeys%>','');
  finally
    FreeAndNil(AStringStream);
  end;




  //替换变量
  AInfoPlistRootNodesStr:='';
  AProcessedInfoPlistRootNodes:=TStringList.Create;
  AProcessedInfoPlistRootNodes.Assign(AInfoPlistRootNodes);
  try
      ProcessConfigVariables(AProcessedInfoPlistRootNodes,AConfigVariables);
      for I := 0 to AProcessedInfoPlistRootNodes.Count-1 do
      begin
        AInfoPlistRootNodesStr:=AInfoPlistRootNodesStr+AProcessedInfoPlistRootNodes[I];
      end;
      AInfoPlistRootNodesStr:='<array>'
                              +AInfoPlistRootNodesStr
                              +'</array>';
  finally
    FreeAndNil(AProcessedInfoPlistRootNodes);
  end;





  //处理XML
  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  AInsertXMLDocument:=TXMLDocument.Create(Application);
  ACFBundleURLSchemesList:=TStringList.Create;
  try
      AXMLDocument.LoadFromXML(AInfoPlistXMLStr);
      AXMLDocument.Active:=True;
      AXMLDocument.Version:='1.0';
      AXMLDocument.Encoding:='UTF-8';
      AXMLNode:=AXMLDocument.DocumentElement;//plist
      AXMLNode:=AXMLNode.ChildNodes[0];//dict


      //需要插入的XML
      AInsertXMLDocument.LoadFromXML(AInfoPlistRootNodesStr);
      AInsertXMLDocument.Active:=True;
      AInsertXMLNode:=AInsertXMLDocument.DocumentElement;



      AIndex:=0;
      while AIndex<AInsertXMLNode.ChildNodes.Count-1 do
      begin

          //'CFBundleURLTypes',IOS Schema
          if AInsertXMLNode.ChildNodes[AIndex].Text='CFBundleURLTypes' then
          begin
              //要插入的IOS Schema数组
              AInsertCFBundleURLTypesArrayNode:=AInsertXMLNode.ChildNodes[AIndex+1];
                  
              //结构是
              //<key> CFBundleURLTypes</key>
              //<array>
              //      <dict>微信</dict>
              //			<dict>支付宝</dict>
              //			<dict>facebook</dict>
              //      <dict>twitter</dict>
              //</array>
              //插入到这里,先判断已经插入了哪些了
              ACFBundleURLTypesArrayNode:=FindKeyValueNode(AXMLNode,'CFBundleURLTypes');
              if ACFBundleURLTypesArrayNode<>nil then
              begin
                    ACFBundleURLSchemesList.Clear;

                    //<array>里面是<dict>列表
                    for I := 0 to ACFBundleURLTypesArrayNode.ChildNodes.Count-1 do
                    begin
                        //    <dict>
                        //        <key>CFBundleURLSchemes</key>
                        //        <array>
                        //            <string>fb+你的AppID</string>
                        //        </array>
                        //    </dict>
                        ACFBundleURLTypesArrayDictNode:=ACFBundleURLTypesArrayNode.ChildNodes[I];
                        //<array>里面是<string>列表
                        ACFBundleURLSchemesArrayNode:=FindKeyValueNode(ACFBundleURLTypesArrayDictNode,'CFBundleURLSchemes');
                        if ACFBundleURLSchemesArrayNode<>nil then
                        begin
                            for J := 0 to ACFBundleURLSchemesArrayNode.ChildNodes.Count-1 do
                            begin
                              ACFBundleURLSchemesList.Add(ACFBundleURLSchemesArrayNode.ChildNodes[J].Text);
                            end;
                        end;

                    end;
              end
              else
              begin
                  //不存在,则添加
                  ACFBundleURLTypesArrayNode:=AXMLNode.AddChild('key');
                  ACFBundleURLTypesArrayNode.Text:='CFBundleURLTypes';
                  ACFBundleURLTypesArrayNode:=AXMLNode.AddChild('array');
              end;



              //需要插入的<dict>列表
              for I := 0 to AInsertCFBundleURLTypesArrayNode.ChildNodes.Count-1 do
              begin
                //CFBundleURLSchemes中判断是否已经存在
                AInsertCFBundleURLTypesArrayDictNode:=AInsertCFBundleURLTypesArrayNode.ChildNodes[I];
                AInsertCFBundleURLSchemesArrayNode:=FindKeyValueNode(AInsertCFBundleURLTypesArrayDictNode,'CFBundleURLSchemes');
                if AInsertCFBundleURLSchemesArrayNode<>nil then
                begin
                    AIsExisted:=False;
                    for J := 0 to AInsertCFBundleURLSchemesArrayNode.ChildNodes.Count-1 do
                    begin
                      if ACFBundleURLSchemesList.IndexOf(AInsertCFBundleURLSchemesArrayNode.ChildNodes[J].Text)<>-1 then
                      begin
                        //不存在,则添加该<dict>
                        AIsExisted:=True;
                        Break;
                      end;
                    end;

                    if Not AIsExisted then
                    begin
                      ACFBundleURLTypesArrayDictNode:=ACFBundleURLTypesArrayNode.AddChild('dict');
                      CopyXMLNode(AInsertCFBundleURLTypesArrayDictNode,ACFBundleURLTypesArrayDictNode);
                    end;
                end;
              end;


          end
          else if AInsertXMLNode.ChildNodes[AIndex].Text='LSApplicationQueriesSchemes' then
          begin
                  

              //IOS Schema白名单
              AInsertCFBundleURLTypesArrayNode:=AInsertXMLNode.ChildNodes[AIndex+1];
                  
              //结构是
              //<key>LSApplicationQueriesSchemes</key>
              //<array>
              //    <string>fbapi</string>
              //    <string>fb-messenger-api</string>
              //    <string>fbauth2</string>
              //    <string>fbshareextension</string>
              //</array>
              ACFBundleURLTypesArrayNode:=FindKeyValueNode(AXMLNode,'LSApplicationQueriesSchemes');
              if (ACFBundleURLTypesArrayNode<>nil) then
              begin
                    ACFBundleURLSchemesList.Clear;
                    //<array>里面是<string>列表
                    for I := 0 to ACFBundleURLTypesArrayNode.ChildNodes.Count-1 do
                    begin
                        //<string>fbapi</string>
                        //<string>fb-messenger-api</string>
                        //<string>fbauth2</string>
                        //<string>fbshareextension</string>
                        ACFBundleURLSchemesList.Add(ACFBundleURLTypesArrayNode.ChildNodes[I].Text);
                    end;
              end
              else
              begin
                  //不存在,则添加
                  ACFBundleURLTypesArrayNode:=AXMLNode.AddChild('key');
                  ACFBundleURLTypesArrayNode.Text:='LSApplicationQueriesSchemes';
                  ACFBundleURLTypesArrayNode:=AXMLNode.AddChild('array');
              end;



              //<dict>列表
              for I := 0 to AInsertCFBundleURLTypesArrayNode.ChildNodes.Count-1 do
              begin
                  //LSApplicationQueriesSchemes中判断是否已经存在
                  AIsExisted:=False;
                  if ACFBundleURLSchemesList.IndexOf(AInsertCFBundleURLTypesArrayNode.ChildNodes[I].Text)<>-1 then
                  begin
                    //不存在,则添加该<string>
                    AIsExisted:=True;
                  end;

                  if Not AIsExisted then
                  begin
                    ACFBundleURLTypesArrayDictNode:=ACFBundleURLTypesArrayNode.AddChild('string');
                    CopyXMLNode(AInsertCFBundleURLTypesArrayNode.ChildNodes[I],ACFBundleURLTypesArrayDictNode);
                  end;
              end;

                      
          end
          else
          begin
              //判断是否存在
              if FindChildXMLNodeIndex(AInsertXMLNode.ChildNodes[AIndex].NodeName,
                                        AInsertXMLNode.ChildNodes[AIndex].Text,
                                        AXMLNode)=-1 then
              begin
                  //<key>FacebookAppID</key>
                  //<string>1218646208237299</string>
                  ACFBundleURLTypesArrayDictNode:=AXMLNode.AddChild(AInsertXMLNode.ChildNodes[AIndex].NodeName);
                  CopyXMLNode(AInsertXMLNode.ChildNodes[AIndex],ACFBundleURLTypesArrayDictNode);
                  ACFBundleURLTypesArrayDictNode:=AXMLNode.AddChild(AInsertXMLNode.ChildNodes[AIndex+1].NodeName);
                  CopyXMLNode(AInsertXMLNode.ChildNodes[AIndex+1],ACFBundleURLTypesArrayDictNode);
              end;
          end;


          //key+value对形式的
          Inc(AIndex,2);
      end;







      AXMLDocument.SaveToFile(ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml');
      AStringStream:=TStringStream.Create('',TEncoding.UTF8);
      try
          AStringStream.LoadFromFile(ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml');
          AInfoPlistXMLStr:=AStringStream.DataString;
          //插入这两个变量,才是合法的XML格式文档
          I:=Pos('<plist version="1.0">',AInfoPlistXMLStr);
          if I>0 then
          begin
            AInfoPlistXMLStr:=Copy(AInfoPlistXMLStr,1,I-1)
                    +'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
                    +Copy(AInfoPlistXMLStr,I,MaxInt);
          end;
          I:=Pos('<dict>',AInfoPlistXMLStr);
          if I>0 then
          begin
            I:=I+Length('<dict>');
            AInfoPlistXMLStr:=Copy(AInfoPlistXMLStr,1,I-1)
                    +'<%VersionInfoPListKeys%>'
                    +'<%ExtraInfoPListKeys%>'
                    +Copy(AInfoPlistXMLStr,I,MaxInt);
          end;

          AStringStream.Position:=0;
          AStringStream.WriteString(AInfoPlistXMLStr);

          AStringStream.Position:=0;
          AStringStream.SaveToFile(ExtractFilePath(AProjectFilePath)+'info.plist.TemplateiOS.xml');
      finally
        FreeAndNil(AStringStream);
      end;






     Result:=True;
  finally
    AXMLDocument.Free;
    AInsertXMLDocument.Free;
    ACFBundleURLSchemesList.Free;
  end;

end;

function TProjectConfig.SaveIOSLinkerOptionsToProject(AProjectFilePath,
  ALinkerOptions: String): Boolean;
var
  AXMLNode: IXMLNode;
  AXMLChildNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  I: Integer;
  J:Integer;
  ADCC_LinkerOptionsNode:IXMLNode;
  AOldLinkerOptions:String;
  ALinkerOptionsStringList:TStringList;
  AOldLinkerOptionsStringList:TStringList;
begin
  Result:=False;

  //因为需要计算出相对目录
  if (AProjectFilePath='') then
  begin
    ShowMessage(GetLangString(['请选择工程文件',
                                'Please select project file'  ]));
                                //'请选择工程文件');
    Exit;
  end;

  if Not FileExists(AProjectFilePath) then
  begin
    ShowMessage(GetLangString(['工程文件不存在',
                                'Project file is not exist'  ]));
                                //'工程文件不存在');
    Exit;
  end;

  if ALinkerOptions='' then
  begin
    Result:=True;
    Exit;
  end;




  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

      if AXMLNode<>nil then
      begin
        for I := 0 to AXMLNode.ChildNodes.Count-1 do
        begin
          AXMLChildNode:=AXMLNode.ChildNodes[I];


            //IOS
            if (AXMLChildNode.NodeName='PropertyGroup')
              and (
                   (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice32)''!=''''')

                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice64)''!=''''')

//                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSSimulator)''!=''''')
//                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSSimulator)''!=''''')
//                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSSimulator)''!=''''')
                ) then
            begin

//                <PropertyGroup Condition="'$(Cfg_2_iOSDevice32)'!=''">
//                    <DCC_LinkerOptions>-framework SystemConfiguration</DCC_LinkerOptions>

                ADCC_LinkerOptionsNode:=AXMLChildNode.ChildNodes.FindNode('DCC_LinkerOptions');
                if ADCC_LinkerOptionsNode=nil then
                begin
                  ADCC_LinkerOptionsNode:=AXMLChildNode.AddChild('DCC_LinkerOptions');
                end;
                AOldLinkerOptions:=ADCC_LinkerOptionsNode.Text;



                ALinkerOptionsStringList:=TStringList.Create;
                AOldLinkerOptionsStringList:=TStringList.Create;
                try
                  ALinkerOptionsStringList.Delimiter:=' ';
                  ALinkerOptionsStringList.StrictDelimiter:=True;
                  ALinkerOptionsStringList.DelimitedText:=ALinkerOptions;

                  AOldLinkerOptionsStringList.Delimiter:=' ';
                  AOldLinkerOptionsStringList.StrictDelimiter:=True;
                  AOldLinkerOptionsStringList.DelimitedText:=AOldLinkerOptions;


                  //-framework CFNetwork
                  //-framework SystemConfiguration
                  //-framework CoreTelephony
                  //-lstdc++
                  for J := 0 to ALinkerOptionsStringList.Count-1 do
                  begin
                    if (AOldLinkerOptionsStringList.IndexOf(ALinkerOptionsStringList[J])=-1)
                      and (ALinkerOptionsStringList[J]<>'-framework')
                      and (ALinkerOptionsStringList[J]<>'-force_load') then
                    begin
                            if (ALinkerOptionsStringList[J-1]='-framework')
                              or (ALinkerOptionsStringList[J-1]='-force_load') then
                            begin
                              AOldLinkerOptions:=AOldLinkerOptions
                                    +' '+ALinkerOptionsStringList[J-1]+' '+ALinkerOptionsStringList[J];
                            end
                            else
                            begin
                              AOldLinkerOptions:=AOldLinkerOptions
                                    +' '+ALinkerOptionsStringList[J];
                            end;

                    end;
                  end;


                  ADCC_LinkerOptionsNode.Text:=AOldLinkerOptions;


                finally
                  FreeAndNil(ALinkerOptionsStringList);
                  FreeAndNil(AOldLinkerOptionsStringList);
                end;

            end;



        end;
      end;


      AXMLDocument.SaveToFile(AProjectFilePath);

      Result:=True;
  finally
    AXMLDocument.Free;
  end;
end;

function TProjectConfig.SaveDeployFileListToProject(
  ADeployFileList: TDeployFileList; AProjectFilePath: String):Boolean;
var
  I: Integer;
  AXMLNode: IXMLNode;
  AXMLDocument: TXMLDocument;
begin
  Result:=False;


  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;


      //<Project
      //  <ProjectExtensions>
      //    <BorlandProject>
      //        <Deployment Version="3">
      //            <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPad\FM_LaunchImageLandscape_1024x768.png"
      //                Configuration="Release"
      //                Class="iPad_Launch1024x768"/>
      //            <DeployFile LocalName="$(BDS)\bin\Artwork\iOS\iPhone\FM_SpotlightSearchIcon_29x29.png" Configuration="Debug" Class="iPhone_Spotlight29"/>
      //            <DeployFile LocalName="BaiduMapSDK\BaiduMapAPIFramework\BaiduMapAPI_Map.framework\Resources\mapapi.bundle\files\DVDirectory.cfg" Configuration="Release" Class="File">
      //                <Platform Name="iOSDevice32">
      //                    <RemoteDir>.\mapapi.bundle\files\</RemoteDir>
      //                    <RemoteName>DVDirectory.cfg</RemoteName>
      //                    <Overwrite>true</Overwrite>
      //                </Platform>
      //            </DeployFile>
      //
      //            <DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so" Configuration="Release" Class="File">
      //                <Platform Name="Android">
      //                    <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
      //                    <RemoteName>libTbDemuxer.so</RemoteName>
      //                    <Overwrite>true</Overwrite>
      //                </Platform>
      //            </DeployFile>


      AXMLNode:=AXMLNode.ChildNodes.FindNode('ProjectExtensions');
      if AXMLNode<>nil then
      begin
        AXMLNode:=AXMLNode.ChildNodes.FindNode('BorlandProject');
        if AXMLNode<>nil then
        begin
          AXMLNode:=AXMLNode.ChildNodes.FindNode('Deployment');
          if (AXMLNode<>nil) then
          begin
            if (AXMLNode.Attributes['Version']='3') then
            begin


                  //把布署文件列表添加到工程文件的xml
                  for I := 0 to ADeployFileList.Count-1 do
                  begin
                      SaveDeployFileToXMLNode(ADeployFileList[I],
                                              AXMLNode,
                                              AProjectFilePath);
                  end;

                  AXMLDocument.SaveToFile(AProjectFilePath);

                  Result:=True;

            end
            else
            begin
  //              DoDeployConfigLog(Self,'不支持此工程文件的Deployment版本');
                ShowMessage(GetLangString(['不支持此工程文件的Deployment版本',
                                          'Can not support this deployment version'  ]));
                                          //'不支持此工程文件的Deployment版本');
            end;
          end
          else
          begin
  //            DoDeployConfigLog(Self,'此工程文件不存在Deployment节点');
              ShowMessage(GetLangString(['此工程文件不存在Deployment节点',
                                          'Deployment node is not exist'  ]));
                                          //'此工程文件不存在Deployment节点');
          end;
          end
        else
        begin
  //          DoDeployConfigLog(Self,'此工程文件不存在BorlandProject节点');
            ShowMessage(GetLangString(['此工程文件不存在BorlandProject节点',
                                          'BorlandProject node is not exist'  ]));
                                          //'此工程文件不存在BorlandProject节点');
        end;
      end
      else
      begin
        ShowMessage(GetLangString(['不存在ProjectExtensions节点',
                                    'ProjectExtensions node is not exist'  ]));
                                    //'不存在ProjectExtensions节点');
      end;


  finally
    AXMLDocument.Free;
  end;

end;

function TProjectConfig.SaveDeployFileToXMLNode(ADeployFile: TDeployFile;
                                                AXMLNode: IXMLNode;
                                                AProjectFilePath:String): Boolean;
var
  ALastDeployFileNodeIndex:Integer;
//  AEnabledDeployFileXMLNode:IXMLNode;
  ADeployFileXMLNode:IXMLNode;
//  ADeployFilePlatformXMLNode:IXMLNode;

  I: Integer;
  ARemoteDirNode:IXMLNode;
  ARemoteNameNode:IXMLNode;
  AIsLostSomePlatform:Boolean;
  AExistsLocalNameList:TStringList;



//  AXMLAFilePath:String;
//  AXMLBFilePath:String;
//  ADestXMLFileName:String;
//  ADestXMLFilePath:String;
//  AEnableXMLNode:IXMLNode;
//
//  AMixedXMLDeployFile:TDeployFile;
//  ADeployFilePlatform:TDeployFilePlatform;
begin




    //<DeployFile LocalName="TBUISDK\APK\lib\armeabi\libTbDemuxer.so"
    //        Configuration="Release"
    //        Class="File">
    //    <Platform Name="Android">
    //        <RemoteDir>library\lib\armeabi-v7a\</RemoteDir>
    //        <RemoteName>libTbDemuxer.so</RemoteName>
    //        <Overwrite>true</Overwrite>
    //    </Platform>
    //</DeployFile>

//    AEnabledDeployFileXMLNode:=nil;
    AIsLostSomePlatform:=False;
    AExistsLocalNameList:=TStringList.Create;



    //判断是否已经存在部署XML节点
    //目前是使用最简单的方法
    //根据RemoteDir+RemoteName+Platform来判断
    ADeployFileXMLNode:=FindDeployFileXMLNode(ADeployFile,
                                              AXMLNode,
//                                              ADeployFilePlatformXMLNode,
//                                              AEnabledDeployFileXMLNode,
                                              AExistsLocalNameList,
                                              AIsLostSomePlatform);

//    if AEnabledDeployFileXMLNode<>nil then
//    begin
//      ADeployFileXMLNode:=AEnabledDeployFileXMLNode;
//    end;





    if (ADeployFileXMLNode<>nil)
      //只合并XML文件
      //and SameText(ExtractFileExt(ADeployFile.LocalName),'.xml')
      then
    begin
          //已经存在DeployFile的节点,但是没有Platform的子节点
          //只需要添加Platform的子节点

          //这个文件要布署到哪些平台
          for I := 0 to ADeployFile.Platforms.Count-1 do
          begin


            AddDeployFilePlatformToXMLNode(ADeployFile,
                                           ADeployFile.Platforms[I],
                                           ADeployFileXMLNode
                                           );

          end;


//
//        //已存在,合并XML
//        //是自己吗?根据LocalName来判断
//        //是上次配置的自己吗?
//        if (AExistsLocalNameList.IndexOf(ADeployFile.LocalName)<>-1)
//          //SameText(ADeployFileXMLNode.Attributes['LocalName'],ADeployFile.LocalName)
//          then
//        begin
//            //是自己,跳过
//
//        end
//        //此布署项是启用的,需要合并,
//        //不启用的不合并
//        else if AEnabledDeployFileXMLNode<>nil then
//        begin
//
//
//
//            //需要合并
//            DoDeployConfigLog(Self,'已经存在此布署文件'+ADeployFile.LocalName);
//
//
////                //不是自己,合并
////                AXMLAFilePath:=
////                          ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectFilePath),
////                              ADeployFileXMLNode.Attributes['LocalName']);
////
////                if Not FileExists(AXMLAFilePath) then
////                begin
////    //                DoDeployConfigLog(Self,'此布署文件不存在'+ADeployFileXMLNode.Attributes['LocalName']);
////                    //不存在,则跳过,
////                    //不过有一种情况是style.xml
////                    if (ADeployFileXMLNode.LocalName='Android\Release\styles.xml')
////                      or (ADeployFileXMLNode.LocalName='Android\Debug\styles.xml') then
////                    begin
////                      Exit;
////                    end
////                    else
////                    begin
////                      Exit;
////                    end;
////                end;
////
////
////
////                //存在相同的xml,则需要合并
////                //E:\DelphiTwitterKitTest\TwitterKitSDK\twitter-core-3.0.0\res\values\values.xml
////                AXMLBFilePath:=
////                          ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectFilePath),
////                              ADeployFile.LocalName);
////                //.\MixedXML\Android\values.xml
////                ADestXMLFileName:='.'+'\'
////                                    +'MixedXML'+'\'
////                                    +ADeployFile.Platforms[0].Platform_+'\'
////                                    +ExtractFileName(ADeployFile.LocalName);
////                //E:\DelphiTwitterKitTest\MixedXML\Android\values.xml
////                ADestXMLFilePath:=
////                          ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectFilePath),
////                              ADestXMLFileName);
////                ForceDirectories(ExtractFilePath(ADestXMLFilePath));
////
////                //合并XML文件
//////                CombineXML(AXMLAFilePath,AXMLBFilePath,ADestXMLFilePath);
////
////
////
////                //如果不是自己,因为合并过的文件项不用再添加到工程文件中了
////                if not SameText(ADeployFileXMLNode.Attributes['LocalName'],ADestXMLFileName) then
////                begin
////
////                    ADeployFile.Platforms[0].Enabled:='false';
////                    AddDeployFileToXMLNode(ADeployFile,AXMLNode);
////
////
////                    //并且把原先布署启用的XML节点设置为不启用布署
////                    AEnableXMLNode:=ADeployFilePlatformXMLNode.ChildNodes.FindNode('Enabled');
////                    if AEnableXMLNode=nil then
////                    begin
////                      AEnableXMLNode:=ADeployFilePlatformXMLNode.AddChild('Enabled');
////                    end;
////                    AEnableXMLNode.Text:='false';
////
////
////                    //添加合并后的xml
////                    AMixedXMLDeployFile:=TDeployFile.Create;
////                    AMixedXMLDeployFile.LocalName:=ADestXMLFileName;
////                    AMixedXMLDeployFile.Class_:='File';
////                    //布署到指定平台
////                    ADeployFilePlatform:=TDeployFilePlatform.Create;
////                    ADeployFilePlatform.Platform_:=ADeployFile.Platforms[0].Platform_;
////
////                    //取出文件名
////                    ADeployFilePlatform.RemoteName:=ADeployFile.Platforms[0].RemoteName;
////                    //取出文件路径
////                    ADeployFilePlatform.RemoteDir:=ADeployFile.Platforms[0].RemoteDir;
////                    //避免每次都布署
////                    ADeployFilePlatform.Overwrite:='False';
////                    AMixedXMLDeployFile.Platforms.Add(ADeployFilePlatform);
////
////                    AddDeployFileToXMLNode(AMixedXMLDeployFile,AXMLNode);
////
////                end;
//
//
//
//        end;
    end
    else
    begin
//        Exit;//测试跳过

        AddDeployFileToXMLNode(ADeployFile,AXMLNode);

    end;


end;


function TProjectConfig.SaveProjectIconToProject(AProjectFilePath: String): Boolean;
var
  AXMLNode: IXMLNode;
  AXMLChildNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  I: Integer;
begin
  Result:=False;

  //因为需要计算出相对目录
  if (AProjectFilePath='') then
  begin
    DoDeployConfigLog(nil,GetLangString(['请选择工程文件',
                                        'Please select project file'  ]));
                                        //'请选择工程文件');
    Exit;
  end;

  if Not FileExists(AProjectFilePath) then
  begin
    DoDeployConfigLog(nil,GetLangString(['工程文件不存在',
                                        'Project file is not exist'  ]));
                                        //'工程文件不存在');
    Exit;
  end;




  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
    //  AXMLDocument.Version:='1.0';
    //  AXMLDocument.Encoding:='GB2312';
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

//    <PropertyGroup Condition="'$(Cfg_2_Android)'!=''">
//        <PF_KeyStorePass>857E479A5FCF07DFCF26E560A4467BA2E44808467EBBECAD97E40FA78E273CF6DB5EA3DEE3551C63C1A4572EFACFC36ABAB3361C046522D316204584E58822A2C958F35CD507FA8FBFBAAF0007301D44921D3E131DF90939EB006E7F</PF_KeyStorePass>
//        <PF_AliasKey>police</PF_AliasKey>
//        <PF_KeyStore>E:\MyFiles\OrangeUIProduct\粤警党风\APP\police_138575wangneng.keystore</PF_KeyStore>
//        <PF_AliasKeyPass>857E479A5FCF07DFCF26E560D171E33F81850535A05F97C997AA0FF88E783C8ADB56A385E3111C2FC1E2577DFAC4C363BA95367E043722D3163A459DE5E4229DC938F341D558FA9BBFF8AF117237859AF7D53319C3477255EB006E7F</PF_AliasKeyPass>
//        <BT_BuildType>AppStore</BT_BuildType>
//        <Android_SplashImage640>android_fill_640x480.png</Android_SplashImage640>
//        <Android_SplashImage426>android_fill_426x320.png</Android_SplashImage426>
//        <Android_LauncherIcon48>android48.png</Android_LauncherIcon48>
//        <Android_LauncherIcon144>android144.png</Android_LauncherIcon144>
//        <VerInfo_Build>1</VerInfo_Build>
//        <Android_LauncherIcon96>android96.png</Android_LauncherIcon96>
//        <Android_SplashTileMode>disabled</Android_SplashTileMode>
//        <Android_LauncherIcon72>android72.png</Android_LauncherIcon72>
//        <Android_SplashGravity>fill</Android_SplashGravity>
//        <Android_LauncherIcon36>android36.png</Android_LauncherIcon36>
//        <Android_SplashImage960>android_fill_960x720.png</Android_SplashImage960>
//        <VerInfo_Keys>package=com.ggggcexx.policepartywind;label=粤警党风;versionCode=1;versionName=1.2.0;persistent=False;restoreAnyVersion=False;installLocation=auto;largeHeap=False;theme=TitleBar;hardwareAccelerated=true;apiKey=</VerInfo_Keys>
//        <Android_SplashImage470>android_fill_470x320.png</Android_SplashImage470>
//    </PropertyGroup>

//                <DeployFile LocalName="android144.png" Configuration="Release" Class="Android_LauncherIcon144">
//                    <Platform Name="Android">
//                        <RemoteName>ic_launcher.png</RemoteName>
//                        <Overwrite>true</Overwrite>
//                    </Platform>
//                </DeployFile>


      AXMLNode:=AXMLDocument.DocumentElement;
      if AXMLNode<>nil then
      begin
        for I := 0 to AXMLNode.ChildNodes.Count-1 do
        begin
          AXMLChildNode:=AXMLNode.ChildNodes[I];


            //Android
            if (AXMLChildNode.NodeName='PropertyGroup')
              and (
                   (AXMLChildNode.Attributes['Condition']='''$(Base_Android)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_Android)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_Android)''!=''''')
                ) then
            begin

              SaveProjectPictureToProjectXMLNode(36,36,'Android_LauncherIcon36',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(48,48,'Android_LauncherIcon48',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(72,72,'Android_LauncherIcon72',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(96,96,'Android_LauncherIcon96',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(144,144,'Android_LauncherIcon144',AXMLNode.ChildNodes[I]);


              SaveProjectPictureToProjectXMLNode(24,24,'Android_NotificationIcon24',AXMLNode.ChildNodes[I],'24_24.png');
              SaveProjectPictureToProjectXMLNode(36,36,'Android_NotificationIcon36',AXMLNode.ChildNodes[I],'36_36.png');
              SaveProjectPictureToProjectXMLNode(48,48,'Android_NotificationIcon48',AXMLNode.ChildNodes[I],'48_48.png');
              SaveProjectPictureToProjectXMLNode(72,72,'Android_NotificationIcon72',AXMLNode.ChildNodes[I],'72_72.png');
              SaveProjectPictureToProjectXMLNode(96,96,'Android_NotificationIcon96',AXMLNode.ChildNodes[I],'96_96.png');


            end;


            //IOS
            if (AXMLChildNode.NodeName='PropertyGroup')
              and (
                   (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice32)''!=''''')

                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice64)''!=''''')

                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSSimulator)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSSimulator)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSSimulator)''!=''''')
                ) then
            begin
    //        <iPad_SpotLight40>iphone40.png</iPad_SpotLight40>
    //        <iPad_SpotLight50>iphone50.png</iPad_SpotLight50>
    //        <iPad_SpotLight80>iphone80.png</iPad_SpotLight80>
    //        <iPad_SpotLight100>iphone100.png</iPad_SpotLight100>
    //        <iPhone_Spotlight29>iphone29.png</iPhone_Spotlight29>
    //        <iPhone_Spotlight40>iphone40.png</iPhone_Spotlight40>
    //        <iPhone_Spotlight58>iphone58.png</iPhone_Spotlight58>
    //        <iPhone_Spotlight80>iphone80.png</iPhone_Spotlight80>
    //
    //        <iPad_Setting29>iphone29.png</iPad_Setting29>
    //        <iPad_Setting58>iphone58.png</iPad_Setting58>
    //
    //        <iPhone_AppIcon57>iphone57.png</iPhone_AppIcon57>
    //        <iPhone_AppIcon60>iphone60.png</iPhone_AppIcon60>
    //        <iPhone_AppIcon87>iphone87.png</iPhone_AppIcon87>
    //        <iPhone_AppIcon114>iphone114.png</iPhone_AppIcon114>
    //        <iPhone_AppIcon120>iphone120.png</iPhone_AppIcon120>
    //        <iPhone_AppIcon180>iphone180.png</iPhone_AppIcon180>
    //        <iPad_AppIcon72>iphone72.png</iPad_AppIcon72>
    //        <iPad_AppIcon76>iphone76.png</iPad_AppIcon76>
    //        <iPad_AppIcon144>ipad144.png</iPad_AppIcon144>
    //        <iPad_AppIcon152>ipad152.png</iPad_AppIcon152>
    //
    //        <iPad_Setting29>iphone29.png</iPad_Setting29>
    //        <iPad_Setting58>iphone58.png</iPad_Setting58>

              SaveProjectPictureToProjectXMLNode(57,57,'iPhone_AppIcon57',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(60,60,'iPhone_AppIcon60',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(87,87,'iPhone_AppIcon87',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(114,114,'iPhone_AppIcon114',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(120,120,'iPhone_AppIcon120',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(180,180,'iPhone_AppIcon180',AXMLNode.ChildNodes[I]);

              SaveProjectPictureToProjectXMLNode(72,72,'iPad_AppIcon72',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(76,76,'iPad_AppIcon76',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(144,144,'iPad_AppIcon144',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(152,152,'iPad_AppIcon152',AXMLNode.ChildNodes[I]);


              SaveProjectPictureToProjectXMLNode(29,29,'iPhone_Spotlight29',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(40,40,'iPhone_Spotlight40',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(58,58,'iPhone_Spotlight58',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(80,80,'iPhone_Spotlight80',AXMLNode.ChildNodes[I]);

              SaveProjectPictureToProjectXMLNode(40,40,'iPad_Spotlight40',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(50,50,'iPad_Spotlight50',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(80,80,'iPad_Spotlight80',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(100,100,'iPad_Spotlight100',AXMLNode.ChildNodes[I]);

              SaveProjectPictureToProjectXMLNode(29,29,'iPad_Setting29',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(58,58,'iPad_Setting58',AXMLNode.ChildNodes[I]);



              //10.3
              SaveProjectPictureToProjectXMLNode(83,83,'iPad_AppIcon83_5',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(167,167,'iPad_AppIcon167',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(120,120,'iPhone_Spotlight120',AXMLNode.ChildNodes[I]);





            end;



        end;
      end;


//      AXMLNode:=AXMLDocument.DocumentElement;
//      AXMLNode:=AXMLNode.ChildNodes.FindNode('ProjectExtensions');
//      if AXMLNode<>nil then
//      begin
//        AXMLNode:=AXMLNode.ChildNodes.FindNode('BorlandProject');
//        if AXMLNode<>nil then
//        begin
//          AXMLNode:=AXMLNode.ChildNodes.FindNode('Deployment');
//          if (AXMLNode<>nil) then
//          begin
//            if (AXMLNode.Attributes['Version']='3') then
//            begin
//
//                  //把布署文件列表添加到xml
//                  for I := 0 to Self.FDeployConfigList.FPreviewDeployFileList.Count-1 do
//                  begin
//                    SaveDeployFileToXMLNode(Self.FDeployConfigList.FPreviewDeployFileList[I],
//                                            AXMLNode);
//                  end;
//
//
//
//                  AXMLDocument.SaveToFile(AProjectFilePath);
//
//                  Result:=True;
//
//            end
//            else
//            begin
//              DoDeployConfigLog(nil,'不支持此Deployment版本');
//            end;
//          end
//          else
//          begin
//            DoDeployConfigLog(nil,'不存在Deployment节点');
//          end;
//          end
//        else
//        begin
//          DoDeployConfigLog(nil,'不存在BorlandProject节点');
//        end;
//      end
//      else
//      begin
//        DoDeployConfigLog(nil,'不存在ProjectExtensions节点');
//      end;

      AXMLDocument.SaveToFile(AProjectFilePath);
  finally
    AXMLDocument.Free;
  end;

end;

function TProjectConfig.SaveProjectLaunchImageToProject(
  AProjectFilePath: String): Boolean;
var
  AXMLNode: IXMLNode;
  AXMLChildNode: IXMLNode;
  AXMLDocument: TXMLDocument;
  I: Integer;
begin
  Result:=False;

  //因为需要计算出相对目录
  if (AProjectFilePath='') then
  begin
    DoDeployConfigLog(nil,GetLangString(['请选择工程文件',
                                        'Please select project file'  ]));
                                        //'请选择工程文件');
    Exit;
  end;

  if Not FileExists(AProjectFilePath) then
  begin
    DoDeployConfigLog(nil,GetLangString(['工程文件不存在',
                                        'Project file is not exist'  ]));
                                        //'工程文件不存在');
    Exit;
  end;




  //创建XML文档
  AXMLDocument:=TXMLDocument.Create(Application);
  try
      AXMLDocument.LoadFromFile(AProjectFilePath);
      AXMLDocument.Active:=True;
      AXMLNode:=AXMLDocument.DocumentElement;

//    <PropertyGroup Condition="'$(Cfg_2_Android)'!=''">
//        <PF_KeyStorePass>857E479A5FCF07DFCF26E560A4467BA2E44808467EBBECAD97E40FA78E273CF6DB5EA3DEE3551C63C1A4572EFACFC36ABAB3361C046522D316204584E58822A2C958F35CD507FA8FBFBAAF0007301D44921D3E131DF90939EB006E7F</PF_KeyStorePass>
//        <PF_AliasKey>police</PF_AliasKey>
//        <PF_KeyStore>E:\MyFiles\OrangeUIProduct\粤警党风\APP\police_138575wangneng.keystore</PF_KeyStore>
//        <PF_AliasKeyPass>857E479A5FCF07DFCF26E560D171E33F81850535A05F97C997AA0FF88E783C8ADB56A385E3111C2FC1E2577DFAC4C363BA95367E043722D3163A459DE5E4229DC938F341D558FA9BBFF8AF117237859AF7D53319C3477255EB006E7F</PF_AliasKeyPass>
//        <BT_BuildType>AppStore</BT_BuildType>

//        <Android_LauncherIcon36>android36.png</Android_LauncherIcon36>
//        <Android_LauncherIcon48>android48.png</Android_LauncherIcon48>
//        <Android_LauncherIcon72>android72.png</Android_LauncherIcon72>
//        <Android_LauncherIcon96>android96.png</Android_LauncherIcon96>

//        <Android_LauncherIcon144>android144.png</Android_LauncherIcon144>

//        <VerInfo_Build>1</VerInfo_Build>
//        <Android_SplashTileMode>disabled</Android_SplashTileMode>
//        <Android_SplashGravity>fill</Android_SplashGravity>

//        <Android_SplashImage426>android_fill_426x320.png</Android_SplashImage426>
//        <Android_SplashImage470>android_fill_470x320.png</Android_SplashImage470>
//        <Android_SplashImage640>android_fill_640x480.png</Android_SplashImage640>
//        <Android_SplashImage960>android_fill_960x720.png</Android_SplashImage960>

//        <VerInfo_Keys>package=com.ggggcexx.policepartywind;label=粤警党风;versionCode=1;versionName=1.2.0;persistent=False;restoreAnyVersion=False;installLocation=auto;largeHeap=False;theme=TitleBar;hardwareAccelerated=true;apiKey=</VerInfo_Keys>
//    </PropertyGroup>

//                <DeployFile LocalName="android144.png" Configuration="Release" Class="Android_LauncherIcon144">
//                    <Platform Name="Android">
//                        <RemoteName>ic_launcher.png</RemoteName>
//                        <Overwrite>true</Overwrite>
//                    </Platform>
//                </DeployFile>



//    <PropertyGroup Condition="'$(Cfg_2_iOSDevice32)'!=''">
//        <VerInfo_MinorVer>2</VerInfo_MinorVer>
//        <PF_AutoMobileProvisionAdHoc>False</PF_AutoMobileProvisionAdHoc>
//        <PF_MobileProvisionAdHoc>2f334ed2-a196-42bd-8a75-fd893d9fe907</PF_MobileProvisionAdHoc>
//        <PF_DevAdHoc>iPhone Distribution: silin fang (L7K5FEPWXY)</PF_DevAdHoc>
//        <PF_AutoCertificateAdHoc>False</PF_AutoCertificateAdHoc>
//        <PF_DevDebug>iPhone Developer: silin fang (2K9E4G72YV)</PF_DevDebug>
//        <PF_AutoCertificateDebug>False</PF_AutoCertificateDebug>
//        <PF_AutoMobileProvisionDebug>False</PF_AutoMobileProvisionDebug>
//        <VerInfo_UIDeviceFamily>iPhoneAndiPad</VerInfo_UIDeviceFamily>
//        <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
//        <VerInfo_BundleId>com.ggggcexx.policepartywind</VerInfo_BundleId>
//        <PF_MobileProvisionDebug>fe1056dd-7240-4fda-8aff-4af81ceeb5b8</PF_MobileProvisionDebug>
//
//        <iPad_SpotLight40>iphone40.png</iPad_SpotLight40>
//        <iPad_SpotLight50>iphone50.png</iPad_SpotLight50>
//        <iPad_SpotLight80>iphone80.png</iPad_SpotLight80>
//        <iPad_SpotLight100>iphone100.png</iPad_SpotLight100>
//        <iPhone_Spotlight29>iphone29.png</iPhone_Spotlight29>
//        <iPhone_Spotlight40>iphone40.png</iPhone_Spotlight40>
//        <iPhone_Spotlight58>iphone58.png</iPhone_Spotlight58>
//        <iPhone_Spotlight80>iphone80.png</iPhone_Spotlight80>
//
//        <iPad_Setting29>iphone29.png</iPad_Setting29>
//        <iPad_Setting58>iphone58.png</iPad_Setting58>
//
//        <iPhone_AppIcon57>iphone57.png</iPhone_AppIcon57>
//        <iPhone_AppIcon60>iphone60.png</iPhone_AppIcon60>
//        <iPhone_AppIcon87>iphone87.png</iPhone_AppIcon87>
//        <iPhone_AppIcon114>iphone114.png</iPhone_AppIcon114>
//        <iPhone_AppIcon120>iphone120.png</iPhone_AppIcon120>
//        <iPhone_AppIcon180>iphone180.png</iPhone_AppIcon180>
//        <iPad_AppIcon72>iphone72.png</iPad_AppIcon72>
//        <iPad_AppIcon76>iphone76.png</iPad_AppIcon76>
//        <iPad_AppIcon144>ipad144.png</iPad_AppIcon144>
//        <iPad_AppIcon152>ipad152.png</iPad_AppIcon152>
//
//        <iPad_Setting29>iphone29.png</iPad_Setting29>
//        <iPad_Setting58>iphone58.png</iPad_Setting58>
//
//        <iPad_Launch768>ipad768_1004.png</iPad_Launch768>
//        <iPad_Launch768x1024>ipad768_1024.png</iPad_Launch768x1024>
//        <iPad_Launch1024>ipad1024_748.png</iPad_Launch1024>
//        <iPad_Launch1024x768>ipad1024_768.png</iPad_Launch1024x768>
//        <iPad_Launch1536>ipad1536_2008.png</iPad_Launch1536>
//        <iPad_Launch1536x2048>ipad1536_2048.png</iPad_Launch1536x2048>
//        <iPad_Launch2048>ipad2048_1496.png</iPad_Launch2048>
//        <iPad_Launch2048x1536>ipad2048_1536.png</iPad_Launch2048x1536>
//
//        <iPhone_Launch320>iphone320_480.png</iPhone_Launch320>
//        <iPhone_Launch640>iphone640_960.png</iPhone_Launch640>
//        <iPhone_Launch640x1136>iphone640_1136.png</iPhone_Launch640x1136>
//        <iPhone_Launch750>iphone750_1334.png</iPhone_Launch750>
//        <iPhone_Launch1242>iphone1242_2208.png</iPhone_Launch1242>
//        <iPhone_Launch2208>iphone2208_1242.png</iPhone_Launch2208>
//
//        <VerInfo_Keys>
//            CFBundleName=$(MSBuildProjectName);
//            CFBundleDevelopmentRegion=en;
//            CFBundleDisplayName=粤警党风;
//            CFBundleIdentifier=com.ggggcexx.policepartywind;
//            CFBundleInfoDictionaryVersion=7.1;
//            CFBundleVersion=1.2.0;
//            CFBundlePackageType=APPL;
//            CFBundleSignature=????;
//            LSRequiresIPhoneOS=true;
//            CFBundleAllowMixedLocalizations=YES;
//            CFBundleExecutable=$(MSBuildProjectName);
//            UIDeviceFamily=iPhone &amp; iPad;
//            CFBundleResourceSpecification=ResourceRules.plist;
//            NSLocationAlwaysUsageDescription=The reason for accessing the location information of the user;
//            NSLocationWhenInUseUsageDescription=The reason for accessing the location information of the user;
//            FMLocalNotificationPermission=false;
//            UIBackgroundModes=;
//            DTSDKName=iphoneos7.0;
//            DTPlatformVersion=7.0;
//            UIStatusBarStyle=UIStatusBarStyleLightContent;
//            DTPlatFormName=iphoneos;
//            NSContactsUsageDescription=The reason for accessing the contacts;
//            NSPhotoLibraryUsageDescription=The reason for accessing the photo library;
//            NSCameraUsageDescription=The reason for accessing the camera</VerInfo_Keys>
//    </PropertyGroup>


      AXMLNode:=AXMLDocument.DocumentElement;
      if AXMLNode<>nil then
      begin
        for I := 0 to AXMLNode.ChildNodes.Count-1 do
        begin
          AXMLChildNode:=AXMLNode.ChildNodes[I];


            //Android
            if (AXMLChildNode.NodeName='PropertyGroup')
              and (
                   (AXMLChildNode.Attributes['Condition']='''$(Base_Android)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_Android)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_Android)''!=''''')
                ) then
            begin

              SaveProjectPictureToProjectXMLNode(426,320,'Android_SplashImage426',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(470,320,'Android_SplashImage470',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(640,480,'Android_SplashImage640',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(960,720,'Android_SplashImage960',AXMLNode.ChildNodes[I]);

            end;


            //IOS
            if (AXMLChildNode.NodeName='PropertyGroup')
              and (
                   (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice32)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice32)''!=''''')

                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSDevice64)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSDevice64)''!=''''')

                or (AXMLChildNode.Attributes['Condition']='''$(Base_iOSSimulator)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_1_iOSSimulator)''!=''''')
                or (AXMLChildNode.Attributes['Condition']='''$(Cfg_2_iOSSimulator)''!=''''')
                ) then
            begin
    //        <iPad_Launch768>ipad768_1004.png</iPad_Launch768>
    //        <iPad_Launch768x1024>ipad768_1024.png</iPad_Launch768x1024>
    //        <iPad_Launch1024>ipad1024_748.png</iPad_Launch1024>
    //        <iPad_Launch1024x768>ipad1024_768.png</iPad_Launch1024x768>
    //        <iPad_Launch1536>ipad1536_2008.png</iPad_Launch1536>
    //        <iPad_Launch1536x2048>ipad1536_2048.png</iPad_Launch1536x2048>
    //        <iPad_Launch2048>ipad2048_1496.png</iPad_Launch2048>
    //        <iPad_Launch2048x1536>ipad2048_1536.png</iPad_Launch2048x1536>
    //
    //        <iPhone_Launch320>iphone320_480.png</iPhone_Launch320>
    //        <iPhone_Launch640>iphone640_960.png</iPhone_Launch640>
    //        <iPhone_Launch640x1136>iphone640_1136.png</iPhone_Launch640x1136>
    //        <iPhone_Launch750>iphone750_1334.png</iPhone_Launch750>
    //        <iPhone_Launch1242>iphone1242_2208.png</iPhone_Launch1242>
    //        <iPhone_Launch2208>iphone2208_1242.png</iPhone_Launch2208>

              SaveProjectPictureToProjectXMLNode(768,1004,'iPad_Launch768',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(768,1024,'iPad_Launch768x1024',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(1024,748,'iPad_Launch1024',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(1024,768,'iPad_Launch1024x768',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(1536,2008,'iPad_Launch1536',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(1536,2048,'iPad_Launch1536x2048',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(2048,1496,'iPad_Launch2048',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(2048,1536,'iPad_Launch2048x1536',AXMLNode.ChildNodes[I]);

              SaveProjectPictureToProjectXMLNode(320,480,'iPhone_Launch320',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(640,960,'iPhone_Launch640',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(640,1136,'iPhone_Launch640x1136',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(750,1334,'iPhone_Launch750',AXMLNode.ChildNodes[I]);

              SaveProjectPictureToProjectXMLNode(1242,2208,'iPhone_Launch1242',AXMLNode.ChildNodes[I]);
              SaveProjectPictureToProjectXMLNode(2208,1242,'iPhone_Launch2208',AXMLNode.ChildNodes[I]);


              //10.3


          //    SizePicture(FProjectLaunchImageFileName,1136,640,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1136,640,'iPhone_Launch1136x640',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,1334,750,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1334,750,'iPhone_Launch1334',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,828,1792,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(828,1792,'iPhone_Launch828',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,1792,828,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1792,828,'iPhone_Launch1792',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,1125,2436,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1125,2436,'iPhone_Launch1125',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2436,1125,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2436,1125,'iPhone_Launch2436',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,1242,2688,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1242,2688,'iPhone_Launch1242x2688',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2688,1242,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2688,1242,'iPhone_Launch2688x1242',AXMLNode.ChildNodes[I]);
          //
          //    SizePicture(FProjectLaunchImageFileName,1668,2224,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1668,2224,'iPad_Launch1668',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2224,1668,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2224,1668,'iPad_Launch2224',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,1668,2388,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(1668,2388,'iPad_Launch1668x2388',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2388,1668,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2388,1668,'iPad_Launch2388x1668',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2048,2732,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2048,2732,'iPad_Launch2048x2732',AXMLNode.ChildNodes[I]);
          //    SizePicture(FProjectLaunchImageFileName,2732,2048,ASaveDir,'x');
                SaveProjectPictureToProjectXMLNode(2732,2048,'iPad_Launch2732x2048',AXMLNode.ChildNodes[I]);




            end;



        end;
      end;


      AXMLDocument.SaveToFile(AProjectFilePath);
  finally
    AXMLDocument.Free;
  end;

end;

function TProjectConfig.SaveProjectPictureToProjectXMLNode(AIconWidth,
  AIconHeight: Integer; ANodeName: String; AXMLNode: IXMLNode;AText:String=''): Boolean;
var
  APictureNode:IXMLNode;
begin
  Result:=False;

  APictureNode:=AXMLNode.ChildNodes.FindNode(ANodeName);
  if APictureNode=nil then
  begin
    //不存在,则添加
    APictureNode:=AXMLNode.AddChild(ANodeName);
  end;

  if AText='' then
  begin
    APictureNode.Text:=IntToStr(AIconWidth)+'x'+IntToStr(AIconHeight)+'.png';
  end
  else
  begin
    APictureNode.Text:=IntToStr(AIconWidth)+'_'+IntToStr(AIconHeight)+'.png';
  end;
end;

procedure TProjectConfig.SaveToINI(AINIFilePath: String);
var
  AIniFile:TIniFile;
  I: Integer;
  ASectionName:String;
  ADeployConfig:TDeployConfig;
begin
  DeleteFile(AINIFilePath);
  AIniFile:=TIniFile.Create(AINIFilePath);



  //上次打开的工程
  AIniFile.WriteString('','LastProjectFilePath',FLastProjectFilePath);
  AIniFile.WriteString('','-','');
  AIniFile.WriteString('','--','');
  AIniFile.WriteString('','---','');



  //保存布署配置
  for I := 0 to FDeployConfigList.Count-1 do
  begin
    ASectionName:='DeployConfigList '+IntToStr(I);

    ADeployConfig:=TDeployConfig(FDeployConfigList[I]);

    AIniFile.WriteString(ASectionName,'Platform',ADeployConfig.Platform_);
    AIniFile.WriteString(ASectionName,'LocalDir',ADeployConfig.LocalDir);
    AIniFile.WriteString(ASectionName,'RemoteDir',ADeployConfig.RemoteDir);
//    AIniFile.WriteString(ASectionName,'-','');
//    AIniFile.WriteString(ASectionName,'--','');
//    AIniFile.WriteString(ASectionName,'---','');
  end;



  //保存Jar配置
  for I := 0 to Self.FAndroidJarList.Count-1 do
  begin
    AIniFile.WriteString('AndroidJar',IntToStr(I),FAndroidJarList[I]);
  end;
//  AIniFile.WriteBool('AndroidJar','IsDisableSysJars',FIsDisableSysJars);
//  AIniFile.WriteString('AndroidJar','-','');
//  AIniFile.WriteString('AndroidJar','--','');
//  AIniFile.WriteString('AndroidJar','---','');





  //保存Aar配置
  for I := 0 to Self.FAndroidAarList.Count-1 do
  begin
    AIniFile.WriteString('AndroidAar',IntToStr(I),FAndroidAarList[I]);
  end;





  //保存变量
  for I := 0 to Self.FAndroidVariableList.Count-1 do
  begin
    AIniFile.WriteString('AndroidVariable','Name'+IntToStr(I),FAndroidVariableList[I].Name);
    AIniFile.WriteString('AndroidVariable','Value'+IntToStr(I),FAndroidVariableList[I].Value);
    AIniFile.WriteString('AndroidVariable','Desc'+IntToStr(I),FAndroidVariableList[I].Desc);
  end;
//  AIniFile.WriteString('AndroidVariable','-','');
//  AIniFile.WriteString('AndroidVariable','--','');
//  AIniFile.WriteString('AndroidVariable','---','');






  //保存AndroidManifest.xml中的Android权限配置
  for I := 0 to Self.FAndroidUsersPermissions.Count-1 do
  begin
    AIniFile.WriteString('AndroidUsersPermissions',IntToStr(I),FAndroidUsersPermissions[I]);
  end;
//  AIniFile.WriteString('AndroidUsersPermissions','-','');
//  AIniFile.WriteString('AndroidUsersPermissions','--','');
//  AIniFile.WriteString('AndroidUsersPermissions','---','');






  //保存AndroidManifest.xml中的Application子节点
  for I := 0 to Self.FAndroidApplicationChildNodes.Count-1 do
  begin
    AIniFile.WriteString('AndroidApplicationChildNodes',IntToStr(I),FAndroidApplicationChildNodes[I]);
  end;
//  AIniFile.WriteString('AndroidApplicationChildNodes','-','');
//  AIniFile.WriteString('AndroidApplicationChildNodes','--','');
//  AIniFile.WriteString('AndroidApplicationChildNodes','---','');






  //IOSPlistRootNodes
  for I := 0 to Self.FIOSPlistRootNodes.Count-1 do
  begin
    AIniFile.WriteString('IOSPlistRootNodes',IntToStr(I),FIOSPlistRootNodes[I]);
  end;
//  AIniFile.WriteString('IOSPlistRootNodes','-','');
//  AIniFile.WriteString('IOSPlistRootNodes','--','');
//  AIniFile.WriteString('IOSPlistRootNodes','---','');



  //IOS链接参数
  AIniFile.WriteString('','IOSLinkerOptions',FIOSLinkerOptions);




  FreeAndNil(AIniFile);

end;

{ TDeployConfigList }

function TDeployConfigList.GetItem(Index: Integer): TDeployConfig;
begin
  Result:=TDeployConfig(Inherited Items[Index]);
end;

function TDeployConfigList.GeneratePreviewDeployFileList(AProjectPath:String):Boolean;
var
  I: Integer;
  J: Integer;

  AFileName:String;
  AFileExt:String;
  AFileNameNoExt:String;
  ARenamedFileName:String;
  AFileDir:String;
  ASDKName:String;
  AAbsolutePath:String;

  ADelimList:TStringList;
  ADeployFile:TDeployFile;
  ADeployFilePlatform:TDeployFilePlatform;

  ADeployConfig:TDeployConfig;
begin
  Result:=False;

  Self.FPreviewDeployFileList.Clear(True);


  //MatisseSDK_0_4_3\matisse-0.4.3\res\
  //res\
  for I := 0 to Self.Count-1 do
  begin


          ADeployConfig:=Items[I];
          //加载此布署项里本地所有文件列表
          //LocalFiles-RemoteFiles配对的
          //比如:
          //LocalFiles:   .\TwitterKitSDK\tweet-composer-3.0.0\res\values\values.xml
          //RemoteFiles:  res\values\
          ADeployConfig.LoadFileList(ExtractFilePath(AProjectPath));


          //如果是aar有重名的那种values.xml，那么需要重命名
          if ADeployConfig.RemoteDir='res\' then
          begin

              ASDKName:='';
              ADelimList:=TStringList.Create;
              ADelimList.Delimiter:='\';
              ADelimList.StrictDelimiter:=True;
              ADelimList.DelimitedText:=ADeployConfig.LocalDir;
              if ADelimList.IndexOf('res')>1 then
              begin
                ASDKName:=ADelimList[ADelimList.IndexOf('res')-1];
              end;
              FreeAndNil(ADelimList);



              if ASDKName<>'' then
              begin


                  ASDKName:=ReplaceStr(ASDKName,'.','_');
                  ASDKName:=ReplaceStr(ASDKName,'-','_');
                  for J := 0 to ADeployConfig.LocalFiles.Count-1 do
                  begin
                      AFileName:=ADeployConfig.LocalFiles[J];
                      AFileDir:=ExtractFilePath(AFileName);
                      AFileName:=ExtractFileName(AFileName);
                      AFileExt:=ExtractFileExt(AFileName);
                      AFileNameNoExt:=Copy(AFileName,1,Length(AFileName)-Length(AFileExt));

                      if (Pos(LowerCase(ASDKName),LowerCase(AFileNameNoExt))=0)//没有被重命名过
                        and (AFileExt='.xml')
                         and ((Copy(AFileNameNoExt,1,6)='values')
                              or (Copy(AFileNameNoExt,1,6)='colors')
                              or (Copy(AFileNameNoExt,1,7)='strings')
                              or (Copy(AFileNameNoExt,1,6)='styles')) then
                      begin
                        //判断是否已经重命名过
                        ARenamedFileName:=AFileNameNoExt+'_'+ASDKName+AFileExt;
                        //相对目录要转换成绝对目录
                        AAbsolutePath:=ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectPath),ADeployConfig.LocalFiles[J]);


                        RenameFile(AAbsolutePath,
                                  ExtractFilePath(AAbsolutePath)+ARenamedFileName);
                        ADeployConfig.LocalFiles[J]:=ExtractFilePath(ADeployConfig.LocalFiles[J])+ARenamedFileName;

                      end;
                  end;
              end;

          end;



          for J := 0 to ADeployConfig.LocalFiles.Count-1 do
          begin

                  //需要添加
                  //直接添加
                  ADeployFile:=TDeployFile.Create;
                  //添加
                  FPreviewDeployFileList.Add(ADeployFile);

                  ADeployFile.LocalName:=ADeployConfig.LocalFiles[J];
                  ADeployFile.Class_:='File';


                  //布署到指定平台
                  ADeployFilePlatform:=TDeployFilePlatform.Create;
                  ADeployFilePlatform.Platform_:=ADeployConfig.Platform_;

                  //取出文件名
                  ADeployFilePlatform.RemoteName:=ExtractFileName(ADeployConfig.RemoteFiles[J]);
                  //取出文件路径
                  ADeployFilePlatform.RemoteDir:=ExtractFilePath(ADeployConfig.RemoteFiles[J]);
                  //避免每次都布署
                  ADeployFilePlatform.Overwrite:='False';


                  ADeployFile.Platforms.Add(ADeployFilePlatform);


                  if ADeployConfig.Platform_='Android' then
                  begin

                    //布署到指定平台
                    ADeployFilePlatform:=TDeployFilePlatform.Create;
                    ADeployFilePlatform.Platform_:='Android64';

                    //取出文件名
                    ADeployFilePlatform.RemoteName:=ExtractFileName(ADeployConfig.RemoteFiles[J]);
                    //取出文件路径
                    ADeployFilePlatform.RemoteDir:=ExtractFilePath(ADeployConfig.RemoteFiles[J]);
                    //避免每次都布署
                    ADeployFilePlatform.Overwrite:='False';
                    ADeployFilePlatform.Enabled:='true';

                    ADeployFile.Platforms.Add(ADeployFilePlatform);



                  end;


          end;

  end;

  Result:=True;
end;

constructor TDeployConfigList.Create(
  const AObjectOwnership: TObjectOwnership;
  const AIsCreateObjectChangeManager: Boolean);
begin
  inherited;

  FPreviewDeployFileList:=TDeployFileList.Create;

end;

destructor TDeployConfigList.Destroy;
begin
  FreeAndNil(FPreviewDeployFileList);
  inherited;
end;

{ TDeployConfig }

constructor TDeployConfig.Create;
begin
  LocalFiles:=TStringList.Create;
  RemoteFiles:=TStringList.Create;

end;

destructor TDeployConfig.Destroy;
begin
  FreeAndNil(LocalFiles);
  FreeAndNil(RemoteFiles);
  inherited;
end;

procedure TDeployConfig.LoadFileList(AProjectDir:String);
var
  I: Integer;
  AAbsolutePath:String;
  AAbsoluteFileList:TStringList;
begin
  Self.LocalFiles.Clear;
  Self.RemoteFiles.Clear;


  //相对目录要转换成绝对目录
  AAbsolutePath:=ConvertRelativePathToAbsolutePath(AProjectDir,LocalDir);


  if FileExists(AAbsolutePath) then
  begin
      //是单个文件
      Self.LocalFiles.Add(Self.LocalDir);
      Self.RemoteFiles.Add(Self.RemoteDir+ExtractFileName(Self.LocalDir));
  end
  else if DirectoryExists(AAbsolutePath) then
  begin
      //是目录
      //遍历所有文件

      AAbsoluteFileList:=TStringList.Create;
      try
        DoGetFileList(AAbsolutePath,AAbsoluteFileList);

        for I := 0 to AAbsoluteFileList.Count-1 do
        begin

          //转换为相对路径
          Self.LocalFiles.Add(
            ConvertAbsolutePathToRelativePath(AProjectDir,AAbsoluteFileList[I])
            );
          Self.RemoteFiles.Add(Self.RemoteDir
                                +Copy(AAbsoluteFileList[I],Length(AAbsolutePath)+1,MaxInt)
                                );

        end;
      finally
        FreeAndNil(AAbsoluteFileList);
      end;

  end
  else
  begin
      ShowMessage(GetLangString(['布署文件不存在:'+AAbsolutePath,
                                    'File is not exist:'+AAbsolutePath  ]));
                                    //'布署文件不存在:'+AAbsolutePath);
  end;

end;



{ TConfigVariableList }

function TConfigVariableList.FindItemByName(AName: String): TConfigVariable;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].Name=AName then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TConfigVariableList.GetItem(Index: Integer): TConfigVariable;
begin
  Result:=TConfigVariable(Inherited Items[Index]);
end;

initialization
  GlobalDeployConfigRemoteDirList:=TStringList.Create;
  GlobalDeployConfigRemoteDirList.Add('StartUp\Documents\');

  GlobalDeployConfigRemoteDirList.Add('.\assets\internal\');
  GlobalDeployConfigRemoteDirList.Add('library\lib\armeabi-v7a\');
  GlobalDeployConfigRemoteDirList.Add('res\');
  GlobalDeployConfigRemoteDirList.Add('res\values\');
  GlobalDeployConfigRemoteDirList.Add('res\xml\');
  GlobalDeployConfigRemoteDirList.Add('res\layout\');
  GlobalDeployConfigRemoteDirList.Add('res\drawable\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-hdpi\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-large\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-ldpi\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-mdpi\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-normal\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-small\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-xhdpi\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-xlarge\');
//  GlobalDeployConfigRemoteDirList.Add('res\drawable-xxhdpi\');
  GlobalDeployConfigRemoteDirList.Add('.\assets\');
  GlobalDeployConfigRemoteDirList.Add('.\');


  GlobalIOSFrameworkList:=TStringList.Create;
  GlobalIOSFrameworkList.Add('UserNotifications');
  GlobalIOSFrameworkList.Add('CoreAudio');
  GlobalIOSFrameworkList.Add('MediaToolbox');
  GlobalIOSFrameworkList.Add('Metal');
  GlobalIOSFrameworkList.Add('CoreTelephony');
  GlobalIOSFrameworkList.Add('SystemConfiguration');
  GlobalIOSFrameworkList.Add('AdSupport');
  GlobalIOSFrameworkList.Add('AudioToolbox');
  GlobalIOSFrameworkList.Add('CoreMIDI');
  GlobalIOSFrameworkList.Add('CoreBluetooth');
  GlobalIOSFrameworkList.Add('JavaScriptCore');
  GlobalIOSFrameworkList.Add('Photos');
  GlobalIOSFrameworkList.Add('ImageIO');
  GlobalIOSFrameworkList.Add('CoreMotion');
  GlobalIOSFrameworkList.Add('PushKit');
  GlobalIOSFrameworkList.Add('SafariServices');
  GlobalIOSFrameworkList.Add('CoreData');
  GlobalIOSFrameworkList.Add('Accounts');
  GlobalIOSFrameworkList.Add('FileProvider');
  GlobalIOSFrameworkList.Add('IOSurface');
  GlobalIOSFrameworkList.Add('TouchJSON');
  GlobalIOSFrameworkList.Add('AudioToolBox');
  GlobalIOSFrameworkList.Add('Social');
  GlobalIOSFrameworkList.Add('LocalAuthentication');
  GlobalIOSFrameworkList.Add('WebKit');
  GlobalIOSFrameworkList.Add('AuthenticationServices');
  GlobalIOSFrameworkList.Add('ContactsUI');
  GlobalIOSFrameworkList.Add('OpenAL');
  GlobalIOSFrameworkList.Add('VideoToolbox');
  GlobalIOSFrameworkList.Add('ReplayKit');
  GlobalIOSFrameworkList.Add('ModelIO');
  GlobalIOSFrameworkList.Add('AVKit');
  GlobalIOSFrameworkList.Add('AddressBook');
  GlobalIOSFrameworkList.Add('Contacts');
  GlobalIOSFrameworkList.Add('QuickLook');
  GlobalIOSFrameworkList.Add('PhotosUI');




  GlobalIOSDylibList:=TStringList.Create;
  GlobalIOSDylibList.Add('libicucore.tbd');
  GlobalIOSDylibList.Add('libresolv.tbd');


finalization
  GlobalDeployConfigRemoteDirList.Free;
  GlobalIOSFrameworkList.Free;
  GlobalIOSDylibList.Free;


end.
