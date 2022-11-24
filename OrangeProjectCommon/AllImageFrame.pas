//convert pas to utf8 by ¥
unit AllImageFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  uUIFunction,
  uSkinItems,
  uGraphicCommon,
  WaitingFrame,
  uLang,
  uSelectMediaDialog,
  uPhotoManager.Windows,
  uViewPictureListFrame,


  {$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.JNI.Provider,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.Os,
  {$IF RTLVersion>=33}//10.3+
  System.Permissions, //动态权限单元
  {$ENDIF}
  uAndroidPermission_D10_2,
  {$ENDIF}



  uSkinFireMonkeyControl,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyCustomList,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyListView, uSkinFireMonkeyLabel,
  uSkinFireMonkeyItemDesignerPanel, uSkinFireMonkeyPanel, uSkinFireMonkeyImage,
  uSkinListViewType,uDrawPicture, uSkinFireMonkeyButton,
  uSkinFireMonkeyScrollBoxContent, uSkinFireMonkeyScrollBox,
  uSkinFireMonkeyImageListPlayer, System.ImageList, FMX.ImgList, uSkinImageList,
  uSkinFireMonkeyCheckBox,uDrawCanvas,uBaseList,

  uPhotoManager,

  uSkinPicture,uSkinBufferBitmap,
  System.Generics.Collections, uSkinButtonType, uSkinPanelType,
  uSkinCheckBoxType, uSkinImageType, uSkinItemDesignerPanelType,
  uBaseSkinControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinLabelType, uSkinFireMonkeyPopup, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, uFrameContext,
  uSkinMaterial;


type
  TGetPhotoFromCameraEvent=procedure(Sender:TObject;ABitmap:TBitmap) of object;

//  TProtectedThread=class(TThread)
//  end;


  TLoadThumbThread=class(TThread)
  protected
    procedure Execute;override;
  public
//    FIsClearAfterReturn:Boolean;
  end;


  TFrameAllImage = class(TFrame)
    lvAllImg: TSkinFMXListView;
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    ImageListDefault: TSkinImageList;
    pnlItem: TSkinFMXItemDesignerPanel;
    imgItem: TSkinFMXImage;
    cbIsSelected: TSkinFMXCheckBox;
    pnlAlbum: TSkinFMXPanel;
    PopupAlbum: TSkinFMXPopup;
    lvAlbum: TSkinFMXListView;
    dpnlAlbum: TSkinFMXItemDesignerPanel;
    imgAlbumIcon: TSkinFMXImage;
    lblAlbumName: TSkinFMXLabel;
    lblAlbumCount: TSkinFMXLabel;
    btnShowDetail: TSkinFMXButton;
    ActionList: TActionList;
    TakePhotoFromCameraAction: TTakePhotoFromCameraAction;
    tmrLoadThumbBitmap: TTimer;
    btnAlbum: TSkinFMXButton;
    FrameContext1: TFrameContext;
    Timer1: TTimer;
    chkHookMaterial: TSkinCheckBoxColorMaterial;
    chkDefaultFillRectCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    chkDefaultRectCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    chkDefaultCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    procedure FrameResize(Sender: TObject);
    procedure btnImgBackClick(Sender: TObject);
    procedure lvAllImgPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinFMXItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure cbIsSelectedClick(Sender: TObject);
    procedure lvAllImgClickItem(AItem: TSkinItem);
    procedure btnAlbumClick(Sender: TObject);
    procedure lvAlbumClickItem(AItem: TSkinItem);
    procedure btnShowDetailClick(Sender: TObject);
    procedure TakePhotoFromCameraActionDidFinishTaking(Image: TBitmap);
    procedure tmrLoadThumbBitmapTimer(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure lvAllImgResize(Sender: TObject);
    procedure FrameContext1Show(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  public
    //用于图片获取返回后区分操作
    //ItemSelected
    FFlag:String;


    //用于图片预览
    FPictureList: TDrawPictureList;
//    //判断点击的按钮 确定/取消
//    FBtnSure:Boolean;


    //判断是否显示照相机入口
    FIsShowCamera:Boolean;
    //记录已选取的图片数
    FSelectedPhotoCount:Integer;
    //最大选取数量
    FMaxSelectedNum:Integer;

    FNeedLoadThumbBitmapList:TBaseList;

    FLoadThumbThread:TLoadThumbThread;
    FSelectType:TSelectMediaType;
  public
    { Private declarations }
    //相册分类标识  区分显示哪个相册
    FAlbumIndex:Integer;
    FAlbumName:String;
    //选择的原图list
    FSelectedOriginPhotoList:TList<TPhoto>;
  public
    procedure SyncSelectedPictureList;
    procedure GetImage(APhoto:TPhoto);
  public
    //获取到相册列表
    procedure DoGetAlbumList(Sender:TObject);
    //获取到相册的照片列表
    procedure DoGetAlbumPhotoList(Sender:TObject;AAlbum:TAlbum);
    //获取到照片缩略图的回调事件
    procedure DoGetPhotoThumbBitmap(Sender:TObject;APhoto:TPhoto);
    //获取到照片原图的回调事件
    procedure OnGetPhotoOriginBitmap(Sender:TObject;APhoto:TPhoto);
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  public
    //相机照片返回
    OnGetPhotoFromCamera:TGetPhotoFromCameraEvent;
    procedure TakePhotoFromCamera;
  public
    //清除
    procedure Clear;
    //加载
    //    1、是否现实相机按钮
    //    2、已选取的照片数量
    //    3、最大选取照片数-已选取的照片数量=还可以选几张
    procedure Load(AIsShowCamera:Boolean;
                    ASelectedPictureNum:Integer;
                    AMaxSelectedNum:Integer;
                    ASelectType:TSelectMediaType=[smtImage]);
    //加载相册列表到列表
    procedure LoadData(AAlbumList:TAlbumList);

    //返回后清理内存
    procedure ClearAfterReturn;
  end;



var
  GAllImageFrame:TFrameAllImage;

implementation

uses
//  MainForm,
  uFuncCommon,
//  MultiTakePictureMenuFrame,
  ViewPictureListFrame,
  MessageBoxFrame
//  ,ChatFrame
  ;

{$R *.fmx}

procedure TFrameAllImage.btnAlbumClick(Sender: TObject);
begin

  if Not Self.PopupAlbum.IsOpen then
  begin
      Self.PopupAlbum.Width:=Self.lvAllImg.Width;
      Self.PopupAlbum.Height:=Self.lvAllImg.Height-50;
      //设置弹出框绝对位置
      Self.PopupAlbum.PlacementRectangle.Top:=
                  Self.LocalToScreen(PointF(0,Self.pnlToolBar.Height)).Y;
//      Self.PopupAlbum.PlacementRectangle.Left:=
//                  Self.LocalToScreen(PointF(0,Self.pnlToolBar.Height)).X;
      PopupAlbum.PlacementRectangle.Left:=Self.LocalToScreen(
            PointF(Self.btnAlbum.Position.X+Self.btnAlbum.Width/2,
                  Self.btnAlbum.Position.Y)
                  ).X
                  -Self.PopupAlbum.Width/2
//                  -5
                  ;

      Self.PopupAlbum.IsOpen:=True;

      //加载相册列表
      Self.LoadData(GetGlobalAlbumManager.AlbumList);

  end
  else
  begin
      Self.PopupAlbum.IsOpen:=False;
  end;

end;

procedure TFrameAllImage.btnImgBackClick(Sender: TObject);
begin
//  if (Sender as TSkinFMXButton).Caption='确定' then
//  begin
//    Self.FBtnSure:=True;
//  end
//  else
//  begin
//    Self.FBtnSure:=False;
//  end;
  HideFrame;//();
  ReturnFrame();
end;

procedure TFrameAllImage.btnReturnClick(Sender: TObject);
begin
  if IsRepeatClickReturnButton(Self) then Exit;

  ClearOnReturnFrameEvent(Self);

  HideFrame;//();
  ReturnFrame();


  Self.ClearAfterReturn;

end;

procedure TFrameAllImage.btnShowDetailClick(Sender: TObject);
var
  I: Integer;
begin
  Self.FPictureList.Clear(False,True);
  for I := 0 to Self.FSelectedOriginPhotoList.Count-1 do
  begin
    Self.FPictureList.Add(Self.FSelectedOriginPhotoList[I].OriginBitmap);
  end;

  HideFrame;//();
  ShowFrame(TFrame(GlobalViewPictureListFrame),TFrameViewPictureList,Application.MainForm,nil,nil,nil,Application);
//  GlobalViewPictureListFrame.FrameHistroy:=CurrentFrameHistroy;
  //预览图片     更改FOriginPhotoList的类型直接使用的话在程序关闭的时候报错
  GlobalViewPictureListFrame.Init(Trans('照片'),
        Self.FPictureList,
        0,
        nil
        );
end;

procedure TFrameAllImage.cbIsSelectedClick(Sender: TObject);
begin
  //已选取的图片与当前选取的图片之和小于等于最大选取数
  Self.FFlag:='ItemSelected';


  if (FSelectedOriginPhotoList.Count+Self.FSelectedPhotoCount<Self.FMaxSelectedNum)
    and (Not Self.lvAllImg.Prop.InteractiveItem.Selected) then
  begin
    //选择图片,获取大图
    Self.lvAllImg.Prop.InteractiveItem.Selected:=True;
    Self.GetImage(TPhoto(Self.lvAllImg.Prop.InteractiveItem.Data));
  end
  else if (FSelectedOriginPhotoList.Count+Self.FSelectedPhotoCount=Self.FMaxSelectedNum)
    and (Not Self.lvAllImg.Prop.InteractiveItem.Selected) then
  begin
    ShowMessageBoxFrame(Self,Trans('照片数已达上限!'));
  end
  else if Self.lvAllImg.Prop.InteractiveItem.Selected then
  begin
    Self.lvAllImg.Prop.InteractiveItem.Selected:=False;
    Self.GetImage(TPhoto(Self.lvAllImg.Prop.InteractiveItem.Data));
  end;



  //设定预览按钮及确定按钮是否可用
//  if FSelectedOriginPhotoList.Count>0 then
//  begin
////      Self.btnOK.Enabled:=True;
//      Self.btnShowDetail.Enabled:=True;
//
//      Self.btnShowDetail.Caption:=Trans('预览')+'('+IntToStr(FSelectedOriginPhotoList.Count)+')';
//  end
//  else
//  begin
////      Self.btnOK.Enabled:=False;
//      Self.btnShowDetail.Enabled:=False;
//
//      Self.btnShowDetail.Caption:=Trans('预览');
//  end;
  SyncSelectedPictureList;

end;

procedure TFrameAllImage.Clear;
begin
  //默认获取第一个相册的所有图片
  Self.FAlbumIndex:=0;


  FAlbumName:='';


  Self.FSelectedOriginPhotoList.Clear;

  Self.lvAllImg.Prop.Items.BeginUpdate;
  try
    Self.lvAllImg.Prop.Items.Clear(True);
  finally
    Self.lvAllImg.Prop.Items.EndUpdate;
  end;


  //会报错
//  FNeedLoadThumbBitmapList.Clear(False);

//  FreeGlobalAlbumManager;
end;

procedure TFrameAllImage.ClearAfterReturn;
begin
  if FLoadThumbThread<>nil then
  begin
      FLoadThumbThread.Terminate;
      //等待太耗时
    //  FLoadThumbThread.WaitFor;
    //  FreeAndNil(FLoadThumbThread);
      FLoadThumbThread:=nil;
  end;


  Self.Clear;



  if GetGlobalAlbumManager<>nil then
  begin
    //清内存
    GetGlobalAlbumManager.ClearLoadedBitmap;
  end;



//  if FLoadThumbThread<>nil then
//  begin
//    FLoadThumbThread.FIsClearAfterReturn:=True;
//  end;
end;

constructor TFrameAllImage.Create(AOwner: TComponent);
begin
  inherited;
  FSelectedOriginPhotoList:=TList<TPhoto>.Create;
  FPictureList:=TDrawPictureList.Create(ooReference);

  FNeedLoadThumbBitmapList:=TBaseList.Create(ooReference);


  Self.lvAllImg.Prop.Items.BeginUpdate;
  try
    Self.lvAllImg.Prop.Items.Clear(True);
  finally
    Self.lvAllImg.Prop.Items.EndUpdate;
  end;


  Self.pnlToolBar.Material.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;
  Self.pnlAlbum.Material.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameAllImage.Destroy;
begin
  Clear;

  if FLoadThumbThread<>nil then
  begin
    FLoadThumbThread.Terminate;
    FLoadThumbThread.WaitFor;
    FreeAndNil(FLoadThumbThread);
  end;


  FreeAndNil(FSelectedOriginPhotoList);
  FreeAndNil(FPictureList);
  FreeAndNil(FNeedLoadThumbBitmapList);
  inherited;
end;

procedure TFrameAllImage.DoGetAlbumList(Sender: TObject);
var
  I: Integer;
  ATicket:Cardinal;
  ADefaultAlbum:TAlbum;
begin
  try
      if GetGlobalAlbumManager.AlbumList.Count>0 then
      begin



            //获取第一个相册的所有图片
            ATicket:=UIGetTickCount;
            ADefaultAlbum:=nil;
            if Self.FAlbumName<>'' then
            begin
              ADefaultAlbum:=GetGlobalAlbumManager.AlbumList.FindItemByName(FAlbumName);
            end;
            if ADefaultAlbum=nil then
            begin
              ADefaultAlbum:=GetGlobalAlbumManager.AlbumList[FAlbumIndex];
            end;




            FMX.Types.Log.d('OrangeUI TFrameAllImage.SyncPhotoList Begin '+ADefaultAlbum.Name);
            GetGlobalAlbumManager.SyncPhotoList(ADefaultAlbum);
            FMX.Types.Log.d('OrangeUI TFrameAllImage.SyncPhotoList End '+IntToStr(UIGetTickCount-ATicket));


    //        Self.pnlToolBar.Caption:=ADefaultAlbum.Name;
            Self.btnAlbum.Caption:=ADefaultAlbum.Name;
            //计算文本宽度
            Self.btnAlbum.Width:=uSkinBufferBitmap.GetStringWidth(Self.btnAlbum.Caption,15)+20;



    //        //显示照相机入口
    //        if Self.FIsShowCamera then
    //        begin
    //
    //
    ////            //获取所有相册的所有图片(当照片太多的时候太慢了)
    ////            for I := 0 to GetGlobalAlbumManager.AlbumList.Count-1 do
    ////            begin
    ////
    ////                ATicket:=UIGetTickCount;
    ////                FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList Begin '+IntToStr(I)+' '+GetGlobalAlbumManager.AlbumList[I].Name);
    ////                GetGlobalAlbumManager.SyncPhotoList(GetGlobalAlbumManager.AlbumList[I]);
    ////                FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList End '+IntToStr(UIGetTickCount-ATicket));
    ////
    ////            end;
    //
    ////
    ////
    ////            //获取第一个相册的所有图片
    ////            ATicket:=UIGetTickCount;
    ////            FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList Begin '+IntToStr(FAlbumIndex)+' '+GetGlobalAlbumManager.AlbumList[I].Name);
    ////            ADefaultAlbum:=nil;
    ////            if Self.FAlbumName<>'' then
    ////            begin
    ////              ADefaultAlbum:=GetGlobalAlbumManager.AlbumList.FindItemByName(FAlbumName);
    ////            end;
    ////            if ADefaultAlbum=nil then
    ////            begin
    ////              ADefaultAlbum:=GetGlobalAlbumManager.AlbumList[FAlbumIndex];
    ////            end;
    ////            GetGlobalAlbumManager.SyncPhotoList();
    ////            FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList End '+IntToStr(UIGetTickCount-ATicket));
    ////
    //
    //            Self.pnlToolBar.Caption:='所有图片';
    //            Self.btnAlbum.Caption:='所有图片';
    //
    //
    //        end
    //        else
    //        begin
    //
    //
    //            //获取第一个相册的所有图片
    //            ATicket:=UIGetTickCount;
    //            FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList Begin '+IntToStr(FAlbumIndex)+' '+GetGlobalAlbumManager.AlbumList[I].Name);
    //            GetGlobalAlbumManager.SyncPhotoList(GetGlobalAlbumManager.AlbumList[FAlbumIndex]);
    //            FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetAlbumList End '+IntToStr(UIGetTickCount-ATicket));
    //
    //            Self.pnlToolBar.Caption:=GetGlobalAlbumManager.AlbumList[FAlbumIndex].Name;
    //            Self.btnAlbum.Caption:=GetGlobalAlbumManager.AlbumList[FAlbumIndex].Name;
    //
    //
    //        end;







            //  //保存相册列表数据
            //  FAlbumList.Clear;
            //  for I := 0 to GetGlobalAlbumManager.AlbumList.Count-1 do
            //  begin
            //    if GetGlobalAlbumManager.AlbumList[I].Name='Camera' then
            //    begin
            //      GetGlobalAlbumManager.AlbumList[I].Name:='相机';
            //    end
            //    else if GetGlobalAlbumManager.AlbumList[I].Name='WeiXin' then
            //    begin
            //      GetGlobalAlbumManager.AlbumList[I].Name:='微信';
            //    end
            //    else if GetGlobalAlbumManager.AlbumList[I].Name='qq' then
            //    begin
            //      GetGlobalAlbumManager.AlbumList[I].Name:='QQ';
            //    end
            //    else if GetGlobalAlbumManager.AlbumList[I].Name='Screenshots' then
            //    begin
            //      GetGlobalAlbumManager.AlbumList[I].Name:='截图';
            //    end;
            //  end;


      end;
  finally
    HideWaitingFrame();
  end;
end;

procedure TFrameAllImage.DoGetAlbumPhotoList(Sender: TObject; AAlbum: TAlbum);
var
  I: Integer;
  APhoto:TPhoto;
  AListViewItem:TSkinListViewItem;
begin
  //把相册的照片添加到ListView上面
//  if (Self.FIsShowCamera) and (Self.FAlbumIndex=0) then
//  begin
//    Self.pnlToolBar.Caption:='所有图片';
//    Self.btnAlbum.Caption:='所有图片';
//  end
//  else
//  begin
//    Self.pnlToolBar.Caption:=AAlbum.Name;

//    Self.btnAlbum.Caption:=AAlbum.Name;

//  end;




  Self.btnAlbum.Caption:=AAlbum.Name;
  //计算文本宽度
  Self.btnAlbum.Width:=uSkinBufferBitmap.GetStringWidth(Self.btnAlbum.Caption,15)+20;



  //清空选中图片列表
  if FSelectedOriginPhotoList.Count>0 then
  begin
    FSelectedOriginPhotoList.Clear;
    //恢复默认设置
    Self.btnOK.Enabled:=False;
    Self.btnShowDetail.Enabled:=False;
    Self.btnShowDetail.Caption:=Trans('预览');
  end;




  Self.lvAllImg.Prop.Items.BeginUpdate;
  try
          Self.lvAllImg.Prop.Items.Clear;

//    if (Self.FIsShowCamera) and (Self.FAlbumIndex=0) then
//    begin

            //添加拍照键
//          //沒添加过才添加
//          if Self.lvAllImg.Prop.Items.Count<1 then
//          begin
            AListViewItem:=Self.lvAllImg.Prop.Items.Add;
            AListViewItem.ItemType:=sitItem1;
            AListViewItem.Caption:=Trans('拍照');
            AListViewItem.Icon.Assign(Self.ImageListDefault.PictureList.Items[1]);
//          end;



//          for I := 0 to GetGlobalAlbumManager.AllPhotoList.Count-1 do
//          begin
//            AListViewItem:=Self.lvAllImg.Prop.Items.Add;
//            AListViewItem.ItemType:=sitDefault;
//            AListViewItem.Caption:=GetGlobalAlbumManager.AllPhotoList[I].Name;
//            AListViewItem.Data:=GetGlobalAlbumManager.AllPhotoList[I];
//          end;
//    end
//    else
//    begin
//          FNeedLoadThumbBitmapList.Clear(False);
          
          
          for I := 0 to AAlbum.PhotoList.Count-1 do
          begin
            APhoto:=AAlbum.PhotoList[I];
            
            AListViewItem:=Self.lvAllImg.Prop.Items.Add;
            AListViewItem.ItemType:=sitDefault;
            AListViewItem.Caption:=APhoto.Name;
            AListViewItem.Data:=APhoto;


//            //先预加载200张
//            if I<200 then
//            begin
//                //用定时器去获取,避免太卡,如果能用线程就更好
//                if FNeedLoadThumbBitmapList.IndexOf(AAlbum.PhotoList[I])=-1 then
//                begin
//                  FNeedLoadThumbBitmapList.Add(AAlbum.PhotoList[I]);
//                end;
//            end;


            if //AItem.Icon.IsEmpty
      //        and
//              (AItem.Icon.RefPicture=nil)
//              and 
              Not APhoto.IsLoadingThumbBitmap
              and APhoto.IsLoadedThumbBitmap
      //        and (APhoto.ThumbBitmap<>nil)
      //        and (Not APhoto.ThumbBitmap.IsEmpty)
              then
            begin
              AListViewItem.Icon.StaticRefPicture:=APhoto.ThumbBitmap;
            end;

            
          end;


          
//    end;
  finally
    Self.lvAllImg.Prop.Items.EndUpdate;
  end;


  Self.lvAllImg.VertScrollBar.Prop.Position:=0;
  Self.lvAllImg.Invalidate;
end;

procedure TFrameAllImage.DoGetPhotoThumbBitmap(Sender: TObject; APhoto: TPhoto);
var
  I:Integer;
  AListViewItem:TSkinListViewItem;
begin
  FMX.Types.Log.d('OrangeUI TFrameAllImage.DoGetPhotoThumbBitmap');
  //在OnPrepareDrawItem事件中会加载,将APhoto中的ThumbBitmap赋给Item.Icon.RefPicture


  
  for I := 0 to Self.lvAllImg.Prop.Items.Count-1 do
  begin
    AListViewItem:=Self.lvAllImg.Prop.Items[I];
    if (TPhoto(AListViewItem.Data)=APhoto) then
    begin
        AListViewItem.Icon.StaticRefPicture:=APhoto.ThumbBitmap;
        Break;
    end;
  end;

  TThread.Synchronize(nil,procedure
  begin
    lvAllImg.Invalidate;
  end);


//  TThread.Synchronize(nil,
//  procedure
//  var
//    I:Integer;
//    AListViewItem:TSkinListViewItem;
//  begin
//      for I := 0 to Self.lvAllImg.Prop.Items.Count-1 do
//      begin
//        if Self.lvAllImg.Prop.Items[I].ItemType=sitDefault then
//        begin
//          if (TPhoto(Self.lvAllImg.Prop.Items[I].Data).Name=APhoto.Name)
//          and (Self.lvAllImg.Prop.Items[I].Icon.IsEmpty)
//          and (APhoto.ThumbBitmap<>nil)
//          and Not (APhoto.ThumbBitmap.IsEmpty)
//          then
//          begin
//            Self.lvAllImg.Prop.Items[I].Icon.Assign(APhoto.ThumbBitmap);
//          end;
//        end;
//      end;
//  end);
end;

procedure TFrameAllImage.FrameContext1Show(Sender: TObject);
begin
  //是主动Show的
  if Self.FrameContext1.IsReturnShow then Exit;


  //切换动画后
  //加载页面数据
  //获取相册列表
  if GetGlobalAlbumManager<>nil then
  begin

      //获取相册列表  注册回调事件
      //获取到了相册列表
      GetGlobalAlbumManager.OnGetAlbumList:=GAllImageFrame.DoGetAlbumList;
      //获取到了相册中的图片列表
      GetGlobalAlbumManager.OnGetAlbumPhotoList:=GAllImageFrame.DoGetAlbumPhotoList;
      //获取到了图片的缩略图
      GetGlobalAlbumManager.OnGetPhotoThumbBitmap:=GAllImageFrame.DoGetPhotoThumbBitmap;
      //获取到了图片的原图
      GetGlobalAlbumManager.OnGetPhotoOriginBitmap:=GAllImageFrame.OnGetPhotoOriginBitmap;



      ShowWaitingFrame(nil,Trans('加载中...'));
      FMX.Types.Log.d('OrangeUI GetGlobalAlbumManager.SyncAlbumList Begin');
      //刷新相册列表,并且获取第一个相册中的所有图片列表
      GetGlobalAlbumManager.SyncAlbumListInThread;
      FMX.Types.Log.d('OrangeUI GetGlobalAlbumManager.SyncAlbumList End');

  end
  else
  begin

      ShowMessage('不存在GlobalAlbumManager!');

  end;



  //延迟加载缩略图的线程
  if FLoadThumbThread=nil then
  begin
    FLoadThumbThread:=TLoadThumbThread.Create(False);
  end;

end;

procedure TFrameAllImage.FrameResize(Sender: TObject);
begin
  //每行显示四张图片
  Self.lvAllImg.Prop.ItemWidth:=Self.Width/4;
  Self.lvAllImg.Prop.ItemHeight:=Self.Width/4;
end;

procedure TFrameAllImage.GetImage(APhoto: TPhoto);
begin
  //加载原图
  if Not APhoto.IsLoadingOriginBitmap
    and Not APhoto.IsLoadedOriginBitmap then
  begin
      //加载原图
      APhoto.LoadOriginBitmap;
  end
  else if FFlag='ItemSelected' then
  begin
      if FSelectedOriginPhotoList.IndexOf(APhoto)<>-1 then
      begin
        FSelectedOriginPhotoList.Delete(FSelectedOriginPhotoList.IndexOf(APhoto));
      end
      else
      begin
        FSelectedOriginPhotoList.Add(APhoto);
      end;
  end;

  if Not APhoto.IsLoadingOriginBitmap
    and APhoto.IsLoadedOriginBitmap
    and (APhoto.OriginBitmap<>nil)
    and (Not APhoto.OriginBitmap.IsEmpty) then
  begin
    if FFlag='ClickItem' then
    begin
      if FPictureList.Count>0 then FPictureList.Clear(False,True);
      FPictureList.Add(APhoto.OriginBitmap);

      GlobalViewPictureListFrame.Init(Trans('照片'),
        FPictureList,
        0,
        nil
        );
    end;
  end;

end;

procedure TFrameAllImage.Load(AIsShowCamera:Boolean;
                              ASelectedPictureNum,
                              AMaxSelectedNum:Integer;
                              ASelectType:TSelectMediaType=[smtImage]);
begin
  Clear;


  //从相册选取照片时是否显示相机入口
  Self.FIsShowCamera:=AIsShowCamera;
  Self.FSelectedPhotoCount:=ASelectedPictureNum;
  Self.FMaxSelectedNum:=AMaxSelectedNum;
  FSelectType:=ASelectType;


  //隐藏弹出框
  Self.PopupAlbum.IsOpen:=False;


  //默认获取第一个相册的所有图片
  Self.FAlbumIndex:=0;
  FAlbumName:='';
  {$IFDEF IOS}
  Self.FAlbumName:=Trans('相机胶卷');
  {$ENDIF IOS}
  {$IFDEF Android}
  Self.FAlbumName:=Trans('最近照片');
  {$ENDIF Android}


  Self.FSelectedOriginPhotoList.Clear;

  //会报错
  //FNeedLoadThumbBitmapList.Clear(False);

end;

procedure TFrameAllImage.LoadData(AAlbumList: TAlbumList);
var
  I:Integer;
  AListViewItem:TSkinListViewItem;
begin
  Self.lvAlbum.Prop.Items.BeginUpdate;
  try
    Self.lvAlbum.Prop.Items.Clear;

    for I := 0 to AAlbumList.Count-1 do
    begin
      AListViewItem:=Self.lvAlbum.Prop.Items.Add;
      AListViewItem.Caption:=AAlbumList[I].Name;
      AListViewItem.Detail:=IntToStr(AAlbumList[I].PhotoList.Count)+Trans('张');
      AListViewItem.Data:=AAlbumList[I];

      if (AAlbumList[I].AlbumIcon<>nil)
        and (Not AAlbumList[I].AlbumIcon.IsEmpty) then
      begin
        AListViewItem.Icon.Assign(AAlbumList[I].AlbumIcon);
      end;
    end;

//    //所有相册分类
//    if Self.FIsShowCamera then
//    begin
//      AListViewItem:=Self.lvAlbum.Prop.Items.Insert(0);
//      AListViewItem.Caption:='所有图片';
//      AListViewItem.Detail:=IntToStr(GetGlobalAlbumManager.AllPhotoList.Count)+'张';
//      if (AAlbumList[0].AlbumIcon<>nil)
//        and (Not AAlbumList[0].AlbumIcon.IsEmpty) then
//      begin
//        AListViewItem.Icon.Assign(AAlbumList[0].AlbumIcon);
//      end;
//    end;

  finally
    Self.lvAlbum.Prop.Items.EndUpdate;
  end;

end;

procedure TFrameAllImage.lvAlbumClickItem(AItem: TSkinItem);
begin
//  if AItem.Caption='所有图片' then
//  begin
//      Self.FAlbumIndex:=0;
//      Self.DoGetAlbumPhotoList(nil,nil);
//  end
//  else
//  begin


    Self.FAlbumIndex:=GetGlobalAlbumManager.AlbumList.IndexOf(TAlbum(AItem.Data));
    if Self.FIsShowCamera then Self.FAlbumIndex:=Self.FAlbumIndex+1;
    GetGlobalAlbumManager.SyncPhotoList(TAlbum(AItem.Data));


//  end;

  Self.PopupAlbum.IsOpen:=False;
end;

procedure TFrameAllImage.lvAllImgClickItem(AItem: TSkinItem);
begin
  if AItem.ItemType=sitItem1 then
  begin

      {$IFDEF ANDROID}
      PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.CAMERA)],
            //不能为nil,不然会闪退,RequestPermissions调用两次会闪退
          procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
            const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
            var
              I:Integer;
            begin
                //如果允许获取相册,那么先获取,打开相册管理的速度会快一点
                for I := 0 to Length(AGrantResults)-1 do
                begin
                  if (I=Length(AGrantResults)-1) and (AGrantResults[I]=TPermissionStatus.Granted) then
                  begin
                    //打开相机
                    TakePhotoFromCamera;
                    Break;
                  end;
                end;
            end);
      {$ELSE}
      //打开相机
      TakePhotoFromCamera;
      {$ENDIF}

  end
  else
  begin
      HideFrame;//();
      ShowFrame(TFrame(GlobalViewPictureListFrame),TFrameViewPictureList,Application.MainForm,nil,nil,nil,Application);
