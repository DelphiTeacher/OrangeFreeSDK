//convert pas to utf8 by ¥
unit SmartDeployForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  XMLDoc,
  XMLIntf,
  uLang_Copy,
  uBaseList_Copy,
  IniFiles,
  MidasLib,

  VCL.FileCtrl,
  StrUtils,
  VCL.Imaging.Jpeg,
  Math,
  System.Win.Registry,

  Types,
  FMX.Graphics,
  FMX.Types,
  uFuncCommon_Copy,

  Winapi.GDIPAPI,
  Winapi.GDIPOBJ,
  Winapi.GDIPUTIL,

  Winapi.ShellAPI,

  XSuperObject_Copy,

  uOrangeUISmartSDKDeployment,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Imaging.pngimage,
  Vcl.ExtDlgs, Vcl.CheckLst;

type
  TfrmSmartDeploy = class(TForm)
    pcClient: TPageControl;
    tsCurrent: TTabSheet;
    tsAndroidManifestConfig: TTabSheet;
    memAndroidUsersPermissions: TMemo;
    pnlTop: TPanel;
    lblCurrentProject: TLabel;
    memAndroidApplicationChildNodes: TMemo;
    tsIconConfig: TTabSheet;
    tsAndroidJar: TTabSheet;
    dsCurrent: TDataSource;
    dsPreview: TDataSource;
    tsDeployConfig: TTabSheet;
    Panel2: TPanel;
    Label4: TLabel;
    cmbPlatform: TComboBox;
    cmbConfiguration: TComboBox;
    Panel3: TPanel;
    lblDeployLocalDirOrFile: TLabel;
    lblDeployRemoteDirOrFile: TLabel;
    edtDeployConfigLocalDir: TEdit;
    lblDeployTargetPlatform: TLabel;
    cmbDeployConfigPlatform: TComboBox;
    dbgPreview: TDBGrid;
    btnAddDeployConfigToGrid: TButton;
    dsDeployConfig: TDataSource;
    dbgDeployConfig: TDBGrid;
    pnlToolBar: TPanel;
    btnSaveConfig: TButton;
    btnOpenConfig: TButton;
    dbgCurrent: TDBGrid;
    odSelectConfig: TOpenDialog;
    sdSaveConfig: TSaveDialog;
    btnSelectProject: TButton;
    odSelectProject: TOpenDialog;
    btnSaveDeployConfig: TButton;
    btnDeleteDeployConfig: TButton;
    odSelectAndroidJar: TOpenDialog;
    Panel5: TPanel;
    btnAddAndroidJar: TButton;
    Panel6: TPanel;
    lblAndroidPermissionHint: TLabel;
    Panel7: TPanel;
    lblAndroidComponentHint: TLabel;
    Panel8: TPanel;
    btnProcessAndroidUsersPermissions: TButton;
    Splitter1: TSplitter;
    btnProcessAndroidApplicationChildNodes: TButton;
    cmbDeployConfigRemoteDir: TComboBox;
    btnNewConfig: TButton;
    btnLoadDeploy: TButton;
    opdSelectProjectIcon: TOpenPictureDialog;
    pnlAppIcon: TPanel;
    lblAppIconHint: TLabel;
    btnSelectProjectIcon: TButton;
    btnProcessProjectIcon: TButton;
    Panel9: TPanel;
    imgProjectIcon: TImage;
    pnlAppLaunch: TPanel;
    cmbProjectLaunchBackColor: TColorListBox;
    lblAppLaunchImageHint: TLabel;
    edtProjectLaunchBackColor: TEdit;
    lblLaunchImageBackColorHint: TLabel;
    btnGenerateProjectIconEverySize: TButton;
    Panel12: TPanel;
    imgProjectLaunchImage: TImage;
    btnSelectProjectLaunchImage: TButton;
    btnGenerateProjectLaunchImageEverySize: TButton;
    btnSelectDeployConfigLocalFile: TButton;
    btnSelectDeployConfigLocalDir: TButton;
    odSelectNeedDeployFile: TOpenDialog;
    btnProcessConfigToProject: TButton;
    tsWeiXinJar: TTabSheet;
    edtJarName: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtJDKDir: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtAndroidSDKDir: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edtAndroidSDKPlatform: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtAndroidSDKBuildTools: TEdit;
    Label22: TLabel;
    memUsedAndroidJars: TMemo;
    Label23: TLabel;
    Label24: TLabel;
    memJavaSourceFiles: TMemo;
    btnGenerateJar: TButton;
    btnGenerateWeiXinJar: TButton;
    edtWeiXinAndroidPackage: TEdit;
    Label26: TLabel;
    pcJavaSourceFiles: TPageControl;
    TabSheet2: TTabSheet;
    memWXEntryActivity: TMemo;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    memWXPayEntryActivity: TMemo;
    memOnWeixinListener: TMemo;
    TabSheet5: TTabSheet;
    memWxApiPas: TMemo;
    dsAndroidVariables: TDataSource;
    pnlClient: TPanel;
    pcLogBottom: TPanel;
    memLog: TMemo;
    Splitter3: TSplitter;
    pnlLogCaption: TPanel;
    btnProcessProjectLaunchImage: TButton;
    tsIOSConfig: TTabSheet;
    tsVariable: TTabSheet;
    Panel10: TPanel;
    lblVariableHint: TLabel;
    dbgAndroidVariables: TDBGrid;
    opdSelectProjectLaunchImage: TOpenPictureDialog;
    Label29: TLabel;
    Button2: TButton;
    btnCombineLaunchImageByBackColor: TButton;
    edtScaleBaseHeight: TEdit;
    lblLaunchImageScaleBaseHeightHint: TLabel;
    btnLoadAndroidSDKFromReg: TButton;
    cmbDelphiVersions: TComboBox;
    Label30: TLabel;
    Panel1: TPanel;
    lblDeployPreviewFileList: TLabel;
    cmbPreviewDeployConfigPlatform: TComboBox;
    btnPreviewDeployConfig: TButton;
    btnProcessDeployConfig: TButton;
    edtProjectFilePath: TComboBox;
    cmbConfigFilePath: TComboBox;
    lblCurrentConfig: TLabel;
    lblBackColorHexCodeHint: TLabel;
    lblDeployPreviewTargetPlatform: TLabel;
    btnProcessAndroidJar: TButton;
    pnlAndroidAarToolBar: TPanel;
    btnAddAndroidAar: TButton;
    memAndroidAars: TMemo;
    memAndroidJars: TMemo;
    Panel4: TPanel;
    lblIOSLinkerOptionsHint: TLabel;
    edtIOSLinkerOptions: TEdit;
    btnProcessIOSLinkerOptions: TButton;
    Panel13: TPanel;
    Panel11: TPanel;
    lblAddIOSFrameworkHint: TLabel;
    memIOS_SDK_Frameworks: TMemo;
    btnAddFrameworksToAllIOSSDK: TButton;
    memIOS_SDK_Dylibs: TMemo;
    btnAddDylibsToAllIOSSDK: TButton;
    Panel14: TPanel;
    btnProcessIOSPlistRootNodes: TButton;
    memIOSPlistRootNodes: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edtIconCornerSizePercent: TEdit;
    lblIconCornerSize: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabSheet1: TTabSheet;
    lvNeedUseSDKs: TListView;
    btnBatchProcessSDKs: TButton;
    Button1: TButton;
    btnProcessAndroidAAR: TButton;
    odSelectAndroidAar: TOpenDialog;
    Button7: TButton;
    btnGenerateAndroidAAR: TButton;
    chkGenerateAndroid64AAR: TCheckBox;
    procedure btnProcessDeployConfigClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddDeployConfigToGridClick(Sender: TObject);
    procedure btnPreviewDeployConfigClick(Sender: TObject);
    procedure btnSaveConfigClick(Sender: TObject);
    procedure btnOpenConfigClick(Sender: TObject);
    procedure btnSelectProjectClick(Sender: TObject);
    procedure dbgDeployConfigCellClick(Column: TColumn);
    procedure btnSaveDeployConfigClick(Sender: TObject);
    procedure btnDeleteDeployConfigClick(Sender: TObject);
    procedure btnAddAndroidJarClick(Sender: TObject);
    procedure btnProcessAndroidJarClick(Sender: TObject);
    procedure btnProcessAndroidUsersPermissionsClick(Sender: TObject);
    procedure btnProcessAndroidApplicationChildNodesClick(Sender: TObject);
    procedure btnNewConfigClick(Sender: TObject);
    procedure btnLoadDeployClick(Sender: TObject);
    procedure btnSelectProjectIconClick(Sender: TObject);
    procedure btnProcessProjectIconClick(Sender: TObject);
    procedure btnGenerateProjectIconEverySizeClick(Sender: TObject);
    procedure btnSelectDeployConfigLocalFileClick(Sender: TObject);
    procedure btnSelectDeployConfigLocalDirClick(Sender: TObject);
    procedure btnProcessConfigToProjectClick(Sender: TObject);
    procedure btnGenerateWeiXinJarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerateJarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddAndroidAarClick(Sender: TObject);
    procedure btnGenerateAndroidAARClick(Sender: TObject);
    procedure btnSelectProjectLaunchImageClick(Sender: TObject);
    procedure btnGenerateProjectLaunchImageEverySizeClick(Sender: TObject);
    procedure btnProcessProjectLaunchImageClick(Sender: TObject);
    procedure btnAddFrameworksToAllIOSSDKClick(Sender: TObject);
    procedure btnProcessIOSPlistRootNodesClick(Sender: TObject);
    procedure btnProcessIOSLinkerOptionsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCombineLaunchImageByBackColorClick(Sender: TObject);
    procedure btnLoadAndroidSDKFromRegClick(Sender: TObject);
    procedure btnAddDylibsToAllIOSSDKClick(Sender: TObject);
    procedure cmbConfigFilePathChange(Sender: TObject);
    procedure cmbProjectLaunchBackColorClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBatchProcessSDKsClick(Sender: TObject);
    procedure btnProcessAndroidAARClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    //工程启动图片文件
    FProjectLaunchImageFileName:String;
    //工程图标文件
    FProjectIconFileName:String;

    //当前要保存的配置文件
    FCurrentConfigFileName:String;

    FProjectConfig:TProjectConfig;

    //Android下面的配置变量
    FAndroidVariableDataset:TClientDataSet;

    FDeployConfigListDataSet:TClientDataSet;

    FCurrentDeployFileListDataSet:TClientDataSet;
    FPreviewDeployFileListDataSet:TClientDataSet;


    procedure SyncEnabledSDKS;


    { Private declarations }
  public
    function CheckProjectFileIsExist:Boolean;

    procedure ChangeLanguage(ALang:TLangKind);

    procedure LoadConfigFile(AConfigFilePath:String);

    procedure DoRecordDeployConfigLog(Sender:TObject;const ALog:String);
    function CreateDeployFileListClientDataSet:TClientDataSet;
    //把文件布署列表加载到数据集
    procedure LoadDeployFileListToDataSet(ADeployFileList:TDeployFileList;
                                          APlatform:String;
                                          AConfiguration:String;
                                          AClientDataSet:TClientDataSet);
    //把DataSet中的数据保存到布署配置列表
    procedure SaveDataSetToDeployConfigList(ADeployConfigList:TDeployConfigList;
                                          AClientDataSet:TClientDataSet);
    //把DataSet中的数据保存到变量列表
    procedure SaveDataSetToVariableList(AVariableList:TConfigVariableList;
                                          AClientDataSet:TClientDataSet);
  public
    //从配置文件加载
    procedure LoadFromINI(AINIFilePath:String);
    //保存到配置文件
    procedure SaveToINI(AINIFilePath:String);
    { Public declarations }
  end;



var
  frmSmartDeploy: TfrmSmartDeploy;
var
  //当前选择的文件夹路径
  CurrentSelectedFolderName: String;



//获取表格的设置
function GetDBGridColumnSetting(ADBGrid:TDBGrid):String;
//设置表格的设置
procedure SetDBGridColumnSetting(ADBGrid:TDBGrid;ASetting:String);

//拉伸图片
procedure SizePicture(APictureFilePath:String;
                      AWidth,AHeight:Integer;
                      //保存的目录
                      ASaveDir:String;
                      //分隔符
                      DevideChar:String;
                      //指定了文件名,比如'83.5x83.5.png'
                      AFileName:String='';
                      //圆角的尺寸
                      ACornerSizePercent:Double=0);

procedure CombineSizePictureByBackColor(
                    //中间图片的文件路径
                    AMiddlePictureFilePath:String;
                    //背景色
                    ABackColor:TColor;
                    AMiddlePictureStretchScaleBaseHeight:Integer;
                    //生成图片的宽度和高度
                    AWidth,AHeight:Integer;
                    //保存的文件夹
                    ASaveDir:String;
                    //根据宽高自动生成文件名
                    DevideChar:String;
                    AFileName:String='');


implementation


{$R *.dfm}

