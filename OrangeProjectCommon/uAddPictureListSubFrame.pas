//convert pas to utf8 by ¥
unit uAddPictureListSubFrame;

interface

{$I FrameWork.inc}
{$I OpenPlatformClient.inc}


{$IFDEF VCL}
  //使用原生的选择媒体窗体
  {$DEFINE USE_NATIVE_SELECTMEDIA}
  //有页面框架
  {$DEFINE HAS_PAGEFRAMEWORK}
{$ENDIF}


uses
  SysUtils, Types,

  {$IFDEF FMX}
  UITypes,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  HintFrame,
  {$ENDIF}
  {$IFDEF VCL}
  Windows,
  Graphics,
  Forms,
  Dialogs,
  Controls,
  HintFrame_VCL,
  {$ENDIF}
  Classes, Variants,

  uBaseList,
  uSkinItems,
//  uAppCommon,
  uFuncCommon,
  uFileCommon,
  uGraphicCommon,
  IOUtils,
  uTimerTask,

  {$IFDEF HAS_PAGEFRAMEWORK}
  uPageStructure,
  {$ENDIF}


  uSelectMediaDialog,
  uSkinPicture,
  uOpenClientCommon,
  uUIFunction,
  uFrameContext,


  {$IFDEF FMX}
    uPhotoManager,
    ClipHeadFrame,
    //使用原生的选择媒体窗体
    {$IFDEF USE_NATIVE_SELECTMEDIA}
      uCommonSelectMediaUI,
      {$IFDEF ANDROID}
      uAndroidDVSelectMedia,
      uAndroidDmcBigSelectMedia,
      {$ENDIF}
      {$IFDEF IOS}
      uIOSHXPhotoPickerSelectMediaUI,
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}




  {$IF CompilerVersion <= 21.0} // XE or older
  SuperObject,
  superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}



  IdURI,
  uLang,
  uComponentType,
  uDrawPicture,
  uBasePageStructure,
  uBaseHttpControl,
  uViewPictureListFrame,

  {$IFDEF FMX}
  AddPictureListSubFrame,
  ViewPictureListFrame,
  TakePictureMenuFrame,
  AllImageFrame,
  uSkinFireMonkeyItemDesignerPanel,
  {$ENDIF}

  {$IFDEF VCL}
  ShellAPI,
  ClipHeadFrame_VCL,
  AddPictureListSubFrame_VCL,
  uSelectMediaUI_OpenDialog,

    {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
    {$IF CompilerVersion > 21.0}
    PasListVlcMediaPlayerFrame,
    {$IFEND}
    {$ENDIF}

  {$ENDIF}

  uSkinButtonType, uSkinImageType,
  uSkinItemDesignerPanelType,
  uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType,
  uSkinPanelType, uDrawCanvas,
  uSkinLabelType;

type
  //自定义上传文件事件
  TCustomUploadFileEvent=procedure(AImageHttpServerUrl:String;
                                  APicStream:TStream;
                                  AFileName:String;
                                  var ARemoteFilePath:String;
                                  var AServerResponse:String;
                                  var APicUploadSucc:Boolean
                                  ) of object;

  //自定义上传视频文件事件
  TCustomUploadVideoFileEvent=procedure(//视频文件路径
                                        AVideoFilePath:String;
                                        //播放链接
                                        var AVideoUrl:String;
                                        var AVideoFileId:String;
                                        //服务端返回
                                        var AServerResponse:String;
                                        //视频上传是否成功
                                        var AVideoUploadSucc:Boolean
                                        ) of object;


  TFrameAddPictureListSub = class(TFrameBaseAddPictureListSub,IControlForPageFramework)
//    pnlPicture: TSkinFMXPanel;
//    lvPictures: TSkinFMXListView;
//    pnlDeletePic: TSkinFMXItemDesignerPanel;
//    ImgPic: TSkinFMXImage;
//    pnlToolBar: TSkinFMXPanel;
//    btnOK: TSkinFMXButton;
//    btnReturn: TSkinFMXButton;
//    btnDelPic: TSkinFMXButton;
//    imgVideoCover: TSkinFMXImage;
//    lblVideoInfo: TSkinFMXLabel;
    procedure lvPicturesClickItem(AItem: TSkinItem);override;
    procedure btnDelPicClick(Sender: TObject);override;
    procedure btnOKClick(Sender: TObject);override;
    procedure btnReturnClick(Sender: TObject);override;
    {$IFDEF FMX}
    procedure lvPicturesPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinFMXItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);override;
    {$ENDIF}
    {$IFDEF VCL}
    procedure lvPicturesPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);override;
    {$ENDIF}
//    procedure FrameResized(Sender: TObject);override;
  private
    FEditPictureItem:TSkinItem;
    procedure DoAddPictureFromMenu(Sender: TObject;ABitmap:TBitmap);
    procedure DoEditPictureFromMenu(Sender: TObject;ABitmap:TBitmap);

    procedure DoReturnFrameFromClipAddHeadFrame(Frame:TFrame);
    procedure DoReturnFrameFromClipEditHeadFrame(Frame:TFrame);

    procedure DoReturnFrameFromAllImageFrame(AFrame:TFrame);
  private
    //原生多选照片界面
    {$IFDEF USE_NATIVE_SELECTMEDIA}
    FSelectMediaDialog:TSelectMediaDialog;
    FSelectCameraDialog:TSelectMediaDialog;
    {$ENDIF}

    function AddItem:TSkinListViewItem;
    //选择媒体返回事件
    procedure DoSelectMediaResultEvent(Sender:TObject;
                                        ASelectedFileThumbPaths:TStringList;
                                        ASelectedFilePaths:TStringList;
                                        //选择的媒体列表
                                        ASelectMediaList:TSelectMediaList);
  private
    FNeedUploadCount:Integer;
    FIsReadOnly: Boolean;
    FOnCustomUploadFile: TCustomUploadFileEvent;
    procedure SetIsReadOnly(const Value: Boolean);

    function DoUploadFile(AImageHttpServerUrl:String;
                          APicStream:TStream;
                          AFileName:String;
                          var ARemoteFilePath:String;
                          var AServerResponse:String):Boolean;

    procedure DoFormClose(Sender: TObject; var Action: TCloseAction);
    { Private declarations }
  protected
    {$IFDEF HAS_PAGEFRAMEWORK}
    FFieldControlSettingMap:TFieldControlSettingMap;
    {$ELSE}
    FFieldControlSettingMap:TObject;
    {$ENDIF}

    //针对页面框架的控件接口IControlForPageFramework
    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
    //获取与设置自定义属性
    function GetPropJsonStr:String;
    procedure SetPropJsonStr(AJsonStr:String);
    //获取提交的值,是不是存在多个值
    function GetPostValue(ASetting:TFieldControlSetting;
                            APageDataDir:String;
                            ASetRecordFieldValueIntf:ISetRecordFieldValue;
                            var AErrorMessage:String):Variant;
    //设置值
    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;
                            AImageServerUrl:String;
                            AValue:Variant;AValueCaption:String;
                            //要设置多个值,整个字段的记录
                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue
                            );
//    //设置属性
//    function GetProp(APropName:String):Variant;
//    procedure SetProp(APropName:String;APropValue:Variant);
    procedure DoReturnFrame(AFromFrame:TFrame);virtual;
  public
    //本地文件名和图片数据流
    FLocalFileNameAndStreamList:TStringList;
    //本地文件路径
    FLocalFilePathList:TStringList;
    FLocalVideoFilePathList:TStringList;
    //上传成功之后的远程文件名
    FServerFileNameList:TStringList;
    FServerVideoUrlList:TStringList;
    FServerVideoFileIdList:TStringList;

    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public

    //是否需要剪裁
    FIsNeedClip:Boolean;
    FClipWidth:Integer;
    FClipHeight:Integer;
    //允许添加的最大图片数
    FMaxCount:Integer;
    //允许添加的最大视频数
    FMaxVideoCount:Integer;
    //选择视频的最大时长,秒
    FMaxVideoDuration:Integer;


    //内容更改之后,内容高度会变化,要通知
    OnChange:TNotifyEvent;
    //是否允许多选图片,其实也就是FMaxCount=1
    //IsUseMultiSelectPicture:Boolean;
    //是否不能修改图片????????????????
    IsCanNotEditPicture:Boolean;
    //自定义上传视频文件
    OnCustomUploadVideoFile: TCustomUploadVideoFileEvent;

    //自定义的选择事件
    FOnSelectCustomMedia:TNotifyEvent;
    //图片选择后通知
    OnSelectMediaResult:TNotifyEvent;