//      GlobalViewPictureListFrame.FrameHistroy:=CurrentFrameHistroy;
      //查看原图
      FFlag:='ClickItem';
      Self.GetImage(TPhoto(AItem.Data));


  end;
end;

procedure TFrameAllImage.lvAllImgPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
var
  APhoto:TPhoto;
  I: Integer;
  AIsNew:Boolean;
  ANewItem:TSkinItem;
begin

  AIsNew:=False;

  if AItem.ItemType<>sitItem1 then
  begin
      APhoto:=TPhoto(AItem.Data);

      //加载缩略图
      if AItem.Icon.IsEmpty
        //没有正在加载缩略图
        and Not APhoto.IsLoadingThumbBitmap
        //没有加载过缩略图
        and Not APhoto.IsLoadedThumbBitmap then
      begin
  //        //这里取缩略图会卡
  //        APhoto.LoadThumbBitmap;

          //用定时器去获取,避免太卡,如果能用线程就更好
          if FNeedLoadThumbBitmapList.IndexOf(APhoto)=-1 then
          begin
              FNeedLoadThumbBitmapList.Add(APhoto);

              //加载没有显示出来的,增加用户体验,先加载好,表示加载速度快嘛
              if AItem.Index
                  <=TSkinCustomListDefaultType(lvAllImg.SkinControlType).FDrawEndIndex
                      -lvAllImg.Prop.ColCount then
              begin
                AIsNew:=True;
              end;
          end;


      end;



      

      if AIsNew then
      begin
            //预加载10个Item
            for I := AItem.Index to AItem.Index+20 do
            begin
              if I<lvAllImg.Prop.Items.Count then
              begin
                  ANewItem:=lvAllImg.Prop.Items[I];
                  APhoto:=TPhoto(ANewItem.Data);


                  //加载缩略图
                  if ANewItem.Icon.IsEmpty
                    //没有正在加载缩略图
                    and Not APhoto.IsLoadingThumbBitmap
                    //没有加载过缩略图
                    and Not APhoto.IsLoadedThumbBitmap then
                  begin

                      //用定时器去获取,避免太卡,如果能用线程就更好
                      if FNeedLoadThumbBitmapList.IndexOf(APhoto)=-1 then
                      begin
                          FNeedLoadThumbBitmapList.Add(APhoto);
                      end;

                  end;

              end;
            end;

      end;


      