procedure CombineSizePictureByBackColor(
                    //中间图片的文件路径
                    AMiddlePictureFilePath:String;
                    //背景色
                    ABackColor:TColor;
                    AMiddlePictureStretchScaleBaseHeight:Integer;
                    //生成图片的宽度和高度
                    AWidth,AHeight:Integer;
                    //保存的文件夹
                    ASaveDir:String;
                    //根据宽高自动生成文件名
                    DevideChar:String;
                    AFileName:String='');
var
  ASrcBitmap:TGPBitmap;
  ADestBitmap:TGPBitmap;
  ADestBitmapGraphics:TGPGraphics;
  ImgGUID: TGUID;
  AGPBackColor:TColor;

  ALeft,ATop:Integer;
  //以320*480为基准的放大比例
  AMiddlePictureStretchScale:Double;

begin
  //以320*480为基准的放大比例
  AMiddlePictureStretchScale:=AHeight/AMiddlePictureStretchScaleBaseHeight;


  ASrcBitmap:=TGPBitmap.Create(AMiddlePictureFilePath);
  ADestBitmap:=TGPBitmap.Create(AWidth,AHeight);
  ADestBitmapGraphics:=TGPGraphics.Create(ADestBitmap);
  try
    AGPBackColor:=ColorRefToARGB(ABackColor);

    //画背景色
    ADestBitmapGraphics.Clear(AGPBackColor);



    //需要有一定的放大比例
    //居中绘制到图片中
    ALeft:=Ceil(ADestBitmap.GetWidth-ASrcBitmap.GetWidth*AMiddlePictureStretchScale) div 2;
    ATop:=Ceil(ADestBitmap.GetHeight-ASrcBitmap.GetHeight*AMiddlePictureStretchScale) div 2;

    ADestBitmapGraphics.DrawImage(
        ASrcBitmap,
        MakeRect(ALeft,
                  ATop,
                  ASrcBitmap.GetWidth*AMiddlePictureStretchScale,
                  ASrcBitmap.GetHeight*AMiddlePictureStretchScale),
        0,0,ASrcBitmap.GetWidth,ASrcBitmap.GetHeight,
        TUnit.UnitPixel
        );



    //x
    if GetEncoderClsid('image/png', ImgGUID)<>-1 then
    begin

      if ExtractFileName(ASaveDir)='' then
      begin

          if ADestBitmap.Save(ASaveDir+IntToStr(AWidth)+DevideChar+IntToStr(AHeight)+'.png',
                              ImgGUID)<>Status.Ok then
          begin
            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
                                                  'Generate image fail'  ]));
                                                  //'图片生成失败');
          end;

      end
      else
      begin
          System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
          if Not (ADestBitmap.Save(ASaveDir,ImgGUID)=Status.Ok) then
          begin
            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
                                                  'Generate image fail'  ]));
                                                  //'图片生成失败');
          end;
      end;

    end;

  finally
    ASrcBitmap.Free;
    ADestBitmap.Free;
    ADestBitmapGraphics.Free;
  end;
end;

procedure SizePicture(APictureFilePath:String;
                      AWidth,AHeight:Integer;
                      //保存的文件路径
                      ASaveDir:String;
                      DevideChar:String;
                      //指定了文件名,比如'83.5x83.5.png'
                      AFileName:String='';
                      ACornerSizePercent:Double=0);
var
//  ASrcBitmap:TGPBitmap;
//  ADestBitmap:TGPBitmap;
//  ADestBitmapGraphics:TGPGraphics;
//  ImgGUID: TGUID;
  ASrcBitmap:TBitmap;
  ADestBitmap:TBitmap;
  ATempFileName:String;
  ASavedBitmap:TBitmap;
//  ACornerSizePercent:Double;
begin
  ATempFileName:=AFileName;
  if ATempFileName='' then
  begin
    ATempFileName:=IntToStr(AWidth)+DevideChar+IntToStr(AHeight)+'.png';
  end;

  ASrcBitmap:=TBitmap.Create();
  ADestBitmap:=TBitmap.Create(AWidth,AHeight);
  ASavedBitmap:=TBitmap.Create(AWidth,AHeight);
  ASavedBitmap.Canvas.BeginScene();
  try
    ASavedBitmap.Canvas.Clear(0);


    ASrcBitmap.LoadFromFile(APictureFilePath);


    if BiggerDouble(ACornerSizePercent,0) then
    begin
        ADestBitmap.Canvas.BeginScene();
        ADestBitmap.Canvas.Clear(0);
        //没有圆角
        ADestBitmap.Canvas.DrawBitmap(
                                    ASrcBitmap,
                                    RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
                                    RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
                                    1
                                    );
        ADestBitmap.Canvas.EndScene();


        if ACornerSizePercent<1 then
        begin
          ACornerSizePercent:=ACornerSizePercent*ADestBitmap.Width;
        end;




        ASavedBitmap.Canvas.Fill.Bitmap.Bitmap:=ADestBitmap;
        ASavedBitmap.Canvas.Fill.Kind:=TBrushKind.Bitmap;
        ASavedBitmap.Canvas.FillRect(RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
                                     ACornerSizePercent,
                                     ACornerSizePercent,
                                     [TCorner.TopLeft,TCorner.TopRight,TCorner.BottomLeft,TCorner.BottomRight],
                                     1
                                      );
    end
    else
    begin
        //没有圆角
        ASavedBitmap.Canvas.DrawBitmap(
                                    ASrcBitmap,
                                    RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
                                    RectF(0,0,ASavedBitmap.Width,ASavedBitmap.Height),
                                    1
                                    );
    end;
    ASavedBitmap.Canvas.EndScene;





    if ExtractFileName(ASaveDir)='' then
    begin
        //只是目录
        ASavedBitmap.SaveToFile(ASaveDir+ATempFileName);
    end
    else
    begin
        //文件路径
        System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
        ASavedBitmap.SaveToFile(ASaveDir);
    end;


  finally
    ASrcBitmap.Free;
    ADestBitmap.Free;
    ASavedBitmap.Free;
  end;



//  ATempFileName:=AFileName;
//  if ATempFileName='' then
//  begin
//    ATempFileName:=ASaveDir+IntToStr(AWidth)+DevideChar+IntToStr(AHeight)+'.png';
//  end;
//
//  ASrcBitmap:=TGPBitmap.Create(APictureFilePath);
//  ADestBitmap:=TGPBitmap.Create(AWidth,AHeight);
//  ADestBitmapGraphics:=TGPGraphics.Create(ADestBitmap);
//  try
//
//    ADestBitmapGraphics.DrawImage(
//        ASrcBitmap,
//        MakeRect(0,0,ADestBitmap.GetWidth,ADestBitmap.GetHeight),
//        0,0,ASrcBitmap.GetWidth,ASrcBitmap.GetHeight,
//        TUnit.UnitPixel
//        );
//
//    //x
//    if GetEncoderClsid('image/png', ImgGUID)<>-1 then
//    begin
//
//      if ExtractFileName(ASaveDir)='' then
//      begin
//
//          if ADestBitmap.Save(ATempFileName,
//                              ImgGUID)<>Status.Ok then
//          begin
//            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
//                                                  'Generate image fail'  ]));
//                                                  //'图片生成失败');
//          end;
//
//      end
//      else
//      begin
//          System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
//          if Not (ADestBitmap.Save(ASaveDir,ImgGUID)=Status.Ok) then
//          begin
//            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
//                                                  'Generate image fail'  ]));
//                                                  //'图片生成失败');
//          end;
//      end;
//
//    end;
//
//  finally
//    ASrcBitmap.Free;
//    ADestBitmap.Free;
//    ADestBitmapGraphics.Free;
//  end;
end;

procedure CornerPicture(APictureFilePath:String;
                        //保存的文件路径
                        ASaveDir:String;
                        //指定了文件名,比如'83.5x83.5.png'
                        AFileName:String='cornerd.png';
                        ACornerSizePercent:Double=0);
var
  ASrcBitmap:TBitmap;
  ADestBitmap:TBitmap;
  ATempFileName:String;
  ASavedBitmap:TBitmap;
begin

  ATempFileName:=AFileName;

  ASrcBitmap:=TBitmap.Create();
  ADestBitmap:=TBitmap.Create;//(AWidth,AHeight);
  ASavedBitmap:=TBitmap.Create;//(AWidth,AHeight);
  try

    ASrcBitmap.LoadFromFile(APictureFilePath);
    ADestBitmap.SetSize(ASrcBitmap.Width,ASrcBitmap.Height);
    ASavedBitmap.SetSize(ASrcBitmap.Width,ASrcBitmap.Height);
    ASavedBitmap.Canvas.BeginScene();
    ASavedBitmap.Canvas.Clear(0);


    if BiggerDouble(ACornerSizePercent,0) then
    begin
        ADestBitmap.Canvas.BeginScene();
        ADestBitmap.Canvas.Clear(0);
        //没有圆角
        ADestBitmap.Canvas.DrawBitmap(
                                    ASrcBitmap,
                                    RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
                                    RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
                                    1
                                    );
        ADestBitmap.Canvas.EndScene();


        if ACornerSizePercent<1 then
        begin
          ACornerSizePercent:=ACornerSizePercent*ADestBitmap.Width;
        end;


        ASavedBitmap.Canvas.Fill.Bitmap.Bitmap:=ADestBitmap;
        ASavedBitmap.Canvas.Fill.Kind:=TBrushKind.Bitmap;
        ASavedBitmap.Canvas.FillRect(RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
                                     ACornerSizePercent,
                                     ACornerSizePercent,
                                     [TCorner.TopLeft,TCorner.TopRight,TCorner.BottomLeft,TCorner.BottomRight],
                                     1
                                      );
    end
    else
    begin
        //没有圆角
        ASavedBitmap.Canvas.DrawBitmap(
                                    ASrcBitmap,
                                    RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
                                    RectF(0,0,ASavedBitmap.Width,ASavedBitmap.Height),
                                    1
                                    );
    end;
    ASavedBitmap.Canvas.EndScene;





    if ExtractFileName(ASaveDir)='' then
    begin
        //只是目录
        ASavedBitmap.SaveToFile(ASaveDir+ATempFileName);
    end
    else
    begin
        //文件路径
        System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
        ASavedBitmap.SaveToFile(ASaveDir);
    end;


  finally
    ASrcBitmap.Free;
    ADestBitmap.Free;
    ASavedBitmap.Free;
  end;



//  ATempFileName:=AFileName;
//  if ATempFileName='' then
//  begin
//    ATempFileName:=ASaveDir+IntToStr(AWidth)+DevideChar+IntToStr(AHeight)+'.png';
//  end;
//
//  ASrcBitmap:=TGPBitmap.Create(APictureFilePath);
//  ADestBitmap:=TGPBitmap.Create(AWidth,AHeight);
//  ADestBitmapGraphics:=TGPGraphics.Create(ADestBitmap);
//  try
//
//    ADestBitmapGraphics.DrawImage(
//        ASrcBitmap,
//        MakeRect(0,0,ADestBitmap.GetWidth,ADestBitmap.GetHeight),
//        0,0,ASrcBitmap.GetWidth,ASrcBitmap.GetHeight,
//        TUnit.UnitPixel
//        );
//
//    //x
//    if GetEncoderClsid('image/png', ImgGUID)<>-1 then
//    begin
//
//      if ExtractFileName(ASaveDir)='' then
//      begin
//
//          if ADestBitmap.Save(ATempFileName,
//                              ImgGUID)<>Status.Ok then
//          begin
//            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
//                                                  'Generate image fail'  ]));
//                                                  //'图片生成失败');
//          end;
//
//      end
//      else
//      begin
//          System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
//          if Not (ADestBitmap.Save(ASaveDir,ImgGUID)=Status.Ok) then
//          begin
//            DoDeployConfigLog(nil,GetLangString(['图片生成失败',
//                                                  'Generate image fail'  ]));
//                                                  //'图片生成失败');
//          end;
//      end;
//
//    end;
//
//  finally
//    ASrcBitmap.Free;
//    ADestBitmap.Free;
//    ADestBitmapGraphics.Free;
//  end;
end;

procedure CutPicture(APictureFilePath:String;
                      AWidth,AHeight:Integer;
                      //保存的文件路径
                      ASaveDir:String;
                      //指定了文件名,比如'83.5x83.5.png'
                      AFileName:String);
var
  ASrcBitmap:TBitmap;
  ADestBitmap:TBitmap;
  ATempFileName:String;
  ASavedBitmap:TBitmap;
  AHeightCut:Integer;
begin
  ATempFileName:=AFileName;

