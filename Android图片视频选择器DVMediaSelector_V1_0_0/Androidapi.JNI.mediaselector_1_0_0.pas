//Code Fix By [金华]DelphiTeacher(452330643)

//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2020-11-14 09:23:27
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.mediaselector_1_0_0;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.GraphicsContentViewText, 
  Androidapi.JNI.Hardware, 
  Androidapi.JNI.Widget, 
//  Androidapi.JNI.android.animation.ValueAnimator,
//  Androidapi.JNI.android.animation.Animator,
  Androidapi.JNI.Util,
  Androidapi.JNI.Media, 
  Androidapi.JNI.Support, 
  Androidapi.JNI.App, 
  Androidapi.JNI.Net, 
  Androidapi.JNI.os;


type

// ===== Forward declarations =====

//  Ja = interface; //com.devil.library.camera.a.a
//  Jb = interface; //com.devil.library.camera.a.b
//  Jc = interface; //com.devil.library.camera.a.c
//  Jd = interface; //com.devil.library.camera.a.d
//  Je = interface; //com.devil.library.camera.a.e
//  Jf = interface; //com.devil.library.camera.a.f
//  Ja_1 = interface; //com.devil.library.camera.a$1
//  Ja_2 = interface; //com.devil.library.camera.a$2
//  Ja_3 = interface; //com.devil.library.camera.a$3
//  Ja_a = interface; //com.devil.library.camera.a$a
//  Ja_b = interface; //com.devil.library.camera.a$b
//  Ja_c = interface; //com.devil.library.camera.a$c
//  Ja_d = interface; //com.devil.library.camera.a$d
//  Ja_e = interface; //com.devil.library.camera.a$e
//  Ja_014 = interface; //com.devil.library.camera.a
//  Ja_015 = interface; //com.devil.library.camera.b.a
//  Jb_016 = interface; //com.devil.library.camera.b.b
//  Jc_017 = interface; //com.devil.library.camera.b.c
//  Jd_1 = interface; //com.devil.library.camera.b.d$1
//  Jd_2 = interface; //com.devil.library.camera.b.d$2
//  Jd_020 = interface; //com.devil.library.camera.b.d
//  Je_021 = interface; //com.devil.library.camera.b.e
//  Ja_022 = interface; //com.devil.library.camera.c.a
//  Jb_1 = interface; //com.devil.library.camera.c.b$1
//  Jb_a = interface; //com.devil.library.camera.c.b$a
//  Jb_025 = interface; //com.devil.library.camera.c.b
//  Jc_026 = interface; //com.devil.library.camera.c.c
//  Jd_027 = interface; //com.devil.library.camera.c.d
//  Je_028 = interface; //com.devil.library.camera.c.e
//  Jf_029 = interface; //com.devil.library.camera.c.f
//  Jg = interface; //com.devil.library.camera.c.g
//  JCaptureButton_1 = interface; //com.devil.library.camera.CaptureButton$1
//  JCaptureButton_2 = interface; //com.devil.library.camera.CaptureButton$2
//  JCaptureButton_3 = interface; //com.devil.library.camera.CaptureButton$3
//  JCaptureButton_4 = interface; //com.devil.library.camera.CaptureButton$4
//  JCaptureButton_5 = interface; //com.devil.library.camera.CaptureButton$5
//  JCaptureButton_a = interface; //com.devil.library.camera.CaptureButton$a
//  JCaptureButton_b = interface; //com.devil.library.camera.CaptureButton$b
  JCaptureButton = interface; //com.devil.library.camera.CaptureButton
//  JCaptureLayout_1 = interface; //com.devil.library.camera.CaptureLayout$1
//  JCaptureLayout_2 = interface; //com.devil.library.camera.CaptureLayout$2
//  JCaptureLayout_3 = interface; //com.devil.library.camera.CaptureLayout$3
//  JCaptureLayout_4 = interface; //com.devil.library.camera.CaptureLayout$4
//  JCaptureLayout_5 = interface; //com.devil.library.camera.CaptureLayout$5
//  JCaptureLayout_6 = interface; //com.devil.library.camera.CaptureLayout$6
//  JCaptureLayout_7 = interface; //com.devil.library.camera.CaptureLayout$7
  JCaptureLayout = interface; //com.devil.library.camera.CaptureLayout
//  Ja_047 = interface; //com.devil.library.camera.d.a
  JFoucsView = interface; //com.devil.library.camera.FoucsView
//  JJCameraView_1 = interface; //com.devil.library.camera.JCameraView$1
//  JJCameraView_2 = interface; //com.devil.library.camera.JCameraView$2
//  JJCameraView_3_1 = interface; //com.devil.library.camera.JCameraView$3$1
//  JJCameraView_3 = interface; //com.devil.library.camera.JCameraView$3
//  JJCameraView_4 = interface; //com.devil.library.camera.JCameraView$4
//  JJCameraView_5 = interface; //com.devil.library.camera.JCameraView$5
//  JJCameraView_6 = interface; //com.devil.library.camera.JCameraView$6
//  JJCameraView_7_1 = interface; //com.devil.library.camera.JCameraView$7$1
//  JJCameraView_7 = interface; //com.devil.library.camera.JCameraView$7
//  JJCameraView_8 = interface; //com.devil.library.camera.JCameraView$8
//  JJCameraView_9_1 = interface; //com.devil.library.camera.JCameraView$9$1
//  JJCameraView_9_2 = interface; //com.devil.library.camera.JCameraView$9$2
//  JJCameraView_9 = interface; //com.devil.library.camera.JCameraView$9
  JJCameraView = interface; //com.devil.library.camera.JCameraView
  JReturnButton = interface; //com.devil.library.camera.ReturnButton
  JTypeButton = interface; //com.devil.library.camera.TypeButton
//  Ja_a_065 = interface; //com.devil.library.media.a.a$a
//  Ja_066 = interface; //com.devil.library.media.a.a
//  Jb_1_067 = interface; //com.devil.library.media.a.b$1
//  Jb_2 = interface; //com.devil.library.media.a.b$2
//  Jb_a_069 = interface; //com.devil.library.media.a.b$a
//  Jb_070 = interface; //com.devil.library.media.a.b
//  Jc_071 = interface; //com.devil.library.media.a.c
//  Ja_1_072 = interface; //com.devil.library.media.b.a$1
//  Ja_a_073 = interface; //com.devil.library.media.b.a$a
//  Ja_074 = interface; //com.devil.library.media.b.a
//  Jb_075 = interface; //com.devil.library.media.b.b
//  Jc_076 = interface; //com.devil.library.media.b.c
//  Ja_077 = interface; //com.devil.library.media.c.a
//  Jb_078 = interface; //com.devil.library.media.c.b
//  Ja_079 = interface; //com.devil.library.media.common.a
  JImageLoader = interface; //com.devil.library.media.common.ImageLoader
  JDVCameraConfig_Builder = interface; //com.devil.library.media.config.DVCameraConfig$Builder
  JDVCameraConfig = interface; //com.devil.library.media.config.DVCameraConfig
  JDVListConfig_Builder = interface; //com.devil.library.media.config.DVListConfig$Builder
  JDVListConfig = interface; //com.devil.library.media.config.DVListConfig
  JDVMediaType = interface; //com.devil.library.media.enumtype.DVMediaType
//  Ja_086 = interface; //com.devil.library.media.listener.a
  JOnSelectMediaListener = interface; //com.devil.library.media.listener.OnSelectMediaListener
  JMediaSelectorManager = interface; //com.devil.library.media.MediaSelectorManager
//  JDVCameraActivity_1 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$1
//  JDVCameraActivity_2 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$2
//  JDVCameraActivity_3 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$3
//  JDVCameraActivity_4 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$4
//  JDVCameraActivity_5 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$5
//  JDVCameraActivity_6 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$6
//  JDVCameraActivity = interface; //com.devil.library.media.ui.activity.DVCameraActivity
//  JDVEasyVideoPlayActivity_1 = interface; //com.devil.library.media.ui.activity.DVEasyVideoPlayActivity$1
//  JDVEasyVideoPlayActivity = interface; //com.devil.library.media.ui.activity.DVEasyVideoPlayActivity
//  JDVMediaSelectActivity_1 = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity$1
//  JDVMediaSelectActivity_2 = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity$2
//  JDVMediaSelectActivity = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity
//  JDVSystemCameraActivity_1 = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity$1
//  JDVSystemCameraActivity_2 = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity$2
//  JDVSystemCameraActivity = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity
//  JSelectMediaTempActivity_1 = interface; //com.devil.library.media.ui.activity.SelectMediaTempActivity$1
//  JSelectMediaTempActivity = interface; //com.devil.library.media.ui.activity.SelectMediaTempActivity
//  JMediaListFragment_1 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$1
//  JMediaListFragment_2 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$2
//  JMediaListFragment_3 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$3
//  JMediaListFragment_4 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$4
//  JMediaListFragment_5 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$5
//  JMediaListFragment_6 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$6
//  JMediaListFragment_7 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$7
//  JMediaListFragment_8 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$8
//  JMediaListFragment_9_1 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$9$1
//  JMediaListFragment_9 = interface; //com.devil.library.media.ui.fragment.MediaListFragment$9
  JMediaListFragment = interface; //com.devil.library.media.ui.fragment.MediaListFragment
//  JWatchMediaFragment_1 = interface; //com.devil.library.media.ui.fragment.WatchMediaFragment$1
  JWatchMediaFragment = interface; //com.devil.library.media.ui.fragment.WatchMediaFragment
//  JWatchMediaVPItemFragment_1 = interface; //com.devil.library.media.ui.fragment.WatchMediaVPItemFragment$1
//  JWatchMediaVPItemFragment_2 = interface; //com.devil.library.media.ui.fragment.WatchMediaVPItemFragment$2
  JWatchMediaVPItemFragment = interface; //com.devil.library.media.ui.fragment.WatchMediaVPItemFragment
//  Ja_122 = interface; //com.devil.library.media.utils.a
//  Jb_123 = interface; //com.devil.library.media.utils.b
//  Jc_124 = interface; //com.devil.library.media.utils.c
//  Jd_1_1 = interface; //com.devil.library.media.utils.d$1$1
//  Jd_1_126 = interface; //com.devil.library.media.utils.d$1
//  Jd_2_1 = interface; //com.devil.library.media.utils.d$2$1
//  Jd_2_128 = interface; //com.devil.library.media.utils.d$2
//  Jd_a = interface; //com.devil.library.media.utils.d$a
//  Jd_130 = interface; //com.devil.library.media.utils.d
  JDVFileProvider = interface; //com.devil.library.media.utils.DVFileProvider
//  Je_a = interface; //com.devil.library.media.utils.e$a
//  Je_133 = interface; //com.devil.library.media.utils.e
//  Jf_134 = interface; //com.devil.library.media.utils.f
//  JHackyViewPager = interface; //com.devil.library.media.view.HackyViewPager
//  JRatioImageView = interface; //com.devil.library.media.view.RatioImageView
  JSquareRelativeLayout = interface; //com.devil.library.media.view.SquareRelativeLayout

// ===== Forward SuperClasses declarations =====

//  Ja_074Class = interface; //com.devil.library.media.b.a
//  Jb_075Class = interface; //com.devil.library.media.b.b

// ===== Interface declarations =====

//  JaClass = interface(JObjectClass)
//  ['{757DD24B-5482-424B-BBD3-061CE04DBD1E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/a')]
//  Ja = interface(IJavaInstance)
//  ['{15ABEFD0-6948-4A6C-BD8B-2B3A1664EE2A}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: Int64); cdecl; overload; //(J)V
//    procedure b; cdecl; overload; //()V
//    procedure b(P1: Int64); cdecl; overload; //(J)V
//    procedure a(P1: Single); cdecl; overload; //(F)V
//    procedure c; cdecl; //()V
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{F7F91BAC-EDF3-4C3E-A9F1-77B839C4CA46}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/b')]
//  Jb = interface(IJavaInstance)
//  ['{3E2A4B9F-FE1E-4475-BD05-EDF6C447006A}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{1C887BD0-2B0C-4B39-B995-BED1D130C8F5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/c')]
//  Jc = interface(IJavaInstance)
//  ['{1F7278F9-91E5-4AFD-B602-05F2EBD57241}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//    procedure b; cdecl; //()V
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JObjectClass)
//  ['{FC20DF6D-D130-4411-A1D1-9C26CEDF9DF2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/d')]
//  Jd = interface(IJavaInstance)
//  ['{A9E99A73-72FC-459B-B6A0-5D3752A50C2C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBitmap); cdecl; overload; //(Landroid/graphics/Bitmap;)V
//    procedure a(P1: JString; P2: JBitmap); cdecl; overload; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JeClass = interface(JObjectClass)
//  ['{27401472-5F5C-4A4D-9C87-8CC3014F280F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/e')]
//  Je = interface(IJavaInstance)
//  ['{5F0E46DB-8569-428F-B5CA-B28D33692B11}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{1F8A7F7A-961C-43DC-8999-C065B351D6D3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a/f')]
//  Jf = interface(IJavaInstance)
//  ['{80B2B840-DED9-4AFE-BEFE-011FD83B8BD5}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//    procedure b; cdecl; //()V
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  Ja_1Class = interface(JObjectClass)
//  ['{3CF74D20-19EB-4ADA-96C8-3EA815517444}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$1')]
//  Ja_1 = interface(JObject)
//  ['{A8BE3299-A390-4954-BBC0-FCC2B7531E23}']
//    { Property Methods }
//
//    { methods }
//    procedure onSensorChanged(P1: JSensorEvent); cdecl; //(Landroid/hardware/SensorEvent;)V
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl; //(Landroid/hardware/Sensor;I)V
//
//    { Property }
//  end;

