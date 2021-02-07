unit Unit17;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


//  uSelectMediaDialog,

  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
//    uAndroidPermission_D10_2,
  Androidapi.JNI.Widget,
  {$ENDIF}
  System.Messaging,
//  Androidapi.JNI.mediapicker_3_2,
//  Androidapi.JNI.mediapicker_my_utils,
  Androidapi.JNI.mediaselector_1_0_0,
  Androidapi.JNI.glide_glide_4_7_1,

  uFuncCommon,
  uFileCommon,
  FMX.Surfaces,
//  FMX.Helpers.Android,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Notification, FMX.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TJMyRequestListener = class(TJavaLocal,JRequestListener)
  public
    { methods }
    function onLoadFailed(P1: JGlideException; P2: JObject; P3: JTarget; P4: Boolean): Boolean; cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z
    function onResourceReady(P1: JObject; P2: JObject; P3: JTarget; P4: JDataSource; P5: Boolean): Boolean; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z
  end;

  TJMyImageLoader = class(TJavaLocal, JImageLoader)
  public
    FJRequestListener:JRequestListener;
    { methods }
    procedure displayImage(P1: JContext; P2: JString; P3: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
  end;

  TJMyOnSelectMediaListener = class(TJavaLocal,JOnSelectMediaListener)
  public
    procedure onSelectMedia(P1: JList); cdecl; //(Ljava/util/List;)V
  end;

  TForm17 = class(TForm)
    btnInit: TButton;
    Button2: TButton;
    Button3: TButton;
    NotificationCenter1: TNotificationCenter;
    Image1: TImage;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
  private
//    FPickerActivityRequestCode:Integer;
//    FMessageSubscriptionID: integer;

    FJImageLoader:JImageLoader;
    FJOnSelectMediaListener:JOnSelectMediaListener;

//    FJMySimpleBitmapTarget:JMySimpleBitmapTarget;
//    FJMySimpleBitmapTargetEvent:JMySimpleBitmapTargetEvent;
//    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    { Private declarations }
  public
//    FSelectMediaDialog:TSelectMediaDialog;
//    procedure DoSelectMediaResultEvent(Sender:TObject;
//                                    //预览图
//                                    ASelectedPhotoThumbPaths:TStringList;
//                                    //图片原文件
//                                    ASelectedPhotoFilePaths:TStringList;
//                                    //选择的媒体列表
//                                    ASelectMediaList:TSelectMediaList
//                                    );
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.fmx}

procedure TForm17.btnInitClick(Sender: TObject);
begin
  //
//        //设置加载器
//        MediaSelectorManager.getInstance().initImageLoader(new ImageLoader() {
//            @Override
//            public void displayImage(Context context, final String path, ImageView imageView) {
//                Glide.with(context).load(path).listener(new RequestListener<Drawable>() {
//                    @Override
//                    public boolean onLoadFailed(@Nullable GlideException e, Object model, Target<Drawable> target, boolean isFirstResource) {
//                        Log.e(TAG,"加载失败--》"+e.getMessage() + "\t加载地址-->"+path);
//                        return false;
//                    }
//
//                    @Override
//                    public boolean onResourceReady(Drawable resource, Object model, Target<Drawable> target, DataSource dataSource, boolean isFirstResource) {
//                        return false;
//                    }
//                }).into(imageView);
//            }
//        });

  FJImageLoader:=TJMyImageLoader.Create;
  TJMediaSelectorManager.JavaClass.getInstance.initImageLoader(FJImageLoader);

end;

procedure TForm17.Button1Click(Sender: TObject);
begin
//    /**
//     * 默认配置的多选测试
//     */
//    public void defaultConfigMultiSelect(View view){
//
//        //打开界面
//        MediaSelectorManager.openSelectMediaWithConfig(this, MediaSelectorManager.getDefaultListConfigBuilder().build(), new OnSelectMediaListener() {
//            @Override
//            public void onSelectMedia(List<String> li_path) {
//                for (String path : li_path) {
//                    tvResult.append(path + "\n");
//                }
//            }
//        });
//    }
  FMX.Types.Log.d('OrangeUI TForm17.Button1Click Begin');

  FJOnSelectMediaListener:=TJMyOnSelectMediaListener.Create;
  TJMediaSelectorManager.JavaClass.openSelectMediaWithConfig(SharedActivity,
      TJMediaSelectorManager.JavaClass.getDefaultListConfigBuilder.build,
      FJOnSelectMediaListener
      );
  FMX.Types.Log.d('OrangeUI TForm17.Button1Click End');

end;

procedure TForm17.Button2Click(Sender: TObject);
var
  config:JDVListConfig;
