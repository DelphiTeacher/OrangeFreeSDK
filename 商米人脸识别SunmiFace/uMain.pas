//---------------------------------------------------------------------------

// This software is Copyright (c) 2015-2019 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Media,


  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
//    {$IF RTLVersion>=33}// 10.3+
//    System.Permissions, // 动态权限单元
//    {$ENDIF}
//    uAndroidPermission_D10_2,
  {$ENDIF}
  uSunmiFaceSDK,

//  FMX.Dialogs,
//  FlyFilesUtils,
  Androidapi.JNI.Environment,
  Androidapi.JNI.facelib_release_aar,
  Androidapi.JNI.mysunmifacelibrary_debug_aar,
  FMX.Surfaces,
  FMX.Graphics,
  uGraphicCommon,
  uFireMonkeyDrawCanvas,

  DateUtils,
  Math,

  FMX.Objects, FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, System.Messaging, FMX.Ani,
  uSkinFireMonkeyControl, uSkinImageType, uSkinRoundImageType,
  uSkinFireMonkeyRoundImage;

type
  TCameraComponentForm = class(TForm)
    btnSettings: TButton;
    ActionList: TActionList;
    actStart: TAction;
    actStop: TAction;
    actShowSettings: TAction;
    CameraComponent: TCameraComponent;
    btnStartStopCamera: TButton;
    imgCameraView: TImage;
    tbToolbar: TToolBar;
    lToolbarTitle: TLabel;
    RectAnimation1: TRectAnimation;
    RectAnimation2: TRectAnimation;
    imgFrame: TSkinFMXRoundImage;
    Button1: TButton;

    procedure actStopExecute(Sender: TObject);
    procedure actStartExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actShowSettingsExecute(Sender: TObject);
    { Broadcast }
    procedure CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure imgCameraViewPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure FormCreate(Sender: TObject);
  private
    FPermissionCamera: string;
    FSavedCameraActive: Boolean;
    FLastCheckTime:TDateTime;
    FImageRealDrawRectInView:TRectF;

    procedure DisplayCameraPreviewFrame;
    procedure ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
    procedure ApplicationEventChangedHandler(const Sender: TObject; const AMessage: TMessage);
  public
    FSunmiFaceSDK:TSunmiFaceSDK;
    procedure DoDetectedFace(Sender:TObject;AId:String;AName:String);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;





var
  CameraComponentForm: TCameraComponentForm;



implementation

uses
//{$IFDEF ANDROID}
//  Androidapi.Helpers,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.Os,
//{$ENDIF}
  FMX.Platform, FMX.DialogService, uSettings;

{$R *.fmx}

constructor TCameraComponentForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventChangedHandler);
{$IFDEF ANDROID}
  FPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
{$ENDIF}
end;

procedure TCameraComponentForm.ActionListExecute(Action: TBasicAction; var Handled: Boolean);
begin
  if not PermissionsService.IsPermissionGranted(FPermissionCamera) then
  begin
    Handled := True;
    PermissionsService.RequestPermissions([FPermissionCamera], ActivateCameraPermissionRequestResult, DisplayRationale);
  end;
end;

procedure TCameraComponentForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  if CameraComponent.Active then
    btnStartStopCamera.Action := actStop
  else
    btnStartStopCamera.Action := actStart;
end;

procedure TCameraComponentForm.actShowSettingsExecute(Sender: TObject);
var
  SavedCameraActive: Boolean;
begin
  SavedCameraActive := CameraComponent.Active;
  SettingsForm.Camera := CameraComponent;
  CameraComponent.Active := False;
  SettingsForm.ShowModal(procedure (AResult: TModalResult)
  begin
    CameraComponent.Active := SavedCameraActive;
  end);
end;

procedure TCameraComponentForm.actStartExecute(Sender: TObject);
begin
  CameraComponent.Active := True;
end;

procedure TCameraComponentForm.actStopExecute(Sender: TObject);
begin
  CameraComponent.Active := False;
end;

procedure TCameraComponentForm.ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  // 1 permission involved: CAMERA
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    { Turn on the Camera }
    CameraComponent.Active := True;
    FSavedCameraActive := True;
  end
  else
    TDialogService.ShowMessage('Cannot start the camera because the required permission has not been granted');
end;