//      if //AItem.Icon.IsEmpty
////        and
//        (AItem.Icon.RefPicture=nil)
//        and Not APhoto.IsLoadingThumbBitmap
//        and APhoto.IsLoadedThumbBitmap
////        and (APhoto.ThumbBitmap<>nil)
////        and (Not APhoto.ThumbBitmap.IsEmpty)
//        then
//      begin
//        AItem.Icon.StaticRefPicture:=APhoto.ThumbBitmap;
//      end;


  end;
end;

procedure TFrameAllImage.lvAllImgResize(Sender: TObject);
begin
  Self.lvAllImg.Prop.ItemHeight:=
      (Self.lvAllImg.Width-2*Self.lvAllImg.Prop.ItemSpace)/3;
end;

procedure TFrameAllImage.OnGetPhotoOriginBitmap(Sender: TObject; APhoto: TPhoto);
begin
  if FFlag='ClickItem' then
  begin
      if FPictureList.Count>0 then FPictureList.Clear(False,True);
      FPictureList.Add(APhoto.OriginBitmap);

      GlobalViewPictureListFrame.Init(Trans('照片'),
        FPictureList,
        0,
        nil
        );
  end;

  if FFlag='ItemSelected' then
  begin
      //选中一张图片
      if FSelectedOriginPhotoList.IndexOf(APhoto)<>-1 then
      begin
        FSelectedOriginPhotoList.Delete(FSelectedOriginPhotoList.IndexOf(APhoto));
      end
      else
      begin
        FSelectedOriginPhotoList.Add(APhoto);
      end;
  end;

  
  TThread.Synchronize(nil,procedure
  begin
    lvAllImg.Invalidate;

    SyncSelectedPictureList;

  end);
