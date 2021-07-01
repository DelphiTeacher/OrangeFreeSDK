unit uSunmiFaceSDK;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, //System.Permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Media,
  System.Generics.Collections,
  FMX.Graphics,
  SyncObjs,


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
  {$ENDIF}

//  FMX.Dialogs,
//  FlyFilesUtils,
  Androidapi.JNI.Environment,
  Androidapi.JNI.facelib_release_aar,
  Androidapi.JNI.mysunmifacelibrary_debug_aar,
  FMX.Surfaces,

  DateUtils,
  FMX.Objects, FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, System.Messaging;

type
  TSunmiFaceSDK=class;

  TDetectFaceThread=class(TThread)
  public
    FResumeEvent:TEvent;
    FSunmiFaceSDK:TSunmiFaceSDK;
    FBitmapSurfaceList:TObjectList<TBitmapSurface>;
  protected
    procedure Execute;override;
  public
    constructor Create(ACreateSuspended:Boolean;ASunmiFaceSDK:TSunmiFaceSDK);
    destructor Destroy;override;
    procedure AddDetectFace(ABitmap:TBitmapSurface);
  end;


  TOnDetectedFaceEvent=procedure(Sender:TObject;AId:String;AName:String) of object;
  TSunmiFaceSDK=class
  public
    {$IFDEF ANDROID}
    //人脸识别
    FJSunmiFaceSDK:JSunmiFaceSDK;
    FJmysunmifacehelper:Jmysunmifacehelper;
    {$ENDIF}
  public
    FDetectFaceThread:TDetectFaceThread;
    OnDetectedFace:TOnDetectedFaceEvent;

    //初始
    function Init:Integer;
    //验证授权
    function VerifyLicense:Integer;

    function RegisterFace(AFaceBitmap:TBitmap;AId:String;AName:String):Boolean;


    //添加需要识别的人脸
    function AddDetectFace(ABitmap:TBitmap):Boolean;
    destructor Destroy;override;
  end;



function GetExternalStorageDirectory:String;

implementation


function GetExternalStorageDirectory:String;
begin
  {$IFDEF ANDROID}
  Result:=JStringToString(TJEnvironment.JavaClass.getExternalStorageDirectory().getPath());
  {$ENDIF ANDROID}

end;

{ TDetectFaceThread }

procedure TDetectFaceThread.AddDetectFace(ABitmap: TBitmapSurface);
begin
  FBitmapSurfaceList.Add(ABitmap);
  FResumeEvent.SetEvent;
end;

constructor TDetectFaceThread.Create(ACreateSuspended: Boolean;ASunmiFaceSDK:TSunmiFaceSDK);
begin
  FBitmapSurfaceList:=TObjectList<TBitmapSurface>.Create;
  //启动事件
  FResumeEvent:=TEvent.Create(nil,False,False,'');
  FSunmiFaceSDK:=ASunmiFaceSDK;

  Inherited Create(ACreateSuspended);
end;

destructor TDetectFaceThread.Destroy;
begin
  FResumeEvent.Free;
  FreeAndNil(FBitmapSurfaceList);
  inherited;
end;

procedure TDetectFaceThread.Execute;
var
  APhoto:TBitmapSurface;
  I: Integer;
  {$IFDEF ANDROID}
var
  AJBitmap:JBitmap;
  AJSunmiFaceDBIdInfo:JSunmiFaceDBIdInfo;
//  ADir:String;
  {$ENDIF}
begin
  while Not Self.Terminated do
  begin
    Self.FResumeEvent.WaitFor(INFINITE);
    FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute');


    if FBitmapSurfaceList.Count>0 then
    begin
        APhoto:=FBitmapSurfaceList[0];



        FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute Is Checking FBitmapSurfaceList.Count:'+IntToStr(FBitmapSurfaceList.Count));

        {$IFDEF ANDROID}
        //拍完照,将人脸识别出特征,保存到数据库
        AJBitmap:=TJBitmap.Create;
        try
          FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute 1');

          FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute 2');
          AJBitmap := TJBitmap.JavaClass.createBitmap(APhoto.Width, APhoto.Height, TJBitmap_Config.JavaClass.ARGB_8888);
          SurfaceToJBitmap(APhoto,AJBitmap);

          FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute 3');
          AJSunmiFaceDBIdInfo:=TJmysunmifacehelper.JavaClass.RecFeature(AJBitmap);
          if AJSunmiFaceDBIdInfo=nil then
          begin
    //        ShowMessage('没有检测到人脸，请重新拍照！');
            FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute no');
          end
          else
          begin
            FMX.Types.Log.d('OrangeUI TDetectFaceThread.Execute yes');



            if Assigned(FSunmiFaceSDK.OnDetectedFace) then
            begin
              FSunmiFaceSDK.OnDetectedFace(Self,JStringToString(AJSunmiFaceDBIdInfo.getId),JStringToString(AJSunmiFaceDBIdInfo.getName));
            end;



            //剩下的不再需要检测了
            FBitmapSurfaceList.Clear;
            continue;


    //        ShowMessage('注册成功');
    //
    //        ADir:=GetExternalStorageDirectory+PathDelim+'Faces'+PathDelim;
    //        ForceDirectories(ADir);
    //        FImage.SaveToFile(ADir+edtName.Text+'.jpg');
          end;

        finally
  //        FreeAndNil(APhoto);
          if FBitmapSurfaceList.Count>0 then
          begin
            FBitmapSurfaceList.Delete(0);

            //留最新一张
            while FBitmapSurfaceList.Count>1 do
            begin
              FBitmapSurfaceList.Delete(0);
            end;

          end;
        end;
        {$ENDIF}

    end;


  end;