// Optional rationale display routine to display permission requirement rationale to the user
procedure TCameraComponentForm.DisplayRationale(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc);
begin
  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage('The app needs to access the camera in order to work',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TCameraComponentForm.DoDetectedFace(Sender: TObject; AId,
  AName: String);
begin
  TThread.Synchronize(nil,procedure
  begin
    actStopExecute(nil);
    ShowMessage('识别到了'+AName);
  end);
end;

procedure TCameraComponentForm.FormCreate(Sender: TObject);
begin
  IsDrawRoundRectByBufferOnAndroid:=False;
end;

procedure TCameraComponentForm.imgCameraViewPaint(Sender: TObject;
  Canvas: TCanvas; const ARect: TRectF);
begin
//  if FImageRealDrawRectInView.Width>0 then
//  begin
//    Canvas.Stroke.Thickness:=2;
//    Canvas.Stroke.Kind:=TBrushKind.Solid;
//    Canvas.Stroke.Color:=TAlphaColorRec.Red;
//    Canvas.DrawRect(Self.FImageRealDrawRectInView,0,0,[],1);
//  end;
end;

procedure TCameraComponentForm.ApplicationEventChangedHandler(const Sender: TObject; const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
    begin
      FSavedCameraActive := CameraComponent.Active;
      CameraComponent.Active := False;
    end;
    TApplicationEvent.BecameActive:
      CameraComponent.Active := FSavedCameraActive;
  end;
end;

procedure TCameraComponentForm.CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, DisplayCameraPreviewFrame);
end;

destructor TCameraComponentForm.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TApplicationEventMessage, ApplicationEventChangedHandler);
  inherited;
end;

procedure TCameraComponentForm.DisplayCameraPreviewFrame;
var
  ATempBitmap:TBitmap;
  ADetectFace:TBitmap;
  AImageRect:TRectF;

  AImageDrawHeight:Double;
  AImageDrawWidth:Double;
begin
  CameraComponent.SampleBufferToBitmap(imgCameraView.Bitmap, True);

  //每300毫秒检测一次即可,抽样时间间隔
  if DateUtils.MilliSecondsBetween(Now,FLastCheckTime)>300 then
  begin
      FMX.Types.Log.d('OrangeUI TCameraComponentForm.DisplayCameraPreviewFrame');

      AImageRect:=RectF(0,0,imgCameraView.Bitmap.Width,imgCameraView.Bitmap.Height);


      //算出图片要绘制的宽高
      //64*64   140*117
      if imgCameraView.Bitmap.Width/imgCameraView.Bitmap.Height<=imgCameraView.Width/imgCameraView.Height then
      begin
        AImageDrawHeight:=imgCameraView.Height;
        AImageDrawWidth:=imgCameraView.Bitmap.Width*imgCameraView.Height/imgCameraView.Bitmap.Height;
      end
      else
      begin
        AImageDrawWidth:=imgCameraView.Width;
        AImageDrawHeight:=imgCameraView.Bitmap.Height*imgCameraView.Width/imgCameraView.Bitmap.Width;
      end;
      FImageRealDrawRectInView.Left:=(imgCameraView.Width-AImageDrawWidth) / 2;
      FImageRealDrawRectInView.Top:=(imgCameraView.Height-AImageDrawHeight) / 2;
      FImageRealDrawRectInView.Width:=AImageDrawWidth;
      FImageRealDrawRectInView.Height:=AImageDrawHeight;





      //
      ATempBitmap:=TBitmap.Create(Ceil(FImageRealDrawRectInView.Width),Ceil(FImageRealDrawRectInView.Height));
      ATempBitmap.Canvas.BeginScene();
      try
        ATempBitmap.Canvas.DrawBitmap(imgCameraView.Bitmap,
                                      AImageRect,
                                      RectF(0,0,FImageRealDrawRectInView.Width,FImageRealDrawRectInView.Height),
                                      1,True);
      finally
        ATempBitmap.Canvas.EndScene;
      end;



      //从中取出中间的300*300的头像
      //取出圆角中的图片
      ADetectFace:=TBitmap.Create(Ceil(Self.imgFrame.Material.ClipRoundRectSetting.Width),Ceil(Self.imgFrame.Material.ClipRoundRectSetting.Height));
      ADetectFace.Canvas.BeginScene();
      try
        ADetectFace.Canvas.DrawBitmap(ATempBitmap,
                                      RectF((ATempBitmap.Width-ADetectFace.Width)/2,
                                            (ATempBitmap.Height-ADetectFace.Height)/2,
                                            (ATempBitmap.Width-ADetectFace.Width)/2+ATempBitmap.Width,
                                            (ATempBitmap.Height-ADetectFace.Height)/2+ATempBitmap.Height),
                                      RectF(0,0,ATempBitmap.Width,ATempBitmap.Height),1,True);
      finally
        ADetectFace.Canvas.EndScene;
      end;
      //测试截取的对不对
//      ADetectFace.SaveToFile('C:\aa.jpg');


      FSunmiFaceSDK.AddDetectFace(ADetectFace);


      FreeAndNIl(ATempBitmap);
      FreeAndNIl(ADetectFace);


      FLastCheckTime:=Now;
  end;
  

end;


end.