//  AHeightCut

  ASrcBitmap:=TBitmap.Create();
  ADestBitmap:=TBitmap.Create(AWidth-160,AHeight-200);
  ASavedBitmap:=TBitmap.Create(AWidth-160,AHeight-200);
  ASavedBitmap.Canvas.BeginScene();
  try
    ASavedBitmap.Canvas.Clear(0);


    ASrcBitmap.LoadFromFile(APictureFilePath);


    //没有圆角
    ASavedBitmap.Canvas.DrawBitmap(
                                ASrcBitmap,
                                RectF(160,150,ASavedBitmap.Width,ASavedBitmap.Height),
                                RectF(0,0,ASavedBitmap.Width,ASavedBitmap.Height),
                                1
                                );
    ASavedBitmap.Canvas.EndScene;





    if ExtractFileName(ASaveDir)='' then
    begin
        //只是目录
        ASavedBitmap.SaveToFile(ASaveDir+ATempFileName);
    end
    else
    begin
        //文件路径
        System.SysUtils.ForceDirectories(ExtractFilePath(ASaveDir));
        ASavedBitmap.SaveToFile(ASaveDir);
    end;


  finally
    ASrcBitmap.Free;
    ADestBitmap.Free;
    ASavedBitmap.Free;
  end;

end;

procedure TfrmSmartDeploy.btnDeleteDeployConfigClick(Sender: TObject);
begin
  if FDeployConfigListDataSet.RecordCount=1 then
  begin
    if FDeployConfigListDataSet.Eof then Self.FDeployConfigListDataSet.First;
  end;

  //删除
  if Not FDeployConfigListDataSet.Eof then
  begin

    Self.FDeployConfigListDataSet.Delete;

    SaveDataSetToDeployConfigList(Self.FProjectConfig.FDeployConfigList,
                                  FDeployConfigListDataSet);
  end;

end;

procedure TfrmSmartDeploy.btnGenerateJarClick(Sender: TObject);
var
  ATempRootDir:String;
  ATempJarDir:String;
begin
  //保存配置
  Self.SaveToINI(ExtractFilePath(Application.ExeName)+'Config.ini');


  //先创建临时文件夹Temp,以aar为命名
  //ProjectFilePath\JarGen\Main_R_Java\
  if Self.edtProjectFilePath.Text='' then
  begin
    //如果没有指定工程目录，直接生成到工具目录
    ATempRootDir:=ExtractFilePath(Application.ExeName)+CONST_JAR_TEMP_DIR+'\';
  end
  else
  begin
    //如果指定了工程目录,就在工程目录下
    ATempRootDir:=ExtractFilePath(Self.edtProjectFilePath.Text)+CONST_JAR_TEMP_DIR+'\';
  end;


  ATempJarDir:=ATempRootDir
                +Self.edtJarName.Text+'\';

  GenerateJarBatToProject(
          ATempJarDir,
          Self.edtJDKDir.Text,
          Self.edtAndroidSDKDir.Text,
          Self.edtAndroidSDKPlatform.Text,
          Self.edtAndroidSDKBuildTools.Text,
          Self.edtJarName.Text,
          Self.memUsedAndroidJars.Lines,
          Self.memJavaSourceFiles.Lines,
          ATempRootDir+'gen'+Self.edtJarName.Text+'.bat',
          ''

          );


end;

procedure TfrmSmartDeploy.btnGenerateProjectIconEverySizeClick(Sender: TObject);
var
  ASaveDir:String;
  AGetuiPushSDKResDir:String;
  ACornerSizePercent:Double;