end;

{ TSunmiFaceSDK }

function TSunmiFaceSDK.AddDetectFace(ABitmap: TBitmap): Boolean;
var
  ADetectBitmap:TBitmapSurface;
begin
  if FDetectFaceThread=nil then
  begin
    FDetectFaceThread:=TDetectFaceThread.Create(False,Self);
  end;


  ADetectBitmap:=TBitmapSurface.Create;
  ADetectBitmap.Assign(ABitmap);


  FDetectFaceThread.AddDetectFace(ADetectBitmap);

end;

destructor TSunmiFaceSDK.Destroy;
begin
  FDetectFaceThread.Terminate;
  FDetectFaceThread.WaitFor;
  FreeAndNil(FDetectFaceThread);
  inherited;
end;

function TSunmiFaceSDK.Init:Integer;
  {$IFDEF ANDROID}
var
  code:Integer;
  AconfPath:String;
  AJconfPath:JString;
  {$ENDIF}
begin
  FMX.Types.Log.d('OrangeUI TForm8.Init');


  Result:=-1;
  {$IFDEF ANDROID}
  //初始
  //String
  AconfPath := GetExternalStorageDirectory
//              GetSDCardPath()
              +'/faceTest/config.json';
  if not FileExists(AconfPath) then
  begin
    ShowMessage(AconfPath+'不存在');
//    Self.Memo1.Lines.Add(AconfPath+'不存在');
    Exit;
  end
  else
  begin
//    Self.Memo1.Lines.Add(AconfPath+'存在');
  end;

  AJconfPath:=StringToJString(AconfPath);
  //int code = SunmiFaceSDK.init(confPath);
//  code
//  FJSunmiFaceSDK:=TJSunmiFaceSDK.JavaClass.init;//(AJconfPath);

  FJmysunmifacehelper:=TJmysunmifacehelper.JavaClass.init;
  code:=TJmysunmifacehelper.JavaClass.init_by_config_path(AJconfPath);
  Result:=code;
//  Self.Memo1.Lines.Add('code:'+IntToStr(code));
  FMX.Types.Log.d('OrangeUI TForm8.Init code:'+IntToStr(code));
  {$ENDIF}


end;

function TSunmiFaceSDK.RegisterFace(AFaceBitmap: TBitmap;AId:String;AName:String): Boolean;
  {$IFDEF ANDROID}
var
  APhoto : TBitmapSurface;
  AJBitmap:JBitmap;
  ADir:String;
  {$ENDIF}
begin
  FMX.Types.Log.d('OrangeUI TForm8.tmrRegTimer Begin');

  Result:=False;
  {$IFDEF ANDROID}

  //拍完照,将人脸识别出特征,保存到数据库
  APhoto := TBitmapSurface.Create;
  AJBitmap:=TJBitmap.Create;
  try
    FMX.Types.Log.d('OrangeUI TForm8.tmrRegTimer 1');
    APhoto.Assign(AFaceBitmap);

    FMX.Types.Log.d('OrangeUI TForm8.tmrRegTimer 2');
    AJBitmap := TJBitmap.JavaClass.createBitmap(APhoto.Width, APhoto.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    SurfaceToJBitmap(APhoto,AJBitmap);

    FMX.Types.Log.d('OrangeUI TForm8.tmrRegTimer 3');
    if not TJmysunmifacehelper.JavaClass.addFeature(StringToJString(AId),StringToJString(AName),AJBitmap) then
    begin
      ShowMessage('没有检测到人脸，请重新拍照！');
    end
    else
    begin
      ShowMessage('注册成功');

      ADir:=GetExternalStorageDirectory+PathDelim+'Faces'+PathDelim;
      ForceDirectories(ADir);
      AFaceBitmap.SaveToFile(ADir+AId+'.jpg');

      Result:=True;
    end;

  finally
    FreeAndNil(APhoto);
  end;
  {$ENDIF}

end;

function TSunmiFaceSDK.VerifyLicense: Integer;
var
  Alicense:String;
  code:Integer;
  AStringStream:TStringStream;
begin
  FMX.Types.Log.d('OrangeUI TForm8.VerifyLicense');

  Result:=-1;
  {$IFDEF ANDROID}
//String license = readToString(Environment.getExternalStorageDirectory() +
//"/faceTest/license_face.txt");
//int code = SunmiFaceSDK.verifyLicense(context, license); // context为Android Context

  Alicense := GetExternalStorageDirectory
//              GetSDCardPath()
              +'/faceTest/licence_valid.txt';

  if not FileExists(Alicense) then
  begin
//    Self.Memo1.Lines.Add(Alicense+'不存在');
    ShowMessage(Alicense+'不存在');
    Exit;
  end
  else
  begin
//    Self.Memo1.Lines.Add(Alicense+'存在');
  end;

  //String license = readToString(Environment.getExternalStorageDirectory() +
  //"/faceTest/license_face.txt");
  //int code = SunmiFaceSDK.verifyLicense(context, license); // context为Android Context
  AStringStream:=TStringStream.Create('',TEncoding.UTF8);
  AStringStream.LoadFromFile(Alicense);
  Alicense:=AStringStream.DataString;
  FreeAndNil(AStringStream);

  code:=TJSunmiFaceSDK.JavaClass.verifyLicense(TAndroidHelper.Context,StringToJString(Alicense));
//  Self.Memo1.Lines.Add('code:'+IntToStr(code));

  FMX.Types.Log.d('OrangeUI TForm8.VerifyLicense code:'+IntToStr(code));

  Result:=code;

  {$ENDIF}


end;

end.