end;

procedure TFrameAllImage.SyncSelectedPictureList;
begin
  //设定预览按钮及确定按钮是否可用
  if FSelectedOriginPhotoList.Count>0 then
  begin
      Self.btnOK.Enabled:=True;
      Self.btnShowDetail.Enabled:=True;

      Self.btnShowDetail.Caption:=Trans('预览')+'('+IntToStr(FSelectedOriginPhotoList.Count)+')';
  end
  else
  begin
      Self.btnOK.Enabled:=False;
      Self.btnShowDetail.Enabled:=False;

      Self.btnShowDetail.Caption:=Trans('预览');
  end;

end;

procedure TFrameAllImage.TakePhotoFromCamera;
var
  Image:TBitmap;
  OpenDialog: TOpenDialog;
  APhoto:TPhoto;
//  I: Integer;
begin
  //拍照
  {$IFDEF MSWINDOWS}
  OpenDialog := TOpenDialog.Create(nil);
  try
    //'All Files (*.bmp;*.jpg;*.jpeg;*.png;*.gif;*.tif;*.tiff;*.ico;*.hdp)|*.bmp;*.jpg;*.jpeg;*.png;*.gif;*.tif;*.tiff;*.ico;*.hdp|Bitmaps (*.bmp)|*.bmp|JPEG Images (*.jpg)|*.jpg|JPEG Images (*.jpeg)|*.jpeg|PNG Images (*.png)|*.png|GIF Images (*.gif)|*.gif|TIFF Images (*.tif)|*.tif|TIFF Images (*.tiff)|*.tiff|Icons (*.ico)|*.ico|WMP Images (*.hdp)|*.hdp'
    if (smtImage in FSelectType) and (smtVideo in FSelectType) then
    begin
        OpenDialog.Filter := TBitmapCodecManager.GetFilterString
                              +'|Video (*.mp4)|*.mp4';
    end
    else if (smtImage in FSelectType) then
    begin
        OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
    end
    else if (smtVideo in FSelectType) then
    begin
        OpenDialog.Filter := 'Video (*.mp4)|*.mp4';
    end;
