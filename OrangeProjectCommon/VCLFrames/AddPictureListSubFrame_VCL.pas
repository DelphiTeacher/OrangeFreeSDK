//convert pas to utf8 by ¥
unit AddPictureListSubFrame_VCL;

interface


//使用原生的选择媒体窗体
//{$DEFINE USE_NATIVE_SELECTMEDIA}


uses
  SysUtils, Types,
//  UITypes,
  Classes, Variants,
//  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Forms,
  uBaseList,
  uSkinItems,
//  ClipHeadFrame,
//  uUIFunction,
//  HintFrame,
//  uAppCommon,
  uFuncCommon,
  uFileCommon,
  IOUtils,
  uTimerTask,
//  uPhotoManager,
//  uPageStructure,


//  uSelectMediaDialog,
  //使用原生的选择媒体窗体
  {$IFDEF USE_NATIVE_SELECTMEDIA}
  uCommonSelectMediaUI,
  uAndroidDVSelectMedia,
  uAndroidDmcBigSelectMedia,
  {$ENDIF}



  {$IF CompilerVersion <= 21.0} // D2010之前
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
//  ViewPictureListFrame,
//  TakePictureMenuFrame,
//  AllImageFrame,
  uBaseHttpControl,

  uSkinButtonType, uSkinImageType,
  uSkinItemDesignerPanelType,
  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType,
  uSkinPanelType, //FMX.Controls.Presentation,
  uDrawCanvas,
  uSkinLabelType, Controls, uSkinImageList;

type
//  //自定义上传文件事件
//  TCustomUploadFileEvent=procedure(AImageHttpServerUrl:String;
//                                  APicStream:TStream;
//                                  AFileName:String;
//                                  var ARemoteFilePath:String;
//                                  var AServerResponse:String;
//                                  var APicUploadSucc:Boolean
//                                  ) of object;
//
//  //自定义上传视频文件事件
//  TCustomUploadVideoFileEvent=procedure(//视频文件路径
//                                        AVideoFilePath:String;
//                                        //播放链接
//                                        var AVideoUrl:String;
//                                        var AVideoFileId:String;
//                                        //服务端返回
//                                        var AServerResponse:String;
//                                        //视频上传是否成功
//                                        var AVideoUploadSucc:Boolean
//                                        ) of object;


  TFrameBaseAddPictureListSub = class(TFrame)
    pnlPicture: TSkinWinPanel;
    lvPictures: TSkinWinListView;
    pnlDeletePic: TSkinWinItemDesignerPanel;
    ImgPic: TSkinWinImage;
    pnlToolBar: TSkinWinPanel;
    btnOK: TSkinWinButton;
    btnReturn: TSkinWinButton;
    btnDelPic: TSkinWinButton;
    imgVideoCover: TSkinWinImage;
    lblVideoInfo: TSkinWinLabel;
    SkinImageList1: TSkinImageList;
    procedure lvPicturesClickItem(AItem: TSkinItem);virtual;
    procedure btnDelPicClick(Sender: TObject);virtual;
    procedure btnOKClick(Sender: TObject);virtual;
    procedure btnReturnClick(Sender: TObject);virtual;
    procedure lvPicturesPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);virtual;
    procedure ImgPicResize(Sender: TObject);
//  private
//    FEditPictureItem:TSkinItem;
//    procedure DoAddPictureFromMenu(Sender: TObject;ABitmap:TBitmap);
//    procedure DoEditPictureFromMenu(Sender: TObject;ABitmap:TBitmap);
//
//    procedure DoReturnFrameFromClipAddHeadFrame(Frame:TFrame);
//    procedure DoReturnFrameFromClipEditHeadFrame(Frame:TFrame);
//
//    procedure DoReturnFrameFromAllImageFrame(AFrame:TFrame);
//  private
//    //原生多选照片界面
//    {$IFDEF USE_NATIVE_SELECTMEDIA}
//    FSelectMediaDialog:TSelectMediaDialog;
//    FSelectCameraDialog:TSelectMediaDialog;
//    {$ENDIF}
//    procedure DoSelectMediaResultEvent(Sender:TObject;
//                                        ASelectedFileThumbPaths:TStringList;
//                                        ASelectedFilePaths:TStringList;
//                                        //选择的媒体列表
//                                        ASelectMediaList:TSelectMediaList);
//  private
//    FNeedUploadCount:Integer;
//    FIsReadOnly: Boolean;
//    FOnCustomUploadFile: TCustomUploadFileEvent;
//    procedure SetIsReadOnly(const Value: Boolean);
//
//    function DoUploadFile(AImageHttpServerUrl:String;
//                          APicStream:TStream;
//                          AFileName:String;
//                          var ARemoteFilePath:String;
//                          var AServerResponse:String):Boolean;
//    { Private declarations }
//  protected
//    //针对页面框架的控件接口IControlForPageFramework
//    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
//    //获取与设置自定义属性
//    function GetPropJsonStr:String;
//    procedure SetPropJsonStr(AJsonStr:String);
//    //获取提交的值,是不是存在多个值
//    function GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
//                            var AErrorMessage:String):Variant;
//    //设置值
//    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;
//                            AImageServerUrl:String;
//                            AValue:Variant;AValueCaption:String;
//                            //要设置多个值,整个字段的记录
//                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue
//                            );
//  public
//    //本地文件名和图片数据流
//    FLocalFileNameAndStreamList:TStringList;
//    //本地文件路径
//    FLocalFilePathList:TStringList;
//    FLocalVideoFilePathList:TStringList;
//    //上传成功之后的远程文件名
//    FServerFileNameList:TStringList;
//    FServerVideoUrlList:TStringList;
//    FServerVideoFileIdList:TStringList;
//
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
  public

