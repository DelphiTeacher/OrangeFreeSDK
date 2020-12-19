unit utest;


interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.Hardware;

type
//  Ja = interface; //com.baidu.location.Poi$1
//  Ja_a = interface; //com.baidu.location.Poi$1
//  JPoi_1 = interface; //com.baidu.location.Poi$1
//  JPoi = interface; //com.baidu.location.Poi
  JAppGlideModule = interface;


//  Ja_aClass = interface(JObjectClass)
//  ['{BBEF1A8B-1608-4556-8531-C0F7B40334C2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JLooper): Ja_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/baidu/location/a/a$a')]
//  Ja_a = interface(JObject)
//  ['{471884DC-540E-42A7-8E1C-B0A398EF1F54}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;
//
//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

  JAppGlideModuleClass = interface(JObjectClass) // or JObjectClass // SuperSignature: com/bumptech/glide/module/LibraryGlideModule
  ['{42121904-4E5A-48A8-9E68-249859F15A90}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAppGlideModule; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/AppGlideModule')]
  JAppGlideModule = interface(JObject) // or JObject // SuperSignature: com/bumptech/glide/module/LibraryGlideModule
  ['{0C36AEA2-E39B-4B0C-98FE-9F7607454D0A}']
    { Property Methods }

    { methods }
    function isManifestParsingEnabled: Boolean; cdecl; //()Z

    { Property }
  end;

  TJAppGlideModule = class(TJavaGenericImport<JAppGlideModuleClass, JAppGlideModule>) end;

  JGeneratedAppGlideModuleClass = interface(JAppGlideModuleClass) // or JObjectClass // SuperSignature: com/bumptech/glide/module/AppGlideModule
  ['{66F9C4B0-72CD-45F9-8F2D-643ED646DD9F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GeneratedAppGlideModule')]
  JGeneratedAppGlideModule = interface(JAppGlideModule) // or JObject // SuperSignature: com/bumptech/glide/module/AppGlideModule
  ['{E2A76A21-E588-4257-B42E-75C778E23D39}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeneratedAppGlideModule = class(TJavaGenericImport<JGeneratedAppGlideModuleClass, JGeneratedAppGlideModule>) end;


{$ENDIF}
implementation

end.