//    case Self.FSelectType of
//      smtImage:
//      begin
//        OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
//      end;
//      smtImageVideo:
//      begin
//        OpenDialog.Filter := TBitmapCodecManager.GetFilterString
//                              +'|Video (*.mp4)|*.mp4';
//      end;
//      smtVideo:
//      begin
//        OpenDialog.Filter := 'Video (*.mp4)|*.mp4';
//      end;
//    end;


    OpenDialog.Options:=OpenDialog.Options+[TOpenOption.ofAllowMultiSelect];
    if OpenDialog.Execute then
    begin
//      for I := 0 to OpenDialog.Files.Count-1 do
//      begin
//        Image:=TBitmap.CreateFromFile(OpenDialog.FileName);//Files[I]);





            //选择的原图list
            //FSelectedOriginPhotoList:TList<TPhoto>;
            APhoto:=TWindowsPhoto.Create(nil);
            APhoto.OriginFilePath:=OpenDialog.FileName;
            APhoto.IsVideo:=IsVideoFile(APhoto.OriginFilePath);

  //          OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
  //          if OpenDialog.Execute then
  //          begin



            APhoto.ThumbFilePath:=OpenDialog.FileName;
            if APhoto.IsVideo then
            begin
              APhoto.ThumbFilePath:='C:\preview.png';
            end;


            APhoto.LoadThumbBitmap;
            //APhoto.LoadOriginBitmap;




            FSelectedOriginPhotoList.Add(APhoto);

            HideFrame;
            ReturnFrame;