//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_2Class = interface(JObjectClass)
//  ['{13E7E1E8-C85B-4BF1-B6E3-C92B98A74E3B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$2')]
//  Ja_2 = interface(JObject)
//  ['{26214911-58C0-4906-A85F-EA0267F71828}']
//    { Property Methods }
//
//    { methods }
//    procedure onPictureTaken(P1: TJavaArray<Byte>; P2: JCamera); cdecl; //([BLandroid/hardware/Camera;)V
//
//    { Property }
//  end;

//  TJa_2 = class(TJavaGenericImport<Ja_2Class, Ja_2>) end;

//  Ja_3Class = interface(JObjectClass)
//  ['{11CF224A-D8F2-443E-8495-8D26327FB2AF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$3')]
//  Ja_3 = interface(JObject)
//  ['{F0B3E666-D3BD-456C-A530-4CAAE8C01104}']
//    { Property Methods }
//
//    { methods }
//    procedure onAutoFocus(P1: Boolean; P2: JCamera); cdecl; //(ZLandroid/hardware/Camera;)V
//
//    { Property }
//  end;

//  TJa_3 = class(TJavaGenericImport<Ja_3Class, Ja_3>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{85E2C041-2640-4465-A669-D969A0223CD3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$a')]
//  Ja_a = interface(IJavaInstance)
//  ['{1B9C8189-64D9-4B52-9A4E-2FC38E884E56}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_bClass = interface(JObjectClass)
//  ['{CC2386DC-FF1E-4889-9EDB-90AF82F74F69}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$b')]
//  Ja_b = interface(IJavaInstance)
//  ['{70EDD394-AB49-46E9-A5D4-5FC4D5842DC5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_cClass = interface(JObjectClass)
//  ['{155475CF-CE6B-4359-AB98-3E87850466D0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$c')]
//  Ja_c = interface(IJavaInstance)
//  ['{CEC4D6A0-09FE-43A9-A32F-949862863E8C}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJa_c = class(TJavaGenericImport<Ja_cClass, Ja_c>) end;

//  Ja_dClass = interface(JObjectClass)
//  ['{D20ADF7C-3E9F-4661-B421-0A4537CC9DE4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$d')]
//  Ja_d = interface(IJavaInstance)
//  ['{2D9D2EAD-CEDA-45AC-9681-4F6F579093ED}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJa_d = class(TJavaGenericImport<Ja_dClass, Ja_d>) end;

//  Ja_eClass = interface(JObjectClass)
//  ['{B1EBD4FE-63AB-4B78-80DA-FE9B0C84A422}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a$e')]
//  Ja_e = interface(IJavaInstance)
//  ['{7D10C080-6551-42A6-9CA4-B8B0737C5962}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBitmap; P2: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
//
//    { Property }
//  end;

//  TJa_e = class(TJavaGenericImport<Ja_eClass, Ja_e>) end;

//  Ja_014Class = interface(JObjectClass)
//  ['{D207A936-AD29-4B70-A5A7-D63557768401}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload; //()Lcom/devil/library/camera/a;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/a')]
//  Ja_014 = interface(JObject)
//  ['{64F2CC66-84B2-4C50-9D06-F6A80F1BB4F4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JImageView; P2: JImageView); cdecl; overload; //(Landroid/widget/ImageView;Landroid/widget/ImageView;)V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure onPreviewFrame(P1: TJavaArray<Byte>; P2: JCamera); cdecl; //([BLandroid/hardware/Camera;)V
//    procedure b(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function b: Boolean; cdecl; overload; //()Z
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure c; cdecl; //()V
//    procedure a(P1: Ja_e); cdecl; overload; //(Lcom/devil/library/camera/a$e;)V
//    procedure a(P1: JSurface; P2: Single; P3: Ja_b); cdecl; overload; //(Landroid/view/Surface;FLcom/devil/library/camera/a$b;)V
//    procedure a(P1: Boolean; P2: Ja_d); cdecl; overload; //(ZLcom/devil/library/camera/a$d;)V
//    procedure a(P1: JContext; P2: Single; P3: Single; P4: Ja_c); cdecl; overload; //(Landroid/content/Context;FFLcom/devil/library/camera/a$c;)V
//
//    { Property }
//  end;

//  TJa_014 = class(TJavaGenericImport<Ja_014Class, Ja_014>) end;

//  Ja_015Class = interface(JObjectClass)
//  ['{3AFD7143-A0F8-4415-987E-4D12336BFB97}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Ja_015; cdecl; //(Lcom/devil/library/camera/b/c;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/a')]
//  Ja_015 = interface(JObject)
//  ['{314B65D5-AD56-42C5-B299-3580165256D6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a(P1: Single; P2: Single; P3: Ja_c); cdecl; overload; //(FFLcom/devil/library/camera/a$c;)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: JSurface; P2: Single); cdecl; overload; //(Landroid/view/Surface;F)V
//    procedure a(P1: Boolean; P2: Int64); cdecl; overload; //(ZJ)V
//    procedure c(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function c: Boolean; cdecl; overload; //()Z
//
//    { Property }
//  end;

//  TJa_015 = class(TJavaGenericImport<Ja_015Class, Ja_015>) end;

//  Jb_016Class = interface(JObjectClass)
//  ['{A766C4E9-85A1-4A3B-ACB6-F2A3242C0D27}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Jb_016; cdecl; //(Lcom/devil/library/camera/b/c;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/b')]
//  Jb_016 = interface(JObject)
//  ['{58A86AD7-B5E4-4248-981C-39AED138FE33}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a(P1: Single; P2: Single; P3: Ja_c); cdecl; overload; //(FFLcom/devil/library/camera/a$c;)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: JSurface; P2: Single); cdecl; overload; //(Landroid/view/Surface;F)V
//    procedure a(P1: Boolean; P2: Int64); cdecl; overload; //(ZJ)V
//    procedure c(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function c: Boolean; cdecl; overload; //()Z
//
//    { Property }
//  end;

//  TJb_016 = class(TJavaGenericImport<Jb_016Class, Jb_016>) end;

//  Jc_017Class = interface(JObjectClass)
//  ['{DD3F4F5D-9689-497C-96E6-A6E40E7615D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ja; P3: Ja_a): Jc_017; cdecl; //(Landroid/content/Context;Lcom/devil/library/camera/d/a;Lcom/devil/library/camera/a$a;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/c')]
//  Jc_017 = interface(JObject)
//  ['{C0A55558-2AC9-4CCA-9F69-9C4F5ACE3D67}']
//    { Property Methods }
//
//    { methods }
//    function d: Ja; cdecl; //()Lcom/devil/library/camera/d/a;
//    function e: JContext; cdecl; //()Landroid/content/Context;
//    procedure a(P1: Je); cdecl; overload; //(Lcom/devil/library/camera/b/e;)V
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a(P1: Single; P2: Single; P3: Ja_c); cdecl; overload; //(FFLcom/devil/library/camera/a$c;)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: JSurface; P2: Single); cdecl; overload; //(Landroid/view/Surface;F)V
//    procedure a(P1: Boolean; P2: Int64); cdecl; overload; //(ZJ)V
//    procedure c(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function c: Boolean; cdecl; overload; //()Z
//
//    { Property }
//  end;

//  TJc_017 = class(TJavaGenericImport<Jc_017Class, Jc_017>) end;

//  Jd_1Class = interface(JObjectClass)
//  ['{B5DABC23-6CA6-400E-A0C7-2866AF52B6FB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/d$1')]
//  Jd_1 = interface(JObject)
//  ['{C6B93DE2-3030-452B-B17A-118C30D71C02}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBitmap; P2: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
//
//    { Property }
//  end;

//  TJd_1 = class(TJavaGenericImport<Jd_1Class, Jd_1>) end;

//  Jd_2Class = interface(JObjectClass)
//  ['{5F1ADB9F-65A8-4B0B-AB04-7005238CEE15}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/d$2')]
//  Jd_2 = interface(JObject)
//  ['{76587738-9353-426E-A75F-C70AADC37976}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJd_2 = class(TJavaGenericImport<Jd_2Class, Jd_2>) end;

//  Jd_020Class = interface(JObjectClass)
//  ['{EF4F3498-C16B-4225-831D-E92A1F3F4086}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/d')]
//  Jd_020 = interface(JObject)
//  ['{8A5B7BBA-F17C-4D60-A02C-7A34D3018F7C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    function c: Boolean; cdecl; overload; //()Z
//    procedure a(P1: Single; P2: Single; P3: Ja_c); cdecl; overload; //(FFLcom/devil/library/camera/a$c;)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: JSurface; P2: Single); cdecl; overload; //(Landroid/view/Surface;F)V
//    procedure a(P1: Boolean; P2: Int64); cdecl; overload; //(ZJ)V
//    procedure c(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//
//    { Property }
//  end;

//  TJd_020 = class(TJavaGenericImport<Jd_020Class, Jd_020>) end;

//  Je_021Class = interface(JObjectClass)
//  ['{E8876325-2A73-4693-95AE-8362A5EA1BAC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/b/e')]
//  Je_021 = interface(IJavaInstance)
//  ['{4D1DD4F6-AC6E-4DA7-89DA-020028DA6048}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a(P1: Single; P2: Single; P3: Ja_c); cdecl; overload; //(FFLcom/devil/library/camera/a$c;)V
//    procedure b(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: JSurface; P2: Single); cdecl; overload; //(Landroid/view/Surface;F)V
//    procedure a(P1: Boolean; P2: Int64); cdecl; overload; //(ZJ)V
//    procedure c(P1: JSurfaceHolder; P2: Single); cdecl; overload; //(Landroid/view/SurfaceHolder;F)V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Single; P2: Integer); cdecl; overload; //(FI)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function c: Boolean; cdecl; overload; //()Z
//
//    { Property }
//  end;

//  TJe_021 = class(TJavaGenericImport<Je_021Class, Je_021>) end;

//  Ja_022Class = interface(JObjectClass)
//  ['{07E8C055-D710-436D-90D6-BBD4A07EE1DE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Single; P2: Single): Integer; cdecl; //(FF)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/a')]
//  Ja_022 = interface(JObject)
//  ['{B0257CDC-29ED-4D43-AC98-15F022869682}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_022 = class(TJavaGenericImport<Ja_022Class, Ja_022>) end;

//  Jb_1Class = interface(JObjectClass)
//  ['{3B599502-5623-4FC8-AC0A-3203B28B0F82}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/b$1')]
//  Jb_1 = interface(JObject)
//  ['{AFA62931-8AD0-4CC2-B2E0-E55A9819BA99}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_1 = class(TJavaGenericImport<Jb_1Class, Jb_1>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{63F05EFD-3AE8-4F02-91D8-4109B125819D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/b$a')]
//  Jb_a = interface(JObject)
//  ['{7D8BE395-501E-42A0-B397-D43AFCF8DC36}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JCamera_Size; P2: JCamera_Size): Integer; cdecl; //(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_025Class = interface(JObjectClass)
//  ['{A7EAAE81-BE2F-489F-BC7D-918B0E81B35B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jb; cdecl; overload; //()Lcom/devil/library/camera/c/b;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/b')]
//  Jb_025 = interface(JObject)
//  ['{E1D4753B-6D03-4DC9-985B-05033425AF21}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JList; P2: Integer; P3: Single): JCamera_Size; cdecl; overload; //(Ljava/util/List;IF)Landroid/hardware/Camera$Size;
//    function b(P1: JList; P2: Integer; P3: Single): JCamera_Size; cdecl; //(Ljava/util/List;IF)Landroid/hardware/Camera$Size;
//    function a(P1: JList; P2: JString): Boolean; cdecl; overload; //(Ljava/util/List;Ljava/lang/String;)Z
//    function a(P1: JList; P2: Integer): Boolean; cdecl; overload; //(Ljava/util/List;I)Z
//    function a(P1: JContext; P2: Integer): Integer; cdecl; overload; //(Landroid/content/Context;I)I
//
//    { Property }
//  end;

//  TJb_025 = class(TJavaGenericImport<Jb_025Class, Jb_025>) end;

//  Jc_026Class = interface(JObjectClass)
//  ['{3CB90DBC-A11D-426B-BF4B-0B7D8D61F1B6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Integer; cdecl; overload; //()I
//    {class} function a(P1: Integer): Boolean; cdecl; overload; //(I)Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/c')]
//  Jc_026 = interface(JObject)
//  ['{09AD8668-0D1C-43C7-A19C-DCEBDB80B3EB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_026 = class(TJavaGenericImport<Jc_026Class, Jc_026>) end;

//  Jd_027Class = interface(JObjectClass)
//  ['{2C9861EE-1FB6-4586-93B5-951100FA6224}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; //()Ljava/lang/String;
//    {class} function b: Boolean; cdecl; //()Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/d')]
//  Jd_027 = interface(JObject)
//  ['{DA2F611A-84FC-44AD-861C-165295512857}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_027 = class(TJavaGenericImport<Jd_027Class, Jd_027>) end;