begin
  //生成各种图标在工程的目录

  if FileExists(Self.edtProjectFilePath.Text)
    and FileExists(FProjectIconFileName) then
  begin
        ACornerSizePercent:=0;
        TryStrToFloat(Self.edtIconCornerSizePercent.Text,ACornerSizePercent);
        //处理
        //生成各种尺寸的图标到工程目录

        ASaveDir:=ExtractFilePath(Self.edtProjectFilePath.Text);


        SizePicture(FProjectIconFileName,24,24,ASaveDir,'_','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,36,36,ASaveDir,'_','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,48,48,ASaveDir,'_','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,72,72,ASaveDir,'_','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,96,96,ASaveDir,'_','',ACornerSizePercent);



        SizePicture(FProjectIconFileName,28,28,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,29,29,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,32,32,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,36,36,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,40,40,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,48,48,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,50,50,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,57,57,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,58,58,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,60,60,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,72,72,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,76,76,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,80,80,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,83,83,ASaveDir,'x','83.5x83.5.png',ACornerSizePercent);
        SizePicture(FProjectIconFileName,87,87,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,96,96,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,100,100,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,108,108,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,114,114,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,120,120,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,144,144,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,152,152,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,180,180,ASaveDir,'x','',ACornerSizePercent);


        //10.3 83.5
        SizePicture(FProjectIconFileName,83,83,ASaveDir,'x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,167,167,ASaveDir,'x','',ACornerSizePercent);




        AGetuiPushSDKResDir:=ASaveDir+'GetuiPushSDK\Android_2_10_2\res\';
        //生成2.10.2版的个推推送图标
        SizePicture(FProjectIconFileName,96,96,AGetuiPushSDKResDir+'drawable-hdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,36,36,AGetuiPushSDKResDir+'drawable-hdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-ldpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,18,18,AGetuiPushSDKResDir+'drawable-ldpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,64,64,AGetuiPushSDKResDir+'drawable-mdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,24,24,AGetuiPushSDKResDir+'drawable-mdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,128,128,AGetuiPushSDKResDir+'drawable-xhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-xhdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,192,192,AGetuiPushSDKResDir+'drawable-xxhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,72,72,AGetuiPushSDKResDir+'drawable-xxhdpi\push_small.png','x','',ACornerSizePercent);


        AGetuiPushSDKResDir:=ASaveDir+'GetuiPushSDK\Android_4_3_2\res\';
        //生成2.10.5版的个推推送图标
        SizePicture(FProjectIconFileName,96,96,AGetuiPushSDKResDir+'drawable-hdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,36,36,AGetuiPushSDKResDir+'drawable-hdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-ldpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,18,18,AGetuiPushSDKResDir+'drawable-ldpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,64,64,AGetuiPushSDKResDir+'drawable-mdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,24,24,AGetuiPushSDKResDir+'drawable-mdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,128,128,AGetuiPushSDKResDir+'drawable-xhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-xhdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,192,192,AGetuiPushSDKResDir+'drawable-xxhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,72,72,AGetuiPushSDKResDir+'drawable-xxhdpi\push_small.png','x','',ACornerSizePercent);



        AGetuiPushSDKResDir:=ASaveDir+'GetuiPushSDK\Android_2_13_0_0\res\';
        //生成2.10.2版的个推推送图标
        SizePicture(FProjectIconFileName,96,96,AGetuiPushSDKResDir+'drawable-hdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,36,36,AGetuiPushSDKResDir+'drawable-hdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-ldpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,18,18,AGetuiPushSDKResDir+'drawable-ldpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,64,64,AGetuiPushSDKResDir+'drawable-mdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,24,24,AGetuiPushSDKResDir+'drawable-mdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,128,128,AGetuiPushSDKResDir+'drawable-xhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,48,48,AGetuiPushSDKResDir+'drawable-xhdpi\push_small.png','x','',ACornerSizePercent);

        SizePicture(FProjectIconFileName,192,192,AGetuiPushSDKResDir+'drawable-xxhdpi\push.png','x','',ACornerSizePercent);
        SizePicture(FProjectIconFileName,72,72,AGetuiPushSDKResDir+'drawable-xxhdpi\push_small.png','x','',ACornerSizePercent);

  end
  else
  begin
    ShowMessage(GetLangString(['工程文件或图片文件不存在',
                              'Project file or immage file is not exist'  ]));
                              //'工程文件或图片文件不存在');
  end;

end;

procedure TfrmSmartDeploy.btnGenerateProjectLaunchImageEverySizeClick(Sender: TObject);
var
  ASaveDir:String;
begin
  //生成各种图标在工程的目录

  if FileExists(Self.edtProjectFilePath.Text)
    and FileExists(FProjectLaunchImageFileName) then
  begin

      //处理
      //生成各种尺寸的图标到工程目录

      ASaveDir:=ExtractFilePath(Self.edtProjectFilePath.Text);


      //Android,应该用9patch,并且重命名
      SizePicture(FProjectLaunchImageFileName,426,320,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,470,320,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,640,480,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,960,720,ASaveDir,'x');


      //IOS
      SizePicture(FProjectLaunchImageFileName,320,480,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,640,960,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,640,1136,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,750,1334,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1242,2208,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2208,1242,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2048,1536,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2048,1496,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1536,2048,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1496,2048,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1536,2008,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1024,768,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1024,748,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,768,1024,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,768,1004,ASaveDir,'x');




      //10.3
      SizePicture(FProjectLaunchImageFileName,1136,640,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1334,750,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,828,1792,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1792,828,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1125,2436,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2436,1125,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1242,2688,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2688,1242,ASaveDir,'x');

      SizePicture(FProjectLaunchImageFileName,1668,2224,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2224,1668,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,1668,2388,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2388,1668,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2048,2732,ASaveDir,'x');
      SizePicture(FProjectLaunchImageFileName,2732,2048,ASaveDir,'x');


  end
  else
  begin
      ShowMessage(GetLangString(['工程文件或图片文件不存在',
                              'Project file or immage file is not exist'  ]));
                              //'工程文件或图片文件不存在');
  end;

end;

procedure TfrmSmartDeploy.btnGenerateWeiXinJarClick(Sender: TObject);
var
  ATempRootDir:String;
  ATempJarDir:String;
//var
//  APasSources:TStringList;
//  AProjectPath:String;
begin
  //保存配置
  Self.SaveToINI(ExtractFilePath(Application.ExeName)+'Config.ini');


//  AProjectPath:=Self.edtProjectFilePath.Text;
//  if Self.edtProjectFilePath.Text='' then
//  begin
//    AProjectPath:=Application.ExeName;
//  end;
//
//  FProjectConfig.GenerateJar(
//          //工程目录
//          AProjectPath,//Self.edtProjectFilePath.Text,
//          //将Jar生成在哪个目录,Jar源码目录在哪个目录下等
//          'WeiXinSDK',
//          //未处理的Jar源码的目录
//          'JarSource',
//          //Jar的包名,比如com.ggggcexx.myeasyserivce.wxapi
//          Self.edtWeiXinAndroidPackage.Text+'.wxapi',
//          //应用的包名,用于替换源码中的旧包名
//          Self.edtWeiXinAndroidPackage.Text,
//          //生成的jar文件名
//          'wxapi.jar',
//          //编译所需要用到的其他jar包
//          Self.memUsedAndroidJars.Lines,
//
//          //AndroidSDK
//          Self.edtJDKDir.Text,
//          Self.edtAndroidSDKDir.Text,
//          Self.edtAndroidSDKPlatform.Text,
//          Self.edtAndroidSDKBuildTools.Text
//          );
//
//
//  APasSources:=TStringList.Create;
//
//  //修改Androidapi.JNI.wxapi.pas
//  APasSources.LoadFromFile(ExtractFilePath(edtProjectFilePath.Text)+'WeiXinSDK'+'\'+'Androidapi.JNI.wxapi_origin.pas');
//  ReplaceStringList('com.ggggcexx.orangeui',Self.edtWeiXinAndroidPackage.Text,APasSources);
//  ReplaceStringList('com/ggggcexx/orangeui',ReplaceStr(Self.edtWeiXinAndroidPackage.Text,'.','/'),APasSources);
//  APasSources.SaveToFile(ExtractFilePath(edtProjectFilePath.Text)+'WeiXinSDK'+'\'+'Androidapi.JNI.wxapi.pas');
//
//
//  APasSources.Free;
//
//  Exit;


  //先创建临时文件夹Temp,以aar为命名
  //ProjectFilePath\JarGen\Main_R_Java\
  if Self.edtProjectFilePath.Text='' then
  begin
    //如果没有指定工程目录，直接生成到工具目录
    ATempRootDir:=ExtractFilePath(Application.ExeName)+CONST_JAR_TEMP_DIR+'\';
  end
  else
  begin
    //如果指定了工程目录,就在工程目录下
    ATempRootDir:=ExtractFilePath(Self.edtProjectFilePath.Text)+CONST_JAR_TEMP_DIR+'\';
  end;
  ATempJarDir:=ATempRootDir+'WeiXinSDK'+'\';



  GenerateWeiXinJarBatToProject(
          //ProjectFilePath\JarGen
          ATempRootDir,
          //ProjectFilePath\JarGen\WeiXinSDK
          ATempJarDir,


          Self.edtJDKDir.Text,
          Self.edtAndroidSDKDir.Text,
          Self.edtAndroidSDKPlatform.Text,
          Self.edtAndroidSDKBuildTools.Text,


          ATempJarDir+'wxapi.jar',
          Self.memUsedAndroidJars.Lines,

          Self.edtWeiXinAndroidPackage.Text,
          Self.memWXEntryActivity.Lines,
          Self.memWXPayEntryActivity.Lines,
          Self.memOnWeixinListener.Lines,
          Self.memWxApiPas.Lines
          );


end;

procedure TfrmSmartDeploy.btnLoadDeployClick(Sender: TObject);
begin

  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;



  if FProjectConfig.LoadDeployFileListFromProject(Self.edtProjectFilePath.Text) then
  begin
    LoadDeployFileListToDataSet(FProjectConfig.FCurrentDeployFileList,
                                //IOS,Android,Win,Mac
                                Self.cmbPlatform.Text,
                                //Debug,Release
                                Self.cmbConfiguration.Text,
                                //加载到数据集
                                Self.FCurrentDeployFileListDataSet);
  end;

end;

procedure TfrmSmartDeploy.btnNewConfigClick(Sender: TObject);
begin
  Self.cmbConfigFilePath.Text:='';

  Self.edtProjectFilePath.Text:='';
  Self.FCurrentConfigFileName:='';
  Self.FCurrentDeployFileListDataSet.EmptyDataSet;


  Self.FDeployConfigListDataSet.EmptyDataSet;
  Self.cmbDeployConfigPlatform.ItemIndex:=-1;
  Self.edtDeployConfigLocalDir.Text:='';
  Self.cmbDeployConfigPlatform.ItemIndex:=-1;
  Self.FPreviewDeployFileListDataSet.EmptyDataSet;


  Self.memAndroidApplicationChildNodes.Text:='';
  Self.memAndroidUsersPermissions.Text:='';

  Self.memAndroidJars.Text:='';
  Self.memAndroidAars.Text:='';


  Self.memIOSPlistRootNodes.Text:='';

  Self.edtIOSLinkerOptions.Text:='';




  FreeAndNil(Self.FProjectConfig);
  FProjectConfig:=TProjectConfig.Create;


end;

procedure TfrmSmartDeploy.btnPreviewDeployConfigClick(Sender: TObject);
begin



  //预览
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  if (Self.cmbPreviewDeployConfigPlatform.Text='') then
  begin
    ShowMessage(GetLangString(['请选择目标平台',
                              'Please select target platform'  ]));
                              //'请选择目标平台');
  end;



    
  //根据工程文件
  //生成需要布署的所有文件
  Self.FProjectConfig.FDeployConfigList.GeneratePreviewDeployFileList(
            Self.edtProjectFilePath.Text
            );


  //显示到表格
  //仅显示当前平台
  LoadDeployFileListToDataSet(Self.FProjectConfig.FDeployConfigList.FPreviewDeployFileList,
                              Self.cmbPreviewDeployConfigPlatform.Text,
                              '',
                              Self.FPreviewDeployFileListDataSet
                              );



end;

procedure TfrmSmartDeploy.btnProcessConfigToProjectClick(Sender: TObject);
begin
  //预览
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  //处理文件布署
  btnProcessDeployConfigClick(nil);
  //处理Android的Application子节点
  btnProcessAndroidApplicationChildNodesClick(nil);
  //处理Andorid的Application权限
  btnProcessAndroidUsersPermissionsClick(nil);
  //处理jar
  btnProcessAndroidJarClick(nil);



  //处理IOS编译参数
  btnProcessIOSLinkerOptionsClick(nil);
  //处理IOSPlistRootNodes
  btnProcessIOSPlistRootNodesClick(nil);



end;

procedure TfrmSmartDeploy.btnProcessAndroidJarClick(Sender: TObject);
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;
  

  //保存AndroidJar到
  Self.FProjectConfig.FAndroidJarList.Assign(Self.memAndroidJars.Lines);

  Self.FProjectConfig.SaveAndroidJarListToProject(
              Self.FProjectConfig.FAndroidJarList,
              Self.edtProjectFilePath.Text);
end;

procedure TfrmSmartDeploy.btnProcessDeployConfigClick(Sender: TObject);
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  //根据工程文件
  //生成需要布署的所有文件列表
  Self.FProjectConfig.FDeployConfigList.GeneratePreviewDeployFileList(
            Self.edtProjectFilePath.Text
            );


  //把文件布署列表处理到工程文件
  Self.FProjectConfig.SaveDeployFileListToProject(
      Self.FProjectConfig.FDeployConfigList.FPreviewDeployFileList,
      Self.edtProjectFilePath.Text
      );

end;

procedure TfrmSmartDeploy.btnProcessIOSLinkerOptionsClick(Sender: TObject);
begin
  if not CheckProjectFileIsExist then Exit;

  //保存IOS链接参数
  FProjectConfig.FIOSLinkerOptions:=edtIOSLinkerOptions.Text;


  FProjectConfig.SaveIOSLinkerOptionsToProject(
        Self.edtProjectFilePath.Text,
        FProjectConfig.FIOSLinkerOptions
        );


end;

procedure TfrmSmartDeploy.btnProcessProjectIconClick(Sender: TObject);
begin
  Self.FProjectConfig.SaveProjectIconToProject(Self.edtProjectFilePath.Text);
end;

procedure TfrmSmartDeploy.btnSaveConfigClick(Sender: TObject);
var
  AConfigFileName:String;
begin
  AConfigFileName:=FCurrentConfigFileName;
  if (AConfigFileName='') and Self.sdSaveConfig.Execute(Handle) then
  begin
    AConfigFileName:=Self.sdSaveConfig.FileName;
  end;


  if AConfigFileName<>'' then  
  begin
    
      //保存上次打开的工程文件
      Self.FProjectConfig.FLastProjectFilePath:=Self.edtProjectFilePath.Text;

      //保存布署配置列表
      SaveDataSetToDeployConfigList(Self.FProjectConfig.FDeployConfigList,
                                    Self.FDeployConfigListDataSet);

      //保存AndroidJar到
      Self.FProjectConfig.FAndroidJarList.Assign(Self.memAndroidJars.Lines);


      //保存AndroidAar到
      Self.FProjectConfig.FAndroidAarList.Assign(Self.memAndroidAars.Lines);


      //保存配置变量
      SaveDataSetToVariableList(Self.FProjectConfig.FAndroidVariableList,
                                    Self.FAndroidVariableDataset);



      //保存AndroidManifest.xml中的权限列表
      Self.FProjectConfig.FAndroidUsersPermissions.Assign(Self.memAndroidUsersPermissions.Lines);


      //保存AndroidManifest.xml中的Applcation子节点列表
      Self.FProjectConfig.FAndroidApplicationChildNodes.Assign(Self.memAndroidApplicationChildNodes.Lines);


      //加载IOSPlistRootNodes
      Self.FProjectConfig.FIOSPlistRootNodes.Assign(Self.memIOSPlistRootNodes.Lines);

      //IOS链接参数
      Self.FProjectConfig.FIOSLinkerOptions:=Self.edtIOSLinkerOptions.Text;



      Self.FProjectConfig.SaveToINI(AConfigFileName);


      Self.FCurrentConfigFileName:=AConfigFileName;

      Self.cmbConfigFilePath.Text:=AConfigFileName;
  end;
end;

procedure TfrmSmartDeploy.btnSaveDeployConfigClick(Sender: TObject);
var
  AProjectPath:String;
begin
  //保存修改
  if Not FDeployConfigListDataSet.Eof then
  begin

    AProjectPath:=Self.edtProjectFilePath.Text;

    Self.FDeployConfigListDataSet.Edit;
    Self.FDeployConfigListDataSet.FieldByName('Platform').AsString:=Self.cmbDeployConfigPlatform.Text;
    Self.FDeployConfigListDataSet.FieldByName('LocalDir').AsString:=Self.edtDeployConfigLocalDir.Text;
    Self.FDeployConfigListDataSet.FieldByName('RemoteDir').AsString:=Self.cmbDeployConfigRemoteDir.Text;
    Self.FDeployConfigListDataSet.Post;


    SaveDataSetToDeployConfigList(Self.FProjectConfig.FDeployConfigList,
                                  FDeployConfigListDataSet);
  end;
  
end;

procedure TfrmSmartDeploy.btnAddDeployConfigToGridClick(Sender: TObject);
var
  AProjectPath:String;
begin

  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  //添加布署配置
  if (Self.cmbDeployConfigPlatform.Text<>'')
    and (Self.edtDeployConfigLocalDir.Text<>'')
    and (Self.cmbDeployConfigRemoteDir.Text<>'') then
  begin

      AProjectPath:=Self.edtProjectFilePath.Text;

      //直接保存到Dataset
      Self.FDeployConfigListDataSet.Append;
      Self.FDeployConfigListDataSet.FieldByName('Platform').AsString:=Self.cmbDeployConfigPlatform.Text;
      Self.FDeployConfigListDataSet.FieldByName('LocalDir').AsString:=Self.edtDeployConfigLocalDir.Text;
      Self.FDeployConfigListDataSet.FieldByName('RemoteDir').AsString:=Self.cmbDeployConfigRemoteDir.Text;
      Self.FDeployConfigListDataSet.Post;

      
      //把Dataset中的记录保存到FProjectConfig.FDeployConfigList
      SaveDataSetToDeployConfigList(Self.FProjectConfig.FDeployConfigList,
                                    FDeployConfigListDataSet);


//      //清空
//      Self.edtDeployConfigLocalDir.Text:='';
//      Self.cmbDeployConfigRemoteDir.Text:='';

  end;

end;

procedure TfrmSmartDeploy.btnAddFrameworksToAllIOSSDKClick(Sender: TObject);
var
  I: Integer;
begin
  //获取有哪些Delphi Version
  //获取有哪个IOS SDK
  //再逐一添加


  //添加系统自带的框架


//  //测试
//  AddIOS_SDK_Framework(
//      '18.0',
//      'iPhoneOS10.3.sdk',
//      2,
//      'Test',
//      '$(SDKROOT)/System/Library/Frameworks',
//      '0'
//      );
//  AddLibraryToAllIOS_SDK(
//      2,
//      'Test',
//      '$(SDKROOT)/System/Library/Frameworks',
//      '0'
//      );


  for I := 0 to Self.memIOS_SDK_Frameworks.Lines.Count-1 do
  begin
    AddLibraryToAllIOSSDK(
        2,
        Self.memIOS_SDK_Frameworks.Lines[I],
        '$(SDKROOT)/System/Library/Frameworks',
        '0'
        );
  end;


  ShowMessage(lblAddIOSFrameworkHint.Caption);

end;

procedure TfrmSmartDeploy.btnBatchProcessSDKsClick(Sender: TObject);
begin
  ProcessEnabledSDKS(Self.edtProjectFilePath.Text,
                      ExtractFilePath(Self.edtProjectFilePath.Text)
                      +ExtractFileNameNoExt(Self.edtProjectFilePath.Text)
                      +Const_OrangeSDKConfig_FileExt
                      );
end;

procedure TfrmSmartDeploy.btnOpenConfigClick(Sender: TObject);
begin
  if Self.odSelectConfig.Execute(Handle) then
  begin
    LoadConfigFile(Self.odSelectConfig.FileName);
  end;

end;

function FindListViewItem(AListView:TListView;ACaption:String):TListItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to AListView.Items.Count-1 do
  begin
    if AListView.Items[I].Caption=ACaption then
    begin
      Result:=AListView.Items[I];
      Break;
    end;
  end;
end;

procedure TfrmSmartDeploy.btnSelectProjectClick(Sender: TObject);
var
  I:Integer;
begin
  if Self.odSelectProject.Execute(Handle) then
  begin

//    I:=Self.edtProjectFilePath.Items.IndexOf(Self.odSelectProject.FileName);
//    if I<>-1 then
//    begin
//      Self.edtProjectFilePath.Items.Delete(I);
//    end;
    if I=-1 then
    begin
      Self.edtProjectFilePath.Items.Insert(0,Self.odSelectProject.FileName);
      Self.edtProjectFilePath.Items.SaveToFile(ExtractFilePath(Application.ExeName)+'ProjectHistory.txt');
    end;

    Self.edtProjectFilePath.Text:=Self.odSelectProject.FileName;
    //加载布署
    btnLoadDeployClick(nil);

    SyncEnabledSDKS;

  end;
end;

procedure TfrmSmartDeploy.btnSelectProjectIconClick(Sender: TObject);
begin
  if Self.opdSelectProjectIcon.Execute(Handle) then
  begin
    Self.imgProjectIcon.Picture.LoadFromFile(Self.opdSelectProjectIcon.FileName);
    FProjectIconFileName:=Self.opdSelectProjectIcon.FileName;
  end;
end;

procedure TfrmSmartDeploy.btnSelectProjectLaunchImageClick(Sender: TObject);
begin
  if Self.opdSelectProjectLaunchImage.Execute(Handle) then
  begin
    Self.imgProjectLaunchImage.Picture.LoadFromFile(Self.opdSelectProjectLaunchImage.FileName);
    FProjectLaunchImageFileName:=Self.opdSelectProjectLaunchImage.FileName;
  end;
end;

procedure TfrmSmartDeploy.btnProcessAndroidUsersPermissionsClick(Sender: TObject);
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;



  //保存变量
  SaveDataSetToVariableList(Self.FProjectConfig.FAndroidVariableList,
                                Self.FAndroidVariableDataset);

  //保存权限列表
  Self.FProjectConfig.FAndroidUsersPermissions.Assign(Self.memAndroidUsersPermissions.Lines);


  //处理
  Self.FProjectConfig.SaveAndroidUsersPermissionsToProject(
              Self.FProjectConfig.FAndroidUsersPermissions,
              Self.FProjectConfig.FAndroidVariableList,
              Self.edtProjectFilePath.Text);
end;

procedure TfrmSmartDeploy.btnProcessAndroidApplicationChildNodesClick(Sender: TObject);
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;




  //保存Applcation子节点列表
  Self.FProjectConfig.FAndroidApplicationChildNodes.Assign(Self.memAndroidApplicationChildNodes.Lines);

  //保存变量
  SaveDataSetToVariableList(Self.FProjectConfig.FAndroidVariableList,
                                Self.FAndroidVariableDataset);

  //处理
  Self.FProjectConfig.SaveAndroidApplicationChildNodesToProject(
              Self.FProjectConfig.FAndroidApplicationChildNodes,
              Self.FProjectConfig.FAndroidVariableList,
              Self.edtProjectFilePath.Text);

end;


procedure TfrmSmartDeploy.btnGenerateAndroidAARClick(Sender: TObject);
var
  I:Integer;
  AProjectFilePath:String;
  ATempRootDir:String;
  AProjectName:String;
  AAarName:String;
  AProjectGenPath:String;
  AAndroidManifestXmlFilePath:String;
  AAndroidManifestXmlFilePaths:TStringList;
  AGenJarFileNamesNoExt:TStringList;
  AAndroidJarList:TStringList;
  AAbsoluteFileList:TStringList;

  var AJDKDir:String;
  var AAndroidSDKDir:String;
  var AAndroidSDKPlatform:String;
  var AAndroidSDKBuildTools:String;

  ABatStringList:TStringList;
  AGenJarBatFilePath:String;

//  AResDir:String;

  AAndroidPlatform:String;
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  AAndroidPlatform:='Android';
  if chkGenerateAndroid64AAR.Checked then
  begin
    AAndroidPlatform:='Android64';
  end;


  if not FProjectConfig.GetAndroidSDKSetting(
                                            //19.0,20.0
                                            Self.cmbDelphiVersions.Text,//'20.0',
                                            //后面都不带\
                                            AJDKDir,
                                            AAndroidSDKDir,
                                            AAndroidSDKPlatform,
                                            AAndroidSDKBuildTools
                                            ) then
  begin
    ShowMessage('Delphi的AndroidSDK配置有问题!');
    Exit;
  end;


  //生成编译R.java的批处理,不然调用aar的时候会出现资源文件找不到，而产生闪退
  AProjectFilePath:=Self.edtProjectFilePath.Text;


  AAndroidJarList:=TStringList.Create;
  AAndroidManifestXmlFilePaths:=TStringList.Create;
  AGenJarFileNamesNoExt:=TStringList.Create;
  try

      //从工程目录获取添加的jar列表,这些jar在aar的解压目录中
      FProjectConfig.LoadAndroidJarListFromProject(AAndroidJarList,AProjectFilePath);
      if AAndroidJarList.Count=0 then
      begin
        ShowMessage('该工程尚未添加任何jar,请先添加!');
        Exit;
      end;


      //取到工程名称
      //TestTwitter_Android.dproj  ->  TestTwitter_Android
      AProjectName:=ReplaceStr(ExtractFileName(AProjectFilePath),'.dproj','');



      //工程目录的JarGen目录,统一放在一个JarGen目录中,好管理
      //比如C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\JarGen\Project1\
      ATempRootDir:=ExtractFilePath(AProjectFilePath)+CONST_JAR_TEMP_DIR+'\'+AProjectName+'\';



      //当前工程的临时文件生成目录,用于获取生成的AndroidManifest.xml和res目录
      //比如C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\Android\Release\Project1\
      AProjectGenPath:=ExtractFilePath(AProjectFilePath)
                        +AAndroidPlatform+'\Release\'
                        +AProjectName+'\';


      if not FileExists(AProjectGenPath+'AndroidManifest.xml') then
      begin
        ShowMessage('AndroidManifest.xml不存在,请先在Android平台编译并运行一次!');
        Exit;
      end;
      if not DirectoryExists(AProjectGenPath+'res') then
      begin
        ShowMessage('生成目录中不存在res目录,请先在Android平台编译并运行一次!');
        Exit;
      end;



      //要生成工程文件包名的R.jar,不需要了
//      AAndroidManifestXmlFilePaths.Add(AProjectGenPath+'AndroidManifest.xml');
//      AGenJarFileNamesNoExt.Add(AProjectName);

//      if ATempDexedJarFilePath<>'' then
//      begin
//        ABatStringList.Add('del '+'"'+ATempDexedJarFilePath+'"');
//      end;
//C:\MyFiles\ThirdPartySDK\Android图片视频选择器dmcBig_mediapicker\Android\Release\
//R_JAVA_TestMediaPicker_D10_4-dexed.jar
//R_JAVA_TestMediaPicker-dexed.jar
      DeleteFile(ExtractFilePath(AProjectFilePath)+AAndroidPlatform+'\Release\'+'R_JAVA_'+AProjectName+'-dexed'+'.jar'
                        );




      //对应每个aar也要生成R.java
      //取出每个aar目录中的AndroidManifest.xml文件路径
      for I := 0 to AAndroidJarList.Count-1 do
      begin
          //判断jar目录下是否存在AndroidManifest.xml以及它的res目录,
          //获取aar目录下面的AndroidManifest.xml
          //比如C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\me_dm7_barcodescanner\core_1_9_8\AndroidManifest.xml
          //比如C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\me_dm7_barcodescanner\core_1_9_8\res\
          AAndroidManifestXmlFilePath:=
            //\me_dm7_barcodescanner\core_1_9_8\me_dm7_barcodescanner_core.jar
            //转换成绝对路径,获取jar所在的绝对目录
            ConvertRelativePathToAbsolutePath(ExtractFilePath(AProjectFilePath),ExtractFilePath(AAndroidJarList[I]))
                    +'AndroidManifest.xml';


          //判断jar目录下是否存在AndroidManifest.xml以及它的res目录,
          if not FileExists(AAndroidManifestXmlFilePath) then
          begin
            Continue;
          end;
          if not DirectoryExists(ExtractFilePath(AAndroidManifestXmlFilePath)+'res') then
          begin
            Continue;
          end;


          //判断res目录下是否存在需要布署的子文件
          AAbsoluteFileList:=TStringList.Create;
          try
            DoGetFileList(ExtractFilePath(AAndroidManifestXmlFilePath)+'res',AAbsoluteFileList);
            if AAbsoluteFileList.Count=0 then
            begin
              //该aar没有需要布署的资源,因此它没有R.java,不需要处理
              Continue;
            end;
          finally
            FreeAndNil(AAbsoluteFileList);
          end;





          AAndroidManifestXmlFilePaths.Add(AAndroidManifestXmlFilePath);
          AAarName:=ExtractFilePath(AAndroidJarList[I]);
          //去掉\
          AAarName:=Copy(AAarName,1,Length(AAarName)-1);
          //获取aar文件夹的名称
          AGenJarFileNamesNoExt.Add(ExtractFileName(AAarName));


      end;





      ABatStringList:=TStringList.Create;
      //所需要生成R.java的
      for I := 0 to AAndroidManifestXmlFilePaths.Count-1 do
      begin
          //将相关的src

//          AResDir:=ExtractFilePath(AAndroidManifestXmlFilePaths[I])+'res';
//          if DirectoryExists(ExtractFilePath(AAndroidManifestXmlFilePaths[I])+'res_origin') then
//          begin
//            AResDir:=ExtractFilePath(AAndroidManifestXmlFilePaths[I])+'res_origin';
//          end;
          
          //传入工程项目的res目录和AndroidManifest.xml路径列表
          //生成R.java,Gen_R_Java_***.bat列表
          Self.FProjectConfig.GenerateR_Java_And_Jar_BatStringList(
                                        //C:\MyFiles\ThirdPartySDK\Android的ZBar二维码扫描me_dm7_barcodescanner\JarGen\目录
                                        ATempRootDir,
                                        //资源文件目录
                                        //C:\MyFiles\ThirdPartySDK\Android图片视频选择器dmcBig_mediapicker\Android\Release\TestMediaPicker\res
                                        AProjectGenPath+'res',
//                                        AResDir,
                                        //需要生成R.java的
                                        //C:\MyFiles\ThirdPartySDK\Android图片视频选择器dmcBig_mediapicker\Android\Release\TestMediaPicker\AndroidManifest.xml
                                        AAndroidManifestXmlFilePaths[I],
                                        //Jar不带后缀的包名
                                        AProjectName,//AGenJarFileNamesNoExt[I],

                                        AJDKDir,
                                        AAndroidSDKDir,
                                        AAndroidSDKPlatform,
                                        AAndroidSDKBuildTools,

                                        ABatStringList
                                        );



      end;

      AGenJarBatFilePath:=ATempRootDir+'Generate_R_JAVA.bat';
      ABatStringList.Add('pause');
      //保存到文件
      ABatStringList.SaveToFile(AGenJarBatFilePath);

      ABatStringList.Free;



      ShellExecute(0, nil, PChar(AGenJarBatFilePath), nil, nil, SW_SHOWMAXIMIZED);


      //将R_JAVA_***.jar添加到工程中去



  finally
    AAndroidManifestXmlFilePaths.Free;
    AGenJarFileNamesNoExt.Free;
    AAndroidJarList.Free;
  end;

end;

procedure TfrmSmartDeploy.Button1Click(Sender: TObject);
begin
  SyncEnabledSDKS;
  //
end;

procedure TfrmSmartDeploy.Button2Click(Sender: TObject);
begin
//  Self.FProjectConfig.ClearIOSLaunchImageToProject(Self.edtProjectFilePath.Text);
end;

procedure TfrmSmartDeploy.Button3Click(Sender: TObject);
begin
  //保存配置
  Self.SaveToINI(ExtractFilePath(Application.ExeName)+'Config.ini');
end;

procedure TfrmSmartDeploy.Button4Click(Sender: TObject);
begin
//  ASaveDir:=ExtractFilePath(Self.edtProjectFilePath.Text);


  CutPicture(FProjectLaunchImageFileName,
              1080,
              1400,
              'C:\',
              'temp.png');

end;

procedure TfrmSmartDeploy.Button5Click(Sender: TObject);
begin
  CornerPicture(Self.opdSelectProjectIcon.FileName,
                'C:\',
                'test.png',
                StrToFloat(Self.edtIconCornerSizePercent.Text)
                );

end;

procedure TfrmSmartDeploy.btnProcessAndroidAARClick(Sender: TObject);
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;


  //保存AndroidAar到
  Self.FProjectConfig.FAndroidAarList.Assign(Self.memAndroidAars.Lines);

  Self.FProjectConfig.SaveAndroidAarListToProject(
              Self.FProjectConfig.FAndroidAarList,
              Self.edtProjectFilePath.Text);

end;

procedure TfrmSmartDeploy.Button7Click(Sender: TObject);
var
  I:Integer;
  AEnabledSDKNames:TStringList;
begin
  if not CheckProjectFileIsExist then Exit;

  AEnabledSDKNames:=TStringList.Create;
  for I := 0 to Self.lvNeedUseSDKs.Items.Count-1 do
  begin
    if Self.lvNeedUseSDKs.Items[I].Checked then
    begin
      AEnabledSDKNames.Add(Self.lvNeedUseSDKs.Items[I].Caption);
    end;
  end;



  //先将所勾选的SDK保存到配置文件
  SaveEnabledSDKS(Self.edtProjectFilePath.Text,AEnabledSDKNames);


  AEnabledSDKNames.Free;


end;

procedure TfrmSmartDeploy.ChangeLanguage(ALang: TLangKind);
begin
//  //测试
//  //当前的语言
//  GlobalCurLang:='en';
  //中文
  LangKind:=ALang;//TLangKind.lkEN;


  //翻译
  Self.Caption:=Langs_AppCaption[LangKind];

  Self.btnNewConfig.Caption:=Langs_NewConfig[LangKind];
  Self.btnOpenConfig.Caption:=Langs_OpenConfig[LangKind];
  Self.btnSaveConfig.Caption:=Langs_SaveConfig[LangKind];
  lblCurrentConfig.Caption:=Langs_CurrentConfig[LangKind];

  Self.btnSelectProject.Caption:=Langs_SelectProject[LangKind];
  Self.btnProcessConfigToProject.Caption:=Langs_ProcessConfigToProject[LangKind];
  Self.lblCurrentProject.Caption:=Langs_CurrentProject[LangKind];


  Self.tsDeployConfig.Caption:=Langs_DeployConfig[LangKind];
  Self.tsVariable.Caption:=Langs_SDKVariableConfig[LangKind];
  Self.tsAndroidManifestConfig.Caption:=Langs_AndroidPermissionConfig[LangKind];
  Self.tsAndroidJar.Caption:=Langs_AndroidJarConfig[LangKind];
  Self.tsIOSConfig.Caption:=Langs_IOSFrameworkConfig[LangKind];
  Self.tsIconConfig.Caption:=Langs_IconAndLaunchConfig[LangKind];




  Self.lblDeployTargetPlatform.Caption:=Langs_DeployTargetPlatform[LangKind];
  Self.lblDeployLocalDirOrFile.Caption:=Langs_DeployLocalDirOrFile[LangKind];
  Self.lblDeployRemoteDirOrFile.Caption:=Langs_DeployRemoteDirOrFile[LangKind];

  Self.btnSelectDeployConfigLocalDir.Caption:=Langs_DeploySelectDir[LangKind];
  Self.btnSelectDeployConfigLocalFile.Caption:=Langs_DeploySelectFile[LangKind];

  Self.btnAddDeployConfigToGrid.Caption:=Langs_DeployAddToGrid[LangKind];
  Self.btnSaveDeployConfig.Caption:=Langs_DeploySaveToGrid[LangKind];
  Self.btnDeleteDeployConfig.Caption:=Langs_DeployDelToGrid[LangKind];


  Self.lblDeployPreviewFileList.Caption:=Langs_DeployPreviewFileList[LangKind];
  Self.lblDeployPreviewTargetPlatform.Caption:=Langs_DeployPreviewTargetPlatform[LangKind];
  Self.btnPreviewDeployConfig.Caption:=Langs_PreviewDeployConfig[LangKind];
  Self.btnProcessDeployConfig.Caption:=Langs_ProcessDeployConfig[LangKind];



  Self.lblVariableHint.Caption:=Langs_VariableHint[LangKind];


  Self.lblAndroidPermissionHint.Caption:=Langs_AndroidPermissionHint[LangKind];
  Self.btnProcessAndroidUsersPermissions.Caption:=Langs_ProcessAndroidPermissions[LangKind];
  Self.lblAndroidComponentHint.Caption:=Langs_AndroidComponentHint[LangKind];
  Self.btnProcessAndroidApplicationChildNodes.Caption:=Langs_ProcessAndroidApplicationChildNodes[LangKind];



  Self.btnAddAndroidJar.Caption:=Langs_AddAndroidJar[LangKind];
  Self.btnProcessAndroidJar.Caption:=Langs_ProcessAndroidJar[LangKind];

  Self.btnAddAndroidAar.Caption:=Langs_AddAndroidAar[LangKind];
  Self.btnProcessAndroidAAR.Caption:=Langs_ProcessAndroidAar[LangKind];
  Self.btnGenerateAndroidAAR.Caption:=Langs_GenerateAndroidAar[LangKind];


  Self.lblIOSLinkerOptionsHint.Caption:=Langs_IOSLinkerOptionsHint[LangKind];
  Self.btnProcessIOSLinkerOptions.Caption:=Langs_ProcessIOSLinkerOptions[LangKind];
  Self.lblAddIOSFrameworkHint.Caption:=Langs_AddIOSFrameworkHint[LangKind];
  Self.btnAddFrameworksToAllIOSSDK.Caption:=Langs_AddFrameworksToAllIOSSDK[LangKind];
  Self.btnAddDylibsToAllIOSSDK.Caption:=Langs_AddDylibsToAllIOSSDK[LangKind];
  Self.btnProcessIOSPlistRootNodes.Caption:=Langs_ProcessIOSPlistRootNodes[LangKind];


  Self.lblAppIconHint.Caption:=Langs_AppIcon[LangKind];
  Self.btnSelectProjectIcon.Caption:=Langs_SelectProjectIcon[LangKind];
  Self.btnGenerateProjectIconEverySize.Caption:=Langs_GenerateProjectIconEverySize[LangKind];
  Self.btnProcessProjectIcon.Caption:=Langs_SetAsProjectIcon[LangKind];


  Self.lblAppLaunchImageHint.Caption:=Langs_AppLaunchImage[LangKind];
  Self.btnSelectProjectLaunchImage.Caption:=Langs_SelectProjectLaunchImage[LangKind];
  Self.btnGenerateProjectLaunchImageEverySize.Caption:=Langs_GenerateProjectLaunchImageEverySize[LangKind];
  Self.btnProcessProjectLaunchImage.Caption:=Langs_SetAsProjectLaunchImage[LangKind];
  Self.lblLaunchImageScaleBaseHeightHint.Caption:=Langs_LaunchImageScaleBaseHeightHint[LangKind];
  Self.lblLaunchImageBackColorHint.Caption:=Langs_LaunchImageBackColorHint[LangKind];
  Self.lblBackColorHexCodeHint.Caption:=Langs_BackColorHexCodeHint[LangKind];
  Self.btnCombineLaunchImageByBackColor.Caption:=Langs_CombineLaunchImageByBackColor[LangKind];


end;

function TfrmSmartDeploy.CheckProjectFileIsExist: Boolean;
begin
  Result:=False;
  if (Self.edtProjectFilePath.Text='') then
  begin
    ShowMessage(GetLangString(['请选择工程文件',
                              'Please select project file'  ]));
                              //'请选择工程文件');
    Exit;
  end;

  if Not FileExists(Self.edtProjectFilePath.Text) then
  begin
    ShowMessage(GetLangString(['工程文件不存在',
                              'Project file is not exist'  ]));
                              //'工程文件不存在');
    Exit;
  end;
  Result:=True;
end;

procedure TfrmSmartDeploy.btnProcessProjectLaunchImageClick(Sender: TObject);
begin
  Self.FProjectConfig.SaveProjectLaunchImageToProject(Self.edtProjectFilePath.Text);

end;

procedure TfrmSmartDeploy.btnSelectDeployConfigLocalFileClick(Sender: TObject);
begin
  if odSelectNeedDeployFile.Execute then
  begin
    Self.edtDeployConfigLocalDir.Text:=
        ConvertAbsolutePathToRelativePath(Self.edtProjectFilePath.Text,
                                          odSelectNeedDeployFile.FileName);
  end;
end;

procedure TfrmSmartDeploy.btnSelectDeployConfigLocalDirClick(Sender: TObject);
begin
  if CurrentSelectedFolderName='' then
  begin
    //默认工程文件的文件夹
    CurrentSelectedFolderName:=ExtractFilePath(Self.edtProjectFilePath.Text);
  end;

  if SelectDirectory(GetLangString(['选择要布署的文件夹',
                              'Select file need deploy'  ]),
                              //'选择要布署的文件夹',

                    '', CurrentSelectedFolderName) then
  begin
    if CurrentSelectedFolderName[Length(CurrentSelectedFolderName)]<>'\' then
    begin
      CurrentSelectedFolderName:=CurrentSelectedFolderName+'\';
    end;
    Self.edtDeployConfigLocalDir.Text:=
        ConvertAbsolutePathToRelativePath(Self.edtProjectFilePath.Text,CurrentSelectedFolderName);
  end;
end;

procedure TfrmSmartDeploy.btnCombineLaunchImageByBackColorClick(Sender: TObject);
var
  ASaveDir:String;
  ABackColor:TColor;
  AScaleBaseHeight:Integer;
begin
  //将启动图片画在背景颜色上面
  //然后生成各种图片的尽寸


  //生成各种图标在工程的目录
  if Self.edtProjectLaunchBackColor.Text='' then
  begin
    //转成颜色
    ShowMessage(GetLangString(['请先指定颜色',
                              'Please select color first'  ]));
                              //'请先指定颜色');
    Exit;
  end;

  //ARGB->0BGR
  ABackColor:=StrToInt('$'+Copy(Self.edtProjectLaunchBackColor.Text,1+2,2))
              +StrToInt('$'+Copy(Self.edtProjectLaunchBackColor.Text,1+4,2)) shl 8
              +StrToInt('$'+Copy(Self.edtProjectLaunchBackColor.Text,1+6,2)) shl 16;

  AScaleBaseHeight:=StrToInt(Self.edtScaleBaseHeight.Text);




  if FileExists(Self.edtProjectFilePath.Text)
    and FileExists(FProjectLaunchImageFileName) then
  begin

    //处理
    //生成各种尺寸的图标到工程目录

    ASaveDir:=ExtractFilePath(Self.edtProjectFilePath.Text);


    //Android,应该用9patch,并且重命名
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,426,320,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,470,320,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,640,480,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,960,720,ASaveDir,'x');


    SizePicture(FProjectLaunchImageFileName,426,320,ASaveDir,'x');
    SizePicture(FProjectLaunchImageFileName,470,320,ASaveDir,'x');
    SizePicture(FProjectLaunchImageFileName,640,480,ASaveDir,'x');
    SizePicture(FProjectLaunchImageFileName,960,720,ASaveDir,'x');


//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,426,320,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,470,320,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,640,480,ASaveDir,'x');
//    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,960,720,ASaveDir,'x');


    //IOS
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,320,480,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,640,960,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,640,1136,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,750,1334,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1242,2208,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2208,1242,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2048,1536,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2048,1496,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1536,2048,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1496,2048,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1536,2008,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1024,768,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1024,748,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,768,1024,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,768,1004,ASaveDir,'x');




    //10.3
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1136,640,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1334,750,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,828,1792,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1792,828,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1125,2436,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2436,1125,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1242,2688,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2688,1242,ASaveDir,'x');

    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1668,2224,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2224,1668,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,1668,2388,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2388,1668,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2048,2732,ASaveDir,'x');
    CombineSizePictureByBackColor(FProjectLaunchImageFileName,ABackColor,AScaleBaseHeight,2732,2048,ASaveDir,'x');


  end
  else
  begin
    ShowMessage(GetLangString(['工程文件或图片文件不存在',
                              'Project file or image file is not exist'  ]));
                              //'工程文件或图片文件不存在');
  end;


