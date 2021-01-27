unit uAndroidGlideHelper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  FMX.Graphics,

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
  System.Messaging,
  Androidapi.JNI.glide_4_0_0,
  Androidapi.JNI.myglidehelper_debug_aar,
  uFuncCommon_Copy,
  uFileCommon_Copy,

  FMX.Types;


type
  TGetImageEvent=procedure(Sender:TObject;ABitmap:TBitmap;AIsSucc:Boolean) of object;

  {$IFDEF ANDROID}
  //主要是用来获取视频的缩略图
  TJMySimpleBitmapTargetEvent = class(TJavaLocal,JMySimpleBitmapTargetEvent)
  public
    FOnGetImageEvent:TGetImageEvent;
    procedure onResourceReady(P1: JDrawable); cdecl;
  public
    constructor Create(AOnGetImageEvent:TGetImageEvent);
  end;
  {$ENDIF ANDROID}


implementation


{ TJMySimpleBitmapTargetEvent }

{$IFDEF ANDROID}

constructor TJMySimpleBitmapTargetEvent.Create(AOnGetImageEvent:TGetImageEvent);
begin
  Inherited Create;
  FOnGetImageEvent:=AOnGetImageEvent;
end;

procedure TJMySimpleBitmapTargetEvent.onResourceReady(P1: JDrawable);
var
  AJBitmapDrawable:JBitmapDrawable;
//  ABitmapSurface:TBitmapSurface;
  saveImgOut:JFileOutputStream;
  AThumbPath:String;
  ABitmap:TBitmap;
begin
  FMX.Types.Log.d('OrangeUI TJMySimpleBitmapTargetEvent.onResourceReady Begin');



//  TThread.Synchronize(nil,procedure
//  begin


      //将缩略图保存下载
      //android.graphics.drawable.BitmapDrawable@49b8d2e
      //
      //P1
      AJBitmapDrawable:=TJBitmapDrawable.Wrap((P1 as ILocalObject).GetObjectID);

      AThumbPath:=GetApplicationPath+CreateGUIDString()+'.png';
      //   FileOutputStream out = new FileOutputStream(f);
      saveImgOut:=TJFileOutputStream.JavaClass.Init(StringToJString(AThumbPath));
      //   bm.compress(Bitmap.CompressFormat.PNG, 90, out);
      AJBitmapDrawable.getBitmap.compress(TJBitmap_CompressFormat.JavaClass.PNG, 90, saveImgOut);
      //   out.flush();
      saveImgOut.Flush();
      //   out.close();
      saveImgOut.Close();

      ABitmap:=TBitmap.Create;
      try
        ABitmap.LoadFromFile(AThumbPath);

        if Assigned(FOnGetImageEvent) then
        begin
          FOnGetImageEvent(Self,ABitmap,True);
        end;
      finally
        FreeAndNil(ABitmap);
      end;


  //    AJBitmapDrawable.getBitmap.
  //    ABitmapSurface := TBitmapSurface.Create;
  //    JBitmapToSurface(AJBitmapDrawable.getBitmap,ABitmapSurface);
  //    Form17.Image1.Bitmap.Assign(ABitmapSurface);
//      Form17.Image1.Bitmap.LoadFromFile(AThumbPath);



//  end);



  FMX.Types.Log.d('OrangeUI TJMySimpleBitmapTargetEvent.onResourceReady End');

end;

{$ENDIF ANDROID}

end.