//    //是否需要剪裁
//    FIsNeedClip:Boolean;
//    FClipWidth:Integer;
//    FClipHeight:Integer;
//    //允许添加的最大图片数据
//    FMaxCount:Integer;
//
//
//    //内容更改之后,内容高度会变化,要通知
//    OnChange:TNotifyEvent;
//    //是否允许多选图片
//    IsUseMultiSelectPicture:Boolean;
//    //是否不能修改图片
//    IsCanNotEditPicture:Boolean;
//    //自定义上传视频文件
//    OnCustomUploadVideoFile: TCustomUploadVideoFileEvent;
//    //图片选择后通知
//    OnSelectMediaResult:TNotifyEvent;
//
////    //添加的图片列表是否为空
////    NowHaveImage:Boolean;
//
//    FSelectType:TSelectMediaType;
//
//
//    function HasVideo:Boolean;
//
//    procedure AlignControls;virtual;abstract;
//
//    procedure Clear;virtual;abstract;
//    //初始
//    procedure Init( ACaption:String;
//                    //图片值数组
//                    //比如:'Upload\1003\repair_car_order_pic\2018\2018-09-27\64C8C8720E42401098D01A297FC68EEE.jpg'
//                    APictureValues:Array of String;
//                    //图片Url数组,用于显示
//                    //比如:'http://www.orangeui.cn:10011/Upload/1003/repair_car_order_pic/2018/2018-09-27/64C8C8720E42401098D01A297FC68EEE.jpg'
//                    APictureUrls:Array of String;
//                    //是否需要剪裁
//                    AIsNeedClip:Boolean;
//                    //剪裁的比例
//                    AClipWidth:Integer;
//                    AClipHeight:Integer;
//                    //允许几张
//                    AMaxCount:Integer;
//                    AIsReadOnly:Boolean=False;
//                    AVideoUrls:TStringDynArray=[];
//                    //需要上传的类型
//                    ASelectType:TSelectMediaType=smtImage);overload;
//    //初始
//    procedure Init( ACaption:String;
//                    //图片值数组
//                    APictureValueList:TStringList;
//                    //图片Url数组
//                    APictureUrlList:TStringList;
//                    //是否需要剪裁
//                    AIsNeedClip:Boolean;
//                    //剪裁的比例
//                    AClipWidth:Integer;
//                    AClipHeight:Integer;
//                    //允许几张
//                    AMaxCount:Integer;
//                    AIsReadOnly:Boolean=False;
//                    AVideoUrlList:TStringList=nil;
//                    //需要上传的类型
//                    ASelectType:TSelectMediaType=smtImage);overload;
//
//
//    function AddPicture(APicFilePath:String):Boolean;
//
//
//    //开始选择图片
//    procedure StartSelect;
//    //开始拍摄
//    procedure StartCamera(ASelectType:TSelectMediaType);


  public

//    //保存到本地
//    function SaveToLocalTemp(
//                    //图片保存的质量
//                    AQuality:Integer=90;
//                    //图片文件的后缀名
//                    AFileExt:String='.jpg'):Boolean;virtual;abstract;
//    //上传到服务器
//    //例如:ImageHttpServerUrl+'/upload'
//    //                 +'?appid='+IntToStr(AppID)
//    //                 +'&filename='+'%s'//用于替换文件名
//    //                 +'&filedir='+'repair_car_order_pic'
//    //                 +'&fileext='+'.jpg',
//    function Upload(
//                    //上传的Rest接口
//                    AImageHttpServerUrl:String;
//                    var AServerResponse:String):Boolean;virtual;abstract;
//
//
//    //获取上传后的值
//    function GetServerFileNameArray(AMaxCount:Integer):TStringDynArray;
//    function GetServerVideoUrlArray(AMaxCount:Integer):TStringDynArray;
//    function GetServerVideoFileIdArray(AMaxCount:Integer):TStringDynArray;
//    function GetServerFileName(AIndex:Integer):String;
//    function GetServerVideoUrl(AIndex:Integer):String;
//    function GetServerVideoFileId(AIndex:Integer):String;
//    function GetLocalFileName(AIndex:Integer):String;
//
//    //是否只读
//    property IsReadOnly:Boolean read FIsReadOnly write SetIsReadOnly;
//    { Public declarations }
//  published
//    //自定义上传文件的事件
//    property OnCustomUploadFile:TCustomUploadFileEvent read FOnCustomUploadFile write FOnCustomUploadFile;
  end;




//var
//  GlobalAddPictureListSubFrame:TFrameAddPictureListSub;



implementation

//uses
//  AddContentFrame;

{$R *.dfm}


{ TFrameAddPictureListSub }

//function TFrameAddPictureListSub.AddPicture(APicFilePath: String): Boolean;
//var
//  AListViewItem:TSkinListViewItem;
//begin
//  //添加一张图片
//  AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//  //要放在Icon.Assign前面
//  AListViewItem.Icon.Url:='';
//  AListViewItem.Icon.LoadFromFile(APicFilePath);
//
//  AlignControls;
//end;
//
//procedure TFrameAddPictureListSub.AlignControls;
//begin
//  //判断是否需要隐藏添加按钮
//  Self.lvPictures.Prop.Items.FindItemByType(sitItem1).Visible:=
//    not Self.FIsReadOnly
//    and (Self.lvPictures.Prop.Items.Count<=FMaxCount);
//
//  if Not Self.pnlToolBar.Visible then
//  begin
//    Self.Height:=Self.lvPictures.Prop.GetContentHeight;
//  end;
//
//  if Assigned(OnChange) then
//  begin
//    OnChange(Self);
//  end;
//
//end;

procedure TFrameBaseAddPictureListSub.btnDelPicClick(Sender: TObject);
begin
//  //删除图片
//  Self.lvPictures.Prop.Items.Remove(Self.lvPictures.Prop.InteractiveItem);
//
//  AlignControls;

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

procedure TFrameBaseAddPictureListSub.btnOKClick(Sender: TObject);
//var
//  AServerResponseDesc:String;
begin

//  Self.SaveToLocalTemp(100,'.jpg');
//
//  //上传,测试
//  Upload('http://www.orangeui.cn:10001/upload'
//              +'?appid=1002'
//              +'&filename='+'%s'
//              +'&filedir='+'Shop_Pic'
//              +'&fileext='+'.jpg',
//              AServerResponseDesc);
//
//
//
//  HideFrame;//(CurrentFrame,hfcttBeforeReturnFrame);
//  ReturnFrame;//(CurrentFrame);
end;

procedure TFrameBaseAddPictureListSub.btnReturnClick(Sender: TObject);
begin
//  //返回
//  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;
//
//  HideFrame;//(CurrentFrame,hfcttBeforeReturnFrame);
//  ReturnFrame;//(CurrentFrame);
end;

procedure TFrameBaseAddPictureListSub.ImgPicResize(Sender: TObject);
begin
  //
  Self.imgVideoCover.Left:=(Self.ImgPic.Width-Self.imgVideoCover.Width) div 2;
end;