begin
//  //
//  FSelectMediaDialog.StartSelect;

  ////最简单的调用
  //MediaSelectorManager.openSelectMediaWithConfig(this, MediaSelectorManager.getDefaultListConfigBuilder().build(), new OnSelectMediaListener() {
  //    @Override
  //    public void onSelectMedia(List<String> li_path) {
  //        for (String path : li_path) {
  //            tvResult.append(path + "\n");
  //        }
  //    }
  //});
  //
  ////自定义配置调用
  //DVListConfig config = MediaSelectorManager.getDefaultListConfigBuilder()
  ////是否多选
  //.multiSelect(true)
  ////最大选择数量
  //.maxNum(9)
  ////最小选择数量
  //.minNum(2)
  ////设置选中图标
  //.checkIconResource(R.mipmap.icon_dv_checked)
  ////设置非选中图标
  //.unCheckIconResource(R.mipmap.icon_dv_unchecked)
  //// 使用沉浸式状态栏
  //.statusBarColor(Color.BLUE)
  ////每行显示的数量
  //.listSpanCount(3)
  ////状态栏的mode
  //.statusBarLightMode(true)
  ////.statusBarDrakMode(true)
  ////设置选择资源的类型
  //.mediaType(DVMediaType.ALL)
  ////设置返回图标
  ////.backResourceId(R.mipmap.icon_back)
  ////设置右边标题
  //.rigntTitleText("所有图片")
  ////设置右边标题文字颜色
  //.rightTitleTextColor(Color.WHITE)
  ////是否显示右边标题
  //.rightTitleVisibility(View.VISIBLE)
  ////设置标题文字
  //.title("资源选择")
  ////设置标题文字颜色
  //.titleTextColor(Color.WHITE)
  ////设置标题背景颜色
  //.titleBgColor(Color.BLUE)
  ////确定按钮文字
  //.sureBtnText("确定")
  ////确定按钮文字颜色
  //.sureBtnTextColor(Color.WHITE)
  ////确定按钮背景色（与Resource只能选择一种）
  ////.sureBtnBgColor(Color.BLUE)
  ////确定按钮所在布局背景色（与color只能选择一种）
  //.sureBtnBgResource(R.drawable.shape_btn_default)
  ////设置文件临时缓存路径
  //.fileCachePath(FileUtils.createRootPath(this))
  ////设置是否包含预览
  //.hasPreview(true)
  ////是否需要快速加载视频缩略图（默认为true从系统直接获取，获取不到使用加载图片框架获取首帧。为false，直接使用加载图片框架获取首帧）
  //.quickLoadVideoThumb(true)
  //.build();
  //
  ////打开界面
  //MediaSelectorManager.openSelectMediaWithConfig(this, config, new OnSelectMediaListener() {
  //    @Override
  //    public void onSelectMedia(List<String> li_path) {
  //        for (String path : li_path) {
  //            tvResult.append(path + "\n");
  //        }
  //    }
  //});
  FMX.Types.Log.d('OrangeUI TForm17.Button2Click Begin');

  FJOnSelectMediaListener:=TJMyOnSelectMediaListener.Create;

  config:=TJMediaSelectorManager.JavaClass.getDefaultListConfigBuilder
    ////是否多选
    .multiSelect(true)
    ////最大选择数量
    .maxNum(9)
    ////最小选择数量
    .minNum(2)
    ////设置选中图标
    //.checkIconResource(R.mipmap.icon_dv_checked)
    ////设置非选中图标
    //.unCheckIconResource(R.mipmap.icon_dv_unchecked)
    // 使用沉浸式状态栏
    .statusBarColor(TJColor.JavaClass.RED)
    //每行显示的数量
    .listSpanCount(3)
    //状态栏的mode
    .statusBarLightMode(true)
    ////.statusBarDrakMode(true)
    //设置选择资源的类型
    .mediaType(TJDVMediaType.JavaClass.ALL)
    ////设置返回图标
    ////.backResourceId(R.mipmap.icon_back)
    //设置右边标题
    .rigntTitleText(StringToJString('所有图片'))
    ////设置右边标题文字颜色
    //.rightTitleTextColor(Color.WHITE)
    ////是否显示右边标题
    //.rightTitleVisibility(View.VISIBLE)
    //设置标题文字
    .title(StringToJString('资源选择'))
    ////设置标题文字颜色
    //.titleTextColor(Color.WHITE)
    //设置标题背景颜色
    .titleBgColor(TJColor.JavaClass.valueOf(0.9,0.9,0.9,1).toArgb)
    ////确定按钮文字
    //.sureBtnText("确定")
    ////确定按钮文字颜色
    //.sureBtnTextColor(Color.WHITE)
    ////确定按钮背景色（与Resource只能选择一种）
    ////.sureBtnBgColor(Color.BLUE)
    ////确定按钮所在布局背景色（与color只能选择一种）
    //.sureBtnBgResource(R.drawable.shape_btn_default)
    ////设置文件临时缓存路径
    //.fileCachePath(FileUtils.createRootPath(this))
    ////设置是否包含预览
    //.hasPreview(true)
    ////是否需要快速加载视频缩略图（默认为true从系统直接获取，获取不到使用加载图片框架获取首帧。为false，直接使用加载图片框架获取首帧）
    //.quickLoadVideoThumb(true)
    .build;

  TJMediaSelectorManager.JavaClass.openSelectMediaWithConfig(SharedActivity,
      config,
      FJOnSelectMediaListener
      );
  FMX.Types.Log.d('OrangeUI TForm17.Button2Click End');