//  Je_028Class = interface(JObjectClass)
//  ['{F61971F2-BBA0-400A-8F4E-2AE9B02FC1A2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/e')]
//  Je_028 = interface(JObject)
//  ['{E2BC3B4A-DC51-4ABA-BBF8-B25EEE5EA798}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_028 = class(TJavaGenericImport<Je_028Class, Je_028>) end;

//  Jf_029Class = interface(JObjectClass)
//  ['{5B16A393-9024-43DA-A759-907828531DEA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
//    {class} procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/f')]
//  Jf_029 = interface(JObject)
//  ['{F24A5206-22C6-496D-9841-6AA7FBE52135}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_029 = class(TJavaGenericImport<Jf_029Class, Jf_029>) end;

//  JgClass = interface(JObjectClass)
//  ['{967A34A3-6B68-4F2F-AE28-3F2E716566B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): Integer; cdecl; //(Landroid/content/Context;)I
//    {class} function b(P1: JContext): Integer; cdecl; //(Landroid/content/Context;)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/c/g')]
//  Jg = interface(JObject)
//  ['{8C2F4E41-CBAF-474D-A5E9-AAC7C8AA53E6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  JCaptureButton_1Class = interface(JObjectClass)
//  ['{1204C9D4-44BC-41D2-9D33-B87743C1992D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$1')]
//  JCaptureButton_1 = interface(JObject)
//  ['{F6C08D06-BE11-4559-87E2-D1865BB2887B}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_1 = class(TJavaGenericImport<JCaptureButton_1Class, JCaptureButton_1>) end;

//  JCaptureButton_2Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{99FD5D1C-BE90-46A4-8776-A8399647C2BB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$2')]
//  JCaptureButton_2 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{E9A56D6F-479A-454F-9C44-9DB15EF7D6C3}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(P1: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_2 = class(TJavaGenericImport<JCaptureButton_2Class, JCaptureButton_2>) end;

//  JCaptureButton_3Class = interface(JObjectClass)
//  ['{D9D9143D-9499-4F5A-8388-E0F430DD5A07}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$3')]
//  JCaptureButton_3 = interface(JObject)
//  ['{644BB54F-14DA-4315-871A-6D63B44813F4}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_3 = class(TJavaGenericImport<JCaptureButton_3Class, JCaptureButton_3>) end;

//  JCaptureButton_4Class = interface(JObjectClass)
//  ['{571C29DD-06A7-4A8F-A80D-24F7114669A6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$4')]
//  JCaptureButton_4 = interface(JObject)
//  ['{D59FB730-864A-4A9F-8CA6-FC1531177541}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_4 = class(TJavaGenericImport<JCaptureButton_4Class, JCaptureButton_4>) end;

//  JCaptureButton_5Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{E3848111-A49D-46AC-B9FD-3372D104FDC1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$5')]
//  JCaptureButton_5 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{4094E355-1C50-4316-AB2A-7105318A6CFD}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(P1: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_5 = class(TJavaGenericImport<JCaptureButton_5Class, JCaptureButton_5>) end;

//  JCaptureButton_aClass = interface(JObjectClass)
//  ['{43F68B23-7E68-45BD-A806-9B0D3412F573}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$a')]
//  JCaptureButton_a = interface(JObject)
//  ['{75EB8FBC-53A3-42F3-8DA6-89DE31F25130}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJCaptureButton_a = class(TJavaGenericImport<JCaptureButton_aClass, JCaptureButton_a>) end;

//  JCaptureButton_bClass = interface(JCountDownTimerClass) // or JObjectClass // SuperSignature: android/os/CountDownTimer
//  ['{2D163314-CD0F-4844-8499-6075D88542B3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$b')]
//  JCaptureButton_b = interface(JCountDownTimer) // or JObject // SuperSignature: android/os/CountDownTimer
//  ['{F95E7B68-6A87-4448-8CF1-90FE6CA79E02}']
//    { Property Methods }
//
//    { methods }
//    procedure onTick(P1: Int64); cdecl; //(J)V
//    procedure onFinish; cdecl; //()V
//
//    { Property }
//  end;

//  TJCaptureButton_b = class(TJavaGenericImport<JCaptureButton_bClass, JCaptureButton_b>) end;

  JCaptureButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{FB9DE0F7-DCBF-41BF-B284-B340C17E9CFD}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JCaptureButton; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: Integer): JCaptureButton; cdecl; overload; //(Landroid/content/Context;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CaptureButton')]
  JCaptureButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{780741C4-A6FC-4070-A4F0-D6FBF15646C9}']
    { Property Methods }

    { methods }
    function onTouchEvent(P1: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setDuration(P1: Integer); cdecl; //(I)V
    procedure setMinDuration(P1: Integer); cdecl; //(I)V
//    procedure setCaptureListener(P1: Ja); cdecl; //(Lcom/devil/library/camera/a/a;)V
    procedure setButtonFeatures(P1: Integer); cdecl; //(I)V
//    procedure a; cdecl; //()V

    { Property }
  end;

  TJCaptureButton = class(TJavaGenericImport<JCaptureButtonClass, JCaptureButton>) end;

//  JCaptureLayout_1Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{D98C48D4-34A1-4BD9-A2BC-1A2D4CA8ECDD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$1')]
//  JCaptureLayout_1 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{061866F8-F527-4FE0-8078-C9C4738BFF55}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(P1: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_1 = class(TJavaGenericImport<JCaptureLayout_1Class, JCaptureLayout_1>) end;

//  JCaptureLayout_2Class = interface(JObjectClass)
//  ['{C32F90D0-7D15-4933-8401-E84ECD171808}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$2')]
//  JCaptureLayout_2 = interface(JObject)
//  ['{5DAB9B27-5C40-41B5-962A-B8CB5FCB033B}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: Int64); cdecl; overload; //(J)V
//    procedure b; cdecl; overload; //()V
//    procedure b(P1: Int64); cdecl; overload; //(J)V
//    procedure a(P1: Single); cdecl; overload; //(F)V
//    procedure c; cdecl; //()V
//
//    { Property }
//  end;

//  TJCaptureLayout_2 = class(TJavaGenericImport<JCaptureLayout_2Class, JCaptureLayout_2>) end;

//  JCaptureLayout_3Class = interface(JObjectClass)
//  ['{EF12950E-10A4-40E9-9A49-3F6513731BDD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$3')]
//  JCaptureLayout_3 = interface(JObject)
//  ['{ED663A38-6BB9-4B17-8EF1-F6B272C2EC7A}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_3 = class(TJavaGenericImport<JCaptureLayout_3Class, JCaptureLayout_3>) end;

//  JCaptureLayout_4Class = interface(JObjectClass)
//  ['{08CCA3ED-9F04-44B5-8E67-4118E027846D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$4')]
//  JCaptureLayout_4 = interface(JObject)
//  ['{6A040AF1-351E-44C8-9DA8-20FFBEC1FB46}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_4 = class(TJavaGenericImport<JCaptureLayout_4Class, JCaptureLayout_4>) end;

//  JCaptureLayout_5Class = interface(JObjectClass)
//  ['{3C7D8751-10D3-4CC5-8255-C0CA89448F2E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$5')]
//  JCaptureLayout_5 = interface(JObject)
//  ['{384B1383-37BE-46DC-8CEC-8EB9D4F81176}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_5 = class(TJavaGenericImport<JCaptureLayout_5Class, JCaptureLayout_5>) end;

//  JCaptureLayout_6Class = interface(JObjectClass)
//  ['{93F7ADE4-9ABC-457B-996B-3C94BFBDE4CF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$6')]
//  JCaptureLayout_6 = interface(JObject)
//  ['{D10A26FE-2C97-4609-8908-EC2489B7BBD9}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_6 = class(TJavaGenericImport<JCaptureLayout_6Class, JCaptureLayout_6>) end;

//  JCaptureLayout_7Class = interface(JObjectClass)
//  ['{13A2725F-38F7-4F8B-9154-DDCD9B64B1FF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$7')]
//  JCaptureLayout_7 = interface(JObject)
//  ['{A1C716B0-95EB-47DA-AFDA-2A29B5BB8515}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_7 = class(TJavaGenericImport<JCaptureLayout_7Class, JCaptureLayout_7>) end;

  JCaptureLayoutClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{24F2AA57-F351-437A-9474-A982CDD745D2}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: JAttributeSet): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CaptureLayout')]
  JCaptureLayout = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{A2164269-B7C2-4623-A2D4-3BB58C50C4A4}']
    { Property Methods }

    { methods }