//procedure TFrameAddPictureListSub.Clear;
//begin
//  Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);
//end;
//
//constructor TFrameAddPictureListSub.Create(AOwner: TComponent);
//begin
//  inherited;
//
//  FLocalFilePathList:=TStringList.Create;
//  FLocalVideoFilePathList:=TStringList.Create;
//  FLocalFileNameAndStreamList:=TStringList.Create;
//  FServerFileNameList:=TStringList.Create;
//  FServerVideoUrlList:=TStringList.Create;
//  FServerVideoFileIdList:=TStringList.Create;
//
//
//
//  Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);
//
////  Init('商品图片',[],[],False,400,300,6);
//
//
//  RecordSubControlsLang(Self);
//  TranslateSubControlsLang(Self);
//end;
//
//destructor TFrameAddPictureListSub.Destroy;
//begin
//
//  FreeAndNil(FLocalFilePathList);
//  FreeAndNil(FLocalVideoFilePathList);
//  //清空一下里面的Stream,万一没有释放
//  FreeStringListObjects(FLocalFileNameAndStreamList);
//
//  FreeAndNil(FLocalFileNameAndStreamList);
//  FreeAndNil(FServerFileNameList);
//  FreeAndNil(FServerVideoUrlList);
//  FreeAndNil(FServerVideoFileIdList);
//
//
//  {$IFDEF USE_NATIVE_SELECTMEDIA}
//  FreeAndNil(FSelectMediaDialog);
//  FreeAndNil(FSelectCameraDialog);
//  {$ENDIF}
//  inherited;
//end;
//
//procedure TFrameAddPictureListSub.DoAddPictureFromMenu(Sender: TObject;
//  ABitmap: TBitmap);
//var
//  AFileName:String;
//  AListViewItem:TSkinListViewItem;
//begin
//  if not Self.FIsNeedClip then
//  begin
//    //添加一张图片
//    AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//    //要放在Icon.Assign前面
//    AListViewItem.Icon.Url:='';
//    AListViewItem.Icon.Assign(ABitmap);
//    //避免花掉
//    CopyBitmap(ABitmap,AListViewItem.Icon);
//
//
//    //图片或者视频路径
//    AFileName:=GetApplicationPath+CreateGUIDString+'.png';
//    ABitmap.SaveToFile(AFileName);
//    AListViewItem.Icon.Name:=AFileName;
//
//
//
//    AlignControls;
//  end
//  else
//  begin
//
//
//    //上传商品轮播图片裁剪
//    HideFrame;//(CurrentFrame,hfcttBeforeShowframe);
//    ShowFrame(TFrame(GlobalClipHeadFrame),TFrameClipHead,Application.MainForm,nil,nil,DoReturnFrameFromClipAddHeadFrame,Application);
//    GlobalClipHeadFrame.Init(ABitmap,Self.FClipWidth,FClipHeight);
//  end;
//end;
//
//procedure TFrameAddPictureListSub.DoEditPictureFromMenu(Sender: TObject;
//  ABitmap: TBitmap);
//var
//  AFileName:String;
//begin
//  //同样广告图片的修改不裁剪
//  if not Self.FIsNeedClip then
//  begin
//      //要放在Icon.Assign前面
//      FEditPictureItem.Icon.Url:='';
//      FEditPictureItem.Icon.Assign(ABitmap);
//      //避免花掉
//      CopyBitmap(ABitmap,FEditPictureItem.Icon);
//
//
//      //图片或者视频路径
//      AFileName:=GetApplicationPath+CreateGUIDString+'.png';
//      ABitmap.SaveToFile(AFileName);
//      FEditPictureItem.Icon.Name:=AFileName;
//
//
//  end
//  else
//  begin
//      HideFrame;//(CurrentFrame,hfcttBeforeShowframe);
//      ShowFrame(TFrame(GlobalClipHeadFrame),TFrameClipHead,Application.MainForm,nil,nil,DoReturnFrameFromClipEditHeadFrame,Application);
//      GlobalClipHeadFrame.Init(ABitmap,FClipWidth,FClipHeight);
//  end;
//
//end;
//
//procedure TFrameAddPictureListSub.DoReturnFrameFromClipEditHeadFrame(Frame: TFrame);
//var
//  ABitmap:TBitmap;
//  AFileName:String;
//begin
//  ABitmap:=GlobalClipHeadFrame.GetClipBitmap;
//  //要放在Icon.Assign前面
//  FEditPictureItem.Icon.Url:='';
//  FEditPictureItem.Icon.Assign(ABitmap);
//  //避免花掉
//  CopyBitmap(ABitmap,FEditPictureItem.Icon);
//
//
//  //图片或者视频路径
//  AFileName:=GetApplicationPath+CreateGUIDString+'.png';
//  ABitmap.SaveToFile(AFileName);
//  FEditPictureItem.Icon.Name:=AFileName;
//
//
//
//  FreeAndNil(ABitmap);
//end;
//
//procedure TFrameAddPictureListSub.DoSelectMediaResultEvent(Sender: TObject;
//  ASelectedFileThumbPaths:TStringList;
//  ASelectedFilePaths: TStringList;
//  //选择的媒体列表
//  ASelectMediaList:TSelectMediaList);
//var
//  I: Integer;
////  AScaleFactor: Single;
//var
//  AListViewItem:TSkinListViewItem;
//  ABitmap:TBitmap;
//begin
//
//
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
//                    smtVideo
//                    );
//          Break;
//      end;
//
//  end;
//
//
//
//
//  for I := 0 to ASelectMediaList.Count-1 do
//  begin
//
//      //判断是否是图片还是视频
//      //      if SameText(ExtractFileExt(ASelectMediaList[I].FilePath),'.mp4') then
//      if ASelectMediaList[I].IsVideo then
//      begin
//          //视频
//          //AListViewItem.ItemType:=sitItem2;
//
//          //视频文件的尺寸不能大于50M
//          if GetSizeOfFile(ASelectMediaList[I].FilePath)>50*1024*1024 then
//          begin
//            ShowHintFrame(nil,'上传视频不能大于50M');
//            Exit;
//          end;
//      end;
//
//
//
//
//      //添加一张图片
//      AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//      //要放在Icon.Assign前面
//      AListViewItem.Icon.Url:='';
//      //缩略图地址
//      AListViewItem.Icon.Caption:=ASelectMediaList[I].ThumbPath;
//      //原图地址
//      AListViewItem.Icon.Name:=ASelectMediaList[I].FilePath;
//
//      if ASelectMediaList[I].IsVideo then
//      begin
//        //文件大小
//        AListViewItem.Detail:=GetFileSizeStr2(GetSizeOfFile(ASelectMediaList[I].FilePath));
//      end;
//
//
//
//
//      //缩略图
//      if ASelectMediaList[I].ThumbPath<>'' then
//      begin
//          ABitmap:=TBitmap.Create;
//          try
//
//              ABitmap.LoadFromFile(ASelectMediaList[I].ThumbPath);
//
//
//              //照片返回
//              //尺寸如果超过1024,那么需要按比例缩小
//    //          if ABitmap.Width > 1024 then
//    //          begin
//    //            AScaleFactor := ABitmap.Width / 1024;
//    //            ABitmap.Resize(Round(ABitmap.Width / AScaleFactor), Round(ABitmap.Height / AScaleFactor));
//    //          end;
//
//              AListViewItem.Icon.Assign(ABitmap);
//              //避免花掉
//              CopyBitmap(ABitmap,AListViewItem.Icon);
//
//          finally
//            FreeAndNil(ABitmap);
//          end;
//      end;
//
//
//
//  end;
//
//
//
//
//  AlignControls;
//
//  if Assigned(OnSelectMediaResult) then
//  begin
//    OnSelectMediaResult(Self);
//  end;
//
//
//
//end;
//
//function TFrameAddPictureListSub.DoUploadFile(AImageHttpServerUrl:String;
//  APicStream: TStream;
//  AFileName: String;
//  var ARemoteFilePath: String;
//  var AServerResponse:String): Boolean;
//var
//  AHttpControl:THttpControl;
//  AResponseStream:TStringStream;
//  ASuperObject:ISuperObject;
//  APicUploadSucc:Boolean;
//begin
//      Result:=False;
//      APicUploadSucc:=False;
//      ARemoteFilePath:='';
//
//
//      if Assigned(FOnCustomUploadFile) then
//      begin
//          //自定义上传
//          FOnCustomUploadFile(AImageHttpServerUrl,
//                              APicStream,
//                              AFileName,
//                              ARemoteFilePath,
//                              AServerResponse,
//                              Result);
//      end
//      else
//      begin
//          //默认上传
//          AHttpControl:=TSystemHttpControl.Create;
//          AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
//          try
//
//
//              APicUploadSucc:=AHttpControl.Post(
//                    TIdURI.URLEncode(
//                      Format(AImageHttpServerUrl,[AFileName])
//                      ),
//                      APicStream,AResponseStream);
//
//              AServerResponse:=AResponseStream.DataString;
//
//
//              if APicUploadSucc then
//              begin
//                  AResponseStream.Position:=0;
//
//
//
//                  //ASuperObject:=TSuperObject.ParseStream(AResponseStream);
//                  //会报错'Access violation at address 004B6C7C in module ''Server.exe''. Read of address 00000000'
//                  //要从AResponseStream.DataString加载
//                  ASuperObject:=TSuperObject.Create(AResponseStream.DataString);
//
//      //            '{"Code":200,"Desc":"\u4E0A\u4F20\u6587\u4EF6\u6210\u529F",
//      //            "Data":{
//      //            "RemoteFilePath":"Upload\\1002\\Shop_Pic\\2018\\2018-03-18\\C8B626D93B014B098B8BC829BE13D744.jpg",
//      //            "Url":"Upload/1002/Shop_Pic/2018/2018-03-18/C8B626D93B014B098B8BC829BE13D744.jpg"
//      //                  }
//      //            }'
//
//                  if ASuperObject.I['Code']=200 then
//                  begin
//                    //上传成功
//                    ARemoteFilePath:=ASuperObject.O['Data'].S['RemoteFilePath'];
//                    Result:=True;
//                  end
//                  else
//                  begin
//                    //上传失败
//                  end;
//
//
//
//
//                  //上传视频
//
//
//
//              end
//              else
//              begin
//                //Http调用失败
//              end;
//
//          finally
//            uFuncCommon.FreeAndNil(AResponseStream);
//            FreeAndNil(AHttpControl);
//          end;
//
//      end;
//
//end;
//
//procedure TFrameAddPictureListSub.DoReturnFrameFromAllImageFrame(
//  AFrame: TFrame);
//var
//  I: Integer;
//  AScaleFactor: Single;
//var
//  AListViewItem:TSkinListViewItem;
//  ABitmap:TBitmap;
//begin
//
//
//  for I := 0 to GAllImageFrame.FSelectedOriginPhotoList.Count-1 do
//  begin
//
//      ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I].ThumbBitmap;
//      //添加一张图片
//      AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//      //要放在Icon.Assign前面
//      AListViewItem.Icon.Url:='';
//      AListViewItem.Icon.Assign(ABitmap);
//      //图片或者视频路径
//      AListViewItem.Icon.Name:=GAllImageFrame.FSelectedOriginPhotoList[I].OriginFilePath;
//
//      //避免花掉
//      CopyBitmap(ABitmap,AListViewItem.Icon);
//
//
//      if GAllImageFrame.FSelectedOriginPhotoList[I].IsVideo then
//      begin
//
//          //要放在Icon.Assign前面
////          AListViewItem.ItemType:=sitItem2;
//
//      end
//      else
//      begin
//
//          //照片返回
//          //尺寸如果超过1024,那么需要按比例缩小
//          if GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width > 1024 then
//          begin
//            AScaleFactor := GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width / 1024;
//            GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Resize(
//                            Round(GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Width / AScaleFactor),
//                            Round(GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap.Height / AScaleFactor)
//                            );
//          end;
//
//      end;
//
//
//  end;
//
//
//  AlignControls;
//
//
//
////  if GAllImageFrame.FBtnSure then
////  begin
////      Self.FImgComeFrom:='Libary';
////      for I := 0 to GAllImageFrame.FOriginPhotoList.Count-1 do
////      begin
////        //照片返回
////        if GAllImageFrame.FOriginPhotoList[I].Width > 1024 then
////        begin
////          AScaleFactor := GAllImageFrame.FOriginPhotoList[I].Width / 1024;
////          GAllImageFrame.FOriginPhotoList[I].Resize(Round(GAllImageFrame.FOriginPhotoList[I].Width / AScaleFactor), Round(GAllImageFrame.FOriginPhotoList[I].Height / AScaleFactor));
////        end;
////      end;
////      Self.DoAddPictureFromMenu(nil,GAllImageFrame.FOriginPhotoList);
////  end
////  else
////  begin
////    //不做操作
////  end;
//
//
//  //释放下内存
//  GAllImageFrame.ClearAfterReturn;
//
//
//end;
//
//procedure TFrameAddPictureListSub.DoReturnFrameFromClipAddHeadFrame(Frame: TFrame);
//var
//  AListViewItem:TSkinListViewItem;
//  ABitmap:TBitmap;
//  AFileName:String;
//begin
//  ABitmap:=GlobalClipHeadFrame.GetClipBitmap;
//  //添加一张图片
//  AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//  //要放在Icon.Assign前面
//  AListViewItem.Icon.Url:='';
//  AListViewItem.Icon.Assign(ABitmap);
//  //避免花掉
//  CopyBitmap(ABitmap,AListViewItem.Icon);
//
//
//
//
//  //图片或者视频路径
//  AFileName:=GetApplicationPath+CreateGUIDString+'.png';
//  ABitmap.SaveToFile(AFileName);
//  FEditPictureItem.Icon.Name:=AFileName;
//
//
//
//
//  FreeAndNil(ABitmap);
//
//  AlignControls;
//end;
//
//function TFrameAddPictureListSub.GetLocalFileName(AIndex: Integer): String;
//begin
//  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
//  begin
//    Result:=Self.FLocalFileNameAndStreamList[AIndex];
//  end;
//
//end;
//
//function TFrameAddPictureListSub.GetPostValue(ASetting:TFieldControlSetting;APageDataDir: String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
//                            var AErrorMessage:String): Variant;
//var
//  AOtherFieldNames:TStringList;
//  AOtherFieldControlProps:TStringList;
//  I: Integer;
//  J: Integer;
//  AIsSetted:Boolean;
//begin
//  Result:='';
//
//
//  if ASetRecordFieldValueIntf<>nil then
//  begin
//    if ASetRecordFieldValueIntf.GetImageUploadTemplateUrl(ASetting)='' then
//    begin
//      AErrorMessage:=ASetting.field_name+' '+'ImageUploadTemplateUrl can not be empty';
//      Exit;
//    end;
//  end;
//
//
//  Self.SaveToLocalTemp();
//
//
//  if ASetRecordFieldValueIntf<>nil then
//  begin
//
//
//
//    //上传图片到服务器
//    if not Self.Upload(ASetRecordFieldValueIntf.GetImageUploadTemplateUrl(ASetting),
//                AErrorMessage
//                ) then
//    begin
//      Exit;
//    end;
//    //成功要清空
//    AErrorMessage:='';
//  end;
//
//
//
//  //取上传后的远程文件路径
//  Result:=GetServerFileName(0);
//
//
//
//  if (ASetRecordFieldValueIntf<>nil)
//    and (ASetting.other_field_names<>'')
//    and (ASetting.other_field_controlprops<>'') then
//  begin
//      //存在其他需要提交的值
//      AOtherFieldNames:=TStringList.Create;
//      AOtherFieldControlProps:=TStringList.Create;
//
//
//      AOtherFieldNames.CommaText:=ASetting.other_field_names;
//      AOtherFieldControlProps.CommaText:=ASetting.other_field_controlprops;
//
//      if AOtherFieldControlProps.Count=AOtherFieldNames.Count then
//      begin
//
//        for I := 0 to AOtherFieldNames.Count-1 do
//        begin
//
//            //遍历Picture0,Picture1,Picture2......
//            AIsSetted:=False;
//            for J := 0 to Self.lvPictures.Prop.Items.Count-2 do
//            begin
//                if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)) then
//                begin
//                  ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],GetServerFileName(J));
//                  AIsSetted:=True;
//                end
//                else if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)+'.Width') then
//                begin
//                  ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],Self.lvPictures.Prop.Items[J].Icon.Width);
//                  AIsSetted:=True;
//                end
//                else if SameText(AOtherFieldControlProps[I],'Picture'+IntToStr(J)+'.Height') then
//                begin
//                  ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],Self.lvPictures.Prop.Items[J].Icon.Height);
//                  AIsSetted:=True;
//                end;
//            end;
//
//            //不存在,置空
//            if not AIsSetted then
//            begin
//              ASetRecordFieldValueIntf.SetFieldValue(AOtherFieldNames[I],'');
//            end;
//
//        end;
//      end;
//
//
//      FreeAndNil(AOtherFieldNames);
//      FreeAndNil(AOtherFieldControlProps);
//  end;
//
//end;
//
//function TFrameAddPictureListSub.GetPropJsonStr: String;
//begin
//  Result:='';
//end;
//
//function TFrameAddPictureListSub.GetServerFileName(AIndex: Integer): String;
//begin
//  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
//  begin
//    Result:=FServerFileNameList[AIndex];
//  end;
//end;
//
//function TFrameAddPictureListSub.GetServerVideoUrl(AIndex: Integer): String;
//begin
//  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
//  begin
//    Result:=FServerVideoUrlList[AIndex];
//  end;
//end;
//
//function TFrameAddPictureListSub.GetServerVideoFileId(AIndex: Integer): String;
//begin
//  Result:='';
//  if AIndex<Self.lvPictures.Prop.Items.Count-1 then
//  begin
//    Result:=FServerVideoFileIdList[AIndex];
//  end;
//end;
//
//function TFrameAddPictureListSub.GetServerFileNameArray(AMaxCount:Integer):TStringDynArray;
//var
//  I: Integer;
//begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;
//
//  SetLength(Result,AMaxCount);
//  for I := 0 to AMaxCount-1 do
//  begin
//    Result[I]:='';
//  end;
//
//  for I := 0 to Self.FServerFileNameList.Count-1 do
//  begin
//    Result[I]:=FServerFileNameList[I];
//  end;
//end;
//
//function TFrameAddPictureListSub.GetServerVideoUrlArray(AMaxCount:Integer):TStringDynArray;
//var
//  I: Integer;
//begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;
//
//  SetLength(Result,AMaxCount);
//  for I := 0 to AMaxCount-1 do
//  begin
//    Result[I]:='';
//  end;
//
//  for I := 0 to Self.FServerVideoUrlList.Count-1 do
//  begin
//    Result[I]:=FServerVideoUrlList[I];
//  end;
//end;
//
//function TFrameAddPictureListSub.HasVideo: Boolean;
//var
//  I: Integer;
//begin
//  Result:=False;
//  for I := 0 to Self.lvPictures.Prop.Items.Count-1 do
//  begin
//    if IsVideoFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
//    begin
//      Result:=True;
//      Break;
//    end;
//  end;
//end;
//
//function TFrameAddPictureListSub.GetServerVideoFileIdArray(AMaxCount:Integer):TStringDynArray;
//var
//  I: Integer;
//begin
//  if Self.lvPictures.Prop.Items.Count-1>AMaxCount then
//  begin
//    AMaxCount:=Self.lvPictures.Prop.Items.Count-1;
//  end;
//
//  SetLength(Result,AMaxCount);
//  for I := 0 to AMaxCount-1 do
//  begin
//    Result[I]:='';
//  end;
//
//  for I := 0 to Self.FServerVideoFileIdList.Count-1 do
//  begin
//    Result[I]:=FServerVideoFileIdList[I];
//  end;
//end;
//
//procedure TFrameAddPictureListSub.Init(ACaption: String;
//  APictureValueList,
//  APictureUrlList: TStringList;
//  AIsNeedClip: Boolean;
//  AClipWidth,
//  AClipHeight,
//  AMaxCount: Integer;
//  AIsReadOnly:Boolean;
//  AVideoUrlList:TStringList;
//  //需要上传的类型
//  ASelectType:TSelectMediaType);
//var
//  //图片值数组
//  APictureValues:Array of String;
//  //图片Url数组
//  APictureUrls:Array of String;
//  AVideoUrls:TStringDynArray;
//  I: Integer;
//begin
//
//
//  SetLength(APictureValues,APictureValueList.Count);
//  SetLength(APictureUrls,APictureUrlList.Count);
//  SetLength(AVideoUrls,APictureValueList.Count);
//
//
//  for I := 0 to APictureValueList.Count-1 do
//  begin
//    APictureValues[I]:=APictureValueList[I];
//    APictureUrls[I]:=APictureUrlList[I];
//    if AVideoUrlList<>nil then
//    begin
//      AVideoUrls[I]:=AVideoUrlList[I];
//    end;
//  end;
//
//
//
//  FSelectType:=ASelectType;
//
//
//
//  Self.Init(ACaption,
//            APictureValues,
//            APictureUrls,
//            AIsNeedClip,
//            AClipWidth,
//            AClipHeight,
//            AMaxCount,
//            AIsReadOnly,
//            AVideoUrls,
//            ASelectType);
//
//end;
//
//function TFrameAddPictureListSub.LoadFromFieldControlSetting(ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
//var
//  AImageClipWidth:Integer;
//  AImageClipHeight:Integer;
//  AImageMaxCount:Integer;
//begin
////  Self.Parent:=Self.pnlHeader;
////  Self.Align:=TAlignLayout.HorzCenter;
////  Self.Width:=Self.lvPictures.Prop.ItemWidth+8;
//  Self.pnlPicture.Caption:='';
//  Self.pnlToolBar.Visible:=False;
//  Self.lvPictures.Align:=TAlignLayout.Client;
//  Self.lvPictures.Margins.Left:=0;
//
//
//  //image_list_edit,支持添加几个图片等
//  //image_is_need_clip	int	图片是否需要裁剪
//  //image_clip_width	int	裁剪图片的宽度
//  //image_clip_height	int	裁剪图片的高度
//  //image_max_count	int	最多支持添加几张图片,0表示默认1
//  //image_upload_url	nvarchar(255)	上传图片的接口地址,
//  //比如：http://www.orangeui.cn:10011/upload?appid=1003&filename=%s&filedir=repair_car_order_pic&fileext=.jpg
//
//
//  if ASetting.image_clip_width<=0 then AImageClipWidth:=100;
//  if ASetting.image_clip_height<=0 then AImageClipHeight:=100;
//  if ASetting.image_max_count<=0 then AImageMaxCount:=1;
//
//  //初始
//  Self.Init(
//            '',
//            [],
//            [],
//            (ASetting.image_is_need_clip=1), //裁剪
//            AImageClipWidth,
//            AImageClipHeight,
//            AImageMaxCount                    //最多1张
//            );
//
//end;
//
//procedure TFrameAddPictureListSub.Init(
//  ACaption:String;
//  APictureValues,
//  APictureUrls: array of String;
//  AIsNeedClip: Boolean;
//  AClipWidth, AClipHeight,
//  AMaxCount: Integer;
//  AIsReadOnly:Boolean;
//  AVideoUrls: TStringDynArray;
//  //需要上传的类型
//  ASelectType:TSelectMediaType);
//var
//  I: Integer;
//  AListViewItem:TSkinListViewItem;
//begin
//  Self.pnlPicture.Caption:=ACaption;
//
//
//  FIsNeedClip:=AIsNeedClip;
//  FClipWidth:=AClipWidth;
//  FClipHeight:=AClipHeight;
//
//
//  FMaxCount:=AMaxCount;
//  IsReadOnly:=AIsReadOnly;
//
//
//  FSelectType:=ASelectType;
//
//
//
//  Self.lvPictures.Prop.Items.BeginUpdate;
//  try
//    Self.lvPictures.Prop.Items.ClearItemsByTypeNot(sitItem1);
//
//    for I := 0 to Length(APictureUrls)-1 do
//    begin
//
//
//          AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//
//          AListViewItem.Icon.Url:=APictureUrls[I];
//          //存下文件名(保存的时候用,如果修改过了清空,如果没有修改过保持原样)
//          AListViewItem.Icon.Name:=APictureValues[I];
//          //立即下载
//          AListViewItem.Icon.WebUrlPicture;
//
//
//          //视频链接
//          if Length(AVideoUrls)>I then
//          begin
//            AListViewItem.Icon.Caption:=AVideoUrls[I];
//          end;
//
//    end;
//
//  finally
//    Self.lvPictures.Prop.Items.EndUpdate;
//  end;
//
//  Self.AlignControls;
//end;