end;

procedure TForm17.Button3Click(Sender: TObject);
var
  ANotification:TNotification;
begin
  ANotification:=Self.NotificationCenter1.CreateNotification;
  ANotification.Title:='1';
  ANotification.AlertBody:='2';
  NotificationCenter1.PresentNotification(ANotification);
end;

//procedure TForm17.DoSelectMediaResultEvent(Sender: TObject;
//  ASelectedPhotoThumbPaths, ASelectedPhotoFilePaths: TStringList;
//  ASelectMediaList: TSelectMediaList);
//begin
//  //
//  Self.Image1.Bitmap.LoadFromFile(ASelectedPhotoThumbPaths[0]);
//end;

procedure TForm17.FormCreate(Sender: TObject);
begin
//  FPickerActivityRequestCode:=GetUniqueAndroidStartActivityForRequestCode('PickerActivity');
//  {$IFDEF ANDROID}
//  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);
//  {$ENDIF ANDROID}


//  FSelectMediaDialog:=TSelectMediaDialog.Create(Self);
//  FSelectMediaDialog.OnSelectMediaResult:=DoSelectMediaResultEvent;
end;

procedure TForm17.FormShow(Sender: TObject);
begin
      //动态申请权限,Const_Android_RequestPermissions在uConst中定义
      //10.2 WILL CRASH
      {$IFDEF ANDROID}
          {$IF RTLVersion>=32}// 10.2+
            PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)],
                  //不能为nil,不然会闪退,RequestPermissions调用两次会闪退
                  procedure(const APermissions: TArray<string>;const AGrantResults: TArray<TPermissionStatus>)
//                  var
//                    I:Integer;
                  begin
//                      //如果允许获取相册,那么先获取,打开相册管理的速度会快一点
//                      for I := 0 to Length(APermissions)-1 do
//                      begin
//                        if APermissions[I]= then
//
//                      end;
                  end);
          {$ELSE}
          {$ENDIF}
      {$ELSE}
      {$ENDIF}


end;

//procedure TForm17.HandleActivityMessage(const Sender: TObject;
//  const M: TMessage);
//  {$IFDEF ANDROID}
//var
//  AMessageResultNotification:TMessageResultNotification;
//  select: JArrayList;
//  I: Integer;
////  AMedia:JMedia;
//  {$ENDIF ANDROID}
//begin
//  FMX.Types.Log.d('OrangeUI TForm17.HandleActivityMessage');
////    OnActivityResult(TMessageResultNotification(M).RequestCode,
////      TMessageResultNotification(M).ResultCode,
////      TMessageResultNotification(M).Value);
//  {$IFDEF ANDROID}
//  if M is TMessageResultNotification then
//  begin
////    AMessageResultNotification:=TMessageResultNotification(M);
////    if (AMessageResultNotification.RequestCode=FPickerActivityRequestCode)
////      and (AMessageResultNotification.ResultCode=TJPickerConfig.JavaClass.RESULT_CODE) then
////    begin
////      FMX.Types.Log.d('OrangeUI TForm17.HandleActivityMessage is FPickerActivityRequestCode');
////
////
////      //if(requestCode==200&&resultCode==PickerConfig.RESULT_CODE){
////      //    select=data.getParcelableArrayListExtra(PickerConfig.EXTRA_RESULT);
////      //    Log.i("select","select.size"+select.size());
////      //    for(Media media:select){
////      //        Log.i("media",media.path);
////      //        Log.e("media","s:"+media.size);
////      //        imageView.setImageURI(Uri.parse(media.path));
////      //    }
////      //}////      select := AMessageResultNotification.Value.getParcelableArrayListExtra(TJPickerConfig.JavaClass.EXTRA_RESULT);
////      //ArrayList<Media> select;
////      FMX.Types.Log.d('OrangeUI TForm17.HandleActivityMessage select count is '+IntToStr(select.size));
////      for I := 0 to select.size-1 do
////      begin
////        AMedia:=TJMedia.Wrap((select.get(I) as ILocalObject).GetObjectID);
////        FMX.Types.Log.d('OrangeUI TForm17.HandleActivityMessage '+JStringToString(AMedia.path));
////        //    { Property }
////        //    property path: JString read _Getpath write _Setpath;
////        //    property name: JString read _Getname write _Setname;
////        //    property extension: JString read _Getextension write _Setextension;
////        //    property time: Int64 read _Gettime write _Settime;
////        //    property mediaType: Integer read _GetmediaType write _SetmediaType;
////        //    property size: Int64 read _Getsize write _Setsize;
////        //    property id: Integer read _Getid write _Setid;
////        //    property parentDir: JString read _GetparentDir write _SetparentDir;
////
//////        //缩略图?
//////        //获取缩略图
//////        FJMySimpleBitmapTargetEvent:=TJMySimpleBitmapTargetEvent.Create;
//////        FJMySimpleBitmapTarget:=TJMySimpleBitmapTarget.JavaClass.Init;
//////        FJMySimpleBitmapTarget.getFileThumb(SharedActivityContext,
//////                                            AMedia.path,
//////                                            FJMySimpleBitmapTargetEvent,
//////                                            nil);
////
////      end;
////
////    end;
//  end;
//  {$ENDIF ANDROID}
//
//end;