//    //添加的图片列表是否为空
//    NowHaveImage:Boolean;

    FSelectMediaType:TSelectMediaType;

    FIsNeedUpload:Boolean;


    //是否已经选择视频
    function HasVideo:Boolean;
    //获取当前已经选择了的图片个数
    function GetImageCount:Integer;
    //获取当前已经选择了的视频个数
    function GetVideoCount:Integer;
    function GetAddedCount:Integer;

    procedure AlignControls;

    procedure Clear;
    //初始
    procedure Init( ACaption:String;
                    //图片值数组
                    //比如:'Upload\1003\repair_car_order_pic\2018\2018-09-27\64C8C8720E42401098D01A297FC68EEE.jpg'
                    APictureValues:Array of String;
                    //图片Url数组,用于显示
                    //比如:'http://www.orangeui.cn:10011/Upload/1003/repair_car_order_pic/2018/2018-09-27/64C8C8720E42401098D01A297FC68EEE.jpg'
                    APictureUrls:Array of String;
                    //是否需要剪裁
                    AIsNeedClip:Boolean;
                    //剪裁的比例
                    AClipWidth:Integer;
                    AClipHeight:Integer;
                    //允许几张
                    AMaxCount:Integer;
                    AIsReadOnly:Boolean{$IF CompilerVersion >= 30.0}=False{$IFEND};
                    AVideoUrls:TStringDynArray{$IF CompilerVersion >= 30.0}=[]{$IFEND};
                    //需要上传的类型
                    ASelectMediaType:TSelectMediaType=[smtImage]);overload;
    //初始
    procedure Init( ACaption:String;
                    //图片值数组
                    APictureValueList:TStringList;
                    //图片Url数组
                    APictureUrlList:TStringList;
                    //是否需要剪裁
                    AIsNeedClip:Boolean;
                    //剪裁的比例
                    AClipWidth:Integer;
                    AClipHeight:Integer;
                    //允许几张
                    AMaxCount:Integer;
                    AIsReadOnly:Boolean=False;
                    AVideoUrlList:TStringList=nil;
                    //需要上传的类型
                    ASelectMediaType:TSelectMediaType=[smtImage]);overload;


    function AddPicture(APicFilePath:String):Boolean;


    //开始选择图片
    procedure StartSelect(ASelectMediaType:TSelectMediaType);
    //开始拍摄
    procedure StartCamera(ASelectMediaType:TSelectMediaType);

    procedure DoCustomPickPhoto(ASelectMediaType:TSelectMediaType);
    procedure DoCustomPickPhotoEvent(Sender:TObject);

  public
    FTempDir:String;
    //保存到本地
    function SaveToLocalTemp(
                              //图片保存的质量
                              AQuality:Integer=90;
                              //图片文件的后缀名
                              AFileExt:String='.jpg'):Boolean;
    //上传到服务器
    //例如:ImageHttpServerUrl+'/upload'
    //                 +'?appid='+IntToStr(AppID)
    //                 +'&filename='+'%s'//用于替换文件名
    //                 +'&filedir='+'repair_car_order_pic'
    //                 +'&fileext='+'.jpg',
    function Upload(
                    //上传的Rest接口
                    AImageHttpServerUrl:String;
                    var AServerResponse:String):Boolean;


    //获取上传后的值
    function GetServerFileNameArray(AMaxCount:Integer):TStringDynArray;
    function GetServerVideoUrlArray(AMaxCount:Integer):TStringDynArray;
    function GetServerVideoFileIdArray(AMaxCount:Integer):TStringDynArray;
    function GetServerFileName(AIndex:Integer):String;
    function GetServerVideoUrl(AIndex:Integer):String;
    function GetServerVideoFileId(AIndex:Integer):String;
    function GetLocalFileName(AIndex:Integer):String;

    //是否只读
    property IsReadOnly:Boolean read FIsReadOnly write SetIsReadOnly;
    { Public declarations }
  published
    //自定义上传文件的事件
    property OnCustomUploadFile:TCustomUploadFileEvent read FOnCustomUploadFile write FOnCustomUploadFile;
  end;




var
  GlobalAddPictureListSubFrame:TFrameAddPictureListSub;


//上传到服务器
//例如:ImageHttpServerUrl+'/upload'
//                 +'?appid='+IntToStr(AppID)
//                 +'&filename='+'%s'//用于替换文件名
//                 +'&filedir='+'repair_car_order_pic'
//                 +'&fileext='+'.png',
function GetImageUploadTemplateUrl(ASetting:TFieldControlSetting):String;


implementation

//uses
//  AddContentFrame;
//
//{$R *.fmx}



function GetImageUploadTemplateUrl(ASetting:TFieldControlSetting): String;
var
  AImageHttpServerUrl:String;
begin
    //上传到服务器
    //例如:ImageHttpServerUrl+'/upload'
    //                 +'?appid='+IntToStr(AppID)
    //                 +'&filename='+'%s'//用于替换文件名
    //                 +'&filedir='+'repair_car_order_pic'
    //                 +'&fileext='+'.png',
    //上传宠物头像
//    if not Self.FPetHeadPicFrame.Upload(
//        ImageHttpServerUrl+'/upload'
//                         +'?appid='+IntToStr(AppID)
//                         +'&filename='+'%s'
//                         +'&filedir='+'userhead_pic'
//                         +'&fileext='+'.png',
//        AServerResponse) then
//    begin
//      TTimerTask(ATimerTask).TaskDesc:=AServerResponse;
//      Exit;
//    end;
  Result:='';

  //图片上传到什么目录
  //图片类型,比如user_head,goods_pic,上传目录
  if (ASetting.image_kind='') then
  begin
//    {$IFDEF FMX}
    ShowMessage('ASetting.image_kind不能为空,不然不知道上传到哪个目录');
//    {$ENDIF}
    Exit;
  end;


  {$IFDEF HAS_PAGEFRAMEWORK}
  if TPageFieldControlSettingList(ASetting.Collection).FOwner.FIsUseDefaultImageHttpServerUrl then
  begin
    AImageHttpServerUrl:=ImageHttpServerUrl;
  end
  else
  begin
    AImageHttpServerUrl:=TPageFieldControlSettingList(ASetting.Collection).FOwner.FImageHttpServerUrl;
  end;
  {$ELSE}
    AImageHttpServerUrl:=ImageHttpServerUrl;
  {$ENDIF}


  if (ASetting.image_kind<>'') and (AImageHttpServerUrl<>'') and (AppID<>'') then
  begin
    Result:=AImageHttpServerUrl+'/upload'
                           +'?appid='+(AppID)
                           +'&filename='+'%s'
                           +'&filedir='+ASetting.image_kind

  //                         +'&filedir='+'userhead_pic'
                           +'&fileext='+'.png';
  end;

end;



{ TFrameAddPictureListSub }

function TFrameAddPictureListSub.AddPicture(APicFilePath: String): Boolean;
var
  AListViewItem:TSkinListViewItem;
begin
  //添加一张图片
  AListViewItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
  //要放在Icon.Assign前面
  AListViewItem.Icon.Url:='';
  AListViewItem.Icon.LoadFromFile(APicFilePath);

  AlignControls;
end;

procedure TFrameAddPictureListSub.AlignControls;
begin
  //判断是否需要隐藏添加按钮

  if Self.lvPictures.Prop.Items.FindItemByName('addimage')<>nil then
  begin

      Self.lvPictures.Prop.Items.FindItemByType(sitItem1).Visible:=False;


      Self.lvPictures.Prop.Items.FindItemByName('addimage').Visible:=
      //    not Self.FIsReadOnly
      //    and
          (smtImage in Self.FSelectMediaType) and (Self.GetImageCount<FMaxCount)
          and (  (GetVideoCount=0)//没有选择过视频,那么可以选择图片,因为视频和图片只能二选一
              or (GetImageCount+GetVideoCount=0)//没有选择过任何东西
              );

      Self.lvPictures.Prop.Items.FindItemByName('addvideo').Visible:=
      //    not Self.FIsReadOnly
      //    and
          (smtVideo in Self.FSelectMediaType) and (Self.GetVideoCount<FMaxVideoCount)
          and ( (GetImageCount=0)//没有选择过图片,因为视频和图片只能二选一
              or (GetImageCount+GetVideoCount=0)//没有选择过任何东西

                 );


  end
  else
  begin
      Self.lvPictures.Prop.Items.FindItemByType(sitItem1).Visible:=//False;
    //    not Self.FIsReadOnly
    //    and
        (Self.lvPictures.Prop.Items.Count<=FMaxCount);
  end;




  if Not Self.pnlToolBar.Visible then
  begin

    if (FFieldControlSettingMap=nil) then
    begin
      //如果它在界面框架的InputPanel里面,它的Align设置为Client，
      //那么再设置它的Height也会无效
      Self.Height:=ControlSize(Self.lvPictures.Prop.GetContentHeight);

    end
    else
    begin
      {$IFDEF HAS_PAGEFRAMEWORK}
      FFieldControlSettingMap.FHeight:=(Self.lvPictures.Prop.GetContentHeight
                                                  //底部要空出来一点,不然会被挡住一点
                                                  +10);
      {$ENDIF}
    end;
  end;


  {$IFDEF HAS_PAGEFRAMEWORK}
  if (FFieldControlSettingMap<>nil) then
  begin
    FFieldControlSettingMap.FIsUseSelfHeight:=True;
//    TFieldControlSettingMapList(FFieldControlSettingMap.FSkinListIntf.GetObject).PageInstance.MainControlMapList.AlignControls();
    FFieldControlSettingMap.FOwner.PageInstance.MainControlMapList.AlignControls();
  end;
  {$ENDIF}

  if Assigned(OnChange) then
  begin
    OnChange(Self);
  end;

end;

procedure TFrameAddPictureListSub.btnDelPicClick(Sender: TObject);
begin
  if Self.FIsReadOnly then Exit;
  

  //删除图片
  Self.lvPictures.Prop.Items.Remove(Self.lvPictures.Prop.InteractiveItem);

  AlignControls;

