
### 补丁列表
状态 | 补丁 | 说明 | 文件位置 | 作者
------------ | ------------ | ------------ | ------------- | -------------
 √ | [RSP-17890](https://quality.embarcadero.com/browse/RSP-17890) [qdac1](http://blog.qdac.cc/?p=4791) | 为 TPathData 加入 Q/q、T/t 命令的支持， 以及对 A/a 指令修正 | `FMX.Graphics.pas` | **swish( QDAC )**
 √ | [RSP-18043](https://quality.embarcadero.com/browse/RSP-18043) | 无法启动， 启动画面后闪退 | `FMX.Platform.Android.pas` `FMX.Platform.Timer.Android.pas` | **swish( QDAC )**
 √ | [RSP-19525](https://quality.embarcadero.com/browse/RSP-19525) [qdac1](http://blog.qdac.cc/?p=4547) [qdac2](http://blog.qdac.cc/?p=4791) | AnimateXXWait 造成程序被挂起的问题 | `FMX.Dialogs.Win.pas` | **swish( QDAC )**
 √ | [RSP-10443](https://quality.embarcadero.com/browse/RSP-10443) [qdac1](http://blog.qdac.cc/?p=4547) [qdac2](http://blog.qdac.cc/?p=4791) | Windows 下打印对话框 没有正确返回打印份数 | `FMX.Dialogs.Win.pas` | **swish( QDAC )**
 √ | [RSP-19681](https://quality.embarcadero.com/browse/RSP-19681) | Android 下,FormCreate/FormResize 里， ClientWidth / ClientHeight 的值可能为0 | `FMX.Platform.Android.pas` | **swish( QDAC )**
 √ | [RSP-18047](https://quality.embarcadero.com/browse/RSP-18047) | TBrowseForFolder 窗口被遮挡 | `Vcl.StdActns.pas` `Vcl.OleCtnrs.pas` `Vcl.Dialogs.pas` | **swish( QDAC )**
 √ | [RSP-19678](https://quality.embarcadero.com/browse/RSP-19678) | Android 下 TMediaPlayer.CurrentTime/DuringTime 精度不正确的问题 （应为 100 纳秒， 实际精度为毫秒， 官方忘了 ×10000） | `FMX.Media.Android.pas` | **swish( QDAC )**
 √ | | Windows下使用 低功耗蓝牙 的无效指针 | `System.Win.BluetoothWinRT.pas` | **swish( QDAC )**
 √ | [qdac补丁集](http://blog.qdac.cc/?p=4485) | iOS在特定场景 输入法隐藏时抛出异常 | `FMX.VirtualKeyboard.iOS.pas` | **swish( QDAC )**
 √ | [qdac防误触](http://blog.qdac.cc/?p=4430) | 防误触 | `FMX.Forms.pas` | **swish( QDAC )**
 √ | [RSP-18656](https://quality.embarcadero.com/browse/RSP-18656) | add setMinimumBackgroundFetchInterval / endBackgroundTask / beginBackgroundTaskWithExpirationHandler to UIApplication | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-18670](https://quality.embarcadero.com/browse/RSP-18670) | add isRegisteredForRemoteNotifications | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-18314](https://quality.embarcadero.com/browse/RSP-18314) | add setTextContainerInset and textContainerInset to UITextView | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-16971](https://quality.embarcadero.com/browse/RSP-16971) | add setDefaultTextAttributes and setAttributedPlaceholder to UITextField | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-18013](https://quality.embarcadero.com/browse/RSP-18013) | add UIApplicationOpenURLOptions (AnnotationKey / SourceApplicationKey) | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-18662](https://quality.embarcadero.com/browse/RSP-18662) | work with android:targetSdkVersion="23" | `iOSapi.UIKit.pas` | **Zeus64**
 √ | [RSP-19877](https://quality.embarcadero.com/browse/RSP-19877) | add setValue to NSObject | `iOSapi.Foundation.pas` | **Zeus64**
 √ | [RSP-18621](https://quality.embarcadero.com/browse/RSP-18621) | add CLVisit to CLLocationManager | `iOSapi.CoreLocation.pas` | **Zeus64**
 √ | [RSP-15717](https://quality.embarcadero.com/browse/RSP-15717) | correct CLRegion.initCircularRegionWithCenter | `iOSapi.CoreLocation.pas` | **Zeus64**
 √ | [RSP-16857](https://quality.embarcadero.com/browse/RSP-16857) | add addObserver to nsObject | `iOSapi.AVFoundation.pas` | **Zeus64**
 √ | [RSP-16853](https://quality.embarcadero.com/browse/RSP-16853) | add addOutput to AVPlayerItem | `iOSapi.AVFoundation.pas` | **Zeus64**
 √ | [RSP-19687](https://quality.embarcadero.com/browse/RSP-19687) | multithread bitmap: TTexture | `FMX.Types3D.pas` | **Zeus64**
 √ | [RSP-16829](https://quality.embarcadero.com/browse/RSP-16829) | TCustomContextOpenGL.BuildShader crash if acode contain non-preprocessor tokens | `FMX.Context.GLES.pas` | **Zeus64**
 √ | [RSP-16830](https://quality.embarcadero.com/browse/RSP-16830) | GL_TEXTURE_EXTERNAL_OES supported | `FMX.Context.GLES.pas` `FMX.Canvas.GPU.Helpers.pas` | **Zeus64**
 √ | [RSP-19665](https://quality.embarcadero.com/browse/RSP-19665) | SubdivCount is unecessary in GetCircleSubdivCount | `FMX.Canvas.GPU.Helpers.pas` | **Zeus64**
 √ | [RSP-18797](https://quality.embarcadero.com/browse/RSP-18797) | add CanvasHelper | `FMX.Canvas.GPU.pas` | **Zeus64**
 √ | [RSP-15971](https://quality.embarcadero.com/browse/RSP-15971) | order of the button is wrong in messageDialog under IOS | `FMX.Dialogs.iOS.pas` | **Zeus64**
 √ | [RSP-18686](https://quality.embarcadero.com/browse/RSP-18686) | on android TApplicationEvent.WillBecomeInactive is called AFTER TApplicationEvent.EnteredBackground | `FMX.Platform.Android.pas` | **Zeus64**
 √ | [RSP-16369](https://quality.embarcadero.com/browse/RSP-16369) | out of the screen | `FMX.Platform.Android.pas` | **Zeus64**
 √ | [RSP-20676](https://quality.embarcadero.com/browse/RSP-20676) | | `FMX.Graphics.pas` | **Zeus64**
 √ | [RSP-19673](https://quality.embarcadero.com/browse/RSP-19673) | | `FMX.Graphics.pas` | **Zeus64**
 √ | [RSP-20662](https://quality.embarcadero.com/browse/RSP-20662) | TFDMemTable raise the error "Could not convert variant of type (Null) into type (Integer)" | `FireDAC.DatS.pas` | **Flying Wang**
 √ | [RSP-18838](https://quality.embarcadero.com/browse/RSP-18838) | ClientDataset open cds file Chinese FiledName display garbled code | `Datasnap.Provider.pas` `Datasnap.DBClient.pas` | **Flying Wang**
 √ | [RSP-13208](https://quality.embarcadero.com/browse/RSP-13208) | fix AutoFocus mode of TCameraComponent | `FMX.Media.Android.pas` | **Flying Wang**
 √ | [RSP-16568](https://quality.embarcadero.com/browse/RSP-16568) | ShowMessage长文字省略号 | `Vcl.Dialogs.pas` | **Flying Wang**
 √ | [RSP-16590](https://quality.embarcadero.com/browse/RSP-16590) | 中英文混排问题 | `FMX.TextLayout.GPU.pas` | **Flying Wang**
 √ | [RSP-12698](https://quality.embarcadero.com/browse/RSP-12698) | 修正动画执行时， win32程序无法退出 | `FMX.TabControl.pas` `FMX.Ani.pas` | **Flying Wang** **爱吃猪头肉**
 √ | [RSP-20650](https://quality.embarcadero.com/browse/RSP-20650) | 修改默认的字体。 | `FMX.Platform.Win.pas` | **Flying Wang**
 √ | [RSP-17308](https://quality.embarcadero.com/browse/RSP-17308) | | `FMX.Forms.pas` | **Flying Wang**
 √ | [盒子1](http://bbs.2ccc.com/topic.asp?topicid=529138) | 屏蔽__dbk_fcall_wrapper 和 dbkFcallWrapperAddr | `System.Rtti.pas` | **Flying Wang**
 √ | [盒子1](http://bbs.2ccc.com/topic.asp?topicid=534253) [盒子2](http://bbs.2ccc.com/topic.asp?topicid=536175) | ftBCD 格式 | `Fmx.Bind.Grid.pas` | **[合肥]全能地图**
 √ | | 添加获取状态栏高度 / 导航栏高度 / 不显示默认粘贴复制 | `FMX.Platform.Android.pas` | **Flying Wang**
 √ | | MessageDialog增强 | `FMX.Dialogs.Android.pas` | **Flying Wang**
 √ | | 添加Android下的错误日志 | `System.Internal.ExcUtils.pas` | **Flying Wang**
 √ | | 添加接受bmp错误检查 | `FMX.MediaLibrary.Android.pas` | **Flying Wang**
 √ | | 安卓键盘优化 | `FMX.VirtualKeyboard.Android.pas` | **Flying Wang**
 √ | | WebBrowser 重定向关键字 / EvaluateJavaScript / RealWebBrowserObject | `FMX.WebBrowser.pas` `FMX.WebBrowser.*.pas` | **Flying Wang** **爱吃猪头肉**
 √ | | 修正创建TJTelephonyManager | `FMX.PhoneDialer.Android.pas` | **爱吃猪头肉**
 √ | | 添加 CallInUIThreadMayWaitFinishing / CheckUIThread | `FMX.Helpers.Android.pas` | **爱吃猪头肉**
 √ | | 修正bmp为空 | `FMX.Grid.pas` | **爱吃猪头肉**
 √ | | iOS输入小数点 | `FMX.Grid.iOS.pas` | **风舞轻扬**
 √ | | listview越界问题 | `FMX.TextLayout.GPU.pas` | **Flying Wang** **老新手**
 √ | | 兼容部分蓝牙模块， 接收数据不完整或空 | `System.Android.Bluetooth.pas` | **jingsha**
 √ | [RSP-17794](https://quality.embarcadero.com/browse/RSP-17794) | Header 不会绘制多余的 Object | `FMX.ListView.pas` | **xubzhlin**
 √ | [RSP-15598](https://quality.embarcadero.com/browse/RSP-15598) | TTakePhotoFromCamera raise exception when no Focus/ActiveControl in form | `FMX.MediaLibrary.Actions.pas` | **[重庆]老新手**
 √ | [RSP-16935](https://quality.embarcadero.com/browse/RSP-16935) | | `FMX.Platform.Android.pas` | **Alysson Cunha**
 √ | [RSP-18847](https://quality.embarcadero.com/browse/RSP-18847) | TFDStoredProc can not get the return value | `FireDAC.Phys.SQLGenerator.pas` | **[合肥]全能地图**
 √ | [RSP-18202](https://quality.embarcadero.com/browse/RSP-18202) [1](http://www.raysoftware.cn/?p=475) | 自定义字体 | `FMX.FontGlyphs.Android.pas` | **Flying Wang** **wr960204** **swish( QDAC )**
 √ | [RSP-17792](https://quality.embarcadero.com/browse/RSP-17792) [RSP-17793](https://quality.embarcadero.com/browse/RSP-17793) | 修正SpeedButton在同一个组的时候， 右边和下边点击状态不对， 移出控件后放开， 也不正确 | `FMX.StdCtrls.pas` | **Aone**
 √ | [RSP-14309](https://quality.embarcadero.com/browse/RSP-14309) [Aone1](http://www.cnblogs.com/onechen/p/5441187.html) [Aone2](http://www.cnblogs.com/onechen/p/5319631.html) | 修复曲线最后一点断线的问题 | `FMX.StrokeBuilder.pas` | **Aone**
 √ | [RSP-16670](https://quality.embarcadero.com/browse/RSP-16670) [2](http://www.cnblogs.com/onechen/p/6226933.html) | InputQuery Cancel 按钮工作不正常的问题 | `FMX.DialogHelper.pas` | **Aone**
 √ | [Aone1](http://www.cnblogs.com/onechen/p/6906823.html) | 文字斜粗显示 | `FMX.FontGlyphs.Android.pas` | **Aone**
 √ | | 修正避开首字标点 修正显示省略字符 | `FMX.TextLayout.GPU.pas` | **Aone**
 √ | [Aone1](http://www.cnblogs.com/onechen/p/4409396.html) | 修复XE8 FMX Windows 列印旋转文字问题 | `FMX.Printer.Win.pas` | **Aone**
 √ | [Aone1](http://www.cnblogs.com/onechen/p/7852813.html) | 修正中文输入后会 取消原选取文字 | `FMX.Memo.Style.pas` `FMX.Edit.Style.pas` | **Aone**
 √ | | | `FMX.FontGlyphs.iOS.pas` | **[深圳]DoubleWood** **Aone**
 √ | [RSP-18215](https://quality.embarcadero.com/browse/RSP-18215) | TDateTimePicker 增加日期时间类型 | `Vcl.ComCtrls.pas` | **LakeView**
 √ | | WebBrowser 加函数UI线程 调用 / 释放时 AV错误修正 | `FMX.WebBrowser.Android.pas` | **DelphiTeacher( OrangeUI )**
 √ | | WebBrowser 释放时AV错误修正 | `FMX.WebBrowser.Android.pas` | **KngStr**
 √ | | Android bitmap recycle / AV错误修正 | `FMX.Graphics.Android.pas` | **KngStr**