procedure TFrameBaseAddPictureListSub.lvPicturesClickItem(AItem: TSkinItem);
//var
//  ADrawPictureList:TDrawPictureList;
//  I: Integer;
begin

//  if Self.FIsReadOnly//不可以添加编辑
//    //或者点击了图片,但是不能修改,那么就是查看
//    or (AItem.ItemType=sitDefault) and IsCanNotEditPicture
//     then
//  begin
//          //只读
//
//          //查看照片信息
//          HideFrame;//();
//          //查看照片信息
//          ShowFrame(TFrame(GlobalViewPictureListFrame),TFrameViewPictureList);
//
//    //      GlobalViewPictureListFrame.FrameHistroy:=CurrentFrameHistroy;
//
//
//          ADrawPictureList:=TDrawPictureList.Create(ooReference);
//          try
//            for I := 0 to Self.lvPictures.Prop.Items.Count-2 do
//            begin
//              ADrawPictureList.Add(Self.lvPictures.Prop.Items[I].Icon);
//            end;
//            GlobalViewPictureListFrame.Init(Self.pnlToolBar.Caption,
//                                            ADrawPictureList,
//                                            AItem.Index);
//          finally
//            FreeAndNil(ADrawPictureList);
//          end;
//
//  end
//  else
//  begin
//          StartSelect;
//  end;