//  //判断是否添加了图片
//  if Self.lvPictures.Prop.Items.Count > 1 then
//  begin
//    Self.NowHaveImage:=True;
//  end
//  else
//  begin
//    Self.NowHaveImage:=False;
//  end;
//
//  if not NowHaveImage then
//  begin
//    GlobalAddContentFrame.FAddPhotoFrame.Visible:=False;
//    GlobalAddContentFrame.imgUpLoad.Enabled:=True;
//    GlobalAddContentFrame.imgVideoUpLoad.Enabled:=True;
//  end;

//  Self.imgVideoUpLoad.Enabled:=FAddPhotoFrame.HasVideo;
//  Self.imgUpLoad.Enabled:=not FAddPhotoFrame.HasVideo;


end;

procedure TFrameAddPictureListSub.btnOKClick(Sender: TObject);
var
  AServerResponseDesc:String;
begin

  Self.SaveToLocalTemp(100,'.jpg');

  //上传,测试
  Upload('http://www.orangeui.cn:10001/upload'
              +'?appid=1002'
              +'&filename='+'%s'
              +'&filedir='+'Shop_Pic'
              +'&fileext='+'.jpg',
              AServerResponseDesc);


  {$IFDEF FMX}
  HideFrame;//(CurrentFrame,hfcttBeforeReturnFrame);
  ReturnFrame;//(CurrentFrame);
  {$ENDIF}
end;

procedure TFrameAddPictureListSub.btnReturnClick(Sender: TObject);
begin
  {$IFDEF FMX}
  //返回
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//(CurrentFrame,hfcttBeforeReturnFrame);
  ReturnFrame;//(CurrentFrame);
  {$ENDIF}
end;

procedure TFrameAddPictureListSub.Clear;
begin
  Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);
end;

constructor TFrameAddPictureListSub.Create(AOwner: TComponent);
begin
  inherited;

  FTempDir:=GetApplicationPath;

  //允许添加的最大视频数
  FMaxVideoCount:=1;
  //选择视频的最大时长,15分钟
  FMaxVideoDuration:=15*60;


  FLocalFilePathList:=TStringList.Create;
  FLocalVideoFilePathList:=TStringList.Create;
  FLocalFileNameAndStreamList:=TStringList.Create;
  FServerFileNameList:=TStringList.Create;
  FServerVideoUrlList:=TStringList.Create;
  FServerVideoFileIdList:=TStringList.Create;

  FIsNeedUpload:=True;


  Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);

//  Init('商品图片',[],[],False,400,300,6);
  {$IFDEF VCL}
//  IsUseMultiSelectPicture:=True;
  {$ENDIF}


  {$IFDEF FMX}
//  IsUseMultiSelectPicture:=False;
  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
  {$ENDIF}
end;

destructor TFrameAddPictureListSub.Destroy;
begin

  FreeAndNil(FLocalFilePathList);
  FreeAndNil(FLocalVideoFilePathList);
  //清空一下里面的Stream,万一没有释放
  FreeStringListObjects(FLocalFileNameAndStreamList);

  FreeAndNil(FLocalFileNameAndStreamList);
  FreeAndNil(FServerFileNameList);
  FreeAndNil(FServerVideoUrlList);
  FreeAndNil(FServerVideoFileIdList);


  {$IFDEF USE_NATIVE_SELECTMEDIA}
  FreeAndNil(FSelectMediaDialog);
  FreeAndNil(FSelectCameraDialog);
  {$ENDIF}
  inherited;
end;

procedure TFrameAddPictureListSub.DoAddPictureFromMenu(Sender: TObject;
  ABitmap: TBitmap);
var
  AFileName:String;
  AListViewItem:TSkinListViewItem;
begin
  {$IFDEF FMX}
  if not Self.FIsNeedClip then
  begin
    //添加一张图片
    AListViewItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
    //要放在Icon.Assign前面
    AListViewItem.Icon.Url:='';
    AListViewItem.Icon.Assign(ABitmap);
    //避免花掉
    CopyBitmap(ABitmap,AListViewItem.Icon);


    //图片或者视频路径
    AFileName:=FTempDir+CreateGUIDString+'.png';
    ABitmap.SaveToFile(AFileName);
    AListViewItem.Icon.Name:=AFileName;



    AlignControls;
  end
  else
  begin


    //上传商品轮播图片裁剪
    HideFrame;//(CurrentFrame,hfcttBeforeShowframe);
    ShowFrame(TFrame(GlobalClipHeadFrame),TFrameClipHead,Application.MainForm,nil,nil,DoReturnFrameFromClipAddHeadFrame,Application);
    GlobalClipHeadFrame.Init(ABitmap,Self.FClipWidth,FClipHeight);
  end;
  {$ENDIF}
end;

procedure TFrameAddPictureListSub.DoCustomPickPhoto(ASelectMediaType:TSelectMediaType);
begin
  {$IFDEF USE_NATIVE_SELECTMEDIA}
    //使用原生选择页面
    {$IFDEF ANDROID}
    GlobalSelectMediaUIClass:=TAndroidDmcBigSelectMediaUI;

    //多选就没有拍照功能了
    //GlobalSelectMediaUIClass:=TAndroidDVSelectMediaUI;
    {$ENDIF}


    //移动平台
    if FSelectMediaDialog=nil then
    begin
      FSelectMediaDialog:=TSelectMediaDialog.Create(Self);
      FSelectMediaDialog.OnSelectMediaResult:=DoSelectMediaResultEvent;
    end;

    //判断需要上传的类型
    FSelectMediaDialog.SelectMediaType:=ASelectMediaType;

    //能选择的个数
    FSelectMediaDialog.MaxSelectCount:=FMaxCount;

    FSelectMediaDialog.StartSelect;
  {$ENDIF}
end;

procedure TFrameAddPictureListSub.DoCustomPickPhotoEvent(Sender: TObject);
begin
  DoCustomPickPhoto([smtImage]);
end;

procedure TFrameAddPictureListSub.DoEditPictureFromMenu(Sender: TObject;
  ABitmap: TBitmap);
var
  AFileName:String;
begin
  {$IFDEF FMX}
  //同样广告图片的修改不裁剪
  if not Self.FIsNeedClip then
  begin
      //要放在Icon.Assign前面
      FEditPictureItem.Icon.Url:='';
      FEditPictureItem.Icon.Assign(ABitmap);
      //避免花掉
      CopyBitmap(ABitmap,FEditPictureItem.Icon);


      //图片或者视频路径
      AFileName:=FTempDir+CreateGUIDString+'.png';
      ABitmap.SaveToFile(AFileName);
      FEditPictureItem.Icon.Name:=AFileName;


  end
  else
  begin
      HideFrame;//(CurrentFrame,hfcttBeforeShowframe);
      ShowFrame(TFrame(GlobalClipHeadFrame),TFrameClipHead,Application.MainForm,nil,nil,DoReturnFrameFromClipEditHeadFrame,Application);
      GlobalClipHeadFrame.Init(ABitmap,FClipWidth,FClipHeight);
  end;

  {$ENDIF}
end;

procedure TFrameAddPictureListSub.DoReturnFrameFromClipEditHeadFrame(Frame: TFrame);
var
  ABitmap:TBitmap;
  AFileName:String;
begin
  {$IFDEF FMX}
  ABitmap:=GlobalClipHeadFrame.GetClipBitmap;
  //要放在Icon.Assign前面
  FEditPictureItem.Icon.Url:='';
  FEditPictureItem.Icon.Assign(ABitmap);
  //避免花掉
  CopyBitmap(ABitmap,FEditPictureItem.Icon);


  //图片或者视频路径
  AFileName:=FTempDir+CreateGUIDString+'.png';
  ABitmap.SaveToFile(AFileName);
  FEditPictureItem.Icon.Name:=AFileName;



  FreeAndNil(ABitmap);
  {$ENDIF}
end;

function TFrameAddPictureListSub.AddItem:TSkinListViewItem;
var
  I: Integer;
  AIndex:Integer;
begin
  AIndex:=0;
  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
  begin
    if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
    begin
      Inc(AIndex);
    end
    else
    begin
      Break;
    end;
  end;
  Result:=Self.lvPictures.Prop.Items.Insert(AIndex);
end;


procedure TFrameAddPictureListSub.DoSelectMediaResultEvent(Sender: TObject;
  ASelectedFileThumbPaths:TStringList;
  ASelectedFilePaths: TStringList;
  //选择的媒体列表
  ASelectMediaList:TSelectMediaList);
var
  I: Integer;
//  AScaleFactor: Single;
var
  AListViewItem:TSkinListViewItem;
  ABitmap:TSkinPicture;
  AVideoCount:Integer;
  AImageCount:Integer;