end;

procedure TfrmSmartDeploy.cmbConfigFilePathChange(Sender: TObject);
begin


  if Self.cmbConfigFilePath.ItemIndex<>-1 then
  begin
//    Self.edtProjectFilePath.Text:=
    LoadConfigFile(Self.cmbConfigFilePath.Items[Self.cmbConfigFilePath.ItemIndex]);
    //加载布署
//    btnLoadDeployClick(nil);
  end;

end;

procedure TfrmSmartDeploy.cmbProjectLaunchBackColorClick(Sender: TObject);
var
  ABackColor:TColor;
  AColorStr:String;
begin
  ABackColor:=Self.cmbProjectLaunchBackColor.Selected;

  //0BGR
  AColorStr:='FF'
          +IntToHex(Byte(ABackColor),2)
          +IntToHex((ABackColor and $0000FF00) shr 8,2)
          +IntToHex((ABackColor and $00FF0000) shr 16,2);


  Self.edtProjectLaunchBackColor.Text:=
      //将TColor转成十六进制
      AColorStr;

end;

procedure TfrmSmartDeploy.btnAddDylibsToAllIOSSDKClick(Sender: TObject);
var
  I: Integer;
begin
  //获取有哪些Delphi Version
  //获取有哪个IOS SDK
  //再逐一添加


  //添加系统自带的框架


