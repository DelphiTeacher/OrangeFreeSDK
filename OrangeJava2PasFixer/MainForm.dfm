object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'OrangeUIJava2PasFixer'
  ClientHeight = 511
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memOrigin: TMemo
    Left = 0
    Top = 48
    Width = 393
    Height = 463
    Align = alLeft
    Lines.Strings = (
      'unit utest;'
      ''
      ''
      'interface'
      ''
      '{$IFDEF ANDROID}'
      'uses'
      '  Androidapi.JNIBridge,'
      '  Androidapi.JNI.JavaTypes,'
      '  Androidapi.JNI.GraphicsContentViewText,'
      '  Androidapi.JNI.os,'
      '  Androidapi.JNI.App,'
      '  Androidapi.JNI.Util,'
      '  Androidapi.JNI.Hardware;'
      ''
      'type'
      '  Ja = interface; //com.baidu.location.Poi$1'
      '  Ja_a = interface; //com.baidu.location.Poi$1'
      '  JPoi_1 = interface; //com.baidu.location.Poi$1'
      '  JPoi = interface; //com.baidu.location.Poi'
      '  JAppGlideModule = interface;'
      '  JAppGlideModuleClass = interface;'
      ''
      ''
      '// ===== Interface declarations ====='
      ''
      '  Ja_aClass = interface(JObjectClass)'
      '  ['#39'{BBEF1A8B-1608-4556-8531-C0F7B40334C2}'#39']'
      '    { static Property Methods }'
      ''
      '    { static Methods }'
      '    {class} function init(P1: Ja; P2: JLooper): Ja_a; cdecl;'
      ''
      '    { static Property }'
      '  end;'
      ''
      '  [JavaSignature('#39'com/baidu/location/a/a$a'#39')]'
      '  Ja_a = interface(JObject)'
      '  ['#39'{471884DC-540E-42A7-8E1C-B0A398EF1F54}'#39']'
      '    { Property Methods }'
      ''
      '    { methods }'
      '    procedure handleMessage(P1: JMessage); cdecl;'
      ''
      '    { Property }'
      '  end;'
      ''
      '  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;'
      ''
      ''
      
        '  JGeneratedAppGlideModuleClass = interface(JAppGlideModuleClass' +
        ') // or JObjectClass // SuperSignature: com/bumptech/glide/modul' +
        'e/AppGlideModule'
      '  ['#39'{66F9C4B0-72CD-45F9-8F2D-643ED646DD9F}'#39']'
      '    { static Property Methods }'
      ''
      '    { static Methods }'
      ''
      '    { static Property }'
      '  end;'
      ''
      '  [JavaSignature('#39'com/bumptech/glide/GeneratedAppGlideModule'#39')]'
      
        '  JGeneratedAppGlideModule = interface(JAppGlideModule) // or JO' +
        'bject // SuperSignature: com/bumptech/glide/module/AppGlideModul' +
        'e'
      '  ['#39'{E2A76A21-E588-4257-B42E-75C778E23D39}'#39']'
      '    { Property Methods }'
      ''
      '    { methods }'
      ''
      '    { Property }'
      '  end;'
      ''
      
        '  TJGeneratedAppGlideModule = class(TJavaGenericImport<JGenerate' +
        'dAppGlideModuleClass, JGeneratedAppGlideModule>) end;'
      ''
      
        '  JAppGlideModuleClass = interface(JObjectClass) // or JObjectCl' +
        'ass // SuperSignature: com/bumptech/glide/module/LibraryGlideMod' +
        'ule'
      '  ['#39'{42121904-4E5A-48A8-9E68-249859F15A90}'#39']'
      '    { static Property Methods }'
      ''
      '    { static Methods }'
      '    {class} function init: JAppGlideModule; cdecl; //()V'
      ''
      '    { static Property }'
      '  end;'
      ''
      '  [JavaSignature('#39'com/bumptech/glide/module/AppGlideModule'#39')]'
      
        '  JAppGlideModule = interface(JObject) // or JObject // SuperSig' +
        'nature: com/bumptech/glide/module/LibraryGlideModule'
      '  ['#39'{0C36AEA2-E39B-4B0C-98FE-9F7607454D0A}'#39']'
      '    { Property Methods }'
      ''
      '    { methods }'
      '    function isManifestParsingEnabled: Boolean; cdecl; //()Z'
      
        '    procedure applyOptions(context: JContext; builder: JGlideBui' +
        'lder); cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/Gl' +
        'ideBuilder;)V'
      ''
      '    { Property }'
      '  end;'
      ''
      
        '  TJAppGlideModule = class(TJavaGenericImport<JAppGlideModuleCla' +
        'ss, JAppGlideModule>) end;'
      ''
      'implementation'
      ''
      'end.')
    ScrollBars = ssBoth
    TabOrder = 0
    OnDblClick = memOriginDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 48
    Align = alTop
    TabOrder = 1
    object btnConvert: TButton
      Left = 32
      Top = 12
      Width = 75
      Height = 25
      Caption = #36716#25442
      TabOrder = 0
      OnClick = btnConvertClick
    end
  end
  object memConverted: TMemo
    Left = 393
    Top = 48
    Width = 346
    Height = 463
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
    OnDblClick = memConvertedDblClick
  end
end