begin
  AVideoCount:=0;
  AImageCount:=0;
  //判断原来有多少图片和视频
  for I := 0 to ASelectMediaList.Count-1 do
  begin
      if ASelectMediaList[I].IsVideo then
      begin
        Inc(AVideoCount);
      end
      else
      begin
        Inc(AImageCount);
      end;
  end;

  if (AVideoCount>0) and ((AVideoCount+Self.GetVideoCount)>Self.FMaxVideoCount) then
  begin
      ShowMessage('您最多只能选择'+IntToStr(FMaxVideoCount)+'个视频');
      Exit;
  end;

  if (AImageCount>0) and ((AImageCount+Self.GetImageCount)>Self.FMaxCount) then
  begin
      ShowMessage('您最多只能选择'+IntToStr(FMaxVideoCount)+'张图片');
      Exit;
  end;

  if ((AVideoCount+Self.GetVideoCount)>0) and ((AImageCount+Self.GetImageCount)>0) then
  begin
      ShowMessage('不支持同时添加图片和视频！');
      Exit;
  end;




//  //存在视频,则要清除原Items
//  for I := 0 to ASelectMediaList.Count-1 do
//  begin
//      if ASelectMediaList[I].IsVideo then
//      begin
//          //视频
//          //标记现在是视频上传
//          //FNowClick:='video';
//          //初始化
//          Self.Init(
//                    '',
//                    [],//
//                    [],//
//                    False,//不裁剪
//                    0,
//                    0,
//                    1,//最多1个视频
//                    False,
//                    nil,
//                    [smtVideo]
//                    );
//          Break;
//      end;
//
//  end;


  {$IFDEF VCL}
  if Self.FIsNeedClip then
  begin
    ABitmap:=TSkinPicture.Create;
    try
      ABitmap.LoadFromFile(ASelectMediaList[0].FilePath);
      //上传商品轮播图片裁剪
      HideFrame;//(CurrentFrame,hfcttBeforeShowframe);
      ShowFrame(TFrame(GlobalClipHeadFrame),TFrameClipHead,Application.MainForm,nil,nil,DoReturnFrameFromClipAddHeadFrame,Application);
      GlobalClipHeadFrame.pnlToolBar.Align:=alBottom;
      GlobalClipHeadFrame.pnlToolBar.Caption:='';
      GlobalClipHeadFrame.btnReturn.Visible:=False;
      GlobalFrameFormMapList.FindByFrame(GlobalClipHeadFrame).FForm.Caption:='图片裁剪';
      GlobalFrameFormMapList.FindByFrame(GlobalClipHeadFrame).FForm.ClientWidth:=300;
      GlobalFrameFormMapList.FindByFrame(GlobalClipHeadFrame).FForm.ClientHeight:=300+GlobalClipHeadFrame.pnlToolBar.Height;
      GlobalFrameFormMapList.FindByFrame(GlobalClipHeadFrame).FForm.Position:=poScreenCenter;
      GlobalClipHeadFrame.Init(ABitmap,Self.FClipWidth,FClipHeight);
    finally
      FreeAndNil(ABitmap);
    end;
    Exit;
  end;
  {$ENDIF}


  for I := 0 to ASelectMediaList.Count-1 do
  begin



      //判断是否是图片还是视频
      //      if SameText(ExtractFileExt(ASelectMediaList[I].FilePath),'.mp4') then
      if ASelectMediaList[I].IsVideo then
      begin
          //视频
          //AListViewItem.ItemType:=sitItem2;


          if (ASelectMediaList[I].TimeLong>0)
            and (Self.FMaxVideoDuration>0)
            and (ASelectMediaList[I].TimeLong>Self.FMaxVideoDuration) then
          begin
            ShowHintFrame(nil,'上传视频时长不能超过'+time2str2(FMaxVideoDuration*1000,'小时','分钟','秒')+','+'您选择的视频时长为'+time2str2(ASelectMediaList[I].TimeLong*1000,'小时','分钟','秒'));
            Exit;
          end;

          {$IFDEF FMX}
          //视频文件的尺寸不能大于50M
          if GetSizeOfFile(ASelectMediaList[I].FilePath)>50*1024*1024 then
          begin
            ShowHintFrame(nil,'上传视频不能大于50M');
            Exit;
          end;
          {$ENDIF}


      end;




      //添加一张图片
      AListViewItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);


      //要放在Icon.Assign前面
      AListViewItem.Icon.Url:='';
      //缩略图地址
      AListViewItem.Icon.Caption:=ASelectMediaList[I].ThumbPath;
      //原图地址
      AListViewItem.Icon.Name:=ASelectMediaList[I].FilePath;

      if ASelectMediaList[I].IsVideo then
      begin
        if (ASelectMediaList[I].TimeLong>0) then
        begin
          AListViewItem.Detail:=time2str2(ASelectMediaList[I].TimeLong*1000,'小时','分钟','秒');
        end
        else
        begin
          //文件大小
          AListViewItem.Detail:=GetFileSizeStr2(GetSizeOfFile(ASelectMediaList[I].FilePath));
        end;
      end;




      //缩略图
      if ASelectMediaList[I].ThumbPath<>'' then
      begin
          ABitmap:=TSkinPicture.Create;
          try

              ABitmap.LoadFromFile(ASelectMediaList[I].ThumbPath);


              //照片返回
              //尺寸如果超过1024,那么需要按比例缩小
    //          if ABitmap.Width > 1024 then
    //          begin
    //            AScaleFactor := ABitmap.Width / 1024;
    //            ABitmap.Resize(Round(ABitmap.Width / AScaleFactor), Round(ABitmap.Height / AScaleFactor));
    //          end;

              AListViewItem.Icon.Assign(ABitmap);
              {$IFDEF FMX}
              //避免花掉
              CopyBitmap(ABitmap,AListViewItem.Icon);
              {$ENDIF}

          finally
            FreeAndNil(ABitmap);
          end;
      end;

//      if Self.lvPictures.Prop.Items.Count-1>=Self.FMaxCount then
      if GetAddedCount>=Self.FMaxCount then
      begin
        Break;
      end;


  end;




  AlignControls;

  if Assigned(OnSelectMediaResult) then
  begin
    OnSelectMediaResult(Self);
  end;


end;


procedure TFrameAddPictureListSub.DoFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:={$IFDEF FMX}TCloseAction.caFree{$ENDIF}{$IFDEF VCL}caFree{$ENDIF};
end;


function TFrameAddPictureListSub.DoUploadFile(AImageHttpServerUrl:String;
  APicStream: TStream;
  AFileName: String;
  var ARemoteFilePath: String;
  var AServerResponse:String): Boolean;
var
  AHttpControl:THttpControl;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
  APicUploadSucc:Boolean;
begin
      Result:=False;
      APicUploadSucc:=False;
      ARemoteFilePath:='';


      if Assigned(FOnCustomUploadFile) then
      begin
          //自定义上传
          FOnCustomUploadFile(AImageHttpServerUrl,
                              APicStream,
                              AFileName,
                              ARemoteFilePath,
                              AServerResponse,
                              Result);
      end
      else
      begin
          //默认上传
          AHttpControl:=GlobalSystemHttpControlClass.Create;
          AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
          try


              APicUploadSucc:=AHttpControl.Post(
                    TIdURI.URLEncode(
                      Format(AImageHttpServerUrl,[AFileName])
                      ),
                      APicStream,AResponseStream);

              AServerResponse:=AResponseStream.DataString;


              if APicUploadSucc then
              begin
                  AResponseStream.Position:=0;



                  //ASuperObject:=TSuperObject.ParseStream(AResponseStream);
                  //会报错'Access violation at address 004B6C7C in module ''Server.exe''. Read of address 00000000'
                  //要从AResponseStream.DataString加载
                  ASuperObject:=TSuperObject.Create(AResponseStream.DataString);

      //            '{"Code":200,"Desc":"\u4E0A\u4F20\u6587\u4EF6\u6210\u529F",
      //            "Data":{
      //            "RemoteFilePath":"Upload\\1002\\Shop_Pic\\2018\\2018-03-18\\C8B626D93B014B098B8BC829BE13D744.jpg",
      //            "Url":"Upload/1002/Shop_Pic/2018/2018-03-18/C8B626D93B014B098B8BC829BE13D744.jpg"
      //                  }
      //            }'

                  if ASuperObject.I['Code']=200 then
                  begin
                    //上传成功
                    ARemoteFilePath:=ASuperObject.O['Data'].S['RemoteFilePath'];
                    Result:=True;
                  end
                  else
                  begin
                    //上传失败
                  end;




                  //上传视频



              end
              else
              begin
                //Http调用失败
              end;

          finally
            uFuncCommon.FreeAndNil(AResponseStream);
            FreeAndNil(AHttpControl);
          end;

      end;

end;

//procedure TFrameAddPictureListSub.FrameResized(Sender: TObject);
//begin
//  inherited;
//  Self.AlignControls;
//end;

procedure TFrameAddPictureListSub.DoReturnFrameFromAllImageFrame(
  AFrame: TFrame);
var
  I: Integer;
  AScaleFactor: Single;
var
  AListViewItem:TSkinListViewItem;
  ABitmap:TBitmap;
begin
  {$IFDEF FMX}


  for I := 0 to GAllImageFrame.FSelectedOriginPhotoList.Count-1 do
  begin

      ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I].ThumbBitmap;
      //添加一张图片
      AListViewItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
      //要放在Icon.Assign前面
      AListViewItem.Icon.Url:='';
      AListViewItem.Icon.Assign(ABitmap);
      //图片或者视频路径
      AListViewItem.Icon.Name:=GAllImageFrame.FSelectedOriginPhotoList[I].OriginFilePath;

      //避免花掉
      CopyBitmap(ABitmap,AListViewItem.Icon);


      if GAllImageFrame.FSelectedOriginPhotoList[I].IsVideo then
      begin

          //要放在Icon.Assign前面