//{ TJMySimpleBitmapTargetEvent }
//
//procedure TJMySimpleBitmapTargetEvent.onResourceReady(P1: JDrawable);
//var
//  AJBitmapDrawable:JBitmapDrawable;
////  ABitmapSurface:TBitmapSurface;
//  saveImgOut:JFileOutputStream;
//  AThumbPath:String;
//begin
//  FMX.Types.Log.d('OrangeUI TForm17.TJMySimpleBitmapTargetEvent.onResourceReady '+JStringToString(P1.ToString));
//
//
//  TThread.Synchronize(nil,procedure
//  begin
//
//      //android.graphics.drawable.BitmapDrawable@49b8d2e
//      //
//      //P1
//      AJBitmapDrawable:=TJBitmapDrawable.Wrap((P1 as ILocalObject).GetObjectID);
//
//      AThumbPath:=GetApplicationPath+CreateGUIDString()+'.png';
//      //   FileOutputStream out = new FileOutputStream(f);
//      saveImgOut:=TJFileOutputStream.JavaClass.Init(StringToJString(AThumbPath));
//      //   bm.compress(Bitmap.CompressFormat.PNG, 90, out);
//      AJBitmapDrawable.getBitmap.compress(TJBitmap_CompressFormat.JavaClass.PNG, 90, saveImgOut);
//      //   out.flush();
//      saveImgOut.Flush();
//      //   out.close();
//      saveImgOut.Close();
//
//
//  //    AJBitmapDrawable.getBitmap.
//  //    ABitmapSurface := TBitmapSurface.Create;
//  //    JBitmapToSurface(AJBitmapDrawable.getBitmap,ABitmapSurface);
//  //    Form17.Image1.Bitmap.Assign(ABitmapSurface);
//      Form17.Image1.Bitmap.LoadFromFile(AThumbPath);
//
//
//  end);
//
//
//end;

{ TJMyImageLoader }

procedure TJMyImageLoader.displayImage(P1: JContext; P2: JString;
  P3: JImageView);
begin
  FMX.Types.Log.d('OrangeUI TJMyImageLoader.displayImage Begin');

  FJRequestListener:=TJMyRequestListener.Create;
  TJGlide.JavaClass.&with(P1)
                    .load(P2)
                    .listener(FJRequestListener)
                    .into(P3);

  FMX.Types.Log.d('OrangeUI TJMyImageLoader.displayImage End');

end;

{ TJMyRequestListener }

function TJMyRequestListener.onLoadFailed(P1: JGlideException; P2: JObject;
  P3: JTarget; P4: Boolean): Boolean;
begin
  FMX.Types.Log.d('OrangeUI TJMyRequestListener.onLoadFailed Begin');
//                        Log.e(TAG,"加载失败--》"+e.getMessage() + "\t加载地址-->"+path);
//                        return false;
  Result:=False;
end;

function TJMyRequestListener.onResourceReady(P1, P2: JObject; P3: JTarget;
  P4: JDataSource; P5: Boolean): Boolean;
begin
  FMX.Types.Log.d('OrangeUI TJMyRequestListener.onResourceReady Begin');
  Result:=False;
end;

{ TJMyOnSelectMediaListener }

procedure TJMyOnSelectMediaListener.onSelectMedia(P1: JList);
var
  I: Integer;
begin
  FMX.Types.Log.d('OrangeUI TJMyOnSelectMediaListener.onSelectMedia Begin');


  for I := 0 to P1.size-1 do
  begin
    Form17.Memo1.Lines.Add(JStringToString(TJString.Wrap(P1.get(I))));
  end;

end;

end.
