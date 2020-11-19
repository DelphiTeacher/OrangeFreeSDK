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
//  生成时间：2020-11-15 19:34:34
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.DVMediaSelector_2_0_1;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.GraphicsContentViewText, 
//  Androidapi.JNI.com.cgfay.filter.glfilter.resource.bean.ResourceData,
//  Androidapi.JNI.androidx.recyclerview.widget.RecyclerView_ViewHolder,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.Widget, 
//  Androidapi.JNI.android.animation.ValueAnimator,
//  Androidapi.JNI.android.animation.Animator,
  Androidapi.JNI.Util,
  Androidapi.JNI.App, 
  Androidapi.JNI.OpenGL,
//  Androidapi.JNI.com.cgfay.filter.glfilter.color.bean.DynamicColor,
//  Androidapi.JNI.com.cgfay.filter.glfilter.makeup.bean.DynamicMakeup,
  Androidapi.JNI.Media,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.java.nio.ShortBuffer,
  Androidapi.JNI.os,
//  Androidapi.JNI.com.cgfay.filter.glfilter.beauty.bean.BeautyParam,
//  Androidapi.JNI.com.cgfay.filter.glfilter.stickers.StaticStickerNormalFilter,
//  Androidapi.JNI.com.cgfay.filter.glfilter.stickers.bean.DynamicSticker,
//  Androidapi.JNI.androidx.fragment.app.FragmentManager,
//  Androidapi.JNI.androidx.fragment.app.Fragment,
//  Androidapi.JNI.androidx.recyclerview.widget.RecyclerView,
//  Androidapi.JNI.androidx.recyclerview.widget.RecyclerView_State,
//  Androidapi.JNI.androidx.fragment.app.FragmentActivity,
//  Androidapi.JNI.androidx.recyclerview.widget.LinearLayoutManager,
//  Androidapi.JNI.androidx.recyclerview.widget.GridLayoutManager,
//  Androidapi.JNI.androidx.drawerlayout.widget.DrawerLayout,
  Androidapi.JNI.Net;


type

// ===== Forward declarations =====

//  JFilterAdapter_1 = interface; //com.devil.library.camera.adapter.FilterAdapter$1
  JFilterAdapter_FilterHolder = interface; //com.devil.library.camera.adapter.FilterAdapter$FilterHolder
//  JFilterAdapter_onFilterChangeListener = interface; //com.devil.library.camera.adapter.FilterAdapter$onFilterChangeListener
  JFilterAdapter = interface; //com.devil.library.camera.adapter.FilterAdapter
  JFilterTypeHelper = interface; //com.devil.library.camera.adapter.FilterTypeHelper
//  JCameraInterface_1 = interface; //com.devil.library.camera.CameraInterface$1
//  JCameraInterface_2 = interface; //com.devil.library.camera.CameraInterface$2
//  JCameraInterface_3 = interface; //com.devil.library.camera.CameraInterface$3
  JCameraInterface_CameraOpenOverCallback = interface; //com.devil.library.camera.CameraInterface$CameraOpenOverCallback
  JCameraInterface_ErrorCallback = interface; //com.devil.library.camera.CameraInterface$ErrorCallback
  JCameraInterface_FocusCallback = interface; //com.devil.library.camera.CameraInterface$FocusCallback
  JCameraInterface_StopRecordCallback = interface; //com.devil.library.camera.CameraInterface$StopRecordCallback
  JCameraInterface_TakePictureCallback = interface; //com.devil.library.camera.CameraInterface$TakePictureCallback
  JCameraInterface = interface; //com.devil.library.camera.CameraInterface
//  JCaptureButton_1 = interface; //com.devil.library.camera.CaptureButton$1
//  JCaptureButton_2 = interface; //com.devil.library.camera.CaptureButton$2
//  JCaptureButton_3 = interface; //com.devil.library.camera.CaptureButton$3
//  JCaptureButton_4 = interface; //com.devil.library.camera.CaptureButton$4
//  JCaptureButton_5 = interface; //com.devil.library.camera.CaptureButton$5
  JCaptureButton_LongPressRunnable = interface; //com.devil.library.camera.CaptureButton$LongPressRunnable
  JCaptureButton_RecordCountDownTimer = interface; //com.devil.library.camera.CaptureButton$RecordCountDownTimer
  JCaptureButton = interface; //com.devil.library.camera.CaptureButton
//  JCaptureLayout_1 = interface; //com.devil.library.camera.CaptureLayout$1
//  JCaptureLayout_2 = interface; //com.devil.library.camera.CaptureLayout$2
//  JCaptureLayout_3 = interface; //com.devil.library.camera.CaptureLayout$3
//  JCaptureLayout_4 = interface; //com.devil.library.camera.CaptureLayout$4
//  JCaptureLayout_5 = interface; //com.devil.library.camera.CaptureLayout$5
//  JCaptureLayout_6 = interface; //com.devil.library.camera.CaptureLayout$6
//  JCaptureLayout_7 = interface; //com.devil.library.camera.CaptureLayout$7
  JCaptureLayout = interface; //com.devil.library.camera.CaptureLayout
  JFoucsView = interface; //com.devil.library.camera.FoucsView
//  JCameraApi_1 = interface; //com.devil.library.camera.helper.CameraApi$1
  JCameraApi_CompareAreaSize = interface; //com.devil.library.camera.helper.CameraApi$CompareAreaSize
  JCameraApi = interface; //com.devil.library.camera.helper.CameraApi
//  JCameraController_1 = interface; //com.devil.library.camera.helper.CameraController$1
  JCameraController = interface; //com.devil.library.camera.helper.CameraController
//  JCameraPreviewPresenter_1 = interface; //com.devil.library.camera.helper.CameraPreviewPresenter$1
//  JCameraPreviewPresenter_2 = interface; //com.devil.library.camera.helper.CameraPreviewPresenter$2
  JCameraPreviewPresenter = interface; //com.devil.library.camera.helper.CameraPreviewPresenter
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
  JCaptureListener = interface; //com.devil.library.camera.listener.CaptureListener
  JClickListener = interface; //com.devil.library.camera.listener.ClickListener
  JErrorListener = interface; //com.devil.library.camera.listener.ErrorListener
  JFocusCallback = interface; //com.devil.library.camera.listener.FocusCallback
  JJCameraListener = interface; //com.devil.library.camera.listener.JCameraListener
  JOnCaptureListener = interface; //com.devil.library.camera.listener.OnCaptureListener
  JOnFpsListener = interface; //com.devil.library.camera.listener.OnFpsListener
  JOnFrameAvailableListener = interface; //com.devil.library.camera.listener.OnFrameAvailableListener
  JOnPreviewCaptureListener_MediaType = interface; //com.devil.library.camera.listener.OnPreviewCaptureListener$MediaType
  JOnPreviewCaptureListener = interface; //com.devil.library.camera.listener.OnPreviewCaptureListener
  JOnRecordListener = interface; //com.devil.library.camera.listener.OnRecordListener
  JOnRecordStateListener = interface; //com.devil.library.camera.listener.OnRecordStateListener
  JOnSurfaceTextureListener = interface; //com.devil.library.camera.listener.OnSurfaceTextureListener
  JPreviewCallback = interface; //com.devil.library.camera.listener.PreviewCallback
  JResultListener = interface; //com.devil.library.camera.listener.ResultListener
  JReturnListener = interface; //com.devil.library.camera.listener.ReturnListener
  JTypeListener = interface; //com.devil.library.camera.listener.TypeListener
  JAudioEncoder = interface; //com.devil.library.camera.media.AudioEncoder
  JAudioRecorder = interface; //com.devil.library.camera.media.AudioRecorder
  JAudioTranscoder_UnhandledFormatException = interface; //com.devil.library.camera.media.AudioTranscoder$UnhandledFormatException
  JAudioTranscoder = interface; //com.devil.library.camera.media.AudioTranscoder
  JHWMediaRecorder = interface; //com.devil.library.camera.media.HWMediaRecorder
  JSonic = interface; //com.devil.library.camera.media.Sonic
  JVideoEncoder_OnEncodingListener = interface; //com.devil.library.camera.media.VideoEncoder$OnEncodingListener
  JVideoEncoder = interface; //com.devil.library.camera.media.VideoEncoder
  JVideoRecorder_RecordHandler = interface; //com.devil.library.camera.media.VideoRecorder$RecordHandler
  JVideoRecorder = interface; //com.devil.library.camera.media.VideoRecorder
  JAspectRatio = interface; //com.devil.library.camera.params.AspectRatio
  JAudioParams = interface; //com.devil.library.camera.params.AudioParams
  JCalculateType = interface; //com.devil.library.camera.params.CalculateType
  JCameraParam = interface; //com.devil.library.camera.params.CameraParam
  JMediaInfo = interface; //com.devil.library.camera.params.MediaInfo
  JMediaType = interface; //com.devil.library.camera.params.MediaType
  JRecordInfo = interface; //com.devil.library.camera.params.RecordInfo
  JVideoParams = interface; //com.devil.library.camera.params.VideoParams
  JCameraRenderer = interface; //com.devil.library.camera.render.CameraRenderer
  JCameraRenderHandler = interface; //com.devil.library.camera.render.CameraRenderHandler
  JFrameRateMeter = interface; //com.devil.library.camera.render.FrameRateMeter
  JGLImageReader_ImageAvailable = interface; //com.devil.library.camera.render.GLImageReader$ImageAvailable
  JGLImageReader_ImageReceiveListener = interface; //com.devil.library.camera.render.GLImageReader$ImageReceiveListener
  JGLImageReader = interface; //com.devil.library.camera.render.GLImageReader
  JRenderIndex = interface; //com.devil.library.camera.render.RenderIndex
  JRenderManager = interface; //com.devil.library.camera.render.RenderManager
  JScaleType = interface; //com.devil.library.camera.render.ScaleType
  JReturnButton = interface; //com.devil.library.camera.ReturnButton
  JBorrowPictureState = interface; //com.devil.library.camera.state.BorrowPictureState
  JBorrowVideoState = interface; //com.devil.library.camera.state.BorrowVideoState
  JCameraMachine = interface; //com.devil.library.camera.state.CameraMachine
//  JPreviewState_1 = interface; //com.devil.library.camera.state.PreviewState$1
//  JPreviewState_2 = interface; //com.devil.library.camera.state.PreviewState$2
  JPreviewState = interface; //com.devil.library.camera.state.PreviewState
  JState = interface; //com.devil.library.camera.state.State
  JTypeButton = interface; //com.devil.library.camera.TypeButton
  JAngleUtil = interface; //com.devil.library.camera.util.AngleUtil
  JAudioUtil = interface; //com.devil.library.camera.util.AudioUtil
//  JCameraParamUtil_1 = interface; //com.devil.library.camera.util.CameraParamUtil$1
  JCameraParamUtil_CameraSizeComparator = interface; //com.devil.library.camera.util.CameraParamUtil$CameraSizeComparator
  JCameraParamUtil = interface; //com.devil.library.camera.util.CameraParamUtil
  JCheckPermission = interface; //com.devil.library.camera.util.CheckPermission
  JDeviceUtil = interface; //com.devil.library.camera.util.DeviceUtil
  JFileUtil = interface; //com.devil.library.camera.util.FileUtil
  JLogUtil = interface; //com.devil.library.camera.util.LogUtil
  JScreenUtils = interface; //com.devil.library.camera.util.ScreenUtils
  JCameraView = interface; //com.devil.library.camera.view.CameraView
//  JDVCameraView_1 = interface; //com.devil.library.camera.view.DVCameraView$1
//  JDVCameraView_10 = interface; //com.devil.library.camera.view.DVCameraView$10
//  JDVCameraView_11 = interface; //com.devil.library.camera.view.DVCameraView$11
//  JDVCameraView_12 = interface; //com.devil.library.camera.view.DVCameraView$12
//  JDVCameraView_13 = interface; //com.devil.library.camera.view.DVCameraView$13
//  JDVCameraView_14 = interface; //com.devil.library.camera.view.DVCameraView$14
//  JDVCameraView_2 = interface; //com.devil.library.camera.view.DVCameraView$2
//  JDVCameraView_3 = interface; //com.devil.library.camera.view.DVCameraView$3
//  JDVCameraView_4 = interface; //com.devil.library.camera.view.DVCameraView$4
//  JDVCameraView_5 = interface; //com.devil.library.camera.view.DVCameraView$5
//  JDVCameraView_6 = interface; //com.devil.library.camera.view.DVCameraView$6
//  JDVCameraView_7 = interface; //com.devil.library.camera.view.DVCameraView$7
//  JDVCameraView_8 = interface; //com.devil.library.camera.view.DVCameraView$8
//  JDVCameraView_9 = interface; //com.devil.library.camera.view.DVCameraView$9
  JDVCameraView = interface; //com.devil.library.camera.view.DVCameraView
//  JDVTextureView_1 = interface; //com.devil.library.camera.view.DVTextureView$1
//  JDVTextureView_2 = interface; //com.devil.library.camera.view.DVTextureView$2
  JDVTextureView_OnMultiClickListener = interface; //com.devil.library.camera.view.DVTextureView$OnMultiClickListener
  JDVTextureView_OnTouchScroller = interface; //com.devil.library.camera.view.DVTextureView$OnTouchScroller
  JDVTextureView = interface; //com.devil.library.camera.view.DVTextureView
  JFolderLVAdapter_ViewHolder = interface; //com.devil.library.media.adapter.FolderLVAdapter$ViewHolder
  JFolderLVAdapter = interface; //com.devil.library.media.adapter.FolderLVAdapter
//  JMediaRVAdapter_1 = interface; //com.devil.library.media.adapter.MediaRVAdapter$1
//  JMediaRVAdapter_2 = interface; //com.devil.library.media.adapter.MediaRVAdapter$2
  JMediaRVAdapter_OnItemCheckListener = interface; //com.devil.library.media.adapter.MediaRVAdapter$OnItemCheckListener
  JMediaRVAdapter = interface; //com.devil.library.media.adapter.MediaRVAdapter
  JWatchMediaVPAdapter = interface; //com.devil.library.media.adapter.WatchMediaVPAdapter
//  JBaseRVAdapter_1 = interface; //com.devil.library.media.base.BaseRVAdapter$1
  JBaseRVAdapter_OnItemClickListener = interface; //com.devil.library.media.base.BaseRVAdapter$OnItemClickListener
  JBaseRVAdapter = interface; //com.devil.library.media.base.BaseRVAdapter
  JBaseVPFragmentAdapter = interface; //com.devil.library.media.base.BaseVPFragmentAdapter
  JEasyRVHolder = interface; //com.devil.library.media.base.EasyRVHolder
  JFolderInfo = interface; //com.devil.library.media.bean.FolderInfo
//  JMediaInfo_150 = interface; //com.devil.library.media.bean.MediaInfo
  JBuildConfig = interface; //com.devil.library.media.BuildConfig
  JImageLoader = interface; //com.devil.library.media.common.ImageLoader
  JMediaTempListener = interface; //com.devil.library.media.common.MediaTempListener
  JDVCameraConfig_Builder = interface; //com.devil.library.media.config.DVCameraConfig$Builder
  JDVCameraConfig = interface; //com.devil.library.media.config.DVCameraConfig
  JDVListConfig_Builder = interface; //com.devil.library.media.config.DVListConfig$Builder
  JDVListConfig = interface; //com.devil.library.media.config.DVListConfig
  JDVCameraType = interface; //com.devil.library.media.enumtype.DVCameraType
  JDVMediaType = interface; //com.devil.library.media.enumtype.DVMediaType
  JImageFilterType = interface; //com.devil.library.media.enumtype.ImageFilterType
  JOnAdjustChangeListener = interface; //com.devil.library.media.listener.OnAdjustChangeListener
  JOnFilterActionListener = interface; //com.devil.library.media.listener.OnFilterActionListener
  JOnImageSaveListener = interface; //com.devil.library.media.listener.OnImageSaveListener
  JOnItemClickListener = interface; //com.devil.library.media.listener.OnItemClickListener
  JOnSelectMediaListener = interface; //com.devil.library.media.listener.OnSelectMediaListener
//  JMediaSelectorManager_1 = interface; //com.devil.library.media.MediaSelectorManager$1
  JMediaSelectorManager = interface; //com.devil.library.media.MediaSelectorManager
  JDVBaseActivity = interface; //com.devil.library.media.ui.activity.DVBaseActivity
//  JDVBeautyCameraActivity_1 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$1
//  JDVBeautyCameraActivity_2 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$2
//  JDVBeautyCameraActivity_3 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$3
//  JDVBeautyCameraActivity_4 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$4
//  JDVBeautyCameraActivity_5 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$5
//  JDVBeautyCameraActivity_6 = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity$6
  JDVBeautyCameraActivity = interface; //com.devil.library.media.ui.activity.DVBeautyCameraActivity
//  JDVCameraActivity_1 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$1
//  JDVCameraActivity_2 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$2
//  JDVCameraActivity_3 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$3
//  JDVCameraActivity_4 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$4
//  JDVCameraActivity_5 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$5
//  JDVCameraActivity_6 = interface; //com.devil.library.media.ui.activity.DVCameraActivity$6
  JDVCameraActivity = interface; //com.devil.library.media.ui.activity.DVCameraActivity
//  JDVEasyVideoPlayActivity_1 = interface; //com.devil.library.media.ui.activity.DVEasyVideoPlayActivity$1
  JDVEasyVideoPlayActivity = interface; //com.devil.library.media.ui.activity.DVEasyVideoPlayActivity
//  JDVEditPhotoActivity_1 = interface; //com.devil.library.media.ui.activity.DVEditPhotoActivity$1
  JDVEditPhotoActivity = interface; //com.devil.library.media.ui.activity.DVEditPhotoActivity
//  JDVMediaSelectActivity_1 = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity$1
//  JDVMediaSelectActivity_2 = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity$2
  JDVMediaSelectActivity = interface; //com.devil.library.media.ui.activity.DVMediaSelectActivity
//  JDVSystemCameraActivity_1 = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity$1
//  JDVSystemCameraActivity_2 = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity$2
  JDVSystemCameraActivity = interface; //com.devil.library.media.ui.activity.DVSystemCameraActivity
//  JImageFilterFragment_1 = interface; //com.devil.library.media.ui.fragment.ImageFilterFragment$1
//  JImageFilterFragment_2 = interface; //com.devil.library.media.ui.fragment.ImageFilterFragment$2
//  JImageFilterFragment_3_1 = interface; //com.devil.library.media.ui.fragment.ImageFilterFragment$3$1
//  JImageFilterFragment_3 = interface; //com.devil.library.media.ui.fragment.ImageFilterFragment$3
  JImageFilterFragment = interface; //com.devil.library.media.ui.fragment.ImageFilterFragment
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
  JAndroidRomUtil_BuildProperties = interface; //com.devil.library.media.utils.AndroidRomUtil$BuildProperties
  JAndroidRomUtil = interface; //com.devil.library.media.utils.AndroidRomUtil
  JDisplayUtils = interface; //com.devil.library.media.utils.DisplayUtils
  JDVFileProvider = interface; //com.devil.library.media.utils.DVFileProvider
  JFileUtils = interface; //com.devil.library.media.utils.FileUtils
  JLayoutManagerHelper = interface; //com.devil.library.media.utils.LayoutManagerHelper
//  JMediaDataUtils_1_1 = interface; //com.devil.library.media.utils.MediaDataUtils$1$1
//  JMediaDataUtils_1 = interface; //com.devil.library.media.utils.MediaDataUtils$1
//  JMediaDataUtils_2_1 = interface; //com.devil.library.media.utils.MediaDataUtils$2$1
//  JMediaDataUtils_2 = interface; //com.devil.library.media.utils.MediaDataUtils$2
  JMediaDataUtils_OnLoadCallBack = interface; //com.devil.library.media.utils.MediaDataUtils$OnLoadCallBack
  JMediaDataUtils = interface; //com.devil.library.media.utils.MediaDataUtils
  JMediaFileTypeUtils_MediaFileType = interface; //com.devil.library.media.utils.MediaFileTypeUtils$MediaFileType
  JMediaFileTypeUtils = interface; //com.devil.library.media.utils.MediaFileTypeUtils
//  JStatusBarUtil_1 = interface; //com.devil.library.media.utils.StatusBarUtil$1
  JStatusBarUtil = interface; //com.devil.library.media.utils.StatusBarUtil
  JSystemUtils = interface; //com.devil.library.media.utils.SystemUtils
  JDividerGridItemDecoration = interface; //com.devil.library.media.view.DividerGridItemDecoration
//  JDVImageSurfaceLayout_1 = interface; //com.devil.library.media.view.DVImageSurfaceLayout$1
//  JDVImageSurfaceLayout_2 = interface; //com.devil.library.media.view.DVImageSurfaceLayout$2
  JDVImageSurfaceLayout = interface; //com.devil.library.media.view.DVImageSurfaceLayout
  JDVImageSurfaceView = interface; //com.devil.library.media.view.DVImageSurfaceView
  JDVZoomImageSurfaceView = interface; //com.devil.library.media.view.DVZoomImageSurfaceView
//  JFadeInTextView_1 = interface; //com.devil.library.media.view.FadeInTextView$1
  JFadeInTextView_TextAnimationListener = interface; //com.devil.library.media.view.FadeInTextView$TextAnimationListener
  JFadeInTextView = interface; //com.devil.library.media.view.FadeInTextView
//  JFilterAdjustView_1 = interface; //com.devil.library.media.view.FilterAdjustView$1
//  JFilterAdjustView_2 = interface; //com.devil.library.media.view.FilterAdjustView$2
  JFilterAdjustView = interface; //com.devil.library.media.view.FilterAdjustView
//  JFilterToolView_1 = interface; //com.devil.library.media.view.FilterToolView$1
  JFilterToolView = interface; //com.devil.library.media.view.FilterToolView
//  JGraduallyTextView_1 = interface; //com.devil.library.media.view.GraduallyTextView$1
  JGraduallyTextView = interface; //com.devil.library.media.view.GraduallyTextView
  JHackyViewPager = interface; //com.devil.library.media.view.HackyViewPager
  JRatioImageView = interface; //com.devil.library.media.view.RatioImageView
  JSquareRelativeLayout = interface; //com.devil.library.media.view.SquareRelativeLayout
//  JTipLoadDialog_1 = interface; //com.devil.library.media.view.TipLoadDialog$1
//  JTipLoadDialog_2 = interface; //com.devil.library.media.view.TipLoadDialog$2
  JTipLoadDialog_DismissListener = interface; //com.devil.library.media.view.TipLoadDialog$DismissListener
  JTipLoadDialog_MyDialog = interface; //com.devil.library.media.view.TipLoadDialog$MyDialog
  JTipLoadDialog = interface; //com.devil.library.media.view.TipLoadDialog
  JTwoLineSeekBar_OnSeekChangeListener = interface; //com.devil.library.media.view.TwoLineSeekBar$OnSeekChangeListener
  JTwoLineSeekBar_OnSeekDefaultListener = interface; //com.devil.library.media.view.TwoLineSeekBar$OnSeekDefaultListener
  JTwoLineSeekBar_OnSeekDownListener = interface; //com.devil.library.media.view.TwoLineSeekBar$OnSeekDownListener
  JTwoLineSeekBar_SeekBarGestureListener = interface; //com.devil.library.media.view.TwoLineSeekBar$SeekBarGestureListener
  JTwoLineSeekBar = interface; //com.devil.library.media.view.TwoLineSeekBar
  JVideoTrimAdapter_TrimmerViewHolder = interface; //com.devil.library.video.adapter.VideoTrimAdapter$TrimmerViewHolder
  JVideoTrimAdapter = interface; //com.devil.library.video.adapter.VideoTrimAdapter
  JVideoCropFrameInfo = interface; //com.devil.library.video.bean.VideoCropFrameInfo
  JAbstractPlayer = interface; //com.devil.library.video.common.AbstractPlayer
//  JAndroidMediaPlayer_1 = interface; //com.devil.library.video.common.AndroidMediaPlayer$1
//  JAndroidMediaPlayer_2 = interface; //com.devil.library.video.common.AndroidMediaPlayer$2
//  JAndroidMediaPlayer_3 = interface; //com.devil.library.video.common.AndroidMediaPlayer$3
//  JAndroidMediaPlayer_4 = interface; //com.devil.library.video.common.AndroidMediaPlayer$4
//  JAndroidMediaPlayer_5 = interface; //com.devil.library.video.common.AndroidMediaPlayer$5
//  JAndroidMediaPlayer_6 = interface; //com.devil.library.video.common.AndroidMediaPlayer$6
//  JAndroidMediaPlayer_7 = interface; //com.devil.library.video.common.AndroidMediaPlayer$7
  JAndroidMediaPlayer = interface; //com.devil.library.video.common.AndroidMediaPlayer
  JIMediaPlayer = interface; //com.devil.library.video.common.IMediaPlayer
  JOnGetVideoFrameListener = interface; //com.devil.library.video.listener.OnGetVideoFrameListener
  JOnPlayerEventListener = interface; //com.devil.library.video.listener.OnPlayerEventListener
  JOnSelectVideoTrimListener = interface; //com.devil.library.video.listener.OnSelectVideoTrimListener
  JOnVideoTrimListener = interface; //com.devil.library.video.listener.OnVideoTrimListener
  JSingleCallback = interface; //com.devil.library.video.listener.SingleCallback
//  JDVVideoCropActivity_1 = interface; //com.devil.library.video.ui.DVVideoCropActivity$1
//  JDVVideoCropActivity_2_1 = interface; //com.devil.library.video.ui.DVVideoCropActivity$2$1
//  JDVVideoCropActivity_2_2 = interface; //com.devil.library.video.ui.DVVideoCropActivity$2$2
//  JDVVideoCropActivity_2_3 = interface; //com.devil.library.video.ui.DVVideoCropActivity$2$3
//  JDVVideoCropActivity_2 = interface; //com.devil.library.video.ui.DVVideoCropActivity$2
//  JDVVideoCropActivity_3 = interface; //com.devil.library.video.ui.DVVideoCropActivity$3
  JDVVideoCropActivity = interface; //com.devil.library.video.ui.DVVideoCropActivity
//  JDVVideoTrimActivity_1 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$1
//  JDVVideoTrimActivity_2_1 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$2$1
//  JDVVideoTrimActivity_2_2 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$2$2
//  JDVVideoTrimActivity_2_3 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$2$3
//  JDVVideoTrimActivity_2 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$2
//  JDVVideoTrimActivity_3 = interface; //com.devil.library.video.ui.DVVideoTrimActivity$3
  JDVVideoTrimActivity = interface; //com.devil.library.video.ui.DVVideoTrimActivity
  JDateUtil = interface; //com.devil.library.video.utils.DateUtil
  JDVLinearLayoutManager = interface; //com.devil.library.video.utils.DVLinearLayoutManager
  JImageUtils_ImageType = interface; //com.devil.library.video.utils.ImageUtils$ImageType
  JImageUtils = interface; //com.devil.library.video.utils.ImageUtils
  JMeasureHelper = interface; //com.devil.library.video.utils.MeasureHelper
//  JScreenUtils_297 = interface; //com.devil.library.video.utils.ScreenUtils
  JShaderUtil = interface; //com.devil.library.video.utils.ShaderUtil
//  JThreadUtils_1 = interface; //com.devil.library.video.utils.ThreadUtils$1
//  JThreadUtils_2 = interface; //com.devil.library.video.utils.ThreadUtils$2
//  JThreadUtils_3 = interface; //com.devil.library.video.utils.ThreadUtils$3
  JThreadUtils_LinkedBlockingQueue4Util = interface; //com.devil.library.video.utils.ThreadUtils$LinkedBlockingQueue4Util
  JThreadUtils_SimpleTask = interface; //com.devil.library.video.utils.ThreadUtils$SimpleTask
//  JThreadUtils_Task_1 = interface; //com.devil.library.video.utils.ThreadUtils$Task$1
//  JThreadUtils_Task_2 = interface; //com.devil.library.video.utils.ThreadUtils$Task$2
//  JThreadUtils_Task_3 = interface; //com.devil.library.video.utils.ThreadUtils$Task$3
//  JThreadUtils_Task_4 = interface; //com.devil.library.video.utils.ThreadUtils$Task$4
//  JThreadUtils_Task_5 = interface; //com.devil.library.video.utils.ThreadUtils$Task$5
  JThreadUtils_Task_OnTimeoutListener = interface; //com.devil.library.video.utils.ThreadUtils$Task$OnTimeoutListener
  JThreadUtils_Task = interface; //com.devil.library.video.utils.ThreadUtils$Task
  JThreadUtils_TaskInfo = interface; //com.devil.library.video.utils.ThreadUtils$TaskInfo
  JThreadUtils_ThreadPoolExecutor4Util = interface; //com.devil.library.video.utils.ThreadUtils$ThreadPoolExecutor4Util
//  JThreadUtils_UtilsThreadFactory_1 = interface; //com.devil.library.video.utils.ThreadUtils$UtilsThreadFactory$1
//  JThreadUtils_UtilsThreadFactory_2 = interface; //com.devil.library.video.utils.ThreadUtils$UtilsThreadFactory$2
  JThreadUtils_UtilsThreadFactory = interface; //com.devil.library.video.utils.ThreadUtils$UtilsThreadFactory
  JThreadUtils = interface; //com.devil.library.video.utils.ThreadUtils
//  JVideoTrimUtil_1 = interface; //com.devil.library.video.utils.VideoTrimUtil$1
//  JVideoTrimUtil_2 = interface; //com.devil.library.video.utils.VideoTrimUtil$2
  JVideoTrimUtil = interface; //com.devil.library.video.utils.VideoTrimUtil
//  JVideoMediaManager_1 = interface; //com.devil.library.video.VideoMediaManager$1
//  JVideoMediaManager_2 = interface; //com.devil.library.video.VideoMediaManager$2
  JVideoMediaManager = interface; //com.devil.library.video.VideoMediaManager
//  JDVVideoView_1 = interface; //com.devil.library.video.view.DVVideoView$1
//  JDVVideoView_2 = interface; //com.devil.library.video.view.DVVideoView$2
//  JDVVideoView_3 = interface; //com.devil.library.video.view.DVVideoView$3
  JDVVideoView = interface; //com.devil.library.video.view.DVVideoView
  JNoTouchSeekBar = interface; //com.devil.library.video.view.NoTouchSeekBar
  JRangeSeekBarView_OnRangeSeekBarChangeListener = interface; //com.devil.library.video.view.RangeSeekBarView$OnRangeSeekBarChangeListener
  JRangeSeekBarView_Thumb = interface; //com.devil.library.video.view.RangeSeekBarView$Thumb
  JRangeSeekBarView = interface; //com.devil.library.video.view.RangeSeekBarView
  JSpacesItemDecoration = interface; //com.devil.library.video.view.SpacesItemDecoration
  JTextureRenderView_OnPreparedListener = interface; //com.devil.library.video.view.TextureRenderView$OnPreparedListener
  JTextureRenderView = interface; //com.devil.library.video.view.TextureRenderView
  JVideoCropView = interface; //com.devil.library.video.view.VideoCropView
//  JVideoTrimView_1_1 = interface; //com.devil.library.video.view.VideoTrimView$1$1
//  JVideoTrimView_1 = interface; //com.devil.library.video.view.VideoTrimView$1
//  JVideoTrimView_2 = interface; //com.devil.library.video.view.VideoTrimView$2
//  JVideoTrimView_3 = interface; //com.devil.library.video.view.VideoTrimView$3
//  JVideoTrimView_4 = interface; //com.devil.library.video.view.VideoTrimView$4
//  JVideoTrimView_5 = interface; //com.devil.library.video.view.VideoTrimView$5
//  JVideoTrimView_6 = interface; //com.devil.library.video.view.VideoTrimView$6
//  JVideoTrimView_7 = interface; //com.devil.library.video.view.VideoTrimView$7
//  JVideoTrimView_8 = interface; //com.devil.library.video.view.VideoTrimView$8
  JVideoTrimView = interface; //com.devil.library.video.view.VideoTrimView

// ===== Forward SuperClasses declarations =====

  JBaseRVAdapterClass = interface; //com.devil.library.media.base.BaseRVAdapter
  JBaseVPFragmentAdapterClass = interface; //com.devil.library.media.base.BaseVPFragmentAdapter
  JDVBaseActivityClass = interface; //com.devil.library.media.ui.activity.DVBaseActivity
  JAbstractPlayerClass = interface; //com.devil.library.video.common.AbstractPlayer
  JThreadUtils_TaskClass = interface; //com.devil.library.video.utils.ThreadUtils$Task

// ===== Interface declarations =====

//  JFilterAdapter_1Class = interface(JObjectClass)
//  ['{BABEECED-E2BB-4E4B-B0D0-AF48ABF93D07}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/adapter/FilterAdapter$1')]
//  JFilterAdapter_1 = interface(JObject)
//  ['{EE589D0F-EADF-4B1E-8D91-AB690CE51E7C}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJFilterAdapter_1 = class(TJavaGenericImport<JFilterAdapter_1Class, JFilterAdapter_1>) end;

  JFilterAdapter_FilterHolderClass = interface(JRecyclerView_ViewHolderClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{EBF09DA0-C2A2-454B-BD33-E4C81CB458F2}']
    { static Property Methods }

    { static Methods }
    {class} function init(this$0: JFilterAdapter; itemView: JView): JFilterAdapter_FilterHolder; cdecl; //(Lcom/devil/library/camera/adapter/FilterAdapter;Landroid/view/View;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/adapter/FilterAdapter$FilterHolder')]
  JFilterAdapter_FilterHolder = interface(JRecyclerView_ViewHolder) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{0818A948-064C-4BCF-8166-8BE825178CB3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFilterAdapter_FilterHolder = class(TJavaGenericImport<JFilterAdapter_FilterHolderClass, JFilterAdapter_FilterHolder>) end;

//  JFilterAdapter_onFilterChangeListenerClass = interface(JObjectClass)
//  ['{67CAE3CA-682F-4C05-B07F-8B25E5AB33C7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/adapter/FilterAdapter$onFilterChangeListener')]
//  JFilterAdapter_onFilterChangeListener = interface(IJavaInstance)
//  ['{05DF0D13-741E-4156-818C-25C0953632E2}']
//    { Property Methods }
//
//    { methods }
//    procedure onFilterChanged(P1: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V
//
//    { Property }
//  end;

//  TJFilterAdapter_onFilterChangeListener = class(TJavaGenericImport<JFilterAdapter_onFilterChangeListenerClass, JFilterAdapter_onFilterChangeListener>) end;

  JFilterAdapterClass = interface(JRecyclerView_AdapterClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{AA278ABB-E3BF-4DEE-A983-0D3299E94695}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; resourceDataList: JList): JFilterAdapter; cdecl; //(Landroid/content/Context;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/adapter/FilterAdapter')]
  JFilterAdapter = interface(JRecyclerView_Adapter) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{491EE062-18D2-4058-8605-F3B363D6B5AD}']
    { Property Methods }

    { methods }
    function onCreateViewHolder(parent: JViewGroup; viewType: Integer): JFilterAdapter_FilterHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Lcom/devil/library/camera/adapter/FilterAdapter$FilterHolder;
    procedure onBindViewHolder(holder: JFilterAdapter_FilterHolder; position: Integer); cdecl; overload; //(Lcom/devil/library/camera/adapter/FilterAdapter$FilterHolder;I)V
    function getItemCount: Integer; cdecl; //()I
    procedure setOnFilterChangeListener(onFilterChangeListener: JFilterAdapter_onFilterChangeListener); cdecl; //(Lcom/devil/library/camera/adapter/FilterAdapter$onFilterChangeListener;)V
    procedure onBindViewHolder(this: JRecyclerView_ViewHolder; P2: Integer); cdecl; overload; //(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    function onCreateViewHolder(this: JViewGroup; P2: Integer): JRecyclerView_ViewHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    { Property }
  end;

  TJFilterAdapter = class(TJavaGenericImport<JFilterAdapterClass, JFilterAdapter>) end;

  JFilterTypeHelperClass = interface(JObjectClass)
  ['{746B5959-11CF-4E4B-A50A-C095414AFAF2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFilterTypeHelper; cdecl; //()V
    {class} function FilterType2Color(filterName: JString): Integer; cdecl; //(Ljava/lang/String;)I

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/adapter/FilterTypeHelper')]
  JFilterTypeHelper = interface(JObject)
  ['{396DF160-F112-4515-8E5D-68974591F666}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFilterTypeHelper = class(TJavaGenericImport<JFilterTypeHelperClass, JFilterTypeHelper>) end;

//  JCameraInterface_1Class = interface(JObjectClass)
//  ['{CB724533-2879-445E-8B6B-732700E75687}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CameraInterface$1')]
//  JCameraInterface_1 = interface(JObject)
//  ['{8B306E5A-FD11-475F-8215-ABB1D4E406F6}']
//    { Property Methods }
//
//    { methods }
//    procedure onSensorChanged(event: JSensorEvent); cdecl; //(Landroid/hardware/SensorEvent;)V
//    procedure onAccuracyChanged(sensor: JSensor; accuracy: Integer); cdecl; //(Landroid/hardware/Sensor;I)V
//
//    { Property }
//  end;

//  TJCameraInterface_1 = class(TJavaGenericImport<JCameraInterface_1Class, JCameraInterface_1>) end;

//  JCameraInterface_2Class = interface(JObjectClass)
//  ['{0572FDC4-899C-45FA-B46C-2A49BCD7CD13}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CameraInterface$2')]
//  JCameraInterface_2 = interface(JObject)
//  ['{91374C46-93EF-4B37-8257-54E3D7E39968}']
//    { Property Methods }
//
//    { methods }
//    procedure onPictureTaken(data: TJavaArray<Byte>; camera: JCamera); cdecl; //([BLandroid/hardware/Camera;)V
//
//    { Property }
//  end;

//  TJCameraInterface_2 = class(TJavaGenericImport<JCameraInterface_2Class, JCameraInterface_2>) end;

//  JCameraInterface_3Class = interface(JObjectClass)
//  ['{C858EF6E-FB78-4B09-891F-C7C291AC04B7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CameraInterface$3')]
//  JCameraInterface_3 = interface(JObject)
//  ['{990174D4-EA18-4F4C-9F7A-5869DD522327}']
//    { Property Methods }
//
//    { methods }
//    procedure onAutoFocus(success: Boolean; camera: JCamera); cdecl; //(ZLandroid/hardware/Camera;)V
//
//    { Property }
//  end;

//  TJCameraInterface_3 = class(TJavaGenericImport<JCameraInterface_3Class, JCameraInterface_3>) end;

  JCameraInterface_CameraOpenOverCallbackClass = interface(JObjectClass)
  ['{465FC3FC-AAF8-46B3-8DB4-93CE75E55EB2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface$CameraOpenOverCallback')]
  JCameraInterface_CameraOpenOverCallback = interface(IJavaInstance)
  ['{53D24690-9891-406D-9D99-7110B96DEEC0}']
    { Property Methods }

    { methods }
    procedure cameraHasOpened; cdecl; //()V

    { Property }
  end;

  TJCameraInterface_CameraOpenOverCallback = class(TJavaGenericImport<JCameraInterface_CameraOpenOverCallbackClass, JCameraInterface_CameraOpenOverCallback>) end;

  JCameraInterface_ErrorCallbackClass = interface(JObjectClass)
  ['{E5ACF785-5300-4EE5-918D-C956ABF74DBF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface$ErrorCallback')]
  JCameraInterface_ErrorCallback = interface(IJavaInstance)
  ['{01DBA9D2-17F1-492B-AA4F-4B5838016FA5}']
    { Property Methods }

    { methods }
    procedure onError; cdecl; //()V

    { Property }
  end;

  TJCameraInterface_ErrorCallback = class(TJavaGenericImport<JCameraInterface_ErrorCallbackClass, JCameraInterface_ErrorCallback>) end;

  JCameraInterface_FocusCallbackClass = interface(JObjectClass)
  ['{35536EA2-71A6-4972-9A4C-32364485E050}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface$FocusCallback')]
  JCameraInterface_FocusCallback = interface(IJavaInstance)
  ['{08A82610-58C6-4E9B-8F68-E0C596A66580}']
    { Property Methods }

    { methods }
    procedure focusSuccess; cdecl; //()V

    { Property }
  end;

  TJCameraInterface_FocusCallback = class(TJavaGenericImport<JCameraInterface_FocusCallbackClass, JCameraInterface_FocusCallback>) end;

  JCameraInterface_StopRecordCallbackClass = interface(JObjectClass)
  ['{0324C25C-E32B-4C7E-9C59-58652642CD2B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface$StopRecordCallback')]
  JCameraInterface_StopRecordCallback = interface(IJavaInstance)
  ['{C7526671-12F6-4AB1-8A14-F56B5807DF79}']
    { Property Methods }

    { methods }
    procedure recordResult(P1: JString; P2: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJCameraInterface_StopRecordCallback = class(TJavaGenericImport<JCameraInterface_StopRecordCallbackClass, JCameraInterface_StopRecordCallback>) end;

  JCameraInterface_TakePictureCallbackClass = interface(JObjectClass)
  ['{43061FF9-C8CF-445F-8245-F326D5E552C8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface$TakePictureCallback')]
  JCameraInterface_TakePictureCallback = interface(IJavaInstance)
  ['{2DBCD28B-0F00-4515-9AB7-DCFB06A68BBA}']
    { Property Methods }

    { methods }
    procedure captureResult(P1: JBitmap; P2: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V

    { Property }
  end;

  TJCameraInterface_TakePictureCallback = class(TJavaGenericImport<JCameraInterface_TakePictureCallbackClass, JCameraInterface_TakePictureCallback>) end;

  JCameraInterfaceClass = interface(JObjectClass)
  ['{0988ADE2-019A-4F1C-BC39-978974323831}']
    { static Property Methods }
    {class} function _GetTYPE_RECORDER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTYPE_CAPTURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} procedure destroyCameraInterface; cdecl; //()V
    {class} function getInstance: JCameraInterface; cdecl; //()Lcom/devil/library/camera/CameraInterface;

    { static Property }
    {class} property TYPE_RECORDER: Integer read _GetTYPE_RECORDER;
    {class} property TYPE_CAPTURE: Integer read _GetTYPE_CAPTURE;
  end;

  [JavaSignature('com/devil/library/camera/CameraInterface')]
  JCameraInterface = interface(JObject)
  ['{7922EADE-1EE7-453A-A30B-00FB17F1F069}']
    { Property Methods }

    { methods }
    procedure setSwitchView(mSwitchView: JImageView; mFlashLamp: JImageView); cdecl; //(Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    procedure setZoom(zoom: Single; atype: Integer); cdecl; //(FI)V
    procedure onPreviewFrame(data: TJavaArray<Byte>; camera: JCamera); cdecl; //([BLandroid/hardware/Camera;)V
    procedure setFlashMode(flashMode: JString); cdecl; //(Ljava/lang/String;)V
    function isFront: Boolean; cdecl; //()Z
    procedure switchCamera(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure doStartPreview(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure doStopPreview; cdecl; //()V
    procedure takePicture(callback: JCameraInterface_TakePictureCallback); cdecl; //(Lcom/devil/library/camera/CameraInterface$TakePictureCallback;)V
    procedure startRecord(surface: JSurface; screenProp: Single; callback: JCameraInterface_ErrorCallback); cdecl; //(Landroid/view/Surface;FLcom/devil/library/camera/CameraInterface$ErrorCallback;)V
    procedure stopRecord(isShort: Boolean; callback: JCameraInterface_StopRecordCallback); cdecl; //(ZLcom/devil/library/camera/CameraInterface$StopRecordCallback;)V
    procedure handleFocus(context: JContext; x: Single; y: Single; callback: JCameraInterface_FocusCallback); cdecl; //(Landroid/content/Context;FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V

    { Property }
  end;

  TJCameraInterface = class(TJavaGenericImport<JCameraInterfaceClass, JCameraInterface>) end;

//  JCaptureButton_1Class = interface(JObjectClass)
//  ['{9A48E104-A5D8-483B-BA0B-915B5D9E27F1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$1')]
//  JCaptureButton_1 = interface(JObject)
//  ['{ABDF9A38-2D84-4BD9-B6FF-B55F50A1780F}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(animation: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_1 = class(TJavaGenericImport<JCaptureButton_1Class, JCaptureButton_1>) end;

//  JCaptureButton_2Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{C6CB932D-D7AD-47F0-B6D4-BF727A0E1EA0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$2')]
//  JCaptureButton_2 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{FEC6AB16-EF95-4355-B1B1-BED731FA6236}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(animation: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_2 = class(TJavaGenericImport<JCaptureButton_2Class, JCaptureButton_2>) end;

//  JCaptureButton_3Class = interface(JObjectClass)
//  ['{1F403BF9-1F75-41B6-A47B-267B6109B129}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$3')]
//  JCaptureButton_3 = interface(JObject)
//  ['{FB649FC8-1300-421D-AB0A-730DB38D2EAB}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(animation: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_3 = class(TJavaGenericImport<JCaptureButton_3Class, JCaptureButton_3>) end;

//  JCaptureButton_4Class = interface(JObjectClass)
//  ['{CFFFDE49-3C07-49DE-B239-34C95F8E1E2E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$4')]
//  JCaptureButton_4 = interface(JObject)
//  ['{DAEB47B7-D70F-4EA3-9497-59338522020A}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(animation: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_4 = class(TJavaGenericImport<JCaptureButton_4Class, JCaptureButton_4>) end;

//  JCaptureButton_5Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{DDDD9D36-8051-462B-A6E0-340AA807AFFF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureButton$5')]
//  JCaptureButton_5 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{FB77D688-76BC-4A30-9A38-CAA1DC9DACCE}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(animation: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureButton_5 = class(TJavaGenericImport<JCaptureButton_5Class, JCaptureButton_5>) end;

  JCaptureButton_LongPressRunnableClass = interface(JObjectClass)
  ['{310DBFC1-70F7-420E-AE21-E9E26042CA3B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CaptureButton$LongPressRunnable')]
  JCaptureButton_LongPressRunnable = interface(JObject)
  ['{FCCD85E6-286B-424C-9055-F59F3506B017}']
    { Property Methods }

    { methods }
    procedure run; cdecl; //()V

    { Property }
  end;

  TJCaptureButton_LongPressRunnable = class(TJavaGenericImport<JCaptureButton_LongPressRunnableClass, JCaptureButton_LongPressRunnable>) end;

  JCaptureButton_RecordCountDownTimerClass = interface(JCountDownTimerClass) // or JObjectClass // SuperSignature: android/os/CountDownTimer
  ['{45BB56E1-0582-4223-8531-459798304987}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CaptureButton$RecordCountDownTimer')]
  JCaptureButton_RecordCountDownTimer = interface(JCountDownTimer) // or JObject // SuperSignature: android/os/CountDownTimer
  ['{84A95F0D-0E37-41AF-B0D4-482D7864B6B2}']
    { Property Methods }

    { methods }
    procedure onTick(millisUntilFinished: Int64); cdecl; //(J)V
    procedure onFinish; cdecl; //()V

    { Property }
  end;

  TJCaptureButton_RecordCountDownTimer = class(TJavaGenericImport<JCaptureButton_RecordCountDownTimerClass, JCaptureButton_RecordCountDownTimer>) end;

  JCaptureButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{BE3E239F-E61B-483D-8DD8-A111B590C404}']
    { static Property Methods }
    {class} function _GetSTATE_IDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_PRESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_LONG_PRESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_RECORDERING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_BAN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JCaptureButton; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; size: Integer): JCaptureButton; cdecl; overload; //(Landroid/content/Context;I)V

    { static Property }
    {class} property STATE_IDLE: Integer read _GetSTATE_IDLE;
    {class} property STATE_PRESS: Integer read _GetSTATE_PRESS;
    {class} property STATE_LONG_PRESS: Integer read _GetSTATE_LONG_PRESS;
    {class} property STATE_RECORDERING: Integer read _GetSTATE_RECORDERING;
    {class} property STATE_BAN: Integer read _GetSTATE_BAN;
  end;

  [JavaSignature('com/devil/library/camera/CaptureButton')]
  JCaptureButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{75705D29-EF27-4B44-978E-E6C852FA99CC}']
    { Property Methods }

    { methods }
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setDuration(duration: Integer); cdecl; //(I)V
    procedure setMinDuration(duration: Integer); cdecl; //(I)V
    procedure setCaptureListener(captureListener: JCaptureListener); cdecl; //(Lcom/devil/library/camera/listener/CaptureListener;)V
    procedure setButtonFeatures(state: Integer); cdecl; //(I)V
    function isIdle: Boolean; cdecl; //()Z
    procedure resetState; cdecl; //()V

    { Property }
  end;

  TJCaptureButton = class(TJavaGenericImport<JCaptureButtonClass, JCaptureButton>) end;

//  JCaptureLayout_1Class = interface(JAnimatorListenerAdapterClass) // or JObjectClass // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{4E675932-C6E1-42BF-909C-B32AB5F5868D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$1')]
//  JCaptureLayout_1 = interface(JAnimatorListenerAdapter) // or JObject // SuperSignature: android/animation/AnimatorListenerAdapter
//  ['{302872A7-3191-489C-8D74-935CBFA630A2}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationEnd(animation: JAnimator); cdecl; //(Landroid/animation/Animator;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_1 = class(TJavaGenericImport<JCaptureLayout_1Class, JCaptureLayout_1>) end;

//  JCaptureLayout_2Class = interface(JObjectClass)
//  ['{7F604440-1120-46E1-979F-8578A4FD760C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$2')]
//  JCaptureLayout_2 = interface(JObject)
//  ['{42430605-F478-4CA8-BC5B-7D1116496B81}']
//    { Property Methods }
//
//    { methods }
//    procedure takePictures; cdecl; //()V
//    procedure recordShort(time: Int64); cdecl; //(J)V
//    procedure recordStart; cdecl; //()V
//    procedure recordEnd(time: Int64); cdecl; //(J)V
//    procedure recordZoom(zoom: Single); cdecl; //(F)V
//    procedure recordError; cdecl; //()V
//
//    { Property }
//  end;

//  TJCaptureLayout_2 = class(TJavaGenericImport<JCaptureLayout_2Class, JCaptureLayout_2>) end;

//  JCaptureLayout_3Class = interface(JObjectClass)
//  ['{31D156CA-1B76-4702-9283-E3459CDC5D63}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$3')]
//  JCaptureLayout_3 = interface(JObject)
//  ['{51FA4701-78EA-4732-8212-5B398E5D7311}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(view: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_3 = class(TJavaGenericImport<JCaptureLayout_3Class, JCaptureLayout_3>) end;

//  JCaptureLayout_4Class = interface(JObjectClass)
//  ['{D3245BAB-CA86-48DE-B8AE-7A62062296C9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$4')]
//  JCaptureLayout_4 = interface(JObject)
//  ['{3312EDCE-C78D-4FFE-8876-DE76DC0210E3}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(view: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_4 = class(TJavaGenericImport<JCaptureLayout_4Class, JCaptureLayout_4>) end;

//  JCaptureLayout_5Class = interface(JObjectClass)
//  ['{4124CEF3-6D2D-469F-B4F2-1400A8818977}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$5')]
//  JCaptureLayout_5 = interface(JObject)
//  ['{F44A9844-DDA1-4395-8CBA-5C9312162940}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_5 = class(TJavaGenericImport<JCaptureLayout_5Class, JCaptureLayout_5>) end;

//  JCaptureLayout_6Class = interface(JObjectClass)
//  ['{DAAF604E-A3F9-4810-9FD3-FBC722A7B727}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$6')]
//  JCaptureLayout_6 = interface(JObject)
//  ['{9988ED2D-4E72-4B9E-8663-0C27C15F6DD8}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_6 = class(TJavaGenericImport<JCaptureLayout_6Class, JCaptureLayout_6>) end;

//  JCaptureLayout_7Class = interface(JObjectClass)
//  ['{682D72F3-5AC0-4359-8E48-B651CA396154}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/CaptureLayout$7')]
//  JCaptureLayout_7 = interface(JObject)
//  ['{C7AFB8C8-D3F5-4E3E-96F0-5802324717DC}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJCaptureLayout_7 = class(TJavaGenericImport<JCaptureLayout_7Class, JCaptureLayout_7>) end;

  JCaptureLayoutClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{78E36B5D-66FA-4FB3-840B-8EBAD1D923B5}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JCaptureLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/CaptureLayout')]
  JCaptureLayout = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{A422D968-246E-4FFF-9C92-9EA6185F9554}']
    { Property Methods }

    { methods }
    procedure setTypeListener(typeListener: JTypeListener); cdecl; //(Lcom/devil/library/camera/listener/TypeListener;)V
    procedure setCaptureListener(captureListener: JCaptureListener); cdecl; //(Lcom/devil/library/camera/listener/CaptureListener;)V
    procedure setReturnListener(returnListener: JReturnListener); cdecl; //(Lcom/devil/library/camera/listener/ReturnListener;)V
    procedure initEvent; cdecl; //()V
    procedure startTypeBtnAnimator; cdecl; //()V
    procedure resetCaptureLayout; cdecl; //()V
    procedure startAlphaAnimation; cdecl; //()V
    procedure setTextWithAnimation(tip: JString); cdecl; //(Ljava/lang/String;)V
    procedure setDuration(duration: Integer); cdecl; //(I)V
    procedure setButtonFeatures(state: Integer); cdecl; //(I)V
    function getDefaultStateTip: JString; cdecl; //()Ljava/lang/String;
    procedure setTip(tip: JString); cdecl; //(Ljava/lang/String;)V
    procedure showTip; cdecl; //()V
    procedure setIconSrc(iconLeft: Integer; iconRight: Integer); cdecl; //(II)V
    procedure setLeftClickListener(leftClickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V
    procedure setRightClickListener(rightClickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V

    { Property }
  end;

  TJCaptureLayout = class(TJavaGenericImport<JCaptureLayoutClass, JCaptureLayout>) end;

  JFoucsViewClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{45DCC171-61AB-423E-A585-C91CE8EEBF8F}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JFoucsView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JFoucsView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JFoucsView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/FoucsView')]
  JFoucsView = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{6A93E473-9296-4354-9E4A-90244DA1B244}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFoucsView = class(TJavaGenericImport<JFoucsViewClass, JFoucsView>) end;

//  JCameraApi_1Class = interface(JObjectClass)
//  ['{60113013-ACF9-46D3-A9A3-5991E1B39238}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/helper/CameraApi$1')]
//  JCameraApi_1 = interface(JObject)
//  ['{8815111A-512A-47D7-B1FF-0B185C880564}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJCameraApi_1 = class(TJavaGenericImport<JCameraApi_1Class, JCameraApi_1>) end;

  JCameraApi_CompareAreaSizeClass = interface(JObjectClass)
  ['{F0F19768-4F8D-47C0-B10F-5AB661B99577}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/helper/CameraApi$CompareAreaSize')]
  JCameraApi_CompareAreaSize = interface(JObject)
  ['{0B9E53F4-985F-40D6-B7D1-9395B6ADD759}']
    { Property Methods }

    { methods }
    function compare(pre: JCamera_Size; after: JCamera_Size): Integer; cdecl; overload; //(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJCameraApi_CompareAreaSize = class(TJavaGenericImport<JCameraApi_CompareAreaSizeClass, JCameraApi_CompareAreaSize>) end;

  JCameraApiClass = interface(JObjectClass)
  ['{50F4A5FE-6A7D-4A27-9015-D7FB28F64B7D}']
    { static Property Methods }

    { static Methods }
    {class} function hasCamera2(context: JContext): Boolean; cdecl; //(Landroid/content/Context;)Z
    {class} function hasFrontCamera(context: JContext): Boolean; cdecl; //(Landroid/content/Context;)Z
    {class} function calculateTapArea(x: Single; y: Single; width: Integer; height: Integer; focusSize: Integer; coefficient: Single): JRect; cdecl; overload; //(FFIIIF)Landroid/graphics/Rect;
    {class} function calculateTapArea(x: Single; y: Single; coefficient: Single; context: JContext): JRect; cdecl; overload; //(FFFLandroid/content/Context;)Landroid/graphics/Rect;
    {class} function clamp(touchCoordinateInCameraReper: Integer; focusAreaSize: Integer): Integer; cdecl; //(II)I
    {class} function supportAutoFocusFeature(parameters: JCamera_Parameters): Boolean; cdecl; //(Landroid/hardware/Camera$Parameters;)Z
    {class} function checkSupportFlashLight(camera: JCamera): Boolean; cdecl; overload; //(Landroid/hardware/Camera;)Z
    {class} function checkSupportFlashLight(parameters: JCamera_Parameters): Boolean; cdecl; overload; //(Landroid/hardware/Camera$Parameters;)Z
    {class} function chooseFixedPreviewFps(parameters: JCamera_Parameters; expectedThoudandFps: Integer): Integer; cdecl; //(Landroid/hardware/Camera$Parameters;I)I
    {class} function calculatePerfectSize(sizes: JList; expectWidth: Integer; expectHeight: Integer; calculateType: JCalculateType): JCamera_Size; cdecl; //(Ljava/util/List;IILcom/devil/library/camera/params/CalculateType;)Landroid/hardware/Camera$Size;
    {class} procedure sortList(list: JList); cdecl; //(Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/helper/CameraApi')]
  JCameraApi = interface(JObject)
  ['{D2B17370-0679-49F1-8D3D-F611C24C63BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCameraApi = class(TJavaGenericImport<JCameraApiClass, JCameraApi>) end;

//  JCameraController_1Class = interface(JObjectClass)
//  ['{F08CF41C-90C9-4D90-AE38-C631BF84BA66}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/helper/CameraController$1')]
//  JCameraController_1 = interface(JObject)
//  ['{63F71AAE-4D98-40D7-A946-8396B3B15AFD}']
//    { Property Methods }
//
//    { methods }
//    procedure onAutoFocus(success: Boolean; camera: JCamera); cdecl; //(ZLandroid/hardware/Camera;)V
//
//    { Property }
//  end;

//  TJCameraController_1 = class(TJavaGenericImport<JCameraController_1Class, JCameraController_1>) end;

  JCameraControllerClass = interface(JObjectClass)
  ['{2214ACE2-290C-47E1-A286-578AF5BBE33D}']
    { static Property Methods }

    { static Methods }
    {class} function init(activity: JActivity): JCameraController; cdecl; //(Landroid/app/Activity;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/helper/CameraController')]
  JCameraController = interface(JObject)
  ['{5F6AB841-41A6-49F6-82A7-355925204DBE}']
    { Property Methods }

    { methods }
    procedure setSurface(surface: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
    procedure setOnSurfaceTextureListener(listener: JOnSurfaceTextureListener); cdecl; //(Lcom/devil/library/camera/listener/OnSurfaceTextureListener;)V
    procedure setPreviewCallback(callback: JPreviewCallback); cdecl; //(Lcom/devil/library/camera/listener/PreviewCallback;)V
    procedure setOnFrameAvailableListener(listener: JOnFrameAvailableListener); cdecl; //(Lcom/devil/library/camera/listener/OnFrameAvailableListener;)V
    procedure openCamera; cdecl; //()V
    procedure closeCamera; cdecl; //()V
    procedure switchCamera; cdecl; //()V
    procedure setFront(front: Boolean); cdecl; //(Z)V
    function isFront: Boolean; cdecl; //()Z
    function getOrientation: Integer; cdecl; //()I
    function getPreviewWidth: Integer; cdecl; //()I
    function getPreviewHeight: Integer; cdecl; //()I
    function canAutoFocus: Boolean; cdecl; //()Z
    procedure setFocusArea(rect: JRect); cdecl; //(Landroid/graphics/Rect;)V
    function getFocusArea(x: Single; y: Single; width: Integer; height: Integer; focusSize: Integer): JRect; cdecl; //(FFIII)Landroid/graphics/Rect;
    procedure handleFocus(context: JContext; x: Single; y: Single; callback: JFocusCallback); cdecl; //(Landroid/content/Context;FFLcom/devil/library/camera/listener/FocusCallback;)V
    function isSupportFlashLight(front: Boolean): Boolean; cdecl; //(Z)Z
    procedure setFlashLight(on: Boolean); cdecl; //(Z)V
    procedure setFlashMode(flashMode: JString); cdecl; //(Ljava/lang/String;)V
    procedure onPreviewFrame(data: TJavaArray<Byte>; camera: JCamera); cdecl; //([BLandroid/hardware/Camera;)V
    procedure doStartPreview; cdecl; //()V
    procedure doStopPreview; cdecl; //()V

    { Property }
  end;

  TJCameraController = class(TJavaGenericImport<JCameraControllerClass, JCameraController>) end;

//  JCameraPreviewPresenter_1Class = interface(JObjectClass)
//  ['{258983D0-5D0A-4D63-8A3A-C915DC7635E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/helper/CameraPreviewPresenter$1')]
//  JCameraPreviewPresenter_1 = interface(JObject)
//  ['{1E099048-25F8-4C85-8317-92CFCA612607}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess; cdecl; //()V
//    procedure onFailure; cdecl; //()V
//    procedure onProgress(progress: Single); cdecl; //(F)V
//
//    { Property }
//  end;

//  TJCameraPreviewPresenter_1 = class(TJavaGenericImport<JCameraPreviewPresenter_1Class, JCameraPreviewPresenter_1>) end;

//  JCameraPreviewPresenter_2Class = interface(JObjectClass)
//  ['{B4B60C88-8CD6-4B3C-B36D-7ADD81FDDEA4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/helper/CameraPreviewPresenter$2')]
//  JCameraPreviewPresenter_2 = interface(JObject)
//  ['{25EC1653-21E0-4EE1-A1D7-7FF5B56F9856}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJCameraPreviewPresenter_2 = class(TJavaGenericImport<JCameraPreviewPresenter_2Class, JCameraPreviewPresenter_2>) end;

  JCameraPreviewPresenterClass = interface(JObjectClass)
  ['{2BA133F9-E8C8-4D97-BF6C-5A9FB03B0AF5}']
    { static Property Methods }

    { static Methods }
    {class} function init(target: JDVCameraView): JCameraPreviewPresenter; cdecl; //(Lcom/devil/library/camera/view/DVCameraView;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/helper/CameraPreviewPresenter')]
  JCameraPreviewPresenter = interface(JObject)
  ['{2ADF6714-DCDE-487B-B4BB-C2EF9A0A285A}']
    { Property Methods }

    { methods }
    function getCameraParam: JCameraParam; cdecl; //()Lcom/devil/library/camera/params/CameraParam;
    function isFront: Boolean; cdecl; //()Z
    procedure setOnPreviewCaptureListener(captureListener: JOnPreviewCaptureListener); cdecl; //(Lcom/devil/library/camera/listener/OnPreviewCaptureListener;)V
    procedure onCreate(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    procedure onStart; cdecl; //()V
    procedure onResume; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function getContext: JContext; cdecl; //()Landroid/content/Context;
    procedure onBindSharedContext(context: JEGLContext); cdecl; //(Landroid/opengl/EGLContext;)V
    procedure onRecordFrameAvailable(texture: Integer; timestamp: Int64); cdecl; //(IJ)V
    procedure onSurfaceCreated(surfaceTexture: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
    procedure onSurfaceChanged(width: Integer; height: Integer); cdecl; //(II)V
    procedure onSurfaceDestroyed; cdecl; //()V
    procedure setVideoSaveDir(saveDir: JString); cdecl; //(Ljava/lang/String;)V
    procedure handleFocus(context: JContext; x: Single; y: Single; callback: JFocusCallback); cdecl; //(Landroid/content/Context;FFLcom/devil/library/camera/listener/FocusCallback;)V
    procedure setFlashLight(on: Boolean); cdecl; //(Z)V
    procedure setFlashMode(flashMode: JString); cdecl; //(Ljava/lang/String;)V
    procedure changeResource(resourceData: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V
    procedure changeDynamicFilter(color: JDynamicColor); cdecl; overload; //(Lcom/cgfay/filter/glfilter/color/bean/DynamicColor;)V
    procedure changeDynamicMakeup(makeup: JDynamicMakeup); cdecl; //(Lcom/cgfay/filter/glfilter/makeup/bean/DynamicMakeup;)V
    procedure changeDynamicFilter(filterIndex: Integer); cdecl; overload; //(I)V
    function previewFilter: Integer; cdecl; //()I
    function nextFilter: Integer; cdecl; //()I
    function getFilterIndex: Integer; cdecl; //()I
    procedure showCompare(enable: Boolean); cdecl; //(Z)V
    procedure takePicture; cdecl; //()V
    procedure switchCamera; cdecl; //()V
    procedure doStartPreview; cdecl; //()V
    procedure doStopPreview; cdecl; //()V
    procedure startRecord; cdecl; //()V
    procedure stopRecord; cdecl; //()V
    procedure cancelRecord; cdecl; //()V
    function isRecording: Boolean; cdecl; //()Z
    procedure setRecordAudioEnable(enable: Boolean); cdecl; //(Z)V
    procedure setRecordSeconds(seconds: Integer); cdecl; //(I)V
    procedure enableEdgeBlurFilter(enable: Boolean); cdecl; //(Z)V
    procedure setMusicPath(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure onCameraOpened; cdecl; //()V
    procedure onSurfaceTexturePrepared(surfaceTexture: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
    procedure onPreviewFrame(data: TJavaArray<Byte>); cdecl; //([B)V
    procedure onFrameAvailable(surfaceTexture: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
    procedure onRecordStart; cdecl; //()V
    procedure onRecording(duration: Int64); cdecl; //(J)V
    procedure onRecordFinish(info: JRecordInfo); cdecl; //(Lcom/devil/library/camera/params/RecordInfo;)V
    procedure onCapture(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure onFpsCallback(fps: Single); cdecl; //(F)V

    { Property }
  end;

  TJCameraPreviewPresenter = class(TJavaGenericImport<JCameraPreviewPresenterClass, JCameraPreviewPresenter>) end;

//  JJCameraView_1Class = interface(JObjectClass)
//  ['{609CF1F4-C364-41C0-B7B9-AA902107172E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$1')]
//  JJCameraView_1 = interface(JObject)
//  ['{4CF9FC69-E1DF-4BA2-9CF1-F41EAED4DC15}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJJCameraView_1 = class(TJavaGenericImport<JJCameraView_1Class, JJCameraView_1>) end;

//  JJCameraView_2Class = interface(JObjectClass)
//  ['{9F27D83B-9C08-42B1-9D92-9EA29A2F6E52}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$2')]
//  JJCameraView_2 = interface(JObject)
//  ['{5E3AC316-6AB4-4B54-A1AA-FD932DCD5360}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJJCameraView_2 = class(TJavaGenericImport<JJCameraView_2Class, JJCameraView_2>) end;

//  JJCameraView_3_1Class = interface(JObjectClass)
//  ['{B5986A6E-2E31-4039-B7BC-ADE92D097547}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$3$1')]
//  JJCameraView_3_1 = interface(JObject)
//  ['{A7CA5C3D-DC05-4530-A9C7-731924CE69F4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_3_1 = class(TJavaGenericImport<JJCameraView_3_1Class, JJCameraView_3_1>) end;

//  JJCameraView_3Class = interface(JObjectClass)
//  ['{C6116FF8-F0C9-4236-AFE7-42D19935F9D5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$3')]
//  JJCameraView_3 = interface(JObject)
//  ['{8BCA2710-3376-48B0-A283-84CAAF3BBDE4}']
//    { Property Methods }
//
//    { methods }
//    procedure takePictures; cdecl; //()V
//    procedure recordStart; cdecl; //()V
//    procedure recordShort(time: Int64); cdecl; //(J)V
//    procedure recordEnd(time: Int64); cdecl; //(J)V
//    procedure recordZoom(zoom: Single); cdecl; //(F)V
//    procedure recordError; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_3 = class(TJavaGenericImport<JJCameraView_3Class, JJCameraView_3>) end;

//  JJCameraView_4Class = interface(JObjectClass)
//  ['{130BE041-E3BA-43F6-8E43-95E630C94640}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$4')]
//  JJCameraView_4 = interface(JObject)
//  ['{0261B17E-CBAA-428F-8025-65275019FFF0}']
//    { Property Methods }
//
//    { methods }
//    procedure cancel; cdecl; //()V
//    procedure confirm; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_4 = class(TJavaGenericImport<JJCameraView_4Class, JJCameraView_4>) end;

//  JJCameraView_5Class = interface(JObjectClass)
//  ['{0C4A708D-BFAC-47C0-A389-FA8222A39025}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$5')]
//  JJCameraView_5 = interface(JObject)
//  ['{E4D9630C-0ADE-4CFB-9A91-A7C4BE99FDCB}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_5 = class(TJavaGenericImport<JJCameraView_5Class, JJCameraView_5>) end;

//  JJCameraView_6Class = interface(JObjectClass)
//  ['{24AC5E59-ACBA-4121-8A7E-ABC5773308A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$6')]
//  JJCameraView_6 = interface(JObject)
//  ['{B3D48D07-C200-4A14-B739-57AEC8CF92B5}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_6 = class(TJavaGenericImport<JJCameraView_6Class, JJCameraView_6>) end;

//  JJCameraView_7_1Class = interface(JObjectClass)
//  ['{9512C1E1-7795-4529-90A6-6882394DEBFE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$7$1')]
//  JJCameraView_7_1 = interface(JObject)
//  ['{7A52F95D-0C5A-4CB9-BDA9-B504AFA534B3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_7_1 = class(TJavaGenericImport<JJCameraView_7_1Class, JJCameraView_7_1>) end;

//  JJCameraView_7Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{61CE580A-6AEA-4A47-8465-B962999296EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$7')]
//  JJCameraView_7 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{B9EB5920-073D-4D9D-A995-63C7E069D602}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_7 = class(TJavaGenericImport<JJCameraView_7Class, JJCameraView_7>) end;

//  JJCameraView_8Class = interface(JObjectClass)
//  ['{F11A07B7-1AEB-424C-AFE3-F3301F13ECC3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$8')]
//  JJCameraView_8 = interface(JObject)
//  ['{4D3CC649-FF1E-43FF-87D4-8E4ED1CBDFD0}']
//    { Property Methods }
//
//    { methods }
//    procedure focusSuccess; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_8 = class(TJavaGenericImport<JJCameraView_8Class, JJCameraView_8>) end;

//  JJCameraView_9_1Class = interface(JObjectClass)
//  ['{1AA32163-F2CC-4B62-87C5-D0688BC9EBFD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9$1')]
//  JJCameraView_9_1 = interface(JObject)
//  ['{D24DEA59-E39E-4D01-8E29-4078A01922FC}']
//    { Property Methods }
//
//    { methods }
//    procedure onVideoSizeChanged(mp: JMediaPlayer; width: Integer; height: Integer); cdecl; //(Landroid/media/MediaPlayer;II)V
//
//    { Property }
//  end;

//  TJJCameraView_9_1 = class(TJavaGenericImport<JJCameraView_9_1Class, JJCameraView_9_1>) end;

//  JJCameraView_9_2Class = interface(JObjectClass)
//  ['{59A07B54-CCFC-4F7E-B43B-53B220B08AD6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9$2')]
//  JJCameraView_9_2 = interface(JObject)
//  ['{A494A983-7A4F-4A53-8A19-CE4FFE80158A}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared(mp: JMediaPlayer); cdecl; //(Landroid/media/MediaPlayer;)V
//
//    { Property }
//  end;

//  TJJCameraView_9_2 = class(TJavaGenericImport<JJCameraView_9_2Class, JJCameraView_9_2>) end;

//  JJCameraView_9Class = interface(JObjectClass)
//  ['{E90A266D-437A-4C38-BEFE-D8694D5262F8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/JCameraView$9')]
//  JJCameraView_9 = interface(JObject)
//  ['{AC34C07F-74DA-4A6B-8365-5A7E5226E31F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJJCameraView_9 = class(TJavaGenericImport<JJCameraView_9Class, JJCameraView_9>) end;

  JJCameraViewClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{6799E3B1-8CC0-4820-B261-DA6060FEB7E3}']
    { static Property Methods }
    {class} function _GetTYPE_PICTURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTYPE_VIDEO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTYPE_SHORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTYPE_DEFAULT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_HIGH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_POOR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_FUNNY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_DESPAIR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_QUALITY_SORRY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBUTTON_STATE_ONLY_CAPTURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBUTTON_STATE_ONLY_RECORDER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBUTTON_STATE_BOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JJCameraView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JJCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JJCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
    {class} property TYPE_PICTURE: Integer read _GetTYPE_PICTURE;
    {class} property TYPE_VIDEO: Integer read _GetTYPE_VIDEO;
    {class} property TYPE_SHORT: Integer read _GetTYPE_SHORT;
    {class} property TYPE_DEFAULT: Integer read _GetTYPE_DEFAULT;
    {class} property MEDIA_QUALITY_HIGH: Integer read _GetMEDIA_QUALITY_HIGH;
    {class} property MEDIA_QUALITY_MIDDLE: Integer read _GetMEDIA_QUALITY_MIDDLE;
    {class} property MEDIA_QUALITY_LOW: Integer read _GetMEDIA_QUALITY_LOW;
    {class} property MEDIA_QUALITY_POOR: Integer read _GetMEDIA_QUALITY_POOR;
    {class} property MEDIA_QUALITY_FUNNY: Integer read _GetMEDIA_QUALITY_FUNNY;
    {class} property MEDIA_QUALITY_DESPAIR: Integer read _GetMEDIA_QUALITY_DESPAIR;
    {class} property MEDIA_QUALITY_SORRY: Integer read _GetMEDIA_QUALITY_SORRY;
    {class} property BUTTON_STATE_ONLY_CAPTURE: Integer read _GetBUTTON_STATE_ONLY_CAPTURE;
    {class} property BUTTON_STATE_ONLY_RECORDER: Integer read _GetBUTTON_STATE_ONLY_RECORDER;
    {class} property BUTTON_STATE_BOTH: Integer read _GetBUTTON_STATE_BOTH;
  end;

  [JavaSignature('com/devil/library/camera/JCameraView')]
  JJCameraView = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{A6E22CB0-98A7-47F1-8862-2C7A55F06CB2}']
    { Property Methods }

    { methods }
    procedure setMaxDuration(maxDuration: Integer); cdecl; //(I)V
    procedure cameraHasOpened; cdecl; //()V
    procedure setFlashLightVisibility(visibility: Integer); cdecl; //(I)V
    procedure setFlashLightEnable(enable: Boolean); cdecl; //(Z)V
    procedure onResume; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure surfaceCreated(holder: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; width: Integer; height: Integer); cdecl; //(Landroid/view/SurfaceHolder;III)V
    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setSaveVideoPath(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure setJCameraLisenter(jCameraLisenter: JJCameraListener); cdecl; //(Lcom/devil/library/camera/listener/JCameraListener;)V
    procedure setErrorListener(errorListener: JErrorListener); cdecl; //(Lcom/devil/library/camera/listener/ErrorListener;)V
    procedure setFeatures(state: Integer); cdecl; //(I)V
    procedure setMediaQuality(quality: Integer); cdecl; //(I)V
    procedure resetState(atype: Integer); cdecl; //(I)V
    procedure confirmState(atype: Integer); cdecl; //(I)V
    procedure showPicture(bitmap: JBitmap; isVertical: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
    procedure playVideo(firstFrame: JBitmap; url: JString); cdecl; //(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    procedure stopVideo; cdecl; //()V
    procedure setTip(tip: JString); cdecl; //(Ljava/lang/String;)V
    procedure startPreviewCallback; cdecl; //()V
    function handlerFoucs(x: Single; y: Single): Boolean; cdecl; //(FF)Z
    procedure setLeftClickListener(clickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V
    procedure setRightClickListener(clickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V

    { Property }
  end;

  TJJCameraView = class(TJavaGenericImport<JJCameraViewClass, JJCameraView>) end;

  JCaptureListenerClass = interface(JObjectClass)
  ['{500A0904-3D00-49C3-9C75-08E81DBD16EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/CaptureListener')]
  JCaptureListener = interface(IJavaInstance)
  ['{2233A3D3-03A9-472A-A1DF-9D9DEF6D3565}']
    { Property Methods }

    { methods }
    procedure takePictures; cdecl; //()V
    procedure recordShort(P1: Int64); cdecl; //(J)V
    procedure recordStart; cdecl; //()V
    procedure recordEnd(P1: Int64); cdecl; //(J)V
    procedure recordZoom(P1: Single); cdecl; //(F)V
    procedure recordError; cdecl; //()V

    { Property }
  end;

  TJCaptureListener = class(TJavaGenericImport<JCaptureListenerClass, JCaptureListener>) end;

  JClickListenerClass = interface(JObjectClass)
  ['{7A9C9C09-BA05-4852-86FE-552D22961051}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/ClickListener')]
  JClickListener = interface(IJavaInstance)
  ['{349679C4-083C-4161-B0BA-010700DFD2C9}']
    { Property Methods }

    { methods }
    procedure onClick; cdecl; //()V

    { Property }
  end;

  TJClickListener = class(TJavaGenericImport<JClickListenerClass, JClickListener>) end;

  JErrorListenerClass = interface(JObjectClass)
  ['{19B11570-DD8E-4A47-BCA5-EDF503857FBE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/ErrorListener')]
  JErrorListener = interface(IJavaInstance)
  ['{FA975207-2786-4648-A320-50C342976011}']
    { Property Methods }

    { methods }
    procedure onError; cdecl; //()V
    procedure AudioPermissionError; cdecl; //()V

    { Property }
  end;

  TJErrorListener = class(TJavaGenericImport<JErrorListenerClass, JErrorListener>) end;

  JFocusCallbackClass = interface(JObjectClass)
  ['{FF688DC7-7520-45B6-A73A-60F24FD59E6B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/FocusCallback')]
  JFocusCallback = interface(IJavaInstance)
  ['{3DC5687B-7337-473E-AF0D-EDD16DD6FE9E}']
    { Property Methods }

    { methods }
    procedure focusSuccess; cdecl; //()V

    { Property }
  end;

  TJFocusCallback = class(TJavaGenericImport<JFocusCallbackClass, JFocusCallback>) end;

  JJCameraListenerClass = interface(JObjectClass)
  ['{B87AEB12-31B6-4835-9AB1-F3BB1C4483AA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/JCameraListener')]
  JJCameraListener = interface(IJavaInstance)
  ['{5C11B439-735E-4B0D-A0F9-4904E565443A}']
    { Property Methods }

    { methods }
    procedure captureSuccess(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure recordSuccess(P1: JString; P2: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJJCameraListener = class(TJavaGenericImport<JJCameraListenerClass, JJCameraListener>) end;

  JOnCaptureListenerClass = interface(JObjectClass)
  ['{3EF3CABF-A6CF-48C1-BCDE-32AB090EC15A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnCaptureListener')]
  JOnCaptureListener = interface(IJavaInstance)
  ['{FE18259F-07C5-447A-A537-1169F1139FEC}']
    { Property Methods }

    { methods }
    procedure onCapture(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJOnCaptureListener = class(TJavaGenericImport<JOnCaptureListenerClass, JOnCaptureListener>) end;

  JOnFpsListenerClass = interface(JObjectClass)
  ['{E864EB7A-19EC-4EEE-8821-9D2B19176ED4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnFpsListener')]
  JOnFpsListener = interface(IJavaInstance)
  ['{AC71501A-EED8-4C55-9D54-A72CC65C4A09}']
    { Property Methods }

    { methods }
    procedure onFpsCallback(P1: Single); cdecl; //(F)V

    { Property }
  end;

  TJOnFpsListener = class(TJavaGenericImport<JOnFpsListenerClass, JOnFpsListener>) end;

  JOnFrameAvailableListenerClass = interface(JObjectClass)
  ['{DF9DA76E-B82C-4B96-AAB4-956A1ABA00E1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnFrameAvailableListener')]
  JOnFrameAvailableListener = interface(IJavaInstance)
  ['{205AC37F-FF9A-40ED-846C-32DB8638443A}']
    { Property Methods }

    { methods }
    procedure onFrameAvailable(P1: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V

    { Property }
  end;

  TJOnFrameAvailableListener = class(TJavaGenericImport<JOnFrameAvailableListenerClass, JOnFrameAvailableListener>) end;

  JOnPreviewCaptureListener_MediaTypeClass = interface(JObjectClass)
  ['{8660A0B0-4B87-4917-96FA-81838F65FE50}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnPreviewCaptureListener$MediaType')]
  JOnPreviewCaptureListener_MediaType = interface(IJavaInstance)
  ['{797C977D-F557-46C0-A3BC-649103EB0065}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOnPreviewCaptureListener_MediaType = class(TJavaGenericImport<JOnPreviewCaptureListener_MediaTypeClass, JOnPreviewCaptureListener_MediaType>) end;

  JOnPreviewCaptureListenerClass = interface(JObjectClass)
  ['{C9517C4A-31A5-4AEF-B282-6A1706212562}']
    { static Property Methods }
    {class} function _GetMediaTypePicture: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMediaTypeVideo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }

    { static Property }
    {class} property MediaTypePicture: Integer read _GetMediaTypePicture;
    {class} property MediaTypeVideo: Integer read _GetMediaTypeVideo;
  end;

  [JavaSignature('com/devil/library/camera/listener/OnPreviewCaptureListener')]
  JOnPreviewCaptureListener = interface(IJavaInstance)
  ['{AC27F4C3-2FEF-4A2F-AD72-3DE1AB2692D1}']
    { Property Methods }

    { methods }
    procedure onPreviewCapture(P1: JString; P2: Integer); cdecl; //(Ljava/lang/String;I)V

    { Property }
  end;

  TJOnPreviewCaptureListener = class(TJavaGenericImport<JOnPreviewCaptureListenerClass, JOnPreviewCaptureListener>) end;

  JOnRecordListenerClass = interface(JObjectClass)
  ['{ACC78256-F088-4187-AB8E-512553EE07E7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnRecordListener')]
  JOnRecordListener = interface(IJavaInstance)
  ['{C3BCC8C4-DC71-4BE8-A265-4E3B7C6374B1}']
    { Property Methods }

    { methods }
    procedure onRecordStart(P1: JMediaType); cdecl; //(Lcom/devil/library/camera/params/MediaType;)V
    procedure onRecording(P1: JMediaType; P2: Int64); cdecl; //(Lcom/devil/library/camera/params/MediaType;J)V
    procedure onRecordFinish(P1: JRecordInfo); cdecl; //(Lcom/devil/library/camera/params/RecordInfo;)V

    { Property }
  end;

  TJOnRecordListener = class(TJavaGenericImport<JOnRecordListenerClass, JOnRecordListener>) end;

  JOnRecordStateListenerClass = interface(JObjectClass)
  ['{C0B9F04C-ADE5-4272-BF5A-A094D5B685A6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnRecordStateListener')]
  JOnRecordStateListener = interface(IJavaInstance)
  ['{ABE6399C-0E91-4702-B382-C16D2796FF5C}']
    { Property Methods }

    { methods }
    procedure onRecordStart; cdecl; //()V
    procedure onRecording(P1: Int64); cdecl; //(J)V
    procedure onRecordFinish(P1: JRecordInfo); cdecl; //(Lcom/devil/library/camera/params/RecordInfo;)V

    { Property }
  end;

  TJOnRecordStateListener = class(TJavaGenericImport<JOnRecordStateListenerClass, JOnRecordStateListener>) end;

  JOnSurfaceTextureListenerClass = interface(JObjectClass)
  ['{B48FBC80-A4B0-4651-B7A8-732E26216E32}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/OnSurfaceTextureListener')]
  JOnSurfaceTextureListener = interface(IJavaInstance)
  ['{7160EF64-C33E-4534-A8A6-A5D872F72308}']
    { Property Methods }

    { methods }
    procedure onSurfaceTexturePrepared(P1: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V

    { Property }
  end;

  TJOnSurfaceTextureListener = class(TJavaGenericImport<JOnSurfaceTextureListenerClass, JOnSurfaceTextureListener>) end;

  JPreviewCallbackClass = interface(JObjectClass)
  ['{925C766A-09DB-4BD5-9696-54699A9605F6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/PreviewCallback')]
  JPreviewCallback = interface(IJavaInstance)
  ['{03A22FBF-85D8-4570-9282-05DC9ADE2884}']
    { Property Methods }

    { methods }
    procedure onPreviewFrame(P1: TJavaArray<Byte>); cdecl; //([B)V

    { Property }
  end;

  TJPreviewCallback = class(TJavaGenericImport<JPreviewCallbackClass, JPreviewCallback>) end;

  JResultListenerClass = interface(JObjectClass)
  ['{EBEAEBB2-D0F3-4D69-89C4-058731811D41}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/ResultListener')]
  JResultListener = interface(IJavaInstance)
  ['{F3028F8B-AB67-4587-9601-152C28319274}']
    { Property Methods }

    { methods }
    procedure callback; cdecl; //()V

    { Property }
  end;

  TJResultListener = class(TJavaGenericImport<JResultListenerClass, JResultListener>) end;

  JReturnListenerClass = interface(JObjectClass)
  ['{DD504650-CE5E-440F-995E-DAE9D359F3F1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/ReturnListener')]
  JReturnListener = interface(IJavaInstance)
  ['{0E7707F6-DB31-445E-B65C-4BA5CB111A75}']
    { Property Methods }

    { methods }
    procedure onReturn; cdecl; //()V

    { Property }
  end;

  TJReturnListener = class(TJavaGenericImport<JReturnListenerClass, JReturnListener>) end;

  JTypeListenerClass = interface(JObjectClass)
  ['{272E2B11-5FB1-4429-9921-16D03C912123}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/listener/TypeListener')]
  JTypeListener = interface(IJavaInstance)
  ['{774D077A-8C8A-45EB-9A99-0AFC3083AC04}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure confirm; cdecl; //()V

    { Property }
  end;

  TJTypeListener = class(TJavaGenericImport<JTypeListenerClass, JTypeListener>) end;

  JAudioEncoderClass = interface(JObjectClass)
  ['{EEA2F046-580D-4B2D-89AD-18CCF443DFE3}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitrate: Integer; sampleRate: Integer; channelCount: Integer): JAudioEncoder; cdecl; //(III)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/AudioEncoder')]
  JAudioEncoder = interface(JObject)
  ['{3D6EF424-14A8-49FD-AF2B-EBBD8F8DAF7C}']
    { Property Methods }

    { methods }
    procedure setOutputPath(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure setBufferSize(size: Integer); cdecl; //(I)V
    procedure prepare; cdecl; //()V
    procedure release; cdecl; //()V
    procedure encodePCM(data: TJavaArray<Byte>; len: Integer); cdecl; //([BI)V
    function getDuration: Int64; cdecl; //()J

    { Property }
  end;

  TJAudioEncoder = class(TJavaGenericImport<JAudioEncoderClass, JAudioEncoder>) end;

  JAudioRecorderClass = interface(JObjectClass)
  ['{02CF5BFF-5CAC-4BD7-ACE3-33DFA7B66F18}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAudioRecorder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/AudioRecorder')]
  JAudioRecorder = interface(JObject)
  ['{5F621CD6-258A-4526-BE01-8DC110515EF0}']
    { Property Methods }

    { methods }
    function getMediaType: JMediaType; cdecl; //()Lcom/devil/library/camera/params/MediaType;
    procedure setOnRecordListener(listener: JOnRecordListener); cdecl; //(Lcom/devil/library/camera/listener/OnRecordListener;)V
    procedure startRecord; cdecl; //()V
    procedure stopRecord; cdecl; //()V
    procedure prepare(params: JAudioParams); cdecl; //(Lcom/devil/library/camera/params/AudioParams;)V
    procedure release; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJAudioRecorder = class(TJavaGenericImport<JAudioRecorderClass, JAudioRecorder>) end;

  JAudioTranscoder_UnhandledFormatExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{3E5441DE-D9E3-4A8B-8CF5-02B3502D189C}']
    { static Property Methods }

    { static Methods }
    {class} function init(this$0: JAudioTranscoder; sampleRateHz: Integer; channelCount: Integer; encoding: Integer): JAudioTranscoder_UnhandledFormatException; cdecl; //(Lcom/devil/library/camera/media/AudioTranscoder;III)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/AudioTranscoder$UnhandledFormatException')]
  JAudioTranscoder_UnhandledFormatException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{C019674A-B324-47D0-AA3E-0B229E7CD5B4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAudioTranscoder_UnhandledFormatException = class(TJavaGenericImport<JAudioTranscoder_UnhandledFormatExceptionClass, JAudioTranscoder_UnhandledFormatException>) end;

  JAudioTranscoderClass = interface(JObjectClass)
  ['{62B53D12-CB7B-4446-84FB-037E814131F4}']
    { static Property Methods }
    {class} function _GetNO_VALUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMAXIMUM_SPEED: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetMINIMUM_SPEED: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetMAXIMUM_PITCH: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetMINIMUM_PITCH: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetSAMPLE_RATE_NO_CHANGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JAudioTranscoder; cdecl; //()V

    { static Property }
    {class} property NO_VALUE: Integer read _GetNO_VALUE;
    {class} property MAXIMUM_SPEED: Single read _GetMAXIMUM_SPEED;
    {class} property MINIMUM_SPEED: Single read _GetMINIMUM_SPEED;
    {class} property MAXIMUM_PITCH: Single read _GetMAXIMUM_PITCH;
    {class} property MINIMUM_PITCH: Single read _GetMINIMUM_PITCH;
    {class} property SAMPLE_RATE_NO_CHANGE: Integer read _GetSAMPLE_RATE_NO_CHANGE;
  end;

  [JavaSignature('com/devil/library/camera/media/AudioTranscoder')]
  JAudioTranscoder = interface(JObject)
  ['{7B62878C-34B7-46D6-B3AF-5CA70D760F1D}']
    { Property Methods }

    { methods }
    function setSpeed(speed: Single): Single; cdecl; //(F)F
    function setPitch(pitch: Single): Single; cdecl; //(F)F
    procedure setOutputSampleRateHz(sampleRateHz: Integer); cdecl; //(I)V
    function scaleDurationForSpeedup(duration: Int64): Int64; cdecl; //(J)J
    function configure(sampleRateHz: Integer; channelCount: Integer; encoding: Integer): Boolean; cdecl; //(III)Z
    function isActive: Boolean; cdecl; //()Z
    function getOutputChannelCount: Integer; cdecl; //()I
    function getOutputEncoding: Integer; cdecl; //()I
    function getOutputSampleRateHz: Integer; cdecl; //()I
    procedure queueInput(inputBuffer: JByteBuffer); cdecl; //(Ljava/nio/ByteBuffer;)V
    procedure endOfStream; cdecl; //()V
    function getOutput: JByteBuffer; cdecl; //()Ljava/nio/ByteBuffer;
    function isEnded: Boolean; cdecl; //()Z
    procedure flush; cdecl; //()V
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJAudioTranscoder = class(TJavaGenericImport<JAudioTranscoderClass, JAudioTranscoder>) end;

  JHWMediaRecorderClass = interface(JObjectClass)
  ['{F8DFAAE6-089F-4A77-B947-711095478AA3}']
    { static Property Methods }
    {class} function _GetSECOND_IN_US: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(listener: JOnRecordStateListener): JHWMediaRecorder; cdecl; //(Lcom/devil/library/camera/listener/OnRecordStateListener;)V

    { static Property }
    {class} property SECOND_IN_US: Integer read _GetSECOND_IN_US;
  end;

  [JavaSignature('com/devil/library/camera/media/HWMediaRecorder')]
  JHWMediaRecorder = interface(JObject)
  ['{FF1600C7-451F-4C1C-926F-A438E803C649}']
    { Property Methods }

    { methods }
    procedure release; cdecl; //()V
    procedure setEnableAudio(enable: Boolean); cdecl; //(Z)V
    function enableAudio: Boolean; cdecl; //()Z
    procedure startRecord(videoParams: JVideoParams; audioParams: JAudioParams); cdecl; //(Lcom/devil/library/camera/params/VideoParams;Lcom/devil/library/camera/params/AudioParams;)V
    procedure stopRecord; cdecl; //()V
    procedure frameAvailable(texture: Integer; timestamp: Int64); cdecl; //(IJ)V
    function isRecording: Boolean; cdecl; //()Z
    procedure onRecordStart(atype: JMediaType); cdecl; //(Lcom/devil/library/camera/params/MediaType;)V
    procedure onRecording(atype: JMediaType; duration: Int64); cdecl; //(Lcom/devil/library/camera/params/MediaType;J)V
    procedure onRecordFinish(info: JRecordInfo); cdecl; //(Lcom/devil/library/camera/params/RecordInfo;)V

    { Property }
  end;

  TJHWMediaRecorder = class(TJavaGenericImport<JHWMediaRecorderClass, JHWMediaRecorder>) end;

  JSonicClass = interface(JObjectClass)
  ['{4C842645-5C7C-4112-8708-76BF0DC4140E}']
    { static Property Methods }

    { static Methods }
    {class} function init(inputSampleRateHz: Integer; numChannels: Integer; speed: Single; pitch: Single; outputSampleRateHz: Integer): JSonic; cdecl; //(IIFFI)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/Sonic')]
  JSonic = interface(JObject)
  ['{07DA77FF-6327-42BE-86D7-CE123D6AE617}']
    { Property Methods }

    { methods }
    procedure queueInput(buffer: JShortBuffer); cdecl; //(Ljava/nio/ShortBuffer;)V
    procedure getOutput(buffer: JShortBuffer); cdecl; //(Ljava/nio/ShortBuffer;)V
    procedure queueEndOfStream; cdecl; //()V
    function getSamplesAvailable: Integer; cdecl; //()I

    { Property }
  end;

  TJSonic = class(TJavaGenericImport<JSonicClass, JSonic>) end;

  JVideoEncoder_OnEncodingListenerClass = interface(JObjectClass)
  ['{3B7E6143-BE74-4CD4-AD23-7AEE86932B1D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/VideoEncoder$OnEncodingListener')]
  JVideoEncoder_OnEncodingListener = interface(IJavaInstance)
  ['{ACE3FC55-6B8F-42E2-9E48-8F170D891F0B}']
    { Property Methods }

    { methods }
    procedure onEncoding(P1: Int64); cdecl; //(J)V

    { Property }
  end;

  TJVideoEncoder_OnEncodingListener = class(TJavaGenericImport<JVideoEncoder_OnEncodingListenerClass, JVideoEncoder_OnEncodingListener>) end;

  JVideoEncoderClass = interface(JObjectClass)
  ['{48F6A17F-CF64-4D86-BC93-4285034E663E}']
    { static Property Methods }

    { static Methods }
    {class} function init(params: JVideoParams; listener: JVideoEncoder_OnEncodingListener): JVideoEncoder; cdecl; //(Lcom/devil/library/camera/params/VideoParams;Lcom/devil/library/camera/media/VideoEncoder$OnEncodingListener;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/VideoEncoder')]
  JVideoEncoder = interface(JObject)
  ['{5469104A-3481-4796-BC0D-661A30004E61}']
    { Property Methods }

    { methods }
    function getInputSurface: JSurface; cdecl; //()Landroid/view/Surface;
    procedure release; cdecl; //()V
    procedure drainEncoder(endOfStream: Boolean); cdecl; //(Z)V
    function getDuration: Int64; cdecl; //()J
    function getVideoParams: JVideoParams; cdecl; //()Lcom/devil/library/camera/params/VideoParams;

    { Property }
  end;

  TJVideoEncoder = class(TJavaGenericImport<JVideoEncoderClass, JVideoEncoder>) end;

  JVideoRecorder_RecordHandlerClass = interface(JHandlerClass) // or JObjectClass // SuperSignature: android/os/Handler
  ['{EB834617-DE18-49FD-B0F5-37A810049BD2}']
    { static Property Methods }

    { static Methods }
    {class} function init(encoder: JVideoRecorder): JVideoRecorder_RecordHandler; cdecl; //(Lcom/devil/library/camera/media/VideoRecorder;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/VideoRecorder$RecordHandler')]
  JVideoRecorder_RecordHandler = interface(JHandler) // or JObject // SuperSignature: android/os/Handler
  ['{B986FFA5-2F74-4EDA-BC48-FB26A0F70DAF}']
    { Property Methods }

    { methods }
    procedure handleMessage(inputMessage: JMessage); cdecl; //(Landroid/os/Message;)V

    { Property }
  end;

  TJVideoRecorder_RecordHandler = class(TJavaGenericImport<JVideoRecorder_RecordHandlerClass, JVideoRecorder_RecordHandler>) end;

  JVideoRecorderClass = interface(JObjectClass)
  ['{AF7E8AC8-865C-43A9-A0C3-4B2B5B635464}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVideoRecorder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/media/VideoRecorder')]
  JVideoRecorder = interface(JObject)
  ['{7BC2822E-69B7-4728-B1CA-C4C4EB5A24CA}']
    { Property Methods }

    { methods }
    procedure setOnRecordListener(listener: JOnRecordListener); cdecl; //(Lcom/devil/library/camera/listener/OnRecordListener;)V
    procedure startRecord(params: JVideoParams); cdecl; //(Lcom/devil/library/camera/params/VideoParams;)V
    procedure stopRecord; cdecl; //()V
    procedure release; cdecl; //()V
    function isRecording: Boolean; cdecl; //()Z
    procedure frameAvailable(texture: Integer; timestamp: Int64); cdecl; //(IJ)V
    procedure onEncoding(duration: Int64); cdecl; //(J)V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJVideoRecorder = class(TJavaGenericImport<JVideoRecorderClass, JVideoRecorder>) end;

  JAspectRatioClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{1EADB48D-9AC9-4849-B542-B7844848A9F2}']
    { static Property Methods }
    {class} function _GetRATIO_4_3: JAspectRatio;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/AspectRatio;
    {class} function _GetRATIO_1_1: JAspectRatio;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/AspectRatio;
    {class} function _GetRatio_16_9: JAspectRatio;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/AspectRatio;

    { static Methods }
    {class} function values: TJavaObjectArray<JAspectRatio>; cdecl; //()[Lcom/devil/library/camera/params/AspectRatio;
    {class} function valueOf(name: JString): JAspectRatio; cdecl; //(Ljava/lang/String;)Lcom/devil/library/camera/params/AspectRatio;

    { static Property }
    {class} property RATIO_4_3: JAspectRatio read _GetRATIO_4_3;
    {class} property RATIO_1_1: JAspectRatio read _GetRATIO_1_1;
    {class} property Ratio_16_9: JAspectRatio read _GetRatio_16_9;
  end;

  [JavaSignature('com/devil/library/camera/params/AspectRatio')]
  JAspectRatio = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{1224D14B-AAE9-4A1D-9873-797334F75641}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAspectRatio = class(TJavaGenericImport<JAspectRatioClass, JAspectRatio>) end;

  JAudioParamsClass = interface(JObjectClass)
  ['{E011A18F-5DBF-46FD-A0F2-F0B5FBDC4C65}']
    { static Property Methods }
    {class} function _GetMIME_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetSAMPLE_RATE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBIT_RATE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JAudioParams; cdecl; //()V
    {class} function getAudioTempPath(context: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;

    { static Property }
    {class} property MIME_TYPE: JString read _GetMIME_TYPE;
    {class} property SAMPLE_RATE: Integer read _GetSAMPLE_RATE;
    {class} property BIT_RATE: Integer read _GetBIT_RATE;
  end;

  [JavaSignature('com/devil/library/camera/params/AudioParams')]
  JAudioParams = interface(JObject)
  ['{E90653ED-274E-4066-9F1F-579EB298AE8D}']
    { Property Methods }

    { methods }
    procedure setSampleRate(sampleRate: Integer); cdecl; //(I)V
    function getSampleRate: Integer; cdecl; //()I
    procedure setChannel(channel: Integer); cdecl; //(I)V
    function getChannel: Integer; cdecl; //()I
    procedure setBitRate(bitRate: Integer); cdecl; //(I)V
    function getBitRate: Integer; cdecl; //()I
    procedure setAudioFormat(audioFormat: Integer); cdecl; //(I)V
    function getAudioFormat: Integer; cdecl; //()I
    procedure setAudioPath(audioPath: JString); cdecl; //(Ljava/lang/String;)V
    function getAudioPath: JString; cdecl; //()Ljava/lang/String;
    procedure setMaxDuration(maxDuration: Int64); cdecl; //(J)V
    function getMaxDuration: Int64; cdecl; //()J

    { Property }
  end;

  TJAudioParams = class(TJavaGenericImport<JAudioParamsClass, JAudioParams>) end;

  JCalculateTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{B410C17C-717A-40C8-96C4-0AC07CA07A53}']
    { static Property Methods }
    {class} function _GetMin: JCalculateType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/CalculateType;
    {class} function _GetMax: JCalculateType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/CalculateType;
    {class} function _GetLarger: JCalculateType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/CalculateType;
    {class} function _GetLower: JCalculateType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/CalculateType;

    { static Methods }
    {class} function values: TJavaObjectArray<JCalculateType>; cdecl; //()[Lcom/devil/library/camera/params/CalculateType;
    {class} function valueOf(name: JString): JCalculateType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/camera/params/CalculateType;

    { static Property }
    {class} property Min: JCalculateType read _GetMin;
    {class} property Max: JCalculateType read _GetMax;
    {class} property Larger: JCalculateType read _GetLarger;
    {class} property Lower: JCalculateType read _GetLower;
  end;

  [JavaSignature('com/devil/library/camera/params/CalculateType')]
  JCalculateType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3A146FD0-DA95-496E-8B08-35BCD0C5CC3C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCalculateType = class(TJavaGenericImport<JCalculateTypeClass, JCalculateType>) end;

  JCameraParamClass = interface(JObjectClass)
  ['{00012AA0-3BA3-4431-8F93-97D7866C741C}']
    { static Property Methods }
    {class} function _GetMAX_FOCUS_WEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_RECORD_TIME: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_16_9_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_16_9_HEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_4_3_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_4_3_HEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDESIRED_PREVIEW_FPS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetRatio_4_3: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetRatio_16_9: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _GetWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function getInstance: JCameraParam; cdecl; //()Lcom/devil/library/camera/params/CameraParam;

    { static Property }
    {class} property MAX_FOCUS_WEIGHT: Integer read _GetMAX_FOCUS_WEIGHT;
    {class} property DEFAULT_RECORD_TIME: Integer read _GetDEFAULT_RECORD_TIME;
    {class} property DEFAULT_16_9_WIDTH: Integer read _GetDEFAULT_16_9_WIDTH;
    {class} property DEFAULT_16_9_HEIGHT: Integer read _GetDEFAULT_16_9_HEIGHT;
    {class} property DEFAULT_4_3_WIDTH: Integer read _GetDEFAULT_4_3_WIDTH;
    {class} property DEFAULT_4_3_HEIGHT: Integer read _GetDEFAULT_4_3_HEIGHT;
    {class} property DESIRED_PREVIEW_FPS: Integer read _GetDESIRED_PREVIEW_FPS;
    {class} property Ratio_4_3: Single read _GetRatio_4_3;
    {class} property Ratio_16_9: Single read _GetRatio_16_9;
    {class} property Weight: Integer read _GetWeight;
  end;

  [JavaSignature('com/devil/library/camera/params/CameraParam')]
  JCameraParam = interface(JObject)
  ['{DE1AA585-0F4B-44B8-8362-D2EF3CB118A9}']
    { Property Methods }
    function _GetdrawFacePoints: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetdrawFacePoints(adrawFacePoints: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetshowFps: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetshowFps(ashowFps: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetaspectRatio: JAspectRatio;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/AspectRatio;
    procedure _SetaspectRatio(aaspectRatio: JAspectRatio);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/camera/params/AspectRatio;)V
    function _GetcurrentRatio: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetcurrentRatio(acurrentRatio: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetexpectFps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetexpectFps(aexpectFps: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetpreviewFps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetpreviewFps(apreviewFps: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetexpectWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetexpectWidth(aexpectWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetexpectHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetexpectHeight(aexpectHeight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetpreviewWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetpreviewWidth(apreviewWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetpreviewHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetpreviewHeight(apreviewHeight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GethighDefinition: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SethighDefinition(ahighDefinition: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getorientation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setorientation(aorientation: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetbackCamera: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetbackCamera(abackCamera: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetcameraId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcameraId(acameraId: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetsupportFlash: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetsupportFlash(asupportFlash: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetfocusWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetfocusWeight(afocusWeight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getrecordable: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _Setrecordable(arecordable: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetrecordTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetrecordTime(arecordTime: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetrecordAudio: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetrecordAudio(arecordAudio: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GettouchTake: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SettouchTake(atouchTake: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GettakeDelay: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SettakeDelay(atakeDelay: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetluminousEnhancement: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetluminousEnhancement(aluminousEnhancement: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getbrightness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setbrightness(abrightness: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetcaptureCallback: JOnCaptureListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/listener/OnCaptureListener;
    procedure _SetcaptureCallback(acaptureCallback: JOnCaptureListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/camera/listener/OnCaptureListener;)V
    function _GetfpsCallback: JOnFpsListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/listener/OnFpsListener;
    procedure _SetfpsCallback(afpsCallback: JOnFpsListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/camera/listener/OnFpsListener;)V
    function _GetshowCompare: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetshowCompare(ashowCompare: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetisTakePicture: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisTakePicture(aisTakePicture: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetenableDepthBlur: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetenableDepthBlur(aenableDepthBlur: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetenableVignette: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetenableVignette(aenableVignette: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getbeauty: JBeautyParam;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/cgfay/filter/glfilter/beauty/bean/BeautyParam;
    procedure _Setbeauty(abeauty: JBeautyParam);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/cgfay/filter/glfilter/beauty/bean/BeautyParam;)V

    { methods }
    procedure setAspectRatio(aspectRatio: JAspectRatio); cdecl; //(Lcom/devil/library/camera/params/AspectRatio;)V
    procedure setBackCamera(backCamera: Boolean); cdecl; //(Z)V
    procedure setFocusWeight(focusWeight: Integer); cdecl; //(I)V
    function getBeauty: JBeautyParam; cdecl; //()Lcom/cgfay/filter/glfilter/beauty/bean/BeautyParam;

    { Property }
    property drawFacePoints: Boolean read _GetdrawFacePoints write _SetdrawFacePoints;
    property showFps: Boolean read _GetshowFps write _SetshowFps;
    property aspectRatio: JAspectRatio read _GetaspectRatio write _SetaspectRatio;
    property currentRatio: Single read _GetcurrentRatio write _SetcurrentRatio;
    property expectFps: Integer read _GetexpectFps write _SetexpectFps;
    property previewFps: Integer read _GetpreviewFps write _SetpreviewFps;
    property expectWidth: Integer read _GetexpectWidth write _SetexpectWidth;
    property expectHeight: Integer read _GetexpectHeight write _SetexpectHeight;
    property previewWidth: Integer read _GetpreviewWidth write _SetpreviewWidth;
    property previewHeight: Integer read _GetpreviewHeight write _SetpreviewHeight;
    property highDefinition: Boolean read _GethighDefinition write _SethighDefinition;
    property orientation: Integer read _Getorientation write _Setorientation;
    property backCamera: Boolean read _GetbackCamera write _SetbackCamera;
    property cameraId: Integer read _GetcameraId write _SetcameraId;
    property supportFlash: Boolean read _GetsupportFlash write _SetsupportFlash;
    property focusWeight: Integer read _GetfocusWeight write _SetfocusWeight;
    property recordable: Boolean read _Getrecordable write _Setrecordable;
    property recordTime: Integer read _GetrecordTime write _SetrecordTime;
    property recordAudio: Boolean read _GetrecordAudio write _SetrecordAudio;
    property touchTake: Boolean read _GettouchTake write _SettouchTake;
    property takeDelay: Boolean read _GettakeDelay write _SettakeDelay;
    property luminousEnhancement: Boolean read _GetluminousEnhancement write _SetluminousEnhancement;
    property brightness: Integer read _Getbrightness write _Setbrightness;
    property captureCallback: JOnCaptureListener read _GetcaptureCallback write _SetcaptureCallback;
    property fpsCallback: JOnFpsListener read _GetfpsCallback write _SetfpsCallback;
    property showCompare: Boolean read _GetshowCompare write _SetshowCompare;
    property isTakePicture: Boolean read _GetisTakePicture write _SetisTakePicture;
    property enableDepthBlur: Boolean read _GetenableDepthBlur write _SetenableDepthBlur;
    property enableVignette: Boolean read _GetenableVignette write _SetenableVignette;
    property beauty: JBeautyParam read _Getbeauty write _Setbeauty;
  end;

  TJCameraParam = class(TJavaGenericImport<JCameraParamClass, JCameraParam>) end;

  JMediaInfoClass = interface(JObjectClass)
  ['{4A8D3416-FFCA-4168-8F92-782563D8AF4C}']
    { static Property Methods }

    { static Methods }
    {class} function init(name: JString; duration: Int64): JMediaInfo; cdecl; //(Ljava/lang/String;J)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/params/MediaInfo')]
  JMediaInfo = interface(JObject)
  ['{4E45E027-310C-4165-A25A-B1DF30C7F8FC}']
    { Property Methods }

    { methods }
    function getDuration: Int64; cdecl; //()J
    function getFileName: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJMediaInfo = class(TJavaGenericImport<JMediaInfoClass, JMediaInfo>) end;

  JMediaTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{EDBE6645-5FBE-4397-A2C1-5A08235EF9A9}']
    { static Property Methods }
    {class} function _GetAUDIO: JMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/MediaType;
    {class} function _GetVIDEO: JMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/params/MediaType;

    { static Methods }
    {class} function values: TJavaObjectArray<JMediaType>; cdecl; //()[Lcom/devil/library/camera/params/MediaType;
    {class} function valueOf(name: JString): JMediaType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/camera/params/MediaType;

    { static Property }
    {class} property AUDIO: JMediaType read _GetAUDIO;
    {class} property VIDEO: JMediaType read _GetVIDEO;
  end;

  [JavaSignature('com/devil/library/camera/params/MediaType')]
  JMediaType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{7B4DA47D-AA47-4470-9960-CE63E1D9A3C9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaType = class(TJavaGenericImport<JMediaTypeClass, JMediaType>) end;

  JRecordInfoClass = interface(JObjectClass)
  ['{DBEA09E8-10B3-48AB-80D5-C9CAFFC57911}']
    { static Property Methods }

    { static Methods }
    {class} function init(fileName: JString; duration: Int64; P3: JMediaType): JRecordInfo; cdecl; overload; //(Ljava/lang/String;JLcom/devil/library/camera/params/MediaType;)V
    {class} function init(fileName: JString; atype: JMediaType): JRecordInfo; cdecl; overload; //(Ljava/lang/String;Lcom/devil/library/camera/params/MediaType;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/params/RecordInfo')]
  JRecordInfo = interface(JObject)
  ['{D0269724-16CE-40F5-95B6-571DAFC8FE30}']
    { Property Methods }

    { methods }
    function getFileName: JString; cdecl; //()Ljava/lang/String;
    function getDuration: Int64; cdecl; //()J
    function getType: JMediaType; cdecl; //()Lcom/devil/library/camera/params/MediaType;

    { Property }
  end;

  TJRecordInfo = class(TJavaGenericImport<JRecordInfoClass, JRecordInfo>) end;

  JVideoParamsClass = interface(JObjectClass)
  ['{62AFE735-4513-40DB-95F7-300EF3EAAF6B}']
    { static Property Methods }
    {class} function _GetMIME_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFRAME_RATE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetI_FRAME_INTERVAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBIT_RATE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBIT_RATE_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JVideoParams; cdecl; //()V
    {class} function getVideoTempPath(context: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;

    { static Property }
    {class} property MIME_TYPE: JString read _GetMIME_TYPE;
    {class} property FRAME_RATE: Integer read _GetFRAME_RATE;
    {class} property I_FRAME_INTERVAL: Integer read _GetI_FRAME_INTERVAL;
    {class} property BIT_RATE: Integer read _GetBIT_RATE;
    {class} property BIT_RATE_LOW: Integer read _GetBIT_RATE_LOW;
  end;

  [JavaSignature('com/devil/library/camera/params/VideoParams')]
  JVideoParams = interface(JObject)
  ['{D01F3325-4285-4FEA-AB5A-30B83E324695}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
    function setVideoPath(fileName: JString): JVideoParams; cdecl; //(Ljava/lang/String;)Lcom/devil/library/camera/params/VideoParams;
    function getVideoPath: JString; cdecl; //()Ljava/lang/String;
    function setVideoSize(width: Integer; height: Integer): JVideoParams; cdecl; //(II)Lcom/devil/library/camera/params/VideoParams;
    function setVideoWidth(width: Integer): JVideoParams; cdecl; //(I)Lcom/devil/library/camera/params/VideoParams;
    function getVideoWidth: Integer; cdecl; //()I
    function setVideoHeight(height: Integer): JVideoParams; cdecl; //(I)Lcom/devil/library/camera/params/VideoParams;
    function getVideoHeight: Integer; cdecl; //()I
    function setBitRate(bitRate: Integer): JVideoParams; cdecl; //(I)Lcom/devil/library/camera/params/VideoParams;
    function getBitRate: Integer; cdecl; //()I
    function setMaxDuration(maxDuration: Int64): JVideoParams; cdecl; //(J)Lcom/devil/library/camera/params/VideoParams;
    function getMaxDuration: Int64; cdecl; //()J
    function setEglContext(context: JEGLContext): JVideoParams; cdecl; //(Landroid/opengl/EGLContext;)Lcom/devil/library/camera/params/VideoParams;
    function getEglContext: JEGLContext; cdecl; //()Landroid/opengl/EGLContext;

    { Property }
  end;

  TJVideoParams = class(TJavaGenericImport<JVideoParamsClass, JVideoParams>) end;

  JCameraRendererClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{EA5AAD23-30D9-42AA-80CF-503C7930BF6D}']
    { static Property Methods }

    { static Methods }
    {class} function init(presenter: JCameraPreviewPresenter): JCameraRenderer; cdecl; //(Lcom/devil/library/camera/helper/CameraPreviewPresenter;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/CameraRenderer')]
  JCameraRenderer = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{9B3651D0-BE71-4B42-9CFE-DDB90C4D7246}']
    { Property Methods }

    { methods }
    procedure initRenderer; cdecl; //()V
    procedure destroyRenderer; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure onSurfaceCreated(surface: JSurface); cdecl; overload; //(Landroid/view/Surface;)V
    procedure onSurfaceCreated(surfaceTexture: JSurfaceTexture); cdecl; overload; //(Landroid/graphics/SurfaceTexture;)V
    procedure onSurfaceChanged(width: Integer; height: Integer); cdecl; //(II)V
    procedure onSurfaceDestroyed; cdecl; //()V
    procedure setTextureSize(width: Integer; height: Integer); cdecl; //(II)V
    procedure bindInputSurfaceTexture(surfaceTexture: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
    procedure release; cdecl; //()V
    procedure takePicture; cdecl; //()V
    procedure queueEvent(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    procedure requestRender; cdecl; //()V
    function getTouchableFilter(e: JMotionEvent): JStaticStickerNormalFilter; cdecl; //(Landroid/view/MotionEvent;)Lcom/cgfay/filter/glfilter/stickers/StaticStickerNormalFilter;
    procedure changeFilter(color: JDynamicColor); cdecl; //(Lcom/cgfay/filter/glfilter/color/bean/DynamicColor;)V
    procedure changeMakeup(makeup: JDynamicMakeup); cdecl; //(Lcom/cgfay/filter/glfilter/makeup/bean/DynamicMakeup;)V
    procedure changeResource(color: JDynamicColor); cdecl; overload; //(Lcom/cgfay/filter/glfilter/color/bean/DynamicColor;)V
    procedure changeResource(sticker: JDynamicSticker); cdecl; overload; //(Lcom/cgfay/filter/glfilter/stickers/bean/DynamicSticker;)V
    procedure changeEdgeBlur(hasBlur: Boolean); cdecl; //(Z)V
    procedure run; cdecl; //()V
    function getHandler: JCameraRenderHandler; cdecl; //()Lcom/devil/library/camera/render/CameraRenderHandler;

    { Property }
  end;

  TJCameraRenderer = class(TJavaGenericImport<JCameraRendererClass, JCameraRenderer>) end;

  JCameraRenderHandlerClass = interface(JHandlerClass) // or JObjectClass // SuperSignature: android/os/Handler
  ['{24AD4C9F-C0D0-4E69-8258-792815C17B51}']
    { static Property Methods }

    { static Methods }
    {class} function init(looper: JLooper; renderer: JCameraRenderer): JCameraRenderHandler; cdecl; //(Landroid/os/Looper;Lcom/devil/library/camera/render/CameraRenderer;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/CameraRenderHandler')]
  JCameraRenderHandler = interface(JHandler) // or JObject // SuperSignature: android/os/Handler
  ['{27DFA96D-C5C1-425C-9629-C40F22A858DB}']
    { Property Methods }

    { methods }
    procedure handleMessage(msg: JMessage); cdecl; //(Landroid/os/Message;)V
    procedure queueEvent(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V

    { Property }
  end;

  TJCameraRenderHandler = class(TJavaGenericImport<JCameraRenderHandlerClass, JCameraRenderHandler>) end;

  JFrameRateMeterClass = interface(JObjectClass)
  ['{BA5592FE-5F76-44FC-8055-BCC7741B2467}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFrameRateMeter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/FrameRateMeter')]
  JFrameRateMeter = interface(JObject)
  ['{4B464025-244A-4A61-A6A8-EDB4BB1E9F31}']
    { Property Methods }

    { methods }
    procedure drawFrameCount; cdecl; //()V
    function getFPS: Single; cdecl; //()F

    { Property }
  end;

  TJFrameRateMeter = class(TJavaGenericImport<JFrameRateMeterClass, JFrameRateMeter>) end;

  JGLImageReader_ImageAvailableClass = interface(JObjectClass)
  ['{33DE5FBC-50E4-4591-9B11-FDF793C3649D}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JGLImageReader): JGLImageReader_ImageAvailable; cdecl; //(Lcom/devil/library/camera/render/GLImageReader;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/GLImageReader$ImageAvailable')]
  JGLImageReader_ImageAvailable = interface(JObject)
  ['{834FEF7B-BA01-4DA7-A0BF-3BC3436DA52B}']
    { Property Methods }

    { methods }
    procedure onImageAvailable(reader: JImageReader); cdecl; //(Landroid/media/ImageReader;)V

    { Property }
  end;

  TJGLImageReader_ImageAvailable = class(TJavaGenericImport<JGLImageReader_ImageAvailableClass, JGLImageReader_ImageAvailable>) end;

  JGLImageReader_ImageReceiveListenerClass = interface(JObjectClass)
  ['{8386EE8D-8C4B-4284-9740-1637A50865B9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/GLImageReader$ImageReceiveListener')]
  JGLImageReader_ImageReceiveListener = interface(IJavaInstance)
  ['{7EB22AB8-E9B0-45BA-94AA-C29192BB7D62}']
    { Property Methods }

    { methods }
    procedure onImageReceive(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJGLImageReader_ImageReceiveListener = class(TJavaGenericImport<JGLImageReader_ImageReceiveListenerClass, JGLImageReader_ImageReceiveListener>) end;

  JGLImageReaderClass = interface(JObjectClass)
  ['{D06C6A64-88F0-456B-835A-97FE022440A6}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JEGLContext; listener: JGLImageReader_ImageReceiveListener): JGLImageReader; cdecl; overload; //(Landroid/opengl/EGLContext;Lcom/devil/library/camera/render/GLImageReader$ImageReceiveListener;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/GLImageReader')]
  JGLImageReader = interface(JObject)
  ['{ECAA7D62-0029-463F-8179-A3AE465A6292}']
    { Property Methods }

    { methods }
    procedure init(width: Integer; height: Integer); cdecl; overload; //(II)V
    procedure drawFrame(texture: Integer); cdecl; //(I)V
    procedure release; cdecl; //()V

    { Property }
  end;

  TJGLImageReader = class(TJavaGenericImport<JGLImageReaderClass, JGLImageReader>) end;

  JRenderIndexClass = interface(JObjectClass)
  ['{53C3C857-BBD0-4500-A55E-A8C54E99F08D}']
    { static Property Methods }
    {class} function _GetCameraIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBeautyIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMakeupIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFaceAdjustIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFilterIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetResourceIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDepthBlurIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVignetteIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDisplayIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFacePointIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetNumberIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JRenderIndex; cdecl; //()V

    { static Property }
    {class} property CameraIndex: Integer read _GetCameraIndex;
    {class} property BeautyIndex: Integer read _GetBeautyIndex;
    {class} property MakeupIndex: Integer read _GetMakeupIndex;
    {class} property FaceAdjustIndex: Integer read _GetFaceAdjustIndex;
    {class} property FilterIndex: Integer read _GetFilterIndex;
    {class} property ResourceIndex: Integer read _GetResourceIndex;
    {class} property DepthBlurIndex: Integer read _GetDepthBlurIndex;
    {class} property VignetteIndex: Integer read _GetVignetteIndex;
    {class} property DisplayIndex: Integer read _GetDisplayIndex;
    {class} property FacePointIndex: Integer read _GetFacePointIndex;
    {class} property NumberIndex: Integer read _GetNumberIndex;
  end;

  [JavaSignature('com/devil/library/camera/render/RenderIndex')]
  JRenderIndex = interface(JObject)
  ['{CC2D4DCF-43F8-4E1B-BBCB-BE12D8FCF8E3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRenderIndex = class(TJavaGenericImport<JRenderIndexClass, JRenderIndex>) end;

  JRenderManagerClass = interface(JObjectClass)
  ['{D202B99C-CB6A-481C-9649-07013C5C2284}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRenderManager; cdecl; overload; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/render/RenderManager')]
  JRenderManager = interface(JObject)
  ['{059D67AF-6BDA-4318-BAB1-946A7118FE58}']
    { Property Methods }

    { methods }
    procedure init(context: JContext); cdecl; overload; //(Landroid/content/Context;)V
    procedure release; cdecl; //()V
    procedure changeEdgeBlurFilter(enableEdgeBlur: Boolean); cdecl; //(Z)V
    procedure changeDynamicFilter(color: JDynamicColor); cdecl; //(Lcom/cgfay/filter/glfilter/color/bean/DynamicColor;)V
    procedure changeDynamicMakeup(dynamicMakeup: JDynamicMakeup); cdecl; //(Lcom/cgfay/filter/glfilter/makeup/bean/DynamicMakeup;)V
    procedure changeDynamicResource(color: JDynamicColor); cdecl; overload; //(Lcom/cgfay/filter/glfilter/color/bean/DynamicColor;)V
    procedure changeDynamicResource(sticker: JDynamicSticker); cdecl; overload; //(Lcom/cgfay/filter/glfilter/stickers/bean/DynamicSticker;)V
    function drawFrame(inputTexture: Integer; mMatrix: TJavaArray<Single>): Integer; cdecl; //(I[F)I
    procedure drawFacePoint(mCurrentTexture: Integer); cdecl; //(I)V
    procedure setTextureSize(width: Integer; height: Integer); cdecl; //(II)V
    function getTextureWidth: Integer; cdecl; //()I
    function getTextureHeight: Integer; cdecl; //()I
    procedure setDisplaySize(width: Integer; height: Integer); cdecl; //(II)V
    function touchDown(e: JMotionEvent): JStaticStickerNormalFilter; cdecl; //(Landroid/view/MotionEvent;)Lcom/cgfay/filter/glfilter/stickers/StaticStickerNormalFilter;

    { Property }
  end;

  TJRenderManager = class(TJavaGenericImport<JRenderManagerClass, JRenderManager>) end;

  JScaleTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4ABCED67-3850-4F31-B534-194F62230047}']
    { static Property Methods }
    {class} function _GetCENTER_INSIDE: JScaleType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/render/ScaleType;
    {class} function _GetCENTER_CROP: JScaleType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/render/ScaleType;
    {class} function _GetFIT_XY: JScaleType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/camera/render/ScaleType;

    { static Methods }
    {class} function values: TJavaObjectArray<JScaleType>; cdecl; //()[Lcom/devil/library/camera/render/ScaleType;
    {class} function valueOf(name: JString): JScaleType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/camera/render/ScaleType;

    { static Property }
    {class} property CENTER_INSIDE: JScaleType read _GetCENTER_INSIDE;
    {class} property CENTER_CROP: JScaleType read _GetCENTER_CROP;
    {class} property FIT_XY: JScaleType read _GetFIT_XY;
  end;

  [JavaSignature('com/devil/library/camera/render/ScaleType')]
  JScaleType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{A8271E16-57B2-49B0-8472-8999F5777BE3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScaleType = class(TJavaGenericImport<JScaleTypeClass, JScaleType>) end;

  JReturnButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{4022E37E-DAA5-42B3-9055-70E2D360F792}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; size: Integer): JReturnButton; cdecl; overload; //(Landroid/content/Context;I)V
    {class} function init(context: JContext): JReturnButton; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/ReturnButton')]
  JReturnButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{CA198691-1198-4C9B-9215-C7C655575625}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReturnButton = class(TJavaGenericImport<JReturnButtonClass, JReturnButton>) end;

  JBorrowPictureStateClass = interface(JObjectClass)
  ['{B27D3A0E-57F8-48B8-B419-90B2B4E66B3F}']
    { static Property Methods }

    { static Methods }
    {class} function init(machine: JCameraMachine): JBorrowPictureState; cdecl; //(Lcom/devil/library/camera/state/CameraMachine;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/state/BorrowPictureState')]
  JBorrowPictureState = interface(JObject)
  ['{F24FC05A-1A74-41F6-9BFA-ABFAB46396D5}']
    { Property Methods }

    { methods }
    procedure start(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure stop; cdecl; //()V
    procedure foucs(x: Single; y: Single; callback: JCameraInterface_FocusCallback); cdecl; //(FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V
    procedure swtich(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure restart; cdecl; //()V
    procedure capture; cdecl; //()V
    procedure &record(surface: JSurface; screenProp: Single); cdecl; //(Landroid/view/Surface;F)V
    procedure stopRecord(isShort: Boolean; time: Int64); cdecl; //(ZJ)V
    procedure cancle(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure confirm; cdecl; //()V
    procedure zoom(zoom: Single; atype: Integer); cdecl; //(FI)V
    procedure flash(mode: JString); cdecl; //(Ljava/lang/String;)V
    function isFront: Boolean; cdecl; //()Z

    { Property }
  end;

  TJBorrowPictureState = class(TJavaGenericImport<JBorrowPictureStateClass, JBorrowPictureState>) end;

  JBorrowVideoStateClass = interface(JObjectClass)
  ['{B8ECB5A4-0705-44E2-AC75-F309F4D4F925}']
    { static Property Methods }

    { static Methods }
    {class} function init(machine: JCameraMachine): JBorrowVideoState; cdecl; //(Lcom/devil/library/camera/state/CameraMachine;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/state/BorrowVideoState')]
  JBorrowVideoState = interface(JObject)
  ['{348B4D59-50B6-4776-AC6F-854FEF35224C}']
    { Property Methods }

    { methods }
    procedure start(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure stop; cdecl; //()V
    procedure foucs(x: Single; y: Single; callback: JCameraInterface_FocusCallback); cdecl; //(FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V
    procedure swtich(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure restart; cdecl; //()V
    procedure capture; cdecl; //()V
    procedure &record(surface: JSurface; screenProp: Single); cdecl; //(Landroid/view/Surface;F)V
    procedure stopRecord(isShort: Boolean; time: Int64); cdecl; //(ZJ)V
    procedure cancle(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure confirm; cdecl; //()V
    procedure zoom(zoom: Single; atype: Integer); cdecl; //(FI)V
    procedure flash(mode: JString); cdecl; //(Ljava/lang/String;)V
    function isFront: Boolean; cdecl; //()Z

    { Property }
  end;

  TJBorrowVideoState = class(TJavaGenericImport<JBorrowVideoStateClass, JBorrowVideoState>) end;

  JCameraMachineClass = interface(JObjectClass)
  ['{41C1E246-D490-4827-8AAE-E52703F90CE5}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; view: JCameraView; cameraOpenOverCallback: JCameraInterface_CameraOpenOverCallback): JCameraMachine; cdecl; //(Landroid/content/Context;Lcom/devil/library/camera/view/CameraView;Lcom/devil/library/camera/CameraInterface$CameraOpenOverCallback;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/state/CameraMachine')]
  JCameraMachine = interface(JObject)
  ['{46C25993-0047-4FBA-8592-F1D582C2719A}']
    { Property Methods }

    { methods }
    function getView: JCameraView; cdecl; //()Lcom/devil/library/camera/view/CameraView;
    function getContext: JContext; cdecl; //()Landroid/content/Context;
    procedure setState(state: JState); cdecl; //(Lcom/devil/library/camera/state/State;)V
    procedure start(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure stop; cdecl; //()V
    procedure foucs(x: Single; y: Single; callback: JCameraInterface_FocusCallback); cdecl; //(FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V
    procedure swtich(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure restart; cdecl; //()V
    procedure capture; cdecl; //()V
    procedure &record(surface: JSurface; screenProp: Single); cdecl; //(Landroid/view/Surface;F)V
    procedure stopRecord(isShort: Boolean; time: Int64); cdecl; //(ZJ)V
    procedure cancle(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure confirm; cdecl; //()V
    procedure zoom(zoom: Single; atype: Integer); cdecl; //(FI)V
    procedure flash(mode: JString); cdecl; //(Ljava/lang/String;)V
    function isFront: Boolean; cdecl; //()Z
    function getState: JState; cdecl; //()Lcom/devil/library/camera/state/State;

    { Property }
  end;

  TJCameraMachine = class(TJavaGenericImport<JCameraMachineClass, JCameraMachine>) end;

//  JPreviewState_1Class = interface(JObjectClass)
//  ['{BE6381D7-7DCB-4C77-BD2C-AC2CEB27B1AE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/state/PreviewState$1')]
//  JPreviewState_1 = interface(JObject)
//  ['{F1FD5256-7ADD-4A0F-A7F0-19B4E9E21762}']
//    { Property Methods }
//
//    { methods }
//    procedure captureResult(bitmap: JBitmap; isVertical: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
//
//    { Property }
//  end;

//  TJPreviewState_1 = class(TJavaGenericImport<JPreviewState_1Class, JPreviewState_1>) end;

//  JPreviewState_2Class = interface(JObjectClass)
//  ['{E210F15A-43F8-4FBB-A324-C59428F4A56C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/state/PreviewState$2')]
//  JPreviewState_2 = interface(JObject)
//  ['{F7EECEB1-42B4-42B7-A341-9A8BDD637E27}']
//    { Property Methods }
//
//    { methods }
//    procedure recordResult(url: JString; firstFrame: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJPreviewState_2 = class(TJavaGenericImport<JPreviewState_2Class, JPreviewState_2>) end;

  JPreviewStateClass = interface(JObjectClass)
  ['{0918B878-5B4D-42E4-9462-86F558EAF094}']
    { static Property Methods }
    {class} function _GetTAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/devil/library/camera/state/PreviewState')]
  JPreviewState = interface(JObject)
  ['{67ECDFF3-0B51-4A7B-BDD5-62AC35FBA37A}']
    { Property Methods }

    { methods }
    procedure start(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    function isFront: Boolean; cdecl; //()Z
    procedure stop; cdecl; //()V
    procedure foucs(x: Single; y: Single; callback: JCameraInterface_FocusCallback); cdecl; //(FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V
    procedure swtich(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure restart; cdecl; //()V
    procedure capture; cdecl; //()V
    procedure &record(surface: JSurface; screenProp: Single); cdecl; //(Landroid/view/Surface;F)V
    procedure stopRecord(isShort: Boolean; time: Int64); cdecl; //(ZJ)V
    procedure cancle(holder: JSurfaceHolder; screenProp: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure confirm; cdecl; //()V
    procedure zoom(zoom: Single; atype: Integer); cdecl; //(FI)V
    procedure flash(mode: JString); cdecl; //(Ljava/lang/String;)V

    { Property }
  end;

  TJPreviewState = class(TJavaGenericImport<JPreviewStateClass, JPreviewState>) end;

  JStateClass = interface(JObjectClass)
  ['{EE8E07FC-1EE3-44BD-9F51-E0BE9D4D4A65}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/state/State')]
  JState = interface(IJavaInstance)
  ['{888BC6B1-AB3F-4EF9-BC51-FB08C8F60C80}']
    { Property Methods }

    { methods }
    procedure start(P1: JSurfaceHolder; P2: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure stop; cdecl; //()V
    procedure foucs(P1: Single; P2: Single; P3: JCameraInterface_FocusCallback); cdecl; //(FFLcom/devil/library/camera/CameraInterface$FocusCallback;)V
    procedure swtich(P1: JSurfaceHolder; P2: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure restart; cdecl; //()V
    procedure capture; cdecl; //()V
    procedure &record(P1: JSurface; P2: Single); cdecl; //(Landroid/view/Surface;F)V
    procedure stopRecord(P1: Boolean; P2: Int64); cdecl; //(ZJ)V
    procedure cancle(P1: JSurfaceHolder; P2: Single); cdecl; //(Landroid/view/SurfaceHolder;F)V
    procedure confirm; cdecl; //()V
    procedure zoom(P1: Single; P2: Integer); cdecl; //(FI)V
    procedure flash(P1: JString); cdecl; //(Ljava/lang/String;)V
    function isFront: Boolean; cdecl; //()Z

    { Property }
  end;

  TJState = class(TJavaGenericImport<JStateClass, JState>) end;

  JTypeButtonClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{6578E1AB-9589-48EE-8500-C48B2A817E4C}']
    { static Property Methods }
    {class} function _GetTYPE_CANCEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTYPE_CONFIRM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JTypeButton; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; atype: Integer; size: Integer): JTypeButton; cdecl; overload; //(Landroid/content/Context;II)V

    { static Property }
    {class} property TYPE_CANCEL: Integer read _GetTYPE_CANCEL;
    {class} property TYPE_CONFIRM: Integer read _GetTYPE_CONFIRM;
  end;

  [JavaSignature('com/devil/library/camera/TypeButton')]
  JTypeButton = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{B1E83879-CA3C-47EB-A2AB-3043064DD42A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTypeButton = class(TJavaGenericImport<JTypeButtonClass, JTypeButton>) end;

  JAngleUtilClass = interface(JObjectClass)
  ['{9D78358C-88E7-4560-BA0F-895D7E52DB3A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAngleUtil; cdecl; //()V
    {class} function getSensorAngle(x: Single; y: Single): Integer; cdecl; //(FF)I

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/AngleUtil')]
  JAngleUtil = interface(JObject)
  ['{0F7AC423-6331-45DF-9641-6C21AEF8F50B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAngleUtil = class(TJavaGenericImport<JAngleUtilClass, JAngleUtil>) end;

  JAudioUtilClass = interface(JObjectClass)
  ['{471D9E81-CAF4-4F41-8072-BA582BEEE518}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAudioUtil; cdecl; //()V
    {class} procedure setAudioManage(context: JContext); cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/AudioUtil')]
  JAudioUtil = interface(JObject)
  ['{CACAC006-F46D-471F-837A-F7FFF52FEE75}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAudioUtil = class(TJavaGenericImport<JAudioUtilClass, JAudioUtil>) end;

//  JCameraParamUtil_1Class = interface(JObjectClass)
//  ['{E11A5834-A91E-411F-86FD-46C151064A4A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/util/CameraParamUtil$1')]
//  JCameraParamUtil_1 = interface(JObject)
//  ['{3EE5FD4D-AAA6-46D1-837B-4D7E1A2A1607}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJCameraParamUtil_1 = class(TJavaGenericImport<JCameraParamUtil_1Class, JCameraParamUtil_1>) end;

  JCameraParamUtil_CameraSizeComparatorClass = interface(JObjectClass)
  ['{13BE984B-1E9B-47F3-B8A7-F93F7F831DC6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/CameraParamUtil$CameraSizeComparator')]
  JCameraParamUtil_CameraSizeComparator = interface(JObject)
  ['{0B52A670-54C1-4129-8F06-0DEFF85F129F}']
    { Property Methods }

    { methods }
    function compare(lhs: JCamera_Size; rhs: JCamera_Size): Integer; cdecl; overload; //(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJCameraParamUtil_CameraSizeComparator = class(TJavaGenericImport<JCameraParamUtil_CameraSizeComparatorClass, JCameraParamUtil_CameraSizeComparator>) end;

  JCameraParamUtilClass = interface(JObjectClass)
  ['{DEFC06B1-1633-4239-B69D-8436A435A550}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JCameraParamUtil; cdecl; //()Lcom/devil/library/camera/util/CameraParamUtil;

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/CameraParamUtil')]
  JCameraParamUtil = interface(JObject)
  ['{E5DF94C7-6EF9-475F-B7B3-0A7032943C0E}']
    { Property Methods }

    { methods }
    function getPreviewSize(list: JList; P2: Integer; rate: Single): JCamera_Size; cdecl; //(Ljava/util/List;IF)Landroid/hardware/Camera$Size;
    function getPictureSize(list: JList; P2: Integer; rate: Single): JCamera_Size; cdecl; //(Ljava/util/List;IF)Landroid/hardware/Camera$Size;
    function isSupportedFocusMode(focusList: JList; P2: JString): Boolean; cdecl; //(Ljava/util/List;Ljava/lang/String;)Z
    function isSupportedPictureFormats(supportedPictureFormats: JList; P2: Integer): Boolean; cdecl; //(Ljava/util/List;I)Z
    function getCameraDisplayOrientation(context: JContext; cameraId: Integer): Integer; cdecl; //(Landroid/content/Context;I)I

    { Property }
  end;

  TJCameraParamUtil = class(TJavaGenericImport<JCameraParamUtilClass, JCameraParamUtil>) end;

  JCheckPermissionClass = interface(JObjectClass)
  ['{C5EAE606-B0C0-495C-9076-398621841ACE}']
    { static Property Methods }
    {class} function _GetSTATE_RECORDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_NO_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSTATE_SUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JCheckPermission; cdecl; //()V
    {class} function getRecordState: Integer; cdecl; //()I
    {class} function isCameraUseable(cameraID: Integer): Boolean; cdecl; //(I)Z

    { static Property }
    {class} property STATE_RECORDING: Integer read _GetSTATE_RECORDING;
    {class} property STATE_NO_PERMISSION: Integer read _GetSTATE_NO_PERMISSION;
    {class} property STATE_SUCCESS: Integer read _GetSTATE_SUCCESS;
  end;

  [JavaSignature('com/devil/library/camera/util/CheckPermission')]
  JCheckPermission = interface(JObject)
  ['{D1288382-4DC1-45B6-98AB-A20F434B987B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCheckPermission = class(TJavaGenericImport<JCheckPermissionClass, JCheckPermission>) end;

  JDeviceUtilClass = interface(JObjectClass)
  ['{F0380FD4-41D0-4AFE-9E85-F6EE1AC09792}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDeviceUtil; cdecl; //()V
    {class} function getDeviceInfo: JString; cdecl; //()Ljava/lang/String;
    {class} function getDeviceModel: JString; cdecl; //()Ljava/lang/String;
    {class} function isHuaWeiRongyao: Boolean; cdecl; //()Z

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/DeviceUtil')]
  JDeviceUtil = interface(JObject)
  ['{3CAA8360-A575-4FEF-8DE4-D008D99BB33C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDeviceUtil = class(TJavaGenericImport<JDeviceUtilClass, JDeviceUtil>) end;

  JFileUtilClass = interface(JObjectClass)
  ['{90934D08-A274-4248-8E11-CFE4A3963AA6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileUtil; cdecl; //()V
    {class} function saveBitmap(dir: JString; b: JBitmap): JString; cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)Ljava/lang/String;
    {class} function deleteFile(url: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    {class} function isExternalStorageWritable: Boolean; cdecl; //()Z

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/FileUtil')]
  JFileUtil = interface(JObject)
  ['{B9A33B10-AF0B-4656-B6B3-483AD2D9E301}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileUtil = class(TJavaGenericImport<JFileUtilClass, JFileUtil>) end;

  JLogUtilClass = interface(JObjectClass)
  ['{5A78088A-26F4-4F5B-907B-4E1610BDFC4A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLogUtil; cdecl; //()V
    {class} procedure i(tag: JString; msg: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure v(tag: JString; msg: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure d(tag: JString; msg: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure e(tag: JString; msg: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure i(msg: JString); cdecl; overload; //(Ljava/lang/String;)V
    {class} procedure v(msg: JString); cdecl; overload; //(Ljava/lang/String;)V
    {class} procedure d(msg: JString); cdecl; overload; //(Ljava/lang/String;)V
    {class} procedure e(msg: JString); cdecl; overload; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/LogUtil')]
  JLogUtil = interface(JObject)
  ['{09F16381-F624-4D76-8280-2079F53D2A20}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogUtil = class(TJavaGenericImport<JLogUtilClass, JLogUtil>) end;

  JScreenUtilsClass = interface(JObjectClass)
  ['{83ACCA5C-F761-46C9-8A5D-E7ED52A74BC5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScreenUtils; cdecl; //()V
    {class} function getScreenHeight(context: JContext): Integer; cdecl; //(Landroid/content/Context;)I
    {class} function getScreenWidth(context: JContext): Integer; cdecl; //(Landroid/content/Context;)I

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/util/ScreenUtils')]
  JScreenUtils = interface(JObject)
  ['{3995993E-81CB-4D28-BBC5-1033EF65EBF1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScreenUtils = class(TJavaGenericImport<JScreenUtilsClass, JScreenUtils>) end;

  JCameraViewClass = interface(JObjectClass)
  ['{68980EEE-4792-4B4E-8692-1461434EB96C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/view/CameraView')]
  JCameraView = interface(IJavaInstance)
  ['{20A2F054-3D54-495E-A26F-0E529EB2457A}']
    { Property Methods }

    { methods }
    procedure resetState(P1: Integer); cdecl; //(I)V
    procedure confirmState(P1: Integer); cdecl; //(I)V
    procedure showPicture(P1: JBitmap; P2: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
    procedure playVideo(P1: JBitmap; P2: JString); cdecl; //(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    procedure stopVideo; cdecl; //()V
    procedure setTip(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure startPreviewCallback; cdecl; //()V
    function handlerFoucs(P1: Single; P2: Single): Boolean; cdecl; //(FF)Z

    { Property }
  end;

  TJCameraView = class(TJavaGenericImport<JCameraViewClass, JCameraView>) end;

//  JDVCameraView_1Class = interface(JObjectClass)
//  ['{98BBE805-9E67-4C8A-BB04-AABF90D066B8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$1')]
//  JDVCameraView_1 = interface(JObject)
//  ['{EEE20DA5-600E-4CB5-99F5-CC62193F9C00}']
//    { Property Methods }
//
//    { methods }
//    procedure takePictures; cdecl; //()V
//    procedure recordStart; cdecl; //()V
//    procedure recordShort(time: Int64); cdecl; //(J)V
//    procedure recordEnd(time: Int64); cdecl; //(J)V
//    procedure recordZoom(zoom: Single); cdecl; //(F)V
//    procedure recordError; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_1 = class(TJavaGenericImport<JDVCameraView_1Class, JDVCameraView_1>) end;

//  JDVCameraView_10Class = interface(JObjectClass)
//  ['{74607828-521D-4BE3-874B-1FAE31DF1EEE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$10')]
//  JDVCameraView_10 = interface(JObject)
//  ['{D7EE7CE6-4276-4C38-98B1-E2F848716342}']
//    { Property Methods }
//
//    { methods }
//    procedure surfaceCreated(holder: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
//    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; width: Integer; height: Integer); cdecl; //(Landroid/view/SurfaceHolder;III)V
//    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
//
//    { Property }
//  end;

//  TJDVCameraView_10 = class(TJavaGenericImport<JDVCameraView_10Class, JDVCameraView_10>) end;

//  JDVCameraView_11Class = interface(JObjectClass)
//  ['{DAC2B42B-F55C-43DB-A899-644E20B4226C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$11')]
//  JDVCameraView_11 = interface(JObject)
//  ['{9EE5155A-E647-47AE-98CB-43BCA30BFD04}']
//    { Property Methods }
//
//    { methods }
//    procedure focusSuccess; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_11 = class(TJavaGenericImport<JDVCameraView_11Class, JDVCameraView_11>) end;

//  JDVCameraView_12Class = interface(JObjectClass)
//  ['{B99F769D-A8FE-401C-8778-1397812A8CEA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$12')]
//  JDVCameraView_12 = interface(JObject)
//  ['{11FB8148-25F2-473E-9225-06CDFBFBE804}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_12 = class(TJavaGenericImport<JDVCameraView_12Class, JDVCameraView_12>) end;

//  JDVCameraView_13Class = interface(JObjectClass)
//  ['{4C524D86-9FFD-4A9C-B73C-81B2FE1981CE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$13')]
//  JDVCameraView_13 = interface(JObject)
//  ['{7DAB1979-7EB4-4B90-9C7C-1F7EE561E203}']
//    { Property Methods }
//
//    { methods }
//    procedure onVideoSizeChanged(mp: JMediaPlayer; width: Integer; height: Integer); cdecl; //(Landroid/media/MediaPlayer;II)V
//
//    { Property }
//  end;

//  TJDVCameraView_13 = class(TJavaGenericImport<JDVCameraView_13Class, JDVCameraView_13>) end;

//  JDVCameraView_14Class = interface(JObjectClass)
//  ['{622390E5-58A0-4E14-83FA-EF43B65DBD8E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$14')]
//  JDVCameraView_14 = interface(JObject)
//  ['{3978EA8D-8CF2-4B9D-8590-754CD8567D37}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared(mp: JMediaPlayer); cdecl; //(Landroid/media/MediaPlayer;)V
//
//    { Property }
//  end;

//  TJDVCameraView_14 = class(TJavaGenericImport<JDVCameraView_14Class, JDVCameraView_14>) end;

//  JDVCameraView_2Class = interface(JObjectClass)
//  ['{B12A77E1-E3B9-4178-AE4B-F1F2144EE60C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$2')]
//  JDVCameraView_2 = interface(JObject)
//  ['{59AC7261-E35C-4B0A-88DF-A449F5EB4F04}']
//    { Property Methods }
//
//    { methods }
//    procedure cancel; cdecl; //()V
//    procedure confirm; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_2 = class(TJavaGenericImport<JDVCameraView_2Class, JDVCameraView_2>) end;

//  JDVCameraView_3Class = interface(JObjectClass)
//  ['{6C5265F9-48A2-4E2A-B382-E86F60C27958}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$3')]
//  JDVCameraView_3 = interface(JObject)
//  ['{E7912BF9-1631-4672-9DB6-BE32F273763A}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_3 = class(TJavaGenericImport<JDVCameraView_3Class, JDVCameraView_3>) end;

//  JDVCameraView_4Class = interface(JObjectClass)
//  ['{F70559ED-47D8-4330-A4CD-CC03D62F49EE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$4')]
//  JDVCameraView_4 = interface(JObject)
//  ['{EE620DC8-7F0D-4D8E-97E7-684297D71CF5}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraView_4 = class(TJavaGenericImport<JDVCameraView_4Class, JDVCameraView_4>) end;

//  JDVCameraView_5Class = interface(JObjectClass)
//  ['{CF933DA0-AF85-4AE9-BBE5-2223F4BE5269}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$5')]
//  JDVCameraView_5 = interface(JObject)
//  ['{854BB889-47F5-4075-AF05-0A3FE683AD27}']
//    { Property Methods }
//
//    { methods }
//    procedure onProgressChanged(seekBar: JSeekBar; progress: Integer; fromUser: Boolean); cdecl; //(Landroid/widget/SeekBar;IZ)V
//    procedure onStartTrackingTouch(seekBar: JSeekBar); cdecl; //(Landroid/widget/SeekBar;)V
//    procedure onStopTrackingTouch(seekBar: JSeekBar); cdecl; //(Landroid/widget/SeekBar;)V
//
//    { Property }
//  end;

//  TJDVCameraView_5 = class(TJavaGenericImport<JDVCameraView_5Class, JDVCameraView_5>) end;

//  JDVCameraView_6Class = interface(JObjectClass)
//  ['{95BFE6F1-AED8-49BD-992A-F8DB84AA6097}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$6')]
//  JDVCameraView_6 = interface(JObject)
//  ['{7EB45AD8-7EC0-4424-AFE5-61176502E68A}']
//    { Property Methods }
//
//    { methods }
//    procedure onPreviewCapture(path: JString; atype: Integer); cdecl; //(Ljava/lang/String;I)V
//
//    { Property }
//  end;

//  TJDVCameraView_6 = class(TJavaGenericImport<JDVCameraView_6Class, JDVCameraView_6>) end;

//  JDVCameraView_7Class = interface(JObjectClass)
//  ['{33263582-9A35-4CDF-9EA2-DF66D53F0E1C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$7')]
//  JDVCameraView_7 = interface(JObject)
//  ['{CFF4CAB7-08FD-407E-B706-A46794DE9AA9}']
//    { Property Methods }
//
//    { methods }
//    procedure onAdjustChange(atype: JImageFilterType; value: Single); cdecl; //(Lcom/devil/library/media/enumtype/ImageFilterType;F)V
//    procedure onCloseFilter; cdecl; //()V
//    procedure onColorFilterChanged(resourceData: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V
//
//    { Property }
//  end;

//  TJDVCameraView_7 = class(TJavaGenericImport<JDVCameraView_7Class, JDVCameraView_7>) end;

//  JDVCameraView_8Class = interface(JObjectClass)
//  ['{17D7185E-4F4E-4E94-B1DB-83087092889C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$8')]
//  JDVCameraView_8 = interface(JObject)
//  ['{2B5B45C4-5994-439D-BC1E-A2931CCFDE49}']
//    { Property Methods }
//
//    { methods }
//    procedure onSurfaceSingleClick(x: Single; y: Single); cdecl; //(FF)V
//    procedure onSurfaceDoubleClick(x: Single; y: Single); cdecl; //(FF)V
//
//    { Property }
//  end;

//  TJDVCameraView_8 = class(TJavaGenericImport<JDVCameraView_8Class, JDVCameraView_8>) end;

//  JDVCameraView_9Class = interface(JObjectClass)
//  ['{533A6DCA-365A-48E9-885D-4735CA7A3FA3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVCameraView$9')]
//  JDVCameraView_9 = interface(JObject)
//  ['{0C0E311B-9FA0-4EF7-8549-67751D10E2B5}']
//    { Property Methods }
//
//    { methods }
//    procedure onSurfaceTextureAvailable(surface: JSurfaceTexture; width: Integer; height: Integer); cdecl; //(Landroid/graphics/SurfaceTexture;II)V
//    procedure onSurfaceTextureSizeChanged(surface: JSurfaceTexture; width: Integer; height: Integer); cdecl; //(Landroid/graphics/SurfaceTexture;II)V
//    function onSurfaceTextureDestroyed(surface: JSurfaceTexture): Boolean; cdecl; //(Landroid/graphics/SurfaceTexture;)Z
//    procedure onSurfaceTextureUpdated(surface: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V
//
//    { Property }
//  end;

//  TJDVCameraView_9 = class(TJavaGenericImport<JDVCameraView_9Class, JDVCameraView_9>) end;

  JDVCameraViewClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{D13B4F0F-AEEC-48DC-9596-8F95454F95D4}']
    { static Property Methods }
    {class} function _GetBUTTON_STATE_ONLY_CAPTURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBUTTON_STATE_ONLY_RECORDER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBUTTON_STATE_BOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JDVCameraView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JDVCameraView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
    {class} property BUTTON_STATE_ONLY_CAPTURE: Integer read _GetBUTTON_STATE_ONLY_CAPTURE;
    {class} property BUTTON_STATE_ONLY_RECORDER: Integer read _GetBUTTON_STATE_ONLY_RECORDER;
    {class} property BUTTON_STATE_BOTH: Integer read _GetBUTTON_STATE_BOTH;
  end;

  [JavaSignature('com/devil/library/camera/view/DVCameraView')]
  JDVCameraView = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{3CCBB9BD-0111-4828-BBE9-0E9260AB0DEF}']
    { Property Methods }

    { methods }
    procedure setMaxDuration(maxDuration: Integer); cdecl; //(I)V
    procedure setFlashLightVisibility(visibility: Integer); cdecl; //(I)V
    procedure setFlashLightEnable(enable: Boolean); cdecl; //(Z)V
    function handlerFoucs(x: Single; y: Single): Boolean; cdecl; //(FF)Z
    procedure setSaveVideoPath(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure setCameraListener(jCameraListener: JJCameraListener); cdecl; //(Lcom/devil/library/camera/listener/JCameraListener;)V
    procedure setErrorListener(errorListener: JErrorListener); cdecl; //(Lcom/devil/library/camera/listener/ErrorListener;)V
    procedure setFeatures(state: Integer); cdecl; //(I)V
    procedure resetState; cdecl; //()V
    procedure confirmState; cdecl; //()V
    procedure showPicture(bitmap: JBitmap; isVertical: Boolean); cdecl; //(Landroid/graphics/Bitmap;Z)V
    procedure playVideo(firstFrame: JBitmap; url: JString); cdecl; //(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    procedure stopVideo; cdecl; //()V
    procedure setTip(tip: JString); cdecl; //(Ljava/lang/String;)V
    procedure setLeftClickListener(clickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V
    procedure setRightClickListener(clickListener: JClickListener); cdecl; //(Lcom/devil/library/camera/listener/ClickListener;)V
    procedure onDetachedFromWindow; cdecl; //()V
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
    procedure onCreate(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    procedure onStart; cdecl; //()V
    procedure onResume; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJDVCameraView = class(TJavaGenericImport<JDVCameraViewClass, JDVCameraView>) end;

//  JDVTextureView_1Class = interface(JObjectClass)
//  ['{E638B5C0-9AB4-44C1-A018-9F2AA58B16E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVTextureView$1')]
//  JDVTextureView_1 = interface(JObject)
//  ['{4E4A8565-307E-4773-ACCF-5077787FC9CB}']
//    { Property Methods }
//
//    { methods }
//    function onDown(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//    procedure onShowPress(e: JMotionEvent); cdecl; //(Landroid/view/MotionEvent;)V
//    function onSingleTapUp(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//    function onScroll(e1: JMotionEvent; e2: JMotionEvent; distanceX: Single; distanceY: Single): Boolean; cdecl; //(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
//    procedure onLongPress(e: JMotionEvent); cdecl; //(Landroid/view/MotionEvent;)V
//    function onFling(e1: JMotionEvent; e2: JMotionEvent; velocityX: Single; velocityY: Single): Boolean; cdecl; //(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
//
//    { Property }
//  end;

//  TJDVTextureView_1 = class(TJavaGenericImport<JDVTextureView_1Class, JDVTextureView_1>) end;

//  JDVTextureView_2Class = interface(JObjectClass)
//  ['{7907E95F-69C5-49C1-8BF6-CA37129D726C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/camera/view/DVTextureView$2')]
//  JDVTextureView_2 = interface(JObject)
//  ['{690CB670-E94E-4648-8721-1B71013D2A0C}']
//    { Property Methods }
//
//    { methods }
//    function onSingleTapConfirmed(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//    function onDoubleTap(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//    function onDoubleTapEvent(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
//
//    { Property }
//  end;

//  TJDVTextureView_2 = class(TJavaGenericImport<JDVTextureView_2Class, JDVTextureView_2>) end;

  JDVTextureView_OnMultiClickListenerClass = interface(JObjectClass)
  ['{F93DEB60-3864-4FB0-9006-6C5407FA1661}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/view/DVTextureView$OnMultiClickListener')]
  JDVTextureView_OnMultiClickListener = interface(IJavaInstance)
  ['{E7D78DC1-29B1-4531-93A5-AB25B3FB8BF3}']
    { Property Methods }

    { methods }
    procedure onSurfaceSingleClick(P1: Single; P2: Single); cdecl; //(FF)V
    procedure onSurfaceDoubleClick(P1: Single; P2: Single); cdecl; //(FF)V

    { Property }
  end;

  TJDVTextureView_OnMultiClickListener = class(TJavaGenericImport<JDVTextureView_OnMultiClickListenerClass, JDVTextureView_OnMultiClickListener>) end;

  JDVTextureView_OnTouchScrollerClass = interface(JObjectClass)
  ['{82D2E943-41E1-40B4-B4FD-233F9F23E891}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/view/DVTextureView$OnTouchScroller')]
  JDVTextureView_OnTouchScroller = interface(IJavaInstance)
  ['{E68FDC4E-623F-427E-9F76-6D880C26214E}']
    { Property Methods }

    { methods }
    procedure swipeBack; cdecl; //()V
    procedure swipeFrontal; cdecl; //()V
    procedure swipeUpper(P1: Boolean; P2: Single); cdecl; //(ZF)V
    procedure swipeDown(P1: Boolean; P2: Single); cdecl; //(ZF)V

    { Property }
  end;

  TJDVTextureView_OnTouchScroller = class(TJavaGenericImport<JDVTextureView_OnTouchScrollerClass, JDVTextureView_OnTouchScroller>) end;

  JDVTextureViewClass = interface(JTextureViewClass) // or JObjectClass // SuperSignature: android/view/TextureView
  ['{A2AFD86E-9CF0-4608-99B1-D7AA8BCB6E43}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDVTextureView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVTextureView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JDVTextureView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/camera/view/DVTextureView')]
  JDVTextureView = interface(JTextureView) // or JObject // SuperSignature: android/view/TextureView
  ['{94C84FAC-5A2D-49C5-8579-E2F4BC834E65}']
    { Property Methods }

    { methods }
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure addOnTouchScroller(scroller: JDVTextureView_OnTouchScroller); cdecl; //(Lcom/devil/library/camera/view/DVTextureView$OnTouchScroller;)V
    procedure addMultiClickListener(listener: JDVTextureView_OnMultiClickListener); cdecl; //(Lcom/devil/library/camera/view/DVTextureView$OnMultiClickListener;)V

    { Property }
  end;

  TJDVTextureView = class(TJavaGenericImport<JDVTextureViewClass, JDVTextureView>) end;

  JFolderLVAdapter_ViewHolderClass = interface(JObjectClass)
  ['{70F2AADE-3A1C-4902-A0DD-60362ACF821F}']
    { static Property Methods }

    { static Methods }
    {class} function init(this$0: JFolderLVAdapter): JFolderLVAdapter_ViewHolder; cdecl; //(Lcom/devil/library/media/adapter/FolderLVAdapter;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/adapter/FolderLVAdapter$ViewHolder')]
  JFolderLVAdapter_ViewHolder = interface(JObject)
  ['{E6E00886-A2F4-42D7-8499-8CA2A0959393}']
    { Property Methods }
    function _Getiv_folder: JImageView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/ImageView;
    procedure _Setiv_folder(aiv_folder: JImageView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/ImageView;)V
    function _Getiv_check: JImageView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/ImageView;
    procedure _Setiv_check(aiv_check: JImageView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/ImageView;)V
    function _Gettv_folderName: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/TextView;
    procedure _Settv_folderName(atv_folderName: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/TextView;)V
    function _Gettv_count: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/widget/TextView;
    procedure _Settv_count(atv_count: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/widget/TextView;)V

    { methods }

    { Property }
    property iv_folder: JImageView read _Getiv_folder write _Setiv_folder;
    property iv_check: JImageView read _Getiv_check write _Setiv_check;
    property tv_folderName: JTextView read _Gettv_folderName write _Settv_folderName;
    property tv_count: JTextView read _Gettv_count write _Settv_count;
  end;

  TJFolderLVAdapter_ViewHolder = class(TJavaGenericImport<JFolderLVAdapter_ViewHolderClass, JFolderLVAdapter_ViewHolder>) end;

  JFolderLVAdapterClass = interface(JBaseAdapterClass) // or JObjectClass // SuperSignature: android/widget/BaseAdapter
  ['{D248D911-C5E7-4AFC-8985-D53D6E037AAC}']
    { static Property Methods }

    { static Methods }
    {class} function init(mContext: JContext; li_content: JList): JFolderLVAdapter; cdecl; //(Landroid/content/Context;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/adapter/FolderLVAdapter')]
  JFolderLVAdapter = interface(JBaseAdapter) // or JObject // SuperSignature: android/widget/BaseAdapter
  ['{5F301107-2682-4B32-AFB1-7C1CA5FE65D1}']
    { Property Methods }

    { methods }
    function getCount: Integer; cdecl; //()I
    function getItem(i: Integer): JObject; cdecl; //(I)Ljava/lang/Object;
    function getItemId(i: Integer): Int64; cdecl; //(I)J
    function getView(i: Integer; view: JView; viewGroup: JViewGroup): JView; cdecl; //(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    procedure setSelectIndex(selectIndex: Integer); cdecl; //(I)V

    { Property }
  end;

  TJFolderLVAdapter = class(TJavaGenericImport<JFolderLVAdapterClass, JFolderLVAdapter>) end;

//  JMediaRVAdapter_1Class = interface(JObjectClass)
//  ['{5543CEFA-B840-4B44-88FC-DEBE8A87D616}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/adapter/MediaRVAdapter$1')]
//  JMediaRVAdapter_1 = interface(JObject)
//  ['{AA40078C-873E-4276-8F8F-5F6C894394C5}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJMediaRVAdapter_1 = class(TJavaGenericImport<JMediaRVAdapter_1Class, JMediaRVAdapter_1>) end;

//  JMediaRVAdapter_2Class = interface(JObjectClass)
//  ['{B342F35E-3266-40E3-9B51-AB9354DF277C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/adapter/MediaRVAdapter$2')]
//  JMediaRVAdapter_2 = interface(JObject)
//  ['{E5B6F9C6-A461-48E8-8403-B6A596B5678E}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJMediaRVAdapter_2 = class(TJavaGenericImport<JMediaRVAdapter_2Class, JMediaRVAdapter_2>) end;

  JMediaRVAdapter_OnItemCheckListenerClass = interface(JObjectClass)
  ['{2183964C-9B3B-49A2-A638-E7B48076277F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/adapter/MediaRVAdapter$OnItemCheckListener')]
  JMediaRVAdapter_OnItemCheckListener = interface(IJavaInstance)
  ['{AEA4C95A-DDF2-4083-9291-D967B49EA2AD}']
    { Property Methods }

    { methods }
    procedure onItemCheck(P1: Integer; P2: Boolean); cdecl; //(IZ)V
    function itemCheckEnabled(P1: Integer; P2: Boolean): Boolean; cdecl; //(IZ)Z

    { Property }
  end;

  TJMediaRVAdapter_OnItemCheckListener = class(TJavaGenericImport<JMediaRVAdapter_OnItemCheckListenerClass, JMediaRVAdapter_OnItemCheckListener>) end;

  JMediaRVAdapterClass = interface(JBaseRVAdapterClass) // or JObjectClass // SuperSignature: com/devil/library/media/base/BaseRVAdapter
  ['{11CDB795-83AE-4378-BDBC-D2484AFC6556}']
    { static Property Methods }

    { static Methods }
    {class} function init(mContext: JContext; li_content: JList): JMediaRVAdapter; cdecl; //(Landroid/content/Context;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/adapter/MediaRVAdapter')]
  JMediaRVAdapter = interface(JBaseRVAdapter) // or JObject // SuperSignature: com/devil/library/media/base/BaseRVAdapter
  ['{C4436B5B-78B5-4800-82A2-55B05FE3655C}']
    { Property Methods }

    { methods }
    procedure setOnItemCheckListener(listener: JMediaRVAdapter_OnItemCheckListener); cdecl; //(Lcom/devil/library/media/adapter/MediaRVAdapter$OnItemCheckListener;)V
    function getItemCount: Integer; cdecl; //()I
    function getItemViewType(position: Integer): Integer; cdecl; //(I)I
    function onCreateViewHolder(parent: JViewGroup; viewType: Integer): JEasyRVHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Lcom/devil/library/media/base/EasyRVHolder;
    function onCreateViewHolder(this: JViewGroup; P2: Integer): JRecyclerView_ViewHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    { Property }
  end;

  TJMediaRVAdapter = class(TJavaGenericImport<JMediaRVAdapterClass, JMediaRVAdapter>) end;

  JWatchMediaVPAdapterClass = interface(JBaseVPFragmentAdapterClass) // or JObjectClass // SuperSignature: com/devil/library/media/base/BaseVPFragmentAdapter
  ['{2E1A6842-5C55-4B81-8922-898431318444}']
    { static Property Methods }

    { static Methods }
    {class} function init(mContext: JContext; fragmentManager: JFragmentManager; li_mediaInfo: JList): JWatchMediaVPAdapter; cdecl; //(Landroid/content/Context;Landroidx/fragment/app/FragmentManager;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/adapter/WatchMediaVPAdapter')]
  JWatchMediaVPAdapter = interface(JBaseVPFragmentAdapter) // or JObject // SuperSignature: com/devil/library/media/base/BaseVPFragmentAdapter
  ['{34A7A455-FA48-480A-8839-2AA23EE0CC18}']
    { Property Methods }

    { methods }
    function getCount: Integer; cdecl; //()I
    function createFragment(position: Integer): JFragment; cdecl; //(I)Landroidx/fragment/app/Fragment;

    { Property }
  end;

  TJWatchMediaVPAdapter = class(TJavaGenericImport<JWatchMediaVPAdapterClass, JWatchMediaVPAdapter>) end;

//  JBaseRVAdapter_1Class = interface(JObjectClass)
//  ['{A6AF4D35-6384-4DAF-ADF5-E8658796AFC2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/base/BaseRVAdapter$1')]
//  JBaseRVAdapter_1 = interface(JObject)
//  ['{BE461AD6-D93B-4F21-8C8B-089A38469EC0}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJBaseRVAdapter_1 = class(TJavaGenericImport<JBaseRVAdapter_1Class, JBaseRVAdapter_1>) end;

  JBaseRVAdapter_OnItemClickListenerClass = interface(JObjectClass)
  ['{BB6223BF-706B-408E-B4D6-4A90DDE8769D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/base/BaseRVAdapter$OnItemClickListener')]
  JBaseRVAdapter_OnItemClickListener = interface(IJavaInstance)
  ['{874F9EED-F03D-4FAC-BF0C-63940C156740}']
    { Property Methods }

    { methods }
    procedure onItemClick(P1: JEasyRVHolder; P2: Integer); cdecl; //(Lcom/devil/library/media/base/EasyRVHolder;I)V

    { Property }
  end;

  TJBaseRVAdapter_OnItemClickListener = class(TJavaGenericImport<JBaseRVAdapter_OnItemClickListenerClass, JBaseRVAdapter_OnItemClickListener>) end;

  JBaseRVAdapterClass = interface(JRecyclerView_AdapterClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{027FD239-41BE-4E9B-8584-611027DFB0C6}']
    { static Property Methods }

    { static Methods }
    {class} function init(mContext: JContext; li_content: JList): JBaseRVAdapter; cdecl; //(Landroid/content/Context;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/base/BaseRVAdapter')]
  JBaseRVAdapter = interface(JRecyclerView_Adapter) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{DD100778-34BC-4836-A519-95452DA892C3}']
    { Property Methods }
    function _GetmContext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/content/Context;
    procedure _SetmContext(amContext: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/content/Context;)V
    function _Getli_content: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/List;
    procedure _Setli_content(ali_content: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/util/List;)V

    { methods }
    procedure setOnItemClickListener(itemClickListener: JBaseRVAdapter_OnItemClickListener); cdecl; //(Lcom/devil/library/media/base/BaseRVAdapter$OnItemClickListener;)V
    function getItemCount: Integer; cdecl; //()I
    function getItemViewType(position: Integer): Integer; cdecl; //(I)I
    function onCreateViewHolder(parent: JViewGroup; viewType: Integer): JEasyRVHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Lcom/devil/library/media/base/EasyRVHolder;
    procedure onBindViewHolder(holder: JEasyRVHolder; position: Integer); cdecl; overload; //(Lcom/devil/library/media/base/EasyRVHolder;I)V
    procedure onBindViewHolder(this: JRecyclerView_ViewHolder; P2: Integer); cdecl; overload; //(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    function onCreateViewHolder(this: JViewGroup; P2: Integer): JRecyclerView_ViewHolder; cdecl; overload; //(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    { Property }
    property mContext: JContext read _GetmContext write _SetmContext;
    property li_content: JList read _Getli_content write _Setli_content;
  end;

  TJBaseRVAdapter = class(TJavaGenericImport<JBaseRVAdapterClass, JBaseRVAdapter>) end;

  JBaseVPFragmentAdapterClass = interface(JFragmentPagerAdapterClass) // or JObjectClass // SuperSignature: androidx/fragment/app/FragmentPagerAdapter
  ['{CDD01398-33A0-465D-A2AF-0FD41E606FC8}']
    { static Property Methods }

    { static Methods }
    {class} function init(mContext: JContext; fragmentManager: JFragmentManager): JBaseVPFragmentAdapter; cdecl; //(Landroid/content/Context;Landroidx/fragment/app/FragmentManager;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/base/BaseVPFragmentAdapter')]
  JBaseVPFragmentAdapter = interface(JFragmentPagerAdapter) // or JObject // SuperSignature: androidx/fragment/app/FragmentPagerAdapter
  ['{07EA17A1-E484-4B59-A677-446324D15D40}']
    { Property Methods }

    { methods }
    function getItem(i: Integer): JFragment; cdecl; //(I)Landroidx/fragment/app/Fragment;
    function getItemPosition(aobject: JObject): Integer; cdecl; //(Ljava/lang/Object;)I
    function getFragmentWithPosition(position: Integer): JFragment; cdecl; //(I)Landroidx/fragment/app/Fragment;
    function createFragment(P1: Integer): JFragment; cdecl; //(I)Landroidx/fragment/app/Fragment;

    { Property }
  end;

  TJBaseVPFragmentAdapter = class(TJavaGenericImport<JBaseVPFragmentAdapterClass, JBaseVPFragmentAdapter>) end;

  JEasyRVHolderClass = interface(JRecyclerView_ViewHolderClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{0AED2735-BF3F-45DB-91A7-CE6CF84F0F33}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; itemView: JView): JEasyRVHolder; cdecl; //(Landroid/content/Context;Landroid/view/View;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/base/EasyRVHolder')]
  JEasyRVHolder = interface(JRecyclerView_ViewHolder) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{E63B4C2D-ED9B-4EE6-9D49-85C85719B702}']
    { Property Methods }

    { methods }
    function getView(viewId: Integer): JView; cdecl; //(I)Landroid/view/View;
    function getItemView: JView; cdecl; //()Landroid/view/View;
    function setOnItemViewClickListener(listener: JView_OnClickListener): JEasyRVHolder; cdecl; //(Landroid/view/View$OnClickListener;)Lcom/devil/library/media/base/EasyRVHolder;
    function setOnItemViewLongClickListener(listener: JView_OnLongClickListener): JEasyRVHolder; cdecl; //(Landroid/view/View$OnLongClickListener;)Lcom/devil/library/media/base/EasyRVHolder;
    function setText(viewId: Integer; value: JString): JEasyRVHolder; cdecl; //(ILjava/lang/String;)Lcom/devil/library/media/base/EasyRVHolder;
    function setTextColor(viewId: Integer; color: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setTextColorRes(viewId: Integer; colorRes: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setImageResource(viewId: Integer; imgResId: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setBackgroundColor(viewId: Integer; color: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setBackgroundColorRes(viewId: Integer; colorRes: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setImageDrawable(viewId: Integer; drawable: JDrawable): JEasyRVHolder; cdecl; //(ILandroid/graphics/drawable/Drawable;)Lcom/devil/library/media/base/EasyRVHolder;
    function setImageDrawableRes(viewId: Integer; drawableRes: Integer): JEasyRVHolder; cdecl; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setImageUrl(viewId: Integer; imgUrl: JString): JEasyRVHolder; cdecl; //(ILjava/lang/String;)Lcom/devil/library/media/base/EasyRVHolder;
    function setImageBitmap(viewId: Integer; imgBitmap: JBitmap): JEasyRVHolder; cdecl; //(ILandroid/graphics/Bitmap;)Lcom/devil/library/media/base/EasyRVHolder;
    function setVisible(viewId: Integer; visible: Boolean): JEasyRVHolder; cdecl; overload; //(IZ)Lcom/devil/library/media/base/EasyRVHolder;
    function setVisible(viewId: Integer; visible: Integer): JEasyRVHolder; cdecl; overload; //(II)Lcom/devil/library/media/base/EasyRVHolder;
    function setTag(viewId: Integer; tag: JObject): JEasyRVHolder; cdecl; overload; //(ILjava/lang/Object;)Lcom/devil/library/media/base/EasyRVHolder;
    function setTag(viewId: Integer; key: Integer; tag: JObject): JEasyRVHolder; cdecl; overload; //(IILjava/lang/Object;)Lcom/devil/library/media/base/EasyRVHolder;
    function setChecked(viewId: Integer; checked: Boolean): JEasyRVHolder; cdecl; //(IZ)Lcom/devil/library/media/base/EasyRVHolder;
    function setAlpha(viewId: Integer; value: Single): JEasyRVHolder; cdecl; //(IF)Lcom/devil/library/media/base/EasyRVHolder;
    function setTypeface(viewId: Integer; typeface: JTypeface): JEasyRVHolder; cdecl; overload; //(ILandroid/graphics/Typeface;)Lcom/devil/library/media/base/EasyRVHolder;
    function setTypeface(typeface: JTypeface; viewIds: TJavaArray<Integer>): JEasyRVHolder; cdecl; overload; //(Landroid/graphics/Typeface;[I)Lcom/devil/library/media/base/EasyRVHolder;
    function setOnClickListener(viewId: Integer; listener: JView_OnClickListener): JEasyRVHolder; cdecl; //(ILandroid/view/View$OnClickListener;)Lcom/devil/library/media/base/EasyRVHolder;
    function setOnCheckedChangeListener(viewId: Integer; listener: JCompoundButton_OnCheckedChangeListener): JEasyRVHolder; cdecl; //(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Lcom/devil/library/media/base/EasyRVHolder;

    { Property }
  end;

  TJEasyRVHolder = class(TJavaGenericImport<JEasyRVHolderClass, JEasyRVHolder>) end;

  JFolderInfoClass = interface(JObjectClass)
  ['{D9E679F7-C2F6-451A-BAB4-0A7B4C34EE15}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFolderInfo; cdecl; //()V
    {class} function createInstance(folderName: JString; folderPath: JString; fileCount: Integer): JFolderInfo; cdecl; //(Ljava/lang/String;Ljava/lang/String;I)Lcom/devil/library/media/bean/FolderInfo;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/bean/FolderInfo')]
  JFolderInfo = interface(JObject)
  ['{7DF2E871-99D3-4960-8FFE-1CA8EA0472FD}']
    { Property Methods }
    function _GetfolderName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfolderName(afolderName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetfolderPath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfolderPath(afolderPath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetfileCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetfileCount(afileCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }

    { Property }
    property folderName: JString read _GetfolderName write _SetfolderName;
    property folderPath: JString read _GetfolderPath write _SetfolderPath;
    property fileCount: Integer read _GetfileCount write _SetfileCount;
  end;

  TJFolderInfo = class(TJavaGenericImport<JFolderInfoClass, JFolderInfo>) end;

//  JMediaInfo_150Class = interface(JObjectClass)
//  ['{2A20D5D9-CACD-4297-8CC1-F0AAB6795E30}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JMediaInfo_150; cdecl; //()V
//    {class} function createVideoInfo(filePath: JString; thumbPath: JString; duration: Integer; fileSize: Int64; fileName: JString): JMediaInfo; cdecl; //(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/devil/library/media/bean/MediaInfo;
//    {class} function createPhotoInfo(filePath: JString; fileSize: Int64; fileName: JString): JMediaInfo; cdecl; //(Ljava/lang/String;JLjava/lang/String;)Lcom/devil/library/media/bean/MediaInfo;
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/bean/MediaInfo')]
//  JMediaInfo_150 = interface(JObject)
//  ['{73C3D7A3-9500-4A33-9042-FF0528BE28B0}']
//    { Property Methods }
//    function _GetfilePath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _SetfilePath(afilePath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _GetthumbPath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _SetthumbPath(athumbPath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//    function _Getduration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setduration(aduration: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _GetfileSize: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
//    procedure _SetfileSize(afileSize: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V
//    function _GetfileName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    procedure _SetfileName(afileName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
//
//    { methods }
//    function equals(obj: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//
//    { Property }
//    property filePath: JString read _GetfilePath write _SetfilePath;
//    property thumbPath: JString read _GetthumbPath write _SetthumbPath;
//    property duration: Integer read _Getduration write _Setduration;
//    property fileSize: Int64 read _GetfileSize write _SetfileSize;
//    property fileName: JString read _GetfileName write _SetfileName;
//  end;

//  TJMediaInfo_150 = class(TJavaGenericImport<JMediaInfo_150Class, JMediaInfo_150>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{F98D1B43-4E99-4594-867D-83AFE975067D}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/devil/library/media/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{13A55FD0-A96F-4403-BBFD-84D6AA28D059}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JImageLoaderClass = interface(JObjectClass)
  ['{2244A6C2-778E-47FF-B410-7AECEBB2FBCE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/common/ImageLoader')]
  JImageLoader = interface(IJavaInstance)
  ['{55CC20A7-A4A0-46D9-9EBC-C7F401C5093B}']
    { Property Methods }

    { methods }
    procedure displayImage(P1: JContext; P2: JString; P3: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V

    { Property }
  end;

  TJImageLoader = class(TJavaGenericImport<JImageLoaderClass, JImageLoader>) end;

  JMediaTempListenerClass = interface(JObjectClass)
  ['{AB9596B1-75F2-47ED-AF40-E40B147CD509}']
    { static Property Methods }
    {class} function _Getlistener: JOnSelectMediaListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/listener/OnSelectMediaListener;
    {class} function _GetisCanRelease: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z

    { static Methods }
    {class} function init: JMediaTempListener; cdecl; //()V
    {class} procedure setOnSelectMediaListener(mListener: JOnSelectMediaListener); cdecl; //(Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure release; cdecl; //()V

    { static Property }
    {class} property listener: JOnSelectMediaListener read _Getlistener;
    {class} property isCanRelease: Boolean read _GetisCanRelease;
  end;

  [JavaSignature('com/devil/library/media/common/MediaTempListener')]
  JMediaTempListener = interface(JObject)
  ['{1CBA2629-3F75-47BA-B9EF-5B33FE20BC90}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaTempListener = class(TJavaGenericImport<JMediaTempListenerClass, JMediaTempListener>) end;

  JDVCameraConfig_BuilderClass = interface(JObjectClass)
  ['{6EDE96D2-4FF7-439D-ACA0-597E0DCE5C27}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVCameraConfig_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVCameraConfig$Builder')]
  JDVCameraConfig_Builder = interface(JObject)
  ['{F0DC1FF9-AA4E-44E0-80E3-0F609716EEB0}']
    { Property Methods }

    { methods }
    function needCrop(needCrop: Boolean): JDVCameraConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function fileCachePath(fileCachePath: JString): JDVCameraConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function cropSize(aspectX: Integer; aspectY: Integer; outputX: Integer; outputY: Integer): JDVCameraConfig_Builder; cdecl; //(IIII)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function aspectX(aspectX: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function aspectY(aspectY: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function outputX(outputX: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function outputY(outputY: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function mediaType(mediaType: JDVMediaType): JDVCameraConfig_Builder; cdecl; //(Lcom/devil/library/media/enumtype/DVMediaType;)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function cameraType(cameraType: JDVCameraType): JDVCameraConfig_Builder; cdecl; //(Lcom/devil/library/media/enumtype/DVCameraType;)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function maxDuration(maxDuration: Integer): JDVCameraConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function flashLightEnable(enable: Boolean): JDVCameraConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVCameraConfig$Builder;
    function build: JDVCameraConfig; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig;

    { Property }
  end;

  TJDVCameraConfig_Builder = class(TJavaGenericImport<JDVCameraConfig_BuilderClass, JDVCameraConfig_Builder>) end;

  JDVCameraConfigClass = interface(JObjectClass)
  ['{53A3EC99-97D7-43FC-90A2-7F67B9D7A1EE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVCameraConfig; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVCameraConfig')]
  JDVCameraConfig = interface(JObject)
  ['{15346629-8DAF-4A53-803E-57E25F16B5E6}']
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
    function _GetcameraType: JDVCameraType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVCameraType;
    procedure _SetcameraType(acameraType: JDVCameraType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/devil/library/media/enumtype/DVCameraType;)V
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
    property cameraType: JDVCameraType read _GetcameraType write _SetcameraType;
    property maxDuration: Integer read _GetmaxDuration write _SetmaxDuration;
    property flashLightEnable: Boolean read _GetflashLightEnable write _SetflashLightEnable;
  end;

  TJDVCameraConfig = class(TJavaGenericImport<JDVCameraConfigClass, JDVCameraConfig>) end;

  JDVListConfig_BuilderClass = interface(JObjectClass)
  ['{3C81EA08-986C-4BB1-9388-415945508BE6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVListConfig_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVListConfig$Builder')]
  JDVListConfig_Builder = interface(JObject)
  ['{928D1ACF-F889-4700-9934-15D8A8F9FD91}']
    { Property Methods }

    { methods }
    function needCrop(needCrop: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function multiSelect(multiSelect: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function maxNum(maxNum: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function minNum(minNum: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function needCamera(needCamera: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function cameraIconResource(cameraIconResource: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function checkIconResource(checkIconResource: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function unCheckIconResource(unCheckIconResource: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarColor(statusBarColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function backResourceId(backResourceId: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function title(title: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function titleTextColor(titleTextColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function titleBgColor(titleBgColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnText(sureBtnText: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnTextColor(sureBtnTextColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnBgColor(sureBtnBgColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnBgResource(sureBtnBgResource: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnLayoutBgColor(sureBtnLayoutBgColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function sureBtnLayoutBgResource(sureBtnLayoutBgResource: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function fileCachePath(fileCachePath: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function cropSize(aspectX: Integer; aspectY: Integer; outputX: Integer; outputY: Integer): JDVListConfig_Builder; cdecl; //(IIII)Lcom/devil/library/media/config/DVListConfig$Builder;
    function aspectX(aspectX: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function aspectY(aspectY: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function outputX(outputX: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function outputY(outputY: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function listSpanCount(listSpanCount: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarLightMode(statusBarLightMode: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function statusBarDrakMode(statusBarDrakMode: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function mediaType(mediaType: JDVMediaType): JDVListConfig_Builder; cdecl; //(Lcom/devil/library/media/enumtype/DVMediaType;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rightTitleTextColor(rightTitleTextColor: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rigntTitleText(rigntTitleText: JString): JDVListConfig_Builder; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/config/DVListConfig$Builder;
    function rightTitleVisibility(rightTitleVisibility: Integer): JDVListConfig_Builder; cdecl; //(I)Lcom/devil/library/media/config/DVListConfig$Builder;
    function hasPreview(hasPreview: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function quickLoadVideoThumb(quickLoadVideoThumb: Boolean): JDVListConfig_Builder; cdecl; //(Z)Lcom/devil/library/media/config/DVListConfig$Builder;
    function build: JDVListConfig; cdecl; //()Lcom/devil/library/media/config/DVListConfig;

    { Property }
  end;

  TJDVListConfig_Builder = class(TJavaGenericImport<JDVListConfig_BuilderClass, JDVListConfig_Builder>) end;

  JDVListConfigClass = interface(JObjectClass)
  ['{0F4DB82A-1F6B-4D94-9111-E33D103CE013}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVListConfig; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/config/DVListConfig')]
  JDVListConfig = interface(JObject)
  ['{074B3214-4701-45D4-847D-89DC97B068F4}']
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

  JDVCameraTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9873D23B-B897-4F2D-9499-852DE63F2621}']
    { static Property Methods }
    {class} function _GetSYSTEM: JDVCameraType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVCameraType;
    {class} function _GetNORMAL: JDVCameraType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVCameraType;
    {class} function _GetBEAUTY: JDVCameraType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVCameraType;

    { static Methods }
    {class} function values: TJavaObjectArray<JDVCameraType>; cdecl; //()[Lcom/devil/library/media/enumtype/DVCameraType;
    {class} function valueOf(name: JString): JDVCameraType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/enumtype/DVCameraType;

    { static Property }
    {class} property SYSTEM: JDVCameraType read _GetSYSTEM;
    {class} property NORMAL: JDVCameraType read _GetNORMAL;
    {class} property BEAUTY: JDVCameraType read _GetBEAUTY;
  end;

  [JavaSignature('com/devil/library/media/enumtype/DVCameraType')]
  JDVCameraType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{59FC9B9A-6677-4C92-85AE-C24DCD3B2A92}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVCameraType = class(TJavaGenericImport<JDVCameraTypeClass, JDVCameraType>) end;

  JDVMediaTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{B8290649-69F4-46EB-BF3D-C6BE0AC3BDC6}']
    { static Property Methods }
    {class} function _GetPHOTO: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function _GetVIDEO: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function _GetALL: JDVMediaType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/DVMediaType;

    { static Methods }
    {class} function values: TJavaObjectArray<JDVMediaType>; cdecl; //()[Lcom/devil/library/media/enumtype/DVMediaType;
    {class} function valueOf(name: JString): JDVMediaType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/enumtype/DVMediaType;

    { static Property }
    {class} property PHOTO: JDVMediaType read _GetPHOTO;
    {class} property VIDEO: JDVMediaType read _GetVIDEO;
    {class} property ALL: JDVMediaType read _GetALL;
  end;

  [JavaSignature('com/devil/library/media/enumtype/DVMediaType')]
  JDVMediaType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{01850412-FF23-4391-BD28-22EDD8D3B64E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVMediaType = class(TJavaGenericImport<JDVMediaTypeClass, JDVMediaType>) end;

  JImageFilterTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{75700BD6-EE77-4039-BAFC-F13D3320DEC8}']
    { static Property Methods }
    {class} function _GetNONE: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetCONTRAST: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetBRIGHTNESS: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetEXPOSURE: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetHUE: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetSATURATION: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function _GetSHARPEN: JImageFilterType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/media/enumtype/ImageFilterType;

    { static Methods }
    {class} function values: TJavaObjectArray<JImageFilterType>; cdecl; //()[Lcom/devil/library/media/enumtype/ImageFilterType;
    {class} function valueOf(name: JString): JImageFilterType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/enumtype/ImageFilterType;

    { static Property }
    {class} property NONE: JImageFilterType read _GetNONE;
    {class} property CONTRAST: JImageFilterType read _GetCONTRAST;
    {class} property BRIGHTNESS: JImageFilterType read _GetBRIGHTNESS;
    {class} property EXPOSURE: JImageFilterType read _GetEXPOSURE;
    {class} property HUE: JImageFilterType read _GetHUE;
    {class} property SATURATION: JImageFilterType read _GetSATURATION;
    {class} property SHARPEN: JImageFilterType read _GetSHARPEN;
  end;

  [JavaSignature('com/devil/library/media/enumtype/ImageFilterType')]
  JImageFilterType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{5676779F-B9F8-4C89-B15F-D353F99A7EBB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJImageFilterType = class(TJavaGenericImport<JImageFilterTypeClass, JImageFilterType>) end;

  JOnAdjustChangeListenerClass = interface(JObjectClass)
  ['{D0342661-C26F-40C6-A950-944F57871326}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnAdjustChangeListener')]
  JOnAdjustChangeListener = interface(IJavaInstance)
  ['{76AE44B2-22A0-43DA-A663-4BDD4DB4420F}']
    { Property Methods }

    { methods }
    procedure onAdjustChange(P1: JImageFilterType; P2: Single); cdecl; //(Lcom/devil/library/media/enumtype/ImageFilterType;F)V

    { Property }
  end;

  TJOnAdjustChangeListener = class(TJavaGenericImport<JOnAdjustChangeListenerClass, JOnAdjustChangeListener>) end;

  JOnFilterActionListenerClass = interface(JObjectClass)
  ['{76F0E8C6-AB3F-49C5-9673-5F5D7500D329}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnFilterActionListener')]
  JOnFilterActionListener = interface(IJavaInstance)
  ['{0569C9BD-9854-46B2-9E7E-59F52FEDCFB0}']
    { Property Methods }

    { methods }
    procedure onCloseFilter; cdecl; //()V
    procedure onColorFilterChanged(P1: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V

    { Property }
  end;

  TJOnFilterActionListener = class(TJavaGenericImport<JOnFilterActionListenerClass, JOnFilterActionListener>) end;

  JOnImageSaveListenerClass = interface(JObjectClass)
  ['{5CA66A2E-4523-4630-AFA4-E0916CE21C5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnImageSaveListener')]
  JOnImageSaveListener = interface(IJavaInstance)
  ['{47E9CD6B-0EB9-42CB-A3B5-D7C23120BFE8}']
    { Property Methods }

    { methods }
    procedure onSaveSuccess(P1: JString); cdecl; //(Ljava/lang/String;)V

    { Property }
  end;

  TJOnImageSaveListener = class(TJavaGenericImport<JOnImageSaveListenerClass, JOnImageSaveListener>) end;

  JOnItemClickListenerClass = interface(JObjectClass)
  ['{EC8DD54B-55D0-4E46-8640-D936E0CC9278}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnItemClickListener')]
  JOnItemClickListener = interface(IJavaInstance)
  ['{4703CBE7-9210-4AE5-8E95-342F1CBE6656}']
    { Property Methods }

    { methods }
    procedure onItemClick(P1: JArrayList; P2: Integer); cdecl; //(Ljava/util/ArrayList;I)V
    procedure onItemCheck(P1: JMediaInfo; P2: Boolean); cdecl; //(Lcom/devil/library/media/bean/MediaInfo;Z)V
    function itemCheckEnabled(P1: Integer; P2: Boolean): Boolean; cdecl; //(IZ)Z
    procedure onFolderCheck(P1: JFolderInfo); cdecl; //(Lcom/devil/library/media/bean/FolderInfo;)V

    { Property }
  end;

  TJOnItemClickListener = class(TJavaGenericImport<JOnItemClickListenerClass, JOnItemClickListener>) end;

  JOnSelectMediaListenerClass = interface(JObjectClass)
  ['{E0520496-6E00-4EAB-B8C4-2B94A824A7B7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/listener/OnSelectMediaListener')]
  JOnSelectMediaListener = interface(IJavaInstance)
  ['{B8618E99-556E-4036-ADDE-CB7E0A9A6215}']
    { Property Methods }

    { methods }
    procedure onSelectMedia(P1: JList); cdecl; //(Ljava/util/List;)V

    { Property }
  end;

  TJOnSelectMediaListener = class(TJavaGenericImport<JOnSelectMediaListenerClass, JOnSelectMediaListener>) end;

//  JMediaSelectorManager_1Class = interface(JObjectClass)
//  ['{F225A3B9-BCBE-48C7-86B8-3FEB95D8B399}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/MediaSelectorManager$1')]
//  JMediaSelectorManager_1 = interface(JObject)
//  ['{6746B0E6-FC66-4704-98ED-4A18038B2C05}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJMediaSelectorManager_1 = class(TJavaGenericImport<JMediaSelectorManager_1Class, JMediaSelectorManager_1>) end;

  JMediaSelectorManagerClass = interface(JObjectClass)
  ['{B5AE4F77-1FBE-4423-A47B-2746759A223B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMediaSelectorManager; cdecl; //()V
    {class} function getInstance: JMediaSelectorManager; cdecl; //()Lcom/devil/library/media/MediaSelectorManager;
    {class} function getDefaultListConfigBuilder: JDVListConfig_Builder; cdecl; //()Lcom/devil/library/media/config/DVListConfig$Builder;
    {class} function getDefaultCameraConfigBuilder: JDVCameraConfig_Builder; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig$Builder;
    {class} procedure openSelectMediaWithConfig(mActivity: JActivity; config: JDVListConfig; listener: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/config/DVListConfig;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openSelectMediaWithMediaType(mActivity: JActivity; mediaType: JDVMediaType; listener: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/enumtype/DVMediaType;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openCameraWithConfig(mActivity: JActivity; config: JDVCameraConfig; listener: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/config/DVCameraConfig;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openCameraWithMediaType(mActivity: JActivity; mediaType: JDVMediaType; listener: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/enumtype/DVMediaType;Lcom/devil/library/media/listener/OnSelectMediaListener;)V
    {class} procedure openEditPhoto(mActivity: JActivity; photoPath: JString; config: JDVListConfig; listener: JOnSelectMediaListener); cdecl; //(Landroid/app/Activity;Ljava/lang/String;Lcom/devil/library/media/config/DVListConfig;Lcom/devil/library/media/listener/OnSelectMediaListener;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/MediaSelectorManager')]
  JMediaSelectorManager = interface(JObject)
  ['{E27BFC9D-DD8B-453B-80BF-277EF9E1D3E4}']
    { Property Methods }

    { methods }
    procedure initImageLoader(loader: JImageLoader); cdecl; //(Lcom/devil/library/media/common/ImageLoader;)V
    function getImageLoader: JImageLoader; cdecl; //()Lcom/devil/library/media/common/ImageLoader;
    procedure displayImage(context: JContext; path: JString; imageView: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Landroid/widget/ImageView;)V
    function getCurrentListConfig: JDVListConfig; cdecl; //()Lcom/devil/library/media/config/DVListConfig;
    function getCurrentCameraConfig: JDVCameraConfig; cdecl; //()Lcom/devil/library/media/config/DVCameraConfig;
    procedure clean; cdecl; //()V

    { Property }
  end;

  TJMediaSelectorManager = class(TJavaGenericImport<JMediaSelectorManagerClass, JMediaSelectorManager>) end;

  JDVBaseActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{37863744-2FAC-4A6D-9AE3-3B474C0E7788}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVBaseActivity; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVBaseActivity')]
  JDVBaseActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{345B4687-9738-40D5-9EF3-5BF1023E6962}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVBaseActivity = class(TJavaGenericImport<JDVBaseActivityClass, JDVBaseActivity>) end;

//  JDVBeautyCameraActivity_1Class = interface(JObjectClass)
//  ['{82A8DB0B-942A-4E96-BC03-1CD3A1BBA98D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$1')]
//  JDVBeautyCameraActivity_1 = interface(JObject)
//  ['{55A7E6A2-1040-40B7-BE27-A6CC546CA53E}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_1 = class(TJavaGenericImport<JDVBeautyCameraActivity_1Class, JDVBeautyCameraActivity_1>) end;

//  JDVBeautyCameraActivity_2Class = interface(JObjectClass)
//  ['{31DF09BB-1426-4DB0-884F-1C356AD7E399}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$2')]
//  JDVBeautyCameraActivity_2 = interface(JObject)
//  ['{182836CB-1911-49A3-896A-7CF490770394}']
//    { Property Methods }
//
//    { methods }
//    procedure onError; cdecl; //()V
//    procedure AudioPermissionError; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_2 = class(TJavaGenericImport<JDVBeautyCameraActivity_2Class, JDVBeautyCameraActivity_2>) end;

//  JDVBeautyCameraActivity_3Class = interface(JObjectClass)
//  ['{6E69BF74-24F0-4396-9D43-D4CFDF4ADEBC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$3')]
//  JDVBeautyCameraActivity_3 = interface(JObject)
//  ['{0DFECAB1-B811-4BA7-9E4F-666DE9D305E2}']
//    { Property Methods }
//
//    { methods }
//    procedure captureSuccess(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
//    procedure recordSuccess(url: JString; firstFrame: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_3 = class(TJavaGenericImport<JDVBeautyCameraActivity_3Class, JDVBeautyCameraActivity_3>) end;

//  JDVBeautyCameraActivity_4Class = interface(JObjectClass)
//  ['{72B8B4C5-0991-4D68-8DFF-51DE57ED05FC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$4')]
//  JDVBeautyCameraActivity_4 = interface(JObject)
//  ['{17F6C773-2BFE-4B77-8CF9-96B3643546CB}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_4 = class(TJavaGenericImport<JDVBeautyCameraActivity_4Class, JDVBeautyCameraActivity_4>) end;

//  JDVBeautyCameraActivity_5Class = interface(JObjectClass)
//  ['{7718BAA0-0EC5-428E-BD3D-97AD822CB1E3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$5')]
//  JDVBeautyCameraActivity_5 = interface(JObject)
//  ['{FC6C84F4-948D-41B7-B851-82D111A17A9B}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_5 = class(TJavaGenericImport<JDVBeautyCameraActivity_5Class, JDVBeautyCameraActivity_5>) end;

//  JDVBeautyCameraActivity_6Class = interface(JObjectClass)
//  ['{3A211BD1-8A4D-46DE-9CAB-DF97D7D4FD74}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity$6')]
//  JDVBeautyCameraActivity_6 = interface(JObject)
//  ['{26B55182-B0BA-4D6B-8D75-E6207E042EF4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVBeautyCameraActivity_6 = class(TJavaGenericImport<JDVBeautyCameraActivity_6Class, JDVBeautyCameraActivity_6>) end;

  JDVBeautyCameraActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{C77FA2BA-A1B6-425D-8951-C81944778B56}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVBeautyCameraActivity; cdecl; //()V
    {class} function isCurrentInTimeScope(beginHour: Integer; beginMin: Integer; endHour: Integer; endMin: Integer): Boolean; cdecl; //(IIII)Z

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVBeautyCameraActivity')]
  JDVBeautyCameraActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{81388360-843F-4A51-ACB5-CD8C3BA1CE56}']
    { Property Methods }

    { methods }
    procedure showMessage(amessage: JString); cdecl; //(Ljava/lang/String;)V
    function getImageContentUri(imageFile: JFile): Jnet_Uri; cdecl; //(Ljava/io/File;)Landroid/net/Uri;
    procedure finish; cdecl; //()V

    { Property }
  end;

  TJDVBeautyCameraActivity = class(TJavaGenericImport<JDVBeautyCameraActivityClass, JDVBeautyCameraActivity>) end;

//  JDVCameraActivity_1Class = interface(JObjectClass)
//  ['{C3A4A2F1-2BB4-4226-8120-336A61B543BF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$1')]
//  JDVCameraActivity_1 = interface(JObject)
//  ['{9426F378-A76B-40B6-A6E1-B2145E7A635D}']
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
//  ['{DA025C56-6343-48FC-9615-62F64E773A8F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$2')]
//  JDVCameraActivity_2 = interface(JObject)
//  ['{F6814F8C-2CB2-44F8-8D04-A1A84CEEC1DA}']
//    { Property Methods }
//
//    { methods }
//    procedure onError; cdecl; //()V
//    procedure AudioPermissionError; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_2 = class(TJavaGenericImport<JDVCameraActivity_2Class, JDVCameraActivity_2>) end;

//  JDVCameraActivity_3Class = interface(JObjectClass)
//  ['{667A0F93-FF8B-45E1-A1C5-3D13EB12045A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$3')]
//  JDVCameraActivity_3 = interface(JObject)
//  ['{5C1AFB6D-9966-40C7-A0BE-6CB949C1A7C2}']
//    { Property Methods }
//
//    { methods }
//    procedure captureSuccess(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
//    procedure recordSuccess(url: JString; firstFrame: JBitmap); cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;)V
//
//    { Property }
//  end;

//  TJDVCameraActivity_3 = class(TJavaGenericImport<JDVCameraActivity_3Class, JDVCameraActivity_3>) end;

//  JDVCameraActivity_4Class = interface(JObjectClass)
//  ['{446A27BC-F932-4B18-B61C-AB63800C26E1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$4')]
//  JDVCameraActivity_4 = interface(JObject)
//  ['{8F3FB3EA-4A72-4A60-9977-29D9EB3BCB32}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_4 = class(TJavaGenericImport<JDVCameraActivity_4Class, JDVCameraActivity_4>) end;

//  JDVCameraActivity_5Class = interface(JObjectClass)
//  ['{6E7E351D-3885-4B55-BC72-93C01258B1BC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$5')]
//  JDVCameraActivity_5 = interface(JObject)
//  ['{B3D69605-960C-49C6-8D74-AD0B3D424627}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_5 = class(TJavaGenericImport<JDVCameraActivity_5Class, JDVCameraActivity_5>) end;

//  JDVCameraActivity_6Class = interface(JObjectClass)
//  ['{16FB6FC6-3A14-4841-AEA6-5B7938509C10}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity$6')]
//  JDVCameraActivity_6 = interface(JObject)
//  ['{268A04C6-AD97-41E3-B7EE-6E19229C98C9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVCameraActivity_6 = class(TJavaGenericImport<JDVCameraActivity_6Class, JDVCameraActivity_6>) end;

  JDVCameraActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{6DA222C9-5C33-4186-B32C-4059C5520C92}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVCameraActivity; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVCameraActivity')]
  JDVCameraActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{8325E49A-7AE5-4C19-BDC4-D614A81B8A80}']
    { Property Methods }

    { methods }
    procedure showMessage(amessage: JString); cdecl; //(Ljava/lang/String;)V
    function getImageContentUri(imageFile: JFile): Jnet_Uri; cdecl; //(Ljava/io/File;)Landroid/net/Uri;
    procedure finish; cdecl; //()V

    { Property }
  end;

  TJDVCameraActivity = class(TJavaGenericImport<JDVCameraActivityClass, JDVCameraActivity>) end;

//  JDVEasyVideoPlayActivity_1Class = interface(JObjectClass)
//  ['{C71252B5-D788-49E7-BC49-28D9F1426EAA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVEasyVideoPlayActivity$1')]
//  JDVEasyVideoPlayActivity_1 = interface(JObject)
//  ['{1B4FD419-2BDB-4DC0-9D25-E550AD9E7BF9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVEasyVideoPlayActivity_1 = class(TJavaGenericImport<JDVEasyVideoPlayActivity_1Class, JDVEasyVideoPlayActivity_1>) end;

  JDVEasyVideoPlayActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{7BE8C923-B763-4BCC-B080-7544F0E6FA9F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVEasyVideoPlayActivity; cdecl; //()V
    {class} procedure openVideo(mContext: JContext; path: JString); cdecl; //(Landroid/content/Context;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVEasyVideoPlayActivity')]
  JDVEasyVideoPlayActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{0025AD87-AD2E-46CC-B016-CBEF57771D21}']
    { Property Methods }

    { methods }
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJDVEasyVideoPlayActivity = class(TJavaGenericImport<JDVEasyVideoPlayActivityClass, JDVEasyVideoPlayActivity>) end;

//  JDVEditPhotoActivity_1Class = interface(JObjectClass)
//  ['{4543F001-FB1F-4431-B74B-6793B240C701}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVEditPhotoActivity$1')]
//  JDVEditPhotoActivity_1 = interface(JObject)
//  ['{79143E49-DFE4-40A0-BC12-CAA52AA5BDF6}']
//    { Property Methods }
//
//    { methods }
//    procedure onSaveSuccess(filePath: JString); cdecl; //(Ljava/lang/String;)V
//
//    { Property }
//  end;

//  TJDVEditPhotoActivity_1 = class(TJavaGenericImport<JDVEditPhotoActivity_1Class, JDVEditPhotoActivity_1>) end;

  JDVEditPhotoActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{B7D870DD-7573-4341-BF6C-CD5E8C22A283}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVEditPhotoActivity; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVEditPhotoActivity')]
  JDVEditPhotoActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{21A33574-EB5C-4288-ADF1-A2290A84C579}']
    { Property Methods }

    { methods }
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJDVEditPhotoActivity = class(TJavaGenericImport<JDVEditPhotoActivityClass, JDVEditPhotoActivity>) end;

//  JDVMediaSelectActivity_1Class = interface(JObjectClass)
//  ['{A675C5CA-5041-40B8-ADD2-ADA6AA75759F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity$1')]
//  JDVMediaSelectActivity_1 = interface(JObject)
//  ['{9887F941-1A8F-4F3C-9E2E-3F81DC33A63D}']
//    { Property Methods }
//
//    { methods }
//    procedure onBackStackChanged; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVMediaSelectActivity_1 = class(TJavaGenericImport<JDVMediaSelectActivity_1Class, JDVMediaSelectActivity_1>) end;

//  JDVMediaSelectActivity_2Class = interface(JObjectClass)
//  ['{99F1A972-6861-48E6-AA93-3595824128C9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity$2')]
//  JDVMediaSelectActivity_2 = interface(JObject)
//  ['{BD3F86D4-E939-40B0-9392-63EA5F399B79}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVMediaSelectActivity_2 = class(TJavaGenericImport<JDVMediaSelectActivity_2Class, JDVMediaSelectActivity_2>) end;

  JDVMediaSelectActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{A20BCD43-D9B6-4B80-AEF3-66B856193B36}']
    { static Property Methods }
    {class} function _Getmap_cacheSelectInfo: JHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/HashMap;

    { static Methods }
    {class} function init: JDVMediaSelectActivity; cdecl; //()V

    { static Property }
    {class} property map_cacheSelectInfo: JHashMap read _Getmap_cacheSelectInfo;
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVMediaSelectActivity')]
  JDVMediaSelectActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{96BD1427-6578-41CE-8793-8154D3EC8E86}']
    { Property Methods }

    { methods }
    procedure showMessage(amessage: JString); cdecl; //(Ljava/lang/String;)V
    procedure onClick(view: JView); cdecl; //(Landroid/view/View;)V
    procedure onItemClick(li_AllInfo: JArrayList; P2: Integer); cdecl; //(Ljava/util/ArrayList;I)V
    procedure onItemCheck(info: JMediaInfo; isChecked: Boolean); cdecl; //(Lcom/devil/library/media/bean/MediaInfo;Z)V
    function itemCheckEnabled(position: Integer; isChecked: Boolean): Boolean; cdecl; //(IZ)Z
    procedure onFolderCheck(folderInfo: JFolderInfo); cdecl; //(Lcom/devil/library/media/bean/FolderInfo;)V
    function getImageContentUri(imageFile: JFile): Jnet_Uri; cdecl; //(Ljava/io/File;)Landroid/net/Uri;
    procedure finish; cdecl; //()V

    { Property }
  end;

  TJDVMediaSelectActivity = class(TJavaGenericImport<JDVMediaSelectActivityClass, JDVMediaSelectActivity>) end;

//  JDVSystemCameraActivity_1Class = interface(JObjectClass)
//  ['{0F572B65-6EED-4631-8780-E642DB1A9AA2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity$1')]
//  JDVSystemCameraActivity_1 = interface(JObject)
//  ['{84B4924A-A5C9-4F11-A85C-05BF79EA9573}']
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
//  ['{43206802-B9E5-4103-99D9-754649095EA9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity$2')]
//  JDVSystemCameraActivity_2 = interface(JObject)
//  ['{23459557-FB36-4A5A-9EE3-584E5A5741E3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVSystemCameraActivity_2 = class(TJavaGenericImport<JDVSystemCameraActivity_2Class, JDVSystemCameraActivity_2>) end;

  JDVSystemCameraActivityClass = interface(JDVBaseActivityClass) // or JObjectClass // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{9BA9231D-C222-480E-AAA9-F63A33C5032A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVSystemCameraActivity; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/activity/DVSystemCameraActivity')]
  JDVSystemCameraActivity = interface(JDVBaseActivity) // or JObject // SuperSignature: com/devil/library/media/ui/activity/DVBaseActivity
  ['{52423C87-3802-4DD0-8FFE-F1C285C299CD}']
    { Property Methods }

    { methods }
    procedure showMessage(amessage: JString); cdecl; //(Ljava/lang/String;)V
    function getImageContentUri(imageFile: JFile): Jnet_Uri; cdecl; //(Ljava/io/File;)Landroid/net/Uri;
    procedure finish; cdecl; //()V

    { Property }
  end;

  TJDVSystemCameraActivity = class(TJavaGenericImport<JDVSystemCameraActivityClass, JDVSystemCameraActivity>) end;

//  JImageFilterFragment_1Class = interface(JObjectClass)
//  ['{33E9925E-A219-4F1A-86EB-B9C3C9A8B33E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/ImageFilterFragment$1')]
//  JImageFilterFragment_1 = interface(JObject)
//  ['{A43C4E57-DAFE-4495-BE60-183EF5C1297A}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJImageFilterFragment_1 = class(TJavaGenericImport<JImageFilterFragment_1Class, JImageFilterFragment_1>) end;

//  JImageFilterFragment_2Class = interface(JObjectClass)
//  ['{4BF75360-8C87-4188-A7F2-F3C6C3D48D03}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/ImageFilterFragment$2')]
//  JImageFilterFragment_2 = interface(JObject)
//  ['{D838BC6C-C8EF-4C31-83D0-1F98BF2957BC}']
//    { Property Methods }
//
//    { methods }
//    procedure onProgressChanged(seekBar: JSeekBar; progress: Integer; fromUser: Boolean); cdecl; //(Landroid/widget/SeekBar;IZ)V
//    procedure onStartTrackingTouch(seekBar: JSeekBar); cdecl; //(Landroid/widget/SeekBar;)V
//    procedure onStopTrackingTouch(seekBar: JSeekBar); cdecl; //(Landroid/widget/SeekBar;)V
//
//    { Property }
//  end;

//  TJImageFilterFragment_2 = class(TJavaGenericImport<JImageFilterFragment_2Class, JImageFilterFragment_2>) end;

//  JImageFilterFragment_3_1Class = interface(JObjectClass)
//  ['{EBA72C0A-D952-44C5-8C03-8B2380F4C769}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/ImageFilterFragment$3$1')]
//  JImageFilterFragment_3_1 = interface(JObject)
//  ['{85110924-52D2-4828-B358-2F1E6848E16F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJImageFilterFragment_3_1 = class(TJavaGenericImport<JImageFilterFragment_3_1Class, JImageFilterFragment_3_1>) end;

//  JImageFilterFragment_3Class = interface(JObjectClass)
//  ['{15E8194E-1790-4C48-A4E3-C98D17F82D92}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/ImageFilterFragment$3')]
//  JImageFilterFragment_3 = interface(JObject)
//  ['{A6C4CA56-3302-4A36-83F7-8FF36BAFF9F1}']
//    { Property Methods }
//
//    { methods }
//    procedure onCapture(buffer: JByteBuffer; width: Integer; height: Integer); cdecl; //(Ljava/nio/ByteBuffer;II)V
//
//    { Property }
//  end;

//  TJImageFilterFragment_3 = class(TJavaGenericImport<JImageFilterFragment_3Class, JImageFilterFragment_3>) end;

  JImageFilterFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: androidx/fragment/app/Fragment
  ['{FBD75669-113D-4A42-A655-2FBE7FF5B07D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageFilterFragment; cdecl; //()V
    {class} function instance(photoPath: JString; newPhotoSaveDir: JString): JImageFilterFragment; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Lcom/devil/library/media/ui/fragment/ImageFilterFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/ImageFilterFragment')]
  JImageFilterFragment = interface(JFragment) // or JObject // SuperSignature: androidx/fragment/app/Fragment
  ['{138E83A0-81BC-4227-9EB8-EFCC64D01FD8}']
    { Property Methods }

    { methods }
    procedure onAttach(context: JContext); cdecl; //(Landroid/content/Context;)V
    function onCreateView(inflater: JLayoutInflater; container: JViewGroup; savedInstanceState: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    procedure onViewCreated(view: JView; savedInstanceState: JBundle); cdecl; //(Landroid/view/View;Landroid/os/Bundle;)V
    procedure setOnImageSaveListener(listener: JOnImageSaveListener); cdecl; //(Lcom/devil/library/media/listener/OnImageSaveListener;)V
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
    procedure startSaveImage; cdecl; //()V
    procedure onCloseFilter; cdecl; //()V
    procedure onColorFilterChanged(resourceData: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V
    procedure onAdjustChange(atype: JImageFilterType; value: Single); cdecl; //(Lcom/devil/library/media/enumtype/ImageFilterType;F)V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJImageFilterFragment = class(TJavaGenericImport<JImageFilterFragmentClass, JImageFilterFragment>) end;

//  JMediaListFragment_1Class = interface(JRecyclerView_ItemDecorationClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
//  ['{C355D778-7626-4DBB-BEED-744389EEA08E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$1')]
//  JMediaListFragment_1 = interface(JRecyclerView_ItemDecoration) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
//  ['{F3BBFB5F-26E4-429A-826B-974F790551A1}']
//    { Property Methods }
//
//    { methods }
//    procedure getItemOffsets(outRect: JRect; view: JView; parent: JRecyclerView; state: JRecyclerView_State); cdecl; //(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_1 = class(TJavaGenericImport<JMediaListFragment_1Class, JMediaListFragment_1>) end;

//  JMediaListFragment_2Class = interface(JObjectClass)
//  ['{008191B5-D4CD-4D4C-8BC8-32B57A398090}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$2')]
//  JMediaListFragment_2 = interface(JObject)
//  ['{3DDF21D0-3E59-4F54-803A-2283C547E30B}']
//    { Property Methods }
//
//    { methods }
//    procedure onItemCheck(position: Integer; isChecked: Boolean); cdecl; //(IZ)V
//    function itemCheckEnabled(position: Integer; isChecked: Boolean): Boolean; cdecl; //(IZ)Z
//
//    { Property }
//  end;

//  TJMediaListFragment_2 = class(TJavaGenericImport<JMediaListFragment_2Class, JMediaListFragment_2>) end;

//  JMediaListFragment_3Class = interface(JObjectClass)
//  ['{84F2CBB4-C2C8-4B19-8BBF-2809D60A7027}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$3')]
//  JMediaListFragment_3 = interface(JObject)
//  ['{195DE0BA-D630-4BA6-A4EA-88821E13A570}']
//    { Property Methods }
//
//    { methods }
//    procedure onItemClick(holder: JEasyRVHolder; position: Integer); cdecl; //(Lcom/devil/library/media/base/EasyRVHolder;I)V
//
//    { Property }
//  end;

//  TJMediaListFragment_3 = class(TJavaGenericImport<JMediaListFragment_3Class, JMediaListFragment_3>) end;

//  JMediaListFragment_4Class = interface(JObjectClass)
//  ['{D8790904-57C3-403D-ABCF-5A3113DD639E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$4')]
//  JMediaListFragment_4 = interface(JObject)
//  ['{E8E21E0B-33EC-4AC7-A59B-BEC6AB312AE3}']
//    { Property Methods }
//
//    { methods }
//    procedure onItemClick(adapterView: JAdapterView; P2: JView; i: Integer; l: Int64); cdecl; //(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
//
//    { Property }
//  end;

//  TJMediaListFragment_4 = class(TJavaGenericImport<JMediaListFragment_4Class, JMediaListFragment_4>) end;

//  JMediaListFragment_5Class = interface(JObjectClass)
//  ['{0EBC3471-216E-4CB4-972F-F1F3CA6D46D8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$5')]
//  JMediaListFragment_5 = interface(JObject)
//  ['{DEED549F-13A7-4EDA-A44D-1872F9A38E00}']
//    { Property Methods }
//
//    { methods }
//    procedure onDismiss; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaListFragment_5 = class(TJavaGenericImport<JMediaListFragment_5Class, JMediaListFragment_5>) end;

//  JMediaListFragment_6Class = interface(JObjectClass)
//  ['{7FFA67AD-384D-496A-A369-F0938E149C9B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$6')]
//  JMediaListFragment_6 = interface(JObject)
//  ['{735B994E-2F4B-4069-ACE2-EF4915DF79E6}']
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
//  ['{021B861A-51C4-473F-BCF2-4905B364BA6C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$7')]
//  JMediaListFragment_7 = interface(JObject)
//  ['{24453E5D-F229-4414-B619-627C16A059B8}']
//    { Property Methods }
//
//    { methods }
//    procedure onLoadSuccess(allPhotos: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_7 = class(TJavaGenericImport<JMediaListFragment_7Class, JMediaListFragment_7>) end;

//  JMediaListFragment_8Class = interface(JObjectClass)
//  ['{346F36F4-0164-4BE7-BF64-101052386A3E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$8')]
//  JMediaListFragment_8 = interface(JObject)
//  ['{CA1EE9ED-A01B-4D37-A47D-5DC5564263D4}']
//    { Property Methods }
//
//    { methods }
//    procedure onLoadSuccess(allVideos: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_8 = class(TJavaGenericImport<JMediaListFragment_8Class, JMediaListFragment_8>) end;

//  JMediaListFragment_9_1Class = interface(JObjectClass)
//  ['{D951AB70-B18B-40AB-A5F2-6D59A4004282}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$9$1')]
//  JMediaListFragment_9_1 = interface(JObject)
//  ['{848E4612-FEE8-46D0-95E2-9DCC7F0F1DB1}']
//    { Property Methods }
//
//    { methods }
//    procedure onLoadSuccess(allVideos: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_9_1 = class(TJavaGenericImport<JMediaListFragment_9_1Class, JMediaListFragment_9_1>) end;

//  JMediaListFragment_9Class = interface(JObjectClass)
//  ['{3A9594EE-AF30-4EF3-86B4-41C4AE52032E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment$9')]
//  JMediaListFragment_9 = interface(JObject)
//  ['{5DC680A8-DFFE-4D00-9DBF-7F6DA2988F65}']
//    { Property Methods }
//
//    { methods }
//    procedure onLoadSuccess(allPhotos: JHashMap); cdecl; //(Ljava/util/HashMap;)V
//
//    { Property }
//  end;

//  TJMediaListFragment_9 = class(TJavaGenericImport<JMediaListFragment_9Class, JMediaListFragment_9>) end;

  JMediaListFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: androidx/fragment/app/Fragment
  ['{7F695C8F-59AD-427D-BE7F-269124B0BEF8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMediaListFragment; cdecl; //()V
    {class} function instance: JMediaListFragment; cdecl; //()Lcom/devil/library/media/ui/fragment/MediaListFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/MediaListFragment')]
  JMediaListFragment = interface(JFragment) // or JObject // SuperSignature: androidx/fragment/app/Fragment
  ['{9B547C7A-4D71-4FA9-8C14-69B19925201D}']
    { Property Methods }
    function _GetmContext: JFragmentActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroidx/fragment/app/FragmentActivity;
    procedure _SetmContext(amContext: JFragmentActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroidx/fragment/app/FragmentActivity;)V
    function _GetmContentView: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/view/View;
    procedure _SetmContentView(amContentView: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/view/View;)V

    { methods }
    function onCreateView(inflater: JLayoutInflater; container: JViewGroup; savedInstanceState: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function findViewById(id: Integer): JView; cdecl; //(I)Landroid/view/View;
    procedure setOnItemClickListener(onItemClickListener: JOnItemClickListener); cdecl; //(Lcom/devil/library/media/listener/OnItemClickListener;)V
    procedure refreshData; cdecl; overload; //()V
    procedure refreshData(position: Integer); cdecl; overload; //(I)V
    procedure openFolderPopupWindow(anchorView: JView); cdecl; //(Landroid/view/View;)V
    procedure setBackgroundAlpha(bgAlpha: Single); cdecl; //(F)V
    procedure loadData; cdecl; //()V

    { Property }
    property mContext: JFragmentActivity read _GetmContext write _SetmContext;
    property mContentView: JView read _GetmContentView write _SetmContentView;
  end;

  TJMediaListFragment = class(TJavaGenericImport<JMediaListFragmentClass, JMediaListFragment>) end;

//  JWatchMediaFragment_1Class = interface(JObjectClass)
//  ['{71198B41-909E-4CE7-931E-AACFF398E133}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaFragment$1')]
//  JWatchMediaFragment_1 = interface(JObject)
//  ['{C89D7E3E-B62A-482E-81F9-3E66829B6E1C}']
//    { Property Methods }
//
//    { methods }
//    procedure onPageScrolled(i: Integer; v: Single; i1: Integer); cdecl; //(IFI)V
//    procedure onPageSelected(i: Integer); cdecl; //(I)V
//    procedure onPageScrollStateChanged(i: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJWatchMediaFragment_1 = class(TJavaGenericImport<JWatchMediaFragment_1Class, JWatchMediaFragment_1>) end;

  JWatchMediaFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: androidx/fragment/app/Fragment
  ['{86AF6CCC-2A84-4A9B-AA58-704D663A032E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWatchMediaFragment; cdecl; //()V
    {class} function instance: JWatchMediaFragment; cdecl; //()Lcom/devil/library/media/ui/fragment/WatchMediaFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaFragment')]
  JWatchMediaFragment = interface(JFragment) // or JObject // SuperSignature: androidx/fragment/app/Fragment
  ['{C97561F0-9CC1-4653-BB07-B58CB68F2791}']
    { Property Methods }
    function _GetmContext: JFragmentActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroidx/fragment/app/FragmentActivity;
    procedure _SetmContext(amContext: JFragmentActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroidx/fragment/app/FragmentActivity;)V
    function _GetmContentView: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/view/View;
    procedure _SetmContentView(amContentView: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/view/View;)V

    { methods }
    function onCreateView(inflater: JLayoutInflater; container: JViewGroup; savedInstanceState: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function findViewById(id: Integer): JView; cdecl; //(I)Landroid/view/View;
    procedure setOnItemClickListener(onItemClickListener: JOnItemClickListener); cdecl; //(Lcom/devil/library/media/listener/OnItemClickListener;)V
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V

    { Property }
    property mContext: JFragmentActivity read _GetmContext write _SetmContext;
    property mContentView: JView read _GetmContentView write _SetmContentView;
  end;

  TJWatchMediaFragment = class(TJavaGenericImport<JWatchMediaFragmentClass, JWatchMediaFragment>) end;

//  JWatchMediaVPItemFragment_1Class = interface(JObjectClass)
//  ['{56A10513-35B8-4C89-BD3D-A57A4EDD6A14}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment$1')]
//  JWatchMediaVPItemFragment_1 = interface(JObject)
//  ['{0FE4F2D3-DF5E-4F8C-A21A-D6FC17E636A6}']
//    { Property Methods }
//
//    { methods }
//    procedure onPhotoTap(view: JImageView; x: Single; y: Single); cdecl; //(Landroid/widget/ImageView;FF)V
//
//    { Property }
//  end;

//  TJWatchMediaVPItemFragment_1 = class(TJavaGenericImport<JWatchMediaVPItemFragment_1Class, JWatchMediaVPItemFragment_1>) end;

//  JWatchMediaVPItemFragment_2Class = interface(JObjectClass)
//  ['{123298A0-F7C8-4D4A-8999-EABE6D6C9A9D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment$2')]
//  JWatchMediaVPItemFragment_2 = interface(JObject)
//  ['{2D1FD77D-CE2D-4A99-A791-8055AC4C395C}']
//    { Property Methods }
//
//    { methods }
//    procedure onOutsidePhotoTap(imageView: JImageView); cdecl; //(Landroid/widget/ImageView;)V
//
//    { Property }
//  end;

//  TJWatchMediaVPItemFragment_2 = class(TJavaGenericImport<JWatchMediaVPItemFragment_2Class, JWatchMediaVPItemFragment_2>) end;

  JWatchMediaVPItemFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: androidx/fragment/app/Fragment
  ['{A7B349BF-2A1D-4F5C-B033-5FE33D232E4B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWatchMediaVPItemFragment; cdecl; //()V
    {class} function newInstance(info: JMediaInfo): JWatchMediaVPItemFragment; cdecl; //(Lcom/devil/library/media/bean/MediaInfo;)Lcom/devil/library/media/ui/fragment/WatchMediaVPItemFragment;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/ui/fragment/WatchMediaVPItemFragment')]
  JWatchMediaVPItemFragment = interface(JFragment) // or JObject // SuperSignature: androidx/fragment/app/Fragment
  ['{15512BE7-E45B-425D-854F-A29ADF1F2915}']
    { Property Methods }

    { methods }
    function onCreateView(inflater: JLayoutInflater; container: JViewGroup; savedInstanceState: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    function findViewById(id: Integer): JView; cdecl; //(I)Landroid/view/View;
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJWatchMediaVPItemFragment = class(TJavaGenericImport<JWatchMediaVPItemFragmentClass, JWatchMediaVPItemFragment>) end;

  JAndroidRomUtil_BuildPropertiesClass = interface(JObjectClass)
  ['{9DEA7ECD-5EB8-469F-AEC8-853451F8A347}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JAndroidRomUtil_BuildProperties; cdecl; //()Lcom/devil/library/media/utils/AndroidRomUtil$BuildProperties;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/AndroidRomUtil$BuildProperties')]
  JAndroidRomUtil_BuildProperties = interface(JObject)
  ['{1F1D9FD8-CBA4-46A4-94A8-51F9832E6551}']
    { Property Methods }

    { methods }
    function containsKey(key: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function containsValue(value: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function entrySet: JSet; cdecl; //()Ljava/util/Set;
    function getProperty(name: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    function getProperty(name: JString; defaultValue: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    function isEmpty: Boolean; cdecl; //()Z
    function keys: JEnumeration; cdecl; //()Ljava/util/Enumeration;
    function keySet: JSet; cdecl; //()Ljava/util/Set;
    function size: Integer; cdecl; //()I
    function values: JCollection; cdecl; //()Ljava/util/Collection;

    { Property }
  end;

  TJAndroidRomUtil_BuildProperties = class(TJavaGenericImport<JAndroidRomUtil_BuildPropertiesClass, JAndroidRomUtil_BuildProperties>) end;

  JAndroidRomUtilClass = interface(JObjectClass)
  ['{4EF6A927-2697-4958-A4DA-C23489017565}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAndroidRomUtil; cdecl; //()V
    {class} function isEMUI: Boolean; cdecl; //()Z
    {class} function isMIUI: Boolean; cdecl; //()Z
    {class} function isFlyme: Boolean; cdecl; //()Z

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/AndroidRomUtil')]
  JAndroidRomUtil = interface(JObject)
  ['{E6709E64-3DB2-4B3D-AA7A-67A9EF5B1C01}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAndroidRomUtil = class(TJavaGenericImport<JAndroidRomUtilClass, JAndroidRomUtil>) end;

  JDisplayUtilsClass = interface(JObjectClass)
  ['{A7D41C5D-4B39-4224-95BB-8D9A78699109}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDisplayUtils; cdecl; //()V
    {class} function dip2px(context: JContext; dipValue: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function px2dip(context: JContext; pxValue: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function getScreenMetrics(context: JContext): JPoint; cdecl; //(Landroid/content/Context;)Landroid/graphics/Point;
    {class} function getScreenRate(context: JContext): Single; cdecl; //(Landroid/content/Context;)F
    {class} function getDisplayWidth(context: JContext): Integer; cdecl; //(Landroid/content/Context;)I
    {class} function getDisplayHeight(context: JContext): Integer; cdecl; //(Landroid/content/Context;)I

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/DisplayUtils')]
  JDisplayUtils = interface(JObject)
  ['{58B90D0C-C360-4997-8427-DD8C88DCC9C2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDisplayUtils = class(TJavaGenericImport<JDisplayUtilsClass, JDisplayUtils>) end;

  JDVFileProviderClass = interface(JFileProviderClass) // or JObjectClass // SuperSignature: androidx/core/content/FileProvider
  ['{83339454-B0CD-48DE-8FA5-1BE496D61DC6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDVFileProvider; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/DVFileProvider')]
  JDVFileProvider = interface(JFileProvider) // or JObject // SuperSignature: androidx/core/content/FileProvider
  ['{EC0C0A4B-78FC-4042-B29B-9BB41403BE7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDVFileProvider = class(TJavaGenericImport<JDVFileProviderClass, JDVFileProvider>) end;

  JFileUtilsClass = interface(JObjectClass)
  ['{3D6495BB-3A71-46AA-A4AF-B0064B9ED91C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileUtils; cdecl; //()V
    {class} function createRootPath(context: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;
    {class} function checkSdCardAvailable: Boolean; cdecl; //()Z
    {class} function createDir(dirPath: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function createFile(afile: JFile): JString; cdecl; overload; //(Ljava/io/File;)Ljava/lang/String;
    {class} function createFile(filePath: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} procedure deleteDirAllFile(dir: JFile); cdecl; //(Ljava/io/File;)V
    {class} function getFileName(filePath: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function getApplicationId(appContext: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;
    {class} function save(src: JBitmap; afile: JFile; format: JBitmap_CompressFormat; recycle: Boolean): Boolean; cdecl; //(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;Z)Z

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/FileUtils')]
  JFileUtils = interface(JObject)
  ['{1BA7A210-BDE5-4F2C-AC80-7FFCE76E926A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileUtils = class(TJavaGenericImport<JFileUtilsClass, JFileUtils>) end;

  JLayoutManagerHelperClass = interface(JObjectClass)
  ['{484BC6D2-864D-4A5C-94C7-20684E292E39}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLayoutManagerHelper; cdecl; //()V
    {class} function getLinearLayoutManager(mContext: JContext; orientation: Integer): JLinearLayoutManager; cdecl; //(Landroid/content/Context;I)Landroidx/recyclerview/widget/LinearLayoutManager;
    {class} function getGridLayoutManager(mContext: JContext; spanCount: Integer; orientation: Integer): JGridLayoutManager; cdecl; //(Landroid/content/Context;II)Landroidx/recyclerview/widget/GridLayoutManager;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/LayoutManagerHelper')]
  JLayoutManagerHelper = interface(JObject)
  ['{F8CA7007-4228-47A2-AD7A-ECDEE163D1DF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLayoutManagerHelper = class(TJavaGenericImport<JLayoutManagerHelperClass, JLayoutManagerHelper>) end;

//  JMediaDataUtils_1_1Class = interface(JObjectClass)
//  ['{71B78CE4-A5AD-4845-A371-74F5A18B0DFC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/MediaDataUtils$1$1')]
//  JMediaDataUtils_1_1 = interface(JObject)
//  ['{021E1292-0CEC-49AF-9A39-EEF803100EFE}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaDataUtils_1_1 = class(TJavaGenericImport<JMediaDataUtils_1_1Class, JMediaDataUtils_1_1>) end;

//  JMediaDataUtils_1Class = interface(JObjectClass)
//  ['{86A9CF32-711A-4A44-9D21-887D043727ED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/MediaDataUtils$1')]
//  JMediaDataUtils_1 = interface(JObject)
//  ['{47CFD3C8-2706-42AD-B00A-B824A5E164AC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaDataUtils_1 = class(TJavaGenericImport<JMediaDataUtils_1Class, JMediaDataUtils_1>) end;

//  JMediaDataUtils_2_1Class = interface(JObjectClass)
//  ['{08B5392B-B3D8-4C4C-AE90-6FF6A809CE26}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/MediaDataUtils$2$1')]
//  JMediaDataUtils_2_1 = interface(JObject)
//  ['{3F449DD9-E594-41DD-8D26-960BB8719860}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaDataUtils_2_1 = class(TJavaGenericImport<JMediaDataUtils_2_1Class, JMediaDataUtils_2_1>) end;

//  JMediaDataUtils_2Class = interface(JObjectClass)
//  ['{13DC3F87-AB3D-4D39-8BBA-DC9EB52D65A6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/MediaDataUtils$2')]
//  JMediaDataUtils_2 = interface(JObject)
//  ['{713FEA41-C395-4B17-AD1F-2E6FD04D3C55}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJMediaDataUtils_2 = class(TJavaGenericImport<JMediaDataUtils_2Class, JMediaDataUtils_2>) end;

  JMediaDataUtils_OnLoadCallBackClass = interface(JObjectClass)
  ['{4ACA5335-1383-4DE1-8F90-E888E273A624}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/MediaDataUtils$OnLoadCallBack')]
  JMediaDataUtils_OnLoadCallBack = interface(IJavaInstance)
  ['{EC8B467A-1736-45A1-85E0-0B88A4C14282}']
    { Property Methods }

    { methods }
    procedure onLoadSuccess(P1: JHashMap); cdecl; //(Ljava/util/HashMap;)V

    { Property }
  end;

  TJMediaDataUtils_OnLoadCallBack = class(TJavaGenericImport<JMediaDataUtils_OnLoadCallBackClass, JMediaDataUtils_OnLoadCallBack>) end;

  JMediaDataUtilsClass = interface(JObjectClass)
  ['{8AF3C694-83ED-4D61-BF3B-EDE90C765D40}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMediaDataUtils; cdecl; //()V
    {class} procedure getAllPhotoInfo(mContext: JActivity; callBack: JMediaDataUtils_OnLoadCallBack); cdecl; //(Landroid/app/Activity;Lcom/devil/library/media/utils/MediaDataUtils$OnLoadCallBack;)V
    {class} procedure getAllVideoInfo(mContext: JActivity; isNeedThumbnail: Boolean; callBack: JMediaDataUtils_OnLoadCallBack); cdecl; //(Landroid/app/Activity;ZLcom/devil/library/media/utils/MediaDataUtils$OnLoadCallBack;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/MediaDataUtils')]
  JMediaDataUtils = interface(JObject)
  ['{3EABBFCE-223D-4B76-972D-F095506C8F8F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaDataUtils = class(TJavaGenericImport<JMediaDataUtilsClass, JMediaDataUtils>) end;

  JMediaFileTypeUtils_MediaFileTypeClass = interface(JObjectClass)
  ['{52020550-8D44-4B5E-B108-E65C1815C5A3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/MediaFileTypeUtils$MediaFileType')]
  JMediaFileTypeUtils_MediaFileType = interface(JObject)
  ['{A596B36D-634F-420E-88DF-D41BDFBBE727}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaFileTypeUtils_MediaFileType = class(TJavaGenericImport<JMediaFileTypeUtils_MediaFileTypeClass, JMediaFileTypeUtils_MediaFileType>) end;

  JMediaFileTypeUtilsClass = interface(JObjectClass)
  ['{8C0E5B14-F3CA-4100-B590-7A6063FD82E0}']
    { static Property Methods }
    {class} function _GetsFileExtensions: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFILE_TYPE_MP3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_M4A: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_WAV: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_AMR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_AWB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_WMA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_OGG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_MID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_SMF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_IMY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_MP4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_M4V: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_3GPP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_3GPP2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_WMV: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_JPEG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_GIF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_PNG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_BMP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_WBMP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_M3U: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_PLS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFILE_TYPE_WPL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetUNKNOWN_STRING: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JMediaFileTypeUtils; cdecl; //()V
    {class} function isAudioFileType(fileType: Integer): Boolean; cdecl; overload; //(I)Z
    {class} function isVideoFileType(fileType: Integer): Boolean; cdecl; overload; //(I)Z
    {class} function isImageFileType(fileType: Integer): Boolean; cdecl; //(I)Z
    {class} function isPlayListFileType(fileType: Integer): Boolean; cdecl; //(I)Z
    {class} function getFileType(path: JString): JMediaFileTypeUtils_MediaFileType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/media/utils/MediaFileTypeUtils$MediaFileType;
    {class} function isVideoFileType(path: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    {class} function isAudioFileType(path: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    {class} function getFileTypeForMimeType(mimeType: JString): Integer; cdecl; //(Ljava/lang/String;)I

    { static Property }
    {class} property sFileExtensions: JString read _GetsFileExtensions;
    {class} property FILE_TYPE_MP3: Integer read _GetFILE_TYPE_MP3;
    {class} property FILE_TYPE_M4A: Integer read _GetFILE_TYPE_M4A;
    {class} property FILE_TYPE_WAV: Integer read _GetFILE_TYPE_WAV;
    {class} property FILE_TYPE_AMR: Integer read _GetFILE_TYPE_AMR;
    {class} property FILE_TYPE_AWB: Integer read _GetFILE_TYPE_AWB;
    {class} property FILE_TYPE_WMA: Integer read _GetFILE_TYPE_WMA;
    {class} property FILE_TYPE_OGG: Integer read _GetFILE_TYPE_OGG;
    {class} property FILE_TYPE_MID: Integer read _GetFILE_TYPE_MID;
    {class} property FILE_TYPE_SMF: Integer read _GetFILE_TYPE_SMF;
    {class} property FILE_TYPE_IMY: Integer read _GetFILE_TYPE_IMY;
    {class} property FILE_TYPE_MP4: Integer read _GetFILE_TYPE_MP4;
    {class} property FILE_TYPE_M4V: Integer read _GetFILE_TYPE_M4V;
    {class} property FILE_TYPE_3GPP: Integer read _GetFILE_TYPE_3GPP;
    {class} property FILE_TYPE_3GPP2: Integer read _GetFILE_TYPE_3GPP2;
    {class} property FILE_TYPE_WMV: Integer read _GetFILE_TYPE_WMV;
    {class} property FILE_TYPE_JPEG: Integer read _GetFILE_TYPE_JPEG;
    {class} property FILE_TYPE_GIF: Integer read _GetFILE_TYPE_GIF;
    {class} property FILE_TYPE_PNG: Integer read _GetFILE_TYPE_PNG;
    {class} property FILE_TYPE_BMP: Integer read _GetFILE_TYPE_BMP;
    {class} property FILE_TYPE_WBMP: Integer read _GetFILE_TYPE_WBMP;
    {class} property FILE_TYPE_M3U: Integer read _GetFILE_TYPE_M3U;
    {class} property FILE_TYPE_PLS: Integer read _GetFILE_TYPE_PLS;
    {class} property FILE_TYPE_WPL: Integer read _GetFILE_TYPE_WPL;
    {class} property UNKNOWN_STRING: JString read _GetUNKNOWN_STRING;
  end;

  [JavaSignature('com/devil/library/media/utils/MediaFileTypeUtils')]
  JMediaFileTypeUtils = interface(JObject)
  ['{21DEA7C6-0EE2-4F06-BD44-A3C07E7C58E6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaFileTypeUtils = class(TJavaGenericImport<JMediaFileTypeUtilsClass, JMediaFileTypeUtils>) end;

//  JStatusBarUtil_1Class = interface(JObjectClass)
//  ['{EC8E1FD3-810E-4118-874D-F5FF5A1CF652}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/utils/StatusBarUtil$1')]
//  JStatusBarUtil_1 = interface(JObject)
//  ['{C3E22EE1-703C-448F-A523-928E05870CBC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJStatusBarUtil_1 = class(TJavaGenericImport<JStatusBarUtil_1Class, JStatusBarUtil_1>) end;

  JStatusBarUtilClass = interface(JObjectClass)
  ['{E5358BB5-8449-48D2-AF19-7061ACF54F22}']
    { static Property Methods }
    {class} function _GetDEFAULT_STATUS_BAR_ALPHA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JStatusBarUtil; cdecl; //()V
    {class} procedure setColor(activity: JActivity; color: Integer); cdecl; overload; //(Landroid/app/Activity;I)V
    {class} procedure setColor(activity: JActivity; color: Integer; statusBarAlpha: Integer); cdecl; overload; //(Landroid/app/Activity;II)V
    {class} procedure setColorForSwipeBack(activity: JActivity; color: Integer); cdecl; overload; //(Landroid/app/Activity;I)V
    {class} procedure setColorForSwipeBack(activity: JActivity; color: Integer; statusBarAlpha: Integer); cdecl; overload; //(Landroid/app/Activity;II)V
    {class} procedure setColorNoTranslucent(activity: JActivity; color: Integer); cdecl; //(Landroid/app/Activity;I)V
    {class} procedure setColorDiff(activity: JActivity; color: Integer); cdecl; //Deprecated //(Landroid/app/Activity;I)V
    {class} procedure setTranslucent(activity: JActivity); cdecl; overload; //(Landroid/app/Activity;)V
    {class} procedure setTranslucent(activity: JActivity; statusBarAlpha: Integer); cdecl; overload; //(Landroid/app/Activity;I)V
    {class} procedure setTranslucentForCoordinatorLayout(activity: JActivity; statusBarAlpha: Integer); cdecl; //(Landroid/app/Activity;I)V
    {class} procedure setTransparent(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure setTranslucentDiff(activity: JActivity); cdecl; //Deprecated //(Landroid/app/Activity;)V
    {class} procedure setColorForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout; color: Integer); cdecl; overload; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;I)V
    {class} procedure setColorNoTranslucentForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout; color: Integer); cdecl; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;I)V
    {class} procedure setColorForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout; color: Integer; statusBarAlpha: Integer); cdecl; overload; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;II)V
    {class} procedure setColorForDrawerLayoutDiff(activity: JActivity; drawerLayout: JDrawerLayout; color: Integer); cdecl; //Deprecated //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;I)V
    {class} procedure setTranslucentForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout); cdecl; overload; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;)V
    {class} procedure setTranslucentForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout; statusBarAlpha: Integer); cdecl; overload; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;I)V
    {class} procedure setTransparentForDrawerLayout(activity: JActivity; drawerLayout: JDrawerLayout); cdecl; //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;)V
    {class} procedure setTranslucentForDrawerLayoutDiff(activity: JActivity; drawerLayout: JDrawerLayout); cdecl; //Deprecated //(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;)V
    {class} procedure setTransparentForImageView(activity: JActivity; needOffsetView: JView); cdecl; //(Landroid/app/Activity;Landroid/view/View;)V
    {class} procedure setTranslucentForImageView(activity: JActivity; needOffsetView: JView); cdecl; overload; //(Landroid/app/Activity;Landroid/view/View;)V
    {class} procedure setTranslucentForImageView(activity: JActivity; statusBarAlpha: Integer; needOffsetView: JView); cdecl; overload; //(Landroid/app/Activity;ILandroid/view/View;)V
    {class} procedure setTranslucentForImageViewInFragment(activity: JActivity; needOffsetView: JView); cdecl; overload; //(Landroid/app/Activity;Landroid/view/View;)V
    {class} procedure setTransparentForImageViewInFragment(activity: JActivity; needOffsetView: JView); cdecl; //(Landroid/app/Activity;Landroid/view/View;)V
    {class} procedure setTranslucentForImageViewInFragment(activity: JActivity; statusBarAlpha: Integer; needOffsetView: JView); cdecl; overload; //(Landroid/app/Activity;ILandroid/view/View;)V
    {class} procedure hideFakeStatusBarView(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure setStatusBarLightMode(activity: JActivity; isLightMode: Boolean); cdecl; //(Landroid/app/Activity;Z)V
    {class} procedure setLightMode(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure setStatusBarDarkMode(activity: JActivity; isDarkMode: Boolean); cdecl; //(Landroid/app/Activity;Z)V
    {class} procedure setDarkMode(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} function getStatusBarHeight(mContext: JContext): Integer; cdecl; //(Landroid/content/Context;)I
    {class} procedure setViewToStatusBarHeight(mView: JView); cdecl; //(Landroid/view/View;)V
    {class} procedure fitPopupWindowOverStatusBar(mPopupWindow: JPopupWindow; needFullScreen: Boolean); cdecl; //(Landroid/widget/PopupWindow;Z)V
    {class} function getNavBarHeight(mContext: JContext): Integer; cdecl; //(Landroid/content/Context;)I

    { static Property }
    {class} property DEFAULT_STATUS_BAR_ALPHA: Integer read _GetDEFAULT_STATUS_BAR_ALPHA;
  end;

  [JavaSignature('com/devil/library/media/utils/StatusBarUtil')]
  JStatusBarUtil = interface(JObject)
  ['{CD7AAE9F-3BC6-4F5C-8213-A8AA3FFD4050}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStatusBarUtil = class(TJavaGenericImport<JStatusBarUtilClass, JStatusBarUtil>) end;

  JSystemUtilsClass = interface(JObjectClass)
  ['{4E2379B4-9235-4EF2-9A03-B9A4A2B40281}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSystemUtils; cdecl; //()V
    {class} function getSystemLanguage: JString; cdecl; //()Ljava/lang/String;
    {class} function getSystemLanguageList: TJavaObjectArray<JLocale>; cdecl; //()[Ljava/util/Locale;
    {class} function getSystemVersion: JString; cdecl; //()Ljava/lang/String;
    {class} function getSystemModel: JString; cdecl; //()Ljava/lang/String;
    {class} function getDeviceBrand: JString; cdecl; //()Ljava/lang/String;
    {class} function getIMEI(ctx: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/utils/SystemUtils')]
  JSystemUtils = interface(JObject)
  ['{D3BB13E9-82C6-4DBE-AFC2-1CDCCA2805DE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSystemUtils = class(TJavaGenericImport<JSystemUtilsClass, JSystemUtils>) end;

  JDividerGridItemDecorationClass = interface(JRecyclerView_ItemDecorationClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
  ['{57CE04FB-3A26-4A5B-85C3-8FFA82E8A973}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDividerGridItemDecoration; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/DividerGridItemDecoration')]
  JDividerGridItemDecoration = interface(JRecyclerView_ItemDecoration) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
  ['{AF3463E6-C463-4F8A-8F65-E2E5191683BC}']
    { Property Methods }

    { methods }
    procedure onDraw(c: JCanvas; parent: JRecyclerView; state: JRecyclerView_State); cdecl; //(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    procedure drawHorizontal(c: JCanvas; parent: JRecyclerView); cdecl; //(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;)V
    procedure drawVertical(c: JCanvas; parent: JRecyclerView); cdecl; //(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;)V
    procedure getItemOffsets(outRect: JRect; itemPosition: Integer; parent: JRecyclerView); cdecl; //(Landroid/graphics/Rect;ILandroidx/recyclerview/widget/RecyclerView;)V

    { Property }
  end;

  TJDividerGridItemDecoration = class(TJavaGenericImport<JDividerGridItemDecorationClass, JDividerGridItemDecoration>) end;

//  JDVImageSurfaceLayout_1Class = interface(JViewDragHelper_CallbackClass) // or JObjectClass // SuperSignature: androidx/customview/widget/ViewDragHelper$Callback
//  ['{10107A77-7C62-4344-9206-BFFD51BAF094}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/DVImageSurfaceLayout$1')]
//  JDVImageSurfaceLayout_1 = interface(JViewDragHelper_Callback) // or JObject // SuperSignature: androidx/customview/widget/ViewDragHelper$Callback
//  ['{E53CCFE1-80D7-4FFB-8DB2-0E8EF4D6123D}']
//    { Property Methods }
//
//    { methods }
//    function tryCaptureView(child: JView; pointerId: Integer): Boolean; cdecl; //(Landroid/view/View;I)Z
//    procedure onViewCaptured(capturedChild: JView; activePointerId: Integer); cdecl; //(Landroid/view/View;I)V
//    function clampViewPositionVertical(child: JView; top: Integer; dy: Integer): Integer; cdecl; //(Landroid/view/View;II)I
//    function clampViewPositionHorizontal(child: JView; left: Integer; dx: Integer): Integer; cdecl; //(Landroid/view/View;II)I
//    procedure onViewReleased(releasedChild: JView; xvel: Single; yvel: Single); cdecl; //(Landroid/view/View;FF)V
//
//    { Property }
//  end;

//  TJDVImageSurfaceLayout_1 = class(TJavaGenericImport<JDVImageSurfaceLayout_1Class, JDVImageSurfaceLayout_1>) end;

//  JDVImageSurfaceLayout_2Class = interface(JObjectClass)
//  ['{EA2073CD-D000-4976-A676-D6343C853308}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/DVImageSurfaceLayout$2')]
//  JDVImageSurfaceLayout_2 = interface(JObject)
//  ['{09B15554-750C-49D2-90CA-4F39B10F6D4D}']
//    { Property Methods }
//
//    { methods }
//    function onScale(detector: JScaleGestureDetector): Boolean; cdecl; //(Landroid/view/ScaleGestureDetector;)Z
//    function onScaleBegin(detector: JScaleGestureDetector): Boolean; cdecl; //(Landroid/view/ScaleGestureDetector;)Z
//    procedure onScaleEnd(detector: JScaleGestureDetector); cdecl; //(Landroid/view/ScaleGestureDetector;)V
//
//    { Property }
//  end;

//  TJDVImageSurfaceLayout_2 = class(TJavaGenericImport<JDVImageSurfaceLayout_2Class, JDVImageSurfaceLayout_2>) end;

  JDVImageSurfaceLayoutClass = interface(JLinearLayoutClass) // or JObjectClass // SuperSignature: android/widget/LinearLayout
  ['{FE8E5A23-8675-4DB6-9B33-77C8F2345509}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDVImageSurfaceLayout; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVImageSurfaceLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JDVImageSurfaceLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer; defStyleRes: Integer): JDVImageSurfaceLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/DVImageSurfaceLayout')]
  JDVImageSurfaceLayout = interface(JLinearLayout) // or JObject // SuperSignature: android/widget/LinearLayout
  ['{4F38EF33-2D8B-4AF0-BC7B-CD6E6E1844B7}']
    { Property Methods }

    { methods }
    function getSurfaceView: JDVImageSurfaceView; cdecl; //()Lcom/devil/library/media/view/DVImageSurfaceView;
    procedure setZoomEnable(enable: Boolean); cdecl; //(Z)V
    function onInterceptTouchEvent(ev: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setOnClickListener(listener: JView_OnClickListener); cdecl; //(Landroid/view/View$OnClickListener;)V
    procedure computeScroll; cdecl; //()V

    { Property }
  end;

  TJDVImageSurfaceLayout = class(TJavaGenericImport<JDVImageSurfaceLayoutClass, JDVImageSurfaceLayout>) end;

  JDVImageSurfaceViewClass = interface(JGLImageSurfaceViewClass) // or JObjectClass // SuperSignature: com/cgfay/filter/widget/GLImageSurfaceView
  ['{CDDD6B52-7478-45E2-8944-1DB85E8CCB53}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDVImageSurfaceView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVImageSurfaceView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/DVImageSurfaceView')]
  JDVImageSurfaceView = interface(JGLImageSurfaceView) // or JObject // SuperSignature: com/cgfay/filter/widget/GLImageSurfaceView
  ['{0F5DB161-37D2-4AA4-AAD5-BB895F2CB694}']
    { Property Methods }

    { methods }
    procedure setBitmap(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure setScaleType(scaleType: Integer); cdecl; //(I)V
    function getScaleType: Integer; cdecl; //()I
    procedure setZoomScale(mZoomScale: Single); cdecl; //(F)V

    { Property }
  end;

  TJDVImageSurfaceView = class(TJavaGenericImport<JDVImageSurfaceViewClass, JDVImageSurfaceView>) end;

  JDVZoomImageSurfaceViewClass = interface(JGLImageSurfaceViewClass) // or JObjectClass // SuperSignature: com/cgfay/filter/widget/GLImageSurfaceView
  ['{F864A0F8-8730-4064-8BF8-93752E6177EC}']
    { static Property Methods }
    {class} function _GetSCALE_MAX: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F

    { static Methods }
    {class} function init(context: JContext): JDVZoomImageSurfaceView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVZoomImageSurfaceView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V

    { static Property }
    {class} property SCALE_MAX: Single read _GetSCALE_MAX;
  end;

  [JavaSignature('com/devil/library/media/view/DVZoomImageSurfaceView')]
  JDVZoomImageSurfaceView = interface(JGLImageSurfaceView) // or JObject // SuperSignature: com/cgfay/filter/widget/GLImageSurfaceView
  ['{A092BEF4-526E-4B82-AFEF-4D99240962EB}']
    { Property Methods }

    { methods }
    procedure setIsCanTouch(canTouch: Boolean); cdecl; //(Z)V
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setPivot(x: Single; y: Single); cdecl; //(FF)V
    procedure setScale(scale: Single); cdecl; //(F)V
    procedure setInitScale; cdecl; //()V

    { Property }
  end;

  TJDVZoomImageSurfaceView = class(TJavaGenericImport<JDVZoomImageSurfaceViewClass, JDVZoomImageSurfaceView>) end;

//  JFadeInTextView_1Class = interface(JObjectClass)
//  ['{6A312B30-9DF5-4E20-BD87-B4FA0CFD56D9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/FadeInTextView$1')]
//  JFadeInTextView_1 = interface(JObject)
//  ['{CA869483-05B4-493F-BA55-22A3A5438E60}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(valueAnimator: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJFadeInTextView_1 = class(TJavaGenericImport<JFadeInTextView_1Class, JFadeInTextView_1>) end;

  JFadeInTextView_TextAnimationListenerClass = interface(JObjectClass)
  ['{00763698-6EEC-4E99-B8C3-63997EC8FC39}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/FadeInTextView$TextAnimationListener')]
  JFadeInTextView_TextAnimationListener = interface(IJavaInstance)
  ['{5E78D0A6-7FDF-427D-8E82-C4B1A6E12C7E}']
    { Property Methods }

    { methods }
    procedure animationFinish; cdecl; //()V

    { Property }
  end;

  TJFadeInTextView_TextAnimationListener = class(TJavaGenericImport<JFadeInTextView_TextAnimationListenerClass, JFadeInTextView_TextAnimationListener>) end;

  JFadeInTextViewClass = interface(JAppCompatTextViewClass) // or JObjectClass // SuperSignature: androidx/appcompat/widget/AppCompatTextView
  ['{F9679C48-8E9F-4623-8344-97A709154857}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JFadeInTextView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JFadeInTextView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/FadeInTextView')]
  JFadeInTextView = interface(JAppCompatTextView) // or JObject // SuperSignature: androidx/appcompat/widget/AppCompatTextView
  ['{E503A5B7-0FF9-4531-B401-1B0980CB3877}']
    { Property Methods }

    { methods }
    function setTextAnimationListener(textAnimationListener: JFadeInTextView_TextAnimationListener): JFadeInTextView; cdecl; //(Lcom/devil/library/media/view/FadeInTextView$TextAnimationListener;)Lcom/devil/library/media/view/FadeInTextView;
    function setTextString(textString: JString; flickerStr: JString): JFadeInTextView; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Lcom/devil/library/media/view/FadeInTextView;
    function setDuration(duration: Int64): JFadeInTextView; cdecl; //(J)Lcom/devil/library/media/view/FadeInTextView;
    function startFadeInAnimation: JFadeInTextView; cdecl; //()Lcom/devil/library/media/view/FadeInTextView;
    function isLoading: Boolean; cdecl; //()Z
    function stopFadeInAnimation: JFadeInTextView; cdecl; //()Lcom/devil/library/media/view/FadeInTextView;

    { Property }
  end;

  TJFadeInTextView = class(TJavaGenericImport<JFadeInTextViewClass, JFadeInTextView>) end;

//  JFilterAdjustView_1Class = interface(JObjectClass)
//  ['{1F22A102-4F3E-40FF-B023-CFBA98150217}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/FilterAdjustView$1')]
//  JFilterAdjustView_1 = interface(JObject)
//  ['{3599A122-37EE-4FC2-96E1-72618E64AF44}']
//    { Property Methods }
//
//    { methods }
//    procedure onCheckedChanged(group: JRadioGroup; checkedId: Integer); cdecl; //(Landroid/widget/RadioGroup;I)V
//
//    { Property }
//  end;

//  TJFilterAdjustView_1 = class(TJavaGenericImport<JFilterAdjustView_1Class, JFilterAdjustView_1>) end;

//  JFilterAdjustView_2Class = interface(JObjectClass)
//  ['{2ACC6EC2-4D27-4079-A0F8-F89DEB7C7189}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/FilterAdjustView$2')]
//  JFilterAdjustView_2 = interface(JObject)
//  ['{AA92CA02-9EAF-41BB-A39F-461F35DBF8C7}']
//    { Property Methods }
//
//    { methods }
//    procedure onSeekStopped(value: Single; step: Single); cdecl; //(FF)V
//    procedure onSeekChanged(value: Single; step: Single); cdecl; //(FF)V
//
//    { Property }
//  end;

//  TJFilterAdjustView_2 = class(TJavaGenericImport<JFilterAdjustView_2Class, JFilterAdjustView_2>) end;

  JFilterAdjustViewClass = interface(JLinearLayoutClass) // or JObjectClass // SuperSignature: android/widget/LinearLayout
  ['{7FE0BBAD-49FB-4295-964C-A856E2D3BF5A}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JFilterAdjustView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JFilterAdjustView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JFilterAdjustView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer; defStyleRes: Integer): JFilterAdjustView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/FilterAdjustView')]
  JFilterAdjustView = interface(JLinearLayout) // or JObject // SuperSignature: android/widget/LinearLayout
  ['{31E61630-8F7D-448A-9029-AB10ECFDE33E}']
    { Property Methods }

    { methods }
    procedure setOnAdjustChangeListener(listener: JOnAdjustChangeListener); cdecl; //(Lcom/devil/library/media/listener/OnAdjustChangeListener;)V

    { Property }
  end;

  TJFilterAdjustView = class(TJavaGenericImport<JFilterAdjustViewClass, JFilterAdjustView>) end;

//  JFilterToolView_1Class = interface(JObjectClass)
//  ['{7E64BA4F-7E87-4F8D-BAB7-0226C362945C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/FilterToolView$1')]
//  JFilterToolView_1 = interface(JObject)
//  ['{84BC9C0D-3CDC-4FA9-AC43-7F527C0E6EFD}']
//    { Property Methods }
//
//    { methods }
//    procedure onFilterChanged(resourceData: JResourceData); cdecl; //(Lcom/cgfay/filter/glfilter/resource/bean/ResourceData;)V
//
//    { Property }
//  end;

//  TJFilterToolView_1 = class(TJavaGenericImport<JFilterToolView_1Class, JFilterToolView_1>) end;

  JFilterToolViewClass = interface(JLinearLayoutClass) // or JObjectClass // SuperSignature: android/widget/LinearLayout
  ['{3C023192-E455-45EC-AE80-4BEE265A0F96}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JFilterToolView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JFilterToolView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JFilterToolView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer; defStyleRes: Integer): JFilterToolView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/FilterToolView')]
  JFilterToolView = interface(JLinearLayout) // or JObject // SuperSignature: android/widget/LinearLayout
  ['{A4327838-F907-4FD3-9A31-77A5E1D6F68B}']
    { Property Methods }

    { methods }
    procedure setOnFilterActionListener(listener: JOnFilterActionListener); cdecl; //(Lcom/devil/library/media/listener/OnFilterActionListener;)V
    procedure setOnlyShowFilter; cdecl; //()V
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
    procedure onCheckedChanged(group: JRadioGroup; checkedId: Integer); cdecl; //(Landroid/widget/RadioGroup;I)V
    procedure onAdjustChange(atype: JImageFilterType; value: Single); cdecl; //(Lcom/devil/library/media/enumtype/ImageFilterType;F)V

    { Property }
  end;

  TJFilterToolView = class(TJavaGenericImport<JFilterToolViewClass, JFilterToolView>) end;

//  JGraduallyTextView_1Class = interface(JObjectClass)
//  ['{4CF75945-C486-4180-BB33-74B973C765E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/GraduallyTextView$1')]
//  JGraduallyTextView_1 = interface(JObject)
//  ['{EA473A69-3DF1-47F8-B9EF-70D7B1F4BE31}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(animation: JValueAnimator); cdecl; //(Landroid/animation/ValueAnimator;)V
//
//    { Property }
//  end;

//  TJGraduallyTextView_1 = class(TJavaGenericImport<JGraduallyTextView_1Class, JGraduallyTextView_1>) end;

  JGraduallyTextViewClass = interface(JAppCompatEditTextClass) // or JObjectClass // SuperSignature: androidx/appcompat/widget/AppCompatEditText
  ['{C57C34FA-18F9-42E8-978F-EB5C973B7A08}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JGraduallyTextView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JGraduallyTextView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JGraduallyTextView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/GraduallyTextView')]
  JGraduallyTextView = interface(JAppCompatEditText) // or JObject // SuperSignature: androidx/appcompat/widget/AppCompatEditText
  ['{52BA797B-CE03-49DD-B285-7F947B2DB1D5}']
    { Property Methods }

    { methods }
    procedure init; cdecl; overload; //()V
    procedure startLoading; cdecl; //()V
    function isLoading: Boolean; cdecl; //()Z
    procedure stopLoading; cdecl; //()V
    procedure setDuration(duration: Integer); cdecl; //(I)V

    { Property }
  end;

  TJGraduallyTextView = class(TJavaGenericImport<JGraduallyTextViewClass, JGraduallyTextView>) end;

  JHackyViewPagerClass = interface(JViewPagerClass) // or JObjectClass // SuperSignature: androidx/viewpager/widget/ViewPager
  ['{21E22C97-5B72-44A3-983C-A1F87CFBC89A}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JHackyViewPager; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JHackyViewPager; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/HackyViewPager')]
  JHackyViewPager = interface(JViewPager) // or JObject // SuperSignature: androidx/viewpager/widget/ViewPager
  ['{1FBCB3F7-7336-4766-9AEC-1A18853CD5F4}']
    { Property Methods }

    { methods }
    function onInterceptTouchEvent(ev: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z

    { Property }
  end;

  TJHackyViewPager = class(TJavaGenericImport<JHackyViewPagerClass, JHackyViewPager>) end;

  JRatioImageViewClass = interface(JAppCompatImageViewClass) // or JObjectClass // SuperSignature: androidx/appcompat/widget/AppCompatImageView
  ['{3776EF69-34DA-4B18-8724-7F22E61971E5}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JRatioImageView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet): JRatioImageView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext): JRatioImageView; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/RatioImageView')]
  JRatioImageView = interface(JAppCompatImageView) // or JObject // SuperSignature: androidx/appcompat/widget/AppCompatImageView
  ['{C479B095-4834-400C-8C5D-C7ED738F1C90}']
    { Property Methods }

    { methods }
    procedure setRatio(ratio: Single); cdecl; //(F)V

    { Property }
  end;

  TJRatioImageView = class(TJavaGenericImport<JRatioImageViewClass, JRatioImageView>) end;

  JSquareRelativeLayoutClass = interface(JRelativeLayoutClass) // or JObjectClass // SuperSignature: android/widget/RelativeLayout
  ['{1F3EA50D-F711-409E-9D3B-5B2BA48EC74F}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext): JSquareRelativeLayout; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/SquareRelativeLayout')]
  JSquareRelativeLayout = interface(JRelativeLayout) // or JObject // SuperSignature: android/widget/RelativeLayout
  ['{92CE3BAD-2C43-4F94-8F81-CCA6D044FB15}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSquareRelativeLayout = class(TJavaGenericImport<JSquareRelativeLayoutClass, JSquareRelativeLayout>) end;

//  JTipLoadDialog_1Class = interface(JObjectClass)
//  ['{94FED4C0-FF0B-4019-B909-6CBAB72B8819}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/TipLoadDialog$1')]
//  JTipLoadDialog_1 = interface(JObject)
//  ['{86FE1B03-21B9-4C89-AE94-CF2CCB53FCCA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJTipLoadDialog_1 = class(TJavaGenericImport<JTipLoadDialog_1Class, JTipLoadDialog_1>) end;

//  JTipLoadDialog_2Class = interface(JObjectClass)
//  ['{C00353D2-9042-4B90-82F9-CB56D95A5D3E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/media/view/TipLoadDialog$2')]
//  JTipLoadDialog_2 = interface(JObject)
//  ['{3A667931-C356-4498-AED4-F86B7472F3D5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJTipLoadDialog_2 = class(TJavaGenericImport<JTipLoadDialog_2Class, JTipLoadDialog_2>) end;

  JTipLoadDialog_DismissListenerClass = interface(JObjectClass)
  ['{81C3E2B5-5FAE-430C-90A3-F3262B9CFFEA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TipLoadDialog$DismissListener')]
  JTipLoadDialog_DismissListener = interface(IJavaInstance)
  ['{3BD5A5C8-3AAE-46DE-B8D3-B67BAAC64917}']
    { Property Methods }

    { methods }
    procedure onDimissListener; cdecl; //()V

    { Property }
  end;

  TJTipLoadDialog_DismissListener = class(TJavaGenericImport<JTipLoadDialog_DismissListenerClass, JTipLoadDialog_DismissListener>) end;

  JTipLoadDialog_MyDialogClass = interface(JDialogClass) // or JObjectClass // SuperSignature: android/app/Dialog
  ['{F8BC7525-F5B1-4DDF-98B2-8E8A4D3585E1}']
    { static Property Methods }

    { static Methods }
    {class} function init(this$0: JTipLoadDialog; context: JContext; themeResId: Integer): JTipLoadDialog_MyDialog; cdecl; //(Lcom/devil/library/media/view/TipLoadDialog;Landroid/content/Context;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TipLoadDialog$MyDialog')]
  JTipLoadDialog_MyDialog = interface(JDialog) // or JObject // SuperSignature: android/app/Dialog
  ['{6D205078-6F31-4BD7-B4AD-721D25FFF334}']
    { Property Methods }

    { methods }
    function onKeyDown(keyCode: Integer; event: JKeyEvent): Boolean; cdecl; //(ILandroid/view/KeyEvent;)Z

    { Property }
  end;

  TJTipLoadDialog_MyDialog = class(TJavaGenericImport<JTipLoadDialog_MyDialogClass, JTipLoadDialog_MyDialog>) end;

  JTipLoadDialogClass = interface(JObjectClass)
  ['{63CA824E-CCE1-4B9C-AEC5-A0F1548C1018}']
    { static Property Methods }
    {class} function _GetICON_TYPE_NOTHING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetICON_TYPE_LOADING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetICON_TYPE_LOADING2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetICON_TYPE_SUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetICON_TYPE_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetICON_TYPE_INFO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JTipLoadDialog; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; info: JString; atype: Integer): JTipLoadDialog; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;I)V

    { static Property }
    {class} property ICON_TYPE_NOTHING: Integer read _GetICON_TYPE_NOTHING;
    {class} property ICON_TYPE_LOADING: Integer read _GetICON_TYPE_LOADING;
    {class} property ICON_TYPE_LOADING2: Integer read _GetICON_TYPE_LOADING2;
    {class} property ICON_TYPE_SUCCESS: Integer read _GetICON_TYPE_SUCCESS;
    {class} property ICON_TYPE_FAIL: Integer read _GetICON_TYPE_FAIL;
    {class} property ICON_TYPE_INFO: Integer read _GetICON_TYPE_INFO;
  end;

  [JavaSignature('com/devil/library/media/view/TipLoadDialog')]
  JTipLoadDialog = interface(JObject)
  ['{0A5248F3-35AB-4BBD-97D1-FFFE85F8B969}']
    { Property Methods }
    function _GetSUCCESS_ICON: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetSUCCESS_ICON(aSUCCESS_ICON: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetERROR_ICON: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetERROR_ICON(aERROR_ICON: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetINFO_ICON: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetINFO_ICON(aINFO_ICON: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    function setDismissListener(dismissListener: JTipLoadDialog_DismissListener): JTipLoadDialog; cdecl; //(Lcom/devil/library/media/view/TipLoadDialog$DismissListener;)Lcom/devil/library/media/view/TipLoadDialog;
    procedure setFullScreenFlags; cdecl; //()V
    function setSuccessIcon(resId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setErrorIcon(resId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setInfoIcon(resId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setMsgAndType(info: JString; atype: Integer): JTipLoadDialog; cdecl; //(Ljava/lang/String;I)Lcom/devil/library/media/view/TipLoadDialog;
    function setBackground(drawableId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setNoShadowTheme: JTipLoadDialog; cdecl; //()Lcom/devil/library/media/view/TipLoadDialog;
    function setShadowTheme: JTipLoadDialog; cdecl; //()Lcom/devil/library/media/view/TipLoadDialog;
    function setDialogTheme(themeId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setMsgColor(resColorId: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setMsgSize(sp: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setProgressbarColor(color: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setLoadingTextColor(color: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setLoadingTextSize(sp: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setLoadingTime(duration: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    function setTipTime(duration: Integer): JTipLoadDialog; cdecl; //(I)Lcom/devil/library/media/view/TipLoadDialog;
    procedure setCancelable(flag: Boolean); cdecl; //(Z)V
    procedure setCanceledOnTouchOutside(cancel: Boolean); cdecl; //(Z)V
    function isShowing: Boolean; cdecl; //()Z
    procedure show; cdecl; //()V
    procedure dismiss; cdecl; //()V

    { Property }
    property SUCCESS_ICON: Integer read _GetSUCCESS_ICON write _SetSUCCESS_ICON;
    property ERROR_ICON: Integer read _GetERROR_ICON write _SetERROR_ICON;
    property INFO_ICON: Integer read _GetINFO_ICON write _SetINFO_ICON;
  end;

  TJTipLoadDialog = class(TJavaGenericImport<JTipLoadDialogClass, JTipLoadDialog>) end;

  JTwoLineSeekBar_OnSeekChangeListenerClass = interface(JObjectClass)
  ['{F3BD8912-2526-4E31-AC5C-273F6E476DBA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TwoLineSeekBar$OnSeekChangeListener')]
  JTwoLineSeekBar_OnSeekChangeListener = interface(IJavaInstance)
  ['{AC9DA167-02D6-41FE-8535-EF0B2BBEFA49}']
    { Property Methods }

    { methods }
    procedure onSeekChanged(P1: Single; P2: Single); cdecl; //(FF)V
    procedure onSeekStopped(P1: Single; P2: Single); cdecl; //(FF)V

    { Property }
  end;

  TJTwoLineSeekBar_OnSeekChangeListener = class(TJavaGenericImport<JTwoLineSeekBar_OnSeekChangeListenerClass, JTwoLineSeekBar_OnSeekChangeListener>) end;

  JTwoLineSeekBar_OnSeekDefaultListenerClass = interface(JObjectClass)
  ['{062A47DC-CA41-4D93-83FC-CD6B809165E4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TwoLineSeekBar$OnSeekDefaultListener')]
  JTwoLineSeekBar_OnSeekDefaultListener = interface(IJavaInstance)
  ['{921A0E3F-CD28-458F-AB23-87B6D5FD6897}']
    { Property Methods }

    { methods }
    procedure onSeekDefaulted(P1: Single); cdecl; //(F)V

    { Property }
  end;

  TJTwoLineSeekBar_OnSeekDefaultListener = class(TJavaGenericImport<JTwoLineSeekBar_OnSeekDefaultListenerClass, JTwoLineSeekBar_OnSeekDefaultListener>) end;

  JTwoLineSeekBar_OnSeekDownListenerClass = interface(JObjectClass)
  ['{43A7E522-AFEC-4F6B-84D8-DFAD4785BB9E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TwoLineSeekBar$OnSeekDownListener')]
  JTwoLineSeekBar_OnSeekDownListener = interface(IJavaInstance)
  ['{1EFF8D75-297F-4843-B389-957282FA738D}']
    { Property Methods }

    { methods }
    procedure onSeekDown; cdecl; //()V

    { Property }
  end;

  TJTwoLineSeekBar_OnSeekDownListener = class(TJavaGenericImport<JTwoLineSeekBar_OnSeekDownListenerClass, JTwoLineSeekBar_OnSeekDownListener>) end;

  JTwoLineSeekBar_SeekBarGestureListenerClass = interface(JGestureDetector_SimpleOnGestureListenerClass) // or JObjectClass // SuperSignature: android/view/GestureDetector$SimpleOnGestureListener
  ['{ADD28ADD-91F7-4896-BBD0-DA947FA156F6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TwoLineSeekBar$SeekBarGestureListener')]
  JTwoLineSeekBar_SeekBarGestureListener = interface(JGestureDetector_SimpleOnGestureListener) // or JObject // SuperSignature: android/view/GestureDetector$SimpleOnGestureListener
  ['{32316BDC-CF1B-46D2-8468-611881E97503}']
    { Property Methods }

    { methods }
    function onUp(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    function onDown(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    function onScroll(e1: JMotionEvent; e2: JMotionEvent; distanceX: Single; distanceY: Single): Boolean; cdecl; //(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    function onSingleTapUp(e: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z

    { Property }
  end;

  TJTwoLineSeekBar_SeekBarGestureListener = class(TJavaGenericImport<JTwoLineSeekBar_SeekBarGestureListenerClass, JTwoLineSeekBar_SeekBarGestureListener>) end;

  JTwoLineSeekBarClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{C6656512-8BB9-43DE-8042-5235D05B8EB0}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; attrs: JAttributeSet): JTwoLineSeekBar; cdecl; //(Landroid/content/Context;Landroid/util/AttributeSet;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/view/TwoLineSeekBar')]
  JTwoLineSeekBar = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{19E451E4-8F34-41E0-BF66-809608D8424C}']
    { Property Methods }

    { methods }
    function dpToPixel(dp: Single): Single; cdecl; //(F)F
    procedure setSingleTapSupport(support: Boolean); cdecl; //(Z)V
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setLineColor(color: JString); cdecl; //(Ljava/lang/String;)V
    procedure setBaseLineColor(color: JString); cdecl; //(Ljava/lang/String;)V
    procedure setThumbColor(color: JString); cdecl; //(Ljava/lang/String;)V
    procedure setEnabled(enabled: Boolean); cdecl; //(Z)V
    procedure setThumbSize(size: Single); cdecl; //(F)V
    procedure setSeekLength(startValue: Integer; endValue: Integer; circleValue: Integer; step: Single); cdecl; //(IIIF)V
    procedure setDefaultValue(value: Single); cdecl; //(F)V
    function getValue: Single; cdecl; //()F
    procedure setValue(value: Single); cdecl; //(F)V
    procedure setOnSeekChangeListener(listener: JTwoLineSeekBar_OnSeekChangeListener); cdecl; //(Lcom/devil/library/media/view/TwoLineSeekBar$OnSeekChangeListener;)V
    function getOnSeekChangeListener: JTwoLineSeekBar_OnSeekChangeListener; cdecl; //()Lcom/devil/library/media/view/TwoLineSeekBar$OnSeekChangeListener;
    procedure setOnDefaultListener(listener: JTwoLineSeekBar_OnSeekDefaultListener); cdecl; //(Lcom/devil/library/media/view/TwoLineSeekBar$OnSeekDefaultListener;)V
    procedure setOnSeekDownListener(listener: JTwoLineSeekBar_OnSeekDownListener); cdecl; //(Lcom/devil/library/media/view/TwoLineSeekBar$OnSeekDownListener;)V
    procedure reset; cdecl; //()V
    procedure setIsGlobalDrag(mIsGlobalDrag: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJTwoLineSeekBar = class(TJavaGenericImport<JTwoLineSeekBarClass, JTwoLineSeekBar>) end;

  JVideoTrimAdapter_TrimmerViewHolderClass = interface(JRecyclerView_ViewHolderClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{9EED0390-6F34-4C1A-BC54-930C5F281763}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/adapter/VideoTrimAdapter$TrimmerViewHolder')]
  JVideoTrimAdapter_TrimmerViewHolder = interface(JRecyclerView_ViewHolder) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ViewHolder
  ['{912966E3-35CB-4896-A2CE-942069BC7849}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVideoTrimAdapter_TrimmerViewHolder = class(TJavaGenericImport<JVideoTrimAdapter_TrimmerViewHolderClass, JVideoTrimAdapter_TrimmerViewHolder>) end;

  JVideoTrimAdapterClass = interface(JRecyclerView_AdapterClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{570A5176-A053-42EE-9E7B-B23376F40507}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JVideoTrimAdapter; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/adapter/VideoTrimAdapter')]
  JVideoTrimAdapter = interface(JRecyclerView_Adapter) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$Adapter
  ['{2A402421-BC92-4B97-9887-639E714C1E94}']
    { Property Methods }

    { methods }
    function onCreateViewHolder(parent: JViewGroup; viewType: Integer): JRecyclerView_ViewHolder; cdecl; //(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    procedure onBindViewHolder(holder: JRecyclerView_ViewHolder; position: Integer); cdecl; //(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    function getItemCount: Integer; cdecl; //()I
    procedure addBitmaps(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJVideoTrimAdapter = class(TJavaGenericImport<JVideoTrimAdapterClass, JVideoTrimAdapter>) end;

  JVideoCropFrameInfoClass = interface(JObjectClass)
  ['{C5983703-88E7-44A7-ADC9-4ECC8ED127D7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVideoCropFrameInfo; cdecl; //()V
    {class} function timeArray2Info(videoPath: JString; saveDir: JString; frameTimeArray: TJavaArray<Int64>): JList; cdecl; //(Ljava/lang/String;Ljava/lang/String;[J)Ljava/util/List;

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/bean/VideoCropFrameInfo')]
  JVideoCropFrameInfo = interface(JObject)
  ['{81930B8E-7F2E-4C28-9E25-06153FB29FE1}']
    { Property Methods }
    function _GetvideoPath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetvideoPath(avideoPath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetsavePath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetsavePath(asavePath: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcropFrameTime: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    procedure _SetcropFrameTime(acropFrameTime: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V

    { methods }

    { Property }
    property videoPath: JString read _GetvideoPath write _SetvideoPath;
    property savePath: JString read _GetsavePath write _SetsavePath;
    property cropFrameTime: Int64 read _GetcropFrameTime write _SetcropFrameTime;
  end;

  TJVideoCropFrameInfo = class(TJavaGenericImport<JVideoCropFrameInfoClass, JVideoCropFrameInfo>) end;

  JAbstractPlayerClass = interface(JObjectClass)
  ['{B7786547-857C-4461-953D-4C9E1CDF4D47}']
    { static Property Methods }
    {class} function _GetMEDIA_INFO_VIDEO_RENDERING_START: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMEDIA_INFO_VIDEO_ROTATION_CHANGED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JAbstractPlayer; cdecl; //()V

    { static Property }
    {class} property MEDIA_INFO_VIDEO_RENDERING_START: Integer read _GetMEDIA_INFO_VIDEO_RENDERING_START;
    {class} property MEDIA_INFO_VIDEO_ROTATION_CHANGED: Integer read _GetMEDIA_INFO_VIDEO_ROTATION_CHANGED;
  end;

  [JavaSignature('com/devil/library/video/common/AbstractPlayer')]
  JAbstractPlayer = interface(JObject)
  ['{420CDA13-61BD-490E-9633-385BBF69CC9C}']
    { Property Methods }

    { methods }
    procedure setPlayerEventListener(listener: JOnPlayerEventListener); cdecl; //(Lcom/devil/library/video/listener/OnPlayerEventListener;)V

    { Property }
  end;

  TJAbstractPlayer = class(TJavaGenericImport<JAbstractPlayerClass, JAbstractPlayer>) end;

//  JAndroidMediaPlayer_1Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{2BDEC188-459A-4366-A17E-3D6B4DE903AF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$1')]
//  JAndroidMediaPlayer_1 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{89AE3C57-DE0E-44F0-A79C-2B823A4E6C67}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_1 = class(TJavaGenericImport<JAndroidMediaPlayer_1Class, JAndroidMediaPlayer_1>) end;

//  JAndroidMediaPlayer_2Class = interface(JObjectClass)
//  ['{5F9DBE3D-878E-498F-8ED7-2E2F549596A7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$2')]
//  JAndroidMediaPlayer_2 = interface(JObject)
//  ['{3CA70BBA-8AA9-45B8-95E0-032A1CC29595}']
//    { Property Methods }
//
//    { methods }
//    function onError(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl; //(Landroid/media/MediaPlayer;II)Z
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_2 = class(TJavaGenericImport<JAndroidMediaPlayer_2Class, JAndroidMediaPlayer_2>) end;

//  JAndroidMediaPlayer_3Class = interface(JObjectClass)
//  ['{B576636D-48FD-4D58-A524-8B1E0468ACB7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$3')]
//  JAndroidMediaPlayer_3 = interface(JObject)
//  ['{76092BBF-E24D-48DC-BDA3-A64221B6BE93}']
//    { Property Methods }
//
//    { methods }
//    procedure onCompletion(mp: JMediaPlayer); cdecl; //(Landroid/media/MediaPlayer;)V
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_3 = class(TJavaGenericImport<JAndroidMediaPlayer_3Class, JAndroidMediaPlayer_3>) end;

//  JAndroidMediaPlayer_4Class = interface(JObjectClass)
//  ['{7B5D1E5A-221A-4C5C-AC7D-F5ED58271F32}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$4')]
//  JAndroidMediaPlayer_4 = interface(JObject)
//  ['{8B6E6236-9337-41D1-99DB-CF58460B11DA}']
//    { Property Methods }
//
//    { methods }
//    function onInfo(mp: JMediaPlayer; what: Integer; extra: Integer): Boolean; cdecl; //(Landroid/media/MediaPlayer;II)Z
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_4 = class(TJavaGenericImport<JAndroidMediaPlayer_4Class, JAndroidMediaPlayer_4>) end;

//  JAndroidMediaPlayer_5Class = interface(JObjectClass)
//  ['{ECBBC709-96FA-4615-AFBA-5E301D09F956}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$5')]
//  JAndroidMediaPlayer_5 = interface(JObject)
//  ['{86D4114A-4217-4FBA-B237-C574D894D9DE}']
//    { Property Methods }
//
//    { methods }
//    procedure onBufferingUpdate(mp: JMediaPlayer; percent: Integer); cdecl; //(Landroid/media/MediaPlayer;I)V
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_5 = class(TJavaGenericImport<JAndroidMediaPlayer_5Class, JAndroidMediaPlayer_5>) end;

//  JAndroidMediaPlayer_6Class = interface(JObjectClass)
//  ['{76A1F424-6F2C-4358-B2DF-CC200DB69BC1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$6')]
//  JAndroidMediaPlayer_6 = interface(JObject)
//  ['{DCDFEE4B-A3A3-46DF-B00B-545BE8F7912C}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared(mp: JMediaPlayer); cdecl; //(Landroid/media/MediaPlayer;)V
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_6 = class(TJavaGenericImport<JAndroidMediaPlayer_6Class, JAndroidMediaPlayer_6>) end;

//  JAndroidMediaPlayer_7Class = interface(JObjectClass)
//  ['{3FEC6DE9-AA57-480B-9E70-EB5D3E8114CB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer$7')]
//  JAndroidMediaPlayer_7 = interface(JObject)
//  ['{1A3580F2-848A-4CCD-A07F-9B212BF6A865}']
//    { Property Methods }
//
//    { methods }
//    procedure onVideoSizeChanged(mp: JMediaPlayer; width: Integer; height: Integer); cdecl; //(Landroid/media/MediaPlayer;II)V
//
//    { Property }
//  end;

//  TJAndroidMediaPlayer_7 = class(TJavaGenericImport<JAndroidMediaPlayer_7Class, JAndroidMediaPlayer_7>) end;

  JAndroidMediaPlayerClass = interface(JAbstractPlayerClass) // or JObjectClass // SuperSignature: com/devil/library/video/common/AbstractPlayer
  ['{F9D1B879-ED5B-49A4-BF39-ABF49E518171}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JAndroidMediaPlayer; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/common/AndroidMediaPlayer')]
  JAndroidMediaPlayer = interface(JAbstractPlayer) // or JObject // SuperSignature: com/devil/library/video/common/AbstractPlayer
  ['{1F351C21-DC55-42F4-916E-5474F51E398C}']
    { Property Methods }

    { methods }
    procedure initPlayer; cdecl; //()V
    procedure setDataSource(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure start; cdecl; //()V
    procedure pause; cdecl; //()V
    procedure stop; cdecl; //()V
    procedure prepareAsync; cdecl; //()V
    procedure reset; cdecl; //()V
    procedure setLoop(isLoop: Boolean); cdecl; //(Z)V
    function isPlaying: Boolean; cdecl; //()Z
    procedure seekTo(time: Int64); cdecl; //(J)V
    procedure release; cdecl; //()V
    function getCurrentPosition: Int64; cdecl; //()J
    function getDuration: Int64; cdecl; //()J
    procedure setSurface(surface: JSurface); cdecl; //(Landroid/view/Surface;)V
    procedure setDisplay(holder: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V

    { Property }
  end;

  TJAndroidMediaPlayer = class(TJavaGenericImport<JAndroidMediaPlayerClass, JAndroidMediaPlayer>) end;

  JIMediaPlayerClass = interface(JObjectClass)
  ['{47959E2B-A598-411A-8FEE-FEF1099E9593}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/common/IMediaPlayer')]
  JIMediaPlayer = interface(IJavaInstance)
  ['{204C16AD-59BB-44CA-8C73-8D5CAA1AFF42}']
    { Property Methods }

    { methods }
    procedure initPlayer; cdecl; //()V
    procedure setDataSource(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure setSurface(P1: JSurface); cdecl; //(Landroid/view/Surface;)V
    procedure setDisplay(P1: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
    function getDuration: Int64; cdecl; //()J
    function getCurrentPosition: Int64; cdecl; //()J
    procedure prepareAsync; cdecl; //()V
    procedure pause; cdecl; //()V
    procedure stop; cdecl; //()V
    procedure start; cdecl; //()V
    procedure reset; cdecl; //()V
    procedure setLoop(P1: Boolean); cdecl; //(Z)V
    function isPlaying: Boolean; cdecl; //()Z
    procedure seekTo(P1: Int64); cdecl; //(J)V
    procedure setPlayerEventListener(P1: JOnPlayerEventListener); cdecl; //(Lcom/devil/library/video/listener/OnPlayerEventListener;)V
    procedure release; cdecl; //()V

    { Property }
  end;

  TJIMediaPlayer = class(TJavaGenericImport<JIMediaPlayerClass, JIMediaPlayer>) end;

  JOnGetVideoFrameListenerClass = interface(JObjectClass)
  ['{FC0FA1E8-18D2-429A-AA46-DAE3745EB6C2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/listener/OnGetVideoFrameListener')]
  JOnGetVideoFrameListener = interface(IJavaInstance)
  ['{1F01BC0C-26F1-4B24-A13D-1C3D1A31B7D3}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JString; P2: Integer; P3: Boolean); cdecl; //(Ljava/lang/String;IZ)V
    procedure onFailure; cdecl; //()V

    { Property }
  end;

  TJOnGetVideoFrameListener = class(TJavaGenericImport<JOnGetVideoFrameListenerClass, JOnGetVideoFrameListener>) end;

  JOnPlayerEventListenerClass = interface(JObjectClass)
  ['{07225619-54A9-4B62-B602-E63448A83FD6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/listener/OnPlayerEventListener')]
  JOnPlayerEventListener = interface(IJavaInstance)
  ['{BB4BB638-1E81-4A06-BFAD-831BC4705477}']
    { Property Methods }

    { methods }
    procedure onError; cdecl; //()V
    procedure onCompletion; cdecl; //()V
    procedure onInfo(P1: Integer; P2: Integer); cdecl; //(II)V
    procedure onPrepared; cdecl; //()V
    procedure onVideoSizeChanged(P1: Integer; P2: Integer); cdecl; //(II)V

    { Property }
  end;

  TJOnPlayerEventListener = class(TJavaGenericImport<JOnPlayerEventListenerClass, JOnPlayerEventListener>) end;

  JOnSelectVideoTrimListenerClass = interface(JObjectClass)
  ['{EB110791-ED49-4B4F-AE9F-9CD0561E51AB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/listener/OnSelectVideoTrimListener')]
  JOnSelectVideoTrimListener = interface(IJavaInstance)
  ['{2AA5C52D-6B37-48CD-ACF9-75FAAEE89A33}']
    { Property Methods }

    { methods }
    procedure onCancelSelect; cdecl; //()V
    procedure onAlreadySelect(P1: JString; P2: Int64; P3: Int64; P4: Int64); cdecl; //(Ljava/lang/String;JJJ)V

    { Property }
  end;

  TJOnSelectVideoTrimListener = class(TJavaGenericImport<JOnSelectVideoTrimListenerClass, JOnSelectVideoTrimListener>) end;

  JOnVideoTrimListenerClass = interface(JObjectClass)
  ['{569A537A-295C-4A2F-BC4D-AB3522142BCF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/listener/OnVideoTrimListener')]
  JOnVideoTrimListener = interface(IJavaInstance)
  ['{5ED21605-3079-4540-A79B-A0EDC1844CF3}']
    { Property Methods }

    { methods }
    procedure onVideoTrimSuccess(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure onVideoTrimError(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure onVideoTrimCancel; cdecl; //()V
    procedure onVideoTrimProgress(P1: Single); cdecl; //(F)V

    { Property }
  end;

  TJOnVideoTrimListener = class(TJavaGenericImport<JOnVideoTrimListenerClass, JOnVideoTrimListener>) end;

  JSingleCallbackClass = interface(JObjectClass)
  ['{4B3BFDC7-8212-47C6-BAC3-9ADB505C8662}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/listener/SingleCallback')]
  JSingleCallback = interface(IJavaInstance)
  ['{B0156AAA-0E53-4D1B-B8F5-DE166DFF0592}']
    { Property Methods }

    { methods }
    procedure onSingleCallback(P1: JObject; P2: JObject); cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)V

    { Property }
  end;

  TJSingleCallback = class(TJavaGenericImport<JSingleCallbackClass, JSingleCallback>) end;

//  JDVVideoCropActivity_1Class = interface(JObjectClass)
//  ['{03C21FF1-A8AB-4913-A81A-CDE7DBB4CFCB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$1')]
//  JDVVideoCropActivity_1 = interface(JObject)
//  ['{F5CB7143-9735-4B9E-BFF6-8166D2E86D85}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_1 = class(TJavaGenericImport<JDVVideoCropActivity_1Class, JDVVideoCropActivity_1>) end;

//  JDVVideoCropActivity_2_1Class = interface(JObjectClass)
//  ['{8FF3480A-FC4A-4327-94E9-7B729506A7C3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$2$1')]
//  JDVVideoCropActivity_2_1 = interface(JObject)
//  ['{0E8EE0FE-3876-401D-A440-0995F8852FB9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_2_1 = class(TJavaGenericImport<JDVVideoCropActivity_2_1Class, JDVVideoCropActivity_2_1>) end;

//  JDVVideoCropActivity_2_2Class = interface(JObjectClass)
//  ['{A5A9A002-AAE2-47A7-B802-84D9FFE087A5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$2$2')]
//  JDVVideoCropActivity_2_2 = interface(JObject)
//  ['{50494858-3D14-43FF-8678-FBE6300A63B0}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_2_2 = class(TJavaGenericImport<JDVVideoCropActivity_2_2Class, JDVVideoCropActivity_2_2>) end;

//  JDVVideoCropActivity_2_3Class = interface(JObjectClass)
//  ['{645C9ED3-B610-4D1D-B2C5-A6823B8A1625}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$2$3')]
//  JDVVideoCropActivity_2_3 = interface(JObject)
//  ['{BA1770AD-1443-4E0F-9658-DDF3DD0048F1}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_2_3 = class(TJavaGenericImport<JDVVideoCropActivity_2_3Class, JDVVideoCropActivity_2_3>) end;

//  JDVVideoCropActivity_2Class = interface(JObjectClass)
//  ['{C6E0B4B0-9F16-43AD-BEC9-D5C792A77757}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$2')]
//  JDVVideoCropActivity_2 = interface(JObject)
//  ['{2439C7E2-B74C-4509-BDD5-075697CCC251}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess; cdecl; //()V
//    procedure onFailure; cdecl; //()V
//    procedure onProgress(progress: Single); cdecl; //(F)V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_2 = class(TJavaGenericImport<JDVVideoCropActivity_2Class, JDVVideoCropActivity_2>) end;

//  JDVVideoCropActivity_3Class = interface(JObjectClass)
//  ['{76E402E9-5297-4274-A7B3-F8F54BBAB59C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity$3')]
//  JDVVideoCropActivity_3 = interface(JObject)
//  ['{25408B12-3CF5-49B0-A8BC-97419B041299}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoCropActivity_3 = class(TJavaGenericImport<JDVVideoCropActivity_3Class, JDVVideoCropActivity_3>) end;

  JDVVideoCropActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{688B3120-C6FE-4E6A-8F59-CC8C89EC2CDF}']
    { static Property Methods }
    {class} function _GetvideoTrimListener: JOnVideoTrimListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/listener/OnVideoTrimListener;

    { static Methods }
    {class} function init: JDVVideoCropActivity; cdecl; //()V

    { static Property }
    {class} property videoTrimListener: JOnVideoTrimListener read _GetvideoTrimListener;
  end;

  [JavaSignature('com/devil/library/video/ui/DVVideoCropActivity')]
  JDVVideoCropActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{D5715DEA-67EA-4BEA-8503-C0EDCA890804}']
    { Property Methods }

    { methods }
    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJDVVideoCropActivity = class(TJavaGenericImport<JDVVideoCropActivityClass, JDVVideoCropActivity>) end;

//  JDVVideoTrimActivity_1Class = interface(JObjectClass)
//  ['{E827D2C0-86EA-4D0F-BD64-5E6C754B6017}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$1')]
//  JDVVideoTrimActivity_1 = interface(JObject)
//  ['{4663A799-9E20-4BE1-98AB-9DD911FEDD3F}']
//    { Property Methods }
//
//    { methods }
//    procedure onPermissionGranted; cdecl; //()V
//    procedure onPermissionDenied; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_1 = class(TJavaGenericImport<JDVVideoTrimActivity_1Class, JDVVideoTrimActivity_1>) end;

//  JDVVideoTrimActivity_2_1Class = interface(JObjectClass)
//  ['{8E5D185B-503E-4125-ACF7-544543C1AB77}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$2$1')]
//  JDVVideoTrimActivity_2_1 = interface(JObject)
//  ['{AD7EC3CD-D07F-4804-9721-15DECD389090}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_2_1 = class(TJavaGenericImport<JDVVideoTrimActivity_2_1Class, JDVVideoTrimActivity_2_1>) end;

//  JDVVideoTrimActivity_2_2Class = interface(JObjectClass)
//  ['{E5CE2D65-468C-4A9C-9B8F-9D055E89C8DD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$2$2')]
//  JDVVideoTrimActivity_2_2 = interface(JObject)
//  ['{772D22D4-BC46-4844-BE9E-A926BA0D6526}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_2_2 = class(TJavaGenericImport<JDVVideoTrimActivity_2_2Class, JDVVideoTrimActivity_2_2>) end;

//  JDVVideoTrimActivity_2_3Class = interface(JObjectClass)
//  ['{69E4D027-7880-494D-991E-9737C5D5A824}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$2$3')]
//  JDVVideoTrimActivity_2_3 = interface(JObject)
//  ['{9092AE8A-E44F-4077-867E-8D301B909899}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_2_3 = class(TJavaGenericImport<JDVVideoTrimActivity_2_3Class, JDVVideoTrimActivity_2_3>) end;

//  JDVVideoTrimActivity_2Class = interface(JObjectClass)
//  ['{B71F863F-7A35-408A-8155-5B95F189FA7B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$2')]
//  JDVVideoTrimActivity_2 = interface(JObject)
//  ['{F7C74CC7-6BAC-4684-B096-874E2F0C3F33}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess; cdecl; //()V
//    procedure onFailure; cdecl; //()V
//    procedure onProgress(progress: Single); cdecl; //(F)V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_2 = class(TJavaGenericImport<JDVVideoTrimActivity_2Class, JDVVideoTrimActivity_2>) end;

//  JDVVideoTrimActivity_3Class = interface(JObjectClass)
//  ['{A082DE19-3CD0-48CC-AF53-A85F2FF439A6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity$3')]
//  JDVVideoTrimActivity_3 = interface(JObject)
//  ['{A8B8BAD0-38FE-4E5E-811C-D556CF2EC347}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoTrimActivity_3 = class(TJavaGenericImport<JDVVideoTrimActivity_3Class, JDVVideoTrimActivity_3>) end;

  JDVVideoTrimActivityClass = interface(JAppCompatActivityClass) // or JObjectClass // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{1B9D94F0-1F3D-4B06-B348-2035158089D7}']
    { static Property Methods }
    {class} function _GetvideoTrimListener: JOnVideoTrimListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/listener/OnVideoTrimListener;

    { static Methods }
    {class} function init: JDVVideoTrimActivity; cdecl; //()V

    { static Property }
    {class} property videoTrimListener: JOnVideoTrimListener read _GetvideoTrimListener;
  end;

  [JavaSignature('com/devil/library/video/ui/DVVideoTrimActivity')]
  JDVVideoTrimActivity = interface(JAppCompatActivity) // or JObject // SuperSignature: androidx/appcompat/app/AppCompatActivity
  ['{B008E73F-9294-44A9-B139-E7B97B1BE7EA}']
    { Property Methods }

    { methods }
    procedure onResume; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure finish; cdecl; //()V
    procedure onCancelSelect; cdecl; //()V
    procedure onAlreadySelect(videoPath: JString; startTime: Int64; P3: Int64; endTime: Int64); cdecl; //(Ljava/lang/String;JJJ)V

    { Property }
  end;

  TJDVVideoTrimActivity = class(TJavaGenericImport<JDVVideoTrimActivityClass, JDVVideoTrimActivity>) end;

  JDateUtilClass = interface(JObjectClass)
  ['{DE79B755-939C-400A-92A8-723030B68BC8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDateUtil; cdecl; //()V
    {class} function convertSecondsToTime(seconds: Int64): JString; cdecl; //(J)Ljava/lang/String;
    {class} function convertSecondsToFormat(seconds: Int64; format: JString): JString; cdecl; //(JLjava/lang/String;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/DateUtil')]
  JDateUtil = interface(JObject)
  ['{13441A25-22AF-41C8-81CA-4090515950E5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateUtil = class(TJavaGenericImport<JDateUtilClass, JDateUtil>) end;

  JDVLinearLayoutManagerClass = interface(JLinearLayoutManagerClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/LinearLayoutManager
  ['{A50AA955-4E3F-410B-AFC7-94FED8542567}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDVLinearLayoutManager; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; orientation: Integer; reverseLayout: Boolean): JDVLinearLayoutManager; cdecl; overload; //(Landroid/content/Context;IZ)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer; defStyleRes: Integer): JDVLinearLayoutManager; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/DVLinearLayoutManager')]
  JDVLinearLayoutManager = interface(JLinearLayoutManager) // or JObject // SuperSignature: androidx/recyclerview/widget/LinearLayoutManager
  ['{0BF24ACF-84C9-47C8-B4B5-141C5E7E1644}']
    { Property Methods }

    { methods }
    function canScrollVertically: Boolean; cdecl; //()Z
    function canScrollHorizontally: Boolean; cdecl; //()Z
    procedure setCanScroll(canScroll: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJDVLinearLayoutManager = class(TJavaGenericImport<JDVLinearLayoutManagerClass, JDVLinearLayoutManager>) end;

  JImageUtils_ImageTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{A6716026-CC1F-43B6-A3AA-D51D39B8F6F3}']
    { static Property Methods }
    {class} function _GetTYPE_JPG: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_PNG: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_GIF: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_TIFF: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_BMP: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_WEBP: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_ICO: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function _GetTYPE_UNKNOWN: JImageUtils_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/utils/ImageUtils$ImageType;

    { static Methods }
    {class} function values: TJavaObjectArray<JImageUtils_ImageType>; cdecl; //()[Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function valueOf(name: JString): JImageUtils_ImageType; cdecl; //(Ljava/lang/String;)Lcom/devil/library/video/utils/ImageUtils$ImageType;

    { static Property }
    {class} property TYPE_JPG: JImageUtils_ImageType read _GetTYPE_JPG;
    {class} property TYPE_PNG: JImageUtils_ImageType read _GetTYPE_PNG;
    {class} property TYPE_GIF: JImageUtils_ImageType read _GetTYPE_GIF;
    {class} property TYPE_TIFF: JImageUtils_ImageType read _GetTYPE_TIFF;
    {class} property TYPE_BMP: JImageUtils_ImageType read _GetTYPE_BMP;
    {class} property TYPE_WEBP: JImageUtils_ImageType read _GetTYPE_WEBP;
    {class} property TYPE_ICO: JImageUtils_ImageType read _GetTYPE_ICO;
    {class} property TYPE_UNKNOWN: JImageUtils_ImageType read _GetTYPE_UNKNOWN;
  end;

  [JavaSignature('com/devil/library/video/utils/ImageUtils$ImageType')]
  JImageUtils_ImageType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{BC8557E8-AFC1-49F1-8CB3-1CF08F669C73}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJImageUtils_ImageType = class(TJavaGenericImport<JImageUtils_ImageTypeClass, JImageUtils_ImageType>) end;

  JImageUtilsClass = interface(JObjectClass)
  ['{9F163A64-6168-41BC-AF00-6DF78971C316}']
    { static Property Methods }

    { static Methods }
    {class} function bitmap2Bytes(bitmap: JBitmap; format: JBitmap_CompressFormat): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;)[B
    {class} function bytes2Bitmap(bytes: TJavaArray<Byte>): JBitmap; cdecl; //([B)Landroid/graphics/Bitmap;
    {class} function drawable2Bitmap(drawable: JDrawable): JBitmap; cdecl; //(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    {class} function bitmap2Drawable(mContext: JContext; bitmap: JBitmap): JDrawable; cdecl; //(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    {class} function drawable2Bytes(drawable: JDrawable; format: JBitmap_CompressFormat): TJavaArray<Byte>; cdecl; //(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap$CompressFormat;)[B
    {class} function bytes2Drawable(mContext: JContext; bytes: TJavaArray<Byte>): JDrawable; cdecl; //(Landroid/content/Context;[B)Landroid/graphics/drawable/Drawable;
    {class} function view2Bitmap(view: JView): JBitmap; cdecl; //(Landroid/view/View;)Landroid/graphics/Bitmap;
    {class} function getBitmap(afile: JFile): JBitmap; cdecl; overload; //(Ljava/io/File;)Landroid/graphics/Bitmap;
    {class} function getBitmap(afile: JFile; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Ljava/io/File;II)Landroid/graphics/Bitmap;
    {class} function getBitmap(filePath: JString): JBitmap; cdecl; overload; //(Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function getBitmap(filePath: JString; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    {class} function getBitmap(ais: JInputStream): JBitmap; cdecl; overload; //(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    {class} function getBitmap(ais: JInputStream; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Ljava/io/InputStream;II)Landroid/graphics/Bitmap;
    {class} function getBitmap(data: TJavaArray<Byte>; offset: Integer): JBitmap; cdecl; overload; //([BI)Landroid/graphics/Bitmap;
    {class} function getBitmap(data: TJavaArray<Byte>; offset: Integer; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //([BIII)Landroid/graphics/Bitmap;
    {class} function getBitmap(mContext: JContext; resId: Integer): JBitmap; cdecl; overload; //(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    {class} function getBitmap(mContext: JContext; resId: Integer; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Landroid/content/Context;III)Landroid/graphics/Bitmap;
    {class} function getBitmap(fd: JFileDescriptor): JBitmap; cdecl; overload; //(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;
    {class} function getBitmap(fd: JFileDescriptor; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Ljava/io/FileDescriptor;II)Landroid/graphics/Bitmap;
    {class} function drawColor(src: JBitmap; color: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function drawColor(src: JBitmap; color: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    {class} function scale(src: JBitmap; newWidth: Integer; newHeight: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function scale(src: JBitmap; newWidth: Integer; newHeight: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    {class} function scale(src: JBitmap; scaleWidth: Single; scaleHeight: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;
    {class} function scale(src: JBitmap; scaleWidth: Single; scaleHeight: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FFZ)Landroid/graphics/Bitmap;
    {class} function clip(src: JBitmap; x: Integer; y: Integer; width: Integer; height: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    {class} function clip(src: JBitmap; x: Integer; y: Integer; width: Integer; height: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIIIZ)Landroid/graphics/Bitmap;
    {class} function skew(src: JBitmap; kx: Single; ky: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;
    {class} function skew(src: JBitmap; kx: Single; ky: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FFZ)Landroid/graphics/Bitmap;
    {class} function skew(src: JBitmap; kx: Single; ky: Single; px: Single; py: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FFFF)Landroid/graphics/Bitmap;
    {class} function skew(src: JBitmap; kx: Single; ky: Single; px: Single; py: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FFFFZ)Landroid/graphics/Bitmap;
    {class} function rotate(src: JBitmap; degrees: Integer; px: Single; py: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IFF)Landroid/graphics/Bitmap;
    {class} function rotate(src: JBitmap; degrees: Integer; px: Single; py: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IFFZ)Landroid/graphics/Bitmap;
    {class} function getRotateDegree(filePath: JString): Integer; cdecl; //(Ljava/lang/String;)I
    {class} function toRound(src: JBitmap): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function toRound(src: JBitmap; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    {class} function toRound(src: JBitmap; borderSize: Integer; borderColor: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function toRound(src: JBitmap; borderSize: Integer; borderColor: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    {class} function toRoundCorner(src: JBitmap; radius: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    {class} function toRoundCorner(src: JBitmap; radius: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;
    {class} function toRoundCorner(src: JBitmap; radius: Single; borderSize: Integer; borderColor: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FII)Landroid/graphics/Bitmap;
    {class} function toRoundCorner(src: JBitmap; radius: Single; borderSize: Integer; borderColor: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FIIZ)Landroid/graphics/Bitmap;
    {class} function addCornerBorder(src: JBitmap; borderSize: Integer; color: Integer; cornerRadius: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIF)Landroid/graphics/Bitmap;
    {class} function addCornerBorder(src: JBitmap; borderSize: Integer; color: Integer; cornerRadius: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIFZ)Landroid/graphics/Bitmap;
    {class} function addCircleBorder(src: JBitmap; borderSize: Integer; color: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function addCircleBorder(src: JBitmap; borderSize: Integer; color: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    {class} function addReflection(src: JBitmap; reflectionHeight: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function addReflection(src: JBitmap; reflectionHeight: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    {class} function addTextWatermark(src: JBitmap; content: JString; textSize: Integer; color: Integer; x: Single; y: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;IIFF)Landroid/graphics/Bitmap;
    {class} function addTextWatermark(src: JBitmap; content: JString; textSize: Single; color: Integer; x: Single; y: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;FIFFZ)Landroid/graphics/Bitmap;
    {class} function addImageWatermark(src: JBitmap; watermark: JBitmap; x: Integer; y: Integer; alpha: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;
    {class} function addImageWatermark(src: JBitmap; watermark: JBitmap; x: Integer; y: Integer; alpha: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIIZ)Landroid/graphics/Bitmap;
    {class} function toAlpha(src: JBitmap): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function toAlpha(src: JBitmap; recycle: JBoolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/Boolean;)Landroid/graphics/Bitmap;
    {class} function toGray(src: JBitmap): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function toGray(src: JBitmap; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    {class} function fastBlur(mContext: JContext; src: JBitmap; scale: Single; radius: Single): JBitmap; cdecl; overload; //(Landroid/content/Context;Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;
    {class} function fastBlur(mContext: JContext; src: JBitmap; scale: Single; radius: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/content/Context;Landroid/graphics/Bitmap;FFZ)Landroid/graphics/Bitmap;
    {class} function fastBlur(mContext: JContext; src: JBitmap; scale: Single; radius: Single; recycle: Boolean; isReturnScale: Boolean): JBitmap; cdecl; overload; //(Landroid/content/Context;Landroid/graphics/Bitmap;FFZZ)Landroid/graphics/Bitmap;
    {class} function renderScriptBlur(mContext: JContext; src: JBitmap; radius: Single): JBitmap; cdecl; overload; //(Landroid/content/Context;Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    {class} function renderScriptBlur(mContext: JContext; src: JBitmap; radius: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/content/Context;Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;
    {class} function stackBlur(src: JBitmap; radius: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function stackBlur(src: JBitmap; radius: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    {class} function save(src: JBitmap; filePath: JString; format: JBitmap_CompressFormat): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;)Z
    {class} function save(src: JBitmap; afile: JFile; format: JBitmap_CompressFormat): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;)Z
    {class} function save(src: JBitmap; filePath: JString; format: JBitmap_CompressFormat; recycle: Boolean): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;Z)Z
    {class} function save(src: JBitmap; afile: JFile; format: JBitmap_CompressFormat; recycle: Boolean): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;Z)Z
    {class} function isImage(afile: JFile): Boolean; cdecl; overload; //(Ljava/io/File;)Z
    {class} function isImage(filePath: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    {class} function getImageType(filePath: JString): JImageUtils_ImageType; cdecl; overload; //(Ljava/lang/String;)Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function getImageType(afile: JFile): JImageUtils_ImageType; cdecl; overload; //(Ljava/io/File;)Lcom/devil/library/video/utils/ImageUtils$ImageType;
    {class} function compressByScale(src: JBitmap; newWidth: Integer; newHeight: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function compressByScale(src: JBitmap; newWidth: Integer; newHeight: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    {class} function compressByScale(src: JBitmap; scaleWidth: Single; scaleHeight: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;
    {class} function compressByScale(src: JBitmap; scaleWidth: Single; scaleHeight: Single; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FFZ)Landroid/graphics/Bitmap;
    {class} function compressByQuality(src: JBitmap; quality: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function compressByQuality(src: JBitmap; quality: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    {class} function compressByQuality(src: JBitmap; maxByteSize: Int64): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;J)Landroid/graphics/Bitmap;
    {class} function compressByQuality(src: JBitmap; maxByteSize: Int64; len: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;JZ)Landroid/graphics/Bitmap;
    {class} function compressBySampleSize(src: JBitmap; sampleSize: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function compressBySampleSize(src: JBitmap; sampleSize: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    {class} function compressBySampleSize(src: JBitmap; maxWidth: Integer; maxHeight: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function compressBySampleSize(src: JBitmap; maxWidth: Integer; maxHeight: Integer; recycle: Boolean): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    {class} function getSize(filePath: JString): TJavaArray<Integer>; cdecl; overload; //(Ljava/lang/String;)[I
    {class} function getSize(afile: JFile): TJavaArray<Integer>; cdecl; overload; //(Ljava/io/File;)[I
    {class} procedure setWidthHeightWithRatio(view: JView; width: Integer; widthRatio: Integer; heightRatio: Integer); cdecl; //(Landroid/view/View;III)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ImageUtils')]
  JImageUtils = interface(JObject)
  ['{D90C4A1E-0C60-4CDA-8353-B508CB285BB6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJImageUtils = class(TJavaGenericImport<JImageUtilsClass, JImageUtils>) end;

  JMeasureHelperClass = interface(JObjectClass)
  ['{38278864-7D74-4097-9ED3-06FECCA111DB}']
    { static Property Methods }
    {class} function _GetSCREEN_SCALE_DEFAULT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_16_9: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_4_3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_1_1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_MATCH_PARENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_ORIGINAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_CENTER_CROP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSCREEN_SCALE_BY_SELF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JMeasureHelper; cdecl; //()V

    { static Property }
    {class} property SCREEN_SCALE_DEFAULT: Integer read _GetSCREEN_SCALE_DEFAULT;
    {class} property SCREEN_SCALE_16_9: Integer read _GetSCREEN_SCALE_16_9;
    {class} property SCREEN_SCALE_4_3: Integer read _GetSCREEN_SCALE_4_3;
    {class} property SCREEN_SCALE_1_1: Integer read _GetSCREEN_SCALE_1_1;
    {class} property SCREEN_SCALE_MATCH_PARENT: Integer read _GetSCREEN_SCALE_MATCH_PARENT;
    {class} property SCREEN_SCALE_ORIGINAL: Integer read _GetSCREEN_SCALE_ORIGINAL;
    {class} property SCREEN_SCALE_CENTER_CROP: Integer read _GetSCREEN_SCALE_CENTER_CROP;
    {class} property SCREEN_SCALE_BY_SELF: Integer read _GetSCREEN_SCALE_BY_SELF;
  end;

  [JavaSignature('com/devil/library/video/utils/MeasureHelper')]
  JMeasureHelper = interface(JObject)
  ['{5EE99D7E-1DC3-4AB5-962E-AC15F71B847D}']
    { Property Methods }

    { methods }
    procedure setVideoRotation(videoRotationDegree: Integer); cdecl; //(I)V
    procedure setVideoSize(width: Integer; height: Integer); cdecl; //(II)V
    procedure setZoomScale(mZoomScale: Single); cdecl; //(F)V
    procedure setScreenScale(screenScale: Integer); cdecl; //(I)V
    function getCurrentScreenScale: Integer; cdecl; //()I
    function doMeasure(widthMeasureSpec: Integer; heightMeasureSpec: Integer): TJavaArray<Integer>; cdecl; //(II)[I
    procedure setKeepVideoOriginalRatio(isKeepVideoOriginalRatio: Boolean); cdecl; //(Z)V
    procedure setVideoRatio(videoWidthRatio: Integer; videoHeightRatio: Integer); cdecl; //(II)V
    function getSizeRatio: TJavaArray<Single>; cdecl; //()[F

    { Property }
  end;

  TJMeasureHelper = class(TJavaGenericImport<JMeasureHelperClass, JMeasureHelper>) end;

//  JScreenUtils_297Class = interface(JObjectClass)
//  ['{45A4C084-888C-4077-BD68-8FD770F147B2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getScreenWidth(mContext: JContext): Integer; cdecl; //(Landroid/content/Context;)I
//    {class} function getScreenHeight(mContext: JContext): Integer; cdecl; //(Landroid/content/Context;)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ScreenUtils')]
//  JScreenUtils_297 = interface(JObject)
//  ['{228BB4F3-1D38-4179-A23B-D9B2AC89FE8C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJScreenUtils_297 = class(TJavaGenericImport<JScreenUtils_297Class, JScreenUtils_297>) end;

  JShaderUtilClass = interface(JObjectClass)
  ['{62BEFB58-2135-4916-8E9D-67C7E149FB59}']
    { static Property Methods }

    { static Methods }
    {class} function init: JShaderUtil; cdecl; //()V
    {class} function loadGLShader(tag: JString; context: JContext; atype: Integer; resId: Integer): Integer; cdecl; //(Ljava/lang/String;Landroid/content/Context;II)I
    {class} procedure checkGLError(tag: JString; alabel: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ShaderUtil')]
  JShaderUtil = interface(JObject)
  ['{0829982B-7E91-46F4-907D-A33BB7FB244F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJShaderUtil = class(TJavaGenericImport<JShaderUtilClass, JShaderUtil>) end;

//  JThreadUtils_1Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{57160E53-CA89-48EC-ADBA-3D14208502BA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$1')]
//  JThreadUtils_1 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{1445F981-473E-434E-BED3-C032589CB3D4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_1 = class(TJavaGenericImport<JThreadUtils_1Class, JThreadUtils_1>) end;

//  JThreadUtils_2Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{E6AC29A4-8D2F-4CFF-A8D3-B647F0FA6411}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$2')]
//  JThreadUtils_2 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{7F1C683B-5D5F-44B9-8BC8-2B42B6CBCA2B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_2 = class(TJavaGenericImport<JThreadUtils_2Class, JThreadUtils_2>) end;

//  JThreadUtils_3Class = interface(JObjectClass)
//  ['{0651790B-E408-4BCE-B5B7-B5BF39F84449}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$3')]
//  JThreadUtils_3 = interface(JObject)
//  ['{06DD6553-EE48-4CF6-A240-0A328140C982}']
//    { Property Methods }
//
//    { methods }
//    procedure execute(command: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
//
//    { Property }
//  end;

//  TJThreadUtils_3 = class(TJavaGenericImport<JThreadUtils_3Class, JThreadUtils_3>) end;

  JThreadUtils_LinkedBlockingQueue4UtilClass = interface(JLinkedBlockingQueueClass) // or JObjectClass // SuperSignature: java/util/concurrent/LinkedBlockingQueue
  ['{640EE201-2C4E-457F-B21C-A7CB75A09334}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$LinkedBlockingQueue4Util')]
  JThreadUtils_LinkedBlockingQueue4Util = interface(JLinkedBlockingQueue) // or JObject // SuperSignature: java/util/concurrent/LinkedBlockingQueue
  ['{CA888E2F-6A5C-4CDF-A209-AE5DDCFA4D8C}']
    { Property Methods }

    { methods }
    function offer(runnable: JRunnable): Boolean; cdecl; overload; //(Ljava/lang/Runnable;)Z
    function offer(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJThreadUtils_LinkedBlockingQueue4Util = class(TJavaGenericImport<JThreadUtils_LinkedBlockingQueue4UtilClass, JThreadUtils_LinkedBlockingQueue4Util>) end;

  JThreadUtils_SimpleTaskClass = interface(JThreadUtils_TaskClass) // or JObjectClass // SuperSignature: com/devil/library/video/utils/ThreadUtils$Task
  ['{86A0F244-8B29-4552-AF0D-C98E79C85770}']
    { static Property Methods }

    { static Methods }
    {class} function init: JThreadUtils_SimpleTask; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$SimpleTask')]
  JThreadUtils_SimpleTask = interface(JThreadUtils_Task) // or JObject // SuperSignature: com/devil/library/video/utils/ThreadUtils$Task
  ['{065712A3-7014-433F-8145-426571276D48}']
    { Property Methods }

    { methods }
    procedure onCancel; cdecl; //()V
    procedure onFail(t: JThrowable); cdecl; //(Ljava/lang/Throwable;)V

    { Property }
  end;

  TJThreadUtils_SimpleTask = class(TJavaGenericImport<JThreadUtils_SimpleTaskClass, JThreadUtils_SimpleTask>) end;

//  JThreadUtils_Task_1Class = interface(JObjectClass)
//  ['{22CCDC60-CA01-48B7-9F64-B3D3756C852C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$1')]
//  JThreadUtils_Task_1 = interface(JObject)
//  ['{222DD09B-20C9-4305-BD03-B1B151F7BB94}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_Task_1 = class(TJavaGenericImport<JThreadUtils_Task_1Class, JThreadUtils_Task_1>) end;

//  JThreadUtils_Task_2Class = interface(JObjectClass)
//  ['{E165F47B-6A11-40A9-8A3D-C2BA9A205B0E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$2')]
//  JThreadUtils_Task_2 = interface(JObject)
//  ['{95770992-7A1E-401B-BAB1-28001F21B1E6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_Task_2 = class(TJavaGenericImport<JThreadUtils_Task_2Class, JThreadUtils_Task_2>) end;

//  JThreadUtils_Task_3Class = interface(JObjectClass)
//  ['{6C04DF7F-23E9-4BE5-B304-C67A241CE0B9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$3')]
//  JThreadUtils_Task_3 = interface(JObject)
//  ['{F0D09C5E-E16C-42DE-BD54-D3F2D007E36E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_Task_3 = class(TJavaGenericImport<JThreadUtils_Task_3Class, JThreadUtils_Task_3>) end;

//  JThreadUtils_Task_4Class = interface(JObjectClass)
//  ['{FAB08958-5086-4B76-AC20-DFC19047A8BF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$4')]
//  JThreadUtils_Task_4 = interface(JObject)
//  ['{2FA79BFB-603A-4DE3-AE64-EFCE33D526E2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_Task_4 = class(TJavaGenericImport<JThreadUtils_Task_4Class, JThreadUtils_Task_4>) end;

//  JThreadUtils_Task_5Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{838F252D-534A-4D51-9F53-AF1DEFFC7B17}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$5')]
//  JThreadUtils_Task_5 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{0B6C8967-44CE-49B3-90C1-2E7DF8FCE8A6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_Task_5 = class(TJavaGenericImport<JThreadUtils_Task_5Class, JThreadUtils_Task_5>) end;

  JThreadUtils_Task_OnTimeoutListenerClass = interface(JObjectClass)
  ['{73F2DE00-BC79-4B3B-B441-2290510BABAE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task$OnTimeoutListener')]
  JThreadUtils_Task_OnTimeoutListener = interface(IJavaInstance)
  ['{0EE24227-0850-4621-9704-E89A6C277737}']
    { Property Methods }

    { methods }
    procedure onTimeout; cdecl; //()V

    { Property }
  end;

  TJThreadUtils_Task_OnTimeoutListener = class(TJavaGenericImport<JThreadUtils_Task_OnTimeoutListenerClass, JThreadUtils_Task_OnTimeoutListener>) end;

  JThreadUtils_TaskClass = interface(JObjectClass)
  ['{F3381048-54A1-42E5-8E4B-C785CD2FDC30}']
    { static Property Methods }

    { static Methods }
    {class} function init: JThreadUtils_Task; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$Task')]
  JThreadUtils_Task = interface(JObject)
  ['{B9EF3D81-B172-45C2-AB9E-6A54B599CA0A}']
    { Property Methods }

    { methods }
    function doInBackground: JObject; cdecl; //()Ljava/lang/Object;
    procedure onSuccess(P1: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onCancel; cdecl; //()V
    procedure onFail(P1: JThrowable); cdecl; //(Ljava/lang/Throwable;)V
    procedure run; cdecl; //()V
    procedure cancel; cdecl; overload; //()V
    procedure cancel(mayInterruptIfRunning: Boolean); cdecl; overload; //(Z)V
    function isCanceled: Boolean; cdecl; //()Z
    function isDone: Boolean; cdecl; //()Z
    function setDeliver(deliver: JExecutor): JThreadUtils_Task; cdecl; //(Ljava/util/concurrent/Executor;)Lcom/devil/library/video/utils/ThreadUtils$Task;
    procedure setTimeout(timeoutMillis: Int64; P2: JThreadUtils_Task_OnTimeoutListener); cdecl; //(JLcom/devil/library/video/utils/ThreadUtils$Task$OnTimeoutListener;)V

    { Property }
  end;

  TJThreadUtils_Task = class(TJavaGenericImport<JThreadUtils_TaskClass, JThreadUtils_Task>) end;

  JThreadUtils_TaskInfoClass = interface(JObjectClass)
  ['{659C3AED-CF16-44E2-81C7-252B490E23BF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$TaskInfo')]
  JThreadUtils_TaskInfo = interface(JObject)
  ['{ECF91141-9970-4B3E-A45B-CCB58098EDF8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJThreadUtils_TaskInfo = class(TJavaGenericImport<JThreadUtils_TaskInfoClass, JThreadUtils_TaskInfo>) end;

  JThreadUtils_ThreadPoolExecutor4UtilClass = interface(JThreadPoolExecutorClass) // or JObjectClass // SuperSignature: java/util/concurrent/ThreadPoolExecutor
  ['{0E11DA99-B2D1-421E-B402-B144C2EACDAB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$ThreadPoolExecutor4Util')]
  JThreadUtils_ThreadPoolExecutor4Util = interface(JThreadPoolExecutor) // or JObject // SuperSignature: java/util/concurrent/ThreadPoolExecutor
  ['{D5C7E6EB-DFA8-4FAD-B404-AD42EECB2C6A}']
    { Property Methods }

    { methods }
    procedure execute(command: JRunnable); cdecl; //(Ljava/lang/Runnable;)V

    { Property }
  end;

  TJThreadUtils_ThreadPoolExecutor4Util = class(TJavaGenericImport<JThreadUtils_ThreadPoolExecutor4UtilClass, JThreadUtils_ThreadPoolExecutor4Util>) end;

//  JThreadUtils_UtilsThreadFactory_1Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{0FD6BC86-A410-461D-AFE8-4C89F57822E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$UtilsThreadFactory$1')]
//  JThreadUtils_UtilsThreadFactory_1 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{592C164F-D81F-4FA9-BF31-095AD3AAB03F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJThreadUtils_UtilsThreadFactory_1 = class(TJavaGenericImport<JThreadUtils_UtilsThreadFactory_1Class, JThreadUtils_UtilsThreadFactory_1>) end;

//  JThreadUtils_UtilsThreadFactory_2Class = interface(JObjectClass)
//  ['{B6A103EC-7FFE-46F7-A7FC-687EB1F57DD9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/ThreadUtils$UtilsThreadFactory$2')]
//  JThreadUtils_UtilsThreadFactory_2 = interface(JObject)
//  ['{EB4034CC-A1FF-4A1A-8C39-7021EF832272}']
//    { Property Methods }
//
//    { methods }
//    procedure uncaughtException(t: JThread; e: JThrowable); cdecl; //(Ljava/lang/Thread;Ljava/lang/Throwable;)V
//
//    { Property }
//  end;

//  TJThreadUtils_UtilsThreadFactory_2 = class(TJavaGenericImport<JThreadUtils_UtilsThreadFactory_2Class, JThreadUtils_UtilsThreadFactory_2>) end;

  JThreadUtils_UtilsThreadFactoryClass = interface(JAtomicLongClass) // or JObjectClass // SuperSignature: java/util/concurrent/atomic/AtomicLong
  ['{40781722-DC2F-4899-8975-E60017111B8B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils$UtilsThreadFactory')]
  JThreadUtils_UtilsThreadFactory = interface(JAtomicLong) // or JObject // SuperSignature: java/util/concurrent/atomic/AtomicLong
  ['{243CEF78-EB1C-4FC7-8D6D-2D09A66B8E74}']
    { Property Methods }

    { methods }
    function newThread(r: JRunnable): JThread; cdecl; //(Ljava/lang/Runnable;)Ljava/lang/Thread;

    { Property }
  end;

  TJThreadUtils_UtilsThreadFactory = class(TJavaGenericImport<JThreadUtils_UtilsThreadFactoryClass, JThreadUtils_UtilsThreadFactory>) end;

  JThreadUtilsClass = interface(JObjectClass)
  ['{312F6012-0BCB-4F58-BFE0-17243CAE2C27}']
    { static Property Methods }

    { static Methods }
    {class} function init: JThreadUtils; cdecl; //()V
    {class} function isMainThread: Boolean; cdecl; //()Z
    {class} function getFixedPool(size: Integer): JExecutorService; cdecl; overload; //(I)Ljava/util/concurrent/ExecutorService;
    {class} function getFixedPool(size: Integer; priority: Integer): JExecutorService; cdecl; overload; //(II)Ljava/util/concurrent/ExecutorService;
    {class} function getSinglePool: JExecutorService; cdecl; overload; //()Ljava/util/concurrent/ExecutorService;
    {class} function getSinglePool(priority: Integer): JExecutorService; cdecl; overload; //(I)Ljava/util/concurrent/ExecutorService;
    {class} function getCachedPool: JExecutorService; cdecl; overload; //()Ljava/util/concurrent/ExecutorService;
    {class} function getCachedPool(priority: Integer): JExecutorService; cdecl; overload; //(I)Ljava/util/concurrent/ExecutorService;
    {class} function getIoPool: JExecutorService; cdecl; overload; //()Ljava/util/concurrent/ExecutorService;
    {class} function getIoPool(priority: Integer): JExecutorService; cdecl; overload; //(I)Ljava/util/concurrent/ExecutorService;
    {class} function getCpuPool: JExecutorService; cdecl; overload; //()Ljava/util/concurrent/ExecutorService;
    {class} function getCpuPool(priority: Integer): JExecutorService; cdecl; overload; //(I)Ljava/util/concurrent/ExecutorService;
    {class} procedure executeByFixed(size: Integer; task: JThreadUtils_Task); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeByFixed(size: Integer; task: JThreadUtils_Task; priority: Integer); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;I)V
    {class} procedure executeByFixedWithDelay(size: Integer; task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByFixedWithDelay(size: Integer; task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit; P5: Integer); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByFixedAtFixRate(size: Integer; task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByFixedAtFixRate(size: Integer; task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit; P5: Integer); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByFixedAtFixRate(size: Integer; task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P5: JTimeUnit); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByFixedAtFixRate(size: Integer; task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P5: JTimeUnit; priority: Integer); cdecl; overload; //(ILcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeBySingle(task: JThreadUtils_Task); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeBySingle(run: JRunnable); cdecl; overload; //(Ljava/lang/Runnable;)V
    {class} procedure executeBySingle(task: JThreadUtils_Task; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;I)V
    {class} procedure executeBySingleWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeBySingleWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeBySingleAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeBySingleAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeBySingleAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeBySingleAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCached(task: JThreadUtils_Task); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeByCached(run: JRunnable); cdecl; overload; //(Ljava/lang/Runnable;)V
    {class} procedure executeByCached(task: JThreadUtils_Task; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;I)V
    {class} procedure executeByCachedWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCachedWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCachedAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCachedAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCachedAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCachedAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByIo(task: JThreadUtils_Task); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeByIo(task: JThreadUtils_Task; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;I)V
    {class} procedure executeByIoWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByIoWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByIoAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByIoAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByIoAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByIoAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCpu(task: JThreadUtils_Task); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeByCpu(task: JThreadUtils_Task; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;I)V
    {class} procedure executeByCpuWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCpuWithDelay(task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCpuAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCpuAtFixRate(task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit; P4: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCpuAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCpuAtFixRate(task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P4: JTimeUnit; priority: Integer); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;I)V
    {class} procedure executeByCustom(pool: JExecutorService; task: JThreadUtils_Task); cdecl; //(Ljava/util/concurrent/ExecutorService;Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure executeByCustomWithDelay(pool: JExecutorService; task: JThreadUtils_Task; delay: Int64; aunit: JTimeUnit); cdecl; //(Ljava/util/concurrent/ExecutorService;Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCustomAtFixRate(pool: JExecutorService; task: JThreadUtils_Task; period: Int64; aunit: JTimeUnit); cdecl; overload; //(Ljava/util/concurrent/ExecutorService;Lcom/devil/library/video/utils/ThreadUtils$Task;JLjava/util/concurrent/TimeUnit;)V
    {class} procedure executeByCustomAtFixRate(pool: JExecutorService; task: JThreadUtils_Task; initialDelay: Int64; period: Int64; P5: JTimeUnit); cdecl; overload; //(Ljava/util/concurrent/ExecutorService;Lcom/devil/library/video/utils/ThreadUtils$Task;JJLjava/util/concurrent/TimeUnit;)V
    {class} procedure cancel(task: JThreadUtils_Task); cdecl; overload; //(Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure cancel(tasks: TJavaObjectArray<JThreadUtils_Task>); cdecl; overload; //([Lcom/devil/library/video/utils/ThreadUtils$Task;)V
    {class} procedure cancel(tasks: JList); cdecl; overload; //(Ljava/util/List;)V
    {class} procedure cancel(executorService: JExecutorService); cdecl; overload; //(Ljava/util/concurrent/ExecutorService;)V
    {class} procedure setDeliver(deliver: JExecutor); cdecl; //(Ljava/util/concurrent/Executor;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/utils/ThreadUtils')]
  JThreadUtils = interface(JObject)
  ['{4BFD9C07-2468-4F43-AC58-EDE85DE3D1D8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJThreadUtils = class(TJavaGenericImport<JThreadUtilsClass, JThreadUtils>) end;

//  JVideoTrimUtil_1Class = interface(JObjectClass)
//  ['{C02C4531-687F-4C83-97CA-A544C28AD725}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/VideoTrimUtil$1')]
//  JVideoTrimUtil_1 = interface(JObject)
//  ['{932B8C5C-E3B5-403D-ADCC-3CAE55D92979}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJVideoTrimUtil_1 = class(TJavaGenericImport<JVideoTrimUtil_1Class, JVideoTrimUtil_1>) end;

//  JVideoTrimUtil_2Class = interface(JObjectClass)
//  ['{0AD8A052-33BD-4002-907A-D1C3E2425F24}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/utils/VideoTrimUtil$2')]
//  JVideoTrimUtil_2 = interface(JObject)
//  ['{04D478BD-2BE1-46FC-89C7-A95960875C5E}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess(path: JString; currentPosition: Integer; isFinish: Boolean); cdecl; //(Ljava/lang/String;IZ)V
//    procedure onFailure; cdecl; //()V
//
//    { Property }
//  end;

//  TJVideoTrimUtil_2 = class(TJavaGenericImport<JVideoTrimUtil_2Class, JVideoTrimUtil_2>) end;

  JVideoTrimUtilClass = interface(JObjectClass)
  ['{5A4EBA39-2DCB-4BBA-AF24-E69E53F648C8}']
    { static Property Methods }
    {class} function _GetMIN_SHOOT_DURATION: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    {class} function _GetMIN_COUNT_RANGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JVideoTrimUtil; cdecl; //()V
    {class} function getInstance(mContext: JContext): JVideoTrimUtil; cdecl; //(Landroid/content/Context;)Lcom/devil/library/video/utils/VideoTrimUtil;
    {class} function getVideoFilePath(url: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
    {class} property MIN_SHOOT_DURATION: Int64 read _GetMIN_SHOOT_DURATION;
    {class} property MIN_COUNT_RANGE: Integer read _GetMIN_COUNT_RANGE;
  end;

  [JavaSignature('com/devil/library/video/utils/VideoTrimUtil')]
  JVideoTrimUtil = interface(JObject)
  ['{1C98F3D5-BD48-4057-A4FF-88D69BB50414}']
    { Property Methods }
    function _GetrecyclerViewPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetrecyclerViewPadding(arecyclerViewPadding: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetvideoFrameWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetvideoFrameWidth(avideoFrameWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    procedure shootVideoThumbInBackground(context: JContext; videoPath: JString; totalThumbsCount: Integer; startPosition: Int64; P5: Int64; endPosition: JSingleCallback); cdecl; //(Landroid/content/Context;Ljava/lang/String;IJJLcom/devil/library/video/listener/SingleCallback;)V

    { Property }
    property recyclerViewPadding: Integer read _GetrecyclerViewPadding write _SetrecyclerViewPadding;
    property videoFrameWidth: Integer read _GetvideoFrameWidth write _SetvideoFrameWidth;
  end;

  TJVideoTrimUtil = class(TJavaGenericImport<JVideoTrimUtilClass, JVideoTrimUtil>) end;

//  JVideoMediaManager_1Class = interface(JObjectClass)
//  ['{9E5C8B3A-6CEB-4822-9C46-3A950BEDFC1F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/VideoMediaManager$1')]
//  JVideoMediaManager_1 = interface(JObject)
//  ['{DC33D85D-7219-486B-BC77-BE1F801AE976}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess; cdecl; //()V
//    procedure onFailure; cdecl; //()V
//    procedure onProgress(v: Single); cdecl; //(F)V
//
//    { Property }
//  end;

//  TJVideoMediaManager_1 = class(TJavaGenericImport<JVideoMediaManager_1Class, JVideoMediaManager_1>) end;

//  JVideoMediaManager_2Class = interface(JObjectClass)
//  ['{3F03D153-9556-4DE1-8958-BD560DD024DF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/VideoMediaManager$2')]
//  JVideoMediaManager_2 = interface(JObject)
//  ['{0818483A-23E6-4ECC-ABB8-E79F927BB2BE}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess; cdecl; //()V
//    procedure onFailure; cdecl; //()V
//    procedure onProgress(v: Single); cdecl; //(F)V
//
//    { Property }
//  end;

//  TJVideoMediaManager_2 = class(TJavaGenericImport<JVideoMediaManager_2Class, JVideoMediaManager_2>) end;

  JVideoMediaManagerClass = interface(JObjectClass)
  ['{CDE29EB2-0C91-4F55-AB8C-C3D2C0A35DB8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVideoMediaManager; cdecl; //()V
    {class} function getInstance: JVideoMediaManager; cdecl; //()Lcom/devil/library/video/VideoMediaManager;
    {class} procedure getVideoFrame(videoPath: JString; savePath: JString; frameTime: Int64; listener: JOnGetVideoFrameListener); cdecl; //(Ljava/lang/String;Ljava/lang/String;JLcom/devil/library/video/listener/OnGetVideoFrameListener;)V
    {class} procedure getVideoFrameArray(videoPath: JString; saveDir: JString; frameTimeArray: TJavaArray<Int64>; listener: JOnGetVideoFrameListener); cdecl; //(Ljava/lang/String;Ljava/lang/String;[JLcom/devil/library/video/listener/OnGetVideoFrameListener;)V
    {class} procedure openVideoTrimActivity(mActivity: JActivity; videoPath: JString; savePath: JString; listener: JOnVideoTrimListener); cdecl; overload; //(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/devil/library/video/listener/OnVideoTrimListener;)V
    {class} procedure openVideoTrimActivity(mActivity: JActivity; videoPath: JString; savePath: JString; frameRate: Integer; bitRate: Integer; listener: JOnVideoTrimListener); cdecl; overload; //(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;IILcom/devil/library/video/listener/OnVideoTrimListener;)V
    {class} procedure openVideoCropActivity(mActivity: JActivity; videoPath: JString; savePath: JString; listener: JOnVideoTrimListener); cdecl; //(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/devil/library/video/listener/OnVideoTrimListener;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/VideoMediaManager')]
  JVideoMediaManager = interface(JObject)
  ['{74C33708-D238-4087-AC22-FE1778A05025}']
    { Property Methods }

    { methods }
    procedure setMediaPlayer(mediaPlayer: JIMediaPlayer); cdecl; //(Lcom/devil/library/video/common/IMediaPlayer;)V
    function getMediaPlayer: JIMediaPlayer; cdecl; //()Lcom/devil/library/video/common/IMediaPlayer;

    { Property }
  end;

  TJVideoMediaManager = class(TJavaGenericImport<JVideoMediaManagerClass, JVideoMediaManager>) end;

//  JDVVideoView_1Class = interface(JObjectClass)
//  ['{BBCD1205-41CB-43EB-8233-186460C275E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/DVVideoView$1')]
//  JDVVideoView_1 = interface(JObject)
//  ['{8620DB75-6CB6-4F20-8DB1-2446BED4C346}']
//    { Property Methods }
//
//    { methods }
//    function onScale(detector: JScaleGestureDetector): Boolean; cdecl; //(Landroid/view/ScaleGestureDetector;)Z
//    function onScaleBegin(detector: JScaleGestureDetector): Boolean; cdecl; //(Landroid/view/ScaleGestureDetector;)Z
//    procedure onScaleEnd(detector: JScaleGestureDetector); cdecl; //(Landroid/view/ScaleGestureDetector;)V
//
//    { Property }
//  end;

//  TJDVVideoView_1 = class(TJavaGenericImport<JDVVideoView_1Class, JDVVideoView_1>) end;

//  JDVVideoView_2Class = interface(JViewDragHelper_CallbackClass) // or JObjectClass // SuperSignature: androidx/customview/widget/ViewDragHelper$Callback
//  ['{68ED594D-923A-4E51-BD9C-6CB2C765AD6F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/DVVideoView$2')]
//  JDVVideoView_2 = interface(JViewDragHelper_Callback) // or JObject // SuperSignature: androidx/customview/widget/ViewDragHelper$Callback
//  ['{069B6776-12D8-4C05-BE33-F249C0E56D85}']
//    { Property Methods }
//
//    { methods }
//    function tryCaptureView(child: JView; pointerId: Integer): Boolean; cdecl; //(Landroid/view/View;I)Z
//    procedure onViewCaptured(capturedChild: JView; activePointerId: Integer); cdecl; //(Landroid/view/View;I)V
//    function clampViewPositionVertical(child: JView; top: Integer; dy: Integer): Integer; cdecl; //(Landroid/view/View;II)I
//    function clampViewPositionHorizontal(child: JView; left: Integer; dx: Integer): Integer; cdecl; //(Landroid/view/View;II)I
//    procedure onViewReleased(releasedChild: JView; xvel: Single; yvel: Single); cdecl; //(Landroid/view/View;FF)V
//
//    { Property }
//  end;

//  TJDVVideoView_2 = class(TJavaGenericImport<JDVVideoView_2Class, JDVVideoView_2>) end;

//  JDVVideoView_3Class = interface(JObjectClass)
//  ['{D5263174-B93C-4EB8-8A67-35779BB45D09}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/DVVideoView$3')]
//  JDVVideoView_3 = interface(JObject)
//  ['{7D8C52B1-4674-41AE-8C84-77EF796F11EB}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared; cdecl; //()V
//
//    { Property }
//  end;

//  TJDVVideoView_3 = class(TJavaGenericImport<JDVVideoView_3Class, JDVVideoView_3>) end;

  JDVVideoViewClass = interface(JLinearLayoutClass) // or JObjectClass // SuperSignature: android/widget/LinearLayout
  ['{2C6D1D9B-A541-4A3E-81F2-665D287308A4}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDVVideoView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JDVVideoView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JDVVideoView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/DVVideoView')]
  JDVVideoView = interface(JLinearLayout) // or JObject // SuperSignature: android/widget/LinearLayout
  ['{712D5199-966A-4E21-B90C-BEC6C06F518D}']
    { Property Methods }

    { methods }
    procedure setVideoURI(uri: Jnet_Uri); cdecl; //(Landroid/net/Uri;)V
    procedure setCropToolLocation(cropToolLocation: TJavaArray<Single>); cdecl; //([F)V
    procedure setVideoPath(path: JString); cdecl; //(Ljava/lang/String;)V
    procedure setVideoRealSize(width: Integer; height: Integer); cdecl; //(II)V
    function getVideoRealWidth: Integer; cdecl; //()I
    function getVideoRealHeight: Integer; cdecl; //()I
    procedure setVideoRatio(videoWidthRatio: Integer; videoHeightRatio: Integer); cdecl; //(II)V
    procedure setVerticalScaleType(scaleType: Integer); cdecl; //(I)V
    function getVerticalScaleType: Integer; cdecl; //()I
    procedure setHorizontalScaleType(scaleType: Integer); cdecl; //(I)V
    function getHorizontalScaleType: Integer; cdecl; //()I
    function getSizeRatio: TJavaArray<Single>; cdecl; //()[F
    procedure setZoomEnable(isZoomEnable: Boolean); cdecl; //(Z)V
    procedure setDragEnable(isDragEnable: Boolean); cdecl; //(Z)V
    function onInterceptTouchEvent(ev: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure computeScroll; cdecl; //()V
    procedure setScaleMaxSize(maxSize: Single); cdecl; //(F)V
    procedure setLoop(isLoop: Boolean); cdecl; //(Z)V
    function getRenderLocation: TJavaArray<Integer>; cdecl; //()[I
    function getLocation: TJavaArray<Integer>; cdecl; //()[I
    function getRenderSize: TJavaArray<Integer>; cdecl; //()[I
    function getSize: TJavaArray<Integer>; cdecl; //()[I
    procedure setDataSource(path: JString); cdecl; //(Ljava/lang/String;)V
    function getDuration: Int64; cdecl; //()J
    function getCurrentPosition: Int64; cdecl; //()J
    procedure pause; cdecl; //()V
    function isPlaying: Boolean; cdecl; //()Z
    procedure start; cdecl; //()V
    procedure seekTo(time: Int64); cdecl; //(J)V
    procedure setPlayerEventListener(listener: JOnPlayerEventListener); cdecl; //(Lcom/devil/library/video/listener/OnPlayerEventListener;)V
    procedure release; cdecl; //()V

    { Property }
  end;

  TJDVVideoView = class(TJavaGenericImport<JDVVideoViewClass, JDVVideoView>) end;

  JNoTouchSeekBarClass = interface(JAppCompatSeekBarClass) // or JObjectClass // SuperSignature: androidx/appcompat/widget/AppCompatSeekBar
  ['{57DC5A78-88A8-40DD-9FDE-6EB61C035700}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JNoTouchSeekBar; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JNoTouchSeekBar; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JNoTouchSeekBar; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/NoTouchSeekBar')]
  JNoTouchSeekBar = interface(JAppCompatSeekBar) // or JObject // SuperSignature: androidx/appcompat/widget/AppCompatSeekBar
  ['{09E93841-475D-4BF6-BCDE-D0F2CAC875B6}']
    { Property Methods }

    { methods }
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z

    { Property }
  end;

  TJNoTouchSeekBar = class(TJavaGenericImport<JNoTouchSeekBarClass, JNoTouchSeekBar>) end;

  JRangeSeekBarView_OnRangeSeekBarChangeListenerClass = interface(JObjectClass)
  ['{F78DC504-9C00-4B31-9430-3CAB063D7124}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/RangeSeekBarView$OnRangeSeekBarChangeListener')]
  JRangeSeekBarView_OnRangeSeekBarChangeListener = interface(IJavaInstance)
  ['{9E81C2B8-8AF1-437A-B674-4CD8D24CD500}']
    { Property Methods }

    { methods }
    procedure onValuesChangeStart(P1: JRangeSeekBarView; P2: Int64; P3: Int64; P4: Integer; P5: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V
    procedure onValuesChanged(P1: JRangeSeekBarView; P2: Int64; P3: Int64; P4: Integer; P5: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V
    procedure onValuesChangeEnd(P1: JRangeSeekBarView; P2: Int64; P3: Int64; P4: Integer; P5: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V

    { Property }
  end;

  TJRangeSeekBarView_OnRangeSeekBarChangeListener = class(TJavaGenericImport<JRangeSeekBarView_OnRangeSeekBarChangeListenerClass, JRangeSeekBarView_OnRangeSeekBarChangeListener>) end;

  JRangeSeekBarView_ThumbClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{12ABF414-68C1-460D-A22D-81B32DFA2774}']
    { static Property Methods }
    {class} function _GetMIN: JRangeSeekBarView_Thumb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/view/RangeSeekBarView$Thumb;
    {class} function _GetMAX: JRangeSeekBarView_Thumb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/devil/library/video/view/RangeSeekBarView$Thumb;

    { static Methods }
    {class} function values: TJavaObjectArray<JRangeSeekBarView_Thumb>; cdecl; //()[Lcom/devil/library/video/view/RangeSeekBarView$Thumb;
    {class} function valueOf(name: JString): JRangeSeekBarView_Thumb; cdecl; //(Ljava/lang/String;)Lcom/devil/library/video/view/RangeSeekBarView$Thumb;

    { static Property }
    {class} property MIN: JRangeSeekBarView_Thumb read _GetMIN;
    {class} property MAX: JRangeSeekBarView_Thumb read _GetMAX;
  end;

  [JavaSignature('com/devil/library/video/view/RangeSeekBarView$Thumb')]
  JRangeSeekBarView_Thumb = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2373B32C-2EBE-4C7E-BCC9-38BE4A4A7E85}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRangeSeekBarView_Thumb = class(TJavaGenericImport<JRangeSeekBarView_ThumbClass, JRangeSeekBarView_Thumb>) end;

  JRangeSeekBarViewClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{6AA502EA-B648-4DE1-94F3-786496511CBE}']
    { static Property Methods }
    {class} function _GetINVALID_POINTER_ID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetACTION_POINTER_INDEX_MASK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetACTION_POINTER_INDEX_SHIFT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext): JRangeSeekBarView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; attrs: JAttributeSet): JRangeSeekBarView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JRangeSeekBarView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; absoluteMinValuePrim: Int64; P3: Int64): JRangeSeekBarView; cdecl; overload; //(Landroid/content/Context;JJ)V

    { static Property }
    {class} property INVALID_POINTER_ID: Integer read _GetINVALID_POINTER_ID;
    {class} property ACTION_POINTER_INDEX_MASK: Integer read _GetACTION_POINTER_INDEX_MASK;
    {class} property ACTION_POINTER_INDEX_SHIFT: Integer read _GetACTION_POINTER_INDEX_SHIFT;
  end;

  [JavaSignature('com/devil/library/video/view/RangeSeekBarView')]
  JRangeSeekBarView = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{A9D5591A-D673-42A3-BD0C-2EB577C9D531}']
    { Property Methods }

    { methods }
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    procedure setMinShootTime(min_cut_time: Int64); cdecl; //(J)V
    procedure setStartEndTime(start: Int64; P2: Int64); cdecl; //(JJ)V
    procedure setSelectedMinValue(value: Int64); cdecl; //(J)V
    procedure setSelectedMaxValue(value: Int64); cdecl; //(J)V
    procedure setNormalizedMinValue(value: Double); cdecl; //(D)V
    procedure setNormalizedMaxValue(value: Double); cdecl; //(D)V
    function getSelectedMinValue: Int64; cdecl; //()J
    function getSelectedMaxValue: Int64; cdecl; //()J
    function isNotifyWhileDragging: Boolean; cdecl; //()Z
    procedure setNotifyWhileDragging(flag: Boolean); cdecl; //(Z)V
    procedure setTouchDown(touchDown: Boolean); cdecl; //(Z)V
    procedure setOnRangeSeekBarChangeListener(listener: JRangeSeekBarView_OnRangeSeekBarChangeListener); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView$OnRangeSeekBarChangeListener;)V

    { Property }
  end;

  TJRangeSeekBarView = class(TJavaGenericImport<JRangeSeekBarViewClass, JRangeSeekBarView>) end;

  JSpacesItemDecorationClass = interface(JRecyclerView_ItemDecorationClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
  ['{7B306425-42BC-4CA1-9648-85D84B596B41}']
    { static Property Methods }

    { static Methods }
    {class} function init(space: Integer; thumbnailsCount: Integer): JSpacesItemDecoration; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/SpacesItemDecoration')]
  JSpacesItemDecoration = interface(JRecyclerView_ItemDecoration) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$ItemDecoration
  ['{09C9D30C-A185-4571-9A0C-4D910C357474}']
    { Property Methods }

    { methods }
    procedure getItemOffsets(outRect: JRect; view: JView; parent: JRecyclerView; state: JRecyclerView_State); cdecl; //(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V

    { Property }
  end;

  TJSpacesItemDecoration = class(TJavaGenericImport<JSpacesItemDecorationClass, JSpacesItemDecoration>) end;

  JTextureRenderView_OnPreparedListenerClass = interface(JObjectClass)
  ['{0959B368-83E2-464A-AD36-E628A74E148E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/TextureRenderView$OnPreparedListener')]
  JTextureRenderView_OnPreparedListener = interface(IJavaInstance)
  ['{6E2C97B5-2556-4B71-8BFC-1C6A90BBBF29}']
    { Property Methods }

    { methods }
    procedure onPrepared; cdecl; //()V

    { Property }
  end;

  TJTextureRenderView_OnPreparedListener = class(TJavaGenericImport<JTextureRenderView_OnPreparedListenerClass, JTextureRenderView_OnPreparedListener>) end;

  JTextureRenderViewClass = interface(JTextureViewClass) // or JObjectClass // SuperSignature: android/view/TextureView
  ['{4964E100-1DC7-4383-BEA9-75F1715AC3FA}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JTextureRenderView; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/TextureRenderView')]
  JTextureRenderView = interface(JTextureView) // or JObject // SuperSignature: android/view/TextureView
  ['{2E28B2B7-6D51-4D74-AA7C-5AB2305C04FF}']
    { Property Methods }

    { methods }
    procedure setOnPreparedListener(listener: JTextureRenderView_OnPreparedListener); cdecl; //(Lcom/devil/library/video/view/TextureRenderView$OnPreparedListener;)V
    procedure attachToPlayer(player: JIMediaPlayer); cdecl; //(Lcom/devil/library/video/common/IMediaPlayer;)V
    procedure setVideoSize(videoWidth: Integer; videoHeight: Integer); cdecl; //(II)V
    procedure setZoomScale(mZoomScale: Single); cdecl; //(F)V
    procedure setVideoRotation(degree: Integer); cdecl; //(I)V
    function getSizeRatio: TJavaArray<Single>; cdecl; //()[F
    procedure setScaleType(scaleType: Integer); cdecl; //(I)V
    procedure setVideoRatio(videoWidthRatio: Integer; videoHeightRatio: Integer); cdecl; //(II)V
    function getView: JView; cdecl; //()Landroid/view/View;
    function doScreenShot: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    procedure release; cdecl; //()V
    procedure onSurfaceTextureAvailable(surfaceTexture: JSurfaceTexture; width: Integer; height: Integer); cdecl; //(Landroid/graphics/SurfaceTexture;II)V
    procedure onSurfaceTextureSizeChanged(surface: JSurfaceTexture; width: Integer; height: Integer); cdecl; //(Landroid/graphics/SurfaceTexture;II)V
    function onSurfaceTextureDestroyed(surface: JSurfaceTexture): Boolean; cdecl; //(Landroid/graphics/SurfaceTexture;)Z
    procedure onSurfaceTextureUpdated(surface: JSurfaceTexture); cdecl; //(Landroid/graphics/SurfaceTexture;)V

    { Property }
  end;

  TJTextureRenderView = class(TJavaGenericImport<JTextureRenderViewClass, JTextureRenderView>) end;

  JVideoCropViewClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{974C8B33-C15F-456B-9D82-0330B9552C8A}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JVideoCropView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function init(context: JContext; attrs: JAttributeSet): JVideoCropView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext): JVideoCropView; cdecl; overload; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/VideoCropView')]
  JVideoCropView = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{3D4EC4E0-2176-49AF-A4C0-AB63209DB332}']
    { Property Methods }

    { methods }
    procedure setCanEdit(isCanEdit: Boolean); cdecl; //(Z)V
    procedure setOnlyMove(onlyMove: Boolean); cdecl; //(Z)V
    procedure setOnlyMoveLimit(top: Single; bottom: Single); cdecl; //(FF)V
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl; //(Landroid/view/MotionEvent;)Z
    function getCutValue: TJavaArray<Single>; cdecl; //()[F
    function getRectWidth: Integer; cdecl; //()I
    function getRectHeight: Integer; cdecl; //()I
    procedure setMargin(left: Single; top: Single; right: Single; bottom: Single); cdecl; //(FFFF)V

    { Property }
  end;

  TJVideoCropView = class(TJavaGenericImport<JVideoCropViewClass, JVideoCropView>) end;

//  JVideoTrimView_1_1Class = interface(JObjectClass)
//  ['{6B162D1E-210D-4533-80D2-8CC9606D8DD9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$1$1')]
//  JVideoTrimView_1_1 = interface(JObject)
//  ['{1D369462-E3FC-4EDA-84A9-6AB48639C173}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJVideoTrimView_1_1 = class(TJavaGenericImport<JVideoTrimView_1_1Class, JVideoTrimView_1_1>) end;

//  JVideoTrimView_1Class = interface(JObjectClass)
//  ['{8B256F1D-5BB3-422F-9BB8-FDFE49696670}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$1')]
//  JVideoTrimView_1 = interface(JObject)
//  ['{69C63FB0-2019-4142-9840-F1093E8D853F}']
//    { Property Methods }
//
//    { methods }
//    procedure onSingleCallback(bitmap: JBitmap; interval: JLong); cdecl; overload; //(Landroid/graphics/Bitmap;Ljava/lang/Long;)V
//    procedure onSingleCallback(this: JObject; P2: JObject); cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)V
//
//    { Property }
//  end;

//  TJVideoTrimView_1 = class(TJavaGenericImport<JVideoTrimView_1Class, JVideoTrimView_1>) end;

//  JVideoTrimView_2Class = interface(JObjectClass)
//  ['{11090C80-9E9B-4066-B5C0-B8A0FCB2848C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$2')]
//  JVideoTrimView_2 = interface(JObject)
//  ['{3DA4C296-5A9F-4FD3-9B23-2A5CEE23C9CB}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(view: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJVideoTrimView_2 = class(TJavaGenericImport<JVideoTrimView_2Class, JVideoTrimView_2>) end;

//  JVideoTrimView_3Class = interface(JObjectClass)
//  ['{CB502CE5-A8A6-47AC-85BE-F410440C2308}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$3')]
//  JVideoTrimView_3 = interface(JObject)
//  ['{6FD78ED0-72CA-4925-BEDD-7747A88D6BE8}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(view: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJVideoTrimView_3 = class(TJavaGenericImport<JVideoTrimView_3Class, JVideoTrimView_3>) end;

//  JVideoTrimView_4Class = interface(JObjectClass)
//  ['{6C6ECC60-BC33-42A6-8A8B-E72A2B259B76}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$4')]
//  JVideoTrimView_4 = interface(JObject)
//  ['{351A0724-1E50-48AE-BDB2-951A91402CEF}']
//    { Property Methods }
//
//    { methods }
//    procedure onError; cdecl; //()V
//    procedure onCompletion; cdecl; //()V
//    procedure onInfo(what: Integer; extra: Integer); cdecl; //(II)V
//    procedure onPrepared; cdecl; //()V
//    procedure onVideoSizeChanged(width: Integer; height: Integer); cdecl; //(II)V
//
//    { Property }
//  end;

//  TJVideoTrimView_4 = class(TJavaGenericImport<JVideoTrimView_4Class, JVideoTrimView_4>) end;

//  JVideoTrimView_5Class = interface(JObjectClass)
//  ['{8CDC3364-6F09-4629-8E3D-60DD53C2D40E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$5')]
//  JVideoTrimView_5 = interface(JObject)
//  ['{7E58909F-5334-45F8-821C-7C13306D192F}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(v: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJVideoTrimView_5 = class(TJavaGenericImport<JVideoTrimView_5Class, JVideoTrimView_5>) end;

//  JVideoTrimView_6Class = interface(JObjectClass)
//  ['{D1E4ED92-6F89-4E4B-8CCC-2F582A73BC1D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$6')]
//  JVideoTrimView_6 = interface(JObject)
//  ['{B230DCFA-058C-4B41-964C-9C63AAFB11E1}']
//    { Property Methods }
//
//    { methods }
//    procedure onValuesChangeStart(bar: JRangeSeekBarView; minValue: Int64; P3: Int64; maxValue: Integer; action: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V
//    procedure onValuesChanged(bar: JRangeSeekBarView; minValue: Int64; P3: Int64; maxValue: Integer; action: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V
//    procedure onValuesChangeEnd(bar: JRangeSeekBarView; minValue: Int64; P3: Int64; maxValue: Integer; action: Boolean; P6: JRangeSeekBarView_Thumb); cdecl; //(Lcom/devil/library/video/view/RangeSeekBarView;JJIZLcom/devil/library/video/view/RangeSeekBarView$Thumb;)V
//
//    { Property }
//  end;

//  TJVideoTrimView_6 = class(TJavaGenericImport<JVideoTrimView_6Class, JVideoTrimView_6>) end;

//  JVideoTrimView_7Class = interface(JRecyclerView_OnScrollListenerClass) // or JObjectClass // SuperSignature: androidx/recyclerview/widget/RecyclerView$OnScrollListener
//  ['{CD4FFB9E-F12E-443D-AE6C-963EEE35AFE8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$7')]
//  JVideoTrimView_7 = interface(JRecyclerView_OnScrollListener) // or JObject // SuperSignature: androidx/recyclerview/widget/RecyclerView$OnScrollListener
//  ['{71A4630F-411B-4D47-86B4-B76BD725C9F7}']
//    { Property Methods }
//
//    { methods }
//    procedure onScrollStateChanged(recyclerView: JRecyclerView; newState: Integer); cdecl; //(Landroidx/recyclerview/widget/RecyclerView;I)V
//    procedure onScrolled(recyclerView: JRecyclerView; dx: Integer; dy: Integer); cdecl; //(Landroidx/recyclerview/widget/RecyclerView;II)V
//
//    { Property }
//  end;

//  TJVideoTrimView_7 = class(TJavaGenericImport<JVideoTrimView_7Class, JVideoTrimView_7>) end;

//  JVideoTrimView_8Class = interface(JObjectClass)
//  ['{7C18C664-3675-4341-9880-DC448F81DD0A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/devil/library/video/view/VideoTrimView$8')]
//  JVideoTrimView_8 = interface(JObject)
//  ['{1CB2AF30-425B-4605-9FCE-830CFB6AC68B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJVideoTrimView_8 = class(TJavaGenericImport<JVideoTrimView_8Class, JVideoTrimView_8>) end;

  JVideoTrimViewClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
  ['{4C457E1E-BACA-458A-8863-CA4B329FB9ED}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; attrs: JAttributeSet): JVideoTrimView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JVideoTrimView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    { static Property }
  end;

  [JavaSignature('com/devil/library/video/view/VideoTrimView')]
  JVideoTrimView = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
  ['{C571272C-9AB3-45CB-AAA8-1AF1463087AE}']
    { Property Methods }

    { methods }
    procedure setMaxShootDuration(maxShootDuration: Integer); cdecl; //(I)V
    procedure setMinShootDuration(minShootDuration: Integer); cdecl; //(I)V
    procedure initVideoByPath(videoPath: JString); cdecl; //(Ljava/lang/String;)V
    procedure onVideoPause; cdecl; //()V
    procedure setOnTrimVideoListener(onTrimVideoListener: JOnSelectVideoTrimListener); cdecl; //(Lcom/devil/library/video/listener/OnSelectVideoTrimListener;)V
    procedure setRestoreState(fromRestore: Boolean); cdecl; //(Z)V
    procedure release; cdecl; //()V

    { Property }
  end;

  TJVideoTrimView = class(TJavaGenericImport<JVideoTrimViewClass, JVideoTrimView>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_FilterHolder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_FilterHolder));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_onFilterChangeListener',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter_onFilterChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterTypeHelper',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterTypeHelper));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_CameraOpenOverCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_CameraOpenOverCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_ErrorCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_ErrorCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_FocusCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_FocusCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_StopRecordCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_StopRecordCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_TakePictureCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface_TakePictureCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_5));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_LongPressRunnable',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_LongPressRunnable));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_RecordCountDownTimer',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton_RecordCountDownTimer));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureButton));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout_7));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureLayout));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFoucsView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFoucsView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi_CompareAreaSize',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi_CompareAreaSize));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraApi));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraController_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraController_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraController',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraController));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraPreviewPresenter));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_3_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_3_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_7_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_7_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_7));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_8',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_8));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView_9));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCaptureListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JClickListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JErrorListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JErrorListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFocusCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFocusCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JJCameraListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnCaptureListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnCaptureListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnFpsListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnFpsListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnFrameAvailableListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnFrameAvailableListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnPreviewCaptureListener_MediaType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnPreviewCaptureListener_MediaType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnPreviewCaptureListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnPreviewCaptureListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnRecordListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnRecordListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnRecordStateListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnRecordStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnSurfaceTextureListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnSurfaceTextureListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewCallback));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JResultListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JResultListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JReturnListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JReturnListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTypeListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTypeListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioEncoder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioRecorder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioRecorder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioTranscoder_UnhandledFormatException',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioTranscoder_UnhandledFormatException));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioTranscoder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioTranscoder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JHWMediaRecorder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JHWMediaRecorder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JSonic',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JSonic));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoEncoder_OnEncodingListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoEncoder_OnEncodingListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoEncoder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoRecorder_RecordHandler',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoRecorder_RecordHandler));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoRecorder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoRecorder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAspectRatio',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAspectRatio));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioParams',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioParams));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCalculateType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCalculateType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParam',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParam));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaInfo',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaInfo));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRecordInfo',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRecordInfo));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoParams',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoParams));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraRenderer',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraRenderer));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraRenderHandler',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraRenderHandler));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFrameRateMeter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFrameRateMeter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader_ImageAvailable',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader_ImageAvailable));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader_ImageReceiveListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader_ImageReceiveListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JGLImageReader));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRenderIndex',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRenderIndex));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRenderManager',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRenderManager));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JScaleType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JScaleType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JReturnButton',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JReturnButton));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBorrowPictureState',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBorrowPictureState));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBorrowVideoState',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBorrowVideoState));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraMachine',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraMachine));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JPreviewState));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JState',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JState));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTypeButton',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTypeButton));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAngleUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAngleUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAudioUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAudioUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil_CameraSizeComparator',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil_CameraSizeComparator));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraParamUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCheckPermission',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCheckPermission));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDeviceUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDeviceUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFileUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFileUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JLogUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JLogUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JScreenUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JScreenUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JCameraView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JCameraView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_10',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_10));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_11',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_11));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_12',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_12));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_13',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_13));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_14',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_14));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_7));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_8',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_8));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_9',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView_9));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_OnMultiClickListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_OnMultiClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_OnTouchScroller',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView_OnTouchScroller));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVTextureView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFolderLVAdapter_ViewHolder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFolderLVAdapter_ViewHolder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFolderLVAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFolderLVAdapter));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_OnItemCheckListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter_OnItemCheckListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaRVAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPAdapter));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter_OnItemClickListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter_OnItemClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBaseRVAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBaseVPFragmentAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBaseVPFragmentAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JEasyRVHolder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JEasyRVHolder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFolderInfo',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFolderInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaInfo_150',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaInfo_150));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JBuildConfig',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageLoader',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageLoader));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaTempListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaTempListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraConfig_Builder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraConfig',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraConfig));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVListConfig_Builder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVListConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVListConfig',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVListConfig));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnAdjustChangeListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnAdjustChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnFilterActionListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnFilterActionListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnImageSaveListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnImageSaveListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnItemClickListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnItemClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnSelectMediaListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnSelectMediaListener));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaSelectorManager_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaSelectorManager_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaSelectorManager',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaSelectorManager));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBaseActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBaseActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity_6));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVBeautyCameraActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity_6));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVCameraActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVEasyVideoPlayActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVEasyVideoPlayActivity_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVEasyVideoPlayActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVEasyVideoPlayActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVEditPhotoActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVEditPhotoActivity_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVEditPhotoActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVEditPhotoActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVMediaSelectActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVSystemCameraActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_3_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_3_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageFilterFragment));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_7));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_8',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_8));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_9_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_9_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_9',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment_9));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaListFragment));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaFragment_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaFragment_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaFragment',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaFragment));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JWatchMediaVPItemFragment));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidRomUtil_BuildProperties',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidRomUtil_BuildProperties));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidRomUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidRomUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDisplayUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDisplayUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVFileProvider',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVFileProvider));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFileUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFileUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JLayoutManagerHelper',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JLayoutManagerHelper));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_1_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_1_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_2_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_2_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_OnLoadCallBack',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils_OnLoadCallBack));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaDataUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaFileTypeUtils_MediaFileType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaFileTypeUtils_MediaFileType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMediaFileTypeUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMediaFileTypeUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JStatusBarUtil_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JStatusBarUtil_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JStatusBarUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JStatusBarUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JSystemUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JSystemUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDividerGridItemDecoration',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDividerGridItemDecoration));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceLayout));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVImageSurfaceView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVZoomImageSurfaceView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVZoomImageSurfaceView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView_TextAnimationListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView_TextAnimationListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFadeInTextView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterAdjustView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterToolView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterToolView_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JFilterToolView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JFilterToolView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JGraduallyTextView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JGraduallyTextView_1));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JGraduallyTextView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JGraduallyTextView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JHackyViewPager',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JHackyViewPager));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRatioImageView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRatioImageView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JSquareRelativeLayout',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JSquareRelativeLayout));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_DismissListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_DismissListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_MyDialog',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog_MyDialog));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTipLoadDialog));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekChangeListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekDefaultListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekDefaultListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekDownListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_OnSeekDownListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_SeekBarGestureListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar_SeekBarGestureListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTwoLineSeekBar));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimAdapter_TrimmerViewHolder',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimAdapter_TrimmerViewHolder));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimAdapter',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoCropFrameInfo',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoCropFrameInfo));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAbstractPlayer',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAbstractPlayer));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer_7));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JAndroidMediaPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JIMediaPlayer',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JIMediaPlayer));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnGetVideoFrameListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnGetVideoFrameListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnPlayerEventListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnPlayerEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnSelectVideoTrimListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnSelectVideoTrimListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JOnVideoTrimListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JOnVideoTrimListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JSingleCallback',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JSingleCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoCropActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoTrimActivity));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDateUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDateUtil));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVLinearLayoutManager',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVLinearLayoutManager));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageUtils_ImageType',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageUtils_ImageType));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JImageUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JImageUtils));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JMeasureHelper',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JMeasureHelper));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JScreenUtils_297',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JScreenUtils_297));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JShaderUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JShaderUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_LinkedBlockingQueue4Util',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_LinkedBlockingQueue4Util));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_SimpleTask',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_SimpleTask));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_5));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_OnTimeoutListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task_OnTimeoutListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_Task));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_TaskInfo',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_TaskInfo));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_ThreadPoolExecutor4Util',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_ThreadPoolExecutor4Util));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils_UtilsThreadFactory));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JThreadUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager_2));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoMediaManager));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView_3));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JDVVideoView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JNoTouchSeekBar',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JNoTouchSeekBar));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView_OnRangeSeekBarChangeListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView_OnRangeSeekBarChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView_Thumb',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView_Thumb));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JRangeSeekBarView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JSpacesItemDecoration',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JSpacesItemDecoration));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTextureRenderView_OnPreparedListener',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTextureRenderView_OnPreparedListener));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JTextureRenderView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JTextureRenderView));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoCropView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoCropView));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_1_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_1_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_1',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_1));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_2',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_2));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_3',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_3));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_4',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_4));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_5',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_5));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_6',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_6));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_7',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_7));
//  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_8',
//    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView_8));
  TRegTypes.RegisterType('Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView',
    TypeInfo(Androidapi.JNI.DVMediaSelector_2_0_1.JVideoTrimView));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