//          AListViewItem.ItemType:=sitItem2;

      end
      else
      begin

          //照片返回
          //尺寸如果超过1024,那么需要按比例缩小
          if GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width > 1024 then
          begin
            AScaleFactor := GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width / 1024;
            GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Resize(
                            Round(GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width / AScaleFactor),
                            Round(GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Height / AScaleFactor)
                            );
          end;

      end;


  end;


  AlignControls;



//  if GAllImageFrame.FBtnSure then
//  begin
//      Self.FImgComeFrom:='Libary';
//      for I := 0 to GAllImageFrame.FOriginPhotoList.Count-1 do
//      begin
//        //照片返回
//        if GAllImageFrame.FOriginPhotoList[I].Width > 1024 then
//        begin
//          AScaleFactor := GAllImageFrame.FOriginPhotoList[I].Width / 1024;
//          GAllImageFrame.FOriginPhotoList[I].Resize(Round(GAllImageFrame.FOriginPhotoList[I].Width / AScaleFactor), Round(GAllImageFrame.FOriginPhotoList[I].Height / AScaleFactor));
//        end;
//      end;
//      Self.DoAddPictureFromMenu(nil,GAllImageFrame.FOriginPhotoList);
//  end
//  else
//  begin
//    //不做操作
//  end;


  //释放下内存
  GAllImageFrame.ClearAfterReturn;


  {$ENDIF}
end;

procedure TFrameAddPictureListSub.DoReturnFrameFromClipAddHeadFrame(Frame: TFrame);
var
//  AListViewItem:TSkinListViewItem;
  ABitmap:{$IFDEF FMX}TBitmap{$ENDIF}{$IFDEF VCL}TSkinPicture{$ENDIF};
  AFileName:String;
begin
  ABitmap:=GlobalClipHeadFrame.GetClipBitmap();


  if FEditPictureItem=nil then
  begin
    //添加一张图片
    FEditPictureItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
  end;


  //要放在Icon.Assign前面
  FEditPictureItem.Icon.Url:='';
  FEditPictureItem.Icon.Assign(ABitmap);

  {$IFDEF FMX}
  //避免花掉
  CopyBitmap(ABitmap,FEditPictureItem.Icon);
  {$ENDIF}




  //图片或者视频路径
  AFileName:=FTempDir+CreateGUIDString+'.png';
  ABitmap.SaveToFile(AFileName);
  FEditPictureItem.Icon.Name:=AFileName;




  FreeAndNil(ABitmap);

  AlignControls;
end;

function TFrameAddPictureListSub.GetLocalFileName(AIndex: Integer): String;
begin
  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
  if AIndex<FLocalFileNameAndStreamList.Count then
  begin
    Result:=Self.FLocalFileNameAndStreamList[AIndex];
  end;

end;

function TFrameAddPictureListSub.GetPostValue(ASetting:TFieldControlSetting;
                                              APageDataDir: String;
                                              ASetRecordFieldValueIntf:ISetRecordFieldValue;
                                              var AErrorMessage:String): Variant;
var
  AOtherFieldNames:TStringList;
  AOtherFieldControlProps:TStringList;
  I: Integer;
  J: Integer;
  AIsSetted:Boolean;
begin
  Result:='';

  //保存到本地
  Self.SaveToLocalTemp();


//  if ASetRecordFieldValueIntf<>nil then
//  begin
//    if GetImageUploadTemplateUrl(ASetting)='' then
//    begin
//      AErrorMessage:=ASetting.field_name+' '+'ImageHttpServerUrl can not be empty';
//      Exit;
//    end;
//  end;


  if FIsNeedUpload and (ASetRecordFieldValueIntf<>nil) then
  begin
    //上传图片到服务器
    if not Self.Upload(GetImageUploadTemplateUrl(ASetting),
                        AErrorMessage
                        ) then
    begin
      Exit;
    end;
    //成功要清空
    AErrorMessage:='';
  end;



  //取上传后的远程文件路径
  Result:=GetServerFileName(0);



  if (ASetRecordFieldValueIntf<>nil)
    and (ASetting.other_field_names<>'')
    and (ASetting.other_field_controlprops<>'') then
  begin
      //存在其他需要提交的值
      AOtherFieldNames:=TStringList.Create;
      AOtherFieldControlProps:=TStringList.Create;
      try

          AOtherFieldNames.CommaText:=ASetting.other_field_names;
          AOtherFieldControlProps.CommaText:=ASetting.other_field_controlprops;

          if AOtherFieldControlProps.Count=AOtherFieldNames.Count then
          begin

            for I := 0 to AOtherFieldNames.Count-1 do
            begin

                //遍历Picture0,Picture1,Picture2......
                AIsSetted:=False;
                for J := 0 to Self.lvPictures.Prop.Items.Count-2 do
                begin
                  if Self.lvPictures.Prop.Items[J].ItemType=sitDefault then
                  begin
                  
                    if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)) then
                    begin
                      //图片内容
                      ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],GetServerFileName(J));
                      AIsSetted:=True;
                    end
                    else if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)+'.Width') then
                    begin
                      //图片宽度
                      ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],Self.lvPictures.Prop.Items[J].Icon.Width);
                      AIsSetted:=True;
                    end
                    else if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)+'.Height') then
                    begin
                      //图片高度
                      ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],Self.lvPictures.Prop.Items[J].Icon.Height);
                      AIsSetted:=True;
                    end;
                  end;
                end;

                //不存在,置空,但是也要看字段类型的,整型字段置空就报
                //也可以不设置吧
                { TODO : 注释掉了 }
//                if not AIsSetted then
//                begin
//
//                  ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],'');
//                end;

            end;
          end;
      finally
        FreeAndNil(AOtherFieldNames);
        FreeAndNil(AOtherFieldControlProps);
      end;
  end;

end;

//function TFrameAddPictureListSub.GetProp(APropName: String): Variant;
//begin
//
//end;

function TFrameAddPictureListSub.GetPropJsonStr: String;
begin
  Result:='';
end;

function TFrameAddPictureListSub.GetServerFileName(AIndex: Integer): String;
var
  I: Integer;
  ACount:Integer;
begin
  Result:='';
  if FIsNeedUpload then
  begin
//    if AIndex<Self.lvPictures.Prop.Items.Count-1 then
    if AIndex<FServerFileNameList.Count then
    begin
      Result:=FServerFileNameList[AIndex];
    end;
  end
  else
  begin


//      if
//      AIndex<Self.lvPictures.Prop.Items.Count-1
//      then
//      begin
//        Result:=Self.lvPictures.Prop.Items[AIndex].Icon.Name;
//      end;
    ACount:=-1;
    for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
    begin
      if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
      begin
        Inc(ACount);
        if ACount=AIndex then
        begin
          Result:=Self.lvPictures.Prop.Items[AIndex].Icon.Name;
          Break;
        end;
      end;
    end;

  end;
end;

function TFrameAddPictureListSub.GetServerVideoUrl(AIndex: Integer): String;
begin
  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
  if AIndex<FServerVideoUrlList.Count then
  begin
    Result:=FServerVideoUrlList[AIndex];
  end;
end;

function TFrameAddPictureListSub.GetServerVideoFileId(AIndex: Integer): String;
begin
  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
  if AIndex<FServerVideoFileIdList.Count then
  begin
    Result:=FServerVideoFileIdList[AIndex];
  end;
end;
                      
function TFrameAddPictureListSub.GetServerFileNameArray(AMaxCount:Integer):TStringDynArray;
var
  I: Integer;
begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;

  SetLength(Result,AMaxCount);
  for I := 0 to AMaxCount-1 do
  begin
    Result[I]:='';
  end;

  if FIsNeedUpload then
  begin
    for I := 0 to Self.FServerFileNameList.Count-1 do
    begin
      Result[I]:=FServerFileNameList[I];
    end;
  end
  else
  begin
    for I := 0 to Self.lvPictures.Prop.Items.Count-2 do
    begin
      if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
      begin
        Result[I]:=Self.lvPictures.Prop.Items[I].Icon.Name;
      end;
    end;
  end;


end;

function TFrameAddPictureListSub.GetServerVideoUrlArray(AMaxCount:Integer):TStringDynArray;
var
  I: Integer;
begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;

  SetLength(Result,AMaxCount);
  for I := 0 to AMaxCount-1 do
  begin
    Result[I]:='';
  end;

  for I := 0 to Self.FServerVideoUrlList.Count-1 do
  begin
    Result[I]:=FServerVideoUrlList[I];
  end;
end;

function TFrameAddPictureListSub.HasVideo: Boolean;
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
  begin
    if IsVideoFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
    begin
      Result:=True;
      Break;
    end;
  end;
end;

//获取当前已经选择了的图片个数
function TFrameAddPictureListSub.GetAddedCount: Integer;
var
  I: Integer;
begin
  Result:=0;
  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
  begin
    if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
    begin
      Result:=Result+1;
      Break;
    end;
  end;
end;

function TFrameAddPictureListSub.GetImageCount:Integer;
var
  I: Integer;
begin
  Result:=0;
  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
  begin
    if IsImageFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
    begin
      Result:=Result+1;
      Break;
    end;
  end;