//  //测试
//  AddIOS_SDK_Framework(
//      '18.0',
//      'iPhoneOS10.3.sdk',
//      2,
//      'Test',
//      '$(SDKROOT)/System/Library/Frameworks',
//      '0'
//      );
//  AddLibraryToAllIOSSDK(
//      2,
//      'Test',
//      '$(SDKROOT)/System/Library/Frameworks',
//      '0'
//      );




  for I := 0 to Self.memIOS_SDK_Dylibs.Lines.Count-1 do
  begin
    AddLibraryToAllIOSSDK(
        1,
        Self.memIOS_SDK_Dylibs.Lines[I],
        '$(SDKROOT)/usr/lib',
        '0'
        );
  end;


  ShowMessage(lblAddIOSFrameworkHint.Caption);
end;

procedure TfrmSmartDeploy.btnLoadAndroidSDKFromRegClick(Sender: TObject);
//var
//  I: Integer;
//  AKey:String;
////  APathCount:Integer;
//  AReg:TRegistry;
////  AIsExists:Boolean;
//  ATempStr:String;
//  AKeyStringList:TStringList;
var AJDKDir,
  AAndroidSDKDir, AAndroidSDKPlatform, AAndroidSDKBuildTools: String;
begin

  Self.FProjectConfig.GetAndroidSDKSetting(Self.cmbDelphiVersions.Text,
                                    AJDKDir, AAndroidSDKDir, AAndroidSDKPlatform, AAndroidSDKBuildTools
                                    );


  Self.edtJDKDir.Text:=AJDKDir;
  Self.edtAndroidSDKDir.Text:=AAndroidSDKDir;
  Self.edtAndroidSDKPlatform.Text:=AAndroidSDKPlatform;
  Self.edtAndroidSDKBuildTools.Text:=AAndroidSDKBuildTools;


  //保存配置
  Self.SaveToINI(ExtractFilePath(Application.ExeName)+'Config.ini');