//          end;





//        TakePhotoFromCameraActionDidFinishTaking(Image);
//        if Assigned(OnGetPhotoFromCamera) then
//        begin
//          OnGetPhotoFromCamera(Self,Image);
//        end;
//        FreeAndNil(Image);
//      end;
    end;
  finally
    FreeAndNil(OpenDialog);
  end;
  {$ENDIF}
  {$IFNDEF MSWINDOWS}
  TakePhotoFromCameraAction.ExecuteTarget(Self);
  {$ENDIF}

end;

procedure TFrameAllImage.TakePhotoFromCameraActionDidFinishTaking(
  Image: TBitmap);
begin

  HideFrame;
  ReturnFrame;


  if Assigned(OnGetPhotoFromCamera) then
  begin
    OnGetPhotoFromCamera(nil,Image);
  end;
end;

procedure TFrameAllImage.Timer1Timer(Sender: TObject);
begin
  Self.lvAllImg.Invalidate;
end;

procedure TFrameAllImage.tmrLoadThumbBitmapTimer(Sender: TObject);
var
  I: Integer;
  APhoto:TPhoto;
begin
  for I := 0 to FNeedLoadThumbBitmapList.Count-1 do
  begin
      //每次只取一张图片的缓存
      APhoto:=TPhoto(FNeedLoadThumbBitmapList[I]);
      if Not APhoto.IsLoadingThumbBitmap
        and not APhoto.IsLoadedThumbBitmap then
      begin
          APhoto.LoadThumbBitmap;
          Break;
      end
      else
      begin
          //已经在加载缩略图了

      end;
  end;