end;

//获取当前已经选择了的视频个数
function TFrameAddPictureListSub.GetVideoCount:Integer;
var
  I: Integer;
begin
  Result:=0;
  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
  begin
    if IsVideoFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
    begin
      Result:=Result+1;
    end;
  end;

end;

function TFrameAddPictureListSub.GetServerVideoFileIdArray(AMaxCount:Integer):TStringDynArray;
var
  I: Integer;
begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;

  SetLength(Result,AMaxCount);
  for I := 0 to AMaxCount-1 do
  begin
    Result[I]:='';
  end;

  for I := 0 to Self.FServerVideoFileIdList.Count-1 do
  begin
    Result[I]:=FServerVideoFileIdList[I];
  end;
end;
               
procedure TFrameAddPictureListSub.Init(ACaption: String;
  APictureValueList,
  APictureUrlList: TStringList;
  AIsNeedClip: Boolean;
  AClipWidth,
  AClipHeight,
  AMaxCount: Integer;
  AIsReadOnly:Boolean;
  AVideoUrlList:TStringList;
  //需要上传的类型
  ASelectMediaType:TSelectMediaType);
var
  //图片值数组
  APictureValues:Array of String;
  //图片Url数组
  APictureUrls:Array of String;
  AVideoUrls:TStringDynArray;
  I: Integer;
begin


  SetLength(APictureValues,APictureValueList.Count);
  SetLength(APictureUrls,APictureUrlList.Count);
  SetLength(AVideoUrls,APictureValueList.Count);


  for I := 0 to APictureValueList.Count-1 do
  begin
    APictureValues[I]:=APictureValueList[I];
    APictureUrls[I]:=APictureUrlList[I];
    if AVideoUrlList<>nil then
    begin
      AVideoUrls[I]:=AVideoUrlList[I];
    end;
  end;



  FSelectMediaType:=ASelectMediaType;



  Self.Init(ACaption,
            APictureValues,
            APictureUrls,
            AIsNeedClip,
            AClipWidth,
            AClipHeight,
            AMaxCount,
            AIsReadOnly,
            AVideoUrls,
            ASelectMediaType);

end;

function TFrameAddPictureListSub.LoadFromFieldControlSetting(ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
var
  AImageClipWidth:Integer;
  AImageClipHeight:Integer;
  AImageMaxCount:Integer;
begin
  {$IFDEF HAS_PAGEFRAMEWORK}
  FFieldControlSettingMap:=TFieldControlSettingMap(AFieldControlSettingMap);
  {$ENDIF}

//  Self.Parent:=Self.pnlHeader;
//  Self.Align:=TAlignLayout.HorzCenter;
//  Self.Width:=Self.lvPictures.Prop.ItemWidth+8;
  Self.pnlPicture.Caption:='';
  Self.pnlToolBar.Visible:=False;

  {$IFDEF FMX}
  Self.lvPictures.Align:=TAlignLayout.Client;
  {$ENDIF}
  {$IFDEF VCL}
  Self.lvPictures.Align:=TAlign.alClient;
  {$ENDIF}

  Self.lvPictures.Margins.Left:=0;


  //image_list_edit,支持添加几个图片等
  //image_is_need_clip	int	图片是否需要裁剪
  //image_clip_width	int	裁剪图片的宽度
  //image_clip_height	int	裁剪图片的高度
  //image_max_count	int	最多支持添加几张图片,0表示默认1
  //image_upload_url	nvarchar(255)	上传图片的接口地址,
  //比如：http://www.orangeui.cn:10011/upload?appid=1003&filename=%s&filedir=repair_car_order_pic&fileext=.jpg


  if ASetting.image_clip_width<=0 then
  begin
    AImageClipWidth:=100;
  end
  else
  begin
    AImageClipWidth:=ASetting.image_clip_width;
  end;
  if ASetting.image_clip_height<=0 then
  begin
    AImageClipHeight:=100;
  end
  else
  begin
    AImageClipHeight:=ASetting.image_clip_width;
  end;
  if ASetting.image_max_count<=0 then
  begin
    AImageMaxCount:=1;
  end
  else
  begin
    AImageMaxCount:=ASetting.image_max_count;
  end;


  //添加图片的加号

  //添加视频的加号



  //初始
  Self.Init(
            '',
            [],
            [],
            (ASetting.image_is_need_clip=1), //裁剪
            AImageClipWidth,
            AImageClipHeight,
            AImageMaxCount,                    //最多1张
            False,
            nil,
            Self.FSelectMediaType
            );

end;

procedure TFrameAddPictureListSub.Init(
  ACaption:String;
  APictureValues,
  APictureUrls: array of String;
  AIsNeedClip: Boolean;
  AClipWidth, AClipHeight,
  AMaxCount: Integer;
  AIsReadOnly:Boolean;
  AVideoUrls: TStringDynArray;
  //需要上传的类型
  ASelectMediaType:TSelectMediaType);
var
  I: Integer;
  AListViewItem:TSkinListViewItem;
begin
  Self.pnlPicture.Caption:=ACaption;


  FIsNeedClip:=AIsNeedClip;
  FClipWidth:=AClipWidth;
  FClipHeight:=AClipHeight;


  FMaxCount:=AMaxCount;
  IsReadOnly:=AIsReadOnly;


  FSelectMediaType:=ASelectMediaType;



  Self.lvPictures.Prop.Items.BeginUpdate;
  try
    Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);

    for I := 0 to Length(APictureUrls)-1 do
    begin


          AListViewItem:=AddItem;//Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);

          AListViewItem.Icon.Url:=APictureUrls[I];
          //存下文件名(保存的时候用,如果修改过了清空,如果没有修改过保持原样)
          AListViewItem.Icon.Name:=APictureValues[I];
          //立即下载
          AListViewItem.Icon.WebUrlPicture;


          //视频链接
          if Length(AVideoUrls)>I then
          begin
            AListViewItem.Icon.Caption:=AVideoUrls[I];
          end;

    end;

  finally
    Self.lvPictures.Prop.Items.EndUpdate;
  end;

  Self.AlignControls;
end;