//  //设置注册表
//  AReg:=TRegistry.Create;
//  AKeyStringList:=TStringList.Create;
//  try
//      AReg.RootKey:=HKEY_CURRENT_USER;
//
//
//      AKey:='\Software\Embarcadero\BDS\'
//              +Self.cmbDelphiVersions.Text+'\'
//              +'PlatformSDKs'+'\';
//
//      //找到AndroidSDK
//      if AReg.OpenKey(AKey,False) then
//      begin
//          ATempStr:=AReg.ReadString('Default_Android');
//
//          if ATempStr<>'' then
//          begin
//              if AReg.OpenKey(AKey+ATempStr,False) then
//              begin
//                  Self.edtJDKDir.Text:=AReg.ReadString('JDKPath');
//                  Self.edtAndroidSDKDir.Text:=AReg.ReadString('SystemRoot');
//                  Self.edtAndroidSDKPlatform.Text:=AReg.ReadString('SDKApiLevelPath');
//                  Self.edtAndroidSDKBuildTools.Text:=ExtractFilePath(AReg.ReadString('SDKAaptPath'));
//              end;
//          end;
//
//      end
//      else
//      begin
//          DoDeployConfigLog(nil,'AddIOS_SDK_Framework Open key "'+AKey+'" fail!');
//          Exit;
//      end;
//
//
////          AIsExists:=False;
////          if AReg.ValueExists('PathCount') then
////          begin
////              try
////                  APathCount:=AReg.ReadInteger('PathCount');
////
////
////                  AReg.GetValueNames(AKeyStringList);
////                  for I := 0 to AKeyStringList.Count-1 do
////                  begin
////                    if Copy(AKeyStringList[I],1,4)='Mask' then
////                    begin
////
////                        ATempStr:=Copy(AKeyStringList[I],5,MaxInt);
////
////                        //取出值,比对是否存在
////                        if AReg.ReadString(AKeyStringList[I])=APathName then
////                        begin
////                          //已经存在,不用添加了
////                          AIsExists:=True;
////                          Break;
////                        end;
////
////
////                    end;
////                  end;
////
////
////                  //注册表里没有
////                  if Not AIsExists then
////                  begin
////                    AReg.WriteInteger('Type'+IntToStr(APathCount),APathType);
////                    AReg.WriteString('Mask'+IntToStr(APathCount),APathName);
////                    AReg.WriteString('Path'+IntToStr(APathCount),APathDir);
////                    AReg.WriteString('IncludeSubDir'+IntToStr(APathCount),AIncludeSubDir);
////
////                    AReg.WriteInteger('PathCount',APathCount+1);
////                  end;
////              except
////                on E:Exception do
////                begin
////                  DoDeployConfigLog(nil,'AddIOS_SDK_Framework Error:'+E.Message);
////                end;
////              end;
////          end
////          else
////          begin
////              DoDeployConfigLog(nil,'AddIOS_SDK_Framework PathCount is not exist!');
////          end;
//
//  finally
//    FreeAndNil(AReg);
//    FreeAndNil(AKeyStringList);
//  end;

end;

procedure TfrmSmartDeploy.btnAddAndroidAarClick(Sender: TObject);
var
  I: Integer;
var
  AProjectPath:String;
  AAarRelativePath:String;
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then
     Exit;

  AProjectPath:=Self.edtProjectFilePath.Text;

  if Self.odSelectAndroidAar.Execute(Handle) then
  begin
    for I := 0 to Self.odSelectAndroidAar.Files.Count-1 do
    begin
      AAarRelativePath:=
          //转换成相对路径
          ConvertAbsolutePathToRelativePath(AProjectPath,
                                            Self.odSelectAndroidAar.Files[I]);

      if Self.memAndroidAars.Lines.IndexOf(AAarRelativePath)=-1 then
      begin
        Self.memAndroidAars.Lines.Add(AAarRelativePath);
      end;
    end;
  end;





//  //因为需要计算出相对目录
//  if not CheckProjectFileIsExist then Exit;
//
//
//  AProjectPath:=Self.edtProjectFilePath.Text;
//
//  if CurrentSelectedFolderName='' then
//  begin
//    CurrentSelectedFolderName:=ExtractFilePath(Self.edtProjectFilePath.Text);
//  end;
//
//  if SelectDirectory(GetLangString(['选择aar解压后的文件夹',
//                              'Select the directory of aar be extracted'  ]),
//                              //'选择aar(解压后的文件夹)',
//                      '',
//                      CurrentSelectedFolderName) then
//  begin
//    if CurrentSelectedFolderName[Length(CurrentSelectedFolderName)]<>'\' then
//    begin
//      CurrentSelectedFolderName:=CurrentSelectedFolderName+'\';
//    end;
//
//    Self.memAndroidAars.Lines.Add(
//      ConvertAbsolutePathToRelativePath(Self.edtProjectFilePath.Text,
//                                        CurrentSelectedFolderName)
//                                        );
//  end;

end;

procedure TfrmSmartDeploy.btnAddAndroidJarClick(Sender: TObject);
var
  I: Integer;
var
  AProjectPath:String;
  AJarRelativePath:String;
begin
  //因为需要计算出相对目录
  if not CheckProjectFileIsExist then Exit;



  AProjectPath:=Self.edtProjectFilePath.Text;

  if Self.odSelectAndroidJar.Execute(Handle) then
  begin
    for I := 0 to Self.odSelectAndroidJar.Files.Count-1 do
    begin
      //转换成相对路径
      AJarRelativePath:=ConvertAbsolutePathToRelativePath(AProjectPath,
                                            Self.odSelectAndroidJar.Files[I]);
      if Self.memAndroidJars.Lines.IndexOf(AJarRelativePath)=-1 then
      begin
        Self.memAndroidJars.Lines.Add(
            AJarRelativePath
            );
      end;
    end;
  end;

end;

procedure TfrmSmartDeploy.btnProcessIOSPlistRootNodesClick(Sender: TObject);
var
  AInfoPlistFilePath:String;
begin
  if not CheckProjectFileIsExist then Exit;

  //保存变量
  SaveDataSetToVariableList(Self.FProjectConfig.FAndroidVariableList,
                                Self.FAndroidVariableDataset);

  //保存IOS Plist RootNodes
  FProjectConfig.FIOSPlistRootNodes.Assign(Self.memIOSPlistRootNodes.Lines);


  FProjectConfig.SaveIOSInfoPlistToProject(
        Self.edtProjectFilePath.Text,
        FProjectConfig.FIOSPlistRootNodes,
        Self.FProjectConfig.FAndroidVariableList
        );

end;

function TfrmSmartDeploy.CreateDeployFileListClientDataSet: TClientDataSet;
begin
  //创建数据集
  Result:=TClientDataSet.Create(Self);
  //定义内存表的测试字段
  Result.FieldDefs.Add('LocalName',TFieldType.ftString,200,False);
  Result.FieldDefs.Add('Class',TFieldType.ftString,20,False);
  Result.FieldDefs.Add('Platforms',TFieldType.ftString,30,False);
  Result.FieldDefs.Add('Configuration',TFieldType.ftString,10,False);
  Result.FieldDefs.Add('RemoteDir',TFieldType.ftString,100,False);
  Result.FieldDefs.Add('RemoteName',TFieldType.ftString,50,False);
  Result.FieldDefs.Add('Overwrite',TFieldType.ftString,10,False);
  //创建内存表
  Result.CreateDataSet;

end;

procedure TfrmSmartDeploy.dbgDeployConfigCellClick(Column: TColumn);
begin
  //修改当前布署配置
  if Not Self.FDeployConfigListDataSet.Eof then
  begin
    Self.cmbPlatform.ItemIndex:=
      Self.cmbPlatform.Items.IndexOf(
        Self.FDeployConfigListDataSet.FieldByName('Platform').AsString
                                    );
    Self.edtDeployConfigLocalDir.Text:=
      Self.FDeployConfigListDataSet.FieldByName('LocalDir').AsString;
    Self.cmbDeployConfigRemoteDir.Text:=
      Self.FDeployConfigListDataSet.FieldByName('RemoteDir').AsString;

  end;
end;

procedure TfrmSmartDeploy.DoRecordDeployConfigLog(Sender: TObject; const ALog: String);
begin
  Self.memLog.Lines.Add(ALog);
end;

procedure TfrmSmartDeploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.SaveToINI(ExtractFilePath(Application.ExeName)+'Config.ini');
end;

procedure TfrmSmartDeploy.FormCreate(Sender: TObject);
var
  I: Integer;
  AColumn:TColumn;
begin

//  Self.tsWeiXinJar.TabVisible:=True;//DirectoryExists('E:\MyFiles') or DirectoryExists('C:\MyFiles');


//  Self.pnlAndroidAarToolBar.Visible:=False;//Self.tsWeiXinJar.TabVisible;
//  Self.memAndroidAars.Visible:=False;//Self.tsWeiXinJar.TabVisible;
//  Self.memAndroidArrHint.Visible:=False;//Self.tsWeiXinJar.TabVisible;



  //日志接口
  uOrangeUISmartSDKDeployment.OnDeployConfigLog:=DoRecordDeployConfigLog;


  Self.cmbDelphiVersions.Items.CommaText:=GetInstalledDelphiVersionsCommaText;



  memIOS_SDK_Frameworks.Lines.Assign(GlobalIOSFrameworkList);
  memIOS_SDK_Dylibs.Lines.Assign(GlobalIOSDylibList);





  //初始显示第一页
  Self.pcClient.ActivePage:=Self.tsDeployConfig;




  FProjectConfig:=TProjectConfig.Create;


  //创建数据集
  FAndroidVariableDataset:=TClientDataSet.Create(Application);
  //定义内存表的测试字段
  FAndroidVariableDataset.FieldDefs.Add('Name',TFieldType.ftString,50,False);
  FAndroidVariableDataset.FieldDefs.Add('Value',TFieldType.ftString,255,False);
  FAndroidVariableDataset.FieldDefs.Add('Desc',TFieldType.ftString,255,False);
  //创建内存表
  FAndroidVariableDataset.CreateDataSet;
  Self.dsAndroidVariables.DataSet:=FAndroidVariableDataset;



  //创建数据集
  FDeployConfigListDataSet:=TClientDataSet.Create(Application);
  //定义内存表的测试字段
  FDeployConfigListDataSet.FieldDefs.Add('Platform',TFieldType.ftString,20,False);
  FDeployConfigListDataSet.FieldDefs.Add('LocalDir',TFieldType.ftString,255,False);
  FDeployConfigListDataSet.FieldDefs.Add('RemoteDir',TFieldType.ftString,255,False);
  //创建内存表
  FDeployConfigListDataSet.CreateDataSet;
  Self.dsDeployConfig.DataSet:=FDeployConfigListDataSet;
  for I := 0 to Self.dbgDeployConfig.Columns.Count-1 do
  begin
    AColumn:=Self.dbgDeployConfig.Columns[I];
    if AColumn.FieldName='RemoteDir' then
    begin
      AColumn.PickList.Assign(GlobalDeployConfigRemoteDirList);
    end;
  end;
  Self.cmbDeployConfigRemoteDir.Items.Assign(GlobalDeployConfigRemoteDirList);





  //查看当前的布署文件列表
  FCurrentDeployFileListDataSet:=CreateDeployFileListClientDataSet;
  Self.dsCurrent.DataSet:=Self.FCurrentDeployFileListDataSet;


  //查看预览的布署文件列表
  FPreviewDeployFileListDataSet:=CreateDeployFileListClientDataSet;
  Self.dsPreview.DataSet:=Self.FPreviewDeployFileListDataSet;


  //加载配置,初始表格列宽度
  Self.LoadFromINI(ExtractFilePath(Application.ExeName)+'Config.ini');
//  cmbDelphiVersions

  Self.memIOSPlistRootNodes.Clear;


  btnNewConfigClick(nil);



  if FileExists(ExtractFilePath(Application.ExeName)+'ProjectHistory.txt') then
  begin
    Self.edtProjectFilePath.Items.LoadFromFile(ExtractFilePath(Application.ExeName)+'ProjectHistory.txt');
  end;



  if FileExists(ExtractFilePath(Application.ExeName)+'ConfigHistory.txt') then
  begin
    Self.cmbConfigFilePath.Items.LoadFromFile(ExtractFilePath(Application.ExeName)+'ConfigHistory.txt');
  end;



  lvNeedUseSDKs.Items.Clear;
  lvNeedUseSDKs.Items.Add.Caption:='AlipaySDK';
  lvNeedUseSDKs.Items.Add.Caption:='WeixinSDK';
  lvNeedUseSDKs.Items.Add.Caption:='Compat_V7';
  lvNeedUseSDKs.Items.Add.Caption:='GlideSDK_V4_0_0';
  lvNeedUseSDKs.Items.Add.Caption:='Lifecycle';
  lvNeedUseSDKs.Items.Add.Caption:='SuperPlayer';
  lvNeedUseSDKs.Items.Add.Caption:='Support_V4';
  lvNeedUseSDKs.Items.Add.Caption:='VideoPagerSDK';



  ChangeLanguage(LangKind);




end;

procedure TfrmSmartDeploy.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FProjectConfig);
end;

procedure TfrmSmartDeploy.FormShow(Sender: TObject);
begin
//  if FormatDateTime('YYYY-MM-DD',Now)>'2018-05-01' then
//  begin
//    Self.pcClient.Enabled:=False;
//    ShowMessage('工具已过期，请加QQ群670563729获取最新版本!');
//  end;
end;