//    procedure setTypeListener(P1: Jf); cdecl; //(Lcom/devil/library/camera/a/f;)V
//    procedure setCaptureListener(P1: Ja); cdecl; //(Lcom/devil/library/camera/a/a;)V
//    procedure setReturnListener(P1: Je); cdecl; //(Lcom/devil/library/camera/a/e;)V
    procedure a; cdecl; overload; //()V
    procedure b; cdecl; //()V
    procedure c; cdecl; //()V
    procedure d; cdecl; //()V
    procedure setTextWithAnimation(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure setDuration(P1: Integer); cdecl; //(I)V
    procedure setButtonFeatures(P1: Integer); cdecl; //(I)V
    procedure setTip(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure a(P1: Integer; P2: Integer); cdecl; overload; //(II)V
//    procedure setLeftClickListener(P1: Jb); cdecl; //(Lcom/devil/library/camera/a/b;)V
//    procedure setRightClickListener(P1: Jb); cdecl; //(Lcom/devil/library/camera/a/b;)V

    { Property }
  end;

  TJCaptureLayout = class(TJavaGenericImport<JCaptureLayoutClass, JCaptureLayout>) end;

//  Ja_047Class = interface(JObjectClass)
//  ['{6EFBFDE0-2037-445A-8536-82E3323F8312}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/d/a')]
//  Ja_047 = interface(IJavaInstance)
//  ['{563D3E0C-37AF-4E01-BFF2-1432FACC5235}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    procedure b(P1: Integer); cdecl; //(I)V
//    procedure a(P1: JBitmap; P2: Boolean); cdecl; overload; //(Landroid/graphics/Bitmap;Z)V
//    procedure a(P1: JBitmap; P2: JString); cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;)V
//    function a(P1: Single; P2: Single): Boolean; cdecl; overload; //(FF)Z
//
//    { Property }
//  end;

//  TJa_047 = class(TJavaGenericImport<Ja_047Class, Ja_047>) end;

  JFoucsViewClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{84D46C4C-BF04-44CD-8302-F5DAB515522C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JFoucsView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: JAttributeSet): JFoucsView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JFoucsView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/FoucsView')]
  JFoucsView = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{45FD6103-24EC-45A1-8421-7F21FD8A0D67}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFoucsView = class(TJavaGenericImport<JFoucsViewClass, JFoucsView>) end;

//  JJCameraView_1Class = interface(JObjectClass)
//  ['{3F83B70F-0ACB-46CC-B15B-A3383B2C88DE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$1')]
//  JJCameraView_1 = interface(JObject)
//  ['{B17B78CE-7A9C-4D17-B533-2F845BEC8BC6}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJJCameraView_1 = class(TJavaGenericImport<JJCameraView_1Class, JJCameraView_1>) end;

//  JJCameraView_2Class = interface(JObjectClass)
//  ['{8959C696-2C88-4C0D-800C-4989D26746AA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$2')]
//  JJCameraView_2 = interface(JObject)
//  ['{CC90AB36-6B02-4E7D-AEC0-ADF32389B601}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJJCameraView_2 = class(TJavaGenericImport<JJCameraView_2Class, JJCameraView_2>) end;

//  JJCameraView_3_1Class = interface(JObjectClass)
//  ['{B2F25F71-3007-438C-8253-09790368B410}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$3$1')]
//  JJCameraView_3_1 = interface(JObject)
//  ['{F4D25DC7-F632-40E4-BED8-8D5AB98A6518}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_3_1 = class(TJavaGenericImport<JJCameraView_3_1Class, JJCameraView_3_1>) end;

//  JJCameraView_3Class = interface(JObjectClass)
//  ['{8A14E501-EE18-4B01-AA27-DAB01F10F3CB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$3')]
//  JJCameraView_3 = interface(JObject)
//  ['{0F54696A-86B8-48DB-A580-2DF3674337C1}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload; //()V
//    procedure b; cdecl; overload; //()V
//    procedure a(P1: Int64); cdecl; overload; //(J)V
//    procedure b(P1: Int64); cdecl; overload; //(J)V
//    procedure a(P1: Single); cdecl; overload; //(F)V
//    procedure c; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_3 = class(TJavaGenericImport<JJCameraView_3Class, JJCameraView_3>) end;

//  JJCameraView_4Class = interface(JObjectClass)
//  ['{A5D1B748-22D8-41B2-8A8F-559270BAF186}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$4')]
//  JJCameraView_4 = interface(JObject)
//  ['{A47D30B0-4694-4A3F-AD66-C616CBCA541C}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//    procedure b; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_4 = class(TJavaGenericImport<JJCameraView_4Class, JJCameraView_4>) end;

//  JJCameraView_5Class = interface(JObjectClass)
//  ['{C10EB201-C123-4A8E-B2CB-31CCEDC9CC7C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$5')]
//  JJCameraView_5 = interface(JObject)
//  ['{00244084-3305-469E-8E3E-A758420E13AC}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_5 = class(TJavaGenericImport<JJCameraView_5Class, JJCameraView_5>) end;

//  JJCameraView_6Class = interface(JObjectClass)
//  ['{C6A4CAA0-5EF0-4F1E-AF4F-CA07034B2EE8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$6')]
//  JJCameraView_6 = interface(JObject)
//  ['{94A55C77-15ED-4E7F-85C5-5EA1105C9CF4}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_6 = class(TJavaGenericImport<JJCameraView_6Class, JJCameraView_6>) end;

//  JJCameraView_7_1Class = interface(JObjectClass)
//  ['{6CE7B586-28B7-4669-B264-783D83F2E6D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$7$1')]
//  JJCameraView_7_1 = interface(JObject)
//  ['{1E77B481-F890-4040-A086-FE3B8F8417F8}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_7_1 = class(TJavaGenericImport<JJCameraView_7_1Class, JJCameraView_7_1>) end;

//  JJCameraView_7Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{4A96A123-DF4C-4F16-8458-99ADD05DBF36}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$7')]
//  JJCameraView_7 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{ADF5CEAF-F9FA-48A3-843F-E5B7D597AD02}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_7 = class(TJavaGenericImport<JJCameraView_7Class, JJCameraView_7>) end;

//  JJCameraView_8Class = interface(JObjectClass)
//  ['{ADB49241-C904-4580-9D05-F7D15CA64CB2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$8')]
//  JJCameraView_8 = interface(JObject)
//  ['{D125B938-E750-43A5-9682-DBD512A3682E}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_8 = class(TJavaGenericImport<JJCameraView_8Class, JJCameraView_8>) end;

//  JJCameraView_9_1Class = interface(JObjectClass)
//  ['{C11BAE75-F791-408F-A3D6-6B640BF2BDF9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9$1')]
//  JJCameraView_9_1 = interface(JObject)
//  ['{B11E675B-D226-4568-AA17-38DD570B6A19}']
//    { Property Methods }
//
//    { methods }
//    procedure onVideoSizeChanged(P1: JMediaPlayer; P2: Integer; P3: Integer); cdecl; //(Landroid/media/MediaPlayer;II)V
//
//    { Property }
//  end;

//  TJJCameraView_9_1 = class(TJavaGenericImport<JJCameraView_9_1Class, JJCameraView_9_1>) end;

//  JJCameraView_9_2Class = interface(JObjectClass)
//  ['{DF9E59B1-4890-414C-9E7B-F9828D03D1A7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9$2')]
//  JJCameraView_9_2 = interface(JObject)
//  ['{36AA4097-42A4-41A7-894D-BBE27041D5E5}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared(P1: JMediaPlayer); cdecl; //(Landroid/media/MediaPlayer;)V
//
//    { Property }
//  end;

//  TJJCameraView_9_2 = class(TJavaGenericImport<JJCameraView_9_2Class, JJCameraView_9_2>) end;

//  JJCameraView_9Class = interface(JObjectClass)
//  ['{0C4A943A-2508-4566-876D-39182ADCE36A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9')]
//  JJCameraView_9 = interface(JObject)
//  ['{1D906B32-8A01-46C5-8B84-D9C774506ED1}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_9 = class(TJavaGenericImport<JJCameraView_9Class, JJCameraView_9>) end;

  JJCameraViewClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{B1AD6BA6-BB06-4410-9921-F0C8FA1F9A51}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JJCameraView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: JAttributeSet): JJCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JJCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/JCameraView')]
  JJCameraView = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{1BA63F9A-A724-42E6-A255-D372073C715A}']
    { Property Methods }

    { methods }
    procedure setMaxDuration(P1: Integer); cdecl; //(I)V
    procedure a; cdecl; overload; //()V
    procedure setFlashLightVisibility(P1: Integer); cdecl; //(I)V
    procedure setFlashLightEnable(P1: Boolean); cdecl; //(Z)V
    procedure b; cdecl; overload; //()V
    procedure c; cdecl; //()V
    procedure surfaceCreated(P1: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
    procedure surfaceChanged(P1: JSurfaceHolder; P2: Integer; P3: Integer; P4: Integer); cdecl; //(Landroid/view/SurfaceHolder;III)V
    procedure surfaceDestroyed(P1: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
    function onTouchEvent(P1: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setSaveVideoPath(P1: JString); cdecl; //(Ljava/lang/String;)V
//    procedure setJCameraLisenter(P1: Jd); cdecl; //(Lcom/devil/library/camera/a/d;)V
//    procedure setErrorListener(P1: Jc); cdecl; //(Lcom/devil/library/camera/a/c;)V
    procedure setFeatures(P1: Integer); cdecl; //(I)V
    procedure setMediaQuality(P1: Integer); cdecl; //(I)V
    procedure a(P1: Integer); cdecl; overload; //(I)V
    procedure b(P1: Integer); cdecl; overload; //(I)V
    procedure a(P1: JBitmap; P2: Boolean); cdecl; overload; //(Landroid/graphics/Bitmap;Z)V
    procedure a(P1: JBitmap; P2: JString); cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    procedure d; cdecl; //()V
    procedure setTip(P1: JString); cdecl; //(Ljava/lang/String;)V
    function a(P1: Single; P2: Single): Boolean; cdecl; overload; //(FF)Z
//    procedure setLeftClickListener(P1: Jb); cdecl; //(Lcom/devil/library/camera/a/b;)V
//    procedure setRightClickListener(P1: Jb); cdecl; //(Lcom/devil/library/camera/a/b;)V

    { Property }
  end;

  TJJCameraView = class(TJavaGenericImport<JJCameraViewClass, JJCameraView>) end;

  JReturnButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{AB303A31-92F6-4EFC-8BC2-30ADCA1A6128}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext; P2: Integer): JReturnButton; cdecl; overload; //(Landroid/content/Context;I)V
    {class} function init(P1: JContext): JReturnButton; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/ReturnButton')]
  JReturnButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{7E7A8838-7349-481B-AEA1-A19426106C68}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReturnButton = class(TJavaGenericImport<JReturnButtonClass, JReturnButton>) end;

  JTypeButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{AEB131EB-03ED-422F-B212-9B11995174B0}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JTypeButton; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: Integer; P3: Integer): JTypeButton; cdecl; overload; //(Landroid/content/Context;II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/TypeButton')]
  JTypeButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{AF61A14A-FE1E-44DB-AA3D-40D4E876DF8B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTypeButton = class(TJavaGenericImport<JTypeButtonClass, JTypeButton>) end;

//  Ja_a_065Class = interface(JObjectClass)
//  ['{6AA345B0-081A-4723-8958-FB8C8EA5E960}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Ja_a_065; cdecl; //(Lcom/devil/library/media/a/a;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/a$a')]
//  Ja_a_065 = interface(JObject)
//  ['{F2805128-887D-47B0-A45F-833E2D3CD8B8}']
//    { Property Methods }
//    function _Geta: JImageView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/ImageView;
//    procedure _Seta(aa: JImageView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/ImageView;)V
//    function _Getb: JImageView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/ImageView;
//    procedure _Setb(ab: JImageView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/ImageView;)V
//    function _Getc: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/TextView;
//    procedure _Setc(ac: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/TextView;)V
//    function _Getd: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/TextView;
//    procedure _Setd(ad: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/TextView;)V
//
//    { methods }
//
//    { Property }
//    property a: JImageView read _Geta write _Seta;
//    property b: JImageView read _Getb write _Setb;
//    property c: JTextView read _Getc write _Setc;
//    property d: JTextView read _Getd write _Setd;
//  end;

//  TJa_a_065 = class(TJavaGenericImport<Ja_a_065Class, Ja_a_065>) end;

//  Ja_066Class = interface(JBaseAdapterClass) // or JObjectClass // SuperSignature: android/widget/BaseAdapter
//  ['{DCBB1B74-9E54-415F-9923-BA5683990843}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JList): Ja_066; cdecl; //(Landroid/content/Context;Ljava/util/List;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/a')]
//  Ja_066 = interface(JBaseAdapter) // or JObject // SuperSignature: android/widget/BaseAdapter
//  ['{D1358A9F-671D-48AF-AFF9-5D7C42E43CFE}']
//    { Property Methods }
//
//    { methods }
//    function getCount: Integer; cdecl; //()I
//    function getItem(P1: Integer): JObject; cdecl; //(I)Ljava/lang/Object;
//    function getItemId(P1: Integer): Int64; cdecl; //(I)J
//    function getView(P1: Integer; P2: JView; P3: JViewGroup): JView; cdecl; //(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
//    procedure a(P1: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJa_066 = class(TJavaGenericImport<Ja_066Class, Ja_066>) end;

//  Jb_1_067Class = interface(JObjectClass)
//  ['{40DBE0FB-9485-43F9-AAD1-15BB2D38F1FC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/b$1')]
//  Jb_1_067 = interface(JObject)
//  ['{0E4020C2-2701-4C53-9171-F3B170A4CC22}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJb_1_067 = class(TJavaGenericImport<Jb_1_067Class, Jb_1_067>) end;

//  Jb_2Class = interface(JObjectClass)
//  ['{17409393-91D7-45F2-B68C-3DA18D221273}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/b$2')]
//  Jb_2 = interface(JObject)
//  ['{031BC492-FC4E-4022-93FB-428F42956577}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJb_2 = class(TJavaGenericImport<Jb_2Class, Jb_2>) end;

//  Jb_a_069Class = interface(JObjectClass)
//  ['{C63137C2-B285-4E21-A5EB-4DFCD4268290}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/b$a')]
//  Jb_a_069 = interface(IJavaInstance)
//  ['{FD3CCBA0-6942-458C-9501-82C937E653F5}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: Boolean); cdecl; //(IZ)V
//    function b(P1: Integer; P2: Boolean): Boolean; cdecl; //(IZ)Z
//
//    { Property }
//  end;

//  TJb_a_069 = class(TJavaGenericImport<Jb_a_069Class, Jb_a_069>) end;

//  Jb_070Class = interface(Ja_074Class) // or JObjectClass // SuperSignature: com/devil/library/media/b/a
//  ['{EA334046-97B8-4334-A6D9-4EC95E044504}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JList): Jb_070; cdecl; //(Landroid/content/Context;Ljava/util/List;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/b')]
//  Jb_070 = interface(Ja_074) // or JObject // SuperSignature: com/devil/library/media/b/a
//  ['{F2F257F6-5D59-40BB-A1CE-49F8CD72F696}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb_a); cdecl; //(Lcom/devil/library/media/a/b$a;)V
//    function getItemCount: Integer; cdecl; //()I
//    function getItemViewType(P1: Integer): Integer; cdecl; //(I)I
//
//    { Property }
//  end;

//  TJb_070 = class(TJavaGenericImport<Jb_070Class, Jb_070>) end;

//  Jc_071Class = interface(Jb_075Class) // or JObjectClass // SuperSignature: com/devil/library/media/b/b
//  ['{18854467-CA77-4E06-82E1-DCD6C16DBFEE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JFragmentManager; P3: JList): Jc_071; cdecl; //(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/a/c')]
//  Jc_071 = interface(Jb_075) // or JObject // SuperSignature: com/devil/library/media/b/b
//  ['{9675C4DE-D0B1-401C-A137-DC93E1E8ACEF}']
//    { Property Methods }
//
//    { methods }
//    function getCount: Integer; cdecl; //()I
//    function a(P1: Integer): JFragment; cdecl; //(I)Landroid/support/v4/app/Fragment;
//
//    { Property }
//  end;

//  TJc_071 = class(TJavaGenericImport<Jc_071Class, Jc_071>) end;

//  Ja_1_072Class = interface(JObjectClass)
//  ['{55299A8C-B0D9-449B-9EC1-5080CBF8E2FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/b/a$1')]
//  Ja_1_072 = interface(JObject)
//  ['{2720A1CE-401C-4EBA-8249-F37333C32459}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJa_1_072 = class(TJavaGenericImport<Ja_1_072Class, Ja_1_072>) end;

//  Ja_a_073Class = interface(JObjectClass)
//  ['{62221D53-78CA-49FB-A04B-DC8A770DA082}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/b/a$a')]
//  Ja_a_073 = interface(IJavaInstance)
//  ['{F7F8A580-4EF1-450D-87A2-CEB45C13988B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc; P2: Integer); cdecl; //(Lcom/devil/library/media/b/c;I)V
//
//    { Property }
//  end;

//  TJa_a_073 = class(TJavaGenericImport<Ja_a_073Class, Ja_a_073>) end;

//  Ja_074Class = interface(JRecyclerView_AdapterClass) // or JObjectClass // SuperSignature: android/support/v7/widget/RecyclerView$Adapter
//  ['{EF0D83DC-75DA-4009-9708-A01492117E68}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JList): Ja_074; cdecl; //(Landroid/content/Context;Ljava/util/List;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/b/a')]
//  Ja_074 = interface(JRecyclerView_Adapter) // or JObject // SuperSignature: android/support/v7/widget/RecyclerView$Adapter
//  ['{1E6B044B-F20C-4DC0-A437-CA4262564751}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/content/Context;
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/content/Context;)V
//    function _Getb: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/List;
//    procedure _Setb(ab: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/util/List;)V
//
//    { methods }
//    procedure a(P1: Ja_a); cdecl; overload; //(Lcom/devil/library/media/b/a$a;)V
//    function getItemCount: Integer; cdecl; //()I
//    function getItemViewType(P1: Integer): Integer; cdecl; //(I)I
//    function a(P1: JViewGroup; P2: Integer): Jc; cdecl; overload; //(Landroid/view/ViewGroup;I)Lcom/devil/library/media/b/c;
//    procedure b(P1: Jc; P2: Integer); cdecl; //(Lcom/devil/library/media/b/c;I)V
//    procedure onBindViewHolder(P1: JRecyclerView_ViewHolder; P2: Integer); cdecl; //(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
//    function onCreateViewHolder(P1: JViewGroup; P2: Integer): JRecyclerView_ViewHolder; cdecl; //(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//    property b: JList read _Getb write _Setb;
//  end;

//  TJa_074 = class(TJavaGenericImport<Ja_074Class, Ja_074>) end;

//  Jb_075Class = interface(JFragmentPagerAdapterClass) // or JObjectClass // SuperSignature: android/support/v4/app/FragmentPagerAdapter
//  ['{FD803B94-4537-44BF-98C7-7BE49F413AB4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JFragmentManager): Jb_075; cdecl; //(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/b/b')]
//  Jb_075 = interface(JFragmentPagerAdapter) // or JObject // SuperSignature: android/support/v4/app/FragmentPagerAdapter
//  ['{A533CF68-AF58-4691-85A1-D39439A14D0A}']
//    { Property Methods }
//
//    { methods }
//    function getItem(P1: Integer): JFragment; cdecl; //(I)Landroid/support/v4/app/Fragment;
//    function getItemPosition(P1: JObject): Integer; cdecl; //(Ljava/lang/Object;)I
//    function a(P1: Integer): JFragment; cdecl; //(I)Landroid/support/v4/app/Fragment;
//
//    { Property }
//  end;

//  TJb_075 = class(TJavaGenericImport<Jb_075Class, Jb_075>) end;

//  Jc_076Class = interface(JRecyclerView_ViewHolderClass) // or JObjectClass // SuperSignature: android/support/v7/widget/RecyclerView$ViewHolder
//  ['{A66F3B32-4D5A-4506-82A7-DCEAE1031C28}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JView): Jc_076; cdecl; //(Landroid/content/Context;Landroid/view/View;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/b/c')]
//  Jc_076 = interface(JRecyclerView_ViewHolder) // or JObject // SuperSignature: android/support/v7/widget/RecyclerView$ViewHolder
//  ['{5A98ED99-5D65-4609-8477-DD2C97B2BB4A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): JView; cdecl; overload; //(I)Landroid/view/View;
//    function a(P1: Integer; P2: Integer): Jc; cdecl; overload; //(II)Lcom/devil/library/media/b/c;
//    function a(P1: Integer; P2: Boolean): Jc; cdecl; overload; //(IZ)Lcom/devil/library/media/b/c;
//    function a(P1: Integer; P2: JView_OnClickListener): Jc; cdecl; overload; //(ILandroid/view/View$OnClickListener;)Lcom/devil/library/media/b/c;
//
//    { Property }
//  end;

//  TJc_076 = class(TJavaGenericImport<Jc_076Class, Jc_076>) end;

//  Ja_077Class = interface(JObjectClass)
//  ['{D80D93B3-3798-475A-8A53-A076ACF233C1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_077; cdecl; //()V
//    {class} function a(P1: JString; P2: JString; P3: Integer): Ja; cdecl; //(Ljava/lang/String;Ljava/lang/String;I)Lcom/devil/library/media/c/a;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/c/a')]
//  Ja_077 = interface(JObject)
//  ['{3967EF23-1E90-4C96-BDA4-D36B799373F5}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJa_077 = class(TJavaGenericImport<Ja_077Class, Ja_077>) end;

//  Jb_078Class = interface(JObjectClass)
//  ['{4688DA7B-471F-4147-A43E-032777B443FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_078; cdecl; //()V
//    {class} function a(P1: JString; P2: JString; P3: Integer; P4: Int64; P5: JString): Jb; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/devil/library/media/c/b;
//    {class} function a(P1: JString; P2: Int64; P3: JString): Jb; cdecl; overload; //(Ljava/lang/String;JLjava/lang/String;)Lcom/devil/library/media/c/b;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/c/b')]
//  Jb_078 = interface(JObject)
//  ['{2D48F6BE-31DF-42B7-88CD-B5DF3D8EF5AD}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Int64 read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//  end;

//  TJb_078 = class(TJavaGenericImport<Jb_078Class, Jb_078>) end;

//  Ja_079Class = interface(JObjectClass)
//  ['{B3586DA0-CD02-4266-8517-B866651AA1DE}']
//    { static Property Methods }
//    {class} function _Geta: JOnSelectMediaListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/listener/OnSelectMediaListener;
//
//    { static Methods }
//    {class} procedure a(P1: JOnSelectMediaListener); cdecl; overload; //(Lcom/devil/library/media/listener/OnSelectMediaListener;)V
//    {class} procedure a; cdecl; overload; //()V
//
//    { static Property }
//    {class} property a: JOnSelectMediaListener read _Geta;
//  end;

//  [JavaSignature('com/devil/library/media/common/a')]
//  Ja_079 = interface(JObject)
//  ['{F95FB9AA-BF98-4884-90CD-79D873C9D2B8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_079 = class(TJavaGenericImport<Ja_079Class, Ja_079>) end;

  JImageLoaderClass = interface(JObjectClass)
  ['{5CA66961-1AA1-43AE-8760-36E97CD82686}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/common/ImageLoader')]
  JImageLoader = interface(IJavaInstance)
  ['{856E03A4-8C94-4F2D-942D-47BDC7214104}']
    { Property Methods }

    { methods }
    procedure displayImage(P1: JContext; P2: JString; P3: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    { Property }
  end;

  TJImageLoader = class(TJavaGenericImport<JImageLoaderClass, JImageLoader>) end;

  JDVCameraConfig_BuilderClass = interface(JObjectClass)
  ['{EFB83DAF-DFBC-423C-954B-2565EB28DF23}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVCameraConfig_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVCameraConfig$Builder')]
  JDVCameraConfig_Builder = interface(JObject)
  ['{B4C57DF2-AD9A-4A52-961A-5B3E49DF828F}']
    { Property Methods }

    { methods }
    function needCrop(P1: Boolean): JDVCameraConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function fileCachePath(P1: JString): JDVCameraConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function cropSize(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JDVCameraConfig_Builder; cdecl; //(IIII)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function aspectX(P1: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function aspectY(P1: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function outputX(P1: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function outputY(P1: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function mediaType(P1: JDVMediaType): JDVCameraConfig_Builder; cdecl; //(Lcom/devil/library/media/enumtype/DVMediaType;)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function isUseSystemCamera(P1: Boolean): JDVCameraConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function maxDuration(P1: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function flashLightEnable(P1: Boolean): JDVCameraConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function build: JDVCameraConfig; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig;

    { Property }
  end;

  TJDVCameraConfig_Builder = class(TJavaGenericImport<JDVCameraConfig_BuilderClass, JDVCameraConfig_Builder>) end;

  JDVCameraConfigClass = interface(JObjectClass)
  ['{4C432595-5182-4674-8BFE-288A6555FDDF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVCameraConfig; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVCameraConfig')]
  JDVCameraConfig = interface(JObject)
  ['{E83EA605-7E09-4DE6-BF51-56D57E4E1012}']
    { Property Methods }
    function _GetneedCrop: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetneedCrop(aneedCrop: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetfileCachePath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfileCachePath(afileCachePath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetaspectX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaspectX(aaspectX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetaspectY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaspectY(aaspectY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetoutputX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetoutputX(aoutputX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetoutputY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetoutputY(aoutputY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetmediaType: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    procedure _SetmediaType(amediaType: JDVMediaType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/media/enumtype/DVMediaType;)V
    function _GetisUseSystemCamera: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisUseSystemCamera(aisUseSystemCamera: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetmaxDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetmaxDuration(amaxDuration: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetflashLightEnable: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetflashLightEnable(aflashLightEnable: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V

    { methods }

    { Property }
    property needCrop: Boolean read _GetneedCrop write _SetneedCrop;
    property fileCachePath: JString read _GetfileCachePath write _SetfileCachePath;
    property aspectX: Integer read _GetaspectX write _SetaspectX;
    property aspectY: Integer read _GetaspectY write _SetaspectY;
    property outputX: Integer read _GetoutputX write _SetoutputX;
    property outputY: Integer read _GetoutputY write _SetoutputY;
    property mediaType: JDVMediaType read _GetmediaType write _SetmediaType;
    property isUseSystemCamera: Boolean read _GetisUseSystemCamera write _SetisUseSystemCamera;
    property maxDuration: Integer read _GetmaxDuration write _SetmaxDuration;
    property flashLightEnable: Boolean read _GetflashLightEnable write _SetflashLightEnable;
  end;

  TJDVCameraConfig = class(TJavaGenericImport<JDVCameraConfigClass, JDVCameraConfig>) end;

  JDVListConfig_BuilderClass = interface(JObjectClass)
  ['{59FC2C25-E6E0-4384-B9F0-6CA4E2FCFE6F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVListConfig_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVListConfig$Builder')]
  JDVListConfig_Builder = interface(JObject)
  ['{AFE4A4DD-5C68-43EA-9BBD-B6974E123DE4}']
    { Property Methods }

    { methods }
    function needCrop(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function multiSelect(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function maxNum(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function minNum(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function needCamera(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function cameraIconResource(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function checkIconResource(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function unCheckIconResource(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function backResourceId(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function title(P1: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function titleTextColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function titleBgColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnText(P1: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnTextColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnBgColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnBgResource(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnLayoutBgColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnLayoutBgResource(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function fileCachePath(P1: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function cropSize(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JDVListConfig_Builder; cdecl; //(IIII)Lcom/devil/library/media/config/DVListConfig$Builder;
    function aspectX(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function aspectY(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function outputX(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function outputY(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function listSpanCount(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarLightMode(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarDrakMode(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function mediaType(P1: JDVMediaType): JDVListConfig_Builder; cdecl; //(Lcom/devil/library/media/enumtype/DVMediaType;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rightTitleTextColor(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rigntTitleText(P1: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rightTitleVisibility(P1: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function hasPreview(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function quickLoadVideoThumb(P1: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function build: JDVListConfig; cdecl; //()Lcom/devil/library/media/config/DVListConfig;

    { Property }
  end;

  TJDVListConfig_Builder = class(TJavaGenericImport<JDVListConfig_BuilderClass, JDVListConfig_Builder>) end;

  JDVListConfigClass = interface(JObjectClass)
  ['{D33EBC46-5871-442C-B924-9847D8C07663}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVListConfig; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVListConfig')]
  JDVListConfig = interface(JObject)
  ['{0DD3F662-029A-4931-970C-CD7DEDEC7171}']
    { Property Methods }
    function _GetneedCrop: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetneedCrop(aneedCrop: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetmultiSelect: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetmultiSelect(amultiSelect: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetmaxNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetmaxNum(amaxNum: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetminNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetminNum(aminNum: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetneedCamera: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetneedCamera(aneedCamera: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetcameraIconResource: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcameraIconResource(acameraIconResource: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetcheckIconResource: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcheckIconResource(acheckIconResource: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetunCheckIconResource: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetunCheckIconResource(aunCheckIconResource: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetstatusBarColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetstatusBarColor(astatusBarColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetstatusBarLightMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetstatusBarLightMode(astatusBarLightMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetstatusBarDrakMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetstatusBarDrakMode(astatusBarDrakMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetbackResourceId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbackResourceId(abackResourceId: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Gettitle: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Settitle(atitle: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GettitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SettitleTextColor(atitleTextColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GettitleBgColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SettitleBgColor(atitleBgColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsureBtnText: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetsureBtnText(asureBtnText: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetsureBtnTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetsureBtnTextColor(asureBtnTextColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsureBtnBgColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetsureBtnBgColor(asureBtnBgColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsureBtnBgResource: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetsureBtnBgResource(asureBtnBgResource: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsureBtnLayoutBgColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetsureBtnLayoutBgColor(asureBtnLayoutBgColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsureBtnLayoutBgResource: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetsureBtnLayoutBgResource(asureBtnLayoutBgResource: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetfileCachePath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfileCachePath(afileCachePath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetaspectX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaspectX(aaspectX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetaspectY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaspectY(aaspectY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetoutputX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetoutputX(aoutputX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetoutputY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetoutputY(aoutputY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetlistSpanCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetlistSpanCount(alistSpanCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetmediaType: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    procedure _SetmediaType(amediaType: JDVMediaType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/media/enumtype/DVMediaType;)V
    function _GetrightTitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetrightTitleTextColor(arightTitleTextColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetrigntTitleText: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetrigntTitleText(arigntTitleText: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetrightTitleVisibility: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetrightTitleVisibility(arightTitleVisibility: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GethasPreview: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SethasPreview(ahasPreview: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetquickLoadVideoThumb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetquickLoadVideoThumb(aquickLoadVideoThumb: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V

    { methods }

    { Property }
    property needCrop: Boolean read _GetneedCrop write _SetneedCrop;
    property multiSelect: Boolean read _GetmultiSelect write _SetmultiSelect;
    property maxNum: Integer read _GetmaxNum write _SetmaxNum;
    property minNum: Integer read _GetminNum write _SetminNum;
    property needCamera: Boolean read _GetneedCamera write _SetneedCamera;
    property cameraIconResource: Integer read _GetcameraIconResource write _SetcameraIconResource;
    property checkIconResource: Integer read _GetcheckIconResource write _SetcheckIconResource;
    property unCheckIconResource: Integer read _GetunCheckIconResource write _SetunCheckIconResource;
    property statusBarColor: Integer read _GetstatusBarColor write _SetstatusBarColor;
    property statusBarLightMode: Boolean read _GetstatusBarLightMode write _SetstatusBarLightMode;
    property statusBarDrakMode: Boolean read _GetstatusBarDrakMode write _SetstatusBarDrakMode;
    property backResourceId: Integer read _GetbackResourceId write _SetbackResourceId;
    property title: JString read _Gettitle write _Settitle;
    property titleTextColor: Integer read _GettitleTextColor write _SettitleTextColor;
    property titleBgColor: Integer read _GettitleBgColor write _SettitleBgColor;
    property sureBtnText: JString read _GetsureBtnText write _SetsureBtnText;
    property sureBtnTextColor: Integer read _GetsureBtnTextColor write _SetsureBtnTextColor;
    property sureBtnBgColor: Integer read _GetsureBtnBgColor write _SetsureBtnBgColor;
    property sureBtnBgResource: Integer read _GetsureBtnBgResource write _SetsureBtnBgResource;
    property sureBtnLayoutBgColor: Integer read _GetsureBtnLayoutBgColor write _SetsureBtnLayoutBgColor;
    property sureBtnLayoutBgResource: Integer read _GetsureBtnLayoutBgResource write _SetsureBtnLayoutBgResource;
    property fileCachePath: JString read _GetfileCachePath write _SetfileCachePath;
    property aspectX: Integer read _GetaspectX write _SetaspectX;
    property aspectY: Integer read _GetaspectY write _SetaspectY;
    property outputX: Integer read _GetoutputX write _SetoutputX;
    property outputY: Integer read _GetoutputY write _SetoutputY;
    property listSpanCount: Integer read _GetlistSpanCount write _SetlistSpanCount;
    property mediaType: JDVMediaType read _GetmediaType write _SetmediaType;
    property rightTitleTextColor: Integer read _GetrightTitleTextColor write _SetrightTitleTextColor;
    property rigntTitleText: JString read _GetrigntTitleText write _SetrigntTitleText;
    property rightTitleVisibility: Integer read _GetrightTitleVisibility write _SetrightTitleVisibility;
    property hasPreview: Boolean read _GethasPreview write _SethasPreview;
    property quickLoadVideoThumb: Boolean read _GetquickLoadVideoThumb write _SetquickLoadVideoThumb;
  end;

  TJDVListConfig = class(TJavaGenericImport<JDVListConfigClass, JDVListConfig>) end;

  JDVMediaTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{EC293E6B-636A-46A7-B757-5A727E91098F}']
    { static Property Methods }
    {class} function _GetPHOTO: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function _GetVIDEO: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function _GetALL: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;

    { static Methods }
    {class} function values: TJavaObjectArray<JDVMediaType>; cdecl; //()[Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function valueOf(P1: JString): JDVMediaType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/enumtype/DVMediaType;

    { static Property }
    {class} property PHOTO: JDVMediaType read _GetPHOTO;
    {class} property VIDEO: JDVMediaType read _GetVIDEO;
    {class} property ALL: JDVMediaType read _GetALL;
  end;

  [JavaSignature('com/devil/library/media/enumtype/DVMediaType')]
  JDVMediaType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2C52E4C0-7D04-426F-806B-50B7EBFCA70A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVMediaType = class(TJavaGenericImport<JDVMediaTypeClass, JDVMediaType>) end;

//  Ja_086Class = interface(JObjectClass)
//  ['{585523E1-353F-40EF-BEE1-23870C5F5D2F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/listener/a')]
//  Ja_086 = interface(IJavaInstance)
//  ['{AA4653D8-3748-4D9E-8192-C546CD1E6CC2}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JArrayList; P2: Integer); cdecl; overload; //(Ljava/util/ArrayList;I)V
//    procedure a(P1: Jb; P2: Boolean); cdecl; overload; //(Lcom/devil/library/media/c/b;Z)V
//    function a(P1: Integer; P2: Boolean): Boolean; cdecl; overload; //(IZ)Z
//    procedure a(P1: Ja); cdecl; overload; //(Lcom/devil/library/media/c/a;)V
//
//    { Property }
//  end;

//  TJa_086 = class(TJavaGenericImport<Ja_086Class, Ja_086>) end;

  JOnSelectMediaListenerClass = interface(JObjectClass)
  ['{27A394FB-B27C-47C3-B03E-566FE54BFBF2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnSelectMediaListener')]
  JOnSelectMediaListener = interface(IJavaInstance)
  ['{ED32EDA4-41F9-4102-BF38-82981109632D}']
    { Property Methods }

    { methods }
    procedure onSelectMedia(P1: JList); cdecl; //(Ljava/util/List;)V

    { Property }
  end;

  TJOnSelectMediaListener = class(TJavaGenericImport<JOnSelectMediaListenerClass, JOnSelectMediaListener>) end;

  JMediaSelectorManagerClass = interface(JObjectClass)
  ['{901B367B-658C-4EBE-89EC-4DC5C005371C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMediaSelectorManager; cdecl; //()V
    {class} function getInstance: JMediaSelectorManager; cdecl; //()Lcom/devil/library/media/MediaSelectorManager;
    {class} function getDefaultListConfigBuilder: JDVListConfig_Builder; cdecl; //()Lcom/devil/library/media/config/DVListConfig$Builder;
    {class} function getDefaultCameraConfigBuilder: JDVCameraConfig_Builder; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig$Builder;
    {class} procedure openSelectMediaWithConfig(P1: JActivity; P2: JDVListConfig; P3: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/config/DVListConfig;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openSelectMediaWithMediaType(P1: JActivity; P2: JDVMediaType; P3: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/enumtype/DVMediaType;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openCameraWithConfig(P1: JActivity; P2: JDVCameraConfig; P3: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/config/DVCameraConfig;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openCameraWithMediaType(P1: JActivity; P2: JDVMediaType; P3: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/enumtype/DVMediaType;Lcom/devil/library/media/listener/OnSelectMediaListener;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/MediaSelectorManager')]
  JMediaSelectorManager = interface(JObject)
  ['{9E63E04E-55D9-4FF9-9F5C-61D4BE03E6BA}']
    { Property Methods }

    { methods }
    procedure initImageLoader(P1: JImageLoader); cdecl; //(Lcom/devil/library/media/common/ImageLoader;)V
    function getImageLoader: JImageLoader; cdecl; //()Lcom/devil/library/media/common/ImageLoader;
    procedure displayImage(P1: JContext; P2: JString; P3: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    function getCurrentListConfig: JDVListConfig; cdecl; //()Lcom/devil/library/media/config/DVListConfig;
    function getCurrentCameraConfig: JDVCameraConfig; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig;
    procedure clean; cdecl; //()V

    { Property }
  end;

  TJMediaSelectorManager = class(TJavaGenericImport<JMediaSelectorManagerClass, JMediaSelectorManager>) end;

//  JDVCameraActivity_1Class = interface(JObjectClass)
//  ['{849033D0-B6FB-4FF9-AEAE-1918E239C662}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$1')]
//  JDVCameraActivity_1 = interface(JObject)
//  ['{49DAFAE5-EA95-4FAF-8938-A8CB6C70B713}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_1 = class(TJavaGenericImport<JDVCameraActivity_1Class, JDVCameraActivity_1>) end;

//  JDVCameraActivity_2Class = interface(JObjectClass)
//  ['{14CA9668-5D01-4EC1-8F6C-E3E3F1F22DBF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$2')]
//  JDVCameraActivity_2 = interface(JObject)
//  ['{882C6046-DD26-481D-BAF9-92BF67C7E276}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//    procedure b; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_2 = class(TJavaGenericImport<JDVCameraActivity_2Class, JDVCameraActivity_2>) end;

//  JDVCameraActivity_3Class = interface(JObjectClass)
//  ['{BCC75235-267D-4A9F-9223-EDE48393450E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$3')]
//  JDVCameraActivity_3 = interface(JObject)
//  ['{85AC1986-74DC-40CE-A6B5-7E73B7A429C7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBitmap); cdecl; overload; //(Landroid/graphics/Bitmap;)V
//    procedure a(P1: JString; P2: JBitmap); cdecl; overload; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJDVCameraActivity_3 = class(TJavaGenericImport<JDVCameraActivity_3Class, JDVCameraActivity_3>) end;

//  JDVCameraActivity_4Class = interface(JObjectClass)
//  ['{CEFD1146-0907-49B3-A720-2D9357A3B3A5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$4')]
//  JDVCameraActivity_4 = interface(JObject)
//  ['{EE4582E0-17AD-4E9C-AE96-11215EF4BECC}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_4 = class(TJavaGenericImport<JDVCameraActivity_4Class, JDVCameraActivity_4>) end;

//  JDVCameraActivity_5Class = interface(JObjectClass)
//  ['{1AA114B8-EC3A-4338-9E52-CD51B4DCA061}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$5')]
//  JDVCameraActivity_5 = interface(JObject)
//  ['{D378C52C-D7B1-44E1-B20C-8D4763BB7936}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_5 = class(TJavaGenericImport<JDVCameraActivity_5Class, JDVCameraActivity_5>) end;

//  JDVCameraActivity_6Class = interface(JObjectClass)
//  ['{48A9682C-CE84-4EC1-B2C5-1EB7E2BEFD17}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$6')]
//  JDVCameraActivity_6 = interface(JObject)
//  ['{22020441-602F-4827-819A-8535C6107391}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_6 = class(TJavaGenericImport<JDVCameraActivity_6Class, JDVCameraActivity_6>) end;
//
//  JDVCameraActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{85B1EAE2-19AD-4FB1-8E8A-63B9229BC435}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDVCameraActivity; cdecl; //()V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity')]
//  JDVCameraActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{5AFF8C1D-3331-4E02-A7BE-6AC32B5400F0}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function a(P1: JFile): Jnet_Uri; cdecl; overload; //(Ljava/io/File;)Landroid/net/Uri;
//    procedure finish; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJDVCameraActivity = class(TJavaGenericImport<JDVCameraActivityClass, JDVCameraActivity>) end;

//  JDVEasyVideoPlayActivity_1Class = interface(JObjectClass)
//  ['{8997B4BD-45CE-49A7-9C38-8BE50E17CBC9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVEasyVideoPlayActivity$1')]
//  JDVEasyVideoPlayActivity_1 = interface(JObject)
//  ['{066A3320-0756-41A0-8448-420867509076}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVEasyVideoPlayActivity_1 = class(TJavaGenericImport<JDVEasyVideoPlayActivity_1Class, JDVEasyVideoPlayActivity_1>) end;

//  JDVEasyVideoPlayActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{A51D21AB-7BEC-4EA3-A007-CAEEFBE357CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDVEasyVideoPlayActivity; cdecl; //()V
//    {class} procedure a(P1: JContext; P2: JString); cdecl; //(Landroid/content/Context;Ljava/lang/String;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/ui/activity/DVEasyVideoPlayActivity')]
//  JDVEasyVideoPlayActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{85502606-0F05-4809-9E20-752956F03D90}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;
//
//  TJDVEasyVideoPlayActivity = class(TJavaGenericImport<JDVEasyVideoPlayActivityClass, JDVEasyVideoPlayActivity>) end;
//
//  JDVMediaSelectActivity_1Class = interface(JObjectClass)
//  ['{6B5582D8-869A-4429-B297-39C5C91EFD73}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity$1')]
//  JDVMediaSelectActivity_1 = interface(JObject)
//  ['{996B762E-35D8-4260-A6D2-3A3DA6D324D6}']
//    { Property Methods }
//
//    { methods }
//    procedure onBackStackChanged; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVMediaSelectActivity_1 = class(TJavaGenericImport<JDVMediaSelectActivity_1Class, JDVMediaSelectActivity_1>) end;

//  JDVMediaSelectActivity_2Class = interface(JObjectClass)
//  ['{DEC3D975-AD68-42F1-9D34-CF1B20B9F3B5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity$2')]
//  JDVMediaSelectActivity_2 = interface(JObject)
//  ['{0E53DF32-78B7-4EF3-AF8D-051D7DB35636}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVMediaSelectActivity_2 = class(TJavaGenericImport<JDVMediaSelectActivity_2Class, JDVMediaSelectActivity_2>) end;
//
//  JDVMediaSelectActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{AC612193-6989-47F9-865D-D73808013B3A}']
//    { static Property Methods }
//    {class} function _Geta: JHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/HashMap;
//
//    { static Methods }
//    {class} function init: JDVMediaSelectActivity; cdecl; //()V
//
//    { static Property }
//    {class} property a: JHashMap read _Geta;
//  end;
//
//  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity')]
//  JDVMediaSelectActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{5F362086-9962-4D69-B5B0-591E64B81047}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//    procedure a(P1: JArrayList; P2: Integer); cdecl; overload; //(Ljava/util/ArrayList;I)V
//    procedure a(P1: Jb; P2: Boolean); cdecl; overload; //(Lcom/devil/library/media/c/b;Z)V
//    function a(P1: Integer; P2: Boolean): Boolean; cdecl; overload; //(IZ)Z
//    procedure a(P1: Ja); cdecl; overload; //(Lcom/devil/library/media/c/a;)V
//    function a(P1: JFile): Jnet_Uri; cdecl; overload; //(Ljava/io/File;)Landroid/net/Uri;
//    procedure finish; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJDVMediaSelectActivity = class(TJavaGenericImport<JDVMediaSelectActivityClass, JDVMediaSelectActivity>) end;

//  JDVSystemCameraActivity_1Class = interface(JObjectClass)
//  ['{806C8E34-FBFA-46DF-9C74-B465117D6EC4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity$1')]
//  JDVSystemCameraActivity_1 = interface(JObject)
//  ['{E1FF6FCF-8D72-498F-8B8E-5E08CD61714A}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVSystemCameraActivity_1 = class(TJavaGenericImport<JDVSystemCameraActivity_1Class, JDVSystemCameraActivity_1>) end;

//  JDVSystemCameraActivity_2Class = interface(JObjectClass)
//  ['{986CF190-E87C-416D-88B2-B41021C98927}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity$2')]
//  JDVSystemCameraActivity_2 = interface(JObject)
//  ['{19E996B6-9D74-45AD-B73E-CCD6BF960589}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVSystemCameraActivity_2 = class(TJavaGenericImport<JDVSystemCameraActivity_2Class, JDVSystemCameraActivity_2>) end;

//  JDVSystemCameraActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{23BDB7E9-C8DB-494F-B52D-F89F91DBC2A6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDVSystemCameraActivity; cdecl; //()V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity')]
//  JDVSystemCameraActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{656D4C73-84A7-4387-99BB-10061DACDC5E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function a(P1: JFile): Jnet_Uri; cdecl; overload; //(Ljava/io/File;)Landroid/net/Uri;
//    procedure finish; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJDVSystemCameraActivity = class(TJavaGenericImport<JDVSystemCameraActivityClass, JDVSystemCameraActivity>) end;

//  JSelectMediaTempActivity_1Class = interface(JObjectClass)
//  ['{CDAE63CF-0405-4A57-9E3C-24BFC48EDAB7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/SelectMediaTempActivity$1')]
//  JSelectMediaTempActivity_1 = interface(JObject)
//  ['{E97CF114-2DC3-4500-8087-D9A1DD422D11}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJSelectMediaTempActivity_1 = class(TJavaGenericImport<JSelectMediaTempActivity_1Class, JSelectMediaTempActivity_1>) end;
//
//  JSelectMediaTempActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{5FC83951-FC44-4ABC-B4EA-D80E80D4930C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JSelectMediaTempActivity; cdecl; //()V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/ui/activity/SelectMediaTempActivity')]
//  JSelectMediaTempActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: android/support/v7/app/AppCompatActivity
//  ['{A7222FDD-B8A9-4079-BFC7-5A0F620F7FF3}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JObject; P2: JDVListConfig; P3: Integer); cdecl; overload; //(Ljava/lang/Object;Lcom/devil/library/media/config/DVListConfig;I)V
//    function a(P1: JFile): Jnet_Uri; cdecl; overload; //(Ljava/io/File;)Landroid/net/Uri;
//    procedure finish; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJSelectMediaTempActivity = class(TJavaGenericImport<JSelectMediaTempActivityClass, JSelectMediaTempActivity>) end;

//  JMediaListFragment_1Class = interface(JRecyclerView_ItemDecorationClass) // or JObjectClass // SuperSignature: android/support/v7/widget/RecyclerView$ItemDecoration
//  ['{67641334-4A3F-4ED9-8AE1-79F18077E032}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$1')]
//  JMediaListFragment_1 = interface(JRecyclerView_ItemDecoration) // or JObject // SuperSignature: android/support/v7/widget/RecyclerView$ItemDecoration
//  ['{689EAA95-AB03-4C77-87C7-0B93E56EEE16}']
//    { Property Methods }
//
//    { methods }
//    procedure getItemOffsets(P1: JRect; P2: JView; P3: JRecyclerView; P4: JRecyclerView_State); cdecl; //(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_1 = class(TJavaGenericImport<JMediaListFragment_1Class, JMediaListFragment_1>) end;

//  JMediaListFragment_2Class = interface(JObjectClass)
//  ['{C1D4CF18-9B23-463C-97A1-A662328C7459}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$2')]
//  JMediaListFragment_2 = interface(JObject)
//  ['{EC238F63-8920-4C51-ADE2-A8ACD3DFE4D8}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: Boolean); cdecl; //(IZ)V
//    function b(P1: Integer; P2: Boolean): Boolean; cdecl; //(IZ)Z
//
//    { Property }
//  end;

//  TJMediaListFragment_2 = class(TJavaGenericImport<JMediaListFragment_2Class, JMediaListFragment_2>) end;

//  JMediaListFragment_3Class = interface(JObjectClass)
//  ['{D1030179-3552-4F7D-8247-19E0D3694D04}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$3')]
//  JMediaListFragment_3 = interface(JObject)
//  ['{0C82325C-3FCA-4F3D-BADE-D988029CC416}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc; P2: Integer); cdecl; //(Lcom/devil/library/media/b/c;I)V
//
//    { Property }
//  end;

//  TJMediaListFragment_3 = class(TJavaGenericImport<JMediaListFragment_3Class, JMediaListFragment_3>) end;

//  JMediaListFragment_4Class = interface(JObjectClass)
//  ['{361F7FE9-04EE-4EC2-A923-307510291874}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$4')]
//  JMediaListFragment_4 = interface(JObject)
//  ['{8181B524-97F8-4BB4-8B8B-1AAAFA8EC09E}']
//    { Property Methods }
//
//    { methods }
//    procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl; //(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
//
//    { Property }
//  end;

//  TJMediaListFragment_4 = class(TJavaGenericImport<JMediaListFragment_4Class, JMediaListFragment_4>) end;

//  JMediaListFragment_5Class = interface(JObjectClass)
//  ['{9F050809-19A0-4DF1-B7C8-B0AB3119CCD6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$5')]
//  JMediaListFragment_5 = interface(JObject)
//  ['{739E08D8-729D-403D-A809-4ED5D988CE9A}']
//    { Property Methods }
//
//    { methods }
//    procedure onDismiss; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaListFragment_5 = class(TJavaGenericImport<JMediaListFragment_5Class, JMediaListFragment_5>) end;

//  JMediaListFragment_6Class = interface(JObjectClass)
//  ['{E330EB11-C697-43E9-9C5D-2D2A0CA5173A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$6')]
//  JMediaListFragment_6 = interface(JObject)
//  ['{923EEF15-7C52-413F-8939-556164D18060}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaListFragment_6 = class(TJavaGenericImport<JMediaListFragment_6Class, JMediaListFragment_6>) end;

//  JMediaListFragment_7Class = interface(JObjectClass)
//  ['{6E42182A-75B7-4AD6-8D4D-F65E106FF5CA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$7')]
//  JMediaListFragment_7 = interface(JObject)
//  ['{7AFD0BB8-A4D0-4F3D-8103-C14C344B0A37}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_7 = class(TJavaGenericImport<JMediaListFragment_7Class, JMediaListFragment_7>) end;

//  JMediaListFragment_8Class = interface(JObjectClass)
//  ['{B9217333-9787-4F4F-833A-D5A2E372A19E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$8')]
//  JMediaListFragment_8 = interface(JObject)
//  ['{9703A28E-1A02-498C-9F40-1E9F46580B15}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_8 = class(TJavaGenericImport<JMediaListFragment_8Class, JMediaListFragment_8>) end;

//  JMediaListFragment_9_1Class = interface(JObjectClass)
//  ['{5FEEA5B8-0445-46D5-B5AD-D60A12C22F92}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$9$1')]
//  JMediaListFragment_9_1 = interface(JObject)
//  ['{3F02EB57-E82A-422D-BE32-92F65FEE1B65}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_9_1 = class(TJavaGenericImport<JMediaListFragment_9_1Class, JMediaListFragment_9_1>) end;

//  JMediaListFragment_9Class = interface(JObjectClass)
//  ['{552BC063-B471-458D-8D56-6DD8B71ACF7F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$9')]
//  JMediaListFragment_9 = interface(JObject)
//  ['{AAF2D34F-B794-4070-8B53-EB06FF7A2027}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_9 = class(TJavaGenericImport<JMediaListFragment_9Class, JMediaListFragment_9>) end;

  JMediaListFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
  ['{3087BA2E-CE4F-4E59-B3F8-8BE01E18E438}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMediaListFragment; cdecl; //()V
    {class} function a: JMediaListFragment; cdecl; overload; //()Lcom/devil/library/media/ui/fragment/MediaListFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment')]
  JMediaListFragment = interface(JFragment) // or JObject // SuperSignature: android/support/v4/app/Fragment
  ['{A93DF8D3-0CF1-4F72-B62E-D54D2F74FB58}']
    { Property Methods }
//    function _Geta: JFragmentActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/support/v4/app/FragmentActivity;
//    procedure _Seta(aa: JFragmentActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/support/v4/app/FragmentActivity;)V
    function _Getb: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/view/View;
    procedure _Setb(ab: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/view/View;)V

    { methods }
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function a(P1: Integer): JView; cdecl; overload; //(I)Landroid/view/View;
//    procedure a(P1: Ja); cdecl; overload; //(Lcom/devil/library/media/listener/a;)V
    procedure b; cdecl; overload; //()V
    procedure b(P1: Integer); cdecl; overload; //(I)V
    procedure a(P1: JView); cdecl; overload; //(Landroid/view/View;)V
    procedure a(P1: Single); cdecl; overload; //(F)V
    procedure c; cdecl; //()V

    { Property }
//    property a: JFragmentActivity read _Geta write _Seta;
//    property b: JView read _Getb write _Setb;
  end;

  TJMediaListFragment = class(TJavaGenericImport<JMediaListFragmentClass, JMediaListFragment>) end;

//  JWatchMediaFragment_1Class = interface(JObjectClass)
//  ['{F9EF3463-FCCE-45AD-B4BC-1A88BBE9F8BE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaFragment$1')]
//  JWatchMediaFragment_1 = interface(JObject)
//  ['{189E1602-E63B-44C5-99BF-464EC668E6B2}']
//    { Property Methods }
//
//    { methods }
//    procedure onPageScrolled(P1: Integer; P2: Single; P3: Integer); cdecl; //(IFI)V
//    procedure onPageSelected(P1: Integer); cdecl; //(I)V
//    procedure onPageScrollStateChanged(P1: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJWatchMediaFragment_1 = class(TJavaGenericImport<JWatchMediaFragment_1Class, JWatchMediaFragment_1>) end;

  JWatchMediaFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
  ['{5F249322-5B9C-4C53-AFAA-9A78B2ACC210}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWatchMediaFragment; cdecl; //()V
    {class} function a: JWatchMediaFragment; cdecl; overload; //()Lcom/devil/library/media/ui/fragment/WatchMediaFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaFragment')]
  JWatchMediaFragment = interface(JFragment) // or JObject // SuperSignature: android/support/v4/app/Fragment
  ['{4B90DA09-7D97-473F-9815-D54F5E02ACBF}']
    { Property Methods }
//    function _Geta: JFragmentActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/support/v4/app/FragmentActivity;
//    procedure _Seta(aa: JFragmentActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/support/v4/app/FragmentActivity;)V
    function _Getb: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/view/View;
    procedure _Setb(ab: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/view/View;)V

    { methods }
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function a(P1: Integer): JView; cdecl; overload; //(I)Landroid/view/View;
//    procedure a(P1: Ja); cdecl; overload; //(Lcom/devil/library/media/listener/a;)V
    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V

    { Property }
//    property a: JFragmentActivity read _Geta write _Seta;
    property b: JView read _Getb write _Setb;
  end;

  TJWatchMediaFragment = class(TJavaGenericImport<JWatchMediaFragmentClass, JWatchMediaFragment>) end;

//  JWatchMediaVPItemFragment_1Class = interface(JObjectClass)
//  ['{84690129-F08A-45D5-94D5-27F88FEDA416}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment$1')]
//  JWatchMediaVPItemFragment_1 = interface(JObject)
//  ['{2C6D35E3-788B-48E4-8F2C-08E6FA48631A}']
//    { Property Methods }
//
//    { methods }
//    procedure onPhotoTap(P1: JImageView; P2: Single; P3: Single); cdecl; //(Landroid/widget/ImageView;FF)V
//
//    { Property }
//  end;

//  TJWatchMediaVPItemFragment_1 = class(TJavaGenericImport<JWatchMediaVPItemFragment_1Class, JWatchMediaVPItemFragment_1>) end;

//  JWatchMediaVPItemFragment_2Class = interface(JObjectClass)
//  ['{617B2134-E1C8-4C5D-BE0F-79F3396FDF92}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment$2')]
//  JWatchMediaVPItemFragment_2 = interface(JObject)
//  ['{0BD3313A-E074-4CCA-AAE0-0809BE211E82}']
//    { Property Methods }
//
//    { methods }
//    procedure onOutsidePhotoTap(P1: JImageView); cdecl; //(Landroid/widget/ImageView;)V
//
//    { Property }
//  end;

//  TJWatchMediaVPItemFragment_2 = class(TJavaGenericImport<JWatchMediaVPItemFragment_2Class, JWatchMediaVPItemFragment_2>) end;

  JWatchMediaVPItemFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
  ['{07F63264-190E-4FEA-80F1-712276685E55}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWatchMediaVPItemFragment; cdecl; //()V
//    {class} function a(P1: Jb): JWatchMediaVPItemFragment; cdecl; overload; //(Lcom/devil/library/media/c/b;)Lcom/devil/library/media/ui/fragment/WatchMediaVPItemFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment')]
  JWatchMediaVPItemFragment = interface(JFragment) // or JObject // SuperSignature: android/support/v4/app/Fragment
  ['{BC62C657-CD99-4233-947C-58E0E4B25375}']
    { Property Methods }

    { methods }
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function a(P1: Integer): JView; cdecl; overload; //(I)Landroid/view/View;
    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJWatchMediaVPItemFragment = class(TJavaGenericImport<JWatchMediaVPItemFragmentClass, JWatchMediaVPItemFragment>) end;

//  Ja_122Class = interface(JObjectClass)
//  ['{F7AA9611-6516-4291-8519-0BB3B9BCDF30}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: Single): Integer; cdecl; //(Landroid/content/Context;F)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/a')]
//  Ja_122 = interface(JObject)
//  ['{992BF7AF-4166-42A0-BF20-27B10BDE84C9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_122 = class(TJavaGenericImport<Ja_122Class, Ja_122>) end;

//  Jb_123Class = interface(JObjectClass)
//  ['{F98DDC3E-B4E6-4EA8-88D5-0213D54BDBAE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JString; cdecl; overload; //(Landroid/content/Context;)Ljava/lang/String;
//    {class} function a: Boolean; cdecl; overload; //()Z
//    {class} function a(P1: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
//    {class} function a(P1: JFile): JString; cdecl; overload; //(Ljava/io/File;)Ljava/lang/String;
//    {class} function b(P1: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
//    {class} function b(P1: JContext): JString; cdecl; overload; //(Landroid/content/Context;)Ljava/lang/String;
//    {class} function a(P1: JBitmap; P2: JFile; P3: JBitmap_CompressFormat; P4: Boolean): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;Z)Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/b')]
//  Jb_123 = interface(JObject)
//  ['{EAD82566-EB80-4A08-A58B-9297031C6215}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_123 = class(TJavaGenericImport<Jb_123Class, Jb_123>) end;

//  Jc_124Class = interface(JObjectClass)
//  ['{77EAF37D-D776-4852-BBFD-B97CBF9E1F7F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: Integer; P3: Integer): JGridLayoutManager; cdecl; //(Landroid/content/Context;II)Landroid/support/v7/widget/GridLayoutManager;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/c')]
//  Jc_124 = interface(JObject)
//  ['{1C1878CA-F77F-4489-8A51-81FDE969DDDE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_124 = class(TJavaGenericImport<Jc_124Class, Jc_124>) end;

//  Jd_1_1Class = interface(JObjectClass)
//  ['{09471075-CB6C-4572-A95B-CD70ACE93BF3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d$1$1')]
//  Jd_1_1 = interface(JObject)
//  ['{196C5323-66A7-4B36-8CE0-DF7A5A639D6D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJd_1_1 = class(TJavaGenericImport<Jd_1_1Class, Jd_1_1>) end;

//  Jd_1_126Class = interface(JObjectClass)
//  ['{2168A8C5-F620-499E-A985-D5C62625A674}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d$1')]
//  Jd_1_126 = interface(JObject)
//  ['{30E2E4E2-B5C5-406E-B216-245C687974B7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJd_1_126 = class(TJavaGenericImport<Jd_1_126Class, Jd_1_126>) end;

//  Jd_2_1Class = interface(JObjectClass)
//  ['{1993231D-7D74-4EEA-9EFB-C2AA96B733D2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d$2$1')]
//  Jd_2_1 = interface(JObject)
//  ['{6B6FDA45-AFAB-4970-979E-B08BECA4092A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJd_2_1 = class(TJavaGenericImport<Jd_2_1Class, Jd_2_1>) end;

//  Jd_2_128Class = interface(JObjectClass)
//  ['{C090F01A-6F6B-475B-89B1-766F898EB21A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d$2')]
//  Jd_2_128 = interface(JObject)
//  ['{560F65F1-D3C5-4C6A-8493-BD8013FEA2C3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJd_2_128 = class(TJavaGenericImport<Jd_2_128Class, Jd_2_128>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{C2270E82-36C2-47C5-A30C-4098F13B4903}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d$a')]
//  Jd_a = interface(IJavaInstance)
//  ['{338D9585-27CA-4414-99B8-C74D32030769}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_130Class = interface(JObjectClass)
//  ['{128BE5F3-0CFE-406F-B1AF-F185AB10C148}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JActivity; P2: Jd_a); cdecl; overload; //(Landroid/app/Activity;Lcom/devil/library/media/utils/d$a;)V
//    {class} procedure a(P1: JActivity; P2: Boolean; P3: Jd_a); cdecl; overload; //(Landroid/app/Activity;ZLcom/devil/library/media/utils/d$a;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/d')]
//  Jd_130 = interface(JObject)
//  ['{E5BA5142-E4CE-48DD-915D-962B890688DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_130 = class(TJavaGenericImport<Jd_130Class, Jd_130>) end;

  JDVFileProviderClass = interface(JFileProviderClass) // or JObjectClass // SuperSignature: android/support/v4/content/FileProvider
  ['{BEF789AF-FE40-4E44-967B-F9F204C52026}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVFileProvider; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/DVFileProvider')]
  JDVFileProvider = interface(JFileProvider) // or JObject // SuperSignature: android/support/v4/content/FileProvider
  ['{1AF4411F-7997-4094-B315-D17FF2D82589}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVFileProvider = class(TJavaGenericImport<JDVFileProviderClass, JDVFileProvider>) end;

//  Je_aClass = interface(JObjectClass)
//  ['{9880B87F-6AE7-4DAF-BCBD-1228FE913C53}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/e$a')]
//  Je_a = interface(JObject)
//  ['{86B24D57-FB7F-4799-8D53-1B05D64E2F39}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_133Class = interface(JObjectClass)
//  ['{B6F2FD7C-6617-4A11-A1F4-D0C4E009107B}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//
//    { static Methods }
//    {class} function a(P1: Integer): Boolean; cdecl; overload; //(I)Z
//    {class} function a(P1: JString): Je_a; cdecl; overload; //(Ljava/lang/String;)Lcom/devil/library/media/utils/e$a;
//    {class} function b(P1: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
//
//    { static Property }
//    {class} property a: JString read _Geta;
//  end;

//  [JavaSignature('com/devil/library/media/utils/e')]
//  Je_133 = interface(JObject)
//  ['{B2B6B2E2-563D-4A88-883C-2C89DCF93741}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_133 = class(TJavaGenericImport<Je_133Class, Je_133>) end;

//  Jf_134Class = interface(JObjectClass)
//  ['{74C118E8-28B8-427E-B123-3B2C60E1AC33}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JActivity; P2: Integer); cdecl; overload; //(Landroid/app/Activity;I)V
//    {class} procedure a(P1: JActivity; P2: Integer; P3: Integer); cdecl; overload; //(Landroid/app/Activity;II)V
//    {class} procedure a(P1: JActivity); cdecl; overload; //(Landroid/app/Activity;)V
//    {class} procedure b(P1: JActivity); cdecl; //(Landroid/app/Activity;)V
//    {class} function a(P1: JContext): Integer; cdecl; overload; //(Landroid/content/Context;)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/f')]
//  Jf_134 = interface(JObject)
//  ['{C23C0D27-8CA2-4ABA-8D43-67018DB4D922}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_134 = class(TJavaGenericImport<Jf_134Class, Jf_134>) end;
//
//  JHackyViewPagerClass = interface(JViewPagerClass) // or JObjectClass // SuperSignature: android/support/v4/view/ViewPager
//  ['{F8D6F0FF-52C4-402B-AD12-B767FB34E29E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JHackyViewPager; cdecl; overload; //(Landroid/content/Context;)V
//    {class} function init(P1: JContext; P2: JAttributeSet): JHackyViewPager; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/view/HackyViewPager')]
//  JHackyViewPager = interface(JViewPager) // or JObject // SuperSignature: android/support/v4/view/ViewPager
//  ['{6E1435DA-A221-4EC5-9F0A-25DAF2A2090F}']
//    { Property Methods }
//
//    { methods }
//    function onInterceptTouchEvent(P1: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//
//    { Property }
//  end;
//
//  TJHackyViewPager = class(TJavaGenericImport<JHackyViewPagerClass, JHackyViewPager>) end;
//
//  JRatioImageViewClass = interface(JAppCompatImageViewClass) // or JObjectClass // SuperSignature: android/support/v7/widget/AppCompatImageView
//  ['{A6A8CA13-92EF-4067-BBAC-E598A18BBE56}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JRatioImageView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
//    {class} function init(P1: JContext; P2: JAttributeSet): JRatioImageView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
//    {class} function init(P1: JContext): JRatioImageView; cdecl; overload; //(Landroid/content/Context;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/devil/library/media/view/RatioImageView')]
//  JRatioImageView = interface(JAppCompatImageView) // or JObject // SuperSignature: android/support/v7/widget/AppCompatImageView
//  ['{97DA68F5-94C0-4BE1-86F9-FC0C641C878C}']
//    { Property Methods }
//
//    { methods }
//    procedure setRatio(P1: Single); cdecl; //(F)V
//
//    { Property }
//  end;
//
//  TJRatioImageView = class(TJavaGenericImport<JRatioImageViewClass, JRatioImageView>) end;

  JSquareRelativeLayoutClass = interface(JRelativeLayoutClass) // or JObjectClass // SuperSignature: android/widget/RelativeLayout
  ['{9866D53D-F8B4-4E1D-9125-6878F5F2DAAE}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(P1: JContext; P2: JAttributeSet): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(P1: JContext): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/SquareRelativeLayout')]
  JSquareRelativeLayout = interface(JRelativeLayout) // or JObject // SuperSignature: android/widget/RelativeLayout
  ['{4933F740-34B5-4A81-AE45-9B1296E2E9FC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSquareRelativeLayout = class(TJavaGenericImport<JSquareRelativeLayoutClass, JSquareRelativeLayout>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Je',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Je));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jf',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jf));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_a',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_a));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_b',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_b));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_c',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_c));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_d',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_d));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_e',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_e));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_014',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_014));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_015',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_015));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_016',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_016));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc_017',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc_017));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_020',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_020));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Je_021',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Je_021));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_022',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_022));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_a',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_a));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_025',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_025));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc_026',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc_026));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_027',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_027));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Je_028',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Je_028));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jf_029',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jf_029));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jg',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jg));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_4',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_4));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_5',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_5));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_a',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_a));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_b',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton_b));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureButton',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureButton));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_4',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_4));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_5',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_5));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_6',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_6));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_7',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout_7));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JCaptureLayout));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_047',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_047));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JFoucsView',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JFoucsView));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_3_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_3_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_4',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_4));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_5',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_5));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_6',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_6));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_7_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_7_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_7',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_7));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_8',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_8));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView_9));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JJCameraView',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JJCameraView));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JReturnButton',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JReturnButton));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JTypeButton',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JTypeButton));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_a_065',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_a_065));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_066',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_066));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_1_067',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_1_067));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_a_069',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_a_069));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_070',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_070));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc_071',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc_071));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_1_072',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_1_072));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_a_073',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_a_073));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_074',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_074));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_075',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_075));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc_076',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc_076));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_077',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_077));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_078',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_078));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_079',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_079));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JImageLoader',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JImageLoader));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraConfig_Builder',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraConfig_Builder));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraConfig',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVListConfig_Builder',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVListConfig_Builder));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVListConfig',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVListConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVMediaType',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVMediaType));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_086',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_086));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JOnSelectMediaListener',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JOnSelectMediaListener));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaSelectorManager',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaSelectorManager));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_4',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_4));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_5',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_5));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_6',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity_6));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVCameraActivity));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVEasyVideoPlayActivity_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVEasyVideoPlayActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVEasyVideoPlayActivity',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVEasyVideoPlayActivity));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVMediaSelectActivity));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVSystemCameraActivity));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JSelectMediaTempActivity_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JSelectMediaTempActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JSelectMediaTempActivity',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JSelectMediaTempActivity));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_2));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_3',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_3));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_4',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_4));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_5',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_5));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_6',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_6));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_7',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_7));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_8',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_8));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_9_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_9_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_9',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment_9));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JMediaListFragment));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JWatchMediaFragment_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JWatchMediaFragment_1));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JWatchMediaFragment',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JWatchMediaFragment));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment_2',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment_2));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JWatchMediaVPItemFragment));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Ja_122',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Ja_122));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jb_123',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jb_123));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jc_124',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jc_124));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_1_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_1_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_1_126',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_1_126));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_2_1',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_2_1));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_2_128',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_2_128));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_a',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_a));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jd_130',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jd_130));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JDVFileProvider',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JDVFileProvider));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Je_a',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Je_a));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Je_133',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Je_133));
////  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.Jf_134',
////    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.Jf_134));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JHackyViewPager',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JHackyViewPager));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JRatioImageView',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JRatioImageView));
//  TRegTypes.RegisterType('Androidapi.JNI.mediaselector_1_0_0.JSquareRelativeLayout',
//    TypeInfo(Androidapi.JNI.mediaselector_1_0_0.JSquareRelativeLayout));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