//  for I := FNeedLoadThumbBitmapList.Count-1 downto 0 do
  for I := 0 to FNeedLoadThumbBitmapList.Count-1 do
  begin
      APhoto:=TPhoto(FNeedLoadThumbBitmapList[I]);
      //已经取到缓存的从列表中删除
      if Not APhoto.IsLoadingThumbBitmap
        and APhoto.IsLoadedThumbBitmap
//        and (APhoto.ThumbBitmap<>nil)
//        and (Not APhoto.ThumbBitmap.IsEmpty)
        then
      begin
          FNeedLoadThumbBitmapList.Remove(APhoto,False);
          Break;
      end;
  end;



end;

{ TLoadThumbThread }

procedure TLoadThumbThread.Execute;
var
  I: Integer;
  APhoto:TPhoto;
begin
  while not Self.Terminated do
  begin
      if (GAllImageFrame.FNeedLoadThumbBitmapList.Count>0)
        and (GetGlobalAlbumManager.AllPhotoList.Count>0) then
      begin

          //存在要加载的图片
          I:=0;
          while (I<GAllImageFrame.FNeedLoadThumbBitmapList.Count)
            and (GetGlobalAlbumManager.AllPhotoList.Count>0)
            and not Self.Terminated do
          begin
              //每次只取一张图片的缓存
              APhoto:=TPhoto(GAllImageFrame.FNeedLoadThumbBitmapList[I]);
              if
                //没有被清掉
                (GetGlobalAlbumManager.AllPhotoList.IndexOf(APhoto)<>-1)
                and Not APhoto.IsLoadingThumbBitmap
                and not APhoto.IsLoadedThumbBitmap then
              begin
                  APhoto.LoadThumbBitmap;
                  //防止占用太多CPU
                  Sleep(1);
              end
              else
              begin
                  //已经在加载缩略图了

              end;

              Inc(I);
          end;


          GAllImageFrame.FNeedLoadThumbBitmapList.Clear(False);



//          if FIsClearAfterReturn then
//          begin
//            //清一下内存
//            FIsClearAfterReturn:=False;
//
//            TThread.Synchronize(nil,procedure
//            begin
//              GAllImageFrame.Clear;
//              GetGlobalAlbumManager.Clear;
//            end);
//          end;

      end
      else
      begin
          Sleep(500);
      end;
  end;

end;

end.