procedure TfrmSmartDeploy.LoadConfigFile(AConfigFilePath: String);
var
  I: Integer;
  ADeployConfig:TDeployConfig;
  AConfigVariable:TConfigVariable;
begin
  Self.cmbConfigFilePath.Items.BeginUpdate;
  try

      I:=Self.cmbConfigFilePath.Items.IndexOf(AConfigFilePath);
      if I<>0 then
      begin
          if I<>-1 then
          begin
            //已经存在
            Self.cmbConfigFilePath.Items.Delete(I);
          end;
          Self.cmbConfigFilePath.Items.Insert(0,AConfigFilePath);
          Self.cmbConfigFilePath.Items.SaveToFile(ExtractFilePath(Application.ExeName)+'ConfigHistory.txt');
      end;
  finally
    Self.cmbConfigFilePath.Items.EndUpdate;
  end;


      FCurrentConfigFileName:=AConfigFilePath;

      Self.FProjectConfig.LoadFromINI(AConfigFilePath);


      Self.cmbConfigFilePath.Text:=AConfigFilePath;
      //上次打开的工程
      Self.edtProjectFilePath.Text:=Self.FProjectConfig.FLastProjectFilePath;


      //加载文件配置到表格
      Self.FDeployConfigListDataSet.EmptyDataSet;
      for I := 0 to Self.FProjectConfig.FDeployConfigList.Count-1 do
      begin
        ADeployConfig:=TDeployConfig(Self.FProjectConfig.FDeployConfigList[I]);

        Self.FDeployConfigListDataSet.Append;
        Self.FDeployConfigListDataSet.FieldByName('Platform').AsString:=ADeployConfig.Platform_;
        Self.FDeployConfigListDataSet.FieldByName('LocalDir').AsString:=ADeployConfig.LocalDir;
        Self.FDeployConfigListDataSet.FieldByName('RemoteDir').AsString:=ADeployConfig.RemoteDir;
        Self.FDeployConfigListDataSet.Post;

      end;
      FDeployConfigListDataSet.First;



      //加载添加的Jar
      Self.memAndroidJars.Lines.Assign(Self.FProjectConfig.FAndroidJarList);



      //加载添加的Aar
      Self.memAndroidAars.Lines.Assign(Self.FProjectConfig.FAndroidAarList);


      Self.FAndroidVariableDataset.EmptyDataSet;
      for I := 0 to Self.FProjectConfig.FAndroidVariableList.Count-1 do
      begin
        AConfigVariable:=TConfigVariable(Self.FProjectConfig.FAndroidVariableList[I]);

        Self.FAndroidVariableDataset.Append;
        Self.FAndroidVariableDataset.FieldByName('Name').AsString:=AConfigVariable.Name;
        Self.FAndroidVariableDataset.FieldByName('Value').AsString:=AConfigVariable.Value;
        Self.FAndroidVariableDataset.FieldByName('Desc').AsString:=AConfigVariable.Desc;
        Self.FAndroidVariableDataset.Post;

      end;
      FAndroidVariableDataset.First;


      //加载AndroidManifest.xml中的权限列表
      Self.memAndroidUsersPermissions.Lines.Assign(Self.FProjectConfig.FAndroidUsersPermissions);


      //加载AndroidManifest.xml中的程序子节点
      Self.memAndroidApplicationChildNodes.Lines.Assign(Self.FProjectConfig.FAndroidApplicationChildNodes);

      //加载IOSPlistRootNodes
      Self.memIOSPlistRootNodes.Lines.Assign(Self.FProjectConfig.FIOSPlistRootNodes);


      //IOS链接参数
      Self.edtIOSLinkerOptions.Text:=Self.FProjectConfig.FIOSLinkerOptions;


end;

procedure TfrmSmartDeploy.LoadDeployFileListToDataSet(ADeployFileList: TDeployFileList;
  APlatform: String; AConfiguration:String; AClientDataSet: TClientDataSet);
var
  I: Integer;
  ADeployFilePlatform:TDeployFilePlatform;
begin
  AClientDataSet.EmptyDataSet;
  for I := 0 to ADeployFileList.Count-1 do
  begin

      if
          //只加载当前选择的平台
//          ((APlatform='') or (ADeployFileList[I].Platforms.FindItemByPlatform(APlatform)<>nil))
          ((APlatform='') or (ADeployFileList[I].Platforms.FindItemByPlatform(APlatform)<>nil))
          //只加载当前选择的配置
        and ((AConfiguration='') or (ADeployFileList[I].Configuration=AConfiguration)) then
      begin
          AClientDataSet.Append;
          AClientDataSet.FieldByName('LocalName').AsString:=ADeployFileList[I].LocalName;
          AClientDataSet.FieldByName('Class').AsString:=ADeployFileList[I].Class_;
          AClientDataSet.FieldByName('Configuration').AsString:=ADeployFileList[I].Configuration;


          if APlatform<>'' then
          begin

            ADeployFilePlatform:=ADeployFileList[I].Platforms.FindItemByPlatform(APlatform);
            AClientDataSet.FieldByName('Platforms').AsString:=ADeployFilePlatform.Platform_;

            AClientDataSet.FieldByName('RemoteDir').AsString:=ADeployFilePlatform.RemoteDir;
            AClientDataSet.FieldByName('RemoteName').AsString:=ADeployFilePlatform.RemoteName;
            AClientDataSet.FieldByName('Overwrite').AsString:=ADeployFilePlatform.Overwrite;

          end
          else
          begin
            AClientDataSet.FieldByName('Platforms').AsString:=ADeployFileList[I].PlatformsCommaText;

          end;

          AClientDataSet.Post;
      end;

  end;

  AClientDataSet.First;
end;

procedure TfrmSmartDeploy.SaveDataSetToDeployConfigList(
  ADeployConfigList: TDeployConfigList; AClientDataSet: TClientDataSet);
var
  ADeployConfig:TDeployConfig;
begin
  ADeployConfigList.Clear(True);
  AClientDataSet.First;
  while Not AClientDataSet.Eof do
  begin
  
    ADeployConfig:=TDeployConfig.Create;
    ADeployConfig.Platform_:=AClientDataSet.FieldByName('Platform').AsString;
    ADeployConfig.LocalDir:=AClientDataSet.FieldByName('LocalDir').AsString;
    ADeployConfig.RemoteDir:=AClientDataSet.FieldByName('RemoteDir').AsString;


    Self.FProjectConfig.FDeployConfigList.Add(ADeployConfig);

    AClientDataSet.Next;
  end;
end;


procedure TfrmSmartDeploy.SaveDataSetToVariableList(AVariableList: TConfigVariableList;
  AClientDataSet: TClientDataSet);
var
  AConfigVariable:TConfigVariable;
begin
  AVariableList.Clear(True);
  AClientDataSet.First;
  while Not AClientDataSet.Eof do
  begin

    if Trim(AClientDataSet.FieldByName('Name').AsString)<>'' then
    begin
      AConfigVariable:=TConfigVariable.Create;
      AConfigVariable.Name:=AClientDataSet.FieldByName('Name').AsString;
      AConfigVariable.Value:=AClientDataSet.FieldByName('Value').AsString;
      AConfigVariable.Desc:=AClientDataSet.FieldByName('Desc').AsString;

      Self.FProjectConfig.FAndroidVariableList.Add(AConfigVariable);
    end;

    AClientDataSet.Next;
  end;

end;

function GetDBGridColumnSetting(ADBGrid:TDBGrid):String;
var
  I:Integer;
begin
  Result:='';
  for I := 0 to ADBGrid.Columns.Count-1 do
  begin
    Result:=Result
              +ADBGrid.Columns[I].FieldName+','
              +IntToStr(ADBGrid.Columns[I].Width)+',';
  end;
end;

procedure SetDBGridColumnSetting(ADBGrid:TDBGrid;ASetting:String);
var
  I:Integer;
  AIndex:Integer;
  ASettingList:TStringList;
begin
  ASettingList:=TStringList.Create;
  ASettingList.CommaText:=ASetting;
  try
    for I := 0 to ADBGrid.Columns.Count-1 do
    begin
      if ADBGrid.Columns[I].FieldName<>'' then
      begin
        AIndex:=ASettingList.IndexOf(ADBGrid.Columns[I].FieldName);
        if AIndex<>-1 then
        begin
          ADBGrid.Columns[I].Width:=StrToInt(ASettingList[AIndex+1]);
        end
        else
        begin
          //默认值
          ADBGrid.Columns[I].Width:=200;
        end;
      end;
    end;
  finally
    ASettingList.Free;
  end;
end;

procedure TfrmSmartDeploy.LoadFromINI(AINIFilePath: String);
var
  AIniFile:TIniFile;
begin
  AIniFile:=TIniFile.Create(AINIFilePath);

  cmbDelphiVersions.Text:=AIniFile.ReadString('','JDKDelphiVersion',Self.cmbDelphiVersions.Text);

  Self.edtJDKDir.Text:=AIniFile.ReadString('','JDKDir',Self.edtJDKDir.Text);
  Self.edtAndroidSDKDir.Text:=AIniFile.ReadString('','AndroidSDKDir',Self.edtAndroidSDKDir.Text);
  Self.edtAndroidSDKPlatform.Text:=AIniFile.ReadString('','AndroidSDKPlatform',Self.edtAndroidSDKPlatform.Text);
  Self.edtAndroidSDKBuildTools.Text:=AIniFile.ReadString('','AndroidSDKBuildTools',Self.edtAndroidSDKBuildTools.Text);

  //保存表格列的设置
  SetDBGridColumnSetting(dbgCurrent,AIniFile.ReadString('','dbgCurrent_ColumnSetting',''));
  SetDBGridColumnSetting(dbgDeployConfig,AIniFile.ReadString('','dbgDeployConfig_ColumnSetting',''));
  SetDBGridColumnSetting(dbgPreview,AIniFile.ReadString('','dbgPreview_ColumnSetting',''));
  SetDBGridColumnSetting(dbgAndroidVariables,AIniFile.ReadString('','dbgAndroidVariables_ColumnSetting',''));


  FreeAndNil(AIniFile);
end;

procedure TfrmSmartDeploy.RadioButton1Click(Sender: TObject);
begin
  ChangeLanguage(TLangKind.lkZH);
end;

procedure TfrmSmartDeploy.RadioButton2Click(Sender: TObject);
begin
  ChangeLanguage(TLangKind.lkEN);
end;

procedure TfrmSmartDeploy.SaveToINI(AINIFilePath: String);
var
  AIniFile:TIniFile;
  I: Integer;
begin
  AIniFile:=TIniFile.Create(AINIFilePath);

  AIniFile.WriteString('','JDKDelphiVersion',Self.cmbDelphiVersions.Text);
  AIniFile.WriteString('','JDKDir',Self.edtJDKDir.Text);
  AIniFile.WriteString('','AndroidSDKDir',Self.edtAndroidSDKDir.Text);
  AIniFile.WriteString('','AndroidSDKPlatform',Self.edtAndroidSDKPlatform.Text);
  AIniFile.WriteString('','AndroidSDKBuildTools',Self.edtAndroidSDKBuildTools.Text);


  //保存表格列的设置
  AIniFile.WriteString('','dbgCurrent_ColumnSetting',GetDBGridColumnSetting(Self.dbgCurrent));
  AIniFile.WriteString('','dbgDeployConfig_ColumnSetting',GetDBGridColumnSetting(Self.dbgDeployConfig));
  AIniFile.WriteString('','dbgPreview_ColumnSetting',GetDBGridColumnSetting(Self.dbgPreview));
  AIniFile.WriteString('','dbgAndroidVariables_ColumnSetting',GetDBGridColumnSetting(Self.dbgAndroidVariables));



  FreeAndNil(AIniFile);
end;

procedure TfrmSmartDeploy.SyncEnabledSDKS;
var
  I: Integer;
  ASuperObject:ISuperObject;
  AListItem:TListItem;
begin
    //判断
    for I := 0 to Self.lvNeedUseSDKs.Items.Count-1 do
    begin
      Self.lvNeedUseSDKs.Items[I].Checked:=False;
    end;


    if FileExists(ChangeFileExt(Self.edtProjectFilePath.Text,Const_OrangeSDKConfig_FileExt)) then
    begin
      ASuperObject:=TSuperObject.ParseFile(ChangeFileExt(Self.edtProjectFilePath.Text,Const_OrangeSDKConfig_FileExt));

      for I := 0 to ASuperObject.A['enabled_sdks'].Length-1 do
      begin
        AListItem:=FindListViewItem(lvNeedUseSDKs,ASuperObject.A['enabled_sdks'].S[I]);
        if AListItem=nil then
        begin
          AListItem:=lvNeedUseSDKs.Items.Add;
          AListItem.Caption:=ASuperObject.A['enabled_sdks'].S[I];
        end;
        AListItem.Checked:=True;
      end;

    end;


end;

end.