end;

procedure TFrameBaseAddPictureListSub.lvPicturesPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  //
//  Self.imgVideoCover.Visible:=IsVideoFile(AItem.Icon.Name);

end;

//function TFrameAddPictureListSub.SaveToLocalTemp(AQuality:Integer;AFileExt:String):Boolean;
//var
//  I:Integer;
//  APicStream:TMemoryStream;
//  AFileName:String;
//  ABitmap:TBitmap;
//  ABitmapCodecSaveParams:TBitmapCodecSaveParams;
//begin
//  FNeedUploadCount:=0;
//
//  FServerFileNameList.Clear;
//  FServerVideoUrlList.Clear;
//  FServerVideoFileIdList.Clear;
//  FLocalFilePathList.Clear;
//  FLocalVideoFilePathList.Clear;
//  //清空一下里面的Stream,万一没有释放
//  FreeStringListObjects(FLocalFileNameAndStreamList);
//
//
//  for I := 0 to Self.lvPictures.Prop.Items.Count-2 do
//  begin
//
//        //是图片
//        if (Self.lvPictures.Prop.Items[I].Icon.Url='') then
//        begin
//
//            //新添加或修改过的图片
//            AFileName:=CreateGUIDString+AFileExt;
////            if Self.lvPictures.Prop.Items[I].ItemType=sitDefault then
//            if not IsVideoFile(Self.lvPictures.Prop.Items[I].Icon.Name) then
//            begin
//                //图片
//                ABitmapCodecSaveParams.Quality:=AQuality;
//                ABitmap:=TBitmap.Create;
//                //图片
//                ABitmap.LoadFromFile(Self.lvPictures.Prop.Items[I].Icon.Name);
//                ABitmap.SaveToFile(
//                                  IOUtils.TPath.GetDocumentsPath+PathDelim+AFileName,
//                                  @ABitmapCodecSaveParams
//                                  );
//                FreeAndNil(ABitmap);
//
//                FLocalVideoFilePathList.Add('');
//
//            end
//            else
//            begin
//                //视频
//                //图片是缩略图,要上传缩略图
//                ABitmapCodecSaveParams.Quality:=70;
//                Self.lvPictures.Prop.Items[I].Icon.SaveToFile(
//                                                              IOUtils.TPath.GetDocumentsPath+PathDelim+AFileName,
//                                                              @ABitmapCodecSaveParams
//                                                              );
//                FLocalVideoFilePathList.Add(Self.lvPictures.Prop.Items[I].Icon.Name);
//            end;
//
//            //要上传的图片
//            APicStream:=TMemoryStream.Create;
//            APicStream.LoadFromFile(IOUtils.TPath.GetDocumentsPath+PathDelim+AFileName);
//
//            FLocalFileNameAndStreamList.AddObject(AFileName,APicStream);
//            Self.FLocalFilePathList.Add(IOUtils.TPath.GetDocumentsPath+PathDelim+AFileName);
//            FServerFileNameList.Add('');
//            FServerVideoUrlList.Add('');
//            FServerVideoFileIdList.Add('');
//
//
//            Inc(FNeedUploadCount);
//        end
//        else
//        begin
//            //老图
//            FLocalFileNameAndStreamList.AddObject(Self.lvPictures.Prop.Items[I].Icon.Name,nil);
//            Self.FLocalFilePathList.Add('');
//            Self.FServerFileNameList.Add(Self.lvPictures.Prop.Items[I].Icon.Name);//Name中是服务端相对路径
//            FLocalVideoFilePathList.Add('');
//            Self.FServerVideoUrlList.Add(Self.lvPictures.Prop.Items[I].Icon.Caption);//Caption中是视频链接
//            Self.FServerVideoFileIdList.Add(Self.lvPictures.Prop.Items[I].Icon.Caption);//Caption中是视频链接
//        end;
//
//
//  end;
//end;
//
//procedure TFrameAddPictureListSub.SetIsReadOnly(const Value: Boolean);
//begin
//  if FIsReadOnly<>Value then
//  begin
//    FIsReadOnly := Value;
//
//    //只读,不能编辑
//    Self.btnDelPic.Visible:=not FIsReadOnly;
//    Self.lvPictures.Prop.Items.FindItemByType(sitItem1).Visible:=not FIsReadOnly;
//  end;
//end;
//
//procedure TFrameAddPictureListSub.SetControlValue(ASetting:TFieldControlSetting;APageDataDir,
//                            AImageServerUrl: String;
//                            AValue: Variant;AValueCaption:String;
//                            //要设置多个值,整个字段的记录
//                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);
//var
//  I:Integer;
//  J:Integer;
//
//  AValues:TStringDynArray;
//  AUrls:TStringDynArray;
////  ANameList:TStringList;
//  AUrlList:TStringList;
//
//  AOtherFieldNames:TStringList;
//  AOtherFieldControlProps:TStringList;
//begin
//  SetLength(AValues,0);
//  SetLength(AUrls,0);
//
//
//  AUrlList:=TStringList.Create;
//
//  if AValue<>'' then
//  begin
//    AUrlList.Add(AValue);
//  end;
//
//
//  if (AGetDataIntfResultFieldValueIntf<>nil)
//    and (ASetting.other_field_names<>'')
//    and (ASetting.other_field_controlprops<>'') then
//  begin
//      //存在其他需要提交的值
//      AOtherFieldNames:=TStringList.Create;
//      AOtherFieldControlProps:=TStringList.Create;
//
//
//      AOtherFieldNames.CommaText:=ASetting.other_field_names;
//      AOtherFieldControlProps.CommaText:=ASetting.other_field_controlprops;
//
//      if AOtherFieldControlProps.Count=AOtherFieldNames.Count then
//      begin
//
//        for I := 0 to AOtherFieldNames.Count-1 do
//        begin
//
//            if AGetDataIntfResultFieldValueIntf.GetFieldValue(AOtherFieldNames[I])<>'' then
//            begin
//                AUrlList.Add(AGetDataIntfResultFieldValueIntf.GetFieldValue(AOtherFieldNames[I]));
//            end;
//
//        end;
//      end;
//
//
//      FreeAndNil(AOtherFieldNames);
//      FreeAndNil(AOtherFieldControlProps);
//  end;
//
//
//
//  SetLength(AValues,AUrlList.Count);
//  SetLength(AUrls,AUrlList.Count);
//
//  for I := 0 to AUrlList.Count-1 do
//  begin
////    AValues[0]:=AValue;
////    AUrls[0]:=GetDrawPictureUrl(AImageServerUrl,AValue);
//    AValues[I]:=AUrlList[I];
//    AUrls[I]:=GetDrawPictureUrl(AImageServerUrl,AUrlList[I]);
//  end;
//
//  Self.Init(
//            '',
//            AValues,
//            AUrls,
//            FIsNeedClip,
//            FClipWidth,
//            FClipHeight,
//            FMaxCount,
//            FIsReadOnly);
//
//
//
//  FreeAndNil(AUrlList);
//end;
//
//procedure TFrameAddPictureListSub.SetPropJsonStr(AJsonStr: String);
//begin
//
//end;
//
//procedure TFrameAddPictureListSub.StartCamera(ASelectType:TSelectMediaType);
//begin
//  {$IFDEF USE_NATIVE_SELECTMEDIA}
//
//      {$IFDEF ANDROID}
//      GlobalSelectMediaUIClass:=TAndroidDVSelectMediaUI;
//      {$ENDIF}
//      //移动平台
//      if FSelectCameraDialog=nil then
//      begin
//        FSelectCameraDialog:=TSelectMediaDialog.Create(Self);
//        FSelectCameraDialog.OnSelectMediaResult:=DoSelectMediaResultEvent;
//      end;
//
//      //判断需要上传的类型
//      FSelectCameraDialog.SelectMediaType:=ASelectType;
//
//      //能选择的个数
//      //FSelectCameraDialog.MaxSelectCount:=FMaxCount;
//
//      FSelectCameraDialog.StartCamera;
//
//  {$ELSE}
//  {$ENDIF}
//
//end;
//
//procedure TFrameAddPictureListSub.StartSelect;
//begin
//
//      //
//      HideVirtualKeyboard;
//
//
//      if IsUseMultiSelectPicture then
//      begin
//
//          //多选
//
//          {$IFDEF USE_NATIVE_SELECTMEDIA}
//
//              {$IFDEF ANDROID}
//              GlobalSelectMediaUIClass:=TAndroidDmcBigSelectMediaUI;
//              {$ENDIF}
//              //移动平台
//              if FSelectMediaDialog=nil then
//              begin
//                FSelectMediaDialog:=TSelectMediaDialog.Create(Self);
//                FSelectMediaDialog.OnSelectMediaResult:=DoSelectMediaResultEvent;
//              end;
//
//              //判断需要上传的类型
//              FSelectMediaDialog.SelectMediaType:=FSelectType;
//
//              //能选择的个数
//              FSelectMediaDialog.MaxSelectCount:=FMaxCount;
//
//              FSelectMediaDialog.StartSelect;
//          {$ELSE}
//              //Windows平台模拟
//              HideFrame;
//              //多选照片
//    //          ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
//              ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,DoReturnFrameFromAllImageFrame);
//    //          GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
//              //相机结果回调事件
//              GAllImageFrame.OnGetPhotoFromCamera:=DoAddPictureFromMenu;
//              GAllImageFrame.Load(True,
//                                  Self.lvPictures.Prop.Items.Count-1,
//                                  Self.FMaxCount,
//                                  FSelectType);
//          {$ENDIF}
//
//
//      end
//      else
//      begin
//
//          //单选
//
//          //拍照
//          ShowFrame(TFrame(GlobalTakePictureMenuFrame),TFrameTakePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
////          GlobalTakePictureMenuFrame.FrameHistroy:=CurrentFrameHistroy;
////          //添加
////          if AItem.ItemType=sitItem1 then
////          begin
//            GlobalTakePictureMenuFrame.OnTakedPicture:=DoAddPictureFromMenu;
////          end
////          else
////          //修改
////          if AItem.ItemType=sitDefault then
////          begin
////            FEditPictureItem:=AItem;
////            GlobalTakePictureMenuFrame.OnTakedPicture:=DoEditPictureFromMenu;
////          end;
//          GlobalTakePictureMenuFrame.ShowMenu;
//
//      end;
//
//end;
//
//function TFrameAddPictureListSub.Upload(AImageHttpServerUrl:String;
//                                          var AServerResponse:String):Boolean;
//var
//  APicUploadSucc:Boolean;
//  I: Integer;
//  APicStream:TStream;
//  ARemoteFilePath:String;
//  AVideoUrl:String;
//  AVideoFileId:String;
//begin
//  Result:=False;
//  AServerResponse:='';
//
//  if FNeedUploadCount=0 then
//  begin
//    Result:=True;
//    Exit;
//  end;
//
//
//  APicUploadSucc:=True;
//  //上传图片
//  for I := 0 to Self.FLocalFilePathList.Count-1 do
//  begin
//
//      //没有上传过,没有远程文件名,那么需要上传
//      if FServerFileNameList[I]='' then
//      begin
//
//          APicStream:=TStream(FLocalFileNameAndStreamList.Objects[I]);
//          if APicStream<>nil then
//          begin
//
//              APicUploadSucc:=DoUploadFile(AImageHttpServerUrl,
//                                            APicStream,
//                                            FLocalFileNameAndStreamList[I],
//                                            ARemoteFilePath,
//                                            AServerResponse
//                                            );
//              if APicUploadSucc then
//              begin
//                FServerFileNameList[I]:= ARemoteFilePath;
//
//
//                //成功需要清掉,不成功不用清,下次还要上传呢
//                FLocalFileNameAndStreamList.Objects[I]:=nil;
//                uFuncCommon.FreeAndNil(APicStream);
//              end;
//
//
//              //上传视频
//              if (FLocalVideoFilePathList[I]<>'')
//                  and Assigned(OnCustomUploadVideoFile) then
//              begin
//                  //自定义上传视频
//                  OnCustomUploadVideoFile(
//                                            FLocalVideoFilePathList[I],
//                                            AVideoUrl,
//                                            AVideoFileId,
//                                            AServerResponse,
//                                            Result);
//                  FServerVideoUrlList[I]:=AVideoUrl;
//                  FServerVideoFileIdList[I]:=AVideoFileId;
//              end;
//
//
//
//              if Not APicUploadSucc then
//              begin
//                //图片上传失败
//                //退出循环
//                Exit;
//              end;
//
//          end;
//      end;
//
//      //上传视频
//
//
//  end;
//
//  Result:=True;
//end;
//
//
//initialization
//  RegisterClass(TFrameAddPictureListSub);
//  GetGlobalFrameworkComponentTypeClasses.Add('image_list_edit',TFrameAddPictureListSub,'图片列表编辑框','TFrameAddPictureListSub');
//
//finalization
//  UnRegisterClass(TFrameAddPictureListSub);


end.