procedure TFrameAddPictureListSub.lvPicturesClickItem(AItem: TSkinItem);
var
  I: Integer;
  ADrawPictureList:TDrawPictureList;
  AForm:TForm;
  AViewPictureListFrame:TFrameViewPictureList;
  ASelectMediaType:TSelectMediaType;
  {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
  {$IFDEF VCL}
  {$IF CompilerVersion > 21.0} // XE or older
  APasListVlcMediaPlayerFrame:TframePasLibVlcMediaPlayer;
  {$IFEND}
  {$ENDIF VCL}
  {$ENDIF}
begin

  if Self.FIsReadOnly and (AItem.ItemType=sitDefault)//不可以添加编辑
    //或者点击了图片,但是不能修改,那么就是查看
    or (AItem.ItemType=sitDefault) and IsCanNotEditPicture
     then
  begin
      //点击了图片
      //查看
      {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
      if IsVideoFile(AItem.Icon.Caption) then
      begin
          //是视频
          {$IFDEF VCL}
          ShellExecute(0, 'open', PWideChar(AItem.Icon.Caption), '', '', SW_SHOWNORMAL);
//            {$IF CompilerVersion > 21.0} // XE or older
//            AForm:=TForm.Create(Application);
//            APasListVlcMediaPlayerFrame:=nil;
//            ShowFrame(TFrame(APasListVlcMediaPlayerFrame),TframePasLibVlcMediaPlayer,nil,nil,nil,nil,Application,False);
//            AForm:=uFrameContext.GlobalFrameFormMapList.FindByFrame(APasListVlcMediaPlayerFrame).FForm;
//            //          AViewPictureListFrame.btnReturn.Visible:=False;
//            //          AViewPictureListFrame.btnPop.Visible:=False;
////            AForm.OnClose:=DoFormClose;
////            //          AForm.WindowState:=wsMaximized;
//            AForm.Position:=Forms.TPosition.poMainFormCenter;
//            AForm.Width:=600;
//            AForm.Height:=600;
//            AForm.Caption:='视频播放';
////            AForm.Show;
//
//            APasListVlcMediaPlayerFrame.SetControlValue(nil,FTempDir,'',AItem.Icon.Caption,'',nil);
//            APasListVlcMediaPlayerFrame.PlayClick(nil);
//            {$IFEND}
          {$ENDIF}
      end
      else
      {$ENDIF}
      begin
          //是图片
          //只读
          {$IFDEF FMX}

          //查看照片信息
          HideFrame;//();
          //查看照片信息
          ShowFrame(TFrame(GlobalViewPictureListFrame),TFrameViewPictureList);
          AViewPictureListFrame:=GlobalViewPictureListFrame;
    //      GlobalViewPictureListFrame.FrameHistroy:=CurrentFrameHistroy;
          {$ENDIF}
          {$IFDEF VCL}
          AViewPictureListFrame:=nil;
//          AForm:=TForm.Create(Application);
          ShowFrame(TFrame(AViewPictureListFrame),TFrameViewPictureList,nil,nil,nil,nil,Application,False);
          AViewPictureListFrame.btnReturn.Visible:=False;
          AViewPictureListFrame.btnPop.Visible:=False;
          AForm:=uFrameContext.GlobalFrameFormMapList.FindByFrame(AViewPictureListFrame).FForm;


//          AForm.OnClose:=DoFormClose;
////          AForm.WindowState:=wsMaximized;
          AForm.Width:=600;
          AForm.Height:=600;
          AForm.Position:=Forms.TPosition.poMainFormCenter;
          AForm.Caption:='图片查看';
          Self.pnlToolBar.Caption:='图片查看';
//          AForm.Show;
          {$ENDIF}


          ADrawPictureList:=TDrawPictureList.Create(ooReference);
          try
            for I := 0 to Self.lvPictures.Prop.Items.Count-2 do
            begin
              if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
              begin
                ADrawPictureList.Add(Self.lvPictures.Prop.Items[I].Icon);
              end;
            end;
            AViewPictureListFrame.Init(Self.pnlToolBar.Caption,
                                            ADrawPictureList,
                                            AItem.Index);
          finally
            FreeAndNil(ADrawPictureList);
          end;

      end;
  end
  else if not Self.FIsReadOnly then
  begin
          ASelectMediaType:=[];
          //选择
          FEditPictureItem:=nil;
          if (AItem.ItemType=sitDefault) then
          begin
            //更换图片
            FEditPictureItem:=AItem;
            if IsVideoFile(FEditPictureItem.Icon.Name) then
            begin
              ASelectMediaType:=[smtVideo];
            end
            else
            begin
              ASelectMediaType:=[smtImage];
            end;
          end
          else
          begin
            ASelectMediaType:=Self.FSelectMediaType;
            if AItem.Name='addvideo' then
            begin
              ASelectMediaType:=[smtVideo];
            end;
            if AItem.Name='addimage' then
            begin
              ASelectMediaType:=[smtImage];
            end;
          end;

          StartSelect(ASelectMediaType);


  end;

end;

procedure TFrameAddPictureListSub.lvPicturesPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: {$IFDEF FMX}TSkinFMXItemDesignerPanel{$ENDIF}{$IFDEF VCL}TSkinItemDesignerPanel{$ENDIF};
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  //
  Self.imgVideoCover.Visible:=
                                //图片文件链接
                                IsVideoFile(AItem.Icon.Name)
                                //视频文件链接
                              or IsVideoFile(AItem.Icon.Caption)
                              ;

  Self.btnDelPic.Visible:=not FIsReadOnly;
end;

function TFrameAddPictureListSub.SaveToLocalTemp(AQuality:Integer;AFileExt:String):Boolean;
var
  I:Integer;
  APicStream:TMemoryStream;
  AFileName:String;
  {$IFDEF FMX}
  ABitmap:TBitmap;
  ABitmapCodecSaveParams:TBitmapCodecSaveParams;
  {$ENDIF}
begin
  FNeedUploadCount:=0;

  FServerFileNameList.Clear;
  FServerVideoUrlList.Clear;
  FServerVideoFileIdList.Clear;
  FLocalFilePathList.Clear;
  FLocalVideoFilePathList.Clear;
  //清空一下里面的Stream,万一没有释放
  FreeStringListObjects(FLocalFileNameAndStreamList);


  for I := 0 to Self.lvPictures.Prop.Items.Count-2 do
  begin
    if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
    begin
        //是新添加的图片
        if (Self.lvPictures.Prop.Items[I].Icon.Url='') and Self.FIsNeedUpload then
        begin

            //新添加或修改过的图片
            AFileName:=CreateGUIDString+AFileExt;
//            if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
            if not IsVideoFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
            begin
                {$IFDEF FMX}
                //图片
                ABitmapCodecSaveParams.Quality:=AQuality;
                ABitmap:=TBitmap.Create;
                //图片
                ABitmap.LoadFromFile(Self.lvPictures.Prop.Items[I].Icon.Name);
                ABitmap.SaveToFile(
                                  FTempDir+AFileName,
                                  @ABitmapCodecSaveParams
                                  );
                FreeAndNil(ABitmap);
                {$ENDIF}
                {$IFDEF VCL}
                Self.lvPictures.Prop.Items[I].Icon.SaveToFile(FTempDir+AFileName);
                {$ENDIF}

                FLocalVideoFilePathList.Add('');

            end
            else
            begin
                //视频
                //图片是缩略图,要上传缩略图
                {$IFDEF FMX}
                ABitmapCodecSaveParams.Quality:=70;
                Self.lvPictures.Prop.Items[I].Icon.SaveToFile(
                                                              FTempDir+AFileName,
                                                              @ABitmapCodecSaveParams
                                                              );
                {$ENDIF}
                {$IFDEF VCL}
                Self.lvPictures.Prop.Items[I].Icon.SaveToFile(FTempDir+AFileName);
                {$ENDIF}

                FLocalVideoFilePathList.Add(Self.lvPictures.Prop.Items[I].Icon.Name);
            end;

            //要上传的图片
            APicStream:=TMemoryStream.Create;
            APicStream.LoadFromFile(FTempDir+AFileName);

            FLocalFileNameAndStreamList.AddObject(AFileName,APicStream);
            Self.FLocalFilePathList.Add(FTempDir+AFileName);
            FServerFileNameList.Add('');
            FServerVideoUrlList.Add('');
            FServerVideoFileIdList.Add('');


            Inc(FNeedUploadCount);
        end
        else
        begin
            //老图
            FLocalFileNameAndStreamList.AddObject(Self.lvPictures.Prop.Items[I].Icon.Name,nil);
            Self.FLocalFilePathList.Add('');
            Self.FServerFileNameList.Add(Self.lvPictures.Prop.Items[I].Icon.Name);//Name中是服务端相对路径
            FLocalVideoFilePathList.Add('');
            Self.FServerVideoUrlList.Add(Self.lvPictures.Prop.Items[I].Icon.Caption);//Caption中是视频链接
            Self.FServerVideoFileIdList.Add(Self.lvPictures.Prop.Items[I].Icon.Caption);//Caption中是视频链接
        end;
    end;

  end;
end;

procedure TFrameAddPictureListSub.SetIsReadOnly(const Value: Boolean);
begin
  if FIsReadOnly<>Value then
  begin
    FIsReadOnly := Value;

    //只读,不能编辑
    Self.btnDelPic.Visible:=not FIsReadOnly;
//    Self.lvPictures.Prop.Items.FindItemByType(sitItem1).Visible:=not FIsReadOnly;

//    Self.Enabled:=not Value;

  end;
end;

procedure TFrameAddPictureListSub.DoReturnFrame(AFromFrame:TFrame);
begin
end;

procedure TFrameAddPictureListSub.SetControlValue(ASetting:TFieldControlSetting;APageDataDir,
                            AImageServerUrl: String;
                            AValue: Variant;AValueCaption:String;
                            //要设置多个值,整个字段的记录
                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);
var
  I:Integer;
  J:Integer;

  AValues:TStringDynArray;
  AUrls:TStringDynArray;
  AVideos:TStringDynArray;

//  ANameList:TStringList;
  AUrlList:TStringList;
  AVideoUrlList:TStringList;

  AOtherFieldNames:TStringList;
  AOtherFieldControlProps:TStringList;
begin
  SetLength(AValues,0);
  SetLength(AUrls,0);


  AUrlList:=TStringList.Create;
  AVideoUrlList:=TStringList.Create;
  try

      if AValue<>'' then
      begin
        AUrlList.Add(AValue);
      end;


      if (AGetDataIntfResultFieldValueIntf<>nil)
        and (ASetting.other_field_names<>'')
        and (ASetting.other_field_controlprops<>'') then
      begin
          //存在其他需要提交的值
          AOtherFieldNames:=TStringList.Create;
          AOtherFieldControlProps:=TStringList.Create;

          try
              AOtherFieldNames.CommaText:=ASetting.other_field_names;
              AOtherFieldControlProps.CommaText:=ASetting.other_field_controlprops;

              if AOtherFieldControlProps.Count=AOtherFieldNames.Count then
              begin
                //  AFieldControlSetting.other_field_names:='pic1_width,pic1_height,pic2_path,pic3_path,pic4_path,pic5_path,pic6_path,pic7_path,pic8_path,pic9_path';
                //  AFieldControlSetting.other_field_controlprops:='picture0.width,picture0.height,picture1,picture2,picture3,picture4,picture5,picture6,picture7,picture8';

                for I := 0 to AOtherFieldNames.Count-1 do
                begin
                  if Pos('.',AOtherFieldControlProps[I])=0 then
                  begin
                    //是图片picture0,而非图片的属性picture0.width
                    if AGetDataIntfResultFieldValueIntf.GetFieldValue(AOtherFieldNames[I])<>'' then
                    begin
                        AUrlList.Add(AGetDataIntfResultFieldValueIntf.GetFieldValue(AOtherFieldNames[I]));
                    end;
                  end;

                end;


              end;

          finally
            FreeAndNil(AOtherFieldNames);
            FreeAndNil(AOtherFieldControlProps);
          end;

      end;
      if (AGetDataIntfResultFieldValueIntf<>nil) then
      begin
        if (AGetDataIntfResultFieldValueIntf.GetFieldValue('video_origin_url')<>'')
          and not VarIsNULL(AGetDataIntfResultFieldValueIntf.GetFieldValue('video_origin_url')) then
        begin
          AVideoUrlList.Add(AGetDataIntfResultFieldValueIntf.GetFieldValue('video_origin_url'));
        end;
      end;



      SetLength(AValues,AUrlList.Count);
      SetLength(AUrls,AUrlList.Count);
      SetLength(AVideos,AVideoUrlList.Count);

      for I := 0 to AUrlList.Count-1 do
      begin
    //    AValues[0]:=AValue;
    //    AUrls[0]:=GetDrawPictureUrl(AImageServerUrl,AValue);
        AValues[I]:=AUrlList[I];
        AUrls[I]:=GetDrawPictureUrl(AImageServerUrl,AUrlList[I]);
        if I<AVideoUrlList.Count then
        begin
          AVideos[I]:=AVideoUrlList[I];
        end;        
      end;


      Self.Init(
                '',
                AValues,
                AUrls,
                FIsNeedClip,
                FClipWidth,
                FClipHeight,
                FMaxCount,
                FIsReadOnly,
                AVideos,
                Self.FSelectMediaType);

  finally
    FreeAndNil(AUrlList);
    FreeAndNil(AVideoUrlList);
  end;

  //页面需要重新排列下控件


end;

//procedure TFrameAddPictureListSub.SetProp(APropName: String;
//  APropValue: Variant);
//begin
//  if APropName='ReadOnly' then
//  begin
//    //是否只读
//    //Self.FIsReadOnly:=APropValue;
//    Self.SetIsReadOnly(APropValue);
//  end;
//end;

procedure TFrameAddPictureListSub.SetPropJsonStr(AJsonStr: String);
var
  APropJson:ISuperObject;
begin
  APropJson:=TSuperObject.Create(AJsonStr);
  if APropJson.Contains('ReadOnly') then
  begin
    //是否只读
//    Self.FIsReadOnly:=APropJson.B['ReadOnly'];
    Self.SetIsReadOnly(APropJson.B['ReadOnly']);
  end;

//  AFieldControlSetting.PropJson.B['IsNeedUpload']:=False;
//  AFieldControlSetting.prop:=AFieldControlSetting.PropJson.AsJSON;

  if APropJson.Contains('IsNeedUpload') then
  begin
    //是否不需要上传
    Self.FIsNeedUpload:=APropJson.B['IsNeedUpload'];
  end;

//  AFieldControlSetting.PropJson.B['SelectMediaType']:='image_and_video';

  if APropJson.Contains('SelectMediaType') then
  begin
    Self.FSelectMediaType:=[];
    if pos('image',APropJson.S['SelectMediaType'])>0 then
    begin
      Self.FSelectMediaType:=FSelectMediaType+[smtImage];
    end;
    if pos('video',APropJson.S['SelectMediaType'])>0 then
    begin
      Self.FSelectMediaType:=FSelectMediaType+[smtVideo];
    end;
    if pos('custom',APropJson.S['SelectMediaType'])>0 then
    begin
      Self.FSelectMediaType:=FSelectMediaType+[smtCustom];
    end;
  end;


end;

procedure TFrameAddPictureListSub.StartCamera(ASelectMediaType:TSelectMediaType);
begin
  {$IFDEF USE_NATIVE_SELECTMEDIA}

      {$IFDEF ANDROID}
      GlobalSelectMediaUIClass:=TAndroidDVSelectMediaUI;
      {$ENDIF}
      //移动平台
      if FSelectCameraDialog=nil then
      begin
        FSelectCameraDialog:=TSelectMediaDialog.Create(Self);
        FSelectCameraDialog.OnSelectMediaResult:=DoSelectMediaResultEvent;
      end;

      //判断需要上传的类型
      FSelectCameraDialog.SelectMediaType:=ASelectMediaType;

      //能选择的个数
      //FSelectCameraDialog.MaxSelectCount:=FMaxCount;

      FSelectCameraDialog.StartCamera;

  {$ELSE}
  {$ENDIF}

end;

procedure TFrameAddPictureListSub.StartSelect(ASelectMediaType:TSelectMediaType);
begin

      //
      {$IFDEF FMX}
      HideVirtualKeyboard;
      {$ENDIF}


      //自定义选择,比如选择商品
      if Assigned(FOnSelectCustomMedia) or (smtCustom in FSelectMediaType) then
      begin
        if Assigned(FOnSelectCustomMedia) then
        begin
          FOnSelectCustomMedia(Self);
        end;
      end
      else
      begin
          //选择图片或视频
//          if IsUseMultiSelectPicture then
          if FMaxCount>1 then
          begin

                  //多选
                  {$IFDEF USE_NATIVE_SELECTMEDIA}
                      {$IFDEF ANDROID}
                        //拍照
                        ShowFrame(TFrame(GlobalTakePictureMenuFrame),TFrameTakePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
                        GlobalTakePictureMenuFrame.OnTakedPicture:=DoAddPictureFromMenu;
                        GlobalTakePictureMenuFrame.ShowMenu;
                        GlobalTakePictureMenuFrame.FOnCustomPickPhoto:=DoCustomPickPhotoEvent;
                      {$ELSE}
                       DoCustomPickPhoto(FSelectMediaType);
                      {$ENDIF}
                  {$ELSE}
                      {$IFDEF FMX}
                        //Windows平台模拟
                        HideFrame;
                        //多选照片
              //          ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
                        ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,DoReturnFrameFromAllImageFrame);
              //          GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
                        //相机结果回调事件
                        GAllImageFrame.OnGetPhotoFromCamera:=DoAddPictureFromMenu;
                        GAllImageFrame.Load(True,
                                            Self.lvPictures.Prop.Items.Count-1,
                                            Self.FMaxCount,
                                            FSelectMediaType);
                      {$ENDIF}
                  {$ENDIF}



          end
          else
          begin

              //单选
              {$IFDEF FMX}

                  //拍照
                  ShowFrame(TFrame(GlobalTakePictureMenuFrame),TFrameTakePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
        //          GlobalTakePictureMenuFrame.FrameHistroy:=CurrentFrameHistroy;
        //          //添加
        //          if AItem.ItemType=sitItem1 then
        //          begin
                    GlobalTakePictureMenuFrame.OnTakedPicture:=DoAddPictureFromMenu;
        //          end
        //          else
        //          //修改
        //          if AItem.ItemType=sitDefault then
        //          begin
        //            FEditPictureItem:=AItem;
        //            GlobalTakePictureMenuFrame.OnTakedPicture:=DoEditPictureFromMenu;
        //          end;
                  GlobalTakePictureMenuFrame.ShowMenu;

              {$ENDIF}

              {$IFDEF VCL}

              {$ENDIF}

          end;
      end;

end;

function TFrameAddPictureListSub.Upload(AImageHttpServerUrl:String;
                                          var AServerResponse:String):Boolean;
var
  APicUploadSucc:Boolean;
  I: Integer;
  APicStream:TStream;
  ARemoteFilePath:String;
  AVideoUrl:String;
  AVideoFileId:String;
begin
  Result:=False;
  AServerResponse:='';

  if FNeedUploadCount=0 then
  begin
    Result:=True;
    Exit;
  end;


  APicUploadSucc:=True;
  //上传图片
  for I := 0 to Self.FLocalFilePathList.Count-1 do
  begin

      //没有上传过,没有远程文件名,那么需要上传
      if FServerFileNameList[I]='' then
      begin

              APicStream:=TStream(FLocalFileNameAndStreamList.Objects[I]);
              if APicStream<>nil then
              begin

                  if AImageHttpServerUrl<>'' then
                  begin
                      //需要上传到服务器
                      APicUploadSucc:=DoUploadFile(AImageHttpServerUrl,
                                                    APicStream,
                                                    FLocalFileNameAndStreamList[I],
                                                    ARemoteFilePath,
                                                    AServerResponse
                                                    );
                  end
                  else
                  begin
                      //保存到本地即可
                      APicUploadSucc:=True;
                      ARemoteFilePath:=FLocalFilePathList[I];
                  end;

                  if APicUploadSucc then
                  begin
                    FServerFileNameList[I]:= ARemoteFilePath;


                    //成功需要清掉,不成功不用清,下次还要上传呢
                    FLocalFileNameAndStreamList.Objects[I]:=nil;
                    uFuncCommon.FreeAndNil(APicStream);
                  end;


                  //上传视频
                  if (FLocalVideoFilePathList[I]<>'')
                      and Assigned(OnCustomUploadVideoFile) then
                  begin
                      //自定义上传视频
                      OnCustomUploadVideoFile(
                                                FLocalVideoFilePathList[I],
                                                AVideoUrl,
                                                AVideoFileId,
                                                AServerResponse,
                                                Result);
                      FServerVideoUrlList[I]:=AVideoUrl;
                      FServerVideoFileIdList[I]:=AVideoFileId;
                  end;



                  if Not APicUploadSucc then
                  begin
                    //图片上传失败
                    //退出循环
                    Exit;
                  end;

              end;
      end;

      //上传视频


  end;

  Result:=True;
end;


initialization
  RegisterClass(TFrameAddPictureListSub);
  GetGlobalFrameworkComponentTypeClasses.Add('image_list_edit',TFrameAddPictureListSub,'图片列表编辑框','TFrameAddPictureListSub');

finalization
  UnRegisterClass(TFrameAddPictureListSub);


end.
