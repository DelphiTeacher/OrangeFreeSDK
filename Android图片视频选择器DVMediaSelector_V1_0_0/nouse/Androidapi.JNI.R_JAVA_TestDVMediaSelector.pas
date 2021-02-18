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
//  生成时间：2021/2/6 21:20:17
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.R_JAVA_TestDVMediaSelector;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JR_anim = interface; //android.support.compat.R$anim
  JR_attr = interface; //android.support.compat.R$attr
  JR_bool = interface; //android.support.compat.R$bool
  JR_color = interface; //android.support.compat.R$color
  JR_dimen = interface; //android.support.compat.R$dimen
  JR_drawable = interface; //android.support.compat.R$drawable
  JR_id = interface; //android.support.compat.R$id
  JR_integer = interface; //android.support.compat.R$integer
  JR_layout = interface; //android.support.compat.R$layout
  JR_mipmap = interface; //android.support.compat.R$mipmap
  JR_string = interface; //android.support.compat.R$string
  JR_style = interface; //android.support.compat.R$style
  JR_styleable = interface; //android.support.compat.R$styleable
  JR_xml = interface; //android.support.compat.R$xml
  JR = interface; //android.support.compat.R
  JR_anim_015 = interface; //android.support.coordinatorlayout.R$anim
  JR_attr_016 = interface; //android.support.coordinatorlayout.R$attr
  JR_bool_017 = interface; //android.support.coordinatorlayout.R$bool
  JR_color_018 = interface; //android.support.coordinatorlayout.R$color
  JR_dimen_019 = interface; //android.support.coordinatorlayout.R$dimen
  JR_drawable_020 = interface; //android.support.coordinatorlayout.R$drawable
  JR_id_021 = interface; //android.support.coordinatorlayout.R$id
  JR_integer_022 = interface; //android.support.coordinatorlayout.R$integer
  JR_layout_023 = interface; //android.support.coordinatorlayout.R$layout
  JR_mipmap_024 = interface; //android.support.coordinatorlayout.R$mipmap
  JR_string_025 = interface; //android.support.coordinatorlayout.R$string
  JR_style_026 = interface; //android.support.coordinatorlayout.R$style
  JR_styleable_027 = interface; //android.support.coordinatorlayout.R$styleable
  JR_xml_028 = interface; //android.support.coordinatorlayout.R$xml
  JR_029 = interface; //android.support.coordinatorlayout.R
  JR_anim_030 = interface; //android.support.mediacompat.R$anim
  JR_attr_031 = interface; //android.support.mediacompat.R$attr
  JR_bool_032 = interface; //android.support.mediacompat.R$bool
  JR_color_033 = interface; //android.support.mediacompat.R$color
  JR_dimen_034 = interface; //android.support.mediacompat.R$dimen
  JR_drawable_035 = interface; //android.support.mediacompat.R$drawable
  JR_id_036 = interface; //android.support.mediacompat.R$id
  JR_integer_037 = interface; //android.support.mediacompat.R$integer
  JR_layout_038 = interface; //android.support.mediacompat.R$layout
  JR_mipmap_039 = interface; //android.support.mediacompat.R$mipmap
  JR_string_040 = interface; //android.support.mediacompat.R$string
  JR_style_041 = interface; //android.support.mediacompat.R$style
  JR_styleable_042 = interface; //android.support.mediacompat.R$styleable
  JR_xml_043 = interface; //android.support.mediacompat.R$xml
  JR_044 = interface; //android.support.mediacompat.R
  JR_anim_045 = interface; //android.support.v7.appcompat.R$anim
  JR_attr_046 = interface; //android.support.v7.appcompat.R$attr
  JR_bool_047 = interface; //android.support.v7.appcompat.R$bool
  JR_color_048 = interface; //android.support.v7.appcompat.R$color
  JR_dimen_049 = interface; //android.support.v7.appcompat.R$dimen
  JR_drawable_050 = interface; //android.support.v7.appcompat.R$drawable
  JR_id_051 = interface; //android.support.v7.appcompat.R$id
  JR_integer_052 = interface; //android.support.v7.appcompat.R$integer
  JR_layout_053 = interface; //android.support.v7.appcompat.R$layout
  JR_mipmap_054 = interface; //android.support.v7.appcompat.R$mipmap
  JR_string_055 = interface; //android.support.v7.appcompat.R$string
  JR_style_056 = interface; //android.support.v7.appcompat.R$style
  JR_styleable_057 = interface; //android.support.v7.appcompat.R$styleable
  JR_xml_058 = interface; //android.support.v7.appcompat.R$xml
  JR_059 = interface; //android.support.v7.appcompat.R
  JR_anim_060 = interface; //android.support.v7.recyclerview.R$anim
  JR_attr_061 = interface; //android.support.v7.recyclerview.R$attr
  JR_bool_062 = interface; //android.support.v7.recyclerview.R$bool
  JR_color_063 = interface; //android.support.v7.recyclerview.R$color
  JR_dimen_064 = interface; //android.support.v7.recyclerview.R$dimen
  JR_drawable_065 = interface; //android.support.v7.recyclerview.R$drawable
  JR_id_066 = interface; //android.support.v7.recyclerview.R$id
  JR_integer_067 = interface; //android.support.v7.recyclerview.R$integer
  JR_layout_068 = interface; //android.support.v7.recyclerview.R$layout
  JR_mipmap_069 = interface; //android.support.v7.recyclerview.R$mipmap
  JR_string_070 = interface; //android.support.v7.recyclerview.R$string
  JR_style_071 = interface; //android.support.v7.recyclerview.R$style
  JR_styleable_072 = interface; //android.support.v7.recyclerview.R$styleable
  JR_xml_073 = interface; //android.support.v7.recyclerview.R$xml
  JR_074 = interface; //android.support.v7.recyclerview.R
  JR_anim_075 = interface; //cn.bingoogolapple.qrcode.core.R$anim
  JR_attr_076 = interface; //cn.bingoogolapple.qrcode.core.R$attr
  JR_bool_077 = interface; //cn.bingoogolapple.qrcode.core.R$bool
  JR_color_078 = interface; //cn.bingoogolapple.qrcode.core.R$color
  JR_dimen_079 = interface; //cn.bingoogolapple.qrcode.core.R$dimen
  JR_drawable_080 = interface; //cn.bingoogolapple.qrcode.core.R$drawable
  JR_id_081 = interface; //cn.bingoogolapple.qrcode.core.R$id
  JR_integer_082 = interface; //cn.bingoogolapple.qrcode.core.R$integer
  JR_layout_083 = interface; //cn.bingoogolapple.qrcode.core.R$layout
  JR_mipmap_084 = interface; //cn.bingoogolapple.qrcode.core.R$mipmap
  JR_string_085 = interface; //cn.bingoogolapple.qrcode.core.R$string
  JR_style_086 = interface; //cn.bingoogolapple.qrcode.core.R$style
  JR_styleable_087 = interface; //cn.bingoogolapple.qrcode.core.R$styleable
  JR_xml_088 = interface; //cn.bingoogolapple.qrcode.core.R$xml
  JR_089 = interface; //cn.bingoogolapple.qrcode.core.R
  JR_anim_090 = interface; //cn.bingoogolapple.qrcode.zbar.R$anim
  JR_attr_091 = interface; //cn.bingoogolapple.qrcode.zbar.R$attr
  JR_bool_092 = interface; //cn.bingoogolapple.qrcode.zbar.R$bool
  JR_color_093 = interface; //cn.bingoogolapple.qrcode.zbar.R$color
  JR_dimen_094 = interface; //cn.bingoogolapple.qrcode.zbar.R$dimen
  JR_drawable_095 = interface; //cn.bingoogolapple.qrcode.zbar.R$drawable
  JR_id_096 = interface; //cn.bingoogolapple.qrcode.zbar.R$id
  JR_integer_097 = interface; //cn.bingoogolapple.qrcode.zbar.R$integer
  JR_layout_098 = interface; //cn.bingoogolapple.qrcode.zbar.R$layout
  JR_mipmap_099 = interface; //cn.bingoogolapple.qrcode.zbar.R$mipmap
  JR_string_100 = interface; //cn.bingoogolapple.qrcode.zbar.R$string
  JR_style_101 = interface; //cn.bingoogolapple.qrcode.zbar.R$style
  JR_styleable_102 = interface; //cn.bingoogolapple.qrcode.zbar.R$styleable
  JR_xml_103 = interface; //cn.bingoogolapple.qrcode.zbar.R$xml
  JR_104 = interface; //cn.bingoogolapple.qrcode.zbar.R
  JR_anim_105 = interface; //com.devil.library.media.R$anim
  JR_attr_106 = interface; //com.devil.library.media.R$attr
  JR_bool_107 = interface; //com.devil.library.media.R$bool
  JR_color_108 = interface; //com.devil.library.media.R$color
  JR_dimen_109 = interface; //com.devil.library.media.R$dimen
  JR_drawable_110 = interface; //com.devil.library.media.R$drawable
  JR_id_111 = interface; //com.devil.library.media.R$id
  JR_integer_112 = interface; //com.devil.library.media.R$integer
  JR_layout_113 = interface; //com.devil.library.media.R$layout
  JR_mipmap_114 = interface; //com.devil.library.media.R$mipmap
  JR_string_115 = interface; //com.devil.library.media.R$string
  JR_style_116 = interface; //com.devil.library.media.R$style
  JR_styleable_117 = interface; //com.devil.library.media.R$styleable
  JR_xml_118 = interface; //com.devil.library.media.R$xml
  JR_119 = interface; //com.devil.library.media.R

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JR_animClass = interface(JObjectClass)
  ['{47B9C1D1-2544-47D5-B75F-12172255E43A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/compat/R$anim')]
  JR_anim = interface(JObject)
  ['{9FA1C188-0E49-45A4-AA32-FFF459AFB897}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim = class(TJavaGenericImport<JR_animClass, JR_anim>) end;

  JR_attrClass = interface(JObjectClass)
  ['{68DB41EC-6390-40B1-8687-AFEA20FCBEBD}']
    { static Property Methods }
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr; cdecl;

    { static Property }
    {class} property alpha: Integer read _Getalpha;
    {class} property font: Integer read _Getfont;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property ttcIndex: Integer read _GetttcIndex;
  end;

  [JavaSignature('android/support/compat/R$attr')]
  JR_attr = interface(JObject)
  ['{ED6574C0-B657-4985-9DE1-D50E5CC81F24}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr = class(TJavaGenericImport<JR_attrClass, JR_attr>) end;

  JR_boolClass = interface(JObjectClass)
  ['{C5A0B277-0C63-431A-B6F2-A5C51F99CE64}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/compat/R$bool')]
  JR_bool = interface(JObject)
  ['{3B80B3F4-E4F0-435F-AEC8-938244F2236E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool = class(TJavaGenericImport<JR_boolClass, JR_bool>) end;

  JR_colorClass = interface(JObjectClass)
  ['{7AF6A1DD-58FC-4795-900C-360F641C328B}']
    { static Property Methods }
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color; cdecl;

    { static Property }
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
  end;

  [JavaSignature('android/support/compat/R$color')]
  JR_color = interface(JObject)
  ['{4C08D0FE-91D4-45A6-BD4D-1A939B27CBDD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color = class(TJavaGenericImport<JR_colorClass, JR_color>) end;

  JR_dimenClass = interface(JObjectClass)
  ['{FBB98F64-FC00-481C-8B27-DB5740BEA2EC}']
    { static Property Methods }
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen; cdecl;

    { static Property }
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
  end;

  [JavaSignature('android/support/compat/R$dimen')]
  JR_dimen = interface(JObject)
  ['{0255D932-7C41-4D83-9EAA-86585727154F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen = class(TJavaGenericImport<JR_dimenClass, JR_dimen>) end;

  JR_drawableClass = interface(JObjectClass)
  ['{C3E377FE-0D26-47B8-9CB1-7E0F86206A4F}']
    { static Property Methods }
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable; cdecl;

    { static Property }
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
  end;

  [JavaSignature('android/support/compat/R$drawable')]
  JR_drawable = interface(JObject)
  ['{304EACBB-4DAE-4891-B2C4-26E09EFF2E11}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable = class(TJavaGenericImport<JR_drawableClass, JR_drawable>) end;

  JR_idClass = interface(JObjectClass)
  ['{5E40729A-A27B-4899-AA66-6458AD9BDF53}']
    { static Property Methods }
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id; cdecl;

    { static Property }
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property forever: Integer read _Getforever;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
  end;

  [JavaSignature('android/support/compat/R$id')]
  JR_id = interface(JObject)
  ['{BC56CA48-812F-4928-AB25-7813B5FD57CD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id = class(TJavaGenericImport<JR_idClass, JR_id>) end;

  JR_integerClass = interface(JObjectClass)
  ['{E8F3296D-5335-48BC-B6D1-57FF49E89924}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer; cdecl;

    { static Property }
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('android/support/compat/R$integer')]
  JR_integer = interface(JObject)
  ['{5A742F55-1524-467C-89CF-80BF73512601}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer = class(TJavaGenericImport<JR_integerClass, JR_integer>) end;

  JR_layoutClass = interface(JObjectClass)
  ['{FAEF20B0-6521-44D6-96F8-244EB0B8C922}']
    { static Property Methods }
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout; cdecl;

    { static Property }
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
  end;

  [JavaSignature('android/support/compat/R$layout')]
  JR_layout = interface(JObject)
  ['{A401FCD3-19B5-4B11-890E-A6AC6A6091A8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout = class(TJavaGenericImport<JR_layoutClass, JR_layout>) end;

  JR_mipmapClass = interface(JObjectClass)
  ['{9BA13B5A-EFB6-4C52-9955-B4B3393D7370}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_mipmap; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/compat/R$mipmap')]
  JR_mipmap = interface(JObject)
  ['{238D3888-850E-436A-B62B-319A322F164C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap = class(TJavaGenericImport<JR_mipmapClass, JR_mipmap>) end;

  JR_stringClass = interface(JObjectClass)
  ['{C1B9ED5E-9FFB-460D-BAC3-B7EA546AE279}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string; cdecl;

    { static Property }
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('android/support/compat/R$string')]
  JR_string = interface(JObject)
  ['{AB47A284-B906-46DB-AA79-CC56B30F96FF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string = class(TJavaGenericImport<JR_stringClass, JR_string>) end;

  JR_styleClass = interface(JObjectClass)
  ['{09BF205A-CDE8-4393-AAB0-637695711C4C}']
    { static Property Methods }
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style; cdecl;

    { static Property }
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
  end;

  [JavaSignature('android/support/compat/R$style')]
  JR_style = interface(JObject)
  ['{FC690D2B-1FD8-4B68-9D24-6E6B30D71762}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style = class(TJavaGenericImport<JR_styleClass, JR_style>) end;

  JR_styleableClass = interface(JObjectClass)
  ['{C7E2EBC6-D85D-4BAE-8E89-20B4121A831A}']
    { static Property Methods }
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable; cdecl;

    { static Property }
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
  end;

  [JavaSignature('android/support/compat/R$styleable')]
  JR_styleable = interface(JObject)
  ['{66FA7D73-48D0-4874-BD26-6E9FC3474C6C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable = class(TJavaGenericImport<JR_styleableClass, JR_styleable>) end;

  JR_xmlClass = interface(JObjectClass)
  ['{9F0082F6-DEB9-45EE-BEF4-85B9C4D41C09}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/compat/R$xml')]
  JR_xml = interface(JObject)
  ['{2504F702-B5E8-4D34-8F14-C0C6646AB500}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml = class(TJavaGenericImport<JR_xmlClass, JR_xml>) end;

  JRClass = interface(JObjectClass)
  ['{8F859352-1D31-4D45-93FA-5ADA1D0B91F8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/compat/R')]
  JR = interface(JObject)
  ['{19BC3A82-AFBA-42D6-8AD7-2A5B930254AC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR = class(TJavaGenericImport<JRClass, JR>) end;

  JR_anim_015Class = interface(JObjectClass)
  ['{869E615D-47C8-4D7F-927D-E5E48E23988F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim_015; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/coordinatorlayout/R$anim')]
  JR_anim_015 = interface(JObject)
  ['{3936A74F-D1D8-4BD0-8E4A-1CAC386ACDB6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_015 = class(TJavaGenericImport<JR_anim_015Class, JR_anim_015>) end;

  JR_attr_016Class = interface(JObjectClass)
  ['{A0760D19-45A1-4DE7-9D3D-7C3DFDCBA6CC}']
    { static Property Methods }
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcoordinatorLayoutStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getkeylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstatusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_016; cdecl;

    { static Property }
    {class} property alpha: Integer read _Getalpha;
    {class} property coordinatorLayoutStyle: Integer read _GetcoordinatorLayoutStyle;
    {class} property font: Integer read _Getfont;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property keylines: Integer read _Getkeylines;
    {class} property layout_anchor: Integer read _Getlayout_anchor;
    {class} property layout_anchorGravity: Integer read _Getlayout_anchorGravity;
    {class} property layout_behavior: Integer read _Getlayout_behavior;
    {class} property layout_dodgeInsetEdges: Integer read _Getlayout_dodgeInsetEdges;
    {class} property layout_insetEdge: Integer read _Getlayout_insetEdge;
    {class} property layout_keyline: Integer read _Getlayout_keyline;
    {class} property statusBarBackground: Integer read _GetstatusBarBackground;
    {class} property ttcIndex: Integer read _GetttcIndex;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$attr')]
  JR_attr_016 = interface(JObject)
  ['{EF757681-45BD-40B3-9D46-BE37CFB3ACB8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_016 = class(TJavaGenericImport<JR_attr_016Class, JR_attr_016>) end;

  JR_bool_017Class = interface(JObjectClass)
  ['{7091BC81-695D-4DB7-B349-DAABAE8B5E6B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool_017; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/coordinatorlayout/R$bool')]
  JR_bool_017 = interface(JObject)
  ['{7559E610-8640-4EF8-8DF6-04B1824EB13B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_017 = class(TJavaGenericImport<JR_bool_017Class, JR_bool_017>) end;

  JR_color_018Class = interface(JObjectClass)
  ['{D272618B-2C0F-40F9-97E3-600489571ABC}']
    { static Property Methods }
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_018; cdecl;

    { static Property }
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$color')]
  JR_color_018 = interface(JObject)
  ['{0B1273F7-7F40-4318-BC97-C2B760BA0800}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_018 = class(TJavaGenericImport<JR_color_018Class, JR_color_018>) end;

  JR_dimen_019Class = interface(JObjectClass)
  ['{EA789B54-2B34-45DC-B93D-F5EAF8602FD5}']
    { static Property Methods }
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen_019; cdecl;

    { static Property }
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$dimen')]
  JR_dimen_019 = interface(JObject)
  ['{3A0EAD72-0280-4F13-9913-E155237D74A7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_019 = class(TJavaGenericImport<JR_dimen_019Class, JR_dimen_019>) end;

  JR_drawable_020Class = interface(JObjectClass)
  ['{A6505159-6142-4214-B2AD-7BBBB34DE972}']
    { static Property Methods }
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable_020; cdecl;

    { static Property }
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$drawable')]
  JR_drawable_020 = interface(JObject)
  ['{CC28C6C3-1285-4654-95F8-E13467839DE9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_020 = class(TJavaGenericImport<JR_drawable_020Class, JR_drawable_020>) end;

  JR_id_021Class = interface(JObjectClass)
  ['{98F21456-C0E0-4A3B-82BB-42B7BEDDC08E}']
    { static Property Methods }
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getleft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_021; cdecl;

    { static Property }
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property bottom: Integer read _Getbottom;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property &end: Integer read _Getend;
    {class} property forever: Integer read _Getforever;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property left: Integer read _Getleft;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property none: Integer read _Getnone;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property right: Integer read _Getright;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property start: Integer read _Getstart;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
    {class} property top: Integer read _Gettop;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$id')]
  JR_id_021 = interface(JObject)
  ['{C2A3521B-910D-49FB-B89B-3F88A05608F7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_021 = class(TJavaGenericImport<JR_id_021Class, JR_id_021>) end;

  JR_integer_022Class = interface(JObjectClass)
  ['{5C5EEB14-DD8C-4998-B53B-409A657FC2F3}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer_022; cdecl;

    { static Property }
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$integer')]
  JR_integer_022 = interface(JObject)
  ['{A60752EE-AEC5-474B-B248-42F964DAEB87}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_022 = class(TJavaGenericImport<JR_integer_022Class, JR_integer_022>) end;

  JR_layout_023Class = interface(JObjectClass)
  ['{00B9AF4B-094D-4F93-98F0-B90E9304124D}']
    { static Property Methods }
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_023; cdecl;

    { static Property }
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$layout')]
  JR_layout_023 = interface(JObject)
  ['{E198FCDB-8156-468E-9494-B5408A6175E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_023 = class(TJavaGenericImport<JR_layout_023Class, JR_layout_023>) end;

  JR_mipmap_024Class = interface(JObjectClass)
  ['{399F559C-5B2B-4D72-9F9B-B249BF295582}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_mipmap_024; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/coordinatorlayout/R$mipmap')]
  JR_mipmap_024 = interface(JObject)
  ['{967DE1EA-423C-46C4-8AFA-78670B507125}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_024 = class(TJavaGenericImport<JR_mipmap_024Class, JR_mipmap_024>) end;

  JR_string_025Class = interface(JObjectClass)
  ['{1A78579D-904D-4044-B1F0-6AA0523F8C0A}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string_025; cdecl;

    { static Property }
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$string')]
  JR_string_025 = interface(JObject)
  ['{CDB9B33C-48B7-4140-890E-09C42FB10B9F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_025 = class(TJavaGenericImport<JR_string_025Class, JR_string_025>) end;

  JR_style_026Class = interface(JObjectClass)
  ['{FA356FC6-5234-44E6-9676-07313ACCC1DA}']
    { static Property Methods }
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Support_CoordinatorLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_026; cdecl;

    { static Property }
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
    {class} property Widget_Support_CoordinatorLayout: Integer read _GetWidget_Support_CoordinatorLayout;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$style')]
  JR_style_026 = interface(JObject)
  ['{423FE20E-E8F8-44EE-AB42-EE40D864971C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_026 = class(TJavaGenericImport<JR_style_026Class, JR_style_026>) end;

  JR_styleable_027Class = interface(JObjectClass)
  ['{274571D4-762B-4743-B162-232EA5210263}']
    { static Property Methods }
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_keylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_statusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_027; cdecl;

    { static Property }
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property CoordinatorLayout: TJavaArray<Integer> read _GetCoordinatorLayout;
    {class} property CoordinatorLayout_keylines: Integer read _GetCoordinatorLayout_keylines;
    {class} property CoordinatorLayout_statusBarBackground: Integer read _GetCoordinatorLayout_statusBarBackground;
    {class} property CoordinatorLayout_Layout: TJavaArray<Integer> read _GetCoordinatorLayout_Layout;
    {class} property CoordinatorLayout_Layout_android_layout_gravity: Integer read _GetCoordinatorLayout_Layout_android_layout_gravity;
    {class} property CoordinatorLayout_Layout_layout_anchor: Integer read _GetCoordinatorLayout_Layout_layout_anchor;
    {class} property CoordinatorLayout_Layout_layout_anchorGravity: Integer read _GetCoordinatorLayout_Layout_layout_anchorGravity;
    {class} property CoordinatorLayout_Layout_layout_behavior: Integer read _GetCoordinatorLayout_Layout_layout_behavior;
    {class} property CoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer read _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges;
    {class} property CoordinatorLayout_Layout_layout_insetEdge: Integer read _GetCoordinatorLayout_Layout_layout_insetEdge;
    {class} property CoordinatorLayout_Layout_layout_keyline: Integer read _GetCoordinatorLayout_Layout_layout_keyline;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
  end;

  [JavaSignature('android/support/coordinatorlayout/R$styleable')]
  JR_styleable_027 = interface(JObject)
  ['{CBB16BB4-4E59-46F9-B7F9-3B101BA6729D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_027 = class(TJavaGenericImport<JR_styleable_027Class, JR_styleable_027>) end;

  JR_xml_028Class = interface(JObjectClass)
  ['{D98CF99D-C63E-4A5C-B402-8D009C5157BA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_028; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/coordinatorlayout/R$xml')]
  JR_xml_028 = interface(JObject)
  ['{C7808E1D-71AA-482A-ACC6-FBC7408BB47E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_028 = class(TJavaGenericImport<JR_xml_028Class, JR_xml_028>) end;

  JR_029Class = interface(JObjectClass)
  ['{54581044-16A2-4F32-8140-29B633272462}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_029; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/coordinatorlayout/R')]
  JR_029 = interface(JObject)
  ['{E8FEAC9F-9635-4188-8A87-1E6787E95707}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_029 = class(TJavaGenericImport<JR_029Class, JR_029>) end;

  JR_anim_030Class = interface(JObjectClass)
  ['{4C3BB2FC-A2B7-4D5C-9C78-B68612ACF27D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim_030; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/mediacompat/R$anim')]
  JR_anim_030 = interface(JObject)
  ['{F511BE69-4E07-4301-87E5-0660DB03D512}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_030 = class(TJavaGenericImport<JR_anim_030Class, JR_anim_030>) end;

  JR_attr_031Class = interface(JObjectClass)
  ['{77C016A0-9D69-40BE-8F5D-F4E44383A76D}']
    { static Property Methods }
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_031; cdecl;

    { static Property }
    {class} property alpha: Integer read _Getalpha;
    {class} property font: Integer read _Getfont;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property ttcIndex: Integer read _GetttcIndex;
  end;

  [JavaSignature('android/support/mediacompat/R$attr')]
  JR_attr_031 = interface(JObject)
  ['{29E1BF92-1292-456B-8335-795F83DF68B9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_031 = class(TJavaGenericImport<JR_attr_031Class, JR_attr_031>) end;

  JR_bool_032Class = interface(JObjectClass)
  ['{821C23E8-AB7D-4035-A69F-F9E673B3F63F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool_032; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/mediacompat/R$bool')]
  JR_bool_032 = interface(JObject)
  ['{EDAC72CA-A866-4432-BFE8-6B19A2837D9E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_032 = class(TJavaGenericImport<JR_bool_032Class, JR_bool_032>) end;

  JR_color_033Class = interface(JObjectClass)
  ['{AF6F3125-2B60-47BD-9FE2-34957862D903}']
    { static Property Methods }
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_material_background_media_default_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_033; cdecl;

    { static Property }
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property notification_material_background_media_default_color: Integer read _Getnotification_material_background_media_default_color;
    {class} property primary_text_default_material_dark: Integer read _Getprimary_text_default_material_dark;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_dark: Integer read _Getsecondary_text_default_material_dark;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
  end;

  [JavaSignature('android/support/mediacompat/R$color')]
  JR_color_033 = interface(JObject)
  ['{6F7E053B-4C28-467A-96E4-39282BE5A0C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_033 = class(TJavaGenericImport<JR_color_033Class, JR_color_033>) end;

  JR_dimen_034Class = interface(JObjectClass)
  ['{CCED264F-974B-4C9C-A5B4-6FF07127811A}']
    { static Property Methods }
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_corner_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_outline_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_shadow_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_shadow_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen_034; cdecl;

    { static Property }
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
    {class} property subtitle_corner_radius: Integer read _Getsubtitle_corner_radius;
    {class} property subtitle_outline_width: Integer read _Getsubtitle_outline_width;
    {class} property subtitle_shadow_offset: Integer read _Getsubtitle_shadow_offset;
    {class} property subtitle_shadow_radius: Integer read _Getsubtitle_shadow_radius;
  end;

  [JavaSignature('android/support/mediacompat/R$dimen')]
  JR_dimen_034 = interface(JObject)
  ['{E13F4D97-4E6C-4BAD-B157-90225FA82CBC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_034 = class(TJavaGenericImport<JR_dimen_034Class, JR_dimen_034>) end;

  JR_drawable_035Class = interface(JObjectClass)
  ['{DAE3A9D7-F448-4BC0-8AD7-1A09DBFFCD97}']
    { static Property Methods }
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable_035; cdecl;

    { static Property }
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
  end;

  [JavaSignature('android/support/mediacompat/R$drawable')]
  JR_drawable_035 = interface(JObject)
  ['{EB6BE1E2-73D7-4C9F-ADAB-77C8BDFE6C5B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_035 = class(TJavaGenericImport<JR_drawable_035Class, JR_drawable_035>) end;

  JR_id_036Class = interface(JObjectClass)
  ['{FC62000E-B470-44D2-A1D6-BD90370979DA}']
    { static Property Methods }
    {class} function _Getaction0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcancel_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend_padder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmedia_actions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_latest_event_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_036; cdecl;

    { static Property }
    {class} property action0: Integer read _Getaction0;
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property cancel_action: Integer read _Getcancel_action;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property end_padder: Integer read _Getend_padder;
    {class} property forever: Integer read _Getforever;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property media_actions: Integer read _Getmedia_actions;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property status_bar_latest_event_content: Integer read _Getstatus_bar_latest_event_content;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
  end;

  [JavaSignature('android/support/mediacompat/R$id')]
  JR_id_036 = interface(JObject)
  ['{4CB91E19-5F54-43D4-8C6A-4B997295BA00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_036 = class(TJavaGenericImport<JR_id_036Class, JR_id_036>) end;

  JR_integer_037Class = interface(JObjectClass)
  ['{8797EAAC-E9A9-4DC5-9D19-C498EEF4E5FF}']
    { static Property Methods }
    {class} function _Getcancel_button_image_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer_037; cdecl;

    { static Property }
    {class} property cancel_button_image_alpha: Integer read _Getcancel_button_image_alpha;
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('android/support/mediacompat/R$integer')]
  JR_integer_037 = interface(JObject)
  ['{562CE973-9EAF-4B98-A77A-B644801F1748}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_037 = class(TJavaGenericImport<JR_integer_037Class, JR_integer_037>) end;

  JR_layout_038Class = interface(JObjectClass)
  ['{4938248C-3ED9-413B-8A28-E34185E8829F}']
    { static Property Methods }
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_cancel_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_narrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_narrow_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_lines_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_media_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_038; cdecl;

    { static Property }
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_media_action: Integer read _Getnotification_media_action;
    {class} property notification_media_cancel_action: Integer read _Getnotification_media_cancel_action;
    {class} property notification_template_big_media: Integer read _Getnotification_template_big_media;
    {class} property notification_template_big_media_custom: Integer read _Getnotification_template_big_media_custom;
    {class} property notification_template_big_media_narrow: Integer read _Getnotification_template_big_media_narrow;
    {class} property notification_template_big_media_narrow_custom: Integer read _Getnotification_template_big_media_narrow_custom;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_lines_media: Integer read _Getnotification_template_lines_media;
    {class} property notification_template_media: Integer read _Getnotification_template_media;
    {class} property notification_template_media_custom: Integer read _Getnotification_template_media_custom;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
  end;

  [JavaSignature('android/support/mediacompat/R$layout')]
  JR_layout_038 = interface(JObject)
  ['{30FB875D-DE5F-42F3-BB01-2699C9B86C29}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_038 = class(TJavaGenericImport<JR_layout_038Class, JR_layout_038>) end;

  JR_mipmap_039Class = interface(JObjectClass)
  ['{C7D3D44B-4D25-45F1-B5E3-4272A2A56381}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_mipmap_039; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/mediacompat/R$mipmap')]
  JR_mipmap_039 = interface(JObject)
  ['{01AA9BF8-5885-47E3-BE53-1180EEB1922D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_039 = class(TJavaGenericImport<JR_mipmap_039Class, JR_mipmap_039>) end;

  JR_string_040Class = interface(JObjectClass)
  ['{5D59623B-5C55-4979-B200-423FCB75935D}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string_040; cdecl;

    { static Property }
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('android/support/mediacompat/R$string')]
  JR_string_040 = interface(JObject)
  ['{6068A454-14DA-4912-806E-1C7D26266429}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_040 = class(TJavaGenericImport<JR_string_040Class, JR_string_040>) end;

  JR_style_041Class = interface(JObjectClass)
  ['{3D95B06A-A8E0-411C-8CD1-5F560B56E9F5}']
    { static Property Methods }
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_041; cdecl;

    { static Property }
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Info_Media: Integer read _GetTextAppearance_Compat_Notification_Info_Media;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Line2_Media: Integer read _GetTextAppearance_Compat_Notification_Line2_Media;
    {class} property TextAppearance_Compat_Notification_Media: Integer read _GetTextAppearance_Compat_Notification_Media;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Time_Media: Integer read _GetTextAppearance_Compat_Notification_Time_Media;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property TextAppearance_Compat_Notification_Title_Media: Integer read _GetTextAppearance_Compat_Notification_Title_Media;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
  end;

  [JavaSignature('android/support/mediacompat/R$style')]
  JR_style_041 = interface(JObject)
  ['{4C718737-6BB8-4FBF-B707-19D750701B4C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_041 = class(TJavaGenericImport<JR_style_041Class, JR_style_041>) end;

  JR_styleable_042Class = interface(JObjectClass)
  ['{0EFD6168-7E84-4F07-9C5D-9DD3828AAB7C}']
    { static Property Methods }
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_042; cdecl;

    { static Property }
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
  end;

  [JavaSignature('android/support/mediacompat/R$styleable')]
  JR_styleable_042 = interface(JObject)
  ['{0509F150-F986-4FBB-AA51-FF0CA7CCA726}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_042 = class(TJavaGenericImport<JR_styleable_042Class, JR_styleable_042>) end;

  JR_xml_043Class = interface(JObjectClass)
  ['{B19BF6E6-BFBB-402B-8C5E-E7C025FE39B0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_043; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/mediacompat/R$xml')]
  JR_xml_043 = interface(JObject)
  ['{7EF15826-323A-4AA5-9F55-49A68E969BCC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_043 = class(TJavaGenericImport<JR_xml_043Class, JR_xml_043>) end;

  JR_044Class = interface(JObjectClass)
  ['{89E1E3C7-5671-4A73-A220-4C946525F895}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_044; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/mediacompat/R')]
  JR_044 = interface(JObject)
  ['{4B5C31E6-24C1-4B19-B2C5-4172CC284D88}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_044 = class(TJavaGenericImport<JR_044Class, JR_044>) end;

  JR_anim_045Class = interface(JObjectClass)
  ['{C8ECF25A-E71A-4AF2-A464-C1D2D69F9CF1}']
    { static Property Methods }
    {class} function _Getabc_fade_in: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_fade_out: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_grow_fade_in_from_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_enter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_exit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shrink_fade_out_from_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_in_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_in_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_out_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_out_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip_enter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip_exit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_anim_045; cdecl;

    { static Property }
    {class} property abc_fade_in: Integer read _Getabc_fade_in;
    {class} property abc_fade_out: Integer read _Getabc_fade_out;
    {class} property abc_grow_fade_in_from_bottom: Integer read _Getabc_grow_fade_in_from_bottom;
    {class} property abc_popup_enter: Integer read _Getabc_popup_enter;
    {class} property abc_popup_exit: Integer read _Getabc_popup_exit;
    {class} property abc_shrink_fade_out_from_bottom: Integer read _Getabc_shrink_fade_out_from_bottom;
    {class} property abc_slide_in_bottom: Integer read _Getabc_slide_in_bottom;
    {class} property abc_slide_in_top: Integer read _Getabc_slide_in_top;
    {class} property abc_slide_out_bottom: Integer read _Getabc_slide_out_bottom;
    {class} property abc_slide_out_top: Integer read _Getabc_slide_out_top;
    {class} property abc_tooltip_enter: Integer read _Getabc_tooltip_enter;
    {class} property abc_tooltip_exit: Integer read _Getabc_tooltip_exit;
  end;

  [JavaSignature('android/support/v7/appcompat/R$anim')]
  JR_anim_045 = interface(JObject)
  ['{AAF8E452-6E0B-4ACA-BD6E-1FC00964DBD2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_045 = class(TJavaGenericImport<JR_anim_045Class, JR_anim_045>) end;

  JR_attr_046Class = interface(JObjectClass)
  ['{9E81745E-2F80-46A1-876E-C5ACE7A34D1C}']
    { static Property Methods }
    {class} function _GetactionBarDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarPopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarSplitStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarWidgetTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionDropDownStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionMenuTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionMenuTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCloseButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCloseDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCopyDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCutDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeFindDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModePasteDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModePopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeSelectAllDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeShareDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeSplitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeWebSearchDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionOverflowButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionOverflowMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionProviderClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionViewClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactivityChooserViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogButtonGroupStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogCenterButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetallowStacking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalphabeticModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetarrowHeadLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetarrowShaftLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoCompleteTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeMaxTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeMinTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizePresetSizes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeStepGranularity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeTextType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundStacked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbarLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetborderlessButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarNegativeButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarNeutralButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarPositiveButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonIconDimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonPanelSideLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcheckboxStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcheckedTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcloseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcloseItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcollapseContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcollapseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcolor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorAccent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorBackgroundFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorButtonNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlActivated: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlHighlight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimaryDark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorSwitchThumbNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcommitIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontrolBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcoordinatorLayoutStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcustomNavigationLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdefaultQueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogCornerRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogPreferredPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdisplayOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerHorizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerVertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdrawableSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdrawerArrowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdropDownListViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdropdownListPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getelevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetexpandActivityOverflowButtonDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfirstBaselineToTopHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetgapBetweenBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetgoIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethideOnContentScroll: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethomeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethomeLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonifiedByDefault: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetimageButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetindeterminateProgressStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetinitialActivityCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetisLightTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetitemPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getkeylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlastBaselineToBottomHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlineHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistChoiceBackgroundIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistDividerAlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistMenuViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeightLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeightSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemPaddingLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemPaddingRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlogo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlogoDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmaxButtonHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmeasureWithLargestChild: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmultiChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnumericModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetoverlapAnchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingBottomNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingTopNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelMenuListTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelMenuListWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpreserveIconSpacing: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetprogressBarPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetprogressBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetqueryBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetqueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetradioButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyleIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchHintIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetseekBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetselectableItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetselectableItemBackgroundBorderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowAsAction: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowDividers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsingleChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinnerDropDownItemStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinnerStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsplitTrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsrcCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstate_above_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstatusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubMenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubmitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsuggestionRowLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchMinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceLargePopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItemSecondary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItemSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearancePopupMenuHeader: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSearchResultSubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSearchResultTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSmallPopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextColorAlertDialogListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextColorSearchUrl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getthickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTextPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMarkTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMarkTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMargins: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettoolbarNavigationButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettoolbarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipForegroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipFrameBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettrackTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettrackTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetviewInflaterClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetvoiceIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionBarOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionModeOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedHeightMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedHeightMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowMinWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowMinWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_046; cdecl;

    { static Property }
    {class} property actionBarDivider: Integer read _GetactionBarDivider;
    {class} property actionBarItemBackground: Integer read _GetactionBarItemBackground;
    {class} property actionBarPopupTheme: Integer read _GetactionBarPopupTheme;
    {class} property actionBarSize: Integer read _GetactionBarSize;
    {class} property actionBarSplitStyle: Integer read _GetactionBarSplitStyle;
    {class} property actionBarStyle: Integer read _GetactionBarStyle;
    {class} property actionBarTabBarStyle: Integer read _GetactionBarTabBarStyle;
    {class} property actionBarTabStyle: Integer read _GetactionBarTabStyle;
    {class} property actionBarTabTextStyle: Integer read _GetactionBarTabTextStyle;
    {class} property actionBarTheme: Integer read _GetactionBarTheme;
    {class} property actionBarWidgetTheme: Integer read _GetactionBarWidgetTheme;
    {class} property actionButtonStyle: Integer read _GetactionButtonStyle;
    {class} property actionDropDownStyle: Integer read _GetactionDropDownStyle;
    {class} property actionLayout: Integer read _GetactionLayout;
    {class} property actionMenuTextAppearance: Integer read _GetactionMenuTextAppearance;
    {class} property actionMenuTextColor: Integer read _GetactionMenuTextColor;
    {class} property actionModeBackground: Integer read _GetactionModeBackground;
    {class} property actionModeCloseButtonStyle: Integer read _GetactionModeCloseButtonStyle;
    {class} property actionModeCloseDrawable: Integer read _GetactionModeCloseDrawable;
    {class} property actionModeCopyDrawable: Integer read _GetactionModeCopyDrawable;
    {class} property actionModeCutDrawable: Integer read _GetactionModeCutDrawable;
    {class} property actionModeFindDrawable: Integer read _GetactionModeFindDrawable;
    {class} property actionModePasteDrawable: Integer read _GetactionModePasteDrawable;
    {class} property actionModePopupWindowStyle: Integer read _GetactionModePopupWindowStyle;
    {class} property actionModeSelectAllDrawable: Integer read _GetactionModeSelectAllDrawable;
    {class} property actionModeShareDrawable: Integer read _GetactionModeShareDrawable;
    {class} property actionModeSplitBackground: Integer read _GetactionModeSplitBackground;
    {class} property actionModeStyle: Integer read _GetactionModeStyle;
    {class} property actionModeWebSearchDrawable: Integer read _GetactionModeWebSearchDrawable;
    {class} property actionOverflowButtonStyle: Integer read _GetactionOverflowButtonStyle;
    {class} property actionOverflowMenuStyle: Integer read _GetactionOverflowMenuStyle;
    {class} property actionProviderClass: Integer read _GetactionProviderClass;
    {class} property actionViewClass: Integer read _GetactionViewClass;
    {class} property activityChooserViewStyle: Integer read _GetactivityChooserViewStyle;
    {class} property alertDialogButtonGroupStyle: Integer read _GetalertDialogButtonGroupStyle;
    {class} property alertDialogCenterButtons: Integer read _GetalertDialogCenterButtons;
    {class} property alertDialogStyle: Integer read _GetalertDialogStyle;
    {class} property alertDialogTheme: Integer read _GetalertDialogTheme;
    {class} property allowStacking: Integer read _GetallowStacking;
    {class} property alpha: Integer read _Getalpha;
    {class} property alphabeticModifiers: Integer read _GetalphabeticModifiers;
    {class} property arrowHeadLength: Integer read _GetarrowHeadLength;
    {class} property arrowShaftLength: Integer read _GetarrowShaftLength;
    {class} property autoCompleteTextViewStyle: Integer read _GetautoCompleteTextViewStyle;
    {class} property autoSizeMaxTextSize: Integer read _GetautoSizeMaxTextSize;
    {class} property autoSizeMinTextSize: Integer read _GetautoSizeMinTextSize;
    {class} property autoSizePresetSizes: Integer read _GetautoSizePresetSizes;
    {class} property autoSizeStepGranularity: Integer read _GetautoSizeStepGranularity;
    {class} property autoSizeTextType: Integer read _GetautoSizeTextType;
    {class} property background: Integer read _Getbackground;
    {class} property backgroundSplit: Integer read _GetbackgroundSplit;
    {class} property backgroundStacked: Integer read _GetbackgroundStacked;
    {class} property backgroundTint: Integer read _GetbackgroundTint;
    {class} property backgroundTintMode: Integer read _GetbackgroundTintMode;
    {class} property barLength: Integer read _GetbarLength;
    {class} property borderlessButtonStyle: Integer read _GetborderlessButtonStyle;
    {class} property buttonBarButtonStyle: Integer read _GetbuttonBarButtonStyle;
    {class} property buttonBarNegativeButtonStyle: Integer read _GetbuttonBarNegativeButtonStyle;
    {class} property buttonBarNeutralButtonStyle: Integer read _GetbuttonBarNeutralButtonStyle;
    {class} property buttonBarPositiveButtonStyle: Integer read _GetbuttonBarPositiveButtonStyle;
    {class} property buttonBarStyle: Integer read _GetbuttonBarStyle;
    {class} property buttonGravity: Integer read _GetbuttonGravity;
    {class} property buttonIconDimen: Integer read _GetbuttonIconDimen;
    {class} property buttonPanelSideLayout: Integer read _GetbuttonPanelSideLayout;
    {class} property buttonStyle: Integer read _GetbuttonStyle;
    {class} property buttonStyleSmall: Integer read _GetbuttonStyleSmall;
    {class} property buttonTint: Integer read _GetbuttonTint;
    {class} property buttonTintMode: Integer read _GetbuttonTintMode;
    {class} property checkboxStyle: Integer read _GetcheckboxStyle;
    {class} property checkedTextViewStyle: Integer read _GetcheckedTextViewStyle;
    {class} property closeIcon: Integer read _GetcloseIcon;
    {class} property closeItemLayout: Integer read _GetcloseItemLayout;
    {class} property collapseContentDescription: Integer read _GetcollapseContentDescription;
    {class} property collapseIcon: Integer read _GetcollapseIcon;
    {class} property color: Integer read _Getcolor;
    {class} property colorAccent: Integer read _GetcolorAccent;
    {class} property colorBackgroundFloating: Integer read _GetcolorBackgroundFloating;
    {class} property colorButtonNormal: Integer read _GetcolorButtonNormal;
    {class} property colorControlActivated: Integer read _GetcolorControlActivated;
    {class} property colorControlHighlight: Integer read _GetcolorControlHighlight;
    {class} property colorControlNormal: Integer read _GetcolorControlNormal;
    {class} property colorError: Integer read _GetcolorError;
    {class} property colorPrimary: Integer read _GetcolorPrimary;
    {class} property colorPrimaryDark: Integer read _GetcolorPrimaryDark;
    {class} property colorSwitchThumbNormal: Integer read _GetcolorSwitchThumbNormal;
    {class} property commitIcon: Integer read _GetcommitIcon;
    {class} property contentDescription: Integer read _GetcontentDescription;
    {class} property contentInsetEnd: Integer read _GetcontentInsetEnd;
    {class} property contentInsetEndWithActions: Integer read _GetcontentInsetEndWithActions;
    {class} property contentInsetLeft: Integer read _GetcontentInsetLeft;
    {class} property contentInsetRight: Integer read _GetcontentInsetRight;
    {class} property contentInsetStart: Integer read _GetcontentInsetStart;
    {class} property contentInsetStartWithNavigation: Integer read _GetcontentInsetStartWithNavigation;
    {class} property controlBackground: Integer read _GetcontrolBackground;
    {class} property coordinatorLayoutStyle: Integer read _GetcoordinatorLayoutStyle;
    {class} property customNavigationLayout: Integer read _GetcustomNavigationLayout;
    {class} property defaultQueryHint: Integer read _GetdefaultQueryHint;
    {class} property dialogCornerRadius: Integer read _GetdialogCornerRadius;
    {class} property dialogPreferredPadding: Integer read _GetdialogPreferredPadding;
    {class} property dialogTheme: Integer read _GetdialogTheme;
    {class} property displayOptions: Integer read _GetdisplayOptions;
    {class} property divider: Integer read _Getdivider;
    {class} property dividerHorizontal: Integer read _GetdividerHorizontal;
    {class} property dividerPadding: Integer read _GetdividerPadding;
    {class} property dividerVertical: Integer read _GetdividerVertical;
    {class} property drawableSize: Integer read _GetdrawableSize;
    {class} property drawerArrowStyle: Integer read _GetdrawerArrowStyle;
    {class} property dropDownListViewStyle: Integer read _GetdropDownListViewStyle;
    {class} property dropdownListPreferredItemHeight: Integer read _GetdropdownListPreferredItemHeight;
    {class} property editTextBackground: Integer read _GeteditTextBackground;
    {class} property editTextColor: Integer read _GeteditTextColor;
    {class} property editTextStyle: Integer read _GeteditTextStyle;
    {class} property elevation: Integer read _Getelevation;
    {class} property expandActivityOverflowButtonDrawable: Integer read _GetexpandActivityOverflowButtonDrawable;
    {class} property firstBaselineToTopHeight: Integer read _GetfirstBaselineToTopHeight;
    {class} property font: Integer read _Getfont;
    {class} property fontFamily: Integer read _GetfontFamily;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property gapBetweenBars: Integer read _GetgapBetweenBars;
    {class} property goIcon: Integer read _GetgoIcon;
    {class} property height: Integer read _Getheight;
    {class} property hideOnContentScroll: Integer read _GethideOnContentScroll;
    {class} property homeAsUpIndicator: Integer read _GethomeAsUpIndicator;
    {class} property homeLayout: Integer read _GethomeLayout;
    {class} property icon: Integer read _Geticon;
    {class} property iconTint: Integer read _GeticonTint;
    {class} property iconTintMode: Integer read _GeticonTintMode;
    {class} property iconifiedByDefault: Integer read _GeticonifiedByDefault;
    {class} property imageButtonStyle: Integer read _GetimageButtonStyle;
    {class} property indeterminateProgressStyle: Integer read _GetindeterminateProgressStyle;
    {class} property initialActivityCount: Integer read _GetinitialActivityCount;
    {class} property isLightTheme: Integer read _GetisLightTheme;
    {class} property itemPadding: Integer read _GetitemPadding;
    {class} property keylines: Integer read _Getkeylines;
    {class} property lastBaselineToBottomHeight: Integer read _GetlastBaselineToBottomHeight;
    {class} property layout: Integer read _Getlayout;
    {class} property layout_anchor: Integer read _Getlayout_anchor;
    {class} property layout_anchorGravity: Integer read _Getlayout_anchorGravity;
    {class} property layout_behavior: Integer read _Getlayout_behavior;
    {class} property layout_dodgeInsetEdges: Integer read _Getlayout_dodgeInsetEdges;
    {class} property layout_insetEdge: Integer read _Getlayout_insetEdge;
    {class} property layout_keyline: Integer read _Getlayout_keyline;
    {class} property lineHeight: Integer read _GetlineHeight;
    {class} property listChoiceBackgroundIndicator: Integer read _GetlistChoiceBackgroundIndicator;
    {class} property listDividerAlertDialog: Integer read _GetlistDividerAlertDialog;
    {class} property listItemLayout: Integer read _GetlistItemLayout;
    {class} property listLayout: Integer read _GetlistLayout;
    {class} property listMenuViewStyle: Integer read _GetlistMenuViewStyle;
    {class} property listPopupWindowStyle: Integer read _GetlistPopupWindowStyle;
    {class} property listPreferredItemHeight: Integer read _GetlistPreferredItemHeight;
    {class} property listPreferredItemHeightLarge: Integer read _GetlistPreferredItemHeightLarge;
    {class} property listPreferredItemHeightSmall: Integer read _GetlistPreferredItemHeightSmall;
    {class} property listPreferredItemPaddingLeft: Integer read _GetlistPreferredItemPaddingLeft;
    {class} property listPreferredItemPaddingRight: Integer read _GetlistPreferredItemPaddingRight;
    {class} property logo: Integer read _Getlogo;
    {class} property logoDescription: Integer read _GetlogoDescription;
    {class} property maxButtonHeight: Integer read _GetmaxButtonHeight;
    {class} property measureWithLargestChild: Integer read _GetmeasureWithLargestChild;
    {class} property multiChoiceItemLayout: Integer read _GetmultiChoiceItemLayout;
    {class} property navigationContentDescription: Integer read _GetnavigationContentDescription;
    {class} property navigationIcon: Integer read _GetnavigationIcon;
    {class} property navigationMode: Integer read _GetnavigationMode;
    {class} property numericModifiers: Integer read _GetnumericModifiers;
    {class} property overlapAnchor: Integer read _GetoverlapAnchor;
    {class} property paddingBottomNoButtons: Integer read _GetpaddingBottomNoButtons;
    {class} property paddingEnd: Integer read _GetpaddingEnd;
    {class} property paddingStart: Integer read _GetpaddingStart;
    {class} property paddingTopNoTitle: Integer read _GetpaddingTopNoTitle;
    {class} property panelBackground: Integer read _GetpanelBackground;
    {class} property panelMenuListTheme: Integer read _GetpanelMenuListTheme;
    {class} property panelMenuListWidth: Integer read _GetpanelMenuListWidth;
    {class} property popupMenuStyle: Integer read _GetpopupMenuStyle;
    {class} property popupTheme: Integer read _GetpopupTheme;
    {class} property popupWindowStyle: Integer read _GetpopupWindowStyle;
    {class} property preserveIconSpacing: Integer read _GetpreserveIconSpacing;
    {class} property progressBarPadding: Integer read _GetprogressBarPadding;
    {class} property progressBarStyle: Integer read _GetprogressBarStyle;
    {class} property queryBackground: Integer read _GetqueryBackground;
    {class} property queryHint: Integer read _GetqueryHint;
    {class} property radioButtonStyle: Integer read _GetradioButtonStyle;
    {class} property ratingBarStyle: Integer read _GetratingBarStyle;
    {class} property ratingBarStyleIndicator: Integer read _GetratingBarStyleIndicator;
    {class} property ratingBarStyleSmall: Integer read _GetratingBarStyleSmall;
    {class} property searchHintIcon: Integer read _GetsearchHintIcon;
    {class} property searchIcon: Integer read _GetsearchIcon;
    {class} property searchViewStyle: Integer read _GetsearchViewStyle;
    {class} property seekBarStyle: Integer read _GetseekBarStyle;
    {class} property selectableItemBackground: Integer read _GetselectableItemBackground;
    {class} property selectableItemBackgroundBorderless: Integer read _GetselectableItemBackgroundBorderless;
    {class} property showAsAction: Integer read _GetshowAsAction;
    {class} property showDividers: Integer read _GetshowDividers;
    {class} property showText: Integer read _GetshowText;
    {class} property showTitle: Integer read _GetshowTitle;
    {class} property singleChoiceItemLayout: Integer read _GetsingleChoiceItemLayout;
    {class} property spinBars: Integer read _GetspinBars;
    {class} property spinnerDropDownItemStyle: Integer read _GetspinnerDropDownItemStyle;
    {class} property spinnerStyle: Integer read _GetspinnerStyle;
    {class} property splitTrack: Integer read _GetsplitTrack;
    {class} property srcCompat: Integer read _GetsrcCompat;
    {class} property state_above_anchor: Integer read _Getstate_above_anchor;
    {class} property statusBarBackground: Integer read _GetstatusBarBackground;
    {class} property subMenuArrow: Integer read _GetsubMenuArrow;
    {class} property submitBackground: Integer read _GetsubmitBackground;
    {class} property subtitle: Integer read _Getsubtitle;
    {class} property subtitleTextAppearance: Integer read _GetsubtitleTextAppearance;
    {class} property subtitleTextColor: Integer read _GetsubtitleTextColor;
    {class} property subtitleTextStyle: Integer read _GetsubtitleTextStyle;
    {class} property suggestionRowLayout: Integer read _GetsuggestionRowLayout;
    {class} property switchMinWidth: Integer read _GetswitchMinWidth;
    {class} property switchPadding: Integer read _GetswitchPadding;
    {class} property switchStyle: Integer read _GetswitchStyle;
    {class} property switchTextAppearance: Integer read _GetswitchTextAppearance;
    {class} property textAllCaps: Integer read _GettextAllCaps;
    {class} property textAppearanceLargePopupMenu: Integer read _GettextAppearanceLargePopupMenu;
    {class} property textAppearanceListItem: Integer read _GettextAppearanceListItem;
    {class} property textAppearanceListItemSecondary: Integer read _GettextAppearanceListItemSecondary;
    {class} property textAppearanceListItemSmall: Integer read _GettextAppearanceListItemSmall;
    {class} property textAppearancePopupMenuHeader: Integer read _GettextAppearancePopupMenuHeader;
    {class} property textAppearanceSearchResultSubtitle: Integer read _GettextAppearanceSearchResultSubtitle;
    {class} property textAppearanceSearchResultTitle: Integer read _GettextAppearanceSearchResultTitle;
    {class} property textAppearanceSmallPopupMenu: Integer read _GettextAppearanceSmallPopupMenu;
    {class} property textColorAlertDialogListItem: Integer read _GettextColorAlertDialogListItem;
    {class} property textColorSearchUrl: Integer read _GettextColorSearchUrl;
    {class} property theme: Integer read _Gettheme;
    {class} property thickness: Integer read _Getthickness;
    {class} property thumbTextPadding: Integer read _GetthumbTextPadding;
    {class} property thumbTint: Integer read _GetthumbTint;
    {class} property thumbTintMode: Integer read _GetthumbTintMode;
    {class} property tickMark: Integer read _GettickMark;
    {class} property tickMarkTint: Integer read _GettickMarkTint;
    {class} property tickMarkTintMode: Integer read _GettickMarkTintMode;
    {class} property tint: Integer read _Gettint;
    {class} property tintMode: Integer read _GettintMode;
    {class} property title: Integer read _Gettitle;
    {class} property titleMargin: Integer read _GettitleMargin;
    {class} property titleMarginBottom: Integer read _GettitleMarginBottom;
    {class} property titleMarginEnd: Integer read _GettitleMarginEnd;
    {class} property titleMarginStart: Integer read _GettitleMarginStart;
    {class} property titleMarginTop: Integer read _GettitleMarginTop;
    {class} property titleMargins: Integer read _GettitleMargins;
    {class} property titleTextAppearance: Integer read _GettitleTextAppearance;
    {class} property titleTextColor: Integer read _GettitleTextColor;
    {class} property titleTextStyle: Integer read _GettitleTextStyle;
    {class} property toolbarNavigationButtonStyle: Integer read _GettoolbarNavigationButtonStyle;
    {class} property toolbarStyle: Integer read _GettoolbarStyle;
    {class} property tooltipForegroundColor: Integer read _GettooltipForegroundColor;
    {class} property tooltipFrameBackground: Integer read _GettooltipFrameBackground;
    {class} property tooltipText: Integer read _GettooltipText;
    {class} property track: Integer read _Gettrack;
    {class} property trackTint: Integer read _GettrackTint;
    {class} property trackTintMode: Integer read _GettrackTintMode;
    {class} property ttcIndex: Integer read _GetttcIndex;
    {class} property viewInflaterClass: Integer read _GetviewInflaterClass;
    {class} property voiceIcon: Integer read _GetvoiceIcon;
    {class} property windowActionBar: Integer read _GetwindowActionBar;
    {class} property windowActionBarOverlay: Integer read _GetwindowActionBarOverlay;
    {class} property windowActionModeOverlay: Integer read _GetwindowActionModeOverlay;
    {class} property windowFixedHeightMajor: Integer read _GetwindowFixedHeightMajor;
    {class} property windowFixedHeightMinor: Integer read _GetwindowFixedHeightMinor;
    {class} property windowFixedWidthMajor: Integer read _GetwindowFixedWidthMajor;
    {class} property windowFixedWidthMinor: Integer read _GetwindowFixedWidthMinor;
    {class} property windowMinWidthMajor: Integer read _GetwindowMinWidthMajor;
    {class} property windowMinWidthMinor: Integer read _GetwindowMinWidthMinor;
    {class} property windowNoTitle: Integer read _GetwindowNoTitle;
  end;

  [JavaSignature('android/support/v7/appcompat/R$attr')]
  JR_attr_046 = interface(JObject)
  ['{7C35823B-5F36-40AE-80EE-25C3DF1F9605}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_046 = class(TJavaGenericImport<JR_attr_046Class, JR_attr_046>) end;

  JR_bool_047Class = interface(JObjectClass)
  ['{D7F62F04-8A33-47D2-9AF4-BA71ACA8EF6B}']
    { static Property Methods }
    {class} function _Getabc_action_bar_embed_tabs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_allow_stacked_button_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_actionMenuItemAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_bool_047; cdecl;

    { static Property }
    {class} property abc_action_bar_embed_tabs: Integer read _Getabc_action_bar_embed_tabs;
    {class} property abc_allow_stacked_button_bar: Integer read _Getabc_allow_stacked_button_bar;
    {class} property abc_config_actionMenuItemAllCaps: Integer read _Getabc_config_actionMenuItemAllCaps;
  end;

  [JavaSignature('android/support/v7/appcompat/R$bool')]
  JR_bool_047 = interface(JObject)
  ['{CEA832F7-DB3A-4B9D-B901-0DFF5DE548ED}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_047 = class(TJavaGenericImport<JR_bool_047Class, JR_bool_047>) end;

  JR_color_048Class = interface(JObjectClass)
  ['{DD6E15FD-F033-4F90-98F9-2E9CFAD55A3E}']
    { static Property Methods }
    {class} function _Getabc_background_cache_hint_selector_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_background_cache_hint_selector_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_borderless_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_color_highlight_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_hint_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_hint_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_input_method_navigation_guard: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_disable_only_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_disable_only_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_selected: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_secondary_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_secondary_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_btn_checkable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_default: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_edittext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_seek_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_switch_track: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaccent_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaccent_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_floating_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_floating_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_inverse_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_inverse_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbutton_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbutton_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geterror_color_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geterror_color_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforeground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforeground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlighted_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlighted_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_900: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_950: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_deep_teal_200: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_deep_teal_500: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_100: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_300: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_50: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_850: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_900: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_dark_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_dark_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_normal_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_normal_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_background_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_background_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_048; cdecl;

    { static Property }
    {class} property abc_background_cache_hint_selector_material_dark: Integer read _Getabc_background_cache_hint_selector_material_dark;
    {class} property abc_background_cache_hint_selector_material_light: Integer read _Getabc_background_cache_hint_selector_material_light;
    {class} property abc_btn_colored_borderless_text_material: Integer read _Getabc_btn_colored_borderless_text_material;
    {class} property abc_btn_colored_text_material: Integer read _Getabc_btn_colored_text_material;
    {class} property abc_color_highlight_material: Integer read _Getabc_color_highlight_material;
    {class} property abc_hint_foreground_material_dark: Integer read _Getabc_hint_foreground_material_dark;
    {class} property abc_hint_foreground_material_light: Integer read _Getabc_hint_foreground_material_light;
    {class} property abc_input_method_navigation_guard: Integer read _Getabc_input_method_navigation_guard;
    {class} property abc_primary_text_disable_only_material_dark: Integer read _Getabc_primary_text_disable_only_material_dark;
    {class} property abc_primary_text_disable_only_material_light: Integer read _Getabc_primary_text_disable_only_material_light;
    {class} property abc_primary_text_material_dark: Integer read _Getabc_primary_text_material_dark;
    {class} property abc_primary_text_material_light: Integer read _Getabc_primary_text_material_light;
    {class} property abc_search_url_text: Integer read _Getabc_search_url_text;
    {class} property abc_search_url_text_normal: Integer read _Getabc_search_url_text_normal;
    {class} property abc_search_url_text_pressed: Integer read _Getabc_search_url_text_pressed;
    {class} property abc_search_url_text_selected: Integer read _Getabc_search_url_text_selected;
    {class} property abc_secondary_text_material_dark: Integer read _Getabc_secondary_text_material_dark;
    {class} property abc_secondary_text_material_light: Integer read _Getabc_secondary_text_material_light;
    {class} property abc_tint_btn_checkable: Integer read _Getabc_tint_btn_checkable;
    {class} property abc_tint_default: Integer read _Getabc_tint_default;
    {class} property abc_tint_edittext: Integer read _Getabc_tint_edittext;
    {class} property abc_tint_seek_thumb: Integer read _Getabc_tint_seek_thumb;
    {class} property abc_tint_spinner: Integer read _Getabc_tint_spinner;
    {class} property abc_tint_switch_track: Integer read _Getabc_tint_switch_track;
    {class} property accent_material_dark: Integer read _Getaccent_material_dark;
    {class} property accent_material_light: Integer read _Getaccent_material_light;
    {class} property background_floating_material_dark: Integer read _Getbackground_floating_material_dark;
    {class} property background_floating_material_light: Integer read _Getbackground_floating_material_light;
    {class} property background_material_dark: Integer read _Getbackground_material_dark;
    {class} property background_material_light: Integer read _Getbackground_material_light;
    {class} property bright_foreground_disabled_material_dark: Integer read _Getbright_foreground_disabled_material_dark;
    {class} property bright_foreground_disabled_material_light: Integer read _Getbright_foreground_disabled_material_light;
    {class} property bright_foreground_inverse_material_dark: Integer read _Getbright_foreground_inverse_material_dark;
    {class} property bright_foreground_inverse_material_light: Integer read _Getbright_foreground_inverse_material_light;
    {class} property bright_foreground_material_dark: Integer read _Getbright_foreground_material_dark;
    {class} property bright_foreground_material_light: Integer read _Getbright_foreground_material_light;
    {class} property button_material_dark: Integer read _Getbutton_material_dark;
    {class} property button_material_light: Integer read _Getbutton_material_light;
    {class} property dim_foreground_disabled_material_dark: Integer read _Getdim_foreground_disabled_material_dark;
    {class} property dim_foreground_disabled_material_light: Integer read _Getdim_foreground_disabled_material_light;
    {class} property dim_foreground_material_dark: Integer read _Getdim_foreground_material_dark;
    {class} property dim_foreground_material_light: Integer read _Getdim_foreground_material_light;
    {class} property error_color_material_dark: Integer read _Geterror_color_material_dark;
    {class} property error_color_material_light: Integer read _Geterror_color_material_light;
    {class} property foreground_material_dark: Integer read _Getforeground_material_dark;
    {class} property foreground_material_light: Integer read _Getforeground_material_light;
    {class} property highlighted_text_material_dark: Integer read _Gethighlighted_text_material_dark;
    {class} property highlighted_text_material_light: Integer read _Gethighlighted_text_material_light;
    {class} property material_blue_grey_800: Integer read _Getmaterial_blue_grey_800;
    {class} property material_blue_grey_900: Integer read _Getmaterial_blue_grey_900;
    {class} property material_blue_grey_950: Integer read _Getmaterial_blue_grey_950;
    {class} property material_deep_teal_200: Integer read _Getmaterial_deep_teal_200;
    {class} property material_deep_teal_500: Integer read _Getmaterial_deep_teal_500;
    {class} property material_grey_100: Integer read _Getmaterial_grey_100;
    {class} property material_grey_300: Integer read _Getmaterial_grey_300;
    {class} property material_grey_50: Integer read _Getmaterial_grey_50;
    {class} property material_grey_600: Integer read _Getmaterial_grey_600;
    {class} property material_grey_800: Integer read _Getmaterial_grey_800;
    {class} property material_grey_850: Integer read _Getmaterial_grey_850;
    {class} property material_grey_900: Integer read _Getmaterial_grey_900;
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property primary_dark_material_dark: Integer read _Getprimary_dark_material_dark;
    {class} property primary_dark_material_light: Integer read _Getprimary_dark_material_light;
    {class} property primary_material_dark: Integer read _Getprimary_material_dark;
    {class} property primary_material_light: Integer read _Getprimary_material_light;
    {class} property primary_text_default_material_dark: Integer read _Getprimary_text_default_material_dark;
    {class} property primary_text_default_material_light: Integer read _Getprimary_text_default_material_light;
    {class} property primary_text_disabled_material_dark: Integer read _Getprimary_text_disabled_material_dark;
    {class} property primary_text_disabled_material_light: Integer read _Getprimary_text_disabled_material_light;
    {class} property ripple_material_dark: Integer read _Getripple_material_dark;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_dark: Integer read _Getsecondary_text_default_material_dark;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
    {class} property secondary_text_disabled_material_dark: Integer read _Getsecondary_text_disabled_material_dark;
    {class} property secondary_text_disabled_material_light: Integer read _Getsecondary_text_disabled_material_light;
    {class} property switch_thumb_disabled_material_dark: Integer read _Getswitch_thumb_disabled_material_dark;
    {class} property switch_thumb_disabled_material_light: Integer read _Getswitch_thumb_disabled_material_light;
    {class} property switch_thumb_material_dark: Integer read _Getswitch_thumb_material_dark;
    {class} property switch_thumb_material_light: Integer read _Getswitch_thumb_material_light;
    {class} property switch_thumb_normal_material_dark: Integer read _Getswitch_thumb_normal_material_dark;
    {class} property switch_thumb_normal_material_light: Integer read _Getswitch_thumb_normal_material_light;
    {class} property tooltip_background_dark: Integer read _Gettooltip_background_dark;
    {class} property tooltip_background_light: Integer read _Gettooltip_background_light;
  end;

  [JavaSignature('android/support/v7/appcompat/R$color')]
  JR_color_048 = interface(JObject)
  ['{70214427-2BFB-4971-A37F-51B8455A50BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_048 = class(TJavaGenericImport<JR_color_048Class, JR_color_048>) end;

  JR_dimen_049Class = interface(JObjectClass)
  ['{9473C531-B31C-4098-AD7C-9F33AEEEFA49}']
    { static Property Methods }
    {class} function _Getabc_action_bar_content_inset_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_content_inset_with_nav: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_padding_end_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_elevation_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_icon_vertical_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_overflow_padding_end_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_overflow_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_stacked_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_stacked_tab_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_subtitle_bottom_margin_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_subtitle_top_margin_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_width_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_width_overflow_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_bar_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_dimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cascading_menus_min_smallest_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_prefDialogWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_inset_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_corner_radius_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_height_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_height_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_width_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_width_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_list_padding_bottom_no_buttons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_list_padding_top_no_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_min_width_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_min_width_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_padding_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_title_divider_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_disabled_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_disabled_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_text_padding_left: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_text_padding_right: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_bottom_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_floating_window_z: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_item_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_panel_menu_list_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_progress_bar_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view_preferred_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view_preferred_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_background_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_progress_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_select_dialog_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_body_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_body_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_button_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_caption_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_3_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_4_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_headline_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_large_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_medium_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_menu_header_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_menu_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_small_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_subhead_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_subtitle_material_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_title_material_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdisabled_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdisabled_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_pressed_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_pressed_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_corner_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_horizontal_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_precise_anchor_extra_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_precise_anchor_threshold: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_vertical_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_y_offset_non_touch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_y_offset_touch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen_049; cdecl;

    { static Property }
    {class} property abc_action_bar_content_inset_material: Integer read _Getabc_action_bar_content_inset_material;
    {class} property abc_action_bar_content_inset_with_nav: Integer read _Getabc_action_bar_content_inset_with_nav;
    {class} property abc_action_bar_default_height_material: Integer read _Getabc_action_bar_default_height_material;
    {class} property abc_action_bar_default_padding_end_material: Integer read _Getabc_action_bar_default_padding_end_material;
    {class} property abc_action_bar_default_padding_start_material: Integer read _Getabc_action_bar_default_padding_start_material;
    {class} property abc_action_bar_elevation_material: Integer read _Getabc_action_bar_elevation_material;
    {class} property abc_action_bar_icon_vertical_padding_material: Integer read _Getabc_action_bar_icon_vertical_padding_material;
    {class} property abc_action_bar_overflow_padding_end_material: Integer read _Getabc_action_bar_overflow_padding_end_material;
    {class} property abc_action_bar_overflow_padding_start_material: Integer read _Getabc_action_bar_overflow_padding_start_material;
    {class} property abc_action_bar_stacked_max_height: Integer read _Getabc_action_bar_stacked_max_height;
    {class} property abc_action_bar_stacked_tab_max_width: Integer read _Getabc_action_bar_stacked_tab_max_width;
    {class} property abc_action_bar_subtitle_bottom_margin_material: Integer read _Getabc_action_bar_subtitle_bottom_margin_material;
    {class} property abc_action_bar_subtitle_top_margin_material: Integer read _Getabc_action_bar_subtitle_top_margin_material;
    {class} property abc_action_button_min_height_material: Integer read _Getabc_action_button_min_height_material;
    {class} property abc_action_button_min_width_material: Integer read _Getabc_action_button_min_width_material;
    {class} property abc_action_button_min_width_overflow_material: Integer read _Getabc_action_button_min_width_overflow_material;
    {class} property abc_alert_dialog_button_bar_height: Integer read _Getabc_alert_dialog_button_bar_height;
    {class} property abc_alert_dialog_button_dimen: Integer read _Getabc_alert_dialog_button_dimen;
    {class} property abc_button_inset_horizontal_material: Integer read _Getabc_button_inset_horizontal_material;
    {class} property abc_button_inset_vertical_material: Integer read _Getabc_button_inset_vertical_material;
    {class} property abc_button_padding_horizontal_material: Integer read _Getabc_button_padding_horizontal_material;
    {class} property abc_button_padding_vertical_material: Integer read _Getabc_button_padding_vertical_material;
    {class} property abc_cascading_menus_min_smallest_width: Integer read _Getabc_cascading_menus_min_smallest_width;
    {class} property abc_config_prefDialogWidth: Integer read _Getabc_config_prefDialogWidth;
    {class} property abc_control_corner_material: Integer read _Getabc_control_corner_material;
    {class} property abc_control_inset_material: Integer read _Getabc_control_inset_material;
    {class} property abc_control_padding_material: Integer read _Getabc_control_padding_material;
    {class} property abc_dialog_corner_radius_material: Integer read _Getabc_dialog_corner_radius_material;
    {class} property abc_dialog_fixed_height_major: Integer read _Getabc_dialog_fixed_height_major;
    {class} property abc_dialog_fixed_height_minor: Integer read _Getabc_dialog_fixed_height_minor;
    {class} property abc_dialog_fixed_width_major: Integer read _Getabc_dialog_fixed_width_major;
    {class} property abc_dialog_fixed_width_minor: Integer read _Getabc_dialog_fixed_width_minor;
    {class} property abc_dialog_list_padding_bottom_no_buttons: Integer read _Getabc_dialog_list_padding_bottom_no_buttons;
    {class} property abc_dialog_list_padding_top_no_title: Integer read _Getabc_dialog_list_padding_top_no_title;
    {class} property abc_dialog_min_width_major: Integer read _Getabc_dialog_min_width_major;
    {class} property abc_dialog_min_width_minor: Integer read _Getabc_dialog_min_width_minor;
    {class} property abc_dialog_padding_material: Integer read _Getabc_dialog_padding_material;
    {class} property abc_dialog_padding_top_material: Integer read _Getabc_dialog_padding_top_material;
    {class} property abc_dialog_title_divider_material: Integer read _Getabc_dialog_title_divider_material;
    {class} property abc_disabled_alpha_material_dark: Integer read _Getabc_disabled_alpha_material_dark;
    {class} property abc_disabled_alpha_material_light: Integer read _Getabc_disabled_alpha_material_light;
    {class} property abc_dropdownitem_icon_width: Integer read _Getabc_dropdownitem_icon_width;
    {class} property abc_dropdownitem_text_padding_left: Integer read _Getabc_dropdownitem_text_padding_left;
    {class} property abc_dropdownitem_text_padding_right: Integer read _Getabc_dropdownitem_text_padding_right;
    {class} property abc_edit_text_inset_bottom_material: Integer read _Getabc_edit_text_inset_bottom_material;
    {class} property abc_edit_text_inset_horizontal_material: Integer read _Getabc_edit_text_inset_horizontal_material;
    {class} property abc_edit_text_inset_top_material: Integer read _Getabc_edit_text_inset_top_material;
    {class} property abc_floating_window_z: Integer read _Getabc_floating_window_z;
    {class} property abc_list_item_padding_horizontal_material: Integer read _Getabc_list_item_padding_horizontal_material;
    {class} property abc_panel_menu_list_width: Integer read _Getabc_panel_menu_list_width;
    {class} property abc_progress_bar_height_material: Integer read _Getabc_progress_bar_height_material;
    {class} property abc_search_view_preferred_height: Integer read _Getabc_search_view_preferred_height;
    {class} property abc_search_view_preferred_width: Integer read _Getabc_search_view_preferred_width;
    {class} property abc_seekbar_track_background_height_material: Integer read _Getabc_seekbar_track_background_height_material;
    {class} property abc_seekbar_track_progress_height_material: Integer read _Getabc_seekbar_track_progress_height_material;
    {class} property abc_select_dialog_padding_start_material: Integer read _Getabc_select_dialog_padding_start_material;
    {class} property abc_switch_padding: Integer read _Getabc_switch_padding;
    {class} property abc_text_size_body_1_material: Integer read _Getabc_text_size_body_1_material;
    {class} property abc_text_size_body_2_material: Integer read _Getabc_text_size_body_2_material;
    {class} property abc_text_size_button_material: Integer read _Getabc_text_size_button_material;
    {class} property abc_text_size_caption_material: Integer read _Getabc_text_size_caption_material;
    {class} property abc_text_size_display_1_material: Integer read _Getabc_text_size_display_1_material;
    {class} property abc_text_size_display_2_material: Integer read _Getabc_text_size_display_2_material;
    {class} property abc_text_size_display_3_material: Integer read _Getabc_text_size_display_3_material;
    {class} property abc_text_size_display_4_material: Integer read _Getabc_text_size_display_4_material;
    {class} property abc_text_size_headline_material: Integer read _Getabc_text_size_headline_material;
    {class} property abc_text_size_large_material: Integer read _Getabc_text_size_large_material;
    {class} property abc_text_size_medium_material: Integer read _Getabc_text_size_medium_material;
    {class} property abc_text_size_menu_header_material: Integer read _Getabc_text_size_menu_header_material;
    {class} property abc_text_size_menu_material: Integer read _Getabc_text_size_menu_material;
    {class} property abc_text_size_small_material: Integer read _Getabc_text_size_small_material;
    {class} property abc_text_size_subhead_material: Integer read _Getabc_text_size_subhead_material;
    {class} property abc_text_size_subtitle_material_toolbar: Integer read _Getabc_text_size_subtitle_material_toolbar;
    {class} property abc_text_size_title_material: Integer read _Getabc_text_size_title_material;
    {class} property abc_text_size_title_material_toolbar: Integer read _Getabc_text_size_title_material_toolbar;
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property disabled_alpha_material_dark: Integer read _Getdisabled_alpha_material_dark;
    {class} property disabled_alpha_material_light: Integer read _Getdisabled_alpha_material_light;
    {class} property highlight_alpha_material_colored: Integer read _Gethighlight_alpha_material_colored;
    {class} property highlight_alpha_material_dark: Integer read _Gethighlight_alpha_material_dark;
    {class} property highlight_alpha_material_light: Integer read _Gethighlight_alpha_material_light;
    {class} property hint_alpha_material_dark: Integer read _Gethint_alpha_material_dark;
    {class} property hint_alpha_material_light: Integer read _Gethint_alpha_material_light;
    {class} property hint_pressed_alpha_material_dark: Integer read _Gethint_pressed_alpha_material_dark;
    {class} property hint_pressed_alpha_material_light: Integer read _Gethint_pressed_alpha_material_light;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
    {class} property tooltip_corner_radius: Integer read _Gettooltip_corner_radius;
    {class} property tooltip_horizontal_padding: Integer read _Gettooltip_horizontal_padding;
    {class} property tooltip_margin: Integer read _Gettooltip_margin;
    {class} property tooltip_precise_anchor_extra_offset: Integer read _Gettooltip_precise_anchor_extra_offset;
    {class} property tooltip_precise_anchor_threshold: Integer read _Gettooltip_precise_anchor_threshold;
    {class} property tooltip_vertical_padding: Integer read _Gettooltip_vertical_padding;
    {class} property tooltip_y_offset_non_touch: Integer read _Gettooltip_y_offset_non_touch;
    {class} property tooltip_y_offset_touch: Integer read _Gettooltip_y_offset_touch;
  end;

  [JavaSignature('android/support/v7/appcompat/R$dimen')]
  JR_dimen_049 = interface(JObject)
  ['{76D543AC-A058-444D-98E7-8A90AE9FC11C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_049 = class(TJavaGenericImport<JR_dimen_049Class, JR_dimen_049>) end;

  JR_drawable_050Class = interface(JObjectClass)
  ['{A206A194-26BC-45BE-ABB7-D3F944A8C4A3}']
    { static Property Methods }
    {class} function _Getabc_ab_share_pack_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_item_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_borderless_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_to_on_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_to_on_mtrl_015: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_default_mtrl_shape: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_to_on_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_to_on_mtrl_015: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_switch_to_on_mtrl_00001: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_switch_to_on_mtrl_00012: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_internal_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_top_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_material_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_ab_back_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_arrow_drop_right_black_24dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_clear_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_commit_search_api_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_go_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_copy_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_cut_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_overflow_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_paste_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_selectall_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_share_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_16dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_36dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_48dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_16dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_36dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_48dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_voice_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_item_background_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_item_background_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_divider_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_divider_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_focused_holo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_longpressed_holo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_pressed_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_pressed_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_background_transition_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_background_transition_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_disabled_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_disabled_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_hardkey_panel_mtrl_mult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_background_mtrl_mult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_indicator_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_small_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_off_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_to_pressed_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_to_pressed_mtrl_005: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_primary_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_track_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_thumb_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_tick_mark_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_spinner_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_spinner_textfield_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_thumb_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_track_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tab_indicator_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tab_indicator_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_cursor_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_left_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_left_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_middle_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_middle_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_right_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_right_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_activated_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_default_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_activated_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_default_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_vector_test: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_frame_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_frame_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable_050; cdecl;

    { static Property }
    {class} property abc_ab_share_pack_mtrl_alpha: Integer read _Getabc_ab_share_pack_mtrl_alpha;
    {class} property abc_action_bar_item_background_material: Integer read _Getabc_action_bar_item_background_material;
    {class} property abc_btn_borderless_material: Integer read _Getabc_btn_borderless_material;
    {class} property abc_btn_check_material: Integer read _Getabc_btn_check_material;
    {class} property abc_btn_check_to_on_mtrl_000: Integer read _Getabc_btn_check_to_on_mtrl_000;
    {class} property abc_btn_check_to_on_mtrl_015: Integer read _Getabc_btn_check_to_on_mtrl_015;
    {class} property abc_btn_colored_material: Integer read _Getabc_btn_colored_material;
    {class} property abc_btn_default_mtrl_shape: Integer read _Getabc_btn_default_mtrl_shape;
    {class} property abc_btn_radio_material: Integer read _Getabc_btn_radio_material;
    {class} property abc_btn_radio_to_on_mtrl_000: Integer read _Getabc_btn_radio_to_on_mtrl_000;
    {class} property abc_btn_radio_to_on_mtrl_015: Integer read _Getabc_btn_radio_to_on_mtrl_015;
    {class} property abc_btn_switch_to_on_mtrl_00001: Integer read _Getabc_btn_switch_to_on_mtrl_00001;
    {class} property abc_btn_switch_to_on_mtrl_00012: Integer read _Getabc_btn_switch_to_on_mtrl_00012;
    {class} property abc_cab_background_internal_bg: Integer read _Getabc_cab_background_internal_bg;
    {class} property abc_cab_background_top_material: Integer read _Getabc_cab_background_top_material;
    {class} property abc_cab_background_top_mtrl_alpha: Integer read _Getabc_cab_background_top_mtrl_alpha;
    {class} property abc_control_background_material: Integer read _Getabc_control_background_material;
    {class} property abc_dialog_material_background: Integer read _Getabc_dialog_material_background;
    {class} property abc_edit_text_material: Integer read _Getabc_edit_text_material;
    {class} property abc_ic_ab_back_material: Integer read _Getabc_ic_ab_back_material;
    {class} property abc_ic_arrow_drop_right_black_24dp: Integer read _Getabc_ic_arrow_drop_right_black_24dp;
    {class} property abc_ic_clear_material: Integer read _Getabc_ic_clear_material;
    {class} property abc_ic_commit_search_api_mtrl_alpha: Integer read _Getabc_ic_commit_search_api_mtrl_alpha;
    {class} property abc_ic_go_search_api_material: Integer read _Getabc_ic_go_search_api_material;
    {class} property abc_ic_menu_copy_mtrl_am_alpha: Integer read _Getabc_ic_menu_copy_mtrl_am_alpha;
    {class} property abc_ic_menu_cut_mtrl_alpha: Integer read _Getabc_ic_menu_cut_mtrl_alpha;
    {class} property abc_ic_menu_overflow_material: Integer read _Getabc_ic_menu_overflow_material;
    {class} property abc_ic_menu_paste_mtrl_am_alpha: Integer read _Getabc_ic_menu_paste_mtrl_am_alpha;
    {class} property abc_ic_menu_selectall_mtrl_alpha: Integer read _Getabc_ic_menu_selectall_mtrl_alpha;
    {class} property abc_ic_menu_share_mtrl_alpha: Integer read _Getabc_ic_menu_share_mtrl_alpha;
    {class} property abc_ic_search_api_material: Integer read _Getabc_ic_search_api_material;
    {class} property abc_ic_star_black_16dp: Integer read _Getabc_ic_star_black_16dp;
    {class} property abc_ic_star_black_36dp: Integer read _Getabc_ic_star_black_36dp;
    {class} property abc_ic_star_black_48dp: Integer read _Getabc_ic_star_black_48dp;
    {class} property abc_ic_star_half_black_16dp: Integer read _Getabc_ic_star_half_black_16dp;
    {class} property abc_ic_star_half_black_36dp: Integer read _Getabc_ic_star_half_black_36dp;
    {class} property abc_ic_star_half_black_48dp: Integer read _Getabc_ic_star_half_black_48dp;
    {class} property abc_ic_voice_search_api_material: Integer read _Getabc_ic_voice_search_api_material;
    {class} property abc_item_background_holo_dark: Integer read _Getabc_item_background_holo_dark;
    {class} property abc_item_background_holo_light: Integer read _Getabc_item_background_holo_light;
    {class} property abc_list_divider_material: Integer read _Getabc_list_divider_material;
    {class} property abc_list_divider_mtrl_alpha: Integer read _Getabc_list_divider_mtrl_alpha;
    {class} property abc_list_focused_holo: Integer read _Getabc_list_focused_holo;
    {class} property abc_list_longpressed_holo: Integer read _Getabc_list_longpressed_holo;
    {class} property abc_list_pressed_holo_dark: Integer read _Getabc_list_pressed_holo_dark;
    {class} property abc_list_pressed_holo_light: Integer read _Getabc_list_pressed_holo_light;
    {class} property abc_list_selector_background_transition_holo_dark: Integer read _Getabc_list_selector_background_transition_holo_dark;
    {class} property abc_list_selector_background_transition_holo_light: Integer read _Getabc_list_selector_background_transition_holo_light;
    {class} property abc_list_selector_disabled_holo_dark: Integer read _Getabc_list_selector_disabled_holo_dark;
    {class} property abc_list_selector_disabled_holo_light: Integer read _Getabc_list_selector_disabled_holo_light;
    {class} property abc_list_selector_holo_dark: Integer read _Getabc_list_selector_holo_dark;
    {class} property abc_list_selector_holo_light: Integer read _Getabc_list_selector_holo_light;
    {class} property abc_menu_hardkey_panel_mtrl_mult: Integer read _Getabc_menu_hardkey_panel_mtrl_mult;
    {class} property abc_popup_background_mtrl_mult: Integer read _Getabc_popup_background_mtrl_mult;
    {class} property abc_ratingbar_indicator_material: Integer read _Getabc_ratingbar_indicator_material;
    {class} property abc_ratingbar_material: Integer read _Getabc_ratingbar_material;
    {class} property abc_ratingbar_small_material: Integer read _Getabc_ratingbar_small_material;
    {class} property abc_scrubber_control_off_mtrl_alpha: Integer read _Getabc_scrubber_control_off_mtrl_alpha;
    {class} property abc_scrubber_control_to_pressed_mtrl_000: Integer read _Getabc_scrubber_control_to_pressed_mtrl_000;
    {class} property abc_scrubber_control_to_pressed_mtrl_005: Integer read _Getabc_scrubber_control_to_pressed_mtrl_005;
    {class} property abc_scrubber_primary_mtrl_alpha: Integer read _Getabc_scrubber_primary_mtrl_alpha;
    {class} property abc_scrubber_track_mtrl_alpha: Integer read _Getabc_scrubber_track_mtrl_alpha;
    {class} property abc_seekbar_thumb_material: Integer read _Getabc_seekbar_thumb_material;
    {class} property abc_seekbar_tick_mark_material: Integer read _Getabc_seekbar_tick_mark_material;
    {class} property abc_seekbar_track_material: Integer read _Getabc_seekbar_track_material;
    {class} property abc_spinner_mtrl_am_alpha: Integer read _Getabc_spinner_mtrl_am_alpha;
    {class} property abc_spinner_textfield_background_material: Integer read _Getabc_spinner_textfield_background_material;
    {class} property abc_switch_thumb_material: Integer read _Getabc_switch_thumb_material;
    {class} property abc_switch_track_mtrl_alpha: Integer read _Getabc_switch_track_mtrl_alpha;
    {class} property abc_tab_indicator_material: Integer read _Getabc_tab_indicator_material;
    {class} property abc_tab_indicator_mtrl_alpha: Integer read _Getabc_tab_indicator_mtrl_alpha;
    {class} property abc_text_cursor_material: Integer read _Getabc_text_cursor_material;
    {class} property abc_text_select_handle_left_mtrl_dark: Integer read _Getabc_text_select_handle_left_mtrl_dark;
    {class} property abc_text_select_handle_left_mtrl_light: Integer read _Getabc_text_select_handle_left_mtrl_light;
    {class} property abc_text_select_handle_middle_mtrl_dark: Integer read _Getabc_text_select_handle_middle_mtrl_dark;
    {class} property abc_text_select_handle_middle_mtrl_light: Integer read _Getabc_text_select_handle_middle_mtrl_light;
    {class} property abc_text_select_handle_right_mtrl_dark: Integer read _Getabc_text_select_handle_right_mtrl_dark;
    {class} property abc_text_select_handle_right_mtrl_light: Integer read _Getabc_text_select_handle_right_mtrl_light;
    {class} property abc_textfield_activated_mtrl_alpha: Integer read _Getabc_textfield_activated_mtrl_alpha;
    {class} property abc_textfield_default_mtrl_alpha: Integer read _Getabc_textfield_default_mtrl_alpha;
    {class} property abc_textfield_search_activated_mtrl_alpha: Integer read _Getabc_textfield_search_activated_mtrl_alpha;
    {class} property abc_textfield_search_default_mtrl_alpha: Integer read _Getabc_textfield_search_default_mtrl_alpha;
    {class} property abc_textfield_search_material: Integer read _Getabc_textfield_search_material;
    {class} property abc_vector_test: Integer read _Getabc_vector_test;
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
    {class} property tooltip_frame_dark: Integer read _Gettooltip_frame_dark;
    {class} property tooltip_frame_light: Integer read _Gettooltip_frame_light;
  end;

  [JavaSignature('android/support/v7/appcompat/R$drawable')]
  JR_drawable_050 = interface(JObject)
  ['{734E778E-76D1-40AC-83D6-DD49CC1AC0E3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_050 = class(TJavaGenericImport<JR_drawable_050Class, JR_drawable_050>) end;

  JR_id_051Class = interface(JObjectClass)
  ['{C29CAF52-7634-4B7E-B159-4104F44C40DF}']
    { static Property Methods }
    {class} function _Getaction_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_activity_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_root: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_context_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_menu_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_menu_presenter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_bar_stub: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_close_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_chooser_view_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getadd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcheckbox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcontent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcustom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcustomPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdecor_content_parent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdefault_activity_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getedit_query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getexpand_activities_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getexpanded_menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getgroup_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethome: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getimage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getleft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlist_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmessage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmultiply: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetparentPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprogress_circular: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprogress_horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getradio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getscreen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollIndicatorDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollIndicatorUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_badge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_close_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_edit_frame: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_go_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_mag_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_plate: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_src_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_voice_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_listview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getshortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getspacer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsplit_action_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_atop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_in: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_over: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubmenuarrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubmit_area: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettabMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextSpacerNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextSpacerNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleDividerNoCustom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle_template: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettopPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getuniform: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getup: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getwrap_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_051; cdecl;

    { static Property }
    {class} property action_bar: Integer read _Getaction_bar;
    {class} property action_bar_activity_content: Integer read _Getaction_bar_activity_content;
    {class} property action_bar_container: Integer read _Getaction_bar_container;
    {class} property action_bar_root: Integer read _Getaction_bar_root;
    {class} property action_bar_spinner: Integer read _Getaction_bar_spinner;
    {class} property action_bar_subtitle: Integer read _Getaction_bar_subtitle;
    {class} property action_bar_title: Integer read _Getaction_bar_title;
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_context_bar: Integer read _Getaction_context_bar;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_menu_divider: Integer read _Getaction_menu_divider;
    {class} property action_menu_presenter: Integer read _Getaction_menu_presenter;
    {class} property action_mode_bar: Integer read _Getaction_mode_bar;
    {class} property action_mode_bar_stub: Integer read _Getaction_mode_bar_stub;
    {class} property action_mode_close_button: Integer read _Getaction_mode_close_button;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property activity_chooser_view_content: Integer read _Getactivity_chooser_view_content;
    {class} property add: Integer read _Getadd;
    {class} property alertTitle: Integer read _GetalertTitle;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property bottom: Integer read _Getbottom;
    {class} property buttonPanel: Integer read _GetbuttonPanel;
    {class} property checkbox: Integer read _Getcheckbox;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property content: Integer read _Getcontent;
    {class} property contentPanel: Integer read _GetcontentPanel;
    {class} property custom: Integer read _Getcustom;
    {class} property customPanel: Integer read _GetcustomPanel;
    {class} property decor_content_parent: Integer read _Getdecor_content_parent;
    {class} property default_activity_button: Integer read _Getdefault_activity_button;
    {class} property edit_query: Integer read _Getedit_query;
    {class} property &end: Integer read _Getend;
    {class} property expand_activities_button: Integer read _Getexpand_activities_button;
    {class} property expanded_menu: Integer read _Getexpanded_menu;
    {class} property forever: Integer read _Getforever;
    {class} property group_divider: Integer read _Getgroup_divider;
    {class} property home: Integer read _Gethome;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property image: Integer read _Getimage;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property left: Integer read _Getleft;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property listMode: Integer read _GetlistMode;
    {class} property list_item: Integer read _Getlist_item;
    {class} property &message: Integer read _Getmessage;
    {class} property multiply: Integer read _Getmultiply;
    {class} property none: Integer read _Getnone;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property parentPanel: Integer read _GetparentPanel;
    {class} property progress_circular: Integer read _Getprogress_circular;
    {class} property progress_horizontal: Integer read _Getprogress_horizontal;
    {class} property radio: Integer read _Getradio;
    {class} property right: Integer read _Getright;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property screen: Integer read _Getscreen;
    {class} property scrollIndicatorDown: Integer read _GetscrollIndicatorDown;
    {class} property scrollIndicatorUp: Integer read _GetscrollIndicatorUp;
    {class} property scrollView: Integer read _GetscrollView;
    {class} property search_badge: Integer read _Getsearch_badge;
    {class} property search_bar: Integer read _Getsearch_bar;
    {class} property search_button: Integer read _Getsearch_button;
    {class} property search_close_btn: Integer read _Getsearch_close_btn;
    {class} property search_edit_frame: Integer read _Getsearch_edit_frame;
    {class} property search_go_btn: Integer read _Getsearch_go_btn;
    {class} property search_mag_icon: Integer read _Getsearch_mag_icon;
    {class} property search_plate: Integer read _Getsearch_plate;
    {class} property search_src_text: Integer read _Getsearch_src_text;
    {class} property search_voice_btn: Integer read _Getsearch_voice_btn;
    {class} property select_dialog_listview: Integer read _Getselect_dialog_listview;
    {class} property shortcut: Integer read _Getshortcut;
    {class} property spacer: Integer read _Getspacer;
    {class} property split_action_bar: Integer read _Getsplit_action_bar;
    {class} property src_atop: Integer read _Getsrc_atop;
    {class} property src_in: Integer read _Getsrc_in;
    {class} property src_over: Integer read _Getsrc_over;
    {class} property start: Integer read _Getstart;
    {class} property submenuarrow: Integer read _Getsubmenuarrow;
    {class} property submit_area: Integer read _Getsubmit_area;
    {class} property tabMode: Integer read _GettabMode;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property textSpacerNoButtons: Integer read _GettextSpacerNoButtons;
    {class} property textSpacerNoTitle: Integer read _GettextSpacerNoTitle;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
    {class} property titleDividerNoCustom: Integer read _GettitleDividerNoCustom;
    {class} property title_template: Integer read _Gettitle_template;
    {class} property top: Integer read _Gettop;
    {class} property topPanel: Integer read _GettopPanel;
    {class} property uniform: Integer read _Getuniform;
    {class} property up: Integer read _Getup;
    {class} property wrap_content: Integer read _Getwrap_content;
  end;

  [JavaSignature('android/support/v7/appcompat/R$id')]
  JR_id_051 = interface(JObject)
  ['{F4E47264-C9C3-4DAF-B451-A2F76E0E3191}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_051 = class(TJavaGenericImport<JR_id_051Class, JR_id_051>) end;

  JR_integer_052Class = interface(JObjectClass)
  ['{BE472643-1203-4A2C-8842-1984E69C5FCE}']
    { static Property Methods }
    {class} function _Getabc_config_activityDefaultDur: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_activityShortDur: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcancel_button_image_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getconfig_tooltipAnimTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer_052; cdecl;

    { static Property }
    {class} property abc_config_activityDefaultDur: Integer read _Getabc_config_activityDefaultDur;
    {class} property abc_config_activityShortDur: Integer read _Getabc_config_activityShortDur;
    {class} property cancel_button_image_alpha: Integer read _Getcancel_button_image_alpha;
    {class} property config_tooltipAnimTime: Integer read _Getconfig_tooltipAnimTime;
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('android/support/v7/appcompat/R$integer')]
  JR_integer_052 = interface(JObject)
  ['{91F7AD68-216C-4EF0-8C27-B3432FA8904B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_052 = class(TJavaGenericImport<JR_integer_052Class, JR_integer_052>) end;

  JR_layout_053Class = interface(JObjectClass)
  ['{918CA9BD-9746-4337-B0C4-C04216CABEFE}']
    { static Property Methods }
    {class} function _Getabc_action_bar_title_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_up_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_close_item_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view_list_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_bar_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cascading_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_expanded_menu_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_checkbox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_radio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_menu_header_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_content_include: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_simple: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_simple_overlay_action_mode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_dropdown_item_icons_2line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_select_dialog_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_item_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_multichoice_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_singlechoice_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsupport_simple_spinner_dropdown_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_053; cdecl;

    { static Property }
    {class} property abc_action_bar_title_item: Integer read _Getabc_action_bar_title_item;
    {class} property abc_action_bar_up_container: Integer read _Getabc_action_bar_up_container;
    {class} property abc_action_menu_item_layout: Integer read _Getabc_action_menu_item_layout;
    {class} property abc_action_menu_layout: Integer read _Getabc_action_menu_layout;
    {class} property abc_action_mode_bar: Integer read _Getabc_action_mode_bar;
    {class} property abc_action_mode_close_item_material: Integer read _Getabc_action_mode_close_item_material;
    {class} property abc_activity_chooser_view: Integer read _Getabc_activity_chooser_view;
    {class} property abc_activity_chooser_view_list_item: Integer read _Getabc_activity_chooser_view_list_item;
    {class} property abc_alert_dialog_button_bar_material: Integer read _Getabc_alert_dialog_button_bar_material;
    {class} property abc_alert_dialog_material: Integer read _Getabc_alert_dialog_material;
    {class} property abc_alert_dialog_title_material: Integer read _Getabc_alert_dialog_title_material;
    {class} property abc_cascading_menu_item_layout: Integer read _Getabc_cascading_menu_item_layout;
    {class} property abc_dialog_title_material: Integer read _Getabc_dialog_title_material;
    {class} property abc_expanded_menu_layout: Integer read _Getabc_expanded_menu_layout;
    {class} property abc_list_menu_item_checkbox: Integer read _Getabc_list_menu_item_checkbox;
    {class} property abc_list_menu_item_icon: Integer read _Getabc_list_menu_item_icon;
    {class} property abc_list_menu_item_layout: Integer read _Getabc_list_menu_item_layout;
    {class} property abc_list_menu_item_radio: Integer read _Getabc_list_menu_item_radio;
    {class} property abc_popup_menu_header_item_layout: Integer read _Getabc_popup_menu_header_item_layout;
    {class} property abc_popup_menu_item_layout: Integer read _Getabc_popup_menu_item_layout;
    {class} property abc_screen_content_include: Integer read _Getabc_screen_content_include;
    {class} property abc_screen_simple: Integer read _Getabc_screen_simple;
    {class} property abc_screen_simple_overlay_action_mode: Integer read _Getabc_screen_simple_overlay_action_mode;
    {class} property abc_screen_toolbar: Integer read _Getabc_screen_toolbar;
    {class} property abc_search_dropdown_item_icons_2line: Integer read _Getabc_search_dropdown_item_icons_2line;
    {class} property abc_search_view: Integer read _Getabc_search_view;
    {class} property abc_select_dialog_material: Integer read _Getabc_select_dialog_material;
    {class} property abc_tooltip: Integer read _Getabc_tooltip;
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
    {class} property select_dialog_item_material: Integer read _Getselect_dialog_item_material;
    {class} property select_dialog_multichoice_material: Integer read _Getselect_dialog_multichoice_material;
    {class} property select_dialog_singlechoice_material: Integer read _Getselect_dialog_singlechoice_material;
    {class} property support_simple_spinner_dropdown_item: Integer read _Getsupport_simple_spinner_dropdown_item;
  end;

  [JavaSignature('android/support/v7/appcompat/R$layout')]
  JR_layout_053 = interface(JObject)
  ['{1A18F99D-8790-49BD-AEEB-D89A37E27F1B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_053 = class(TJavaGenericImport<JR_layout_053Class, JR_layout_053>) end;

  JR_mipmap_054Class = interface(JObjectClass)
  ['{09433955-B7EF-4CC9-BF04-84BB8D8E6845}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_mipmap_054; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/appcompat/R$mipmap')]
  JR_mipmap_054 = interface(JObject)
  ['{7B5892B9-22F2-450A-8919-B46DD8E8DF73}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_054 = class(TJavaGenericImport<JR_mipmap_054Class, JR_mipmap_054>) end;

  JR_string_055Class = interface(JObjectClass)
  ['{D60B8356-6274-4DCF-8512-623BEC131BFA}']
    { static Property Methods }
    {class} function _Getabc_action_bar_home_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_up_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_overflow_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_done: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view_see_all: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activitychooserview_choose_application: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_capital_off: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_capital_on: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_body_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_body_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_button_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_caption_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_3_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_4_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_headline_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_menu_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_subhead_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_alt_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_ctrl_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_delete_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_enter_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_function_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_meta_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_shift_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_space_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_sym_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_prepend_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_hint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_clear: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_search: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_submit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_voice: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shareactionprovider_share_with: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shareactionprovider_share_with_application: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_toolbar_collapse_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_menu_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string_055; cdecl;

    { static Property }
    {class} property abc_action_bar_home_description: Integer read _Getabc_action_bar_home_description;
    {class} property abc_action_bar_up_description: Integer read _Getabc_action_bar_up_description;
    {class} property abc_action_menu_overflow_description: Integer read _Getabc_action_menu_overflow_description;
    {class} property abc_action_mode_done: Integer read _Getabc_action_mode_done;
    {class} property abc_activity_chooser_view_see_all: Integer read _Getabc_activity_chooser_view_see_all;
    {class} property abc_activitychooserview_choose_application: Integer read _Getabc_activitychooserview_choose_application;
    {class} property abc_capital_off: Integer read _Getabc_capital_off;
    {class} property abc_capital_on: Integer read _Getabc_capital_on;
    {class} property abc_font_family_body_1_material: Integer read _Getabc_font_family_body_1_material;
    {class} property abc_font_family_body_2_material: Integer read _Getabc_font_family_body_2_material;
    {class} property abc_font_family_button_material: Integer read _Getabc_font_family_button_material;
    {class} property abc_font_family_caption_material: Integer read _Getabc_font_family_caption_material;
    {class} property abc_font_family_display_1_material: Integer read _Getabc_font_family_display_1_material;
    {class} property abc_font_family_display_2_material: Integer read _Getabc_font_family_display_2_material;
    {class} property abc_font_family_display_3_material: Integer read _Getabc_font_family_display_3_material;
    {class} property abc_font_family_display_4_material: Integer read _Getabc_font_family_display_4_material;
    {class} property abc_font_family_headline_material: Integer read _Getabc_font_family_headline_material;
    {class} property abc_font_family_menu_material: Integer read _Getabc_font_family_menu_material;
    {class} property abc_font_family_subhead_material: Integer read _Getabc_font_family_subhead_material;
    {class} property abc_font_family_title_material: Integer read _Getabc_font_family_title_material;
    {class} property abc_menu_alt_shortcut_label: Integer read _Getabc_menu_alt_shortcut_label;
    {class} property abc_menu_ctrl_shortcut_label: Integer read _Getabc_menu_ctrl_shortcut_label;
    {class} property abc_menu_delete_shortcut_label: Integer read _Getabc_menu_delete_shortcut_label;
    {class} property abc_menu_enter_shortcut_label: Integer read _Getabc_menu_enter_shortcut_label;
    {class} property abc_menu_function_shortcut_label: Integer read _Getabc_menu_function_shortcut_label;
    {class} property abc_menu_meta_shortcut_label: Integer read _Getabc_menu_meta_shortcut_label;
    {class} property abc_menu_shift_shortcut_label: Integer read _Getabc_menu_shift_shortcut_label;
    {class} property abc_menu_space_shortcut_label: Integer read _Getabc_menu_space_shortcut_label;
    {class} property abc_menu_sym_shortcut_label: Integer read _Getabc_menu_sym_shortcut_label;
    {class} property abc_prepend_shortcut_label: Integer read _Getabc_prepend_shortcut_label;
    {class} property abc_search_hint: Integer read _Getabc_search_hint;
    {class} property abc_searchview_description_clear: Integer read _Getabc_searchview_description_clear;
    {class} property abc_searchview_description_query: Integer read _Getabc_searchview_description_query;
    {class} property abc_searchview_description_search: Integer read _Getabc_searchview_description_search;
    {class} property abc_searchview_description_submit: Integer read _Getabc_searchview_description_submit;
    {class} property abc_searchview_description_voice: Integer read _Getabc_searchview_description_voice;
    {class} property abc_shareactionprovider_share_with: Integer read _Getabc_shareactionprovider_share_with;
    {class} property abc_shareactionprovider_share_with_application: Integer read _Getabc_shareactionprovider_share_with_application;
    {class} property abc_toolbar_collapse_description: Integer read _Getabc_toolbar_collapse_description;
    {class} property search_menu_title: Integer read _Getsearch_menu_title;
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('android/support/v7/appcompat/R$string')]
  JR_string_055 = interface(JObject)
  ['{4118B016-6CD3-48F2-959A-BDB0638DB2E5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_055 = class(TJavaGenericImport<JR_string_055Class, JR_string_055>) end;

  JR_style_056Class = interface(JObjectClass)
  ['{AB581F56-E6DB-4161-A96E-80B88EAF3350}']
    { static Property Methods }
    {class} function _GetAlertDialog_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_DropDownUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_AlertDialog_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_AlertDialog_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_DropDownUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_DialogWindowTitle_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_DialogWindowTitleBackground_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Body1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Body2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Caption: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Headline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Large_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Medium: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Medium_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Small_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Subhead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Subhead_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_DropDownItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_CompactMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_FixedSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_FixedSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dark_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V22_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V22_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V23_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V23_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V28_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V28_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Borderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ButtonBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_CheckBox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_RadioButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DrawerArrowToggle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DrawerArrowToggle_Common: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ImageButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListMenuView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ProgressBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ProgressBar_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar_Indicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SearchView_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SeekBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SeekBar_Discrete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Spinner_Underlined: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Toolbar_Button_Navigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V21_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V21_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V25_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V25_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_Widget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_DialogWindowTitle_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_ActionBar_TitleItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_DialogTitle_Icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_SearchView_MagIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlUnderlay_Widget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlUnderlay_Widget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Body1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Body2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Caption: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Headline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Large_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Medium: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Medium_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Small_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Subhead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Subhead_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_DropDownItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Header: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_Toolbar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_CompactMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dark_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Borderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ButtonBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_CheckBox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_RadioButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_DrawerArrowToggle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ImageButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_Solid_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabBar_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabText_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabView_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionMode_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_Spinner_DropDown_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListMenuView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ProgressBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ProgressBar_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar_Indicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SearchView_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SeekBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SeekBar_Discrete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_DropDown_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_Underlined: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Toolbar_Button_Navigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Support_CoordinatorLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_056; cdecl;

    { static Property }
    {class} property AlertDialog_AppCompat: Integer read _GetAlertDialog_AppCompat;
    {class} property AlertDialog_AppCompat_Light: Integer read _GetAlertDialog_AppCompat_Light;
    {class} property Animation_AppCompat_Dialog: Integer read _GetAnimation_AppCompat_Dialog;
    {class} property Animation_AppCompat_DropDownUp: Integer read _GetAnimation_AppCompat_DropDownUp;
    {class} property Animation_AppCompat_Tooltip: Integer read _GetAnimation_AppCompat_Tooltip;
    {class} property Base_AlertDialog_AppCompat: Integer read _GetBase_AlertDialog_AppCompat;
    {class} property Base_AlertDialog_AppCompat_Light: Integer read _GetBase_AlertDialog_AppCompat_Light;
    {class} property Base_Animation_AppCompat_Dialog: Integer read _GetBase_Animation_AppCompat_Dialog;
    {class} property Base_Animation_AppCompat_DropDownUp: Integer read _GetBase_Animation_AppCompat_DropDownUp;
    {class} property Base_Animation_AppCompat_Tooltip: Integer read _GetBase_Animation_AppCompat_Tooltip;
    {class} property Base_DialogWindowTitle_AppCompat: Integer read _GetBase_DialogWindowTitle_AppCompat;
    {class} property Base_DialogWindowTitleBackground_AppCompat: Integer read _GetBase_DialogWindowTitleBackground_AppCompat;
    {class} property Base_TextAppearance_AppCompat: Integer read _GetBase_TextAppearance_AppCompat;
    {class} property Base_TextAppearance_AppCompat_Body1: Integer read _GetBase_TextAppearance_AppCompat_Body1;
    {class} property Base_TextAppearance_AppCompat_Body2: Integer read _GetBase_TextAppearance_AppCompat_Body2;
    {class} property Base_TextAppearance_AppCompat_Button: Integer read _GetBase_TextAppearance_AppCompat_Button;
    {class} property Base_TextAppearance_AppCompat_Caption: Integer read _GetBase_TextAppearance_AppCompat_Caption;
    {class} property Base_TextAppearance_AppCompat_Display1: Integer read _GetBase_TextAppearance_AppCompat_Display1;
    {class} property Base_TextAppearance_AppCompat_Display2: Integer read _GetBase_TextAppearance_AppCompat_Display2;
    {class} property Base_TextAppearance_AppCompat_Display3: Integer read _GetBase_TextAppearance_AppCompat_Display3;
    {class} property Base_TextAppearance_AppCompat_Display4: Integer read _GetBase_TextAppearance_AppCompat_Display4;
    {class} property Base_TextAppearance_AppCompat_Headline: Integer read _GetBase_TextAppearance_AppCompat_Headline;
    {class} property Base_TextAppearance_AppCompat_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Inverse;
    {class} property Base_TextAppearance_AppCompat_Large: Integer read _GetBase_TextAppearance_AppCompat_Large;
    {class} property Base_TextAppearance_AppCompat_Large_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Large_Inverse;
    {class} property Base_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer read _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large;
    {class} property Base_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer read _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small;
    {class} property Base_TextAppearance_AppCompat_Medium: Integer read _GetBase_TextAppearance_AppCompat_Medium;
    {class} property Base_TextAppearance_AppCompat_Medium_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Medium_Inverse;
    {class} property Base_TextAppearance_AppCompat_Menu: Integer read _GetBase_TextAppearance_AppCompat_Menu;
    {class} property Base_TextAppearance_AppCompat_SearchResult: Integer read _GetBase_TextAppearance_AppCompat_SearchResult;
    {class} property Base_TextAppearance_AppCompat_SearchResult_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_SearchResult_Subtitle;
    {class} property Base_TextAppearance_AppCompat_SearchResult_Title: Integer read _GetBase_TextAppearance_AppCompat_SearchResult_Title;
    {class} property Base_TextAppearance_AppCompat_Small: Integer read _GetBase_TextAppearance_AppCompat_Small;
    {class} property Base_TextAppearance_AppCompat_Small_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Small_Inverse;
    {class} property Base_TextAppearance_AppCompat_Subhead: Integer read _GetBase_TextAppearance_AppCompat_Subhead;
    {class} property Base_TextAppearance_AppCompat_Subhead_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Subhead_Inverse;
    {class} property Base_TextAppearance_AppCompat_Title: Integer read _GetBase_TextAppearance_AppCompat_Title;
    {class} property Base_TextAppearance_AppCompat_Title_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Title_Inverse;
    {class} property Base_TextAppearance_AppCompat_Tooltip: Integer read _GetBase_TextAppearance_AppCompat_Tooltip;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Menu;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Title: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Subtitle;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionMode_Title: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Title;
    {class} property Base_TextAppearance_AppCompat_Widget_Button: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Borderless_Colored;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Colored: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Colored;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_DropDownItem: Integer read _GetBase_TextAppearance_AppCompat_Widget_DropDownItem;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Header;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Large;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Small;
    {class} property Base_TextAppearance_AppCompat_Widget_Switch: Integer read _GetBase_TextAppearance_AppCompat_Widget_Switch;
    {class} property Base_TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer read _GetBase_TextAppearance_AppCompat_Widget_TextView_SpinnerItem;
    {class} property Base_TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer read _GetBase_TextAppearance_Widget_AppCompat_ExpandedMenu_Item;
    {class} property Base_TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer read _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Subtitle;
    {class} property Base_TextAppearance_Widget_AppCompat_Toolbar_Title: Integer read _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Title;
    {class} property Base_Theme_AppCompat: Integer read _GetBase_Theme_AppCompat;
    {class} property Base_Theme_AppCompat_CompactMenu: Integer read _GetBase_Theme_AppCompat_CompactMenu;
    {class} property Base_Theme_AppCompat_Dialog: Integer read _GetBase_Theme_AppCompat_Dialog;
    {class} property Base_Theme_AppCompat_Dialog_Alert: Integer read _GetBase_Theme_AppCompat_Dialog_Alert;
    {class} property Base_Theme_AppCompat_Dialog_FixedSize: Integer read _GetBase_Theme_AppCompat_Dialog_FixedSize;
    {class} property Base_Theme_AppCompat_Dialog_MinWidth: Integer read _GetBase_Theme_AppCompat_Dialog_MinWidth;
    {class} property Base_Theme_AppCompat_DialogWhenLarge: Integer read _GetBase_Theme_AppCompat_DialogWhenLarge;
    {class} property Base_Theme_AppCompat_Light: Integer read _GetBase_Theme_AppCompat_Light;
    {class} property Base_Theme_AppCompat_Light_DarkActionBar: Integer read _GetBase_Theme_AppCompat_Light_DarkActionBar;
    {class} property Base_Theme_AppCompat_Light_Dialog: Integer read _GetBase_Theme_AppCompat_Light_Dialog;
    {class} property Base_Theme_AppCompat_Light_Dialog_Alert: Integer read _GetBase_Theme_AppCompat_Light_Dialog_Alert;
    {class} property Base_Theme_AppCompat_Light_Dialog_FixedSize: Integer read _GetBase_Theme_AppCompat_Light_Dialog_FixedSize;
    {class} property Base_Theme_AppCompat_Light_Dialog_MinWidth: Integer read _GetBase_Theme_AppCompat_Light_Dialog_MinWidth;
    {class} property Base_Theme_AppCompat_Light_DialogWhenLarge: Integer read _GetBase_Theme_AppCompat_Light_DialogWhenLarge;
    {class} property Base_ThemeOverlay_AppCompat: Integer read _GetBase_ThemeOverlay_AppCompat;
    {class} property Base_ThemeOverlay_AppCompat_ActionBar: Integer read _GetBase_ThemeOverlay_AppCompat_ActionBar;
    {class} property Base_ThemeOverlay_AppCompat_Dark: Integer read _GetBase_ThemeOverlay_AppCompat_Dark;
    {class} property Base_ThemeOverlay_AppCompat_Dark_ActionBar: Integer read _GetBase_ThemeOverlay_AppCompat_Dark_ActionBar;
    {class} property Base_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_ThemeOverlay_AppCompat_Dialog_Alert: Integer read _GetBase_ThemeOverlay_AppCompat_Dialog_Alert;
    {class} property Base_ThemeOverlay_AppCompat_Light: Integer read _GetBase_ThemeOverlay_AppCompat_Light;
    {class} property Base_V21_Theme_AppCompat: Integer read _GetBase_V21_Theme_AppCompat;
    {class} property Base_V21_Theme_AppCompat_Dialog: Integer read _GetBase_V21_Theme_AppCompat_Dialog;
    {class} property Base_V21_Theme_AppCompat_Light: Integer read _GetBase_V21_Theme_AppCompat_Light;
    {class} property Base_V21_Theme_AppCompat_Light_Dialog: Integer read _GetBase_V21_Theme_AppCompat_Light_Dialog;
    {class} property Base_V21_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_V21_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_V22_Theme_AppCompat: Integer read _GetBase_V22_Theme_AppCompat;
    {class} property Base_V22_Theme_AppCompat_Light: Integer read _GetBase_V22_Theme_AppCompat_Light;
    {class} property Base_V23_Theme_AppCompat: Integer read _GetBase_V23_Theme_AppCompat;
    {class} property Base_V23_Theme_AppCompat_Light: Integer read _GetBase_V23_Theme_AppCompat_Light;
    {class} property Base_V26_Theme_AppCompat: Integer read _GetBase_V26_Theme_AppCompat;
    {class} property Base_V26_Theme_AppCompat_Light: Integer read _GetBase_V26_Theme_AppCompat_Light;
    {class} property Base_V26_Widget_AppCompat_Toolbar: Integer read _GetBase_V26_Widget_AppCompat_Toolbar;
    {class} property Base_V28_Theme_AppCompat: Integer read _GetBase_V28_Theme_AppCompat;
    {class} property Base_V28_Theme_AppCompat_Light: Integer read _GetBase_V28_Theme_AppCompat_Light;
    {class} property Base_V7_Theme_AppCompat: Integer read _GetBase_V7_Theme_AppCompat;
    {class} property Base_V7_Theme_AppCompat_Dialog: Integer read _GetBase_V7_Theme_AppCompat_Dialog;
    {class} property Base_V7_Theme_AppCompat_Light: Integer read _GetBase_V7_Theme_AppCompat_Light;
    {class} property Base_V7_Theme_AppCompat_Light_Dialog: Integer read _GetBase_V7_Theme_AppCompat_Light_Dialog;
    {class} property Base_V7_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_V7_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_V7_Widget_AppCompat_AutoCompleteTextView: Integer read _GetBase_V7_Widget_AppCompat_AutoCompleteTextView;
    {class} property Base_V7_Widget_AppCompat_EditText: Integer read _GetBase_V7_Widget_AppCompat_EditText;
    {class} property Base_V7_Widget_AppCompat_Toolbar: Integer read _GetBase_V7_Widget_AppCompat_Toolbar;
    {class} property Base_Widget_AppCompat_ActionBar: Integer read _GetBase_Widget_AppCompat_ActionBar;
    {class} property Base_Widget_AppCompat_ActionBar_Solid: Integer read _GetBase_Widget_AppCompat_ActionBar_Solid;
    {class} property Base_Widget_AppCompat_ActionBar_TabBar: Integer read _GetBase_Widget_AppCompat_ActionBar_TabBar;
    {class} property Base_Widget_AppCompat_ActionBar_TabText: Integer read _GetBase_Widget_AppCompat_ActionBar_TabText;
    {class} property Base_Widget_AppCompat_ActionBar_TabView: Integer read _GetBase_Widget_AppCompat_ActionBar_TabView;
    {class} property Base_Widget_AppCompat_ActionButton: Integer read _GetBase_Widget_AppCompat_ActionButton;
    {class} property Base_Widget_AppCompat_ActionButton_CloseMode: Integer read _GetBase_Widget_AppCompat_ActionButton_CloseMode;
    {class} property Base_Widget_AppCompat_ActionButton_Overflow: Integer read _GetBase_Widget_AppCompat_ActionButton_Overflow;
    {class} property Base_Widget_AppCompat_ActionMode: Integer read _GetBase_Widget_AppCompat_ActionMode;
    {class} property Base_Widget_AppCompat_ActivityChooserView: Integer read _GetBase_Widget_AppCompat_ActivityChooserView;
    {class} property Base_Widget_AppCompat_AutoCompleteTextView: Integer read _GetBase_Widget_AppCompat_AutoCompleteTextView;
    {class} property Base_Widget_AppCompat_Button: Integer read _GetBase_Widget_AppCompat_Button;
    {class} property Base_Widget_AppCompat_Button_Borderless: Integer read _GetBase_Widget_AppCompat_Button_Borderless;
    {class} property Base_Widget_AppCompat_Button_Borderless_Colored: Integer read _GetBase_Widget_AppCompat_Button_Borderless_Colored;
    {class} property Base_Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer read _GetBase_Widget_AppCompat_Button_ButtonBar_AlertDialog;
    {class} property Base_Widget_AppCompat_Button_Colored: Integer read _GetBase_Widget_AppCompat_Button_Colored;
    {class} property Base_Widget_AppCompat_Button_Small: Integer read _GetBase_Widget_AppCompat_Button_Small;
    {class} property Base_Widget_AppCompat_ButtonBar: Integer read _GetBase_Widget_AppCompat_ButtonBar;
    {class} property Base_Widget_AppCompat_ButtonBar_AlertDialog: Integer read _GetBase_Widget_AppCompat_ButtonBar_AlertDialog;
    {class} property Base_Widget_AppCompat_CompoundButton_CheckBox: Integer read _GetBase_Widget_AppCompat_CompoundButton_CheckBox;
    {class} property Base_Widget_AppCompat_CompoundButton_RadioButton: Integer read _GetBase_Widget_AppCompat_CompoundButton_RadioButton;
    {class} property Base_Widget_AppCompat_CompoundButton_Switch: Integer read _GetBase_Widget_AppCompat_CompoundButton_Switch;
    {class} property Base_Widget_AppCompat_DrawerArrowToggle: Integer read _GetBase_Widget_AppCompat_DrawerArrowToggle;
    {class} property Base_Widget_AppCompat_DrawerArrowToggle_Common: Integer read _GetBase_Widget_AppCompat_DrawerArrowToggle_Common;
    {class} property Base_Widget_AppCompat_DropDownItem_Spinner: Integer read _GetBase_Widget_AppCompat_DropDownItem_Spinner;
    {class} property Base_Widget_AppCompat_EditText: Integer read _GetBase_Widget_AppCompat_EditText;
    {class} property Base_Widget_AppCompat_ImageButton: Integer read _GetBase_Widget_AppCompat_ImageButton;
    {class} property Base_Widget_AppCompat_Light_ActionBar: Integer read _GetBase_Widget_AppCompat_Light_ActionBar;
    {class} property Base_Widget_AppCompat_Light_ActionBar_Solid: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_Solid;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabBar: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabBar;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabText: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabText;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabText_Inverse;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabView: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabView;
    {class} property Base_Widget_AppCompat_Light_PopupMenu: Integer read _GetBase_Widget_AppCompat_Light_PopupMenu;
    {class} property Base_Widget_AppCompat_Light_PopupMenu_Overflow: Integer read _GetBase_Widget_AppCompat_Light_PopupMenu_Overflow;
    {class} property Base_Widget_AppCompat_ListMenuView: Integer read _GetBase_Widget_AppCompat_ListMenuView;
    {class} property Base_Widget_AppCompat_ListPopupWindow: Integer read _GetBase_Widget_AppCompat_ListPopupWindow;
    {class} property Base_Widget_AppCompat_ListView: Integer read _GetBase_Widget_AppCompat_ListView;
    {class} property Base_Widget_AppCompat_ListView_DropDown: Integer read _GetBase_Widget_AppCompat_ListView_DropDown;
    {class} property Base_Widget_AppCompat_ListView_Menu: Integer read _GetBase_Widget_AppCompat_ListView_Menu;
    {class} property Base_Widget_AppCompat_PopupMenu: Integer read _GetBase_Widget_AppCompat_PopupMenu;
    {class} property Base_Widget_AppCompat_PopupMenu_Overflow: Integer read _GetBase_Widget_AppCompat_PopupMenu_Overflow;
    {class} property Base_Widget_AppCompat_PopupWindow: Integer read _GetBase_Widget_AppCompat_PopupWindow;
    {class} property Base_Widget_AppCompat_ProgressBar: Integer read _GetBase_Widget_AppCompat_ProgressBar;
    {class} property Base_Widget_AppCompat_ProgressBar_Horizontal: Integer read _GetBase_Widget_AppCompat_ProgressBar_Horizontal;
    {class} property Base_Widget_AppCompat_RatingBar: Integer read _GetBase_Widget_AppCompat_RatingBar;
    {class} property Base_Widget_AppCompat_RatingBar_Indicator: Integer read _GetBase_Widget_AppCompat_RatingBar_Indicator;
    {class} property Base_Widget_AppCompat_RatingBar_Small: Integer read _GetBase_Widget_AppCompat_RatingBar_Small;
    {class} property Base_Widget_AppCompat_SearchView: Integer read _GetBase_Widget_AppCompat_SearchView;
    {class} property Base_Widget_AppCompat_SearchView_ActionBar: Integer read _GetBase_Widget_AppCompat_SearchView_ActionBar;
    {class} property Base_Widget_AppCompat_SeekBar: Integer read _GetBase_Widget_AppCompat_SeekBar;
    {class} property Base_Widget_AppCompat_SeekBar_Discrete: Integer read _GetBase_Widget_AppCompat_SeekBar_Discrete;
    {class} property Base_Widget_AppCompat_Spinner: Integer read _GetBase_Widget_AppCompat_Spinner;
    {class} property Base_Widget_AppCompat_Spinner_Underlined: Integer read _GetBase_Widget_AppCompat_Spinner_Underlined;
    {class} property Base_Widget_AppCompat_TextView_SpinnerItem: Integer read _GetBase_Widget_AppCompat_TextView_SpinnerItem;
    {class} property Base_Widget_AppCompat_Toolbar: Integer read _GetBase_Widget_AppCompat_Toolbar;
    {class} property Base_Widget_AppCompat_Toolbar_Button_Navigation: Integer read _GetBase_Widget_AppCompat_Toolbar_Button_Navigation;
    {class} property Platform_AppCompat: Integer read _GetPlatform_AppCompat;
    {class} property Platform_AppCompat_Light: Integer read _GetPlatform_AppCompat_Light;
    {class} property Platform_ThemeOverlay_AppCompat: Integer read _GetPlatform_ThemeOverlay_AppCompat;
    {class} property Platform_ThemeOverlay_AppCompat_Dark: Integer read _GetPlatform_ThemeOverlay_AppCompat_Dark;
    {class} property Platform_ThemeOverlay_AppCompat_Light: Integer read _GetPlatform_ThemeOverlay_AppCompat_Light;
    {class} property Platform_V21_AppCompat: Integer read _GetPlatform_V21_AppCompat;
    {class} property Platform_V21_AppCompat_Light: Integer read _GetPlatform_V21_AppCompat_Light;
    {class} property Platform_V25_AppCompat: Integer read _GetPlatform_V25_AppCompat;
    {class} property Platform_V25_AppCompat_Light: Integer read _GetPlatform_V25_AppCompat_Light;
    {class} property Platform_Widget_AppCompat_Spinner: Integer read _GetPlatform_Widget_AppCompat_Spinner;
    {class} property RtlOverlay_DialogWindowTitle_AppCompat: Integer read _GetRtlOverlay_DialogWindowTitle_AppCompat;
    {class} property RtlOverlay_Widget_AppCompat_ActionBar_TitleItem: Integer read _GetRtlOverlay_Widget_AppCompat_ActionBar_TitleItem;
    {class} property RtlOverlay_Widget_AppCompat_DialogTitle_Icon: Integer read _GetRtlOverlay_Widget_AppCompat_DialogTitle_Icon;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Text: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Text;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Title: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Title;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Icon1: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon1;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Icon2: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon2;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Query: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Query;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Text: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Text;
    {class} property RtlOverlay_Widget_AppCompat_SearchView_MagIcon: Integer read _GetRtlOverlay_Widget_AppCompat_SearchView_MagIcon;
    {class} property RtlUnderlay_Widget_AppCompat_ActionButton: Integer read _GetRtlUnderlay_Widget_AppCompat_ActionButton;
    {class} property RtlUnderlay_Widget_AppCompat_ActionButton_Overflow: Integer read _GetRtlUnderlay_Widget_AppCompat_ActionButton_Overflow;
    {class} property TextAppearance_AppCompat: Integer read _GetTextAppearance_AppCompat;
    {class} property TextAppearance_AppCompat_Body1: Integer read _GetTextAppearance_AppCompat_Body1;
    {class} property TextAppearance_AppCompat_Body2: Integer read _GetTextAppearance_AppCompat_Body2;
    {class} property TextAppearance_AppCompat_Button: Integer read _GetTextAppearance_AppCompat_Button;
    {class} property TextAppearance_AppCompat_Caption: Integer read _GetTextAppearance_AppCompat_Caption;
    {class} property TextAppearance_AppCompat_Display1: Integer read _GetTextAppearance_AppCompat_Display1;
    {class} property TextAppearance_AppCompat_Display2: Integer read _GetTextAppearance_AppCompat_Display2;
    {class} property TextAppearance_AppCompat_Display3: Integer read _GetTextAppearance_AppCompat_Display3;
    {class} property TextAppearance_AppCompat_Display4: Integer read _GetTextAppearance_AppCompat_Display4;
    {class} property TextAppearance_AppCompat_Headline: Integer read _GetTextAppearance_AppCompat_Headline;
    {class} property TextAppearance_AppCompat_Inverse: Integer read _GetTextAppearance_AppCompat_Inverse;
    {class} property TextAppearance_AppCompat_Large: Integer read _GetTextAppearance_AppCompat_Large;
    {class} property TextAppearance_AppCompat_Large_Inverse: Integer read _GetTextAppearance_AppCompat_Large_Inverse;
    {class} property TextAppearance_AppCompat_Light_SearchResult_Subtitle: Integer read _GetTextAppearance_AppCompat_Light_SearchResult_Subtitle;
    {class} property TextAppearance_AppCompat_Light_SearchResult_Title: Integer read _GetTextAppearance_AppCompat_Light_SearchResult_Title;
    {class} property TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer read _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Large;
    {class} property TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer read _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Small;
    {class} property TextAppearance_AppCompat_Medium: Integer read _GetTextAppearance_AppCompat_Medium;
    {class} property TextAppearance_AppCompat_Medium_Inverse: Integer read _GetTextAppearance_AppCompat_Medium_Inverse;
    {class} property TextAppearance_AppCompat_Menu: Integer read _GetTextAppearance_AppCompat_Menu;
    {class} property TextAppearance_AppCompat_SearchResult_Subtitle: Integer read _GetTextAppearance_AppCompat_SearchResult_Subtitle;
    {class} property TextAppearance_AppCompat_SearchResult_Title: Integer read _GetTextAppearance_AppCompat_SearchResult_Title;
    {class} property TextAppearance_AppCompat_Small: Integer read _GetTextAppearance_AppCompat_Small;
    {class} property TextAppearance_AppCompat_Small_Inverse: Integer read _GetTextAppearance_AppCompat_Small_Inverse;
    {class} property TextAppearance_AppCompat_Subhead: Integer read _GetTextAppearance_AppCompat_Subhead;
    {class} property TextAppearance_AppCompat_Subhead_Inverse: Integer read _GetTextAppearance_AppCompat_Subhead_Inverse;
    {class} property TextAppearance_AppCompat_Title: Integer read _GetTextAppearance_AppCompat_Title;
    {class} property TextAppearance_AppCompat_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Title_Inverse;
    {class} property TextAppearance_AppCompat_Tooltip: Integer read _GetTextAppearance_AppCompat_Tooltip;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Menu;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Title: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Title;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Title_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Title: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Title;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Title_Inverse;
    {class} property TextAppearance_AppCompat_Widget_Button: Integer read _GetTextAppearance_AppCompat_Widget_Button;
    {class} property TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer read _GetTextAppearance_AppCompat_Widget_Button_Borderless_Colored;
    {class} property TextAppearance_AppCompat_Widget_Button_Colored: Integer read _GetTextAppearance_AppCompat_Widget_Button_Colored;
    {class} property TextAppearance_AppCompat_Widget_Button_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_Button_Inverse;
    {class} property TextAppearance_AppCompat_Widget_DropDownItem: Integer read _GetTextAppearance_AppCompat_Widget_DropDownItem;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Header;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Large;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Small;
    {class} property TextAppearance_AppCompat_Widget_Switch: Integer read _GetTextAppearance_AppCompat_Widget_Switch;
    {class} property TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer read _GetTextAppearance_AppCompat_Widget_TextView_SpinnerItem;
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer read _GetTextAppearance_Widget_AppCompat_ExpandedMenu_Item;
    {class} property TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer read _GetTextAppearance_Widget_AppCompat_Toolbar_Subtitle;
    {class} property TextAppearance_Widget_AppCompat_Toolbar_Title: Integer read _GetTextAppearance_Widget_AppCompat_Toolbar_Title;
    {class} property Theme_AppCompat: Integer read _GetTheme_AppCompat;
    {class} property Theme_AppCompat_CompactMenu: Integer read _GetTheme_AppCompat_CompactMenu;
    {class} property Theme_AppCompat_DayNight: Integer read _GetTheme_AppCompat_DayNight;
    {class} property Theme_AppCompat_DayNight_DarkActionBar: Integer read _GetTheme_AppCompat_DayNight_DarkActionBar;
    {class} property Theme_AppCompat_DayNight_Dialog: Integer read _GetTheme_AppCompat_DayNight_Dialog;
    {class} property Theme_AppCompat_DayNight_Dialog_Alert: Integer read _GetTheme_AppCompat_DayNight_Dialog_Alert;
    {class} property Theme_AppCompat_DayNight_Dialog_MinWidth: Integer read _GetTheme_AppCompat_DayNight_Dialog_MinWidth;
    {class} property Theme_AppCompat_DayNight_DialogWhenLarge: Integer read _GetTheme_AppCompat_DayNight_DialogWhenLarge;
    {class} property Theme_AppCompat_DayNight_NoActionBar: Integer read _GetTheme_AppCompat_DayNight_NoActionBar;
    {class} property Theme_AppCompat_Dialog: Integer read _GetTheme_AppCompat_Dialog;
    {class} property Theme_AppCompat_Dialog_Alert: Integer read _GetTheme_AppCompat_Dialog_Alert;
    {class} property Theme_AppCompat_Dialog_MinWidth: Integer read _GetTheme_AppCompat_Dialog_MinWidth;
    {class} property Theme_AppCompat_DialogWhenLarge: Integer read _GetTheme_AppCompat_DialogWhenLarge;
    {class} property Theme_AppCompat_Light: Integer read _GetTheme_AppCompat_Light;
    {class} property Theme_AppCompat_Light_DarkActionBar: Integer read _GetTheme_AppCompat_Light_DarkActionBar;
    {class} property Theme_AppCompat_Light_Dialog: Integer read _GetTheme_AppCompat_Light_Dialog;
    {class} property Theme_AppCompat_Light_Dialog_Alert: Integer read _GetTheme_AppCompat_Light_Dialog_Alert;
    {class} property Theme_AppCompat_Light_Dialog_MinWidth: Integer read _GetTheme_AppCompat_Light_Dialog_MinWidth;
    {class} property Theme_AppCompat_Light_DialogWhenLarge: Integer read _GetTheme_AppCompat_Light_DialogWhenLarge;
    {class} property Theme_AppCompat_Light_NoActionBar: Integer read _GetTheme_AppCompat_Light_NoActionBar;
    {class} property Theme_AppCompat_NoActionBar: Integer read _GetTheme_AppCompat_NoActionBar;
    {class} property ThemeOverlay_AppCompat: Integer read _GetThemeOverlay_AppCompat;
    {class} property ThemeOverlay_AppCompat_ActionBar: Integer read _GetThemeOverlay_AppCompat_ActionBar;
    {class} property ThemeOverlay_AppCompat_Dark: Integer read _GetThemeOverlay_AppCompat_Dark;
    {class} property ThemeOverlay_AppCompat_Dark_ActionBar: Integer read _GetThemeOverlay_AppCompat_Dark_ActionBar;
    {class} property ThemeOverlay_AppCompat_Dialog: Integer read _GetThemeOverlay_AppCompat_Dialog;
    {class} property ThemeOverlay_AppCompat_Dialog_Alert: Integer read _GetThemeOverlay_AppCompat_Dialog_Alert;
    {class} property ThemeOverlay_AppCompat_Light: Integer read _GetThemeOverlay_AppCompat_Light;
    {class} property Widget_AppCompat_ActionBar: Integer read _GetWidget_AppCompat_ActionBar;
    {class} property Widget_AppCompat_ActionBar_Solid: Integer read _GetWidget_AppCompat_ActionBar_Solid;
    {class} property Widget_AppCompat_ActionBar_TabBar: Integer read _GetWidget_AppCompat_ActionBar_TabBar;
    {class} property Widget_AppCompat_ActionBar_TabText: Integer read _GetWidget_AppCompat_ActionBar_TabText;
    {class} property Widget_AppCompat_ActionBar_TabView: Integer read _GetWidget_AppCompat_ActionBar_TabView;
    {class} property Widget_AppCompat_ActionButton: Integer read _GetWidget_AppCompat_ActionButton;
    {class} property Widget_AppCompat_ActionButton_CloseMode: Integer read _GetWidget_AppCompat_ActionButton_CloseMode;
    {class} property Widget_AppCompat_ActionButton_Overflow: Integer read _GetWidget_AppCompat_ActionButton_Overflow;
    {class} property Widget_AppCompat_ActionMode: Integer read _GetWidget_AppCompat_ActionMode;
    {class} property Widget_AppCompat_ActivityChooserView: Integer read _GetWidget_AppCompat_ActivityChooserView;
    {class} property Widget_AppCompat_AutoCompleteTextView: Integer read _GetWidget_AppCompat_AutoCompleteTextView;
    {class} property Widget_AppCompat_Button: Integer read _GetWidget_AppCompat_Button;
    {class} property Widget_AppCompat_Button_Borderless: Integer read _GetWidget_AppCompat_Button_Borderless;
    {class} property Widget_AppCompat_Button_Borderless_Colored: Integer read _GetWidget_AppCompat_Button_Borderless_Colored;
    {class} property Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer read _GetWidget_AppCompat_Button_ButtonBar_AlertDialog;
    {class} property Widget_AppCompat_Button_Colored: Integer read _GetWidget_AppCompat_Button_Colored;
    {class} property Widget_AppCompat_Button_Small: Integer read _GetWidget_AppCompat_Button_Small;
    {class} property Widget_AppCompat_ButtonBar: Integer read _GetWidget_AppCompat_ButtonBar;
    {class} property Widget_AppCompat_ButtonBar_AlertDialog: Integer read _GetWidget_AppCompat_ButtonBar_AlertDialog;
    {class} property Widget_AppCompat_CompoundButton_CheckBox: Integer read _GetWidget_AppCompat_CompoundButton_CheckBox;
    {class} property Widget_AppCompat_CompoundButton_RadioButton: Integer read _GetWidget_AppCompat_CompoundButton_RadioButton;
    {class} property Widget_AppCompat_CompoundButton_Switch: Integer read _GetWidget_AppCompat_CompoundButton_Switch;
    {class} property Widget_AppCompat_DrawerArrowToggle: Integer read _GetWidget_AppCompat_DrawerArrowToggle;
    {class} property Widget_AppCompat_DropDownItem_Spinner: Integer read _GetWidget_AppCompat_DropDownItem_Spinner;
    {class} property Widget_AppCompat_EditText: Integer read _GetWidget_AppCompat_EditText;
    {class} property Widget_AppCompat_ImageButton: Integer read _GetWidget_AppCompat_ImageButton;
    {class} property Widget_AppCompat_Light_ActionBar: Integer read _GetWidget_AppCompat_Light_ActionBar;
    {class} property Widget_AppCompat_Light_ActionBar_Solid: Integer read _GetWidget_AppCompat_Light_ActionBar_Solid;
    {class} property Widget_AppCompat_Light_ActionBar_Solid_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_Solid_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabBar: Integer read _GetWidget_AppCompat_Light_ActionBar_TabBar;
    {class} property Widget_AppCompat_Light_ActionBar_TabBar_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabBar_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabText: Integer read _GetWidget_AppCompat_Light_ActionBar_TabText;
    {class} property Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabText_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabView: Integer read _GetWidget_AppCompat_Light_ActionBar_TabView;
    {class} property Widget_AppCompat_Light_ActionBar_TabView_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabView_Inverse;
    {class} property Widget_AppCompat_Light_ActionButton: Integer read _GetWidget_AppCompat_Light_ActionButton;
    {class} property Widget_AppCompat_Light_ActionButton_CloseMode: Integer read _GetWidget_AppCompat_Light_ActionButton_CloseMode;
    {class} property Widget_AppCompat_Light_ActionButton_Overflow: Integer read _GetWidget_AppCompat_Light_ActionButton_Overflow;
    {class} property Widget_AppCompat_Light_ActionMode_Inverse: Integer read _GetWidget_AppCompat_Light_ActionMode_Inverse;
    {class} property Widget_AppCompat_Light_ActivityChooserView: Integer read _GetWidget_AppCompat_Light_ActivityChooserView;
    {class} property Widget_AppCompat_Light_AutoCompleteTextView: Integer read _GetWidget_AppCompat_Light_AutoCompleteTextView;
    {class} property Widget_AppCompat_Light_DropDownItem_Spinner: Integer read _GetWidget_AppCompat_Light_DropDownItem_Spinner;
    {class} property Widget_AppCompat_Light_ListPopupWindow: Integer read _GetWidget_AppCompat_Light_ListPopupWindow;
    {class} property Widget_AppCompat_Light_ListView_DropDown: Integer read _GetWidget_AppCompat_Light_ListView_DropDown;
    {class} property Widget_AppCompat_Light_PopupMenu: Integer read _GetWidget_AppCompat_Light_PopupMenu;
    {class} property Widget_AppCompat_Light_PopupMenu_Overflow: Integer read _GetWidget_AppCompat_Light_PopupMenu_Overflow;
    {class} property Widget_AppCompat_Light_SearchView: Integer read _GetWidget_AppCompat_Light_SearchView;
    {class} property Widget_AppCompat_Light_Spinner_DropDown_ActionBar: Integer read _GetWidget_AppCompat_Light_Spinner_DropDown_ActionBar;
    {class} property Widget_AppCompat_ListMenuView: Integer read _GetWidget_AppCompat_ListMenuView;
    {class} property Widget_AppCompat_ListPopupWindow: Integer read _GetWidget_AppCompat_ListPopupWindow;
    {class} property Widget_AppCompat_ListView: Integer read _GetWidget_AppCompat_ListView;
    {class} property Widget_AppCompat_ListView_DropDown: Integer read _GetWidget_AppCompat_ListView_DropDown;
    {class} property Widget_AppCompat_ListView_Menu: Integer read _GetWidget_AppCompat_ListView_Menu;
    {class} property Widget_AppCompat_PopupMenu: Integer read _GetWidget_AppCompat_PopupMenu;
    {class} property Widget_AppCompat_PopupMenu_Overflow: Integer read _GetWidget_AppCompat_PopupMenu_Overflow;
    {class} property Widget_AppCompat_PopupWindow: Integer read _GetWidget_AppCompat_PopupWindow;
    {class} property Widget_AppCompat_ProgressBar: Integer read _GetWidget_AppCompat_ProgressBar;
    {class} property Widget_AppCompat_ProgressBar_Horizontal: Integer read _GetWidget_AppCompat_ProgressBar_Horizontal;
    {class} property Widget_AppCompat_RatingBar: Integer read _GetWidget_AppCompat_RatingBar;
    {class} property Widget_AppCompat_RatingBar_Indicator: Integer read _GetWidget_AppCompat_RatingBar_Indicator;
    {class} property Widget_AppCompat_RatingBar_Small: Integer read _GetWidget_AppCompat_RatingBar_Small;
    {class} property Widget_AppCompat_SearchView: Integer read _GetWidget_AppCompat_SearchView;
    {class} property Widget_AppCompat_SearchView_ActionBar: Integer read _GetWidget_AppCompat_SearchView_ActionBar;
    {class} property Widget_AppCompat_SeekBar: Integer read _GetWidget_AppCompat_SeekBar;
    {class} property Widget_AppCompat_SeekBar_Discrete: Integer read _GetWidget_AppCompat_SeekBar_Discrete;
    {class} property Widget_AppCompat_Spinner: Integer read _GetWidget_AppCompat_Spinner;
    {class} property Widget_AppCompat_Spinner_DropDown: Integer read _GetWidget_AppCompat_Spinner_DropDown;
    {class} property Widget_AppCompat_Spinner_DropDown_ActionBar: Integer read _GetWidget_AppCompat_Spinner_DropDown_ActionBar;
    {class} property Widget_AppCompat_Spinner_Underlined: Integer read _GetWidget_AppCompat_Spinner_Underlined;
    {class} property Widget_AppCompat_TextView_SpinnerItem: Integer read _GetWidget_AppCompat_TextView_SpinnerItem;
    {class} property Widget_AppCompat_Toolbar: Integer read _GetWidget_AppCompat_Toolbar;
    {class} property Widget_AppCompat_Toolbar_Button_Navigation: Integer read _GetWidget_AppCompat_Toolbar_Button_Navigation;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
    {class} property Widget_Support_CoordinatorLayout: Integer read _GetWidget_Support_CoordinatorLayout;
  end;

  [JavaSignature('android/support/v7/appcompat/R$style')]
  JR_style_056 = interface(JObject)
  ['{D2DA9EF3-EEC8-48D7-9DEB-5DC5E1B917E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_056 = class(TJavaGenericImport<JR_style_056Class, JR_style_056>) end;

  JR_styleable_057Class = interface(JObjectClass)
  ['{0C801250-7CA6-4496-AA14-16D54AAFB63D}']
    { static Property Methods }
    {class} function _GetActionBar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_backgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_backgroundStacked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_customNavigationLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_displayOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_elevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_hideOnContentScroll: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_homeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_homeLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_indeterminateProgressStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_itemPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_logo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_navigationMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_progressBarPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_progressBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_subtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_titleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBarLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBarLayout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMenuItemView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMenuItemView_android_minWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMenuView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_backgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_closeItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_subtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_titleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView_expandActivityOverflowButtonDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView_initialActivityCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_android_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_buttonIconDimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_buttonPanelSideLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_listItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_listLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_multiChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_showTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_singleChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_constantSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_dither: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_enterFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_exitFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_variablePadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_fromId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_reversible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_toId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_android_src: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_srcCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_tint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_tintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_android_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMarkTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMarkTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_textAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_android_textAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeMaxTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeMinTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizePresetSizes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeStepGranularity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeTextType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_firstBaselineToTopHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_lastBaselineToBottomHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_lineHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_textAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarPopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarSplitStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarWidgetTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionDropDownStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionMenuTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionMenuTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCloseButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCloseDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCopyDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCutDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeFindDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModePasteDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModePopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeSelectAllDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeShareDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeSplitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeWebSearchDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionOverflowButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionOverflowMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_activityChooserViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogButtonGroupStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogCenterButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_android_windowAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_android_windowIsFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_autoCompleteTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_borderlessButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarNegativeButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarNeutralButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarPositiveButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_checkboxStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_checkedTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorAccent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorBackgroundFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorButtonNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlActivated: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlHighlight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorPrimary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorPrimaryDark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorSwitchThumbNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_controlBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogCornerRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogPreferredPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dividerHorizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dividerVertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dropDownListViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dropdownListPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_homeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_imageButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listChoiceBackgroundIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listDividerAlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listMenuViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeightLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeightSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemPaddingLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemPaddingRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelMenuListTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelMenuListWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_popupMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_popupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_radioButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyleIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_searchViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_seekBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_selectableItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_selectableItemBackgroundBorderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_spinnerDropDownItemStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_spinnerStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_switchStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceLargePopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItemSecondary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItemSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearancePopupMenuHeader: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSearchResultSubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSearchResultTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSmallPopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textColorAlertDialogListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textColorSearchUrl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_toolbarNavigationButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_toolbarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_tooltipForegroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_tooltipFrameBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_viewInflaterClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionBarOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionModeOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedHeightMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedHeightMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowMinWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowMinWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetButtonBarLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetButtonBarLayout_allowStacking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_android_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_buttonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_buttonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_keylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_statusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_arrowHeadLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_arrowShaftLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_barLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_drawableSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_gapBetweenBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_spinBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_thickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_baselineAligned: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_baselineAlignedChildIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_orientation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_weightSum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_dividerPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_measureWithLargestChild: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_showDividers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_weight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow_android_dropDownHorizontalOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow_android_dropDownVerticalOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_checkableBehavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_enabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_menuCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_orderInCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionProviderClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionViewClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_alphabeticModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_alphabeticShortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_checkable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_checked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_enabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_menuCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_numericShortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_onClick: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_orderInCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_titleCondensed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_contentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_iconTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_iconTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_numericModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_showAsAction: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_tooltipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_headerBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_horizontalDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemIconDisabledAlpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_verticalDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_windowAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_preserveIconSpacing: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_subMenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_android_popupAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_android_popupBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_overlapAnchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindowBackgroundState: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindowBackgroundState_state_above_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView_paddingBottomNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView_paddingTopNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_focusable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_imeOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_inputType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_maxWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_closeIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_commitIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_defaultQueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_goIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_iconifiedByDefault: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_queryBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_queryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_searchHintIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_searchIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_submitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_suggestionRowLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_voiceIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_dropDownWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_entries: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_popupBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_prompt: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_constantSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_dither: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_enterFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_exitFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_variablePadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawableItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawableItem_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_textOff: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_textOn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_showText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_splitTrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchMinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTextPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_track: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_trackTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_trackTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowDx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowDy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColorHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColorLink: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_typeface: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_textAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_android_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_android_minHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_buttonGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_collapseContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_collapseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_logo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_logoDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_maxButtonHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_navigationContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_navigationIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMargins: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_android_focusable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_android_theme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_paddingEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_paddingStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_theme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_android_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_backgroundTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_backgroundTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_inflatedId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_057; cdecl;

    { static Property }
    {class} property ActionBar: TJavaArray<Integer> read _GetActionBar;
    {class} property ActionBar_background: Integer read _GetActionBar_background;
    {class} property ActionBar_backgroundSplit: Integer read _GetActionBar_backgroundSplit;
    {class} property ActionBar_backgroundStacked: Integer read _GetActionBar_backgroundStacked;
    {class} property ActionBar_contentInsetEnd: Integer read _GetActionBar_contentInsetEnd;
    {class} property ActionBar_contentInsetEndWithActions: Integer read _GetActionBar_contentInsetEndWithActions;
    {class} property ActionBar_contentInsetLeft: Integer read _GetActionBar_contentInsetLeft;
    {class} property ActionBar_contentInsetRight: Integer read _GetActionBar_contentInsetRight;
    {class} property ActionBar_contentInsetStart: Integer read _GetActionBar_contentInsetStart;
    {class} property ActionBar_contentInsetStartWithNavigation: Integer read _GetActionBar_contentInsetStartWithNavigation;
    {class} property ActionBar_customNavigationLayout: Integer read _GetActionBar_customNavigationLayout;
    {class} property ActionBar_displayOptions: Integer read _GetActionBar_displayOptions;
    {class} property ActionBar_divider: Integer read _GetActionBar_divider;
    {class} property ActionBar_elevation: Integer read _GetActionBar_elevation;
    {class} property ActionBar_height: Integer read _GetActionBar_height;
    {class} property ActionBar_hideOnContentScroll: Integer read _GetActionBar_hideOnContentScroll;
    {class} property ActionBar_homeAsUpIndicator: Integer read _GetActionBar_homeAsUpIndicator;
    {class} property ActionBar_homeLayout: Integer read _GetActionBar_homeLayout;
    {class} property ActionBar_icon: Integer read _GetActionBar_icon;
    {class} property ActionBar_indeterminateProgressStyle: Integer read _GetActionBar_indeterminateProgressStyle;
    {class} property ActionBar_itemPadding: Integer read _GetActionBar_itemPadding;
    {class} property ActionBar_logo: Integer read _GetActionBar_logo;
    {class} property ActionBar_navigationMode: Integer read _GetActionBar_navigationMode;
    {class} property ActionBar_popupTheme: Integer read _GetActionBar_popupTheme;
    {class} property ActionBar_progressBarPadding: Integer read _GetActionBar_progressBarPadding;
    {class} property ActionBar_progressBarStyle: Integer read _GetActionBar_progressBarStyle;
    {class} property ActionBar_subtitle: Integer read _GetActionBar_subtitle;
    {class} property ActionBar_subtitleTextStyle: Integer read _GetActionBar_subtitleTextStyle;
    {class} property ActionBar_title: Integer read _GetActionBar_title;
    {class} property ActionBar_titleTextStyle: Integer read _GetActionBar_titleTextStyle;
    {class} property ActionBarLayout: TJavaArray<Integer> read _GetActionBarLayout;
    {class} property ActionBarLayout_android_layout_gravity: Integer read _GetActionBarLayout_android_layout_gravity;
    {class} property ActionMenuItemView: TJavaArray<Integer> read _GetActionMenuItemView;
    {class} property ActionMenuItemView_android_minWidth: Integer read _GetActionMenuItemView_android_minWidth;
    {class} property ActionMenuView: TJavaArray<Integer> read _GetActionMenuView;
    {class} property ActionMode: TJavaArray<Integer> read _GetActionMode;
    {class} property ActionMode_background: Integer read _GetActionMode_background;
    {class} property ActionMode_backgroundSplit: Integer read _GetActionMode_backgroundSplit;
    {class} property ActionMode_closeItemLayout: Integer read _GetActionMode_closeItemLayout;
    {class} property ActionMode_height: Integer read _GetActionMode_height;
    {class} property ActionMode_subtitleTextStyle: Integer read _GetActionMode_subtitleTextStyle;
    {class} property ActionMode_titleTextStyle: Integer read _GetActionMode_titleTextStyle;
    {class} property ActivityChooserView: TJavaArray<Integer> read _GetActivityChooserView;
    {class} property ActivityChooserView_expandActivityOverflowButtonDrawable: Integer read _GetActivityChooserView_expandActivityOverflowButtonDrawable;
    {class} property ActivityChooserView_initialActivityCount: Integer read _GetActivityChooserView_initialActivityCount;
    {class} property AlertDialog: TJavaArray<Integer> read _GetAlertDialog;
    {class} property AlertDialog_android_layout: Integer read _GetAlertDialog_android_layout;
    {class} property AlertDialog_buttonIconDimen: Integer read _GetAlertDialog_buttonIconDimen;
    {class} property AlertDialog_buttonPanelSideLayout: Integer read _GetAlertDialog_buttonPanelSideLayout;
    {class} property AlertDialog_listItemLayout: Integer read _GetAlertDialog_listItemLayout;
    {class} property AlertDialog_listLayout: Integer read _GetAlertDialog_listLayout;
    {class} property AlertDialog_multiChoiceItemLayout: Integer read _GetAlertDialog_multiChoiceItemLayout;
    {class} property AlertDialog_showTitle: Integer read _GetAlertDialog_showTitle;
    {class} property AlertDialog_singleChoiceItemLayout: Integer read _GetAlertDialog_singleChoiceItemLayout;
    {class} property AnimatedStateListDrawableCompat: TJavaArray<Integer> read _GetAnimatedStateListDrawableCompat;
    {class} property AnimatedStateListDrawableCompat_android_constantSize: Integer read _GetAnimatedStateListDrawableCompat_android_constantSize;
    {class} property AnimatedStateListDrawableCompat_android_dither: Integer read _GetAnimatedStateListDrawableCompat_android_dither;
    {class} property AnimatedStateListDrawableCompat_android_enterFadeDuration: Integer read _GetAnimatedStateListDrawableCompat_android_enterFadeDuration;
    {class} property AnimatedStateListDrawableCompat_android_exitFadeDuration: Integer read _GetAnimatedStateListDrawableCompat_android_exitFadeDuration;
    {class} property AnimatedStateListDrawableCompat_android_variablePadding: Integer read _GetAnimatedStateListDrawableCompat_android_variablePadding;
    {class} property AnimatedStateListDrawableCompat_android_visible: Integer read _GetAnimatedStateListDrawableCompat_android_visible;
    {class} property AnimatedStateListDrawableItem: TJavaArray<Integer> read _GetAnimatedStateListDrawableItem;
    {class} property AnimatedStateListDrawableItem_android_drawable: Integer read _GetAnimatedStateListDrawableItem_android_drawable;
    {class} property AnimatedStateListDrawableItem_android_id: Integer read _GetAnimatedStateListDrawableItem_android_id;
    {class} property AnimatedStateListDrawableTransition: TJavaArray<Integer> read _GetAnimatedStateListDrawableTransition;
    {class} property AnimatedStateListDrawableTransition_android_drawable: Integer read _GetAnimatedStateListDrawableTransition_android_drawable;
    {class} property AnimatedStateListDrawableTransition_android_fromId: Integer read _GetAnimatedStateListDrawableTransition_android_fromId;
    {class} property AnimatedStateListDrawableTransition_android_reversible: Integer read _GetAnimatedStateListDrawableTransition_android_reversible;
    {class} property AnimatedStateListDrawableTransition_android_toId: Integer read _GetAnimatedStateListDrawableTransition_android_toId;
    {class} property AppCompatImageView: TJavaArray<Integer> read _GetAppCompatImageView;
    {class} property AppCompatImageView_android_src: Integer read _GetAppCompatImageView_android_src;
    {class} property AppCompatImageView_srcCompat: Integer read _GetAppCompatImageView_srcCompat;
    {class} property AppCompatImageView_tint: Integer read _GetAppCompatImageView_tint;
    {class} property AppCompatImageView_tintMode: Integer read _GetAppCompatImageView_tintMode;
    {class} property AppCompatSeekBar: TJavaArray<Integer> read _GetAppCompatSeekBar;
    {class} property AppCompatSeekBar_android_thumb: Integer read _GetAppCompatSeekBar_android_thumb;
    {class} property AppCompatSeekBar_tickMark: Integer read _GetAppCompatSeekBar_tickMark;
    {class} property AppCompatSeekBar_tickMarkTint: Integer read _GetAppCompatSeekBar_tickMarkTint;
    {class} property AppCompatSeekBar_tickMarkTintMode: Integer read _GetAppCompatSeekBar_tickMarkTintMode;
    {class} property AppCompatTextHelper: TJavaArray<Integer> read _GetAppCompatTextHelper;
    {class} property AppCompatTextHelper_android_drawableBottom: Integer read _GetAppCompatTextHelper_android_drawableBottom;
    {class} property AppCompatTextHelper_android_drawableEnd: Integer read _GetAppCompatTextHelper_android_drawableEnd;
    {class} property AppCompatTextHelper_android_drawableLeft: Integer read _GetAppCompatTextHelper_android_drawableLeft;
    {class} property AppCompatTextHelper_android_drawableRight: Integer read _GetAppCompatTextHelper_android_drawableRight;
    {class} property AppCompatTextHelper_android_drawableStart: Integer read _GetAppCompatTextHelper_android_drawableStart;
    {class} property AppCompatTextHelper_android_drawableTop: Integer read _GetAppCompatTextHelper_android_drawableTop;
    {class} property AppCompatTextHelper_android_textAppearance: Integer read _GetAppCompatTextHelper_android_textAppearance;
    {class} property AppCompatTextView: TJavaArray<Integer> read _GetAppCompatTextView;
    {class} property AppCompatTextView_android_textAppearance: Integer read _GetAppCompatTextView_android_textAppearance;
    {class} property AppCompatTextView_autoSizeMaxTextSize: Integer read _GetAppCompatTextView_autoSizeMaxTextSize;
    {class} property AppCompatTextView_autoSizeMinTextSize: Integer read _GetAppCompatTextView_autoSizeMinTextSize;
    {class} property AppCompatTextView_autoSizePresetSizes: Integer read _GetAppCompatTextView_autoSizePresetSizes;
    {class} property AppCompatTextView_autoSizeStepGranularity: Integer read _GetAppCompatTextView_autoSizeStepGranularity;
    {class} property AppCompatTextView_autoSizeTextType: Integer read _GetAppCompatTextView_autoSizeTextType;
    {class} property AppCompatTextView_firstBaselineToTopHeight: Integer read _GetAppCompatTextView_firstBaselineToTopHeight;
    {class} property AppCompatTextView_fontFamily: Integer read _GetAppCompatTextView_fontFamily;
    {class} property AppCompatTextView_lastBaselineToBottomHeight: Integer read _GetAppCompatTextView_lastBaselineToBottomHeight;
    {class} property AppCompatTextView_lineHeight: Integer read _GetAppCompatTextView_lineHeight;
    {class} property AppCompatTextView_textAllCaps: Integer read _GetAppCompatTextView_textAllCaps;
    {class} property AppCompatTheme: TJavaArray<Integer> read _GetAppCompatTheme;
    {class} property AppCompatTheme_actionBarDivider: Integer read _GetAppCompatTheme_actionBarDivider;
    {class} property AppCompatTheme_actionBarItemBackground: Integer read _GetAppCompatTheme_actionBarItemBackground;
    {class} property AppCompatTheme_actionBarPopupTheme: Integer read _GetAppCompatTheme_actionBarPopupTheme;
    {class} property AppCompatTheme_actionBarSize: Integer read _GetAppCompatTheme_actionBarSize;
    {class} property AppCompatTheme_actionBarSplitStyle: Integer read _GetAppCompatTheme_actionBarSplitStyle;
    {class} property AppCompatTheme_actionBarStyle: Integer read _GetAppCompatTheme_actionBarStyle;
    {class} property AppCompatTheme_actionBarTabBarStyle: Integer read _GetAppCompatTheme_actionBarTabBarStyle;
    {class} property AppCompatTheme_actionBarTabStyle: Integer read _GetAppCompatTheme_actionBarTabStyle;
    {class} property AppCompatTheme_actionBarTabTextStyle: Integer read _GetAppCompatTheme_actionBarTabTextStyle;
    {class} property AppCompatTheme_actionBarTheme: Integer read _GetAppCompatTheme_actionBarTheme;
    {class} property AppCompatTheme_actionBarWidgetTheme: Integer read _GetAppCompatTheme_actionBarWidgetTheme;
    {class} property AppCompatTheme_actionButtonStyle: Integer read _GetAppCompatTheme_actionButtonStyle;
    {class} property AppCompatTheme_actionDropDownStyle: Integer read _GetAppCompatTheme_actionDropDownStyle;
    {class} property AppCompatTheme_actionMenuTextAppearance: Integer read _GetAppCompatTheme_actionMenuTextAppearance;
    {class} property AppCompatTheme_actionMenuTextColor: Integer read _GetAppCompatTheme_actionMenuTextColor;
    {class} property AppCompatTheme_actionModeBackground: Integer read _GetAppCompatTheme_actionModeBackground;
    {class} property AppCompatTheme_actionModeCloseButtonStyle: Integer read _GetAppCompatTheme_actionModeCloseButtonStyle;
    {class} property AppCompatTheme_actionModeCloseDrawable: Integer read _GetAppCompatTheme_actionModeCloseDrawable;
    {class} property AppCompatTheme_actionModeCopyDrawable: Integer read _GetAppCompatTheme_actionModeCopyDrawable;
    {class} property AppCompatTheme_actionModeCutDrawable: Integer read _GetAppCompatTheme_actionModeCutDrawable;
    {class} property AppCompatTheme_actionModeFindDrawable: Integer read _GetAppCompatTheme_actionModeFindDrawable;
    {class} property AppCompatTheme_actionModePasteDrawable: Integer read _GetAppCompatTheme_actionModePasteDrawable;
    {class} property AppCompatTheme_actionModePopupWindowStyle: Integer read _GetAppCompatTheme_actionModePopupWindowStyle;
    {class} property AppCompatTheme_actionModeSelectAllDrawable: Integer read _GetAppCompatTheme_actionModeSelectAllDrawable;
    {class} property AppCompatTheme_actionModeShareDrawable: Integer read _GetAppCompatTheme_actionModeShareDrawable;
    {class} property AppCompatTheme_actionModeSplitBackground: Integer read _GetAppCompatTheme_actionModeSplitBackground;
    {class} property AppCompatTheme_actionModeStyle: Integer read _GetAppCompatTheme_actionModeStyle;
    {class} property AppCompatTheme_actionModeWebSearchDrawable: Integer read _GetAppCompatTheme_actionModeWebSearchDrawable;
    {class} property AppCompatTheme_actionOverflowButtonStyle: Integer read _GetAppCompatTheme_actionOverflowButtonStyle;
    {class} property AppCompatTheme_actionOverflowMenuStyle: Integer read _GetAppCompatTheme_actionOverflowMenuStyle;
    {class} property AppCompatTheme_activityChooserViewStyle: Integer read _GetAppCompatTheme_activityChooserViewStyle;
    {class} property AppCompatTheme_alertDialogButtonGroupStyle: Integer read _GetAppCompatTheme_alertDialogButtonGroupStyle;
    {class} property AppCompatTheme_alertDialogCenterButtons: Integer read _GetAppCompatTheme_alertDialogCenterButtons;
    {class} property AppCompatTheme_alertDialogStyle: Integer read _GetAppCompatTheme_alertDialogStyle;
    {class} property AppCompatTheme_alertDialogTheme: Integer read _GetAppCompatTheme_alertDialogTheme;
    {class} property AppCompatTheme_android_windowAnimationStyle: Integer read _GetAppCompatTheme_android_windowAnimationStyle;
    {class} property AppCompatTheme_android_windowIsFloating: Integer read _GetAppCompatTheme_android_windowIsFloating;
    {class} property AppCompatTheme_autoCompleteTextViewStyle: Integer read _GetAppCompatTheme_autoCompleteTextViewStyle;
    {class} property AppCompatTheme_borderlessButtonStyle: Integer read _GetAppCompatTheme_borderlessButtonStyle;
    {class} property AppCompatTheme_buttonBarButtonStyle: Integer read _GetAppCompatTheme_buttonBarButtonStyle;
    {class} property AppCompatTheme_buttonBarNegativeButtonStyle: Integer read _GetAppCompatTheme_buttonBarNegativeButtonStyle;
    {class} property AppCompatTheme_buttonBarNeutralButtonStyle: Integer read _GetAppCompatTheme_buttonBarNeutralButtonStyle;
    {class} property AppCompatTheme_buttonBarPositiveButtonStyle: Integer read _GetAppCompatTheme_buttonBarPositiveButtonStyle;
    {class} property AppCompatTheme_buttonBarStyle: Integer read _GetAppCompatTheme_buttonBarStyle;
    {class} property AppCompatTheme_buttonStyle: Integer read _GetAppCompatTheme_buttonStyle;
    {class} property AppCompatTheme_buttonStyleSmall: Integer read _GetAppCompatTheme_buttonStyleSmall;
    {class} property AppCompatTheme_checkboxStyle: Integer read _GetAppCompatTheme_checkboxStyle;
    {class} property AppCompatTheme_checkedTextViewStyle: Integer read _GetAppCompatTheme_checkedTextViewStyle;
    {class} property AppCompatTheme_colorAccent: Integer read _GetAppCompatTheme_colorAccent;
    {class} property AppCompatTheme_colorBackgroundFloating: Integer read _GetAppCompatTheme_colorBackgroundFloating;
    {class} property AppCompatTheme_colorButtonNormal: Integer read _GetAppCompatTheme_colorButtonNormal;
    {class} property AppCompatTheme_colorControlActivated: Integer read _GetAppCompatTheme_colorControlActivated;
    {class} property AppCompatTheme_colorControlHighlight: Integer read _GetAppCompatTheme_colorControlHighlight;
    {class} property AppCompatTheme_colorControlNormal: Integer read _GetAppCompatTheme_colorControlNormal;
    {class} property AppCompatTheme_colorError: Integer read _GetAppCompatTheme_colorError;
    {class} property AppCompatTheme_colorPrimary: Integer read _GetAppCompatTheme_colorPrimary;
    {class} property AppCompatTheme_colorPrimaryDark: Integer read _GetAppCompatTheme_colorPrimaryDark;
    {class} property AppCompatTheme_colorSwitchThumbNormal: Integer read _GetAppCompatTheme_colorSwitchThumbNormal;
    {class} property AppCompatTheme_controlBackground: Integer read _GetAppCompatTheme_controlBackground;
    {class} property AppCompatTheme_dialogCornerRadius: Integer read _GetAppCompatTheme_dialogCornerRadius;
    {class} property AppCompatTheme_dialogPreferredPadding: Integer read _GetAppCompatTheme_dialogPreferredPadding;
    {class} property AppCompatTheme_dialogTheme: Integer read _GetAppCompatTheme_dialogTheme;
    {class} property AppCompatTheme_dividerHorizontal: Integer read _GetAppCompatTheme_dividerHorizontal;
    {class} property AppCompatTheme_dividerVertical: Integer read _GetAppCompatTheme_dividerVertical;
    {class} property AppCompatTheme_dropDownListViewStyle: Integer read _GetAppCompatTheme_dropDownListViewStyle;
    {class} property AppCompatTheme_dropdownListPreferredItemHeight: Integer read _GetAppCompatTheme_dropdownListPreferredItemHeight;
    {class} property AppCompatTheme_editTextBackground: Integer read _GetAppCompatTheme_editTextBackground;
    {class} property AppCompatTheme_editTextColor: Integer read _GetAppCompatTheme_editTextColor;
    {class} property AppCompatTheme_editTextStyle: Integer read _GetAppCompatTheme_editTextStyle;
    {class} property AppCompatTheme_homeAsUpIndicator: Integer read _GetAppCompatTheme_homeAsUpIndicator;
    {class} property AppCompatTheme_imageButtonStyle: Integer read _GetAppCompatTheme_imageButtonStyle;
    {class} property AppCompatTheme_listChoiceBackgroundIndicator: Integer read _GetAppCompatTheme_listChoiceBackgroundIndicator;
    {class} property AppCompatTheme_listDividerAlertDialog: Integer read _GetAppCompatTheme_listDividerAlertDialog;
    {class} property AppCompatTheme_listMenuViewStyle: Integer read _GetAppCompatTheme_listMenuViewStyle;
    {class} property AppCompatTheme_listPopupWindowStyle: Integer read _GetAppCompatTheme_listPopupWindowStyle;
    {class} property AppCompatTheme_listPreferredItemHeight: Integer read _GetAppCompatTheme_listPreferredItemHeight;
    {class} property AppCompatTheme_listPreferredItemHeightLarge: Integer read _GetAppCompatTheme_listPreferredItemHeightLarge;
    {class} property AppCompatTheme_listPreferredItemHeightSmall: Integer read _GetAppCompatTheme_listPreferredItemHeightSmall;
    {class} property AppCompatTheme_listPreferredItemPaddingLeft: Integer read _GetAppCompatTheme_listPreferredItemPaddingLeft;
    {class} property AppCompatTheme_listPreferredItemPaddingRight: Integer read _GetAppCompatTheme_listPreferredItemPaddingRight;
    {class} property AppCompatTheme_panelBackground: Integer read _GetAppCompatTheme_panelBackground;
    {class} property AppCompatTheme_panelMenuListTheme: Integer read _GetAppCompatTheme_panelMenuListTheme;
    {class} property AppCompatTheme_panelMenuListWidth: Integer read _GetAppCompatTheme_panelMenuListWidth;
    {class} property AppCompatTheme_popupMenuStyle: Integer read _GetAppCompatTheme_popupMenuStyle;
    {class} property AppCompatTheme_popupWindowStyle: Integer read _GetAppCompatTheme_popupWindowStyle;
    {class} property AppCompatTheme_radioButtonStyle: Integer read _GetAppCompatTheme_radioButtonStyle;
    {class} property AppCompatTheme_ratingBarStyle: Integer read _GetAppCompatTheme_ratingBarStyle;
    {class} property AppCompatTheme_ratingBarStyleIndicator: Integer read _GetAppCompatTheme_ratingBarStyleIndicator;
    {class} property AppCompatTheme_ratingBarStyleSmall: Integer read _GetAppCompatTheme_ratingBarStyleSmall;
    {class} property AppCompatTheme_searchViewStyle: Integer read _GetAppCompatTheme_searchViewStyle;
    {class} property AppCompatTheme_seekBarStyle: Integer read _GetAppCompatTheme_seekBarStyle;
    {class} property AppCompatTheme_selectableItemBackground: Integer read _GetAppCompatTheme_selectableItemBackground;
    {class} property AppCompatTheme_selectableItemBackgroundBorderless: Integer read _GetAppCompatTheme_selectableItemBackgroundBorderless;
    {class} property AppCompatTheme_spinnerDropDownItemStyle: Integer read _GetAppCompatTheme_spinnerDropDownItemStyle;
    {class} property AppCompatTheme_spinnerStyle: Integer read _GetAppCompatTheme_spinnerStyle;
    {class} property AppCompatTheme_switchStyle: Integer read _GetAppCompatTheme_switchStyle;
    {class} property AppCompatTheme_textAppearanceLargePopupMenu: Integer read _GetAppCompatTheme_textAppearanceLargePopupMenu;
    {class} property AppCompatTheme_textAppearanceListItem: Integer read _GetAppCompatTheme_textAppearanceListItem;
    {class} property AppCompatTheme_textAppearanceListItemSecondary: Integer read _GetAppCompatTheme_textAppearanceListItemSecondary;
    {class} property AppCompatTheme_textAppearanceListItemSmall: Integer read _GetAppCompatTheme_textAppearanceListItemSmall;
    {class} property AppCompatTheme_textAppearancePopupMenuHeader: Integer read _GetAppCompatTheme_textAppearancePopupMenuHeader;
    {class} property AppCompatTheme_textAppearanceSearchResultSubtitle: Integer read _GetAppCompatTheme_textAppearanceSearchResultSubtitle;
    {class} property AppCompatTheme_textAppearanceSearchResultTitle: Integer read _GetAppCompatTheme_textAppearanceSearchResultTitle;
    {class} property AppCompatTheme_textAppearanceSmallPopupMenu: Integer read _GetAppCompatTheme_textAppearanceSmallPopupMenu;
    {class} property AppCompatTheme_textColorAlertDialogListItem: Integer read _GetAppCompatTheme_textColorAlertDialogListItem;
    {class} property AppCompatTheme_textColorSearchUrl: Integer read _GetAppCompatTheme_textColorSearchUrl;
    {class} property AppCompatTheme_toolbarNavigationButtonStyle: Integer read _GetAppCompatTheme_toolbarNavigationButtonStyle;
    {class} property AppCompatTheme_toolbarStyle: Integer read _GetAppCompatTheme_toolbarStyle;
    {class} property AppCompatTheme_tooltipForegroundColor: Integer read _GetAppCompatTheme_tooltipForegroundColor;
    {class} property AppCompatTheme_tooltipFrameBackground: Integer read _GetAppCompatTheme_tooltipFrameBackground;
    {class} property AppCompatTheme_viewInflaterClass: Integer read _GetAppCompatTheme_viewInflaterClass;
    {class} property AppCompatTheme_windowActionBar: Integer read _GetAppCompatTheme_windowActionBar;
    {class} property AppCompatTheme_windowActionBarOverlay: Integer read _GetAppCompatTheme_windowActionBarOverlay;
    {class} property AppCompatTheme_windowActionModeOverlay: Integer read _GetAppCompatTheme_windowActionModeOverlay;
    {class} property AppCompatTheme_windowFixedHeightMajor: Integer read _GetAppCompatTheme_windowFixedHeightMajor;
    {class} property AppCompatTheme_windowFixedHeightMinor: Integer read _GetAppCompatTheme_windowFixedHeightMinor;
    {class} property AppCompatTheme_windowFixedWidthMajor: Integer read _GetAppCompatTheme_windowFixedWidthMajor;
    {class} property AppCompatTheme_windowFixedWidthMinor: Integer read _GetAppCompatTheme_windowFixedWidthMinor;
    {class} property AppCompatTheme_windowMinWidthMajor: Integer read _GetAppCompatTheme_windowMinWidthMajor;
    {class} property AppCompatTheme_windowMinWidthMinor: Integer read _GetAppCompatTheme_windowMinWidthMinor;
    {class} property AppCompatTheme_windowNoTitle: Integer read _GetAppCompatTheme_windowNoTitle;
    {class} property ButtonBarLayout: TJavaArray<Integer> read _GetButtonBarLayout;
    {class} property ButtonBarLayout_allowStacking: Integer read _GetButtonBarLayout_allowStacking;
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property CompoundButton: TJavaArray<Integer> read _GetCompoundButton;
    {class} property CompoundButton_android_button: Integer read _GetCompoundButton_android_button;
    {class} property CompoundButton_buttonTint: Integer read _GetCompoundButton_buttonTint;
    {class} property CompoundButton_buttonTintMode: Integer read _GetCompoundButton_buttonTintMode;
    {class} property CoordinatorLayout: TJavaArray<Integer> read _GetCoordinatorLayout;
    {class} property CoordinatorLayout_keylines: Integer read _GetCoordinatorLayout_keylines;
    {class} property CoordinatorLayout_statusBarBackground: Integer read _GetCoordinatorLayout_statusBarBackground;
    {class} property CoordinatorLayout_Layout: TJavaArray<Integer> read _GetCoordinatorLayout_Layout;
    {class} property CoordinatorLayout_Layout_android_layout_gravity: Integer read _GetCoordinatorLayout_Layout_android_layout_gravity;
    {class} property CoordinatorLayout_Layout_layout_anchor: Integer read _GetCoordinatorLayout_Layout_layout_anchor;
    {class} property CoordinatorLayout_Layout_layout_anchorGravity: Integer read _GetCoordinatorLayout_Layout_layout_anchorGravity;
    {class} property CoordinatorLayout_Layout_layout_behavior: Integer read _GetCoordinatorLayout_Layout_layout_behavior;
    {class} property CoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer read _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges;
    {class} property CoordinatorLayout_Layout_layout_insetEdge: Integer read _GetCoordinatorLayout_Layout_layout_insetEdge;
    {class} property CoordinatorLayout_Layout_layout_keyline: Integer read _GetCoordinatorLayout_Layout_layout_keyline;
    {class} property DrawerArrowToggle: TJavaArray<Integer> read _GetDrawerArrowToggle;
    {class} property DrawerArrowToggle_arrowHeadLength: Integer read _GetDrawerArrowToggle_arrowHeadLength;
    {class} property DrawerArrowToggle_arrowShaftLength: Integer read _GetDrawerArrowToggle_arrowShaftLength;
    {class} property DrawerArrowToggle_barLength: Integer read _GetDrawerArrowToggle_barLength;
    {class} property DrawerArrowToggle_color: Integer read _GetDrawerArrowToggle_color;
    {class} property DrawerArrowToggle_drawableSize: Integer read _GetDrawerArrowToggle_drawableSize;
    {class} property DrawerArrowToggle_gapBetweenBars: Integer read _GetDrawerArrowToggle_gapBetweenBars;
    {class} property DrawerArrowToggle_spinBars: Integer read _GetDrawerArrowToggle_spinBars;
    {class} property DrawerArrowToggle_thickness: Integer read _GetDrawerArrowToggle_thickness;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
    {class} property LinearLayoutCompat: TJavaArray<Integer> read _GetLinearLayoutCompat;
    {class} property LinearLayoutCompat_android_baselineAligned: Integer read _GetLinearLayoutCompat_android_baselineAligned;
    {class} property LinearLayoutCompat_android_baselineAlignedChildIndex: Integer read _GetLinearLayoutCompat_android_baselineAlignedChildIndex;
    {class} property LinearLayoutCompat_android_gravity: Integer read _GetLinearLayoutCompat_android_gravity;
    {class} property LinearLayoutCompat_android_orientation: Integer read _GetLinearLayoutCompat_android_orientation;
    {class} property LinearLayoutCompat_android_weightSum: Integer read _GetLinearLayoutCompat_android_weightSum;
    {class} property LinearLayoutCompat_divider: Integer read _GetLinearLayoutCompat_divider;
    {class} property LinearLayoutCompat_dividerPadding: Integer read _GetLinearLayoutCompat_dividerPadding;
    {class} property LinearLayoutCompat_measureWithLargestChild: Integer read _GetLinearLayoutCompat_measureWithLargestChild;
    {class} property LinearLayoutCompat_showDividers: Integer read _GetLinearLayoutCompat_showDividers;
    {class} property LinearLayoutCompat_Layout: TJavaArray<Integer> read _GetLinearLayoutCompat_Layout;
    {class} property LinearLayoutCompat_Layout_android_layout_gravity: Integer read _GetLinearLayoutCompat_Layout_android_layout_gravity;
    {class} property LinearLayoutCompat_Layout_android_layout_height: Integer read _GetLinearLayoutCompat_Layout_android_layout_height;
    {class} property LinearLayoutCompat_Layout_android_layout_weight: Integer read _GetLinearLayoutCompat_Layout_android_layout_weight;
    {class} property LinearLayoutCompat_Layout_android_layout_width: Integer read _GetLinearLayoutCompat_Layout_android_layout_width;
    {class} property ListPopupWindow: TJavaArray<Integer> read _GetListPopupWindow;
    {class} property ListPopupWindow_android_dropDownHorizontalOffset: Integer read _GetListPopupWindow_android_dropDownHorizontalOffset;
    {class} property ListPopupWindow_android_dropDownVerticalOffset: Integer read _GetListPopupWindow_android_dropDownVerticalOffset;
    {class} property MenuGroup: TJavaArray<Integer> read _GetMenuGroup;
    {class} property MenuGroup_android_checkableBehavior: Integer read _GetMenuGroup_android_checkableBehavior;
    {class} property MenuGroup_android_enabled: Integer read _GetMenuGroup_android_enabled;
    {class} property MenuGroup_android_id: Integer read _GetMenuGroup_android_id;
    {class} property MenuGroup_android_menuCategory: Integer read _GetMenuGroup_android_menuCategory;
    {class} property MenuGroup_android_orderInCategory: Integer read _GetMenuGroup_android_orderInCategory;
    {class} property MenuGroup_android_visible: Integer read _GetMenuGroup_android_visible;
    {class} property MenuItem: TJavaArray<Integer> read _GetMenuItem;
    {class} property MenuItem_actionLayout: Integer read _GetMenuItem_actionLayout;
    {class} property MenuItem_actionProviderClass: Integer read _GetMenuItem_actionProviderClass;
    {class} property MenuItem_actionViewClass: Integer read _GetMenuItem_actionViewClass;
    {class} property MenuItem_alphabeticModifiers: Integer read _GetMenuItem_alphabeticModifiers;
    {class} property MenuItem_android_alphabeticShortcut: Integer read _GetMenuItem_android_alphabeticShortcut;
    {class} property MenuItem_android_checkable: Integer read _GetMenuItem_android_checkable;
    {class} property MenuItem_android_checked: Integer read _GetMenuItem_android_checked;
    {class} property MenuItem_android_enabled: Integer read _GetMenuItem_android_enabled;
    {class} property MenuItem_android_icon: Integer read _GetMenuItem_android_icon;
    {class} property MenuItem_android_id: Integer read _GetMenuItem_android_id;
    {class} property MenuItem_android_menuCategory: Integer read _GetMenuItem_android_menuCategory;
    {class} property MenuItem_android_numericShortcut: Integer read _GetMenuItem_android_numericShortcut;
    {class} property MenuItem_android_onClick: Integer read _GetMenuItem_android_onClick;
    {class} property MenuItem_android_orderInCategory: Integer read _GetMenuItem_android_orderInCategory;
    {class} property MenuItem_android_title: Integer read _GetMenuItem_android_title;
    {class} property MenuItem_android_titleCondensed: Integer read _GetMenuItem_android_titleCondensed;
    {class} property MenuItem_android_visible: Integer read _GetMenuItem_android_visible;
    {class} property MenuItem_contentDescription: Integer read _GetMenuItem_contentDescription;
    {class} property MenuItem_iconTint: Integer read _GetMenuItem_iconTint;
    {class} property MenuItem_iconTintMode: Integer read _GetMenuItem_iconTintMode;
    {class} property MenuItem_numericModifiers: Integer read _GetMenuItem_numericModifiers;
    {class} property MenuItem_showAsAction: Integer read _GetMenuItem_showAsAction;
    {class} property MenuItem_tooltipText: Integer read _GetMenuItem_tooltipText;
    {class} property MenuView: TJavaArray<Integer> read _GetMenuView;
    {class} property MenuView_android_headerBackground: Integer read _GetMenuView_android_headerBackground;
    {class} property MenuView_android_horizontalDivider: Integer read _GetMenuView_android_horizontalDivider;
    {class} property MenuView_android_itemBackground: Integer read _GetMenuView_android_itemBackground;
    {class} property MenuView_android_itemIconDisabledAlpha: Integer read _GetMenuView_android_itemIconDisabledAlpha;
    {class} property MenuView_android_itemTextAppearance: Integer read _GetMenuView_android_itemTextAppearance;
    {class} property MenuView_android_verticalDivider: Integer read _GetMenuView_android_verticalDivider;
    {class} property MenuView_android_windowAnimationStyle: Integer read _GetMenuView_android_windowAnimationStyle;
    {class} property MenuView_preserveIconSpacing: Integer read _GetMenuView_preserveIconSpacing;
    {class} property MenuView_subMenuArrow: Integer read _GetMenuView_subMenuArrow;
    {class} property PopupWindow: TJavaArray<Integer> read _GetPopupWindow;
    {class} property PopupWindow_android_popupAnimationStyle: Integer read _GetPopupWindow_android_popupAnimationStyle;
    {class} property PopupWindow_android_popupBackground: Integer read _GetPopupWindow_android_popupBackground;
    {class} property PopupWindow_overlapAnchor: Integer read _GetPopupWindow_overlapAnchor;
    {class} property PopupWindowBackgroundState: TJavaArray<Integer> read _GetPopupWindowBackgroundState;
    {class} property PopupWindowBackgroundState_state_above_anchor: Integer read _GetPopupWindowBackgroundState_state_above_anchor;
    {class} property RecycleListView: TJavaArray<Integer> read _GetRecycleListView;
    {class} property RecycleListView_paddingBottomNoButtons: Integer read _GetRecycleListView_paddingBottomNoButtons;
    {class} property RecycleListView_paddingTopNoTitle: Integer read _GetRecycleListView_paddingTopNoTitle;
    {class} property SearchView: TJavaArray<Integer> read _GetSearchView;
    {class} property SearchView_android_focusable: Integer read _GetSearchView_android_focusable;
    {class} property SearchView_android_imeOptions: Integer read _GetSearchView_android_imeOptions;
    {class} property SearchView_android_inputType: Integer read _GetSearchView_android_inputType;
    {class} property SearchView_android_maxWidth: Integer read _GetSearchView_android_maxWidth;
    {class} property SearchView_closeIcon: Integer read _GetSearchView_closeIcon;
    {class} property SearchView_commitIcon: Integer read _GetSearchView_commitIcon;
    {class} property SearchView_defaultQueryHint: Integer read _GetSearchView_defaultQueryHint;
    {class} property SearchView_goIcon: Integer read _GetSearchView_goIcon;
    {class} property SearchView_iconifiedByDefault: Integer read _GetSearchView_iconifiedByDefault;
    {class} property SearchView_layout: Integer read _GetSearchView_layout;
    {class} property SearchView_queryBackground: Integer read _GetSearchView_queryBackground;
    {class} property SearchView_queryHint: Integer read _GetSearchView_queryHint;
    {class} property SearchView_searchHintIcon: Integer read _GetSearchView_searchHintIcon;
    {class} property SearchView_searchIcon: Integer read _GetSearchView_searchIcon;
    {class} property SearchView_submitBackground: Integer read _GetSearchView_submitBackground;
    {class} property SearchView_suggestionRowLayout: Integer read _GetSearchView_suggestionRowLayout;
    {class} property SearchView_voiceIcon: Integer read _GetSearchView_voiceIcon;
    {class} property Spinner: TJavaArray<Integer> read _GetSpinner;
    {class} property Spinner_android_dropDownWidth: Integer read _GetSpinner_android_dropDownWidth;
    {class} property Spinner_android_entries: Integer read _GetSpinner_android_entries;
    {class} property Spinner_android_popupBackground: Integer read _GetSpinner_android_popupBackground;
    {class} property Spinner_android_prompt: Integer read _GetSpinner_android_prompt;
    {class} property Spinner_popupTheme: Integer read _GetSpinner_popupTheme;
    {class} property StateListDrawable: TJavaArray<Integer> read _GetStateListDrawable;
    {class} property StateListDrawable_android_constantSize: Integer read _GetStateListDrawable_android_constantSize;
    {class} property StateListDrawable_android_dither: Integer read _GetStateListDrawable_android_dither;
    {class} property StateListDrawable_android_enterFadeDuration: Integer read _GetStateListDrawable_android_enterFadeDuration;
    {class} property StateListDrawable_android_exitFadeDuration: Integer read _GetStateListDrawable_android_exitFadeDuration;
    {class} property StateListDrawable_android_variablePadding: Integer read _GetStateListDrawable_android_variablePadding;
    {class} property StateListDrawable_android_visible: Integer read _GetStateListDrawable_android_visible;
    {class} property StateListDrawableItem: TJavaArray<Integer> read _GetStateListDrawableItem;
    {class} property StateListDrawableItem_android_drawable: Integer read _GetStateListDrawableItem_android_drawable;
    {class} property SwitchCompat: TJavaArray<Integer> read _GetSwitchCompat;
    {class} property SwitchCompat_android_textOff: Integer read _GetSwitchCompat_android_textOff;
    {class} property SwitchCompat_android_textOn: Integer read _GetSwitchCompat_android_textOn;
    {class} property SwitchCompat_android_thumb: Integer read _GetSwitchCompat_android_thumb;
    {class} property SwitchCompat_showText: Integer read _GetSwitchCompat_showText;
    {class} property SwitchCompat_splitTrack: Integer read _GetSwitchCompat_splitTrack;
    {class} property SwitchCompat_switchMinWidth: Integer read _GetSwitchCompat_switchMinWidth;
    {class} property SwitchCompat_switchPadding: Integer read _GetSwitchCompat_switchPadding;
    {class} property SwitchCompat_switchTextAppearance: Integer read _GetSwitchCompat_switchTextAppearance;
    {class} property SwitchCompat_thumbTextPadding: Integer read _GetSwitchCompat_thumbTextPadding;
    {class} property SwitchCompat_thumbTint: Integer read _GetSwitchCompat_thumbTint;
    {class} property SwitchCompat_thumbTintMode: Integer read _GetSwitchCompat_thumbTintMode;
    {class} property SwitchCompat_track: Integer read _GetSwitchCompat_track;
    {class} property SwitchCompat_trackTint: Integer read _GetSwitchCompat_trackTint;
    {class} property SwitchCompat_trackTintMode: Integer read _GetSwitchCompat_trackTintMode;
    {class} property TextAppearance: TJavaArray<Integer> read _GetTextAppearance;
    {class} property TextAppearance_android_fontFamily: Integer read _GetTextAppearance_android_fontFamily;
    {class} property TextAppearance_android_shadowColor: Integer read _GetTextAppearance_android_shadowColor;
    {class} property TextAppearance_android_shadowDx: Integer read _GetTextAppearance_android_shadowDx;
    {class} property TextAppearance_android_shadowDy: Integer read _GetTextAppearance_android_shadowDy;
    {class} property TextAppearance_android_shadowRadius: Integer read _GetTextAppearance_android_shadowRadius;
    {class} property TextAppearance_android_textColor: Integer read _GetTextAppearance_android_textColor;
    {class} property TextAppearance_android_textColorHint: Integer read _GetTextAppearance_android_textColorHint;
    {class} property TextAppearance_android_textColorLink: Integer read _GetTextAppearance_android_textColorLink;
    {class} property TextAppearance_android_textSize: Integer read _GetTextAppearance_android_textSize;
    {class} property TextAppearance_android_textStyle: Integer read _GetTextAppearance_android_textStyle;
    {class} property TextAppearance_android_typeface: Integer read _GetTextAppearance_android_typeface;
    {class} property TextAppearance_fontFamily: Integer read _GetTextAppearance_fontFamily;
    {class} property TextAppearance_textAllCaps: Integer read _GetTextAppearance_textAllCaps;
    {class} property Toolbar: TJavaArray<Integer> read _GetToolbar;
    {class} property Toolbar_android_gravity: Integer read _GetToolbar_android_gravity;
    {class} property Toolbar_android_minHeight: Integer read _GetToolbar_android_minHeight;
    {class} property Toolbar_buttonGravity: Integer read _GetToolbar_buttonGravity;
    {class} property Toolbar_collapseContentDescription: Integer read _GetToolbar_collapseContentDescription;
    {class} property Toolbar_collapseIcon: Integer read _GetToolbar_collapseIcon;
    {class} property Toolbar_contentInsetEnd: Integer read _GetToolbar_contentInsetEnd;
    {class} property Toolbar_contentInsetEndWithActions: Integer read _GetToolbar_contentInsetEndWithActions;
    {class} property Toolbar_contentInsetLeft: Integer read _GetToolbar_contentInsetLeft;
    {class} property Toolbar_contentInsetRight: Integer read _GetToolbar_contentInsetRight;
    {class} property Toolbar_contentInsetStart: Integer read _GetToolbar_contentInsetStart;
    {class} property Toolbar_contentInsetStartWithNavigation: Integer read _GetToolbar_contentInsetStartWithNavigation;
    {class} property Toolbar_logo: Integer read _GetToolbar_logo;
    {class} property Toolbar_logoDescription: Integer read _GetToolbar_logoDescription;
    {class} property Toolbar_maxButtonHeight: Integer read _GetToolbar_maxButtonHeight;
    {class} property Toolbar_navigationContentDescription: Integer read _GetToolbar_navigationContentDescription;
    {class} property Toolbar_navigationIcon: Integer read _GetToolbar_navigationIcon;
    {class} property Toolbar_popupTheme: Integer read _GetToolbar_popupTheme;
    {class} property Toolbar_subtitle: Integer read _GetToolbar_subtitle;
    {class} property Toolbar_subtitleTextAppearance: Integer read _GetToolbar_subtitleTextAppearance;
    {class} property Toolbar_subtitleTextColor: Integer read _GetToolbar_subtitleTextColor;
    {class} property Toolbar_title: Integer read _GetToolbar_title;
    {class} property Toolbar_titleMargin: Integer read _GetToolbar_titleMargin;
    {class} property Toolbar_titleMarginBottom: Integer read _GetToolbar_titleMarginBottom;
    {class} property Toolbar_titleMarginEnd: Integer read _GetToolbar_titleMarginEnd;
    {class} property Toolbar_titleMarginStart: Integer read _GetToolbar_titleMarginStart;
    {class} property Toolbar_titleMarginTop: Integer read _GetToolbar_titleMarginTop;
    {class} property Toolbar_titleMargins: Integer read _GetToolbar_titleMargins;
    {class} property Toolbar_titleTextAppearance: Integer read _GetToolbar_titleTextAppearance;
    {class} property Toolbar_titleTextColor: Integer read _GetToolbar_titleTextColor;
    {class} property View: TJavaArray<Integer> read _GetView;
    {class} property View_android_focusable: Integer read _GetView_android_focusable;
    {class} property View_android_theme: Integer read _GetView_android_theme;
    {class} property View_paddingEnd: Integer read _GetView_paddingEnd;
    {class} property View_paddingStart: Integer read _GetView_paddingStart;
    {class} property View_theme: Integer read _GetView_theme;
    {class} property ViewBackgroundHelper: TJavaArray<Integer> read _GetViewBackgroundHelper;
    {class} property ViewBackgroundHelper_android_background: Integer read _GetViewBackgroundHelper_android_background;
    {class} property ViewBackgroundHelper_backgroundTint: Integer read _GetViewBackgroundHelper_backgroundTint;
    {class} property ViewBackgroundHelper_backgroundTintMode: Integer read _GetViewBackgroundHelper_backgroundTintMode;
    {class} property ViewStubCompat: TJavaArray<Integer> read _GetViewStubCompat;
    {class} property ViewStubCompat_android_id: Integer read _GetViewStubCompat_android_id;
    {class} property ViewStubCompat_android_inflatedId: Integer read _GetViewStubCompat_android_inflatedId;
    {class} property ViewStubCompat_android_layout: Integer read _GetViewStubCompat_android_layout;
  end;

  [JavaSignature('android/support/v7/appcompat/R$styleable')]
  JR_styleable_057 = interface(JObject)
  ['{E60203CF-A116-439D-8D13-49A68F95E60D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_057 = class(TJavaGenericImport<JR_styleable_057Class, JR_styleable_057>) end;

  JR_xml_058Class = interface(JObjectClass)
  ['{D5948E55-8746-485D-99B0-35630FD565DA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_058; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/appcompat/R$xml')]
  JR_xml_058 = interface(JObject)
  ['{F659F1C8-908D-4EEF-81DF-302306F711C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_058 = class(TJavaGenericImport<JR_xml_058Class, JR_xml_058>) end;

  JR_059Class = interface(JObjectClass)
  ['{56B70E91-F5C7-4897-908D-ECA1E1D5A69B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_059; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/appcompat/R')]
  JR_059 = interface(JObject)
  ['{B7575D00-3C7F-4647-9C59-CFD5C84D78A1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_059 = class(TJavaGenericImport<JR_059Class, JR_059>) end;

  JR_anim_060Class = interface(JObjectClass)
  ['{3A821391-94E5-48CD-B86F-13853664293C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim_060; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/recyclerview/R$anim')]
  JR_anim_060 = interface(JObject)
  ['{922D9D4B-1A14-4077-8E9A-B3737FC258DD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_060 = class(TJavaGenericImport<JR_anim_060Class, JR_anim_060>) end;

  JR_attr_061Class = interface(JObjectClass)
  ['{E8CB40DD-C6E3-431A-BB6C-CE2D880B75E8}']
    { static Property Methods }
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcoordinatorLayoutStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollEnabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollHorizontalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollHorizontalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollVerticalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollVerticalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getkeylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlayoutManager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreverseLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspanCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstackFromEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstatusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_061; cdecl;

    { static Property }
    {class} property alpha: Integer read _Getalpha;
    {class} property coordinatorLayoutStyle: Integer read _GetcoordinatorLayoutStyle;
    {class} property fastScrollEnabled: Integer read _GetfastScrollEnabled;
    {class} property fastScrollHorizontalThumbDrawable: Integer read _GetfastScrollHorizontalThumbDrawable;
    {class} property fastScrollHorizontalTrackDrawable: Integer read _GetfastScrollHorizontalTrackDrawable;
    {class} property fastScrollVerticalThumbDrawable: Integer read _GetfastScrollVerticalThumbDrawable;
    {class} property fastScrollVerticalTrackDrawable: Integer read _GetfastScrollVerticalTrackDrawable;
    {class} property font: Integer read _Getfont;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property keylines: Integer read _Getkeylines;
    {class} property layoutManager: Integer read _GetlayoutManager;
    {class} property layout_anchor: Integer read _Getlayout_anchor;
    {class} property layout_anchorGravity: Integer read _Getlayout_anchorGravity;
    {class} property layout_behavior: Integer read _Getlayout_behavior;
    {class} property layout_dodgeInsetEdges: Integer read _Getlayout_dodgeInsetEdges;
    {class} property layout_insetEdge: Integer read _Getlayout_insetEdge;
    {class} property layout_keyline: Integer read _Getlayout_keyline;
    {class} property reverseLayout: Integer read _GetreverseLayout;
    {class} property spanCount: Integer read _GetspanCount;
    {class} property stackFromEnd: Integer read _GetstackFromEnd;
    {class} property statusBarBackground: Integer read _GetstatusBarBackground;
    {class} property ttcIndex: Integer read _GetttcIndex;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$attr')]
  JR_attr_061 = interface(JObject)
  ['{F1D2A842-EC49-4498-BAFC-268908D0180A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_061 = class(TJavaGenericImport<JR_attr_061Class, JR_attr_061>) end;

  JR_bool_062Class = interface(JObjectClass)
  ['{A6DF7BE0-CA6B-410D-B7D3-FCCCF868C668}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool_062; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/recyclerview/R$bool')]
  JR_bool_062 = interface(JObject)
  ['{2AB8FFBE-5792-4192-BA2B-EE3393ECB1D1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_062 = class(TJavaGenericImport<JR_bool_062Class, JR_bool_062>) end;

  JR_color_063Class = interface(JObjectClass)
  ['{0A89736D-7827-4A1C-8B14-88FFC8F6FD9A}']
    { static Property Methods }
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_063; cdecl;

    { static Property }
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$color')]
  JR_color_063 = interface(JObject)
  ['{F1D096EA-B4DA-428E-BDB3-ED74A289A82E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_063 = class(TJavaGenericImport<JR_color_063Class, JR_color_063>) end;

  JR_dimen_064Class = interface(JObjectClass)
  ['{B94B3F77-0232-410D-BE82-7020B3E404F0}']
    { static Property Methods }
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_default_thickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_minimum_range: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_max_drag_scroll_per_frame: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_swipe_escape_max_velocity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_swipe_escape_velocity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen_064; cdecl;

    { static Property }
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property fastscroll_default_thickness: Integer read _Getfastscroll_default_thickness;
    {class} property fastscroll_margin: Integer read _Getfastscroll_margin;
    {class} property fastscroll_minimum_range: Integer read _Getfastscroll_minimum_range;
    {class} property item_touch_helper_max_drag_scroll_per_frame: Integer read _Getitem_touch_helper_max_drag_scroll_per_frame;
    {class} property item_touch_helper_swipe_escape_max_velocity: Integer read _Getitem_touch_helper_swipe_escape_max_velocity;
    {class} property item_touch_helper_swipe_escape_velocity: Integer read _Getitem_touch_helper_swipe_escape_velocity;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$dimen')]
  JR_dimen_064 = interface(JObject)
  ['{F1214AC8-DC86-40BC-B01A-64E63C2334AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_064 = class(TJavaGenericImport<JR_dimen_064Class, JR_dimen_064>) end;

  JR_drawable_065Class = interface(JObjectClass)
  ['{30FE71BA-676E-4FBE-B6B6-6348F8C736C5}']
    { static Property Methods }
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable_065; cdecl;

    { static Property }
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$drawable')]
  JR_drawable_065 = interface(JObject)
  ['{645719E9-D30D-4AAF-8E1D-A8FEF915A9EF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_065 = class(TJavaGenericImport<JR_drawable_065Class, JR_drawable_065>) end;

  JR_id_066Class = interface(JObjectClass)
  ['{6097EBEA-341D-42BE-ADCC-37E0043B6E3E}']
    { static Property Methods }
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_previous_elevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getleft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_066; cdecl;

    { static Property }
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property bottom: Integer read _Getbottom;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property &end: Integer read _Getend;
    {class} property forever: Integer read _Getforever;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property item_touch_helper_previous_elevation: Integer read _Getitem_touch_helper_previous_elevation;
    {class} property left: Integer read _Getleft;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property none: Integer read _Getnone;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property right: Integer read _Getright;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property start: Integer read _Getstart;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
    {class} property top: Integer read _Gettop;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$id')]
  JR_id_066 = interface(JObject)
  ['{80DEAB6D-6E62-4857-8602-F6C141E131CF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_066 = class(TJavaGenericImport<JR_id_066Class, JR_id_066>) end;

  JR_integer_067Class = interface(JObjectClass)
  ['{6B8CEDF6-7813-4EDD-9009-DFFE9ABC2D15}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer_067; cdecl;

    { static Property }
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$integer')]
  JR_integer_067 = interface(JObject)
  ['{9F4BA7EC-B725-46FA-B337-CF7160002FFA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_067 = class(TJavaGenericImport<JR_integer_067Class, JR_integer_067>) end;

  JR_layout_068Class = interface(JObjectClass)
  ['{B06BEF95-EB83-4435-998F-6E147785FCF1}']
    { static Property Methods }
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_068; cdecl;

    { static Property }
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$layout')]
  JR_layout_068 = interface(JObject)
  ['{218F9557-0783-43D8-9AC7-06114D88AF32}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_068 = class(TJavaGenericImport<JR_layout_068Class, JR_layout_068>) end;

  JR_mipmap_069Class = interface(JObjectClass)
  ['{2414AB9E-C86C-4F54-AF4F-7AF097F9D7F9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_mipmap_069; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/recyclerview/R$mipmap')]
  JR_mipmap_069 = interface(JObject)
  ['{4900891C-B1FD-46FC-8A13-CD7FB9C4134F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_069 = class(TJavaGenericImport<JR_mipmap_069Class, JR_mipmap_069>) end;

  JR_string_070Class = interface(JObjectClass)
  ['{32781037-D067-4C4F-BE7E-03E5E60CE72D}']
    { static Property Methods }
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string_070; cdecl;

    { static Property }
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$string')]
  JR_string_070 = interface(JObject)
  ['{E09E35BC-3AE2-4C4C-9FE3-75B230271441}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_070 = class(TJavaGenericImport<JR_string_070Class, JR_string_070>) end;

  JR_style_071Class = interface(JObjectClass)
  ['{89E7114F-EC64-4029-BDE7-6ECBB90DCA3D}']
    { static Property Methods }
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Support_CoordinatorLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_071; cdecl;

    { static Property }
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
    {class} property Widget_Support_CoordinatorLayout: Integer read _GetWidget_Support_CoordinatorLayout;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$style')]
  JR_style_071 = interface(JObject)
  ['{5A516DCB-E7A8-4506-8F0C-D6AE7E6B0ABE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_071 = class(TJavaGenericImport<JR_style_071Class, JR_style_071>) end;

  JR_styleable_072Class = interface(JObjectClass)
  ['{952D4B0C-C8B6-467A-BB7C-0898F693D93C}']
    { static Property Methods }
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_keylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_statusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_android_descendantFocusability: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_android_orientation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollEnabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollHorizontalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollHorizontalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollVerticalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollVerticalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_layoutManager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_reverseLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_spanCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_stackFromEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_072; cdecl;

    { static Property }
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property CoordinatorLayout: TJavaArray<Integer> read _GetCoordinatorLayout;
    {class} property CoordinatorLayout_keylines: Integer read _GetCoordinatorLayout_keylines;
    {class} property CoordinatorLayout_statusBarBackground: Integer read _GetCoordinatorLayout_statusBarBackground;
    {class} property CoordinatorLayout_Layout: TJavaArray<Integer> read _GetCoordinatorLayout_Layout;
    {class} property CoordinatorLayout_Layout_android_layout_gravity: Integer read _GetCoordinatorLayout_Layout_android_layout_gravity;
    {class} property CoordinatorLayout_Layout_layout_anchor: Integer read _GetCoordinatorLayout_Layout_layout_anchor;
    {class} property CoordinatorLayout_Layout_layout_anchorGravity: Integer read _GetCoordinatorLayout_Layout_layout_anchorGravity;
    {class} property CoordinatorLayout_Layout_layout_behavior: Integer read _GetCoordinatorLayout_Layout_layout_behavior;
    {class} property CoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer read _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges;
    {class} property CoordinatorLayout_Layout_layout_insetEdge: Integer read _GetCoordinatorLayout_Layout_layout_insetEdge;
    {class} property CoordinatorLayout_Layout_layout_keyline: Integer read _GetCoordinatorLayout_Layout_layout_keyline;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
    {class} property RecyclerView: TJavaArray<Integer> read _GetRecyclerView;
    {class} property RecyclerView_android_descendantFocusability: Integer read _GetRecyclerView_android_descendantFocusability;
    {class} property RecyclerView_android_orientation: Integer read _GetRecyclerView_android_orientation;
    {class} property RecyclerView_fastScrollEnabled: Integer read _GetRecyclerView_fastScrollEnabled;
    {class} property RecyclerView_fastScrollHorizontalThumbDrawable: Integer read _GetRecyclerView_fastScrollHorizontalThumbDrawable;
    {class} property RecyclerView_fastScrollHorizontalTrackDrawable: Integer read _GetRecyclerView_fastScrollHorizontalTrackDrawable;
    {class} property RecyclerView_fastScrollVerticalThumbDrawable: Integer read _GetRecyclerView_fastScrollVerticalThumbDrawable;
    {class} property RecyclerView_fastScrollVerticalTrackDrawable: Integer read _GetRecyclerView_fastScrollVerticalTrackDrawable;
    {class} property RecyclerView_layoutManager: Integer read _GetRecyclerView_layoutManager;
    {class} property RecyclerView_reverseLayout: Integer read _GetRecyclerView_reverseLayout;
    {class} property RecyclerView_spanCount: Integer read _GetRecyclerView_spanCount;
    {class} property RecyclerView_stackFromEnd: Integer read _GetRecyclerView_stackFromEnd;
  end;

  [JavaSignature('android/support/v7/recyclerview/R$styleable')]
  JR_styleable_072 = interface(JObject)
  ['{5262B84C-ADEA-43E4-A470-F9CAE93E50A1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_072 = class(TJavaGenericImport<JR_styleable_072Class, JR_styleable_072>) end;

  JR_xml_073Class = interface(JObjectClass)
  ['{09BDD355-53A7-44D8-910C-4DA27F7BCC32}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_073; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/recyclerview/R$xml')]
  JR_xml_073 = interface(JObject)
  ['{94049DA6-1B97-4DE9-9C2E-DEA9FABD3A6A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_073 = class(TJavaGenericImport<JR_xml_073Class, JR_xml_073>) end;

  JR_074Class = interface(JObjectClass)
  ['{757275FA-4C4A-4EAC-9288-24BAC7C34B46}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_074; cdecl;

    { static Property }
  end;

  [JavaSignature('android/support/v7/recyclerview/R')]
  JR_074 = interface(JObject)
  ['{393C44B8-3964-4672-A9BF-3DCF5CD417F9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_074 = class(TJavaGenericImport<JR_074Class, JR_074>) end;

  JR_anim_075Class = interface(JObjectClass)
  ['{108498F5-2AF3-461A-8C48-A90E9E50CB3C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim_075; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$anim')]
  JR_anim_075 = interface(JObject)
  ['{C306D8B3-24EA-44C1-9AF0-31AC00DB37E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_075 = class(TJavaGenericImport<JR_anim_075Class, JR_anim_075>) end;

  JR_attr_076Class = interface(JObjectClass)
  ['{7BBCBA7A-780F-4BC2-8768-CC71AE0281CC}']
    { static Property Methods }
    {class} function _Getqrcv_animTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_barCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_barcodeRectHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_borderColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_borderSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerDisplayType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_customGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_customScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isAutoZoom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isBarcode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isOnlyDecodeScanBoxArea: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isScanLineReverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowDefaultGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowDefaultScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowLocationPoint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowTipBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowTipTextAsSingleLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isTipTextBelowRect: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_maskColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_qrCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_rectWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_toolbarHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_topOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_verticalBias: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_076; cdecl;

    { static Property }
    {class} property qrcv_animTime: Integer read _Getqrcv_animTime;
    {class} property qrcv_barCodeTipText: Integer read _Getqrcv_barCodeTipText;
    {class} property qrcv_barcodeRectHeight: Integer read _Getqrcv_barcodeRectHeight;
    {class} property qrcv_borderColor: Integer read _Getqrcv_borderColor;
    {class} property qrcv_borderSize: Integer read _Getqrcv_borderSize;
    {class} property qrcv_cornerColor: Integer read _Getqrcv_cornerColor;
    {class} property qrcv_cornerDisplayType: Integer read _Getqrcv_cornerDisplayType;
    {class} property qrcv_cornerLength: Integer read _Getqrcv_cornerLength;
    {class} property qrcv_cornerSize: Integer read _Getqrcv_cornerSize;
    {class} property qrcv_customGridScanLineDrawable: Integer read _Getqrcv_customGridScanLineDrawable;
    {class} property qrcv_customScanLineDrawable: Integer read _Getqrcv_customScanLineDrawable;
    {class} property qrcv_isAutoZoom: Integer read _Getqrcv_isAutoZoom;
    {class} property qrcv_isBarcode: Integer read _Getqrcv_isBarcode;
    {class} property qrcv_isOnlyDecodeScanBoxArea: Integer read _Getqrcv_isOnlyDecodeScanBoxArea;
    {class} property qrcv_isScanLineReverse: Integer read _Getqrcv_isScanLineReverse;
    {class} property qrcv_isShowDefaultGridScanLineDrawable: Integer read _Getqrcv_isShowDefaultGridScanLineDrawable;
    {class} property qrcv_isShowDefaultScanLineDrawable: Integer read _Getqrcv_isShowDefaultScanLineDrawable;
    {class} property qrcv_isShowLocationPoint: Integer read _Getqrcv_isShowLocationPoint;
    {class} property qrcv_isShowTipBackground: Integer read _Getqrcv_isShowTipBackground;
    {class} property qrcv_isShowTipTextAsSingleLine: Integer read _Getqrcv_isShowTipTextAsSingleLine;
    {class} property qrcv_isTipTextBelowRect: Integer read _Getqrcv_isTipTextBelowRect;
    {class} property qrcv_maskColor: Integer read _Getqrcv_maskColor;
    {class} property qrcv_qrCodeTipText: Integer read _Getqrcv_qrCodeTipText;
    {class} property qrcv_rectWidth: Integer read _Getqrcv_rectWidth;
    {class} property qrcv_scanLineColor: Integer read _Getqrcv_scanLineColor;
    {class} property qrcv_scanLineMargin: Integer read _Getqrcv_scanLineMargin;
    {class} property qrcv_scanLineSize: Integer read _Getqrcv_scanLineSize;
    {class} property qrcv_tipBackgroundColor: Integer read _Getqrcv_tipBackgroundColor;
    {class} property qrcv_tipTextColor: Integer read _Getqrcv_tipTextColor;
    {class} property qrcv_tipTextMargin: Integer read _Getqrcv_tipTextMargin;
    {class} property qrcv_tipTextSize: Integer read _Getqrcv_tipTextSize;
    {class} property qrcv_toolbarHeight: Integer read _Getqrcv_toolbarHeight;
    {class} property qrcv_topOffset: Integer read _Getqrcv_topOffset;
    {class} property qrcv_verticalBias: Integer read _Getqrcv_verticalBias;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$attr')]
  JR_attr_076 = interface(JObject)
  ['{1D9F1F04-9691-4328-8E14-7EF599FBA6FF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_076 = class(TJavaGenericImport<JR_attr_076Class, JR_attr_076>) end;

  JR_bool_077Class = interface(JObjectClass)
  ['{54BC449A-2617-4A52-A058-D8F6FFC1AB88}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool_077; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$bool')]
  JR_bool_077 = interface(JObject)
  ['{D385DC27-D44C-4BC8-8024-DCBA79DCD4BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_077 = class(TJavaGenericImport<JR_bool_077Class, JR_bool_077>) end;

  JR_color_078Class = interface(JObjectClass)
  ['{B3DFC0F0-E00C-42E0-B8F2-88BAC83B22C1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_color_078; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$color')]
  JR_color_078 = interface(JObject)
  ['{4F338BA2-3B8C-48AB-8A17-5C7F2DA8D4C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_078 = class(TJavaGenericImport<JR_color_078Class, JR_color_078>) end;

  JR_dimen_079Class = interface(JObjectClass)
  ['{01001FEF-8E67-46E9-B26F-778AC7E45C3F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_dimen_079; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$dimen')]
  JR_dimen_079 = interface(JObject)
  ['{5BDF0EAB-D6A8-42AC-8E3B-FC88C9CB2857}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_079 = class(TJavaGenericImport<JR_dimen_079Class, JR_dimen_079>) end;

  JR_drawable_080Class = interface(JObjectClass)
  ['{BB0C793A-5D62-49A2-BB1C-6AADF183A601}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_drawable_080; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$drawable')]
  JR_drawable_080 = interface(JObject)
  ['{36BC27B0-136F-42D2-87D5-012402564BF7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_080 = class(TJavaGenericImport<JR_drawable_080Class, JR_drawable_080>) end;

  JR_id_081Class = interface(JObjectClass)
  ['{FB513F46-C136-429E-A515-9B92B599FDD2}']
    { static Property Methods }
    {class} function _Getbgaqrcode_camera_preview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcenter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinside: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_081; cdecl;

    { static Property }
    {class} property bgaqrcode_camera_preview: Integer read _Getbgaqrcode_camera_preview;
    {class} property center: Integer read _Getcenter;
    {class} property inside: Integer read _Getinside;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$id')]
  JR_id_081 = interface(JObject)
  ['{7FF8762D-DCCF-46A6-AC5F-FB2FBAFEE6F5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_081 = class(TJavaGenericImport<JR_id_081Class, JR_id_081>) end;

  JR_integer_082Class = interface(JObjectClass)
  ['{B78F0DBA-8A0F-44E3-BDC9-42C95AA0660D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_integer_082; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$integer')]
  JR_integer_082 = interface(JObject)
  ['{57FA5178-5B61-4840-83F2-175B1C40AAB5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_082 = class(TJavaGenericImport<JR_integer_082Class, JR_integer_082>) end;

  JR_layout_083Class = interface(JObjectClass)
  ['{651144EA-77A4-4DCA-B4DF-BC1575643506}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_layout_083; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$layout')]
  JR_layout_083 = interface(JObject)
  ['{0E9AB229-C256-447A-8281-52831C6F873A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_083 = class(TJavaGenericImport<JR_layout_083Class, JR_layout_083>) end;

  JR_mipmap_084Class = interface(JObjectClass)
  ['{B7776C8D-F030-4535-9AC8-21DBE251ECF3}']
    { static Property Methods }
    {class} function _Getqrcode_default_grid_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcode_default_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_mipmap_084; cdecl;

    { static Property }
    {class} property qrcode_default_grid_scan_line: Integer read _Getqrcode_default_grid_scan_line;
    {class} property qrcode_default_scan_line: Integer read _Getqrcode_default_scan_line;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$mipmap')]
  JR_mipmap_084 = interface(JObject)
  ['{831432C4-E54E-4C5A-AE38-74F832FD8243}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_084 = class(TJavaGenericImport<JR_mipmap_084Class, JR_mipmap_084>) end;

  JR_string_085Class = interface(JObjectClass)
  ['{EF689DF1-D6FC-4EBE-BFA8-30324159405A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_string_085; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$string')]
  JR_string_085 = interface(JObject)
  ['{04478B8D-35BD-45F4-A793-508F5FAE0FE4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_085 = class(TJavaGenericImport<JR_string_085Class, JR_string_085>) end;

  JR_style_086Class = interface(JObjectClass)
  ['{3A7F6B34-4F4E-4FE9-8705-C9B1A7DF15EF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_style_086; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$style')]
  JR_style_086 = interface(JObject)
  ['{2E20E1AA-6E8E-4418-A23B-8D80BA25AB73}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_086 = class(TJavaGenericImport<JR_style_086Class, JR_style_086>) end;

  JR_styleable_087Class = interface(JObjectClass)
  ['{5D24C353-A797-415F-B23D-F5C89EE9F9F3}']
    { static Property Methods }
    {class} function _GetQRCodeView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_animTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_barCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_barcodeRectHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_borderColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_borderSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerDisplayType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_customGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_customScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isAutoZoom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isBarcode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isOnlyDecodeScanBoxArea: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isScanLineReverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowDefaultGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowDefaultScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowLocationPoint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowTipBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowTipTextAsSingleLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isTipTextBelowRect: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_maskColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_qrCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_rectWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_toolbarHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_topOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_verticalBias: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_087; cdecl;

    { static Property }
    {class} property QRCodeView: TJavaArray<Integer> read _GetQRCodeView;
    {class} property QRCodeView_qrcv_animTime: Integer read _GetQRCodeView_qrcv_animTime;
    {class} property QRCodeView_qrcv_barCodeTipText: Integer read _GetQRCodeView_qrcv_barCodeTipText;
    {class} property QRCodeView_qrcv_barcodeRectHeight: Integer read _GetQRCodeView_qrcv_barcodeRectHeight;
    {class} property QRCodeView_qrcv_borderColor: Integer read _GetQRCodeView_qrcv_borderColor;
    {class} property QRCodeView_qrcv_borderSize: Integer read _GetQRCodeView_qrcv_borderSize;
    {class} property QRCodeView_qrcv_cornerColor: Integer read _GetQRCodeView_qrcv_cornerColor;
    {class} property QRCodeView_qrcv_cornerDisplayType: Integer read _GetQRCodeView_qrcv_cornerDisplayType;
    {class} property QRCodeView_qrcv_cornerLength: Integer read _GetQRCodeView_qrcv_cornerLength;
    {class} property QRCodeView_qrcv_cornerSize: Integer read _GetQRCodeView_qrcv_cornerSize;
    {class} property QRCodeView_qrcv_customGridScanLineDrawable: Integer read _GetQRCodeView_qrcv_customGridScanLineDrawable;
    {class} property QRCodeView_qrcv_customScanLineDrawable: Integer read _GetQRCodeView_qrcv_customScanLineDrawable;
    {class} property QRCodeView_qrcv_isAutoZoom: Integer read _GetQRCodeView_qrcv_isAutoZoom;
    {class} property QRCodeView_qrcv_isBarcode: Integer read _GetQRCodeView_qrcv_isBarcode;
    {class} property QRCodeView_qrcv_isOnlyDecodeScanBoxArea: Integer read _GetQRCodeView_qrcv_isOnlyDecodeScanBoxArea;
    {class} property QRCodeView_qrcv_isScanLineReverse: Integer read _GetQRCodeView_qrcv_isScanLineReverse;
    {class} property QRCodeView_qrcv_isShowDefaultGridScanLineDrawable: Integer read _GetQRCodeView_qrcv_isShowDefaultGridScanLineDrawable;
    {class} property QRCodeView_qrcv_isShowDefaultScanLineDrawable: Integer read _GetQRCodeView_qrcv_isShowDefaultScanLineDrawable;
    {class} property QRCodeView_qrcv_isShowLocationPoint: Integer read _GetQRCodeView_qrcv_isShowLocationPoint;
    {class} property QRCodeView_qrcv_isShowTipBackground: Integer read _GetQRCodeView_qrcv_isShowTipBackground;
    {class} property QRCodeView_qrcv_isShowTipTextAsSingleLine: Integer read _GetQRCodeView_qrcv_isShowTipTextAsSingleLine;
    {class} property QRCodeView_qrcv_isTipTextBelowRect: Integer read _GetQRCodeView_qrcv_isTipTextBelowRect;
    {class} property QRCodeView_qrcv_maskColor: Integer read _GetQRCodeView_qrcv_maskColor;
    {class} property QRCodeView_qrcv_qrCodeTipText: Integer read _GetQRCodeView_qrcv_qrCodeTipText;
    {class} property QRCodeView_qrcv_rectWidth: Integer read _GetQRCodeView_qrcv_rectWidth;
    {class} property QRCodeView_qrcv_scanLineColor: Integer read _GetQRCodeView_qrcv_scanLineColor;
    {class} property QRCodeView_qrcv_scanLineMargin: Integer read _GetQRCodeView_qrcv_scanLineMargin;
    {class} property QRCodeView_qrcv_scanLineSize: Integer read _GetQRCodeView_qrcv_scanLineSize;
    {class} property QRCodeView_qrcv_tipBackgroundColor: Integer read _GetQRCodeView_qrcv_tipBackgroundColor;
    {class} property QRCodeView_qrcv_tipTextColor: Integer read _GetQRCodeView_qrcv_tipTextColor;
    {class} property QRCodeView_qrcv_tipTextMargin: Integer read _GetQRCodeView_qrcv_tipTextMargin;
    {class} property QRCodeView_qrcv_tipTextSize: Integer read _GetQRCodeView_qrcv_tipTextSize;
    {class} property QRCodeView_qrcv_toolbarHeight: Integer read _GetQRCodeView_qrcv_toolbarHeight;
    {class} property QRCodeView_qrcv_topOffset: Integer read _GetQRCodeView_qrcv_topOffset;
    {class} property QRCodeView_qrcv_verticalBias: Integer read _GetQRCodeView_qrcv_verticalBias;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$styleable')]
  JR_styleable_087 = interface(JObject)
  ['{877AEBF4-9FDC-4139-9CBF-0579232A2CA1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_087 = class(TJavaGenericImport<JR_styleable_087Class, JR_styleable_087>) end;

  JR_xml_088Class = interface(JObjectClass)
  ['{898E2C0E-C08D-4B54-8BAA-A6EBD1EC337B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_088; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R$xml')]
  JR_xml_088 = interface(JObject)
  ['{C5CD4FD4-55B9-47C1-BA1F-95CDCC1D17DE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_088 = class(TJavaGenericImport<JR_xml_088Class, JR_xml_088>) end;

  JR_089Class = interface(JObjectClass)
  ['{C9243C09-A32B-43E1-A7C2-3FFF68E81FDF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_089; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/core/R')]
  JR_089 = interface(JObject)
  ['{2940F356-3F9F-42D1-9A81-52661DAECD7A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_089 = class(TJavaGenericImport<JR_089Class, JR_089>) end;

  JR_anim_090Class = interface(JObjectClass)
  ['{71312257-44EB-416F-B3F4-CBBB76BB522F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_anim_090; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$anim')]
  JR_anim_090 = interface(JObject)
  ['{8F31F2A3-6CBD-4AD9-A9FB-02F3D8CD2452}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_090 = class(TJavaGenericImport<JR_anim_090Class, JR_anim_090>) end;

  JR_attr_091Class = interface(JObjectClass)
  ['{DFC20A8D-DA33-43D1-B4A0-1386247C3A71}']
    { static Property Methods }
    {class} function _Getqrcv_animTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_barCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_barcodeRectHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_borderColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_borderSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerDisplayType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_cornerSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_customGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_customScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isAutoZoom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isBarcode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isOnlyDecodeScanBoxArea: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isScanLineReverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowDefaultGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowDefaultScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowLocationPoint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowTipBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isShowTipTextAsSingleLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_isTipTextBelowRect: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_maskColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_qrCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_rectWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_scanLineSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_tipTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_toolbarHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_topOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcv_verticalBias: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_091; cdecl;

    { static Property }
    {class} property qrcv_animTime: Integer read _Getqrcv_animTime;
    {class} property qrcv_barCodeTipText: Integer read _Getqrcv_barCodeTipText;
    {class} property qrcv_barcodeRectHeight: Integer read _Getqrcv_barcodeRectHeight;
    {class} property qrcv_borderColor: Integer read _Getqrcv_borderColor;
    {class} property qrcv_borderSize: Integer read _Getqrcv_borderSize;
    {class} property qrcv_cornerColor: Integer read _Getqrcv_cornerColor;
    {class} property qrcv_cornerDisplayType: Integer read _Getqrcv_cornerDisplayType;
    {class} property qrcv_cornerLength: Integer read _Getqrcv_cornerLength;
    {class} property qrcv_cornerSize: Integer read _Getqrcv_cornerSize;
    {class} property qrcv_customGridScanLineDrawable: Integer read _Getqrcv_customGridScanLineDrawable;
    {class} property qrcv_customScanLineDrawable: Integer read _Getqrcv_customScanLineDrawable;
    {class} property qrcv_isAutoZoom: Integer read _Getqrcv_isAutoZoom;
    {class} property qrcv_isBarcode: Integer read _Getqrcv_isBarcode;
    {class} property qrcv_isOnlyDecodeScanBoxArea: Integer read _Getqrcv_isOnlyDecodeScanBoxArea;
    {class} property qrcv_isScanLineReverse: Integer read _Getqrcv_isScanLineReverse;
    {class} property qrcv_isShowDefaultGridScanLineDrawable: Integer read _Getqrcv_isShowDefaultGridScanLineDrawable;
    {class} property qrcv_isShowDefaultScanLineDrawable: Integer read _Getqrcv_isShowDefaultScanLineDrawable;
    {class} property qrcv_isShowLocationPoint: Integer read _Getqrcv_isShowLocationPoint;
    {class} property qrcv_isShowTipBackground: Integer read _Getqrcv_isShowTipBackground;
    {class} property qrcv_isShowTipTextAsSingleLine: Integer read _Getqrcv_isShowTipTextAsSingleLine;
    {class} property qrcv_isTipTextBelowRect: Integer read _Getqrcv_isTipTextBelowRect;
    {class} property qrcv_maskColor: Integer read _Getqrcv_maskColor;
    {class} property qrcv_qrCodeTipText: Integer read _Getqrcv_qrCodeTipText;
    {class} property qrcv_rectWidth: Integer read _Getqrcv_rectWidth;
    {class} property qrcv_scanLineColor: Integer read _Getqrcv_scanLineColor;
    {class} property qrcv_scanLineMargin: Integer read _Getqrcv_scanLineMargin;
    {class} property qrcv_scanLineSize: Integer read _Getqrcv_scanLineSize;
    {class} property qrcv_tipBackgroundColor: Integer read _Getqrcv_tipBackgroundColor;
    {class} property qrcv_tipTextColor: Integer read _Getqrcv_tipTextColor;
    {class} property qrcv_tipTextMargin: Integer read _Getqrcv_tipTextMargin;
    {class} property qrcv_tipTextSize: Integer read _Getqrcv_tipTextSize;
    {class} property qrcv_toolbarHeight: Integer read _Getqrcv_toolbarHeight;
    {class} property qrcv_topOffset: Integer read _Getqrcv_topOffset;
    {class} property qrcv_verticalBias: Integer read _Getqrcv_verticalBias;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$attr')]
  JR_attr_091 = interface(JObject)
  ['{948C03EC-0EC2-425E-849D-5DAD42CEF5D8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_091 = class(TJavaGenericImport<JR_attr_091Class, JR_attr_091>) end;

  JR_bool_092Class = interface(JObjectClass)
  ['{8E4B739A-212F-4A79-B77D-B8A2D412D2BB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_bool_092; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$bool')]
  JR_bool_092 = interface(JObject)
  ['{BAEE343D-D0A6-466F-842C-D5A6E4F5ABA4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_092 = class(TJavaGenericImport<JR_bool_092Class, JR_bool_092>) end;

  JR_color_093Class = interface(JObjectClass)
  ['{F33E9713-227A-44BA-BB56-D508547DFE6E}']
    { static Property Methods }
    {class} function _GetcolorPrimary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimaryDark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimaryDarkTrans: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationBarColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_093; cdecl;

    { static Property }
    {class} property colorPrimary: Integer read _GetcolorPrimary;
    {class} property colorPrimaryDark: Integer read _GetcolorPrimaryDark;
    {class} property colorPrimaryDarkTrans: Integer read _GetcolorPrimaryDarkTrans;
    {class} property navigationBarColor: Integer read _GetnavigationBarColor;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$color')]
  JR_color_093 = interface(JObject)
  ['{B2D9CC3D-9FDC-44F8-8190-CE392C89EEC6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_093 = class(TJavaGenericImport<JR_color_093Class, JR_color_093>) end;

  JR_dimen_094Class = interface(JObjectClass)
  ['{C63E0166-9223-4AAE-9BFA-ACA394196689}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_dimen_094; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$dimen')]
  JR_dimen_094 = interface(JObject)
  ['{4A957765-F68B-4F72-857F-69EC3DD82F12}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_094 = class(TJavaGenericImport<JR_dimen_094Class, JR_dimen_094>) end;

  JR_drawable_095Class = interface(JObjectClass)
  ['{DFE731FA-0792-426A-A3B6-ED141AA02D1A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_drawable_095; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$drawable')]
  JR_drawable_095 = interface(JObject)
  ['{FB720528-3C9A-4EC4-8681-F5A0B25E4813}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_095 = class(TJavaGenericImport<JR_drawable_095Class, JR_drawable_095>) end;

  JR_id_096Class = interface(JObjectClass)
  ['{2E4F855F-9152-47DB-8BCD-79B6D6DD0A09}']
    { static Property Methods }
    {class} function _Getbgaqrcode_camera_preview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbtnReturn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcenter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinside: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpnlToolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getzbarview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_096; cdecl;

    { static Property }
    {class} property bgaqrcode_camera_preview: Integer read _Getbgaqrcode_camera_preview;
    {class} property btnReturn: Integer read _GetbtnReturn;
    {class} property center: Integer read _Getcenter;
    {class} property inside: Integer read _Getinside;
    {class} property pnlToolbar: Integer read _GetpnlToolbar;
    {class} property zbarview: Integer read _Getzbarview;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$id')]
  JR_id_096 = interface(JObject)
  ['{0BB7AE58-433C-4471-8B92-57C8B3978937}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_096 = class(TJavaGenericImport<JR_id_096Class, JR_id_096>) end;

  JR_integer_097Class = interface(JObjectClass)
  ['{CD112DED-2957-439C-9B7E-814AA48CC7D3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_integer_097; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$integer')]
  JR_integer_097 = interface(JObject)
  ['{F0AD4FE5-2140-4D75-8370-FA52EA9AD7C1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_097 = class(TJavaGenericImport<JR_integer_097Class, JR_integer_097>) end;

  JR_layout_098Class = interface(JObjectClass)
  ['{6F9C86A9-EEA6-430A-B5BF-DA8F7612381E}']
    { static Property Methods }
    {class} function _Getactivity_z_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_098; cdecl;

    { static Property }
    {class} property activity_z_bar: Integer read _Getactivity_z_bar;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$layout')]
  JR_layout_098 = interface(JObject)
  ['{7F5F6B4F-947C-4343-AB5D-49E10981FF79}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_098 = class(TJavaGenericImport<JR_layout_098Class, JR_layout_098>) end;

  JR_mipmap_099Class = interface(JObjectClass)
  ['{90B96EFA-1B4D-4AAF-9A3C-A5898BD075A1}']
    { static Property Methods }
    {class} function _Getcustom_grid_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcustom_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcode_default_grid_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getqrcode_default_scan_line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_mipmap_099; cdecl;

    { static Property }
    {class} property custom_grid_scan_line: Integer read _Getcustom_grid_scan_line;
    {class} property custom_scan_line: Integer read _Getcustom_scan_line;
    {class} property qrcode_default_grid_scan_line: Integer read _Getqrcode_default_grid_scan_line;
    {class} property qrcode_default_scan_line: Integer read _Getqrcode_default_scan_line;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$mipmap')]
  JR_mipmap_099 = interface(JObject)
  ['{C5A58ADD-02D9-47F4-B340-DD253B7C52D9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_099 = class(TJavaGenericImport<JR_mipmap_099Class, JR_mipmap_099>) end;

  JR_string_100Class = interface(JObjectClass)
  ['{EF6560BC-6F9F-428A-946C-9DD8419EBC0E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_string_100; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$string')]
  JR_string_100 = interface(JObject)
  ['{D8012183-4750-45C9-A494-30F2264BBB92}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_100 = class(TJavaGenericImport<JR_string_100Class, JR_string_100>) end;

  JR_style_101Class = interface(JObjectClass)
  ['{4AAC5A83-E4BF-4441-9B97-7887268C792B}']
    { static Property Methods }
    {class} function _GetAutoMatch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAutoMatch_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAutoMatch_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAutoWrap: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAutoWrap_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAutoWrap_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchAuto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchAuto_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchAuto_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchMatch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchMatch_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchMatch_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchOne: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchWrap: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchWrap_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMatchWrap_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOneMatch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapAuto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapAuto_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapAuto_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapMatch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapMatch_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapMatch_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapWrap: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapWrap_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWrapWrap_Vertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_101; cdecl;

    { static Property }
    {class} property AutoMatch: Integer read _GetAutoMatch;
    {class} property AutoMatch_Horizontal: Integer read _GetAutoMatch_Horizontal;
    {class} property AutoMatch_Vertical: Integer read _GetAutoMatch_Vertical;
    {class} property AutoWrap: Integer read _GetAutoWrap;
    {class} property AutoWrap_Horizontal: Integer read _GetAutoWrap_Horizontal;
    {class} property AutoWrap_Vertical: Integer read _GetAutoWrap_Vertical;
    {class} property MatchAuto: Integer read _GetMatchAuto;
    {class} property MatchAuto_Horizontal: Integer read _GetMatchAuto_Horizontal;
    {class} property MatchAuto_Vertical: Integer read _GetMatchAuto_Vertical;
    {class} property MatchMatch: Integer read _GetMatchMatch;
    {class} property MatchMatch_Horizontal: Integer read _GetMatchMatch_Horizontal;
    {class} property MatchMatch_Vertical: Integer read _GetMatchMatch_Vertical;
    {class} property MatchOne: Integer read _GetMatchOne;
    {class} property MatchWrap: Integer read _GetMatchWrap;
    {class} property MatchWrap_Horizontal: Integer read _GetMatchWrap_Horizontal;
    {class} property MatchWrap_Vertical: Integer read _GetMatchWrap_Vertical;
    {class} property OneMatch: Integer read _GetOneMatch;
    {class} property WrapAuto: Integer read _GetWrapAuto;
    {class} property WrapAuto_Horizontal: Integer read _GetWrapAuto_Horizontal;
    {class} property WrapAuto_Vertical: Integer read _GetWrapAuto_Vertical;
    {class} property WrapMatch: Integer read _GetWrapMatch;
    {class} property WrapMatch_Horizontal: Integer read _GetWrapMatch_Horizontal;
    {class} property WrapMatch_Vertical: Integer read _GetWrapMatch_Vertical;
    {class} property WrapWrap: Integer read _GetWrapWrap;
    {class} property WrapWrap_Horizontal: Integer read _GetWrapWrap_Horizontal;
    {class} property WrapWrap_Vertical: Integer read _GetWrapWrap_Vertical;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$style')]
  JR_style_101 = interface(JObject)
  ['{84C1165B-E786-4AE4-AC01-BB52C4639F2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_101 = class(TJavaGenericImport<JR_style_101Class, JR_style_101>) end;

  JR_styleable_102Class = interface(JObjectClass)
  ['{1879A51C-3694-407F-B124-CCE181DBB71D}']
    { static Property Methods }
    {class} function _GetQRCodeView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_animTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_barCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_barcodeRectHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_borderColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_borderSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerDisplayType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_cornerSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_customGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_customScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isAutoZoom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isBarcode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isOnlyDecodeScanBoxArea: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isScanLineReverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowDefaultGridScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowDefaultScanLineDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowLocationPoint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowTipBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isShowTipTextAsSingleLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_isTipTextBelowRect: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_maskColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_qrCodeTipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_rectWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_scanLineSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_tipTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_toolbarHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_topOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCodeView_qrcv_verticalBias: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_102; cdecl;

    { static Property }
    {class} property QRCodeView: TJavaArray<Integer> read _GetQRCodeView;
    {class} property QRCodeView_qrcv_animTime: Integer read _GetQRCodeView_qrcv_animTime;
    {class} property QRCodeView_qrcv_barCodeTipText: Integer read _GetQRCodeView_qrcv_barCodeTipText;
    {class} property QRCodeView_qrcv_barcodeRectHeight: Integer read _GetQRCodeView_qrcv_barcodeRectHeight;
    {class} property QRCodeView_qrcv_borderColor: Integer read _GetQRCodeView_qrcv_borderColor;
    {class} property QRCodeView_qrcv_borderSize: Integer read _GetQRCodeView_qrcv_borderSize;
    {class} property QRCodeView_qrcv_cornerColor: Integer read _GetQRCodeView_qrcv_cornerColor;
    {class} property QRCodeView_qrcv_cornerDisplayType: Integer read _GetQRCodeView_qrcv_cornerDisplayType;
    {class} property QRCodeView_qrcv_cornerLength: Integer read _GetQRCodeView_qrcv_cornerLength;
    {class} property QRCodeView_qrcv_cornerSize: Integer read _GetQRCodeView_qrcv_cornerSize;
    {class} property QRCodeView_qrcv_customGridScanLineDrawable: Integer read _GetQRCodeView_qrcv_customGridScanLineDrawable;
    {class} property QRCodeView_qrcv_customScanLineDrawable: Integer read _GetQRCodeView_qrcv_customScanLineDrawable;
    {class} property QRCodeView_qrcv_isAutoZoom: Integer read _GetQRCodeView_qrcv_isAutoZoom;
    {class} property QRCodeView_qrcv_isBarcode: Integer read _GetQRCodeView_qrcv_isBarcode;
    {class} property QRCodeView_qrcv_isOnlyDecodeScanBoxArea: Integer read _GetQRCodeView_qrcv_isOnlyDecodeScanBoxArea;
    {class} property QRCodeView_qrcv_isScanLineReverse: Integer read _GetQRCodeView_qrcv_isScanLineReverse;
    {class} property QRCodeView_qrcv_isShowDefaultGridScanLineDrawable: Integer read _GetQRCodeView_qrcv_isShowDefaultGridScanLineDrawable;
    {class} property QRCodeView_qrcv_isShowDefaultScanLineDrawable: Integer read _GetQRCodeView_qrcv_isShowDefaultScanLineDrawable;
    {class} property QRCodeView_qrcv_isShowLocationPoint: Integer read _GetQRCodeView_qrcv_isShowLocationPoint;
    {class} property QRCodeView_qrcv_isShowTipBackground: Integer read _GetQRCodeView_qrcv_isShowTipBackground;
    {class} property QRCodeView_qrcv_isShowTipTextAsSingleLine: Integer read _GetQRCodeView_qrcv_isShowTipTextAsSingleLine;
    {class} property QRCodeView_qrcv_isTipTextBelowRect: Integer read _GetQRCodeView_qrcv_isTipTextBelowRect;
    {class} property QRCodeView_qrcv_maskColor: Integer read _GetQRCodeView_qrcv_maskColor;
    {class} property QRCodeView_qrcv_qrCodeTipText: Integer read _GetQRCodeView_qrcv_qrCodeTipText;
    {class} property QRCodeView_qrcv_rectWidth: Integer read _GetQRCodeView_qrcv_rectWidth;
    {class} property QRCodeView_qrcv_scanLineColor: Integer read _GetQRCodeView_qrcv_scanLineColor;
    {class} property QRCodeView_qrcv_scanLineMargin: Integer read _GetQRCodeView_qrcv_scanLineMargin;
    {class} property QRCodeView_qrcv_scanLineSize: Integer read _GetQRCodeView_qrcv_scanLineSize;
    {class} property QRCodeView_qrcv_tipBackgroundColor: Integer read _GetQRCodeView_qrcv_tipBackgroundColor;
    {class} property QRCodeView_qrcv_tipTextColor: Integer read _GetQRCodeView_qrcv_tipTextColor;
    {class} property QRCodeView_qrcv_tipTextMargin: Integer read _GetQRCodeView_qrcv_tipTextMargin;
    {class} property QRCodeView_qrcv_tipTextSize: Integer read _GetQRCodeView_qrcv_tipTextSize;
    {class} property QRCodeView_qrcv_toolbarHeight: Integer read _GetQRCodeView_qrcv_toolbarHeight;
    {class} property QRCodeView_qrcv_topOffset: Integer read _GetQRCodeView_qrcv_topOffset;
    {class} property QRCodeView_qrcv_verticalBias: Integer read _GetQRCodeView_qrcv_verticalBias;
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$styleable')]
  JR_styleable_102 = interface(JObject)
  ['{EA03B2E1-2534-41F5-A43F-191512A5DD17}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_102 = class(TJavaGenericImport<JR_styleable_102Class, JR_styleable_102>) end;

  JR_xml_103Class = interface(JObjectClass)
  ['{62864F9F-1148-4DFC-9317-9E92378F1863}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_xml_103; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R$xml')]
  JR_xml_103 = interface(JObject)
  ['{D75A1CC6-477C-4877-BB7D-E13F1596E8C8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_103 = class(TJavaGenericImport<JR_xml_103Class, JR_xml_103>) end;

  JR_104Class = interface(JObjectClass)
  ['{8C29E471-C842-4D33-9D89-572249A51FF5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_104; cdecl;

    { static Property }
  end;

  [JavaSignature('cn/bingoogolapple/qrcode/zbar/R')]
  JR_104 = interface(JObject)
  ['{069D239D-9621-4014-BE38-D399D6814E04}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_104 = class(TJavaGenericImport<JR_104Class, JR_104>) end;

  JR_anim_105Class = interface(JObjectClass)
  ['{9FFFC982-7000-47C9-8686-C0A3AA4FA8E3}']
    { static Property Methods }
    {class} function _Getabc_fade_in: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_fade_out: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_grow_fade_in_from_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_enter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_exit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shrink_fade_out_from_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_in_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_in_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_out_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_slide_out_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip_enter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip_exit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getanim_hidden_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getanim_show_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getenter_from_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getenter_from_left: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getenter_from_right: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getenter_from_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getout_to_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getout_to_left: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getout_to_right: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getout_to_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_anim_105; cdecl;

    { static Property }
    {class} property abc_fade_in: Integer read _Getabc_fade_in;
    {class} property abc_fade_out: Integer read _Getabc_fade_out;
    {class} property abc_grow_fade_in_from_bottom: Integer read _Getabc_grow_fade_in_from_bottom;
    {class} property abc_popup_enter: Integer read _Getabc_popup_enter;
    {class} property abc_popup_exit: Integer read _Getabc_popup_exit;
    {class} property abc_shrink_fade_out_from_bottom: Integer read _Getabc_shrink_fade_out_from_bottom;
    {class} property abc_slide_in_bottom: Integer read _Getabc_slide_in_bottom;
    {class} property abc_slide_in_top: Integer read _Getabc_slide_in_top;
    {class} property abc_slide_out_bottom: Integer read _Getabc_slide_out_bottom;
    {class} property abc_slide_out_top: Integer read _Getabc_slide_out_top;
    {class} property abc_tooltip_enter: Integer read _Getabc_tooltip_enter;
    {class} property abc_tooltip_exit: Integer read _Getabc_tooltip_exit;
    {class} property anim_hidden_alpha: Integer read _Getanim_hidden_alpha;
    {class} property anim_show_alpha: Integer read _Getanim_show_alpha;
    {class} property enter_from_bottom: Integer read _Getenter_from_bottom;
    {class} property enter_from_left: Integer read _Getenter_from_left;
    {class} property enter_from_right: Integer read _Getenter_from_right;
    {class} property enter_from_top: Integer read _Getenter_from_top;
    {class} property out_to_bottom: Integer read _Getout_to_bottom;
    {class} property out_to_left: Integer read _Getout_to_left;
    {class} property out_to_right: Integer read _Getout_to_right;
    {class} property out_to_top: Integer read _Getout_to_top;
  end;

  [JavaSignature('com/devil/library/media/R$anim')]
  JR_anim_105 = interface(JObject)
  ['{880E407E-3CAA-44D0-8AA1-9E41BB9D941F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_anim_105 = class(TJavaGenericImport<JR_anim_105Class, JR_anim_105>) end;

  JR_attr_106Class = interface(JObjectClass)
  ['{5CA11E51-D6A9-4675-9964-F9FE51D7A2FE}']
    { static Property Methods }
    {class} function _GetactionBarDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarPopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarSplitStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTabTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionBarWidgetTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionDropDownStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionMenuTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionMenuTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCloseButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCloseDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCopyDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeCutDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeFindDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModePasteDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModePopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeSelectAllDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeShareDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeSplitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionModeWebSearchDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionOverflowButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionOverflowMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionProviderClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactionViewClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetactivityChooserViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogButtonGroupStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogCenterButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertDialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetallowStacking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getalpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalphabeticModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetarrowHeadLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetarrowShaftLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoCompleteTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeMaxTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeMinTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizePresetSizes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeStepGranularity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetautoSizeTextType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundStacked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbackgroundTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbarLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetborderlessButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarNegativeButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarNeutralButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarPositiveButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonIconDimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonPanelSideLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcheckboxStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcheckedTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcloseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcloseItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcollapseContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcollapseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcolor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorAccent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorBackgroundFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorButtonNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlActivated: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlHighlight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorControlNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorPrimaryDark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcolorSwitchThumbNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcommitIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontrolBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcoordinatorLayoutStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcustomNavigationLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdefaultQueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogCornerRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogPreferredPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdisplayOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerHorizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdividerVertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdrawableSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdrawerArrowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdropDownListViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdropdownListPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getduration_max: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeteditTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getelevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetexpandActivityOverflowButtonDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollEnabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollHorizontalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollHorizontalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollVerticalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfastScrollVerticalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfirstBaselineToTopHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfont: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetgapBetweenBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetgoIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethideOnContentScroll: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethomeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GethomeLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonSrc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GeticonifiedByDefault: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetimageButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetindeterminateProgressStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetinitialActivityCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetisLightTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetitemPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getkeylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlastBaselineToBottomHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlayoutManager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlayout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlineHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistChoiceBackgroundIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistDividerAlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistMenuViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeightLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemHeightSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemPaddingLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistPreferredItemPaddingRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlogo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlogoDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmaxButtonHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmeasureWithLargestChild: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmultiChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnavigationMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetnumericModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetoverlapAnchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingBottomNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpaddingTopNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelMenuListTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpanelMenuListWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetpreserveIconSpacing: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetprogressBarPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetprogressBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetqueryBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetqueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetradioButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyleIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetratingBarStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getratio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreverseLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchHintIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsearchViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetseekBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetselectableItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetselectableItemBackgroundBorderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowAsAction: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowDividers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetshowTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsingleChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspanCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinnerDropDownItemStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetspinnerStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsplitTrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsrcCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstackFromEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstate_above_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetstatusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubMenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubmitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsubtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsuggestionRowLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchMinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetswitchTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceLargePopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItemSecondary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceListItemSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearancePopupMenuHeader: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSearchResultSubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSearchResultTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextAppearanceSmallPopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextColorAlertDialogListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextColorSearchUrl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getthickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTextPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetthumbTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMarkTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettickMarkTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMarginTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleMargins: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettoolbarNavigationButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettoolbarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipForegroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipFrameBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettooltipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettrackTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettrackTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetviewInflaterClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetvoiceIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionBarOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowActionModeOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedHeightMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedHeightMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowFixedWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowMinWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowMinWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetwindowNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_attr_106; cdecl;

    { static Property }
    {class} property actionBarDivider: Integer read _GetactionBarDivider;
    {class} property actionBarItemBackground: Integer read _GetactionBarItemBackground;
    {class} property actionBarPopupTheme: Integer read _GetactionBarPopupTheme;
    {class} property actionBarSize: Integer read _GetactionBarSize;
    {class} property actionBarSplitStyle: Integer read _GetactionBarSplitStyle;
    {class} property actionBarStyle: Integer read _GetactionBarStyle;
    {class} property actionBarTabBarStyle: Integer read _GetactionBarTabBarStyle;
    {class} property actionBarTabStyle: Integer read _GetactionBarTabStyle;
    {class} property actionBarTabTextStyle: Integer read _GetactionBarTabTextStyle;
    {class} property actionBarTheme: Integer read _GetactionBarTheme;
    {class} property actionBarWidgetTheme: Integer read _GetactionBarWidgetTheme;
    {class} property actionButtonStyle: Integer read _GetactionButtonStyle;
    {class} property actionDropDownStyle: Integer read _GetactionDropDownStyle;
    {class} property actionLayout: Integer read _GetactionLayout;
    {class} property actionMenuTextAppearance: Integer read _GetactionMenuTextAppearance;
    {class} property actionMenuTextColor: Integer read _GetactionMenuTextColor;
    {class} property actionModeBackground: Integer read _GetactionModeBackground;
    {class} property actionModeCloseButtonStyle: Integer read _GetactionModeCloseButtonStyle;
    {class} property actionModeCloseDrawable: Integer read _GetactionModeCloseDrawable;
    {class} property actionModeCopyDrawable: Integer read _GetactionModeCopyDrawable;
    {class} property actionModeCutDrawable: Integer read _GetactionModeCutDrawable;
    {class} property actionModeFindDrawable: Integer read _GetactionModeFindDrawable;
    {class} property actionModePasteDrawable: Integer read _GetactionModePasteDrawable;
    {class} property actionModePopupWindowStyle: Integer read _GetactionModePopupWindowStyle;
    {class} property actionModeSelectAllDrawable: Integer read _GetactionModeSelectAllDrawable;
    {class} property actionModeShareDrawable: Integer read _GetactionModeShareDrawable;
    {class} property actionModeSplitBackground: Integer read _GetactionModeSplitBackground;
    {class} property actionModeStyle: Integer read _GetactionModeStyle;
    {class} property actionModeWebSearchDrawable: Integer read _GetactionModeWebSearchDrawable;
    {class} property actionOverflowButtonStyle: Integer read _GetactionOverflowButtonStyle;
    {class} property actionOverflowMenuStyle: Integer read _GetactionOverflowMenuStyle;
    {class} property actionProviderClass: Integer read _GetactionProviderClass;
    {class} property actionViewClass: Integer read _GetactionViewClass;
    {class} property activityChooserViewStyle: Integer read _GetactivityChooserViewStyle;
    {class} property alertDialogButtonGroupStyle: Integer read _GetalertDialogButtonGroupStyle;
    {class} property alertDialogCenterButtons: Integer read _GetalertDialogCenterButtons;
    {class} property alertDialogStyle: Integer read _GetalertDialogStyle;
    {class} property alertDialogTheme: Integer read _GetalertDialogTheme;
    {class} property allowStacking: Integer read _GetallowStacking;
    {class} property alpha: Integer read _Getalpha;
    {class} property alphabeticModifiers: Integer read _GetalphabeticModifiers;
    {class} property arrowHeadLength: Integer read _GetarrowHeadLength;
    {class} property arrowShaftLength: Integer read _GetarrowShaftLength;
    {class} property autoCompleteTextViewStyle: Integer read _GetautoCompleteTextViewStyle;
    {class} property autoSizeMaxTextSize: Integer read _GetautoSizeMaxTextSize;
    {class} property autoSizeMinTextSize: Integer read _GetautoSizeMinTextSize;
    {class} property autoSizePresetSizes: Integer read _GetautoSizePresetSizes;
    {class} property autoSizeStepGranularity: Integer read _GetautoSizeStepGranularity;
    {class} property autoSizeTextType: Integer read _GetautoSizeTextType;
    {class} property background: Integer read _Getbackground;
    {class} property backgroundSplit: Integer read _GetbackgroundSplit;
    {class} property backgroundStacked: Integer read _GetbackgroundStacked;
    {class} property backgroundTint: Integer read _GetbackgroundTint;
    {class} property backgroundTintMode: Integer read _GetbackgroundTintMode;
    {class} property barLength: Integer read _GetbarLength;
    {class} property borderlessButtonStyle: Integer read _GetborderlessButtonStyle;
    {class} property buttonBarButtonStyle: Integer read _GetbuttonBarButtonStyle;
    {class} property buttonBarNegativeButtonStyle: Integer read _GetbuttonBarNegativeButtonStyle;
    {class} property buttonBarNeutralButtonStyle: Integer read _GetbuttonBarNeutralButtonStyle;
    {class} property buttonBarPositiveButtonStyle: Integer read _GetbuttonBarPositiveButtonStyle;
    {class} property buttonBarStyle: Integer read _GetbuttonBarStyle;
    {class} property buttonGravity: Integer read _GetbuttonGravity;
    {class} property buttonIconDimen: Integer read _GetbuttonIconDimen;
    {class} property buttonPanelSideLayout: Integer read _GetbuttonPanelSideLayout;
    {class} property buttonStyle: Integer read _GetbuttonStyle;
    {class} property buttonStyleSmall: Integer read _GetbuttonStyleSmall;
    {class} property buttonTint: Integer read _GetbuttonTint;
    {class} property buttonTintMode: Integer read _GetbuttonTintMode;
    {class} property checkboxStyle: Integer read _GetcheckboxStyle;
    {class} property checkedTextViewStyle: Integer read _GetcheckedTextViewStyle;
    {class} property closeIcon: Integer read _GetcloseIcon;
    {class} property closeItemLayout: Integer read _GetcloseItemLayout;
    {class} property collapseContentDescription: Integer read _GetcollapseContentDescription;
    {class} property collapseIcon: Integer read _GetcollapseIcon;
    {class} property color: Integer read _Getcolor;
    {class} property colorAccent: Integer read _GetcolorAccent;
    {class} property colorBackgroundFloating: Integer read _GetcolorBackgroundFloating;
    {class} property colorButtonNormal: Integer read _GetcolorButtonNormal;
    {class} property colorControlActivated: Integer read _GetcolorControlActivated;
    {class} property colorControlHighlight: Integer read _GetcolorControlHighlight;
    {class} property colorControlNormal: Integer read _GetcolorControlNormal;
    {class} property colorError: Integer read _GetcolorError;
    {class} property colorPrimary: Integer read _GetcolorPrimary;
    {class} property colorPrimaryDark: Integer read _GetcolorPrimaryDark;
    {class} property colorSwitchThumbNormal: Integer read _GetcolorSwitchThumbNormal;
    {class} property commitIcon: Integer read _GetcommitIcon;
    {class} property contentDescription: Integer read _GetcontentDescription;
    {class} property contentInsetEnd: Integer read _GetcontentInsetEnd;
    {class} property contentInsetEndWithActions: Integer read _GetcontentInsetEndWithActions;
    {class} property contentInsetLeft: Integer read _GetcontentInsetLeft;
    {class} property contentInsetRight: Integer read _GetcontentInsetRight;
    {class} property contentInsetStart: Integer read _GetcontentInsetStart;
    {class} property contentInsetStartWithNavigation: Integer read _GetcontentInsetStartWithNavigation;
    {class} property controlBackground: Integer read _GetcontrolBackground;
    {class} property coordinatorLayoutStyle: Integer read _GetcoordinatorLayoutStyle;
    {class} property customNavigationLayout: Integer read _GetcustomNavigationLayout;
    {class} property defaultQueryHint: Integer read _GetdefaultQueryHint;
    {class} property dialogCornerRadius: Integer read _GetdialogCornerRadius;
    {class} property dialogPreferredPadding: Integer read _GetdialogPreferredPadding;
    {class} property dialogTheme: Integer read _GetdialogTheme;
    {class} property displayOptions: Integer read _GetdisplayOptions;
    {class} property divider: Integer read _Getdivider;
    {class} property dividerHorizontal: Integer read _GetdividerHorizontal;
    {class} property dividerPadding: Integer read _GetdividerPadding;
    {class} property dividerVertical: Integer read _GetdividerVertical;
    {class} property drawableSize: Integer read _GetdrawableSize;
    {class} property drawerArrowStyle: Integer read _GetdrawerArrowStyle;
    {class} property dropDownListViewStyle: Integer read _GetdropDownListViewStyle;
    {class} property dropdownListPreferredItemHeight: Integer read _GetdropdownListPreferredItemHeight;
    {class} property duration_max: Integer read _Getduration_max;
    {class} property editTextBackground: Integer read _GeteditTextBackground;
    {class} property editTextColor: Integer read _GeteditTextColor;
    {class} property editTextStyle: Integer read _GeteditTextStyle;
    {class} property elevation: Integer read _Getelevation;
    {class} property expandActivityOverflowButtonDrawable: Integer read _GetexpandActivityOverflowButtonDrawable;
    {class} property fastScrollEnabled: Integer read _GetfastScrollEnabled;
    {class} property fastScrollHorizontalThumbDrawable: Integer read _GetfastScrollHorizontalThumbDrawable;
    {class} property fastScrollHorizontalTrackDrawable: Integer read _GetfastScrollHorizontalTrackDrawable;
    {class} property fastScrollVerticalThumbDrawable: Integer read _GetfastScrollVerticalThumbDrawable;
    {class} property fastScrollVerticalTrackDrawable: Integer read _GetfastScrollVerticalTrackDrawable;
    {class} property firstBaselineToTopHeight: Integer read _GetfirstBaselineToTopHeight;
    {class} property font: Integer read _Getfont;
    {class} property fontFamily: Integer read _GetfontFamily;
    {class} property fontProviderAuthority: Integer read _GetfontProviderAuthority;
    {class} property fontProviderCerts: Integer read _GetfontProviderCerts;
    {class} property fontProviderFetchStrategy: Integer read _GetfontProviderFetchStrategy;
    {class} property fontProviderFetchTimeout: Integer read _GetfontProviderFetchTimeout;
    {class} property fontProviderPackage: Integer read _GetfontProviderPackage;
    {class} property fontProviderQuery: Integer read _GetfontProviderQuery;
    {class} property fontStyle: Integer read _GetfontStyle;
    {class} property fontVariationSettings: Integer read _GetfontVariationSettings;
    {class} property fontWeight: Integer read _GetfontWeight;
    {class} property gapBetweenBars: Integer read _GetgapBetweenBars;
    {class} property goIcon: Integer read _GetgoIcon;
    {class} property height: Integer read _Getheight;
    {class} property hideOnContentScroll: Integer read _GethideOnContentScroll;
    {class} property homeAsUpIndicator: Integer read _GethomeAsUpIndicator;
    {class} property homeLayout: Integer read _GethomeLayout;
    {class} property icon: Integer read _Geticon;
    {class} property iconLeft: Integer read _GeticonLeft;
    {class} property iconMargin: Integer read _GeticonMargin;
    {class} property iconRight: Integer read _GeticonRight;
    {class} property iconSize: Integer read _GeticonSize;
    {class} property iconSrc: Integer read _GeticonSrc;
    {class} property iconTint: Integer read _GeticonTint;
    {class} property iconTintMode: Integer read _GeticonTintMode;
    {class} property iconifiedByDefault: Integer read _GeticonifiedByDefault;
    {class} property imageButtonStyle: Integer read _GetimageButtonStyle;
    {class} property indeterminateProgressStyle: Integer read _GetindeterminateProgressStyle;
    {class} property initialActivityCount: Integer read _GetinitialActivityCount;
    {class} property isLightTheme: Integer read _GetisLightTheme;
    {class} property itemPadding: Integer read _GetitemPadding;
    {class} property keylines: Integer read _Getkeylines;
    {class} property lastBaselineToBottomHeight: Integer read _GetlastBaselineToBottomHeight;
    {class} property layout: Integer read _Getlayout;
    {class} property layoutManager: Integer read _GetlayoutManager;
    {class} property layout_anchor: Integer read _Getlayout_anchor;
    {class} property layout_anchorGravity: Integer read _Getlayout_anchorGravity;
    {class} property layout_behavior: Integer read _Getlayout_behavior;
    {class} property layout_dodgeInsetEdges: Integer read _Getlayout_dodgeInsetEdges;
    {class} property layout_insetEdge: Integer read _Getlayout_insetEdge;
    {class} property layout_keyline: Integer read _Getlayout_keyline;
    {class} property lineHeight: Integer read _GetlineHeight;
    {class} property listChoiceBackgroundIndicator: Integer read _GetlistChoiceBackgroundIndicator;
    {class} property listDividerAlertDialog: Integer read _GetlistDividerAlertDialog;
    {class} property listItemLayout: Integer read _GetlistItemLayout;
    {class} property listLayout: Integer read _GetlistLayout;
    {class} property listMenuViewStyle: Integer read _GetlistMenuViewStyle;
    {class} property listPopupWindowStyle: Integer read _GetlistPopupWindowStyle;
    {class} property listPreferredItemHeight: Integer read _GetlistPreferredItemHeight;
    {class} property listPreferredItemHeightLarge: Integer read _GetlistPreferredItemHeightLarge;
    {class} property listPreferredItemHeightSmall: Integer read _GetlistPreferredItemHeightSmall;
    {class} property listPreferredItemPaddingLeft: Integer read _GetlistPreferredItemPaddingLeft;
    {class} property listPreferredItemPaddingRight: Integer read _GetlistPreferredItemPaddingRight;
    {class} property logo: Integer read _Getlogo;
    {class} property logoDescription: Integer read _GetlogoDescription;
    {class} property maxButtonHeight: Integer read _GetmaxButtonHeight;
    {class} property measureWithLargestChild: Integer read _GetmeasureWithLargestChild;
    {class} property multiChoiceItemLayout: Integer read _GetmultiChoiceItemLayout;
    {class} property navigationContentDescription: Integer read _GetnavigationContentDescription;
    {class} property navigationIcon: Integer read _GetnavigationIcon;
    {class} property navigationMode: Integer read _GetnavigationMode;
    {class} property numericModifiers: Integer read _GetnumericModifiers;
    {class} property overlapAnchor: Integer read _GetoverlapAnchor;
    {class} property paddingBottomNoButtons: Integer read _GetpaddingBottomNoButtons;
    {class} property paddingEnd: Integer read _GetpaddingEnd;
    {class} property paddingStart: Integer read _GetpaddingStart;
    {class} property paddingTopNoTitle: Integer read _GetpaddingTopNoTitle;
    {class} property panelBackground: Integer read _GetpanelBackground;
    {class} property panelMenuListTheme: Integer read _GetpanelMenuListTheme;
    {class} property panelMenuListWidth: Integer read _GetpanelMenuListWidth;
    {class} property popupMenuStyle: Integer read _GetpopupMenuStyle;
    {class} property popupTheme: Integer read _GetpopupTheme;
    {class} property popupWindowStyle: Integer read _GetpopupWindowStyle;
    {class} property preserveIconSpacing: Integer read _GetpreserveIconSpacing;
    {class} property progressBarPadding: Integer read _GetprogressBarPadding;
    {class} property progressBarStyle: Integer read _GetprogressBarStyle;
    {class} property queryBackground: Integer read _GetqueryBackground;
    {class} property queryHint: Integer read _GetqueryHint;
    {class} property radioButtonStyle: Integer read _GetradioButtonStyle;
    {class} property ratingBarStyle: Integer read _GetratingBarStyle;
    {class} property ratingBarStyleIndicator: Integer read _GetratingBarStyleIndicator;
    {class} property ratingBarStyleSmall: Integer read _GetratingBarStyleSmall;
    {class} property ratio: Integer read _Getratio;
    {class} property reverseLayout: Integer read _GetreverseLayout;
    {class} property searchHintIcon: Integer read _GetsearchHintIcon;
    {class} property searchIcon: Integer read _GetsearchIcon;
    {class} property searchViewStyle: Integer read _GetsearchViewStyle;
    {class} property seekBarStyle: Integer read _GetseekBarStyle;
    {class} property selectableItemBackground: Integer read _GetselectableItemBackground;
    {class} property selectableItemBackgroundBorderless: Integer read _GetselectableItemBackgroundBorderless;
    {class} property showAsAction: Integer read _GetshowAsAction;
    {class} property showDividers: Integer read _GetshowDividers;
    {class} property showText: Integer read _GetshowText;
    {class} property showTitle: Integer read _GetshowTitle;
    {class} property singleChoiceItemLayout: Integer read _GetsingleChoiceItemLayout;
    {class} property spanCount: Integer read _GetspanCount;
    {class} property spinBars: Integer read _GetspinBars;
    {class} property spinnerDropDownItemStyle: Integer read _GetspinnerDropDownItemStyle;
    {class} property spinnerStyle: Integer read _GetspinnerStyle;
    {class} property splitTrack: Integer read _GetsplitTrack;
    {class} property srcCompat: Integer read _GetsrcCompat;
    {class} property stackFromEnd: Integer read _GetstackFromEnd;
    {class} property state_above_anchor: Integer read _Getstate_above_anchor;
    {class} property statusBarBackground: Integer read _GetstatusBarBackground;
    {class} property subMenuArrow: Integer read _GetsubMenuArrow;
    {class} property submitBackground: Integer read _GetsubmitBackground;
    {class} property subtitle: Integer read _Getsubtitle;
    {class} property subtitleTextAppearance: Integer read _GetsubtitleTextAppearance;
    {class} property subtitleTextColor: Integer read _GetsubtitleTextColor;
    {class} property subtitleTextStyle: Integer read _GetsubtitleTextStyle;
    {class} property suggestionRowLayout: Integer read _GetsuggestionRowLayout;
    {class} property switchMinWidth: Integer read _GetswitchMinWidth;
    {class} property switchPadding: Integer read _GetswitchPadding;
    {class} property switchStyle: Integer read _GetswitchStyle;
    {class} property switchTextAppearance: Integer read _GetswitchTextAppearance;
    {class} property textAllCaps: Integer read _GettextAllCaps;
    {class} property textAppearanceLargePopupMenu: Integer read _GettextAppearanceLargePopupMenu;
    {class} property textAppearanceListItem: Integer read _GettextAppearanceListItem;
    {class} property textAppearanceListItemSecondary: Integer read _GettextAppearanceListItemSecondary;
    {class} property textAppearanceListItemSmall: Integer read _GettextAppearanceListItemSmall;
    {class} property textAppearancePopupMenuHeader: Integer read _GettextAppearancePopupMenuHeader;
    {class} property textAppearanceSearchResultSubtitle: Integer read _GettextAppearanceSearchResultSubtitle;
    {class} property textAppearanceSearchResultTitle: Integer read _GettextAppearanceSearchResultTitle;
    {class} property textAppearanceSmallPopupMenu: Integer read _GettextAppearanceSmallPopupMenu;
    {class} property textColorAlertDialogListItem: Integer read _GettextColorAlertDialogListItem;
    {class} property textColorSearchUrl: Integer read _GettextColorSearchUrl;
    {class} property theme: Integer read _Gettheme;
    {class} property thickness: Integer read _Getthickness;
    {class} property thumbTextPadding: Integer read _GetthumbTextPadding;
    {class} property thumbTint: Integer read _GetthumbTint;
    {class} property thumbTintMode: Integer read _GetthumbTintMode;
    {class} property tickMark: Integer read _GettickMark;
    {class} property tickMarkTint: Integer read _GettickMarkTint;
    {class} property tickMarkTintMode: Integer read _GettickMarkTintMode;
    {class} property tint: Integer read _Gettint;
    {class} property tintMode: Integer read _GettintMode;
    {class} property title: Integer read _Gettitle;
    {class} property titleMargin: Integer read _GettitleMargin;
    {class} property titleMarginBottom: Integer read _GettitleMarginBottom;
    {class} property titleMarginEnd: Integer read _GettitleMarginEnd;
    {class} property titleMarginStart: Integer read _GettitleMarginStart;
    {class} property titleMarginTop: Integer read _GettitleMarginTop;
    {class} property titleMargins: Integer read _GettitleMargins;
    {class} property titleTextAppearance: Integer read _GettitleTextAppearance;
    {class} property titleTextColor: Integer read _GettitleTextColor;
    {class} property titleTextStyle: Integer read _GettitleTextStyle;
    {class} property toolbarNavigationButtonStyle: Integer read _GettoolbarNavigationButtonStyle;
    {class} property toolbarStyle: Integer read _GettoolbarStyle;
    {class} property tooltipForegroundColor: Integer read _GettooltipForegroundColor;
    {class} property tooltipFrameBackground: Integer read _GettooltipFrameBackground;
    {class} property tooltipText: Integer read _GettooltipText;
    {class} property track: Integer read _Gettrack;
    {class} property trackTint: Integer read _GettrackTint;
    {class} property trackTintMode: Integer read _GettrackTintMode;
    {class} property ttcIndex: Integer read _GetttcIndex;
    {class} property viewInflaterClass: Integer read _GetviewInflaterClass;
    {class} property voiceIcon: Integer read _GetvoiceIcon;
    {class} property windowActionBar: Integer read _GetwindowActionBar;
    {class} property windowActionBarOverlay: Integer read _GetwindowActionBarOverlay;
    {class} property windowActionModeOverlay: Integer read _GetwindowActionModeOverlay;
    {class} property windowFixedHeightMajor: Integer read _GetwindowFixedHeightMajor;
    {class} property windowFixedHeightMinor: Integer read _GetwindowFixedHeightMinor;
    {class} property windowFixedWidthMajor: Integer read _GetwindowFixedWidthMajor;
    {class} property windowFixedWidthMinor: Integer read _GetwindowFixedWidthMinor;
    {class} property windowMinWidthMajor: Integer read _GetwindowMinWidthMajor;
    {class} property windowMinWidthMinor: Integer read _GetwindowMinWidthMinor;
    {class} property windowNoTitle: Integer read _GetwindowNoTitle;
  end;

  [JavaSignature('com/devil/library/media/R$attr')]
  JR_attr_106 = interface(JObject)
  ['{C4EA0591-2072-4433-BBE5-991188B8DC27}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_attr_106 = class(TJavaGenericImport<JR_attr_106Class, JR_attr_106>) end;

  JR_bool_107Class = interface(JObjectClass)
  ['{B2FFDE2B-E3F9-45BA-ADE1-F97941034966}']
    { static Property Methods }
    {class} function _Getabc_action_bar_embed_tabs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_allow_stacked_button_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_actionMenuItemAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_bool_107; cdecl;

    { static Property }
    {class} property abc_action_bar_embed_tabs: Integer read _Getabc_action_bar_embed_tabs;
    {class} property abc_allow_stacked_button_bar: Integer read _Getabc_allow_stacked_button_bar;
    {class} property abc_config_actionMenuItemAllCaps: Integer read _Getabc_config_actionMenuItemAllCaps;
  end;

  [JavaSignature('com/devil/library/media/R$bool')]
  JR_bool_107 = interface(JObject)
  ['{826D1ACB-145D-45D9-B375-13C8778E40BE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_bool_107 = class(TJavaGenericImport<JR_bool_107Class, JR_bool_107>) end;

  JR_color_108Class = interface(JObjectClass)
  ['{F0931BD2-E1B4-49EE-8508-474F5D13C6F5}']
    { static Property Methods }
    {class} function _Getabc_background_cache_hint_selector_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_background_cache_hint_selector_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_borderless_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_color_highlight_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_hint_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_hint_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_input_method_navigation_guard: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_disable_only_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_disable_only_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_primary_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_url_text_selected: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_secondary_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_secondary_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_btn_checkable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_default: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_edittext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_seek_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tint_switch_track: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaccent_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaccent_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_floating_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_floating_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbackground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_inverse_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_inverse_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbright_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbutton_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbutton_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdim_foreground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geterror_color_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geterror_color_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforeground_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforeground_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlighted_text_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlighted_text_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_900: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_blue_grey_950: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_deep_teal_200: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_deep_teal_500: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_100: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_300: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_50: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_850: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmaterial_grey_900: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_color_filter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_bg_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_material_background_media_default_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_dark_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_dark_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprimary_text_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getripple_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_default_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsecondary_text_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_disabled_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_disabled_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_normal_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getswitch_thumb_normal_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_background_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_background_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_color_108; cdecl;

    { static Property }
    {class} property abc_background_cache_hint_selector_material_dark: Integer read _Getabc_background_cache_hint_selector_material_dark;
    {class} property abc_background_cache_hint_selector_material_light: Integer read _Getabc_background_cache_hint_selector_material_light;
    {class} property abc_btn_colored_borderless_text_material: Integer read _Getabc_btn_colored_borderless_text_material;
    {class} property abc_btn_colored_text_material: Integer read _Getabc_btn_colored_text_material;
    {class} property abc_color_highlight_material: Integer read _Getabc_color_highlight_material;
    {class} property abc_hint_foreground_material_dark: Integer read _Getabc_hint_foreground_material_dark;
    {class} property abc_hint_foreground_material_light: Integer read _Getabc_hint_foreground_material_light;
    {class} property abc_input_method_navigation_guard: Integer read _Getabc_input_method_navigation_guard;
    {class} property abc_primary_text_disable_only_material_dark: Integer read _Getabc_primary_text_disable_only_material_dark;
    {class} property abc_primary_text_disable_only_material_light: Integer read _Getabc_primary_text_disable_only_material_light;
    {class} property abc_primary_text_material_dark: Integer read _Getabc_primary_text_material_dark;
    {class} property abc_primary_text_material_light: Integer read _Getabc_primary_text_material_light;
    {class} property abc_search_url_text: Integer read _Getabc_search_url_text;
    {class} property abc_search_url_text_normal: Integer read _Getabc_search_url_text_normal;
    {class} property abc_search_url_text_pressed: Integer read _Getabc_search_url_text_pressed;
    {class} property abc_search_url_text_selected: Integer read _Getabc_search_url_text_selected;
    {class} property abc_secondary_text_material_dark: Integer read _Getabc_secondary_text_material_dark;
    {class} property abc_secondary_text_material_light: Integer read _Getabc_secondary_text_material_light;
    {class} property abc_tint_btn_checkable: Integer read _Getabc_tint_btn_checkable;
    {class} property abc_tint_default: Integer read _Getabc_tint_default;
    {class} property abc_tint_edittext: Integer read _Getabc_tint_edittext;
    {class} property abc_tint_seek_thumb: Integer read _Getabc_tint_seek_thumb;
    {class} property abc_tint_spinner: Integer read _Getabc_tint_spinner;
    {class} property abc_tint_switch_track: Integer read _Getabc_tint_switch_track;
    {class} property accent_material_dark: Integer read _Getaccent_material_dark;
    {class} property accent_material_light: Integer read _Getaccent_material_light;
    {class} property background_floating_material_dark: Integer read _Getbackground_floating_material_dark;
    {class} property background_floating_material_light: Integer read _Getbackground_floating_material_light;
    {class} property background_material_dark: Integer read _Getbackground_material_dark;
    {class} property background_material_light: Integer read _Getbackground_material_light;
    {class} property bright_foreground_disabled_material_dark: Integer read _Getbright_foreground_disabled_material_dark;
    {class} property bright_foreground_disabled_material_light: Integer read _Getbright_foreground_disabled_material_light;
    {class} property bright_foreground_inverse_material_dark: Integer read _Getbright_foreground_inverse_material_dark;
    {class} property bright_foreground_inverse_material_light: Integer read _Getbright_foreground_inverse_material_light;
    {class} property bright_foreground_material_dark: Integer read _Getbright_foreground_material_dark;
    {class} property bright_foreground_material_light: Integer read _Getbright_foreground_material_light;
    {class} property button_material_dark: Integer read _Getbutton_material_dark;
    {class} property button_material_light: Integer read _Getbutton_material_light;
    {class} property dim_foreground_disabled_material_dark: Integer read _Getdim_foreground_disabled_material_dark;
    {class} property dim_foreground_disabled_material_light: Integer read _Getdim_foreground_disabled_material_light;
    {class} property dim_foreground_material_dark: Integer read _Getdim_foreground_material_dark;
    {class} property dim_foreground_material_light: Integer read _Getdim_foreground_material_light;
    {class} property error_color_material_dark: Integer read _Geterror_color_material_dark;
    {class} property error_color_material_light: Integer read _Geterror_color_material_light;
    {class} property foreground_material_dark: Integer read _Getforeground_material_dark;
    {class} property foreground_material_light: Integer read _Getforeground_material_light;
    {class} property highlighted_text_material_dark: Integer read _Gethighlighted_text_material_dark;
    {class} property highlighted_text_material_light: Integer read _Gethighlighted_text_material_light;
    {class} property material_blue_grey_800: Integer read _Getmaterial_blue_grey_800;
    {class} property material_blue_grey_900: Integer read _Getmaterial_blue_grey_900;
    {class} property material_blue_grey_950: Integer read _Getmaterial_blue_grey_950;
    {class} property material_deep_teal_200: Integer read _Getmaterial_deep_teal_200;
    {class} property material_deep_teal_500: Integer read _Getmaterial_deep_teal_500;
    {class} property material_grey_100: Integer read _Getmaterial_grey_100;
    {class} property material_grey_300: Integer read _Getmaterial_grey_300;
    {class} property material_grey_50: Integer read _Getmaterial_grey_50;
    {class} property material_grey_600: Integer read _Getmaterial_grey_600;
    {class} property material_grey_800: Integer read _Getmaterial_grey_800;
    {class} property material_grey_850: Integer read _Getmaterial_grey_850;
    {class} property material_grey_900: Integer read _Getmaterial_grey_900;
    {class} property notification_action_color_filter: Integer read _Getnotification_action_color_filter;
    {class} property notification_icon_bg_color: Integer read _Getnotification_icon_bg_color;
    {class} property notification_material_background_media_default_color: Integer read _Getnotification_material_background_media_default_color;
    {class} property primary_dark_material_dark: Integer read _Getprimary_dark_material_dark;
    {class} property primary_dark_material_light: Integer read _Getprimary_dark_material_light;
    {class} property primary_material_dark: Integer read _Getprimary_material_dark;
    {class} property primary_material_light: Integer read _Getprimary_material_light;
    {class} property primary_text_default_material_dark: Integer read _Getprimary_text_default_material_dark;
    {class} property primary_text_default_material_light: Integer read _Getprimary_text_default_material_light;
    {class} property primary_text_disabled_material_dark: Integer read _Getprimary_text_disabled_material_dark;
    {class} property primary_text_disabled_material_light: Integer read _Getprimary_text_disabled_material_light;
    {class} property ripple_material_dark: Integer read _Getripple_material_dark;
    {class} property ripple_material_light: Integer read _Getripple_material_light;
    {class} property secondary_text_default_material_dark: Integer read _Getsecondary_text_default_material_dark;
    {class} property secondary_text_default_material_light: Integer read _Getsecondary_text_default_material_light;
    {class} property secondary_text_disabled_material_dark: Integer read _Getsecondary_text_disabled_material_dark;
    {class} property secondary_text_disabled_material_light: Integer read _Getsecondary_text_disabled_material_light;
    {class} property switch_thumb_disabled_material_dark: Integer read _Getswitch_thumb_disabled_material_dark;
    {class} property switch_thumb_disabled_material_light: Integer read _Getswitch_thumb_disabled_material_light;
    {class} property switch_thumb_material_dark: Integer read _Getswitch_thumb_material_dark;
    {class} property switch_thumb_material_light: Integer read _Getswitch_thumb_material_light;
    {class} property switch_thumb_normal_material_dark: Integer read _Getswitch_thumb_normal_material_dark;
    {class} property switch_thumb_normal_material_light: Integer read _Getswitch_thumb_normal_material_light;
    {class} property tooltip_background_dark: Integer read _Gettooltip_background_dark;
    {class} property tooltip_background_light: Integer read _Gettooltip_background_light;
  end;

  [JavaSignature('com/devil/library/media/R$color')]
  JR_color_108 = interface(JObject)
  ['{515BAA0F-969C-44FF-842D-6873108B3E5D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_color_108 = class(TJavaGenericImport<JR_color_108Class, JR_color_108>) end;

  JR_dimen_109Class = interface(JObjectClass)
  ['{066E4855-8BBE-4246-8B65-3C2EFE81DCD1}']
    { static Property Methods }
    {class} function _Getabc_action_bar_content_inset_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_content_inset_with_nav: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_padding_end_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_default_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_elevation_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_icon_vertical_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_overflow_padding_end_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_overflow_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_stacked_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_stacked_tab_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_subtitle_bottom_margin_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_subtitle_top_margin_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_width_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_button_min_width_overflow_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_bar_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_dimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cascading_menus_min_smallest_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_prefDialogWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_inset_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_corner_radius_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_height_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_height_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_width_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_fixed_width_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_list_padding_bottom_no_buttons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_list_padding_top_no_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_min_width_major: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_min_width_minor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_padding_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_padding_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_title_divider_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_disabled_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_disabled_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_text_padding_left: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dropdownitem_text_padding_right: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_bottom_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_inset_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_floating_window_z: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_item_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_panel_menu_list_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_progress_bar_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view_preferred_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view_preferred_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_background_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_progress_height_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_select_dialog_padding_start_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_body_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_body_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_button_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_caption_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_3_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_display_4_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_headline_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_large_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_medium_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_menu_header_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_menu_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_small_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_subhead_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_subtitle_material_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_size_title_material_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_horizontal_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_vertical_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_inset_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_horizontal_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_button_padding_vertical_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_control_corner_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcompat_notification_large_icon_max_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdisabled_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdisabled_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_default_thickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfastscroll_minimum_range: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethighlight_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_pressed_alpha_material_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethint_pressed_alpha_material_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_max_drag_scroll_per_frame: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_swipe_escape_max_velocity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_swipe_escape_velocity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmain_navigate_bar_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_text_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_big_circle_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_content_margin_start: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_large_icon_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_narrow_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_icon_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_right_side_padding_top: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_background_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_small_icon_size_as_large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_subtext_size: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_top_pad_large_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_corner_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_outline_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_shadow_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubtitle_shadow_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_corner_radius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_horizontal_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_margin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_precise_anchor_extra_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_precise_anchor_threshold: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_vertical_padding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_y_offset_non_touch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_y_offset_touch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_dimen_109; cdecl;

    { static Property }
    {class} property abc_action_bar_content_inset_material: Integer read _Getabc_action_bar_content_inset_material;
    {class} property abc_action_bar_content_inset_with_nav: Integer read _Getabc_action_bar_content_inset_with_nav;
    {class} property abc_action_bar_default_height_material: Integer read _Getabc_action_bar_default_height_material;
    {class} property abc_action_bar_default_padding_end_material: Integer read _Getabc_action_bar_default_padding_end_material;
    {class} property abc_action_bar_default_padding_start_material: Integer read _Getabc_action_bar_default_padding_start_material;
    {class} property abc_action_bar_elevation_material: Integer read _Getabc_action_bar_elevation_material;
    {class} property abc_action_bar_icon_vertical_padding_material: Integer read _Getabc_action_bar_icon_vertical_padding_material;
    {class} property abc_action_bar_overflow_padding_end_material: Integer read _Getabc_action_bar_overflow_padding_end_material;
    {class} property abc_action_bar_overflow_padding_start_material: Integer read _Getabc_action_bar_overflow_padding_start_material;
    {class} property abc_action_bar_stacked_max_height: Integer read _Getabc_action_bar_stacked_max_height;
    {class} property abc_action_bar_stacked_tab_max_width: Integer read _Getabc_action_bar_stacked_tab_max_width;
    {class} property abc_action_bar_subtitle_bottom_margin_material: Integer read _Getabc_action_bar_subtitle_bottom_margin_material;
    {class} property abc_action_bar_subtitle_top_margin_material: Integer read _Getabc_action_bar_subtitle_top_margin_material;
    {class} property abc_action_button_min_height_material: Integer read _Getabc_action_button_min_height_material;
    {class} property abc_action_button_min_width_material: Integer read _Getabc_action_button_min_width_material;
    {class} property abc_action_button_min_width_overflow_material: Integer read _Getabc_action_button_min_width_overflow_material;
    {class} property abc_alert_dialog_button_bar_height: Integer read _Getabc_alert_dialog_button_bar_height;
    {class} property abc_alert_dialog_button_dimen: Integer read _Getabc_alert_dialog_button_dimen;
    {class} property abc_button_inset_horizontal_material: Integer read _Getabc_button_inset_horizontal_material;
    {class} property abc_button_inset_vertical_material: Integer read _Getabc_button_inset_vertical_material;
    {class} property abc_button_padding_horizontal_material: Integer read _Getabc_button_padding_horizontal_material;
    {class} property abc_button_padding_vertical_material: Integer read _Getabc_button_padding_vertical_material;
    {class} property abc_cascading_menus_min_smallest_width: Integer read _Getabc_cascading_menus_min_smallest_width;
    {class} property abc_config_prefDialogWidth: Integer read _Getabc_config_prefDialogWidth;
    {class} property abc_control_corner_material: Integer read _Getabc_control_corner_material;
    {class} property abc_control_inset_material: Integer read _Getabc_control_inset_material;
    {class} property abc_control_padding_material: Integer read _Getabc_control_padding_material;
    {class} property abc_dialog_corner_radius_material: Integer read _Getabc_dialog_corner_radius_material;
    {class} property abc_dialog_fixed_height_major: Integer read _Getabc_dialog_fixed_height_major;
    {class} property abc_dialog_fixed_height_minor: Integer read _Getabc_dialog_fixed_height_minor;
    {class} property abc_dialog_fixed_width_major: Integer read _Getabc_dialog_fixed_width_major;
    {class} property abc_dialog_fixed_width_minor: Integer read _Getabc_dialog_fixed_width_minor;
    {class} property abc_dialog_list_padding_bottom_no_buttons: Integer read _Getabc_dialog_list_padding_bottom_no_buttons;
    {class} property abc_dialog_list_padding_top_no_title: Integer read _Getabc_dialog_list_padding_top_no_title;
    {class} property abc_dialog_min_width_major: Integer read _Getabc_dialog_min_width_major;
    {class} property abc_dialog_min_width_minor: Integer read _Getabc_dialog_min_width_minor;
    {class} property abc_dialog_padding_material: Integer read _Getabc_dialog_padding_material;
    {class} property abc_dialog_padding_top_material: Integer read _Getabc_dialog_padding_top_material;
    {class} property abc_dialog_title_divider_material: Integer read _Getabc_dialog_title_divider_material;
    {class} property abc_disabled_alpha_material_dark: Integer read _Getabc_disabled_alpha_material_dark;
    {class} property abc_disabled_alpha_material_light: Integer read _Getabc_disabled_alpha_material_light;
    {class} property abc_dropdownitem_icon_width: Integer read _Getabc_dropdownitem_icon_width;
    {class} property abc_dropdownitem_text_padding_left: Integer read _Getabc_dropdownitem_text_padding_left;
    {class} property abc_dropdownitem_text_padding_right: Integer read _Getabc_dropdownitem_text_padding_right;
    {class} property abc_edit_text_inset_bottom_material: Integer read _Getabc_edit_text_inset_bottom_material;
    {class} property abc_edit_text_inset_horizontal_material: Integer read _Getabc_edit_text_inset_horizontal_material;
    {class} property abc_edit_text_inset_top_material: Integer read _Getabc_edit_text_inset_top_material;
    {class} property abc_floating_window_z: Integer read _Getabc_floating_window_z;
    {class} property abc_list_item_padding_horizontal_material: Integer read _Getabc_list_item_padding_horizontal_material;
    {class} property abc_panel_menu_list_width: Integer read _Getabc_panel_menu_list_width;
    {class} property abc_progress_bar_height_material: Integer read _Getabc_progress_bar_height_material;
    {class} property abc_search_view_preferred_height: Integer read _Getabc_search_view_preferred_height;
    {class} property abc_search_view_preferred_width: Integer read _Getabc_search_view_preferred_width;
    {class} property abc_seekbar_track_background_height_material: Integer read _Getabc_seekbar_track_background_height_material;
    {class} property abc_seekbar_track_progress_height_material: Integer read _Getabc_seekbar_track_progress_height_material;
    {class} property abc_select_dialog_padding_start_material: Integer read _Getabc_select_dialog_padding_start_material;
    {class} property abc_switch_padding: Integer read _Getabc_switch_padding;
    {class} property abc_text_size_body_1_material: Integer read _Getabc_text_size_body_1_material;
    {class} property abc_text_size_body_2_material: Integer read _Getabc_text_size_body_2_material;
    {class} property abc_text_size_button_material: Integer read _Getabc_text_size_button_material;
    {class} property abc_text_size_caption_material: Integer read _Getabc_text_size_caption_material;
    {class} property abc_text_size_display_1_material: Integer read _Getabc_text_size_display_1_material;
    {class} property abc_text_size_display_2_material: Integer read _Getabc_text_size_display_2_material;
    {class} property abc_text_size_display_3_material: Integer read _Getabc_text_size_display_3_material;
    {class} property abc_text_size_display_4_material: Integer read _Getabc_text_size_display_4_material;
    {class} property abc_text_size_headline_material: Integer read _Getabc_text_size_headline_material;
    {class} property abc_text_size_large_material: Integer read _Getabc_text_size_large_material;
    {class} property abc_text_size_medium_material: Integer read _Getabc_text_size_medium_material;
    {class} property abc_text_size_menu_header_material: Integer read _Getabc_text_size_menu_header_material;
    {class} property abc_text_size_menu_material: Integer read _Getabc_text_size_menu_material;
    {class} property abc_text_size_small_material: Integer read _Getabc_text_size_small_material;
    {class} property abc_text_size_subhead_material: Integer read _Getabc_text_size_subhead_material;
    {class} property abc_text_size_subtitle_material_toolbar: Integer read _Getabc_text_size_subtitle_material_toolbar;
    {class} property abc_text_size_title_material: Integer read _Getabc_text_size_title_material;
    {class} property abc_text_size_title_material_toolbar: Integer read _Getabc_text_size_title_material_toolbar;
    {class} property activity_horizontal_margin: Integer read _Getactivity_horizontal_margin;
    {class} property activity_vertical_margin: Integer read _Getactivity_vertical_margin;
    {class} property compat_button_inset_horizontal_material: Integer read _Getcompat_button_inset_horizontal_material;
    {class} property compat_button_inset_vertical_material: Integer read _Getcompat_button_inset_vertical_material;
    {class} property compat_button_padding_horizontal_material: Integer read _Getcompat_button_padding_horizontal_material;
    {class} property compat_button_padding_vertical_material: Integer read _Getcompat_button_padding_vertical_material;
    {class} property compat_control_corner_material: Integer read _Getcompat_control_corner_material;
    {class} property compat_notification_large_icon_max_height: Integer read _Getcompat_notification_large_icon_max_height;
    {class} property compat_notification_large_icon_max_width: Integer read _Getcompat_notification_large_icon_max_width;
    {class} property disabled_alpha_material_dark: Integer read _Getdisabled_alpha_material_dark;
    {class} property disabled_alpha_material_light: Integer read _Getdisabled_alpha_material_light;
    {class} property fastscroll_default_thickness: Integer read _Getfastscroll_default_thickness;
    {class} property fastscroll_margin: Integer read _Getfastscroll_margin;
    {class} property fastscroll_minimum_range: Integer read _Getfastscroll_minimum_range;
    {class} property highlight_alpha_material_colored: Integer read _Gethighlight_alpha_material_colored;
    {class} property highlight_alpha_material_dark: Integer read _Gethighlight_alpha_material_dark;
    {class} property highlight_alpha_material_light: Integer read _Gethighlight_alpha_material_light;
    {class} property hint_alpha_material_dark: Integer read _Gethint_alpha_material_dark;
    {class} property hint_alpha_material_light: Integer read _Gethint_alpha_material_light;
    {class} property hint_pressed_alpha_material_dark: Integer read _Gethint_pressed_alpha_material_dark;
    {class} property hint_pressed_alpha_material_light: Integer read _Gethint_pressed_alpha_material_light;
    {class} property item_touch_helper_max_drag_scroll_per_frame: Integer read _Getitem_touch_helper_max_drag_scroll_per_frame;
    {class} property item_touch_helper_swipe_escape_max_velocity: Integer read _Getitem_touch_helper_swipe_escape_max_velocity;
    {class} property item_touch_helper_swipe_escape_velocity: Integer read _Getitem_touch_helper_swipe_escape_velocity;
    {class} property main_navigate_bar_height: Integer read _Getmain_navigate_bar_height;
    {class} property notification_action_icon_size: Integer read _Getnotification_action_icon_size;
    {class} property notification_action_text_size: Integer read _Getnotification_action_text_size;
    {class} property notification_big_circle_margin: Integer read _Getnotification_big_circle_margin;
    {class} property notification_content_margin_start: Integer read _Getnotification_content_margin_start;
    {class} property notification_large_icon_height: Integer read _Getnotification_large_icon_height;
    {class} property notification_large_icon_width: Integer read _Getnotification_large_icon_width;
    {class} property notification_main_column_padding_top: Integer read _Getnotification_main_column_padding_top;
    {class} property notification_media_narrow_margin: Integer read _Getnotification_media_narrow_margin;
    {class} property notification_right_icon_size: Integer read _Getnotification_right_icon_size;
    {class} property notification_right_side_padding_top: Integer read _Getnotification_right_side_padding_top;
    {class} property notification_small_icon_background_padding: Integer read _Getnotification_small_icon_background_padding;
    {class} property notification_small_icon_size_as_large: Integer read _Getnotification_small_icon_size_as_large;
    {class} property notification_subtext_size: Integer read _Getnotification_subtext_size;
    {class} property notification_top_pad: Integer read _Getnotification_top_pad;
    {class} property notification_top_pad_large_text: Integer read _Getnotification_top_pad_large_text;
    {class} property subtitle_corner_radius: Integer read _Getsubtitle_corner_radius;
    {class} property subtitle_outline_width: Integer read _Getsubtitle_outline_width;
    {class} property subtitle_shadow_offset: Integer read _Getsubtitle_shadow_offset;
    {class} property subtitle_shadow_radius: Integer read _Getsubtitle_shadow_radius;
    {class} property tooltip_corner_radius: Integer read _Gettooltip_corner_radius;
    {class} property tooltip_horizontal_padding: Integer read _Gettooltip_horizontal_padding;
    {class} property tooltip_margin: Integer read _Gettooltip_margin;
    {class} property tooltip_precise_anchor_extra_offset: Integer read _Gettooltip_precise_anchor_extra_offset;
    {class} property tooltip_precise_anchor_threshold: Integer read _Gettooltip_precise_anchor_threshold;
    {class} property tooltip_vertical_padding: Integer read _Gettooltip_vertical_padding;
    {class} property tooltip_y_offset_non_touch: Integer read _Gettooltip_y_offset_non_touch;
    {class} property tooltip_y_offset_touch: Integer read _Gettooltip_y_offset_touch;
  end;

  [JavaSignature('com/devil/library/media/R$dimen')]
  JR_dimen_109 = interface(JObject)
  ['{0220B2B4-E831-43B9-A67E-3887FFB8CF60}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_dimen_109 = class(TJavaGenericImport<JR_dimen_109Class, JR_dimen_109>) end;

  JR_drawable_110Class = interface(JObjectClass)
  ['{B01D3FF1-62BE-4E7D-8131-DE0A61684067}']
    { static Property Methods }
    {class} function _Getabc_ab_share_pack_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_item_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_borderless_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_to_on_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_check_to_on_mtrl_015: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_colored_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_default_mtrl_shape: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_to_on_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_radio_to_on_mtrl_015: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_switch_to_on_mtrl_00001: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_btn_switch_to_on_mtrl_00012: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_internal_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_top_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cab_background_top_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_control_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_material_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_edit_text_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_ab_back_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_arrow_drop_right_black_24dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_clear_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_commit_search_api_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_go_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_copy_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_cut_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_overflow_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_paste_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_selectall_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_menu_share_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_16dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_36dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_black_48dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_16dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_36dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_star_half_black_48dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ic_voice_search_api_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_item_background_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_item_background_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_divider_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_divider_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_focused_holo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_longpressed_holo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_pressed_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_pressed_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_background_transition_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_background_transition_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_disabled_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_disabled_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_holo_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_selector_holo_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_hardkey_panel_mtrl_mult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_background_mtrl_mult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_indicator_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_ratingbar_small_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_off_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_to_pressed_mtrl_000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_control_to_pressed_mtrl_005: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_primary_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_scrubber_track_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_thumb_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_tick_mark_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_seekbar_track_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_spinner_mtrl_am_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_spinner_textfield_background_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_thumb_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_switch_track_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tab_indicator_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tab_indicator_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_cursor_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_left_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_left_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_middle_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_middle_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_right_mtrl_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_text_select_handle_right_mtrl_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_activated_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_default_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_activated_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_default_mtrl_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_textfield_search_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_vector_test: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_camera: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_flash_auto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_flash_off: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_flash_on: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_photo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getic_repeat_black_24dp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_low_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_bg_normal_pressed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_icon_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_low_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_tile_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotify_panel_notification_icon_bg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselector_check_btn_select: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getshape_btn_default: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_frame_dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettooltip_frame_light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_drawable_110; cdecl;

    { static Property }
    {class} property abc_ab_share_pack_mtrl_alpha: Integer read _Getabc_ab_share_pack_mtrl_alpha;
    {class} property abc_action_bar_item_background_material: Integer read _Getabc_action_bar_item_background_material;
    {class} property abc_btn_borderless_material: Integer read _Getabc_btn_borderless_material;
    {class} property abc_btn_check_material: Integer read _Getabc_btn_check_material;
    {class} property abc_btn_check_to_on_mtrl_000: Integer read _Getabc_btn_check_to_on_mtrl_000;
    {class} property abc_btn_check_to_on_mtrl_015: Integer read _Getabc_btn_check_to_on_mtrl_015;
    {class} property abc_btn_colored_material: Integer read _Getabc_btn_colored_material;
    {class} property abc_btn_default_mtrl_shape: Integer read _Getabc_btn_default_mtrl_shape;
    {class} property abc_btn_radio_material: Integer read _Getabc_btn_radio_material;
    {class} property abc_btn_radio_to_on_mtrl_000: Integer read _Getabc_btn_radio_to_on_mtrl_000;
    {class} property abc_btn_radio_to_on_mtrl_015: Integer read _Getabc_btn_radio_to_on_mtrl_015;
    {class} property abc_btn_switch_to_on_mtrl_00001: Integer read _Getabc_btn_switch_to_on_mtrl_00001;
    {class} property abc_btn_switch_to_on_mtrl_00012: Integer read _Getabc_btn_switch_to_on_mtrl_00012;
    {class} property abc_cab_background_internal_bg: Integer read _Getabc_cab_background_internal_bg;
    {class} property abc_cab_background_top_material: Integer read _Getabc_cab_background_top_material;
    {class} property abc_cab_background_top_mtrl_alpha: Integer read _Getabc_cab_background_top_mtrl_alpha;
    {class} property abc_control_background_material: Integer read _Getabc_control_background_material;
    {class} property abc_dialog_material_background: Integer read _Getabc_dialog_material_background;
    {class} property abc_edit_text_material: Integer read _Getabc_edit_text_material;
    {class} property abc_ic_ab_back_material: Integer read _Getabc_ic_ab_back_material;
    {class} property abc_ic_arrow_drop_right_black_24dp: Integer read _Getabc_ic_arrow_drop_right_black_24dp;
    {class} property abc_ic_clear_material: Integer read _Getabc_ic_clear_material;
    {class} property abc_ic_commit_search_api_mtrl_alpha: Integer read _Getabc_ic_commit_search_api_mtrl_alpha;
    {class} property abc_ic_go_search_api_material: Integer read _Getabc_ic_go_search_api_material;
    {class} property abc_ic_menu_copy_mtrl_am_alpha: Integer read _Getabc_ic_menu_copy_mtrl_am_alpha;
    {class} property abc_ic_menu_cut_mtrl_alpha: Integer read _Getabc_ic_menu_cut_mtrl_alpha;
    {class} property abc_ic_menu_overflow_material: Integer read _Getabc_ic_menu_overflow_material;
    {class} property abc_ic_menu_paste_mtrl_am_alpha: Integer read _Getabc_ic_menu_paste_mtrl_am_alpha;
    {class} property abc_ic_menu_selectall_mtrl_alpha: Integer read _Getabc_ic_menu_selectall_mtrl_alpha;
    {class} property abc_ic_menu_share_mtrl_alpha: Integer read _Getabc_ic_menu_share_mtrl_alpha;
    {class} property abc_ic_search_api_material: Integer read _Getabc_ic_search_api_material;
    {class} property abc_ic_star_black_16dp: Integer read _Getabc_ic_star_black_16dp;
    {class} property abc_ic_star_black_36dp: Integer read _Getabc_ic_star_black_36dp;
    {class} property abc_ic_star_black_48dp: Integer read _Getabc_ic_star_black_48dp;
    {class} property abc_ic_star_half_black_16dp: Integer read _Getabc_ic_star_half_black_16dp;
    {class} property abc_ic_star_half_black_36dp: Integer read _Getabc_ic_star_half_black_36dp;
    {class} property abc_ic_star_half_black_48dp: Integer read _Getabc_ic_star_half_black_48dp;
    {class} property abc_ic_voice_search_api_material: Integer read _Getabc_ic_voice_search_api_material;
    {class} property abc_item_background_holo_dark: Integer read _Getabc_item_background_holo_dark;
    {class} property abc_item_background_holo_light: Integer read _Getabc_item_background_holo_light;
    {class} property abc_list_divider_material: Integer read _Getabc_list_divider_material;
    {class} property abc_list_divider_mtrl_alpha: Integer read _Getabc_list_divider_mtrl_alpha;
    {class} property abc_list_focused_holo: Integer read _Getabc_list_focused_holo;
    {class} property abc_list_longpressed_holo: Integer read _Getabc_list_longpressed_holo;
    {class} property abc_list_pressed_holo_dark: Integer read _Getabc_list_pressed_holo_dark;
    {class} property abc_list_pressed_holo_light: Integer read _Getabc_list_pressed_holo_light;
    {class} property abc_list_selector_background_transition_holo_dark: Integer read _Getabc_list_selector_background_transition_holo_dark;
    {class} property abc_list_selector_background_transition_holo_light: Integer read _Getabc_list_selector_background_transition_holo_light;
    {class} property abc_list_selector_disabled_holo_dark: Integer read _Getabc_list_selector_disabled_holo_dark;
    {class} property abc_list_selector_disabled_holo_light: Integer read _Getabc_list_selector_disabled_holo_light;
    {class} property abc_list_selector_holo_dark: Integer read _Getabc_list_selector_holo_dark;
    {class} property abc_list_selector_holo_light: Integer read _Getabc_list_selector_holo_light;
    {class} property abc_menu_hardkey_panel_mtrl_mult: Integer read _Getabc_menu_hardkey_panel_mtrl_mult;
    {class} property abc_popup_background_mtrl_mult: Integer read _Getabc_popup_background_mtrl_mult;
    {class} property abc_ratingbar_indicator_material: Integer read _Getabc_ratingbar_indicator_material;
    {class} property abc_ratingbar_material: Integer read _Getabc_ratingbar_material;
    {class} property abc_ratingbar_small_material: Integer read _Getabc_ratingbar_small_material;
    {class} property abc_scrubber_control_off_mtrl_alpha: Integer read _Getabc_scrubber_control_off_mtrl_alpha;
    {class} property abc_scrubber_control_to_pressed_mtrl_000: Integer read _Getabc_scrubber_control_to_pressed_mtrl_000;
    {class} property abc_scrubber_control_to_pressed_mtrl_005: Integer read _Getabc_scrubber_control_to_pressed_mtrl_005;
    {class} property abc_scrubber_primary_mtrl_alpha: Integer read _Getabc_scrubber_primary_mtrl_alpha;
    {class} property abc_scrubber_track_mtrl_alpha: Integer read _Getabc_scrubber_track_mtrl_alpha;
    {class} property abc_seekbar_thumb_material: Integer read _Getabc_seekbar_thumb_material;
    {class} property abc_seekbar_tick_mark_material: Integer read _Getabc_seekbar_tick_mark_material;
    {class} property abc_seekbar_track_material: Integer read _Getabc_seekbar_track_material;
    {class} property abc_spinner_mtrl_am_alpha: Integer read _Getabc_spinner_mtrl_am_alpha;
    {class} property abc_spinner_textfield_background_material: Integer read _Getabc_spinner_textfield_background_material;
    {class} property abc_switch_thumb_material: Integer read _Getabc_switch_thumb_material;
    {class} property abc_switch_track_mtrl_alpha: Integer read _Getabc_switch_track_mtrl_alpha;
    {class} property abc_tab_indicator_material: Integer read _Getabc_tab_indicator_material;
    {class} property abc_tab_indicator_mtrl_alpha: Integer read _Getabc_tab_indicator_mtrl_alpha;
    {class} property abc_text_cursor_material: Integer read _Getabc_text_cursor_material;
    {class} property abc_text_select_handle_left_mtrl_dark: Integer read _Getabc_text_select_handle_left_mtrl_dark;
    {class} property abc_text_select_handle_left_mtrl_light: Integer read _Getabc_text_select_handle_left_mtrl_light;
    {class} property abc_text_select_handle_middle_mtrl_dark: Integer read _Getabc_text_select_handle_middle_mtrl_dark;
    {class} property abc_text_select_handle_middle_mtrl_light: Integer read _Getabc_text_select_handle_middle_mtrl_light;
    {class} property abc_text_select_handle_right_mtrl_dark: Integer read _Getabc_text_select_handle_right_mtrl_dark;
    {class} property abc_text_select_handle_right_mtrl_light: Integer read _Getabc_text_select_handle_right_mtrl_light;
    {class} property abc_textfield_activated_mtrl_alpha: Integer read _Getabc_textfield_activated_mtrl_alpha;
    {class} property abc_textfield_default_mtrl_alpha: Integer read _Getabc_textfield_default_mtrl_alpha;
    {class} property abc_textfield_search_activated_mtrl_alpha: Integer read _Getabc_textfield_search_activated_mtrl_alpha;
    {class} property abc_textfield_search_default_mtrl_alpha: Integer read _Getabc_textfield_search_default_mtrl_alpha;
    {class} property abc_textfield_search_material: Integer read _Getabc_textfield_search_material;
    {class} property abc_vector_test: Integer read _Getabc_vector_test;
    {class} property ic_camera: Integer read _Getic_camera;
    {class} property ic_flash_auto: Integer read _Getic_flash_auto;
    {class} property ic_flash_off: Integer read _Getic_flash_off;
    {class} property ic_flash_on: Integer read _Getic_flash_on;
    {class} property ic_photo: Integer read _Getic_photo;
    {class} property ic_repeat_black_24dp: Integer read _Getic_repeat_black_24dp;
    {class} property notification_action_background: Integer read _Getnotification_action_background;
    {class} property notification_bg: Integer read _Getnotification_bg;
    {class} property notification_bg_low: Integer read _Getnotification_bg_low;
    {class} property notification_bg_low_normal: Integer read _Getnotification_bg_low_normal;
    {class} property notification_bg_low_pressed: Integer read _Getnotification_bg_low_pressed;
    {class} property notification_bg_normal: Integer read _Getnotification_bg_normal;
    {class} property notification_bg_normal_pressed: Integer read _Getnotification_bg_normal_pressed;
    {class} property notification_icon_background: Integer read _Getnotification_icon_background;
    {class} property notification_template_icon_bg: Integer read _Getnotification_template_icon_bg;
    {class} property notification_template_icon_low_bg: Integer read _Getnotification_template_icon_low_bg;
    {class} property notification_tile_bg: Integer read _Getnotification_tile_bg;
    {class} property notify_panel_notification_icon_bg: Integer read _Getnotify_panel_notification_icon_bg;
    {class} property selector_check_btn_select: Integer read _Getselector_check_btn_select;
    {class} property shape_btn_default: Integer read _Getshape_btn_default;
    {class} property tooltip_frame_dark: Integer read _Gettooltip_frame_dark;
    {class} property tooltip_frame_light: Integer read _Gettooltip_frame_light;
  end;

  [JavaSignature('com/devil/library/media/R$drawable')]
  JR_drawable_110 = interface(JObject)
  ['{A19E86BB-75A2-4EC4-A7B0-24880BAA55C1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_drawable_110 = class(TJavaGenericImport<JR_drawable_110Class, JR_drawable_110>) end;

  JR_id_111Class = interface(JObjectClass)
  ['{8A5B3570-FAE7-4529-A626-E4E728E1DEA9}']
    { static Property Methods }
    {class} function _Getaction0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_activity_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_root: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_bar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_context_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_menu_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_menu_presenter: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_bar_stub: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_mode_close_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getaction_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_chooser_view_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getadd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetalertTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getasync: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getblocking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbtn_selectFolder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbtn_sure: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetbuttonPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcancel_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcapture_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcheckbox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getchronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcontent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcontentPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcustom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetcustomPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdecor_content_parent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getdefault_activity_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getedit_query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getend_padder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getexpand_activities_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getexpanded_menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfl_mediaList: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getforever: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfouce_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getgroup_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gethome: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getimage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getimage_flash: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getimage_photo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getimage_switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getinfo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitalic: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_touch_helper_previous_elevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetivImage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetivPhotoCheaked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_back: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_check: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_folder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_photo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_takePhoto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getiv_videoPlayIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getleft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline_checkBox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline_rootContent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline_topIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getline_videoView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlistMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlist_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmedia_actions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmessage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getmultiply: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmyCameraView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_main_column_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetparentPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprogress_circular: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getprogress_horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getradio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getright_side: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getrl_back: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getrl_bottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getrl_titleBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getrv_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getscreen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollIndicatorDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollIndicatorUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetscrollView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_badge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_close_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_edit_frame: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_go_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_mag_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_plate: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_src_text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_voice_btn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_listview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getshortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getspacer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsplit_action_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_atop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_in: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsrc_over: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_latest_event_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatusbarutil_fake_status_bar_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatusbarutil_translucent_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubmenuarrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsubmit_area: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettabMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_transition_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_event_manager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettag_unhandled_key_listeners: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettext2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextSpacerNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettextSpacerNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettitleDividerNoCustom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettitle_template: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GettopPanel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettv_count: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettv_folderName: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettv_pageTip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gettv_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getuniform: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getup: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetvideoView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getvideo_preview: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetviewLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getvp_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getwrap_content: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_id_111; cdecl;

    { static Property }
    {class} property action0: Integer read _Getaction0;
    {class} property action_bar: Integer read _Getaction_bar;
    {class} property action_bar_activity_content: Integer read _Getaction_bar_activity_content;
    {class} property action_bar_container: Integer read _Getaction_bar_container;
    {class} property action_bar_root: Integer read _Getaction_bar_root;
    {class} property action_bar_spinner: Integer read _Getaction_bar_spinner;
    {class} property action_bar_subtitle: Integer read _Getaction_bar_subtitle;
    {class} property action_bar_title: Integer read _Getaction_bar_title;
    {class} property action_container: Integer read _Getaction_container;
    {class} property action_context_bar: Integer read _Getaction_context_bar;
    {class} property action_divider: Integer read _Getaction_divider;
    {class} property action_image: Integer read _Getaction_image;
    {class} property action_menu_divider: Integer read _Getaction_menu_divider;
    {class} property action_menu_presenter: Integer read _Getaction_menu_presenter;
    {class} property action_mode_bar: Integer read _Getaction_mode_bar;
    {class} property action_mode_bar_stub: Integer read _Getaction_mode_bar_stub;
    {class} property action_mode_close_button: Integer read _Getaction_mode_close_button;
    {class} property action_text: Integer read _Getaction_text;
    {class} property actions: Integer read _Getactions;
    {class} property activity_chooser_view_content: Integer read _Getactivity_chooser_view_content;
    {class} property add: Integer read _Getadd;
    {class} property alertTitle: Integer read _GetalertTitle;
    {class} property async: Integer read _Getasync;
    {class} property blocking: Integer read _Getblocking;
    {class} property bottom: Integer read _Getbottom;
    {class} property btn_selectFolder: Integer read _Getbtn_selectFolder;
    {class} property btn_sure: Integer read _Getbtn_sure;
    {class} property buttonPanel: Integer read _GetbuttonPanel;
    {class} property cancel_action: Integer read _Getcancel_action;
    {class} property capture_layout: Integer read _Getcapture_layout;
    {class} property checkbox: Integer read _Getcheckbox;
    {class} property chronometer: Integer read _Getchronometer;
    {class} property content: Integer read _Getcontent;
    {class} property contentPanel: Integer read _GetcontentPanel;
    {class} property custom: Integer read _Getcustom;
    {class} property customPanel: Integer read _GetcustomPanel;
    {class} property decor_content_parent: Integer read _Getdecor_content_parent;
    {class} property default_activity_button: Integer read _Getdefault_activity_button;
    {class} property edit_query: Integer read _Getedit_query;
    {class} property &end: Integer read _Getend;
    {class} property end_padder: Integer read _Getend_padder;
    {class} property expand_activities_button: Integer read _Getexpand_activities_button;
    {class} property expanded_menu: Integer read _Getexpanded_menu;
    {class} property fl_mediaList: Integer read _Getfl_mediaList;
    {class} property forever: Integer read _Getforever;
    {class} property fouce_view: Integer read _Getfouce_view;
    {class} property group_divider: Integer read _Getgroup_divider;
    {class} property home: Integer read _Gethome;
    {class} property icon: Integer read _Geticon;
    {class} property icon_group: Integer read _Geticon_group;
    {class} property image: Integer read _Getimage;
    {class} property image_flash: Integer read _Getimage_flash;
    {class} property image_photo: Integer read _Getimage_photo;
    {class} property image_switch: Integer read _Getimage_switch;
    {class} property info: Integer read _Getinfo;
    {class} property italic: Integer read _Getitalic;
    {class} property item_touch_helper_previous_elevation: Integer read _Getitem_touch_helper_previous_elevation;
    {class} property ivImage: Integer read _GetivImage;
    {class} property ivPhotoCheaked: Integer read _GetivPhotoCheaked;
    {class} property iv_back: Integer read _Getiv_back;
    {class} property iv_check: Integer read _Getiv_check;
    {class} property iv_folder: Integer read _Getiv_folder;
    {class} property iv_photo: Integer read _Getiv_photo;
    {class} property iv_takePhoto: Integer read _Getiv_takePhoto;
    {class} property iv_videoPlayIcon: Integer read _Getiv_videoPlayIcon;
    {class} property left: Integer read _Getleft;
    {class} property line1: Integer read _Getline1;
    {class} property line3: Integer read _Getline3;
    {class} property line_checkBox: Integer read _Getline_checkBox;
    {class} property line_rootContent: Integer read _Getline_rootContent;
    {class} property line_topIcon: Integer read _Getline_topIcon;
    {class} property line_videoView: Integer read _Getline_videoView;
    {class} property listMode: Integer read _GetlistMode;
    {class} property list_item: Integer read _Getlist_item;
    {class} property media_actions: Integer read _Getmedia_actions;
    {class} property &message: Integer read _Getmessage;
    {class} property multiply: Integer read _Getmultiply;
    {class} property myCameraView: Integer read _GetmyCameraView;
    {class} property none: Integer read _Getnone;
    {class} property normal: Integer read _Getnormal;
    {class} property notification_background: Integer read _Getnotification_background;
    {class} property notification_main_column: Integer read _Getnotification_main_column;
    {class} property notification_main_column_container: Integer read _Getnotification_main_column_container;
    {class} property parentPanel: Integer read _GetparentPanel;
    {class} property progress_circular: Integer read _Getprogress_circular;
    {class} property progress_horizontal: Integer read _Getprogress_horizontal;
    {class} property radio: Integer read _Getradio;
    {class} property right: Integer read _Getright;
    {class} property right_icon: Integer read _Getright_icon;
    {class} property right_side: Integer read _Getright_side;
    {class} property rl_back: Integer read _Getrl_back;
    {class} property rl_bottom: Integer read _Getrl_bottom;
    {class} property rl_titleBar: Integer read _Getrl_titleBar;
    {class} property rv_content: Integer read _Getrv_content;
    {class} property screen: Integer read _Getscreen;
    {class} property scrollIndicatorDown: Integer read _GetscrollIndicatorDown;
    {class} property scrollIndicatorUp: Integer read _GetscrollIndicatorUp;
    {class} property scrollView: Integer read _GetscrollView;
    {class} property search_badge: Integer read _Getsearch_badge;
    {class} property search_bar: Integer read _Getsearch_bar;
    {class} property search_button: Integer read _Getsearch_button;
    {class} property search_close_btn: Integer read _Getsearch_close_btn;
    {class} property search_edit_frame: Integer read _Getsearch_edit_frame;
    {class} property search_go_btn: Integer read _Getsearch_go_btn;
    {class} property search_mag_icon: Integer read _Getsearch_mag_icon;
    {class} property search_plate: Integer read _Getsearch_plate;
    {class} property search_src_text: Integer read _Getsearch_src_text;
    {class} property search_voice_btn: Integer read _Getsearch_voice_btn;
    {class} property select_dialog_listview: Integer read _Getselect_dialog_listview;
    {class} property shortcut: Integer read _Getshortcut;
    {class} property spacer: Integer read _Getspacer;
    {class} property split_action_bar: Integer read _Getsplit_action_bar;
    {class} property src_atop: Integer read _Getsrc_atop;
    {class} property src_in: Integer read _Getsrc_in;
    {class} property src_over: Integer read _Getsrc_over;
    {class} property start: Integer read _Getstart;
    {class} property status_bar_latest_event_content: Integer read _Getstatus_bar_latest_event_content;
    {class} property statusbarutil_fake_status_bar_view: Integer read _Getstatusbarutil_fake_status_bar_view;
    {class} property statusbarutil_translucent_view: Integer read _Getstatusbarutil_translucent_view;
    {class} property submenuarrow: Integer read _Getsubmenuarrow;
    {class} property submit_area: Integer read _Getsubmit_area;
    {class} property tabMode: Integer read _GettabMode;
    {class} property tag_transition_group: Integer read _Gettag_transition_group;
    {class} property tag_unhandled_key_event_manager: Integer read _Gettag_unhandled_key_event_manager;
    {class} property tag_unhandled_key_listeners: Integer read _Gettag_unhandled_key_listeners;
    {class} property text: Integer read _Gettext;
    {class} property text2: Integer read _Gettext2;
    {class} property textSpacerNoButtons: Integer read _GettextSpacerNoButtons;
    {class} property textSpacerNoTitle: Integer read _GettextSpacerNoTitle;
    {class} property time: Integer read _Gettime;
    {class} property title: Integer read _Gettitle;
    {class} property titleDividerNoCustom: Integer read _GettitleDividerNoCustom;
    {class} property title_template: Integer read _Gettitle_template;
    {class} property top: Integer read _Gettop;
    {class} property topPanel: Integer read _GettopPanel;
    {class} property tv_count: Integer read _Gettv_count;
    {class} property tv_folderName: Integer read _Gettv_folderName;
    {class} property tv_pageTip: Integer read _Gettv_pageTip;
    {class} property tv_title: Integer read _Gettv_title;
    {class} property uniform: Integer read _Getuniform;
    {class} property up: Integer read _Getup;
    {class} property videoView: Integer read _GetvideoView;
    {class} property video_preview: Integer read _Getvideo_preview;
    {class} property viewLine: Integer read _GetviewLine;
    {class} property vp_content: Integer read _Getvp_content;
    {class} property wrap_content: Integer read _Getwrap_content;
  end;

  [JavaSignature('com/devil/library/media/R$id')]
  JR_id_111 = interface(JObject)
  ['{00193006-B092-407A-AAAE-8CA9F8ED608F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_id_111 = class(TJavaGenericImport<JR_id_111Class, JR_id_111>) end;

  JR_integer_112Class = interface(JObjectClass)
  ['{0F87653E-4F71-4A64-BA5B-0C28EFB61AC3}']
    { static Property Methods }
    {class} function _Getabc_config_activityDefaultDur: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_config_activityShortDur: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getcancel_button_image_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getconfig_tooltipAnimTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_notification_info_maxnum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_integer_112; cdecl;

    { static Property }
    {class} property abc_config_activityDefaultDur: Integer read _Getabc_config_activityDefaultDur;
    {class} property abc_config_activityShortDur: Integer read _Getabc_config_activityShortDur;
    {class} property cancel_button_image_alpha: Integer read _Getcancel_button_image_alpha;
    {class} property config_tooltipAnimTime: Integer read _Getconfig_tooltipAnimTime;
    {class} property status_bar_notification_info_maxnum: Integer read _Getstatus_bar_notification_info_maxnum;
  end;

  [JavaSignature('com/devil/library/media/R$integer')]
  JR_integer_112 = interface(JObject)
  ['{DD8478AC-F6C5-4F53-B22C-AC34A23D880A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_integer_112 = class(TJavaGenericImport<JR_integer_112Class, JR_integer_112>) end;

  JR_layout_113Class = interface(JObjectClass)
  ['{5F7EA27E-8C93-4B55-8CE2-C579001972FB}']
    { static Property Methods }
    {class} function _Getabc_action_bar_title_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_up_container: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_bar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_close_item_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view_list_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_button_bar_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_alert_dialog_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_cascading_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_dialog_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_expanded_menu_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_checkbox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_list_menu_item_radio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_menu_header_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_popup_menu_item_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_content_include: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_simple: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_simple_overlay_action_mode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_screen_toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_dropdown_item_icons_2line: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_view: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_select_dialog_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_dv_camera: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_dv_esay_video_play: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getactivity_dv_media_select: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfragment_dv_gv_item_watch_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfragment_dv_media_list: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getfragment_dv_watch_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_dv_lv_folder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_dv_pager_img_sel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_dv_rv_first_take_photo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getitem_dv_rv_media_list: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_action_tombstone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_media_cancel_action: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_narrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_big_media_narrow_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_custom_big: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_icon_group: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_lines_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_media_custom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_chronometer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getnotification_template_part_time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_item_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_multichoice_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getselect_dialog_singlechoice_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsupport_simple_spinner_dropdown_item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getview_dv_jcamera: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_layout_113; cdecl;

    { static Property }
    {class} property abc_action_bar_title_item: Integer read _Getabc_action_bar_title_item;
    {class} property abc_action_bar_up_container: Integer read _Getabc_action_bar_up_container;
    {class} property abc_action_menu_item_layout: Integer read _Getabc_action_menu_item_layout;
    {class} property abc_action_menu_layout: Integer read _Getabc_action_menu_layout;
    {class} property abc_action_mode_bar: Integer read _Getabc_action_mode_bar;
    {class} property abc_action_mode_close_item_material: Integer read _Getabc_action_mode_close_item_material;
    {class} property abc_activity_chooser_view: Integer read _Getabc_activity_chooser_view;
    {class} property abc_activity_chooser_view_list_item: Integer read _Getabc_activity_chooser_view_list_item;
    {class} property abc_alert_dialog_button_bar_material: Integer read _Getabc_alert_dialog_button_bar_material;
    {class} property abc_alert_dialog_material: Integer read _Getabc_alert_dialog_material;
    {class} property abc_alert_dialog_title_material: Integer read _Getabc_alert_dialog_title_material;
    {class} property abc_cascading_menu_item_layout: Integer read _Getabc_cascading_menu_item_layout;
    {class} property abc_dialog_title_material: Integer read _Getabc_dialog_title_material;
    {class} property abc_expanded_menu_layout: Integer read _Getabc_expanded_menu_layout;
    {class} property abc_list_menu_item_checkbox: Integer read _Getabc_list_menu_item_checkbox;
    {class} property abc_list_menu_item_icon: Integer read _Getabc_list_menu_item_icon;
    {class} property abc_list_menu_item_layout: Integer read _Getabc_list_menu_item_layout;
    {class} property abc_list_menu_item_radio: Integer read _Getabc_list_menu_item_radio;
    {class} property abc_popup_menu_header_item_layout: Integer read _Getabc_popup_menu_header_item_layout;
    {class} property abc_popup_menu_item_layout: Integer read _Getabc_popup_menu_item_layout;
    {class} property abc_screen_content_include: Integer read _Getabc_screen_content_include;
    {class} property abc_screen_simple: Integer read _Getabc_screen_simple;
    {class} property abc_screen_simple_overlay_action_mode: Integer read _Getabc_screen_simple_overlay_action_mode;
    {class} property abc_screen_toolbar: Integer read _Getabc_screen_toolbar;
    {class} property abc_search_dropdown_item_icons_2line: Integer read _Getabc_search_dropdown_item_icons_2line;
    {class} property abc_search_view: Integer read _Getabc_search_view;
    {class} property abc_select_dialog_material: Integer read _Getabc_select_dialog_material;
    {class} property abc_tooltip: Integer read _Getabc_tooltip;
    {class} property activity_dv_camera: Integer read _Getactivity_dv_camera;
    {class} property activity_dv_esay_video_play: Integer read _Getactivity_dv_esay_video_play;
    {class} property activity_dv_media_select: Integer read _Getactivity_dv_media_select;
    {class} property fragment_dv_gv_item_watch_media: Integer read _Getfragment_dv_gv_item_watch_media;
    {class} property fragment_dv_media_list: Integer read _Getfragment_dv_media_list;
    {class} property fragment_dv_watch_media: Integer read _Getfragment_dv_watch_media;
    {class} property item_dv_lv_folder: Integer read _Getitem_dv_lv_folder;
    {class} property item_dv_pager_img_sel: Integer read _Getitem_dv_pager_img_sel;
    {class} property item_dv_rv_first_take_photo: Integer read _Getitem_dv_rv_first_take_photo;
    {class} property item_dv_rv_media_list: Integer read _Getitem_dv_rv_media_list;
    {class} property notification_action: Integer read _Getnotification_action;
    {class} property notification_action_tombstone: Integer read _Getnotification_action_tombstone;
    {class} property notification_media_action: Integer read _Getnotification_media_action;
    {class} property notification_media_cancel_action: Integer read _Getnotification_media_cancel_action;
    {class} property notification_template_big_media: Integer read _Getnotification_template_big_media;
    {class} property notification_template_big_media_custom: Integer read _Getnotification_template_big_media_custom;
    {class} property notification_template_big_media_narrow: Integer read _Getnotification_template_big_media_narrow;
    {class} property notification_template_big_media_narrow_custom: Integer read _Getnotification_template_big_media_narrow_custom;
    {class} property notification_template_custom_big: Integer read _Getnotification_template_custom_big;
    {class} property notification_template_icon_group: Integer read _Getnotification_template_icon_group;
    {class} property notification_template_lines_media: Integer read _Getnotification_template_lines_media;
    {class} property notification_template_media: Integer read _Getnotification_template_media;
    {class} property notification_template_media_custom: Integer read _Getnotification_template_media_custom;
    {class} property notification_template_part_chronometer: Integer read _Getnotification_template_part_chronometer;
    {class} property notification_template_part_time: Integer read _Getnotification_template_part_time;
    {class} property select_dialog_item_material: Integer read _Getselect_dialog_item_material;
    {class} property select_dialog_multichoice_material: Integer read _Getselect_dialog_multichoice_material;
    {class} property select_dialog_singlechoice_material: Integer read _Getselect_dialog_singlechoice_material;
    {class} property support_simple_spinner_dropdown_item: Integer read _Getsupport_simple_spinner_dropdown_item;
    {class} property view_dv_jcamera: Integer read _Getview_dv_jcamera;
  end;

  [JavaSignature('com/devil/library/media/R$layout')]
  JR_layout_113 = interface(JObject)
  ['{7C452A12-C21F-45BF-9A06-D299AD1BDCEB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_layout_113 = class(TJavaGenericImport<JR_layout_113Class, JR_layout_113>) end;

  JR_mipmap_114Class = interface(JObjectClass)
  ['{B78E0B5B-0229-4E24-BCA4-9C701BBB1098}']
    { static Property Methods }
    {class} function _Geticon_dv_album: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_arrow_left_white_back: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_camera: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_checked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_default_image: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_folder: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_folder_selected: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_switch_camera: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_take_photo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_unchecked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geticon_dv_video_play: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_mipmap_114; cdecl;

    { static Property }
    {class} property icon_dv_album: Integer read _Geticon_dv_album;
    {class} property icon_dv_arrow_left_white_back: Integer read _Geticon_dv_arrow_left_white_back;
    {class} property icon_dv_camera: Integer read _Geticon_dv_camera;
    {class} property icon_dv_checked: Integer read _Geticon_dv_checked;
    {class} property icon_dv_default_image: Integer read _Geticon_dv_default_image;
    {class} property icon_dv_folder: Integer read _Geticon_dv_folder;
    {class} property icon_dv_folder_selected: Integer read _Geticon_dv_folder_selected;
    {class} property icon_dv_switch_camera: Integer read _Geticon_dv_switch_camera;
    {class} property icon_dv_take_photo: Integer read _Geticon_dv_take_photo;
    {class} property icon_dv_unchecked: Integer read _Geticon_dv_unchecked;
    {class} property icon_dv_video_play: Integer read _Geticon_dv_video_play;
  end;

  [JavaSignature('com/devil/library/media/R$mipmap')]
  JR_mipmap_114 = interface(JObject)
  ['{1D57CF3A-A072-476E-AE6C-931A079E93B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_mipmap_114 = class(TJavaGenericImport<JR_mipmap_114Class, JR_mipmap_114>) end;

  JR_string_115Class = interface(JObjectClass)
  ['{486C649A-5B1C-4CF1-ADFC-5FF568618A73}']
    { static Property Methods }
    {class} function _Getabc_action_bar_home_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_bar_up_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_menu_overflow_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_action_mode_done: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activity_chooser_view_see_all: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_activitychooserview_choose_application: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_capital_off: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_capital_on: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_body_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_body_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_button_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_caption_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_1_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_2_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_3_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_display_4_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_headline_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_menu_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_subhead_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_font_family_title_material: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_alt_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_ctrl_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_delete_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_enter_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_function_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_meta_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_shift_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_space_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_menu_sym_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_prepend_shortcut_label: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_search_hint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_clear: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_search: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_submit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_searchview_description_voice: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shareactionprovider_share_with: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_shareactionprovider_share_with_application: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getabc_toolbar_collapse_description: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getapp_name: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getopen_camera_failure: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getpermission_denied_tip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsearch_menu_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstatus_bar_notification_info_overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_string_115; cdecl;

    { static Property }
    {class} property abc_action_bar_home_description: Integer read _Getabc_action_bar_home_description;
    {class} property abc_action_bar_up_description: Integer read _Getabc_action_bar_up_description;
    {class} property abc_action_menu_overflow_description: Integer read _Getabc_action_menu_overflow_description;
    {class} property abc_action_mode_done: Integer read _Getabc_action_mode_done;
    {class} property abc_activity_chooser_view_see_all: Integer read _Getabc_activity_chooser_view_see_all;
    {class} property abc_activitychooserview_choose_application: Integer read _Getabc_activitychooserview_choose_application;
    {class} property abc_capital_off: Integer read _Getabc_capital_off;
    {class} property abc_capital_on: Integer read _Getabc_capital_on;
    {class} property abc_font_family_body_1_material: Integer read _Getabc_font_family_body_1_material;
    {class} property abc_font_family_body_2_material: Integer read _Getabc_font_family_body_2_material;
    {class} property abc_font_family_button_material: Integer read _Getabc_font_family_button_material;
    {class} property abc_font_family_caption_material: Integer read _Getabc_font_family_caption_material;
    {class} property abc_font_family_display_1_material: Integer read _Getabc_font_family_display_1_material;
    {class} property abc_font_family_display_2_material: Integer read _Getabc_font_family_display_2_material;
    {class} property abc_font_family_display_3_material: Integer read _Getabc_font_family_display_3_material;
    {class} property abc_font_family_display_4_material: Integer read _Getabc_font_family_display_4_material;
    {class} property abc_font_family_headline_material: Integer read _Getabc_font_family_headline_material;
    {class} property abc_font_family_menu_material: Integer read _Getabc_font_family_menu_material;
    {class} property abc_font_family_subhead_material: Integer read _Getabc_font_family_subhead_material;
    {class} property abc_font_family_title_material: Integer read _Getabc_font_family_title_material;
    {class} property abc_menu_alt_shortcut_label: Integer read _Getabc_menu_alt_shortcut_label;
    {class} property abc_menu_ctrl_shortcut_label: Integer read _Getabc_menu_ctrl_shortcut_label;
    {class} property abc_menu_delete_shortcut_label: Integer read _Getabc_menu_delete_shortcut_label;
    {class} property abc_menu_enter_shortcut_label: Integer read _Getabc_menu_enter_shortcut_label;
    {class} property abc_menu_function_shortcut_label: Integer read _Getabc_menu_function_shortcut_label;
    {class} property abc_menu_meta_shortcut_label: Integer read _Getabc_menu_meta_shortcut_label;
    {class} property abc_menu_shift_shortcut_label: Integer read _Getabc_menu_shift_shortcut_label;
    {class} property abc_menu_space_shortcut_label: Integer read _Getabc_menu_space_shortcut_label;
    {class} property abc_menu_sym_shortcut_label: Integer read _Getabc_menu_sym_shortcut_label;
    {class} property abc_prepend_shortcut_label: Integer read _Getabc_prepend_shortcut_label;
    {class} property abc_search_hint: Integer read _Getabc_search_hint;
    {class} property abc_searchview_description_clear: Integer read _Getabc_searchview_description_clear;
    {class} property abc_searchview_description_query: Integer read _Getabc_searchview_description_query;
    {class} property abc_searchview_description_search: Integer read _Getabc_searchview_description_search;
    {class} property abc_searchview_description_submit: Integer read _Getabc_searchview_description_submit;
    {class} property abc_searchview_description_voice: Integer read _Getabc_searchview_description_voice;
    {class} property abc_shareactionprovider_share_with: Integer read _Getabc_shareactionprovider_share_with;
    {class} property abc_shareactionprovider_share_with_application: Integer read _Getabc_shareactionprovider_share_with_application;
    {class} property abc_toolbar_collapse_description: Integer read _Getabc_toolbar_collapse_description;
    {class} property app_name: Integer read _Getapp_name;
    {class} property open_camera_failure: Integer read _Getopen_camera_failure;
    {class} property permission_denied_tip: Integer read _Getpermission_denied_tip;
    {class} property search_menu_title: Integer read _Getsearch_menu_title;
    {class} property status_bar_notification_info_overflow: Integer read _Getstatus_bar_notification_info_overflow;
  end;

  [JavaSignature('com/devil/library/media/R$string')]
  JR_string_115 = interface(JObject)
  ['{731E8958-29B0-49E5-A4F4-D29E9258AE66}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_string_115 = class(TJavaGenericImport<JR_string_115Class, JR_string_115>) end;

  JR_style_116Class = interface(JObjectClass)
  ['{C13E4A73-10B2-4407-A25E-1DAFA2F923B6}']
    { static Property Methods }
    {class} function _GetAlertDialog_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_DropDownUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimation_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_AlertDialog_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_AlertDialog_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_DropDownUp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Animation_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_DialogWindowTitle_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_DialogWindowTitleBackground_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Body1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Body2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Caption: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Display4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Headline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Large_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Medium: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Medium_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Small_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Subhead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Subhead_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Button_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_DropDownItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_CompactMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_FixedSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_FixedSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Theme_AppCompat_Light_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dark_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_ThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V21_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V22_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V22_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V23_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V23_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V26_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V28_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V28_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Theme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_ThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_V7_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActionMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Borderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Button_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ButtonBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_CheckBox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_RadioButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_CompoundButton_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DrawerArrowToggle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DrawerArrowToggle_Common: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ImageButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Light_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListMenuView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ListView_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_PopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ProgressBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_ProgressBar_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar_Indicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_RatingBar_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SearchView_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SeekBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_SeekBar_Discrete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Spinner_Underlined: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBase_Widget_AppCompat_Toolbar_Button_Navigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBaseAppTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_ThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V21_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V21_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V25_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_V25_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPlatform_Widget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_DialogWindowTitle_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_ActionBar_TitleItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_DialogTitle_Icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Query: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Text: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlOverlay_Widget_AppCompat_SearchView_MagIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlUnderlay_Widget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRtlUnderlay_Widget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSelTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Body1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Body2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Caption: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Display4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Headline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Large_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Medium: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Medium_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_SearchResult_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_SearchResult_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Small_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Subhead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Subhead_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Tooltip: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_ActionMode_Title_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Button_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_DropDownItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Header: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Large: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_PopupMenu_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Info_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Line2_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Time_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Compat_Notification_Title_Media: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_Widget_AppCompat_Toolbar_Title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_CompactMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DayNight_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_DarkActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_Dialog_MinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_DialogWhenLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_Light_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTheme_AppCompat_NoActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dark_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Dialog_Alert: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetThemeOverlay_AppCompat_Light: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActionMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Borderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Borderless_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Colored: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Button_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ButtonBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ButtonBar_AlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_CheckBox: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_RadioButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_CompoundButton_Switch: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_DrawerArrowToggle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_EditText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ImageButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_Solid: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_Solid_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabBar_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabText_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionBar_TabView_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton_CloseMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionButton_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActionMode_Inverse: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ActivityChooserView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_AutoCompleteTextView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_DropDownItem_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Light_Spinner_DropDown_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListMenuView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListPopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ListView_Menu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupMenu_Overflow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_PopupWindow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ProgressBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_ProgressBar_Horizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar_Indicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_RatingBar_Small: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SearchView: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SearchView_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SeekBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_SeekBar_Discrete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_DropDown: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_DropDown_ActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Spinner_Underlined: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_TextView_SpinnerItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Toolbar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_AppCompat_Toolbar_Button_Navigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionContainer: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Compat_NotificationActionText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWidget_Support_CoordinatorLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_style_116; cdecl;

    { static Property }
    {class} property AlertDialog_AppCompat: Integer read _GetAlertDialog_AppCompat;
    {class} property AlertDialog_AppCompat_Light: Integer read _GetAlertDialog_AppCompat_Light;
    {class} property Animation_AppCompat_Dialog: Integer read _GetAnimation_AppCompat_Dialog;
    {class} property Animation_AppCompat_DropDownUp: Integer read _GetAnimation_AppCompat_DropDownUp;
    {class} property Animation_AppCompat_Tooltip: Integer read _GetAnimation_AppCompat_Tooltip;
    {class} property Base_AlertDialog_AppCompat: Integer read _GetBase_AlertDialog_AppCompat;
    {class} property Base_AlertDialog_AppCompat_Light: Integer read _GetBase_AlertDialog_AppCompat_Light;
    {class} property Base_Animation_AppCompat_Dialog: Integer read _GetBase_Animation_AppCompat_Dialog;
    {class} property Base_Animation_AppCompat_DropDownUp: Integer read _GetBase_Animation_AppCompat_DropDownUp;
    {class} property Base_Animation_AppCompat_Tooltip: Integer read _GetBase_Animation_AppCompat_Tooltip;
    {class} property Base_DialogWindowTitle_AppCompat: Integer read _GetBase_DialogWindowTitle_AppCompat;
    {class} property Base_DialogWindowTitleBackground_AppCompat: Integer read _GetBase_DialogWindowTitleBackground_AppCompat;
    {class} property Base_TextAppearance_AppCompat: Integer read _GetBase_TextAppearance_AppCompat;
    {class} property Base_TextAppearance_AppCompat_Body1: Integer read _GetBase_TextAppearance_AppCompat_Body1;
    {class} property Base_TextAppearance_AppCompat_Body2: Integer read _GetBase_TextAppearance_AppCompat_Body2;
    {class} property Base_TextAppearance_AppCompat_Button: Integer read _GetBase_TextAppearance_AppCompat_Button;
    {class} property Base_TextAppearance_AppCompat_Caption: Integer read _GetBase_TextAppearance_AppCompat_Caption;
    {class} property Base_TextAppearance_AppCompat_Display1: Integer read _GetBase_TextAppearance_AppCompat_Display1;
    {class} property Base_TextAppearance_AppCompat_Display2: Integer read _GetBase_TextAppearance_AppCompat_Display2;
    {class} property Base_TextAppearance_AppCompat_Display3: Integer read _GetBase_TextAppearance_AppCompat_Display3;
    {class} property Base_TextAppearance_AppCompat_Display4: Integer read _GetBase_TextAppearance_AppCompat_Display4;
    {class} property Base_TextAppearance_AppCompat_Headline: Integer read _GetBase_TextAppearance_AppCompat_Headline;
    {class} property Base_TextAppearance_AppCompat_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Inverse;
    {class} property Base_TextAppearance_AppCompat_Large: Integer read _GetBase_TextAppearance_AppCompat_Large;
    {class} property Base_TextAppearance_AppCompat_Large_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Large_Inverse;
    {class} property Base_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer read _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Large;
    {class} property Base_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer read _GetBase_TextAppearance_AppCompat_Light_Widget_PopupMenu_Small;
    {class} property Base_TextAppearance_AppCompat_Medium: Integer read _GetBase_TextAppearance_AppCompat_Medium;
    {class} property Base_TextAppearance_AppCompat_Medium_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Medium_Inverse;
    {class} property Base_TextAppearance_AppCompat_Menu: Integer read _GetBase_TextAppearance_AppCompat_Menu;
    {class} property Base_TextAppearance_AppCompat_SearchResult: Integer read _GetBase_TextAppearance_AppCompat_SearchResult;
    {class} property Base_TextAppearance_AppCompat_SearchResult_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_SearchResult_Subtitle;
    {class} property Base_TextAppearance_AppCompat_SearchResult_Title: Integer read _GetBase_TextAppearance_AppCompat_SearchResult_Title;
    {class} property Base_TextAppearance_AppCompat_Small: Integer read _GetBase_TextAppearance_AppCompat_Small;
    {class} property Base_TextAppearance_AppCompat_Small_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Small_Inverse;
    {class} property Base_TextAppearance_AppCompat_Subhead: Integer read _GetBase_TextAppearance_AppCompat_Subhead;
    {class} property Base_TextAppearance_AppCompat_Subhead_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Subhead_Inverse;
    {class} property Base_TextAppearance_AppCompat_Title: Integer read _GetBase_TextAppearance_AppCompat_Title;
    {class} property Base_TextAppearance_AppCompat_Title_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Title_Inverse;
    {class} property Base_TextAppearance_AppCompat_Tooltip: Integer read _GetBase_TextAppearance_AppCompat_Tooltip;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Menu;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Title: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Subtitle;
    {class} property Base_TextAppearance_AppCompat_Widget_ActionMode_Title: Integer read _GetBase_TextAppearance_AppCompat_Widget_ActionMode_Title;
    {class} property Base_TextAppearance_AppCompat_Widget_Button: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Borderless_Colored;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Colored: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Colored;
    {class} property Base_TextAppearance_AppCompat_Widget_Button_Inverse: Integer read _GetBase_TextAppearance_AppCompat_Widget_Button_Inverse;
    {class} property Base_TextAppearance_AppCompat_Widget_DropDownItem: Integer read _GetBase_TextAppearance_AppCompat_Widget_DropDownItem;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Header;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Large;
    {class} property Base_TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer read _GetBase_TextAppearance_AppCompat_Widget_PopupMenu_Small;
    {class} property Base_TextAppearance_AppCompat_Widget_Switch: Integer read _GetBase_TextAppearance_AppCompat_Widget_Switch;
    {class} property Base_TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer read _GetBase_TextAppearance_AppCompat_Widget_TextView_SpinnerItem;
    {class} property Base_TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer read _GetBase_TextAppearance_Widget_AppCompat_ExpandedMenu_Item;
    {class} property Base_TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer read _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Subtitle;
    {class} property Base_TextAppearance_Widget_AppCompat_Toolbar_Title: Integer read _GetBase_TextAppearance_Widget_AppCompat_Toolbar_Title;
    {class} property Base_Theme_AppCompat: Integer read _GetBase_Theme_AppCompat;
    {class} property Base_Theme_AppCompat_CompactMenu: Integer read _GetBase_Theme_AppCompat_CompactMenu;
    {class} property Base_Theme_AppCompat_Dialog: Integer read _GetBase_Theme_AppCompat_Dialog;
    {class} property Base_Theme_AppCompat_Dialog_Alert: Integer read _GetBase_Theme_AppCompat_Dialog_Alert;
    {class} property Base_Theme_AppCompat_Dialog_FixedSize: Integer read _GetBase_Theme_AppCompat_Dialog_FixedSize;
    {class} property Base_Theme_AppCompat_Dialog_MinWidth: Integer read _GetBase_Theme_AppCompat_Dialog_MinWidth;
    {class} property Base_Theme_AppCompat_DialogWhenLarge: Integer read _GetBase_Theme_AppCompat_DialogWhenLarge;
    {class} property Base_Theme_AppCompat_Light: Integer read _GetBase_Theme_AppCompat_Light;
    {class} property Base_Theme_AppCompat_Light_DarkActionBar: Integer read _GetBase_Theme_AppCompat_Light_DarkActionBar;
    {class} property Base_Theme_AppCompat_Light_Dialog: Integer read _GetBase_Theme_AppCompat_Light_Dialog;
    {class} property Base_Theme_AppCompat_Light_Dialog_Alert: Integer read _GetBase_Theme_AppCompat_Light_Dialog_Alert;
    {class} property Base_Theme_AppCompat_Light_Dialog_FixedSize: Integer read _GetBase_Theme_AppCompat_Light_Dialog_FixedSize;
    {class} property Base_Theme_AppCompat_Light_Dialog_MinWidth: Integer read _GetBase_Theme_AppCompat_Light_Dialog_MinWidth;
    {class} property Base_Theme_AppCompat_Light_DialogWhenLarge: Integer read _GetBase_Theme_AppCompat_Light_DialogWhenLarge;
    {class} property Base_ThemeOverlay_AppCompat: Integer read _GetBase_ThemeOverlay_AppCompat;
    {class} property Base_ThemeOverlay_AppCompat_ActionBar: Integer read _GetBase_ThemeOverlay_AppCompat_ActionBar;
    {class} property Base_ThemeOverlay_AppCompat_Dark: Integer read _GetBase_ThemeOverlay_AppCompat_Dark;
    {class} property Base_ThemeOverlay_AppCompat_Dark_ActionBar: Integer read _GetBase_ThemeOverlay_AppCompat_Dark_ActionBar;
    {class} property Base_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_ThemeOverlay_AppCompat_Dialog_Alert: Integer read _GetBase_ThemeOverlay_AppCompat_Dialog_Alert;
    {class} property Base_ThemeOverlay_AppCompat_Light: Integer read _GetBase_ThemeOverlay_AppCompat_Light;
    {class} property Base_V21_Theme_AppCompat: Integer read _GetBase_V21_Theme_AppCompat;
    {class} property Base_V21_Theme_AppCompat_Dialog: Integer read _GetBase_V21_Theme_AppCompat_Dialog;
    {class} property Base_V21_Theme_AppCompat_Light: Integer read _GetBase_V21_Theme_AppCompat_Light;
    {class} property Base_V21_Theme_AppCompat_Light_Dialog: Integer read _GetBase_V21_Theme_AppCompat_Light_Dialog;
    {class} property Base_V21_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_V21_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_V22_Theme_AppCompat: Integer read _GetBase_V22_Theme_AppCompat;
    {class} property Base_V22_Theme_AppCompat_Light: Integer read _GetBase_V22_Theme_AppCompat_Light;
    {class} property Base_V23_Theme_AppCompat: Integer read _GetBase_V23_Theme_AppCompat;
    {class} property Base_V23_Theme_AppCompat_Light: Integer read _GetBase_V23_Theme_AppCompat_Light;
    {class} property Base_V26_Theme_AppCompat: Integer read _GetBase_V26_Theme_AppCompat;
    {class} property Base_V26_Theme_AppCompat_Light: Integer read _GetBase_V26_Theme_AppCompat_Light;
    {class} property Base_V26_Widget_AppCompat_Toolbar: Integer read _GetBase_V26_Widget_AppCompat_Toolbar;
    {class} property Base_V28_Theme_AppCompat: Integer read _GetBase_V28_Theme_AppCompat;
    {class} property Base_V28_Theme_AppCompat_Light: Integer read _GetBase_V28_Theme_AppCompat_Light;
    {class} property Base_V7_Theme_AppCompat: Integer read _GetBase_V7_Theme_AppCompat;
    {class} property Base_V7_Theme_AppCompat_Dialog: Integer read _GetBase_V7_Theme_AppCompat_Dialog;
    {class} property Base_V7_Theme_AppCompat_Light: Integer read _GetBase_V7_Theme_AppCompat_Light;
    {class} property Base_V7_Theme_AppCompat_Light_Dialog: Integer read _GetBase_V7_Theme_AppCompat_Light_Dialog;
    {class} property Base_V7_ThemeOverlay_AppCompat_Dialog: Integer read _GetBase_V7_ThemeOverlay_AppCompat_Dialog;
    {class} property Base_V7_Widget_AppCompat_AutoCompleteTextView: Integer read _GetBase_V7_Widget_AppCompat_AutoCompleteTextView;
    {class} property Base_V7_Widget_AppCompat_EditText: Integer read _GetBase_V7_Widget_AppCompat_EditText;
    {class} property Base_V7_Widget_AppCompat_Toolbar: Integer read _GetBase_V7_Widget_AppCompat_Toolbar;
    {class} property Base_Widget_AppCompat_ActionBar: Integer read _GetBase_Widget_AppCompat_ActionBar;
    {class} property Base_Widget_AppCompat_ActionBar_Solid: Integer read _GetBase_Widget_AppCompat_ActionBar_Solid;
    {class} property Base_Widget_AppCompat_ActionBar_TabBar: Integer read _GetBase_Widget_AppCompat_ActionBar_TabBar;
    {class} property Base_Widget_AppCompat_ActionBar_TabText: Integer read _GetBase_Widget_AppCompat_ActionBar_TabText;
    {class} property Base_Widget_AppCompat_ActionBar_TabView: Integer read _GetBase_Widget_AppCompat_ActionBar_TabView;
    {class} property Base_Widget_AppCompat_ActionButton: Integer read _GetBase_Widget_AppCompat_ActionButton;
    {class} property Base_Widget_AppCompat_ActionButton_CloseMode: Integer read _GetBase_Widget_AppCompat_ActionButton_CloseMode;
    {class} property Base_Widget_AppCompat_ActionButton_Overflow: Integer read _GetBase_Widget_AppCompat_ActionButton_Overflow;
    {class} property Base_Widget_AppCompat_ActionMode: Integer read _GetBase_Widget_AppCompat_ActionMode;
    {class} property Base_Widget_AppCompat_ActivityChooserView: Integer read _GetBase_Widget_AppCompat_ActivityChooserView;
    {class} property Base_Widget_AppCompat_AutoCompleteTextView: Integer read _GetBase_Widget_AppCompat_AutoCompleteTextView;
    {class} property Base_Widget_AppCompat_Button: Integer read _GetBase_Widget_AppCompat_Button;
    {class} property Base_Widget_AppCompat_Button_Borderless: Integer read _GetBase_Widget_AppCompat_Button_Borderless;
    {class} property Base_Widget_AppCompat_Button_Borderless_Colored: Integer read _GetBase_Widget_AppCompat_Button_Borderless_Colored;
    {class} property Base_Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer read _GetBase_Widget_AppCompat_Button_ButtonBar_AlertDialog;
    {class} property Base_Widget_AppCompat_Button_Colored: Integer read _GetBase_Widget_AppCompat_Button_Colored;
    {class} property Base_Widget_AppCompat_Button_Small: Integer read _GetBase_Widget_AppCompat_Button_Small;
    {class} property Base_Widget_AppCompat_ButtonBar: Integer read _GetBase_Widget_AppCompat_ButtonBar;
    {class} property Base_Widget_AppCompat_ButtonBar_AlertDialog: Integer read _GetBase_Widget_AppCompat_ButtonBar_AlertDialog;
    {class} property Base_Widget_AppCompat_CompoundButton_CheckBox: Integer read _GetBase_Widget_AppCompat_CompoundButton_CheckBox;
    {class} property Base_Widget_AppCompat_CompoundButton_RadioButton: Integer read _GetBase_Widget_AppCompat_CompoundButton_RadioButton;
    {class} property Base_Widget_AppCompat_CompoundButton_Switch: Integer read _GetBase_Widget_AppCompat_CompoundButton_Switch;
    {class} property Base_Widget_AppCompat_DrawerArrowToggle: Integer read _GetBase_Widget_AppCompat_DrawerArrowToggle;
    {class} property Base_Widget_AppCompat_DrawerArrowToggle_Common: Integer read _GetBase_Widget_AppCompat_DrawerArrowToggle_Common;
    {class} property Base_Widget_AppCompat_DropDownItem_Spinner: Integer read _GetBase_Widget_AppCompat_DropDownItem_Spinner;
    {class} property Base_Widget_AppCompat_EditText: Integer read _GetBase_Widget_AppCompat_EditText;
    {class} property Base_Widget_AppCompat_ImageButton: Integer read _GetBase_Widget_AppCompat_ImageButton;
    {class} property Base_Widget_AppCompat_Light_ActionBar: Integer read _GetBase_Widget_AppCompat_Light_ActionBar;
    {class} property Base_Widget_AppCompat_Light_ActionBar_Solid: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_Solid;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabBar: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabBar;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabText: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabText;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabText_Inverse;
    {class} property Base_Widget_AppCompat_Light_ActionBar_TabView: Integer read _GetBase_Widget_AppCompat_Light_ActionBar_TabView;
    {class} property Base_Widget_AppCompat_Light_PopupMenu: Integer read _GetBase_Widget_AppCompat_Light_PopupMenu;
    {class} property Base_Widget_AppCompat_Light_PopupMenu_Overflow: Integer read _GetBase_Widget_AppCompat_Light_PopupMenu_Overflow;
    {class} property Base_Widget_AppCompat_ListMenuView: Integer read _GetBase_Widget_AppCompat_ListMenuView;
    {class} property Base_Widget_AppCompat_ListPopupWindow: Integer read _GetBase_Widget_AppCompat_ListPopupWindow;
    {class} property Base_Widget_AppCompat_ListView: Integer read _GetBase_Widget_AppCompat_ListView;
    {class} property Base_Widget_AppCompat_ListView_DropDown: Integer read _GetBase_Widget_AppCompat_ListView_DropDown;
    {class} property Base_Widget_AppCompat_ListView_Menu: Integer read _GetBase_Widget_AppCompat_ListView_Menu;
    {class} property Base_Widget_AppCompat_PopupMenu: Integer read _GetBase_Widget_AppCompat_PopupMenu;
    {class} property Base_Widget_AppCompat_PopupMenu_Overflow: Integer read _GetBase_Widget_AppCompat_PopupMenu_Overflow;
    {class} property Base_Widget_AppCompat_PopupWindow: Integer read _GetBase_Widget_AppCompat_PopupWindow;
    {class} property Base_Widget_AppCompat_ProgressBar: Integer read _GetBase_Widget_AppCompat_ProgressBar;
    {class} property Base_Widget_AppCompat_ProgressBar_Horizontal: Integer read _GetBase_Widget_AppCompat_ProgressBar_Horizontal;
    {class} property Base_Widget_AppCompat_RatingBar: Integer read _GetBase_Widget_AppCompat_RatingBar;
    {class} property Base_Widget_AppCompat_RatingBar_Indicator: Integer read _GetBase_Widget_AppCompat_RatingBar_Indicator;
    {class} property Base_Widget_AppCompat_RatingBar_Small: Integer read _GetBase_Widget_AppCompat_RatingBar_Small;
    {class} property Base_Widget_AppCompat_SearchView: Integer read _GetBase_Widget_AppCompat_SearchView;
    {class} property Base_Widget_AppCompat_SearchView_ActionBar: Integer read _GetBase_Widget_AppCompat_SearchView_ActionBar;
    {class} property Base_Widget_AppCompat_SeekBar: Integer read _GetBase_Widget_AppCompat_SeekBar;
    {class} property Base_Widget_AppCompat_SeekBar_Discrete: Integer read _GetBase_Widget_AppCompat_SeekBar_Discrete;
    {class} property Base_Widget_AppCompat_Spinner: Integer read _GetBase_Widget_AppCompat_Spinner;
    {class} property Base_Widget_AppCompat_Spinner_Underlined: Integer read _GetBase_Widget_AppCompat_Spinner_Underlined;
    {class} property Base_Widget_AppCompat_TextView_SpinnerItem: Integer read _GetBase_Widget_AppCompat_TextView_SpinnerItem;
    {class} property Base_Widget_AppCompat_Toolbar: Integer read _GetBase_Widget_AppCompat_Toolbar;
    {class} property Base_Widget_AppCompat_Toolbar_Button_Navigation: Integer read _GetBase_Widget_AppCompat_Toolbar_Button_Navigation;
    {class} property BaseAppTheme: Integer read _GetBaseAppTheme;
    {class} property Platform_AppCompat: Integer read _GetPlatform_AppCompat;
    {class} property Platform_AppCompat_Light: Integer read _GetPlatform_AppCompat_Light;
    {class} property Platform_ThemeOverlay_AppCompat: Integer read _GetPlatform_ThemeOverlay_AppCompat;
    {class} property Platform_ThemeOverlay_AppCompat_Dark: Integer read _GetPlatform_ThemeOverlay_AppCompat_Dark;
    {class} property Platform_ThemeOverlay_AppCompat_Light: Integer read _GetPlatform_ThemeOverlay_AppCompat_Light;
    {class} property Platform_V21_AppCompat: Integer read _GetPlatform_V21_AppCompat;
    {class} property Platform_V21_AppCompat_Light: Integer read _GetPlatform_V21_AppCompat_Light;
    {class} property Platform_V25_AppCompat: Integer read _GetPlatform_V25_AppCompat;
    {class} property Platform_V25_AppCompat_Light: Integer read _GetPlatform_V25_AppCompat_Light;
    {class} property Platform_Widget_AppCompat_Spinner: Integer read _GetPlatform_Widget_AppCompat_Spinner;
    {class} property RtlOverlay_DialogWindowTitle_AppCompat: Integer read _GetRtlOverlay_DialogWindowTitle_AppCompat;
    {class} property RtlOverlay_Widget_AppCompat_ActionBar_TitleItem: Integer read _GetRtlOverlay_Widget_AppCompat_ActionBar_TitleItem;
    {class} property RtlOverlay_Widget_AppCompat_DialogTitle_Icon: Integer read _GetRtlOverlay_Widget_AppCompat_DialogTitle_Icon;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_InternalGroup;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Shortcut;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_SubmenuArrow;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Text: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Text;
    {class} property RtlOverlay_Widget_AppCompat_PopupMenuItem_Title: Integer read _GetRtlOverlay_Widget_AppCompat_PopupMenuItem_Title;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Icon1: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon1;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Icon2: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Icon2;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Query: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Query;
    {class} property RtlOverlay_Widget_AppCompat_Search_DropDown_Text: Integer read _GetRtlOverlay_Widget_AppCompat_Search_DropDown_Text;
    {class} property RtlOverlay_Widget_AppCompat_SearchView_MagIcon: Integer read _GetRtlOverlay_Widget_AppCompat_SearchView_MagIcon;
    {class} property RtlUnderlay_Widget_AppCompat_ActionButton: Integer read _GetRtlUnderlay_Widget_AppCompat_ActionButton;
    {class} property RtlUnderlay_Widget_AppCompat_ActionButton_Overflow: Integer read _GetRtlUnderlay_Widget_AppCompat_ActionButton_Overflow;
    {class} property SelTheme: Integer read _GetSelTheme;
    {class} property TextAppearance_AppCompat: Integer read _GetTextAppearance_AppCompat;
    {class} property TextAppearance_AppCompat_Body1: Integer read _GetTextAppearance_AppCompat_Body1;
    {class} property TextAppearance_AppCompat_Body2: Integer read _GetTextAppearance_AppCompat_Body2;
    {class} property TextAppearance_AppCompat_Button: Integer read _GetTextAppearance_AppCompat_Button;
    {class} property TextAppearance_AppCompat_Caption: Integer read _GetTextAppearance_AppCompat_Caption;
    {class} property TextAppearance_AppCompat_Display1: Integer read _GetTextAppearance_AppCompat_Display1;
    {class} property TextAppearance_AppCompat_Display2: Integer read _GetTextAppearance_AppCompat_Display2;
    {class} property TextAppearance_AppCompat_Display3: Integer read _GetTextAppearance_AppCompat_Display3;
    {class} property TextAppearance_AppCompat_Display4: Integer read _GetTextAppearance_AppCompat_Display4;
    {class} property TextAppearance_AppCompat_Headline: Integer read _GetTextAppearance_AppCompat_Headline;
    {class} property TextAppearance_AppCompat_Inverse: Integer read _GetTextAppearance_AppCompat_Inverse;
    {class} property TextAppearance_AppCompat_Large: Integer read _GetTextAppearance_AppCompat_Large;
    {class} property TextAppearance_AppCompat_Large_Inverse: Integer read _GetTextAppearance_AppCompat_Large_Inverse;
    {class} property TextAppearance_AppCompat_Light_SearchResult_Subtitle: Integer read _GetTextAppearance_AppCompat_Light_SearchResult_Subtitle;
    {class} property TextAppearance_AppCompat_Light_SearchResult_Title: Integer read _GetTextAppearance_AppCompat_Light_SearchResult_Title;
    {class} property TextAppearance_AppCompat_Light_Widget_PopupMenu_Large: Integer read _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Large;
    {class} property TextAppearance_AppCompat_Light_Widget_PopupMenu_Small: Integer read _GetTextAppearance_AppCompat_Light_Widget_PopupMenu_Small;
    {class} property TextAppearance_AppCompat_Medium: Integer read _GetTextAppearance_AppCompat_Medium;
    {class} property TextAppearance_AppCompat_Medium_Inverse: Integer read _GetTextAppearance_AppCompat_Medium_Inverse;
    {class} property TextAppearance_AppCompat_Menu: Integer read _GetTextAppearance_AppCompat_Menu;
    {class} property TextAppearance_AppCompat_SearchResult_Subtitle: Integer read _GetTextAppearance_AppCompat_SearchResult_Subtitle;
    {class} property TextAppearance_AppCompat_SearchResult_Title: Integer read _GetTextAppearance_AppCompat_SearchResult_Title;
    {class} property TextAppearance_AppCompat_Small: Integer read _GetTextAppearance_AppCompat_Small;
    {class} property TextAppearance_AppCompat_Small_Inverse: Integer read _GetTextAppearance_AppCompat_Small_Inverse;
    {class} property TextAppearance_AppCompat_Subhead: Integer read _GetTextAppearance_AppCompat_Subhead;
    {class} property TextAppearance_AppCompat_Subhead_Inverse: Integer read _GetTextAppearance_AppCompat_Subhead_Inverse;
    {class} property TextAppearance_AppCompat_Title: Integer read _GetTextAppearance_AppCompat_Title;
    {class} property TextAppearance_AppCompat_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Title_Inverse;
    {class} property TextAppearance_AppCompat_Tooltip: Integer read _GetTextAppearance_AppCompat_Tooltip;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Menu: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Menu;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Subtitle: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Subtitle_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Title: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Title;
    {class} property TextAppearance_AppCompat_Widget_ActionBar_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionBar_Title_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Subtitle: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Subtitle_Inverse;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Title: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Title;
    {class} property TextAppearance_AppCompat_Widget_ActionMode_Title_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_ActionMode_Title_Inverse;
    {class} property TextAppearance_AppCompat_Widget_Button: Integer read _GetTextAppearance_AppCompat_Widget_Button;
    {class} property TextAppearance_AppCompat_Widget_Button_Borderless_Colored: Integer read _GetTextAppearance_AppCompat_Widget_Button_Borderless_Colored;
    {class} property TextAppearance_AppCompat_Widget_Button_Colored: Integer read _GetTextAppearance_AppCompat_Widget_Button_Colored;
    {class} property TextAppearance_AppCompat_Widget_Button_Inverse: Integer read _GetTextAppearance_AppCompat_Widget_Button_Inverse;
    {class} property TextAppearance_AppCompat_Widget_DropDownItem: Integer read _GetTextAppearance_AppCompat_Widget_DropDownItem;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Header: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Header;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Large: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Large;
    {class} property TextAppearance_AppCompat_Widget_PopupMenu_Small: Integer read _GetTextAppearance_AppCompat_Widget_PopupMenu_Small;
    {class} property TextAppearance_AppCompat_Widget_Switch: Integer read _GetTextAppearance_AppCompat_Widget_Switch;
    {class} property TextAppearance_AppCompat_Widget_TextView_SpinnerItem: Integer read _GetTextAppearance_AppCompat_Widget_TextView_SpinnerItem;
    {class} property TextAppearance_Compat_Notification: Integer read _GetTextAppearance_Compat_Notification;
    {class} property TextAppearance_Compat_Notification_Info: Integer read _GetTextAppearance_Compat_Notification_Info;
    {class} property TextAppearance_Compat_Notification_Info_Media: Integer read _GetTextAppearance_Compat_Notification_Info_Media;
    {class} property TextAppearance_Compat_Notification_Line2: Integer read _GetTextAppearance_Compat_Notification_Line2;
    {class} property TextAppearance_Compat_Notification_Line2_Media: Integer read _GetTextAppearance_Compat_Notification_Line2_Media;
    {class} property TextAppearance_Compat_Notification_Media: Integer read _GetTextAppearance_Compat_Notification_Media;
    {class} property TextAppearance_Compat_Notification_Time: Integer read _GetTextAppearance_Compat_Notification_Time;
    {class} property TextAppearance_Compat_Notification_Time_Media: Integer read _GetTextAppearance_Compat_Notification_Time_Media;
    {class} property TextAppearance_Compat_Notification_Title: Integer read _GetTextAppearance_Compat_Notification_Title;
    {class} property TextAppearance_Compat_Notification_Title_Media: Integer read _GetTextAppearance_Compat_Notification_Title_Media;
    {class} property TextAppearance_Widget_AppCompat_ExpandedMenu_Item: Integer read _GetTextAppearance_Widget_AppCompat_ExpandedMenu_Item;
    {class} property TextAppearance_Widget_AppCompat_Toolbar_Subtitle: Integer read _GetTextAppearance_Widget_AppCompat_Toolbar_Subtitle;
    {class} property TextAppearance_Widget_AppCompat_Toolbar_Title: Integer read _GetTextAppearance_Widget_AppCompat_Toolbar_Title;
    {class} property Theme_AppCompat: Integer read _GetTheme_AppCompat;
    {class} property Theme_AppCompat_CompactMenu: Integer read _GetTheme_AppCompat_CompactMenu;
    {class} property Theme_AppCompat_DayNight: Integer read _GetTheme_AppCompat_DayNight;
    {class} property Theme_AppCompat_DayNight_DarkActionBar: Integer read _GetTheme_AppCompat_DayNight_DarkActionBar;
    {class} property Theme_AppCompat_DayNight_Dialog: Integer read _GetTheme_AppCompat_DayNight_Dialog;
    {class} property Theme_AppCompat_DayNight_Dialog_Alert: Integer read _GetTheme_AppCompat_DayNight_Dialog_Alert;
    {class} property Theme_AppCompat_DayNight_Dialog_MinWidth: Integer read _GetTheme_AppCompat_DayNight_Dialog_MinWidth;
    {class} property Theme_AppCompat_DayNight_DialogWhenLarge: Integer read _GetTheme_AppCompat_DayNight_DialogWhenLarge;
    {class} property Theme_AppCompat_DayNight_NoActionBar: Integer read _GetTheme_AppCompat_DayNight_NoActionBar;
    {class} property Theme_AppCompat_Dialog: Integer read _GetTheme_AppCompat_Dialog;
    {class} property Theme_AppCompat_Dialog_Alert: Integer read _GetTheme_AppCompat_Dialog_Alert;
    {class} property Theme_AppCompat_Dialog_MinWidth: Integer read _GetTheme_AppCompat_Dialog_MinWidth;
    {class} property Theme_AppCompat_DialogWhenLarge: Integer read _GetTheme_AppCompat_DialogWhenLarge;
    {class} property Theme_AppCompat_Light: Integer read _GetTheme_AppCompat_Light;
    {class} property Theme_AppCompat_Light_DarkActionBar: Integer read _GetTheme_AppCompat_Light_DarkActionBar;
    {class} property Theme_AppCompat_Light_Dialog: Integer read _GetTheme_AppCompat_Light_Dialog;
    {class} property Theme_AppCompat_Light_Dialog_Alert: Integer read _GetTheme_AppCompat_Light_Dialog_Alert;
    {class} property Theme_AppCompat_Light_Dialog_MinWidth: Integer read _GetTheme_AppCompat_Light_Dialog_MinWidth;
    {class} property Theme_AppCompat_Light_DialogWhenLarge: Integer read _GetTheme_AppCompat_Light_DialogWhenLarge;
    {class} property Theme_AppCompat_Light_NoActionBar: Integer read _GetTheme_AppCompat_Light_NoActionBar;
    {class} property Theme_AppCompat_NoActionBar: Integer read _GetTheme_AppCompat_NoActionBar;
    {class} property ThemeOverlay_AppCompat: Integer read _GetThemeOverlay_AppCompat;
    {class} property ThemeOverlay_AppCompat_ActionBar: Integer read _GetThemeOverlay_AppCompat_ActionBar;
    {class} property ThemeOverlay_AppCompat_Dark: Integer read _GetThemeOverlay_AppCompat_Dark;
    {class} property ThemeOverlay_AppCompat_Dark_ActionBar: Integer read _GetThemeOverlay_AppCompat_Dark_ActionBar;
    {class} property ThemeOverlay_AppCompat_Dialog: Integer read _GetThemeOverlay_AppCompat_Dialog;
    {class} property ThemeOverlay_AppCompat_Dialog_Alert: Integer read _GetThemeOverlay_AppCompat_Dialog_Alert;
    {class} property ThemeOverlay_AppCompat_Light: Integer read _GetThemeOverlay_AppCompat_Light;
    {class} property Widget_AppCompat_ActionBar: Integer read _GetWidget_AppCompat_ActionBar;
    {class} property Widget_AppCompat_ActionBar_Solid: Integer read _GetWidget_AppCompat_ActionBar_Solid;
    {class} property Widget_AppCompat_ActionBar_TabBar: Integer read _GetWidget_AppCompat_ActionBar_TabBar;
    {class} property Widget_AppCompat_ActionBar_TabText: Integer read _GetWidget_AppCompat_ActionBar_TabText;
    {class} property Widget_AppCompat_ActionBar_TabView: Integer read _GetWidget_AppCompat_ActionBar_TabView;
    {class} property Widget_AppCompat_ActionButton: Integer read _GetWidget_AppCompat_ActionButton;
    {class} property Widget_AppCompat_ActionButton_CloseMode: Integer read _GetWidget_AppCompat_ActionButton_CloseMode;
    {class} property Widget_AppCompat_ActionButton_Overflow: Integer read _GetWidget_AppCompat_ActionButton_Overflow;
    {class} property Widget_AppCompat_ActionMode: Integer read _GetWidget_AppCompat_ActionMode;
    {class} property Widget_AppCompat_ActivityChooserView: Integer read _GetWidget_AppCompat_ActivityChooserView;
    {class} property Widget_AppCompat_AutoCompleteTextView: Integer read _GetWidget_AppCompat_AutoCompleteTextView;
    {class} property Widget_AppCompat_Button: Integer read _GetWidget_AppCompat_Button;
    {class} property Widget_AppCompat_Button_Borderless: Integer read _GetWidget_AppCompat_Button_Borderless;
    {class} property Widget_AppCompat_Button_Borderless_Colored: Integer read _GetWidget_AppCompat_Button_Borderless_Colored;
    {class} property Widget_AppCompat_Button_ButtonBar_AlertDialog: Integer read _GetWidget_AppCompat_Button_ButtonBar_AlertDialog;
    {class} property Widget_AppCompat_Button_Colored: Integer read _GetWidget_AppCompat_Button_Colored;
    {class} property Widget_AppCompat_Button_Small: Integer read _GetWidget_AppCompat_Button_Small;
    {class} property Widget_AppCompat_ButtonBar: Integer read _GetWidget_AppCompat_ButtonBar;
    {class} property Widget_AppCompat_ButtonBar_AlertDialog: Integer read _GetWidget_AppCompat_ButtonBar_AlertDialog;
    {class} property Widget_AppCompat_CompoundButton_CheckBox: Integer read _GetWidget_AppCompat_CompoundButton_CheckBox;
    {class} property Widget_AppCompat_CompoundButton_RadioButton: Integer read _GetWidget_AppCompat_CompoundButton_RadioButton;
    {class} property Widget_AppCompat_CompoundButton_Switch: Integer read _GetWidget_AppCompat_CompoundButton_Switch;
    {class} property Widget_AppCompat_DrawerArrowToggle: Integer read _GetWidget_AppCompat_DrawerArrowToggle;
    {class} property Widget_AppCompat_DropDownItem_Spinner: Integer read _GetWidget_AppCompat_DropDownItem_Spinner;
    {class} property Widget_AppCompat_EditText: Integer read _GetWidget_AppCompat_EditText;
    {class} property Widget_AppCompat_ImageButton: Integer read _GetWidget_AppCompat_ImageButton;
    {class} property Widget_AppCompat_Light_ActionBar: Integer read _GetWidget_AppCompat_Light_ActionBar;
    {class} property Widget_AppCompat_Light_ActionBar_Solid: Integer read _GetWidget_AppCompat_Light_ActionBar_Solid;
    {class} property Widget_AppCompat_Light_ActionBar_Solid_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_Solid_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabBar: Integer read _GetWidget_AppCompat_Light_ActionBar_TabBar;
    {class} property Widget_AppCompat_Light_ActionBar_TabBar_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabBar_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabText: Integer read _GetWidget_AppCompat_Light_ActionBar_TabText;
    {class} property Widget_AppCompat_Light_ActionBar_TabText_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabText_Inverse;
    {class} property Widget_AppCompat_Light_ActionBar_TabView: Integer read _GetWidget_AppCompat_Light_ActionBar_TabView;
    {class} property Widget_AppCompat_Light_ActionBar_TabView_Inverse: Integer read _GetWidget_AppCompat_Light_ActionBar_TabView_Inverse;
    {class} property Widget_AppCompat_Light_ActionButton: Integer read _GetWidget_AppCompat_Light_ActionButton;
    {class} property Widget_AppCompat_Light_ActionButton_CloseMode: Integer read _GetWidget_AppCompat_Light_ActionButton_CloseMode;
    {class} property Widget_AppCompat_Light_ActionButton_Overflow: Integer read _GetWidget_AppCompat_Light_ActionButton_Overflow;
    {class} property Widget_AppCompat_Light_ActionMode_Inverse: Integer read _GetWidget_AppCompat_Light_ActionMode_Inverse;
    {class} property Widget_AppCompat_Light_ActivityChooserView: Integer read _GetWidget_AppCompat_Light_ActivityChooserView;
    {class} property Widget_AppCompat_Light_AutoCompleteTextView: Integer read _GetWidget_AppCompat_Light_AutoCompleteTextView;
    {class} property Widget_AppCompat_Light_DropDownItem_Spinner: Integer read _GetWidget_AppCompat_Light_DropDownItem_Spinner;
    {class} property Widget_AppCompat_Light_ListPopupWindow: Integer read _GetWidget_AppCompat_Light_ListPopupWindow;
    {class} property Widget_AppCompat_Light_ListView_DropDown: Integer read _GetWidget_AppCompat_Light_ListView_DropDown;
    {class} property Widget_AppCompat_Light_PopupMenu: Integer read _GetWidget_AppCompat_Light_PopupMenu;
    {class} property Widget_AppCompat_Light_PopupMenu_Overflow: Integer read _GetWidget_AppCompat_Light_PopupMenu_Overflow;
    {class} property Widget_AppCompat_Light_SearchView: Integer read _GetWidget_AppCompat_Light_SearchView;
    {class} property Widget_AppCompat_Light_Spinner_DropDown_ActionBar: Integer read _GetWidget_AppCompat_Light_Spinner_DropDown_ActionBar;
    {class} property Widget_AppCompat_ListMenuView: Integer read _GetWidget_AppCompat_ListMenuView;
    {class} property Widget_AppCompat_ListPopupWindow: Integer read _GetWidget_AppCompat_ListPopupWindow;
    {class} property Widget_AppCompat_ListView: Integer read _GetWidget_AppCompat_ListView;
    {class} property Widget_AppCompat_ListView_DropDown: Integer read _GetWidget_AppCompat_ListView_DropDown;
    {class} property Widget_AppCompat_ListView_Menu: Integer read _GetWidget_AppCompat_ListView_Menu;
    {class} property Widget_AppCompat_PopupMenu: Integer read _GetWidget_AppCompat_PopupMenu;
    {class} property Widget_AppCompat_PopupMenu_Overflow: Integer read _GetWidget_AppCompat_PopupMenu_Overflow;
    {class} property Widget_AppCompat_PopupWindow: Integer read _GetWidget_AppCompat_PopupWindow;
    {class} property Widget_AppCompat_ProgressBar: Integer read _GetWidget_AppCompat_ProgressBar;
    {class} property Widget_AppCompat_ProgressBar_Horizontal: Integer read _GetWidget_AppCompat_ProgressBar_Horizontal;
    {class} property Widget_AppCompat_RatingBar: Integer read _GetWidget_AppCompat_RatingBar;
    {class} property Widget_AppCompat_RatingBar_Indicator: Integer read _GetWidget_AppCompat_RatingBar_Indicator;
    {class} property Widget_AppCompat_RatingBar_Small: Integer read _GetWidget_AppCompat_RatingBar_Small;
    {class} property Widget_AppCompat_SearchView: Integer read _GetWidget_AppCompat_SearchView;
    {class} property Widget_AppCompat_SearchView_ActionBar: Integer read _GetWidget_AppCompat_SearchView_ActionBar;
    {class} property Widget_AppCompat_SeekBar: Integer read _GetWidget_AppCompat_SeekBar;
    {class} property Widget_AppCompat_SeekBar_Discrete: Integer read _GetWidget_AppCompat_SeekBar_Discrete;
    {class} property Widget_AppCompat_Spinner: Integer read _GetWidget_AppCompat_Spinner;
    {class} property Widget_AppCompat_Spinner_DropDown: Integer read _GetWidget_AppCompat_Spinner_DropDown;
    {class} property Widget_AppCompat_Spinner_DropDown_ActionBar: Integer read _GetWidget_AppCompat_Spinner_DropDown_ActionBar;
    {class} property Widget_AppCompat_Spinner_Underlined: Integer read _GetWidget_AppCompat_Spinner_Underlined;
    {class} property Widget_AppCompat_TextView_SpinnerItem: Integer read _GetWidget_AppCompat_TextView_SpinnerItem;
    {class} property Widget_AppCompat_Toolbar: Integer read _GetWidget_AppCompat_Toolbar;
    {class} property Widget_AppCompat_Toolbar_Button_Navigation: Integer read _GetWidget_AppCompat_Toolbar_Button_Navigation;
    {class} property Widget_Compat_NotificationActionContainer: Integer read _GetWidget_Compat_NotificationActionContainer;
    {class} property Widget_Compat_NotificationActionText: Integer read _GetWidget_Compat_NotificationActionText;
    {class} property Widget_Support_CoordinatorLayout: Integer read _GetWidget_Support_CoordinatorLayout;
  end;

  [JavaSignature('com/devil/library/media/R$style')]
  JR_style_116 = interface(JObject)
  ['{8978B4C7-C660-4B02-A006-32826AF0A6CE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_style_116 = class(TJavaGenericImport<JR_style_116Class, JR_style_116>) end;

  JR_styleable_117Class = interface(JObjectClass)
  ['{D45356AD-A484-4927-A0F6-EE25249BE64B}']
    { static Property Methods }
    {class} function _GetActionBar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_backgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_backgroundStacked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_contentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_customNavigationLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_displayOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_elevation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_hideOnContentScroll: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_homeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_homeLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_indeterminateProgressStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_itemPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_logo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_navigationMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_progressBarPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_progressBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_subtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBar_titleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBarLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionBarLayout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMenuItemView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMenuItemView_android_minWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_backgroundSplit: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_closeItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_subtitleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActionMode_titleTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView_expandActivityOverflowButtonDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetActivityChooserView_initialActivityCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_android_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_buttonIconDimen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_buttonPanelSideLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_listItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_listLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_multiChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_showTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAlertDialog_singleChoiceItemLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_constantSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_dither: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_enterFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_exitFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_variablePadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableCompat_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableItem_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_fromId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_reversible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAnimatedStateListDrawableTransition_android_toId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_android_src: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_srcCompat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_tint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatImageView_tintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_android_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMarkTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatSeekBar_tickMarkTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_drawableTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextHelper_android_textAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_android_textAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeMaxTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeMinTextSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizePresetSizes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeStepGranularity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_autoSizeTextType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_firstBaselineToTopHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_lastBaselineToBottomHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_lineHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTextView_textAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarPopupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarSplitStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTabTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionBarWidgetTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionDropDownStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionMenuTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionMenuTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCloseButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCloseDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCopyDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeCutDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeFindDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModePasteDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModePopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeSelectAllDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeShareDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeSplitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionModeWebSearchDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionOverflowButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_actionOverflowMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_activityChooserViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogButtonGroupStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogCenterButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_alertDialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_android_windowAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_android_windowIsFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_autoCompleteTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_borderlessButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarNegativeButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarNeutralButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarPositiveButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_buttonStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_checkboxStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_checkedTextViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorAccent: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorBackgroundFloating: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorButtonNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlActivated: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlHighlight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorControlNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorPrimary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorPrimaryDark: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_colorSwitchThumbNormal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_controlBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogCornerRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogPreferredPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dialogTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dividerHorizontal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dividerVertical: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dropDownListViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_dropdownListPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_editTextStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_homeAsUpIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_imageButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listChoiceBackgroundIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listDividerAlertDialog: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listMenuViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPopupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeightLarge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemHeightSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemPaddingLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_listPreferredItemPaddingRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelMenuListTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_panelMenuListWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_popupMenuStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_popupWindowStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_radioButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyleIndicator: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_ratingBarStyleSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_searchViewStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_seekBarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_selectableItemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_selectableItemBackgroundBorderless: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_spinnerDropDownItemStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_spinnerStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_switchStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceLargePopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItemSecondary: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceListItemSmall: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearancePopupMenuHeader: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSearchResultSubtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSearchResultTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textAppearanceSmallPopupMenu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textColorAlertDialogListItem: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_textColorSearchUrl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_toolbarNavigationButtonStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_toolbarStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_tooltipForegroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_tooltipFrameBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_viewInflaterClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionBar: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionBarOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowActionModeOverlay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedHeightMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedHeightMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowFixedWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowMinWidthMajor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowMinWidthMinor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAppCompatTheme_windowNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetButtonBarLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetButtonBarLayout_allowStacking: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_alpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetColorStateListItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_android_button: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_buttonTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCompoundButton_buttonTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_keylines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_statusBarBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_anchorGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_behavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_insetEdge: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoordinatorLayout_Layout_layout_keyline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_arrowHeadLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_arrowShaftLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_barLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_drawableSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_gapBetweenBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_spinBars: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDrawerArrowToggle_thickness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderAuthority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderCerts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchStrategy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderFetchTimeout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderPackage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamily_fontProviderQuery: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_android_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_font: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontVariationSettings: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_fontWeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFontFamilyFont_ttcIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_centerY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_endY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_gradientRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_startY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_tileMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColor_android_type: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_color: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGradientColorItem_android_offset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_duration_max: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_iconLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_iconMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_iconRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_iconSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCameraView_iconSrc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_baselineAligned: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_baselineAlignedChildIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_orientation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_android_weightSum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_divider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_dividerPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_measureWithLargestChild: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_showDividers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_height: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_weight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLinearLayoutCompat_Layout_android_layout_width: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow_android_dropDownHorizontalOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetListPopupWindow_android_dropDownVerticalOffset: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_checkableBehavior: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_enabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_menuCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_orderInCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuGroup_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionProviderClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_actionViewClass: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_alphabeticModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_alphabeticShortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_checkable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_checked: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_enabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_icon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_menuCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_numericShortcut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_onClick: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_orderInCategory: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_titleCondensed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_contentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_iconTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_iconTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_numericModifiers: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_showAsAction: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuItem_tooltipText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_headerBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_horizontalDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemIconDisabledAlpha: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_itemTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_verticalDivider: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_android_windowAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_preserveIconSpacing: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMenuView_subMenuArrow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_android_popupAnimationStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_android_popupBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindow_overlapAnchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindowBackgroundState: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPopupWindowBackgroundState_state_above_anchor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRatioImageView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRatioImageView_ratio: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView_paddingBottomNoButtons: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecycleListView_paddingTopNoTitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_android_descendantFocusability: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_android_orientation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollEnabled: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollHorizontalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollHorizontalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollVerticalThumbDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_fastScrollVerticalTrackDrawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_layoutManager: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_reverseLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_spanCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecyclerView_stackFromEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_focusable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_imeOptions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_inputType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_android_maxWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_closeIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_commitIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_defaultQueryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_goIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_iconifiedByDefault: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_queryBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_queryHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_searchHintIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_searchIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_submitBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_suggestionRowLayout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSearchView_voiceIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_dropDownWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_entries: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_popupBackground: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_android_prompt: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSpinner_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_constantSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_dither: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_enterFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_exitFadeDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_variablePadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawable_android_visible: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawableItem: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStateListDrawableItem_android_drawable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_textOff: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_textOn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_android_thumb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_showText: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_splitTrack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchMinWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_switchTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTextPadding: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_thumbTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_track: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_trackTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSwitchCompat_trackTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowDx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowDy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_shadowRadius: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColorHint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textColorLink: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_textStyle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_android_typeface: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_fontFamily: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTextAppearance_textAllCaps: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_android_gravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_android_minHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_buttonGravity: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_collapseContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_collapseIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetEndWithActions: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetLeft: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetRight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_contentInsetStartWithNavigation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_logo: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_logoDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_maxButtonHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_navigationContentDescription: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_navigationIcon: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_popupTheme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitle: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_subtitleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_title: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginBottom: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMarginTop: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleMargins: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleTextAppearance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetToolbar_titleTextColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_android_focusable: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_android_theme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_paddingEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_paddingStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetView_theme: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_android_background: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_backgroundTint: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewBackgroundHelper_backgroundTintMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_id: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_inflatedId: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetViewStubCompat_android_layout: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_styleable_117; cdecl;

    { static Property }
    {class} property ActionBar: TJavaArray<Integer> read _GetActionBar;
    {class} property ActionBar_background: Integer read _GetActionBar_background;
    {class} property ActionBar_backgroundSplit: Integer read _GetActionBar_backgroundSplit;
    {class} property ActionBar_backgroundStacked: Integer read _GetActionBar_backgroundStacked;
    {class} property ActionBar_contentInsetEnd: Integer read _GetActionBar_contentInsetEnd;
    {class} property ActionBar_contentInsetEndWithActions: Integer read _GetActionBar_contentInsetEndWithActions;
    {class} property ActionBar_contentInsetLeft: Integer read _GetActionBar_contentInsetLeft;
    {class} property ActionBar_contentInsetRight: Integer read _GetActionBar_contentInsetRight;
    {class} property ActionBar_contentInsetStart: Integer read _GetActionBar_contentInsetStart;
    {class} property ActionBar_contentInsetStartWithNavigation: Integer read _GetActionBar_contentInsetStartWithNavigation;
    {class} property ActionBar_customNavigationLayout: Integer read _GetActionBar_customNavigationLayout;
    {class} property ActionBar_displayOptions: Integer read _GetActionBar_displayOptions;
    {class} property ActionBar_divider: Integer read _GetActionBar_divider;
    {class} property ActionBar_elevation: Integer read _GetActionBar_elevation;
    {class} property ActionBar_height: Integer read _GetActionBar_height;
    {class} property ActionBar_hideOnContentScroll: Integer read _GetActionBar_hideOnContentScroll;
    {class} property ActionBar_homeAsUpIndicator: Integer read _GetActionBar_homeAsUpIndicator;
    {class} property ActionBar_homeLayout: Integer read _GetActionBar_homeLayout;
    {class} property ActionBar_icon: Integer read _GetActionBar_icon;
    {class} property ActionBar_indeterminateProgressStyle: Integer read _GetActionBar_indeterminateProgressStyle;
    {class} property ActionBar_itemPadding: Integer read _GetActionBar_itemPadding;
    {class} property ActionBar_logo: Integer read _GetActionBar_logo;
    {class} property ActionBar_navigationMode: Integer read _GetActionBar_navigationMode;
    {class} property ActionBar_popupTheme: Integer read _GetActionBar_popupTheme;
    {class} property ActionBar_progressBarPadding: Integer read _GetActionBar_progressBarPadding;
    {class} property ActionBar_progressBarStyle: Integer read _GetActionBar_progressBarStyle;
    {class} property ActionBar_subtitle: Integer read _GetActionBar_subtitle;
    {class} property ActionBar_subtitleTextStyle: Integer read _GetActionBar_subtitleTextStyle;
    {class} property ActionBar_title: Integer read _GetActionBar_title;
    {class} property ActionBar_titleTextStyle: Integer read _GetActionBar_titleTextStyle;
    {class} property ActionBarLayout: TJavaArray<Integer> read _GetActionBarLayout;
    {class} property ActionBarLayout_android_layout_gravity: Integer read _GetActionBarLayout_android_layout_gravity;
    {class} property ActionMenuItemView: TJavaArray<Integer> read _GetActionMenuItemView;
    {class} property ActionMenuItemView_android_minWidth: Integer read _GetActionMenuItemView_android_minWidth;
    {class} property ActionMode: TJavaArray<Integer> read _GetActionMode;
    {class} property ActionMode_background: Integer read _GetActionMode_background;
    {class} property ActionMode_backgroundSplit: Integer read _GetActionMode_backgroundSplit;
    {class} property ActionMode_closeItemLayout: Integer read _GetActionMode_closeItemLayout;
    {class} property ActionMode_height: Integer read _GetActionMode_height;
    {class} property ActionMode_subtitleTextStyle: Integer read _GetActionMode_subtitleTextStyle;
    {class} property ActionMode_titleTextStyle: Integer read _GetActionMode_titleTextStyle;
    {class} property ActivityChooserView: TJavaArray<Integer> read _GetActivityChooserView;
    {class} property ActivityChooserView_expandActivityOverflowButtonDrawable: Integer read _GetActivityChooserView_expandActivityOverflowButtonDrawable;
    {class} property ActivityChooserView_initialActivityCount: Integer read _GetActivityChooserView_initialActivityCount;
    {class} property AlertDialog: TJavaArray<Integer> read _GetAlertDialog;
    {class} property AlertDialog_android_layout: Integer read _GetAlertDialog_android_layout;
    {class} property AlertDialog_buttonIconDimen: Integer read _GetAlertDialog_buttonIconDimen;
    {class} property AlertDialog_buttonPanelSideLayout: Integer read _GetAlertDialog_buttonPanelSideLayout;
    {class} property AlertDialog_listItemLayout: Integer read _GetAlertDialog_listItemLayout;
    {class} property AlertDialog_listLayout: Integer read _GetAlertDialog_listLayout;
    {class} property AlertDialog_multiChoiceItemLayout: Integer read _GetAlertDialog_multiChoiceItemLayout;
    {class} property AlertDialog_showTitle: Integer read _GetAlertDialog_showTitle;
    {class} property AlertDialog_singleChoiceItemLayout: Integer read _GetAlertDialog_singleChoiceItemLayout;
    {class} property AnimatedStateListDrawableCompat: TJavaArray<Integer> read _GetAnimatedStateListDrawableCompat;
    {class} property AnimatedStateListDrawableCompat_android_constantSize: Integer read _GetAnimatedStateListDrawableCompat_android_constantSize;
    {class} property AnimatedStateListDrawableCompat_android_dither: Integer read _GetAnimatedStateListDrawableCompat_android_dither;
    {class} property AnimatedStateListDrawableCompat_android_enterFadeDuration: Integer read _GetAnimatedStateListDrawableCompat_android_enterFadeDuration;
    {class} property AnimatedStateListDrawableCompat_android_exitFadeDuration: Integer read _GetAnimatedStateListDrawableCompat_android_exitFadeDuration;
    {class} property AnimatedStateListDrawableCompat_android_variablePadding: Integer read _GetAnimatedStateListDrawableCompat_android_variablePadding;
    {class} property AnimatedStateListDrawableCompat_android_visible: Integer read _GetAnimatedStateListDrawableCompat_android_visible;
    {class} property AnimatedStateListDrawableItem: TJavaArray<Integer> read _GetAnimatedStateListDrawableItem;
    {class} property AnimatedStateListDrawableItem_android_drawable: Integer read _GetAnimatedStateListDrawableItem_android_drawable;
    {class} property AnimatedStateListDrawableItem_android_id: Integer read _GetAnimatedStateListDrawableItem_android_id;
    {class} property AnimatedStateListDrawableTransition: TJavaArray<Integer> read _GetAnimatedStateListDrawableTransition;
    {class} property AnimatedStateListDrawableTransition_android_drawable: Integer read _GetAnimatedStateListDrawableTransition_android_drawable;
    {class} property AnimatedStateListDrawableTransition_android_fromId: Integer read _GetAnimatedStateListDrawableTransition_android_fromId;
    {class} property AnimatedStateListDrawableTransition_android_reversible: Integer read _GetAnimatedStateListDrawableTransition_android_reversible;
    {class} property AnimatedStateListDrawableTransition_android_toId: Integer read _GetAnimatedStateListDrawableTransition_android_toId;
    {class} property AppCompatImageView: TJavaArray<Integer> read _GetAppCompatImageView;
    {class} property AppCompatImageView_android_src: Integer read _GetAppCompatImageView_android_src;
    {class} property AppCompatImageView_srcCompat: Integer read _GetAppCompatImageView_srcCompat;
    {class} property AppCompatImageView_tint: Integer read _GetAppCompatImageView_tint;
    {class} property AppCompatImageView_tintMode: Integer read _GetAppCompatImageView_tintMode;
    {class} property AppCompatSeekBar: TJavaArray<Integer> read _GetAppCompatSeekBar;
    {class} property AppCompatSeekBar_android_thumb: Integer read _GetAppCompatSeekBar_android_thumb;
    {class} property AppCompatSeekBar_tickMark: Integer read _GetAppCompatSeekBar_tickMark;
    {class} property AppCompatSeekBar_tickMarkTint: Integer read _GetAppCompatSeekBar_tickMarkTint;
    {class} property AppCompatSeekBar_tickMarkTintMode: Integer read _GetAppCompatSeekBar_tickMarkTintMode;
    {class} property AppCompatTextHelper: TJavaArray<Integer> read _GetAppCompatTextHelper;
    {class} property AppCompatTextHelper_android_drawableBottom: Integer read _GetAppCompatTextHelper_android_drawableBottom;
    {class} property AppCompatTextHelper_android_drawableEnd: Integer read _GetAppCompatTextHelper_android_drawableEnd;
    {class} property AppCompatTextHelper_android_drawableLeft: Integer read _GetAppCompatTextHelper_android_drawableLeft;
    {class} property AppCompatTextHelper_android_drawableRight: Integer read _GetAppCompatTextHelper_android_drawableRight;
    {class} property AppCompatTextHelper_android_drawableStart: Integer read _GetAppCompatTextHelper_android_drawableStart;
    {class} property AppCompatTextHelper_android_drawableTop: Integer read _GetAppCompatTextHelper_android_drawableTop;
    {class} property AppCompatTextHelper_android_textAppearance: Integer read _GetAppCompatTextHelper_android_textAppearance;
    {class} property AppCompatTextView: TJavaArray<Integer> read _GetAppCompatTextView;
    {class} property AppCompatTextView_android_textAppearance: Integer read _GetAppCompatTextView_android_textAppearance;
    {class} property AppCompatTextView_autoSizeMaxTextSize: Integer read _GetAppCompatTextView_autoSizeMaxTextSize;
    {class} property AppCompatTextView_autoSizeMinTextSize: Integer read _GetAppCompatTextView_autoSizeMinTextSize;
    {class} property AppCompatTextView_autoSizePresetSizes: Integer read _GetAppCompatTextView_autoSizePresetSizes;
    {class} property AppCompatTextView_autoSizeStepGranularity: Integer read _GetAppCompatTextView_autoSizeStepGranularity;
    {class} property AppCompatTextView_autoSizeTextType: Integer read _GetAppCompatTextView_autoSizeTextType;
    {class} property AppCompatTextView_firstBaselineToTopHeight: Integer read _GetAppCompatTextView_firstBaselineToTopHeight;
    {class} property AppCompatTextView_fontFamily: Integer read _GetAppCompatTextView_fontFamily;
    {class} property AppCompatTextView_lastBaselineToBottomHeight: Integer read _GetAppCompatTextView_lastBaselineToBottomHeight;
    {class} property AppCompatTextView_lineHeight: Integer read _GetAppCompatTextView_lineHeight;
    {class} property AppCompatTextView_textAllCaps: Integer read _GetAppCompatTextView_textAllCaps;
    {class} property AppCompatTheme: TJavaArray<Integer> read _GetAppCompatTheme;
    {class} property AppCompatTheme_actionBarDivider: Integer read _GetAppCompatTheme_actionBarDivider;
    {class} property AppCompatTheme_actionBarItemBackground: Integer read _GetAppCompatTheme_actionBarItemBackground;
    {class} property AppCompatTheme_actionBarPopupTheme: Integer read _GetAppCompatTheme_actionBarPopupTheme;
    {class} property AppCompatTheme_actionBarSize: Integer read _GetAppCompatTheme_actionBarSize;
    {class} property AppCompatTheme_actionBarSplitStyle: Integer read _GetAppCompatTheme_actionBarSplitStyle;
    {class} property AppCompatTheme_actionBarStyle: Integer read _GetAppCompatTheme_actionBarStyle;
    {class} property AppCompatTheme_actionBarTabBarStyle: Integer read _GetAppCompatTheme_actionBarTabBarStyle;
    {class} property AppCompatTheme_actionBarTabStyle: Integer read _GetAppCompatTheme_actionBarTabStyle;
    {class} property AppCompatTheme_actionBarTabTextStyle: Integer read _GetAppCompatTheme_actionBarTabTextStyle;
    {class} property AppCompatTheme_actionBarTheme: Integer read _GetAppCompatTheme_actionBarTheme;
    {class} property AppCompatTheme_actionBarWidgetTheme: Integer read _GetAppCompatTheme_actionBarWidgetTheme;
    {class} property AppCompatTheme_actionButtonStyle: Integer read _GetAppCompatTheme_actionButtonStyle;
    {class} property AppCompatTheme_actionDropDownStyle: Integer read _GetAppCompatTheme_actionDropDownStyle;
    {class} property AppCompatTheme_actionMenuTextAppearance: Integer read _GetAppCompatTheme_actionMenuTextAppearance;
    {class} property AppCompatTheme_actionMenuTextColor: Integer read _GetAppCompatTheme_actionMenuTextColor;
    {class} property AppCompatTheme_actionModeBackground: Integer read _GetAppCompatTheme_actionModeBackground;
    {class} property AppCompatTheme_actionModeCloseButtonStyle: Integer read _GetAppCompatTheme_actionModeCloseButtonStyle;
    {class} property AppCompatTheme_actionModeCloseDrawable: Integer read _GetAppCompatTheme_actionModeCloseDrawable;
    {class} property AppCompatTheme_actionModeCopyDrawable: Integer read _GetAppCompatTheme_actionModeCopyDrawable;
    {class} property AppCompatTheme_actionModeCutDrawable: Integer read _GetAppCompatTheme_actionModeCutDrawable;
    {class} property AppCompatTheme_actionModeFindDrawable: Integer read _GetAppCompatTheme_actionModeFindDrawable;
    {class} property AppCompatTheme_actionModePasteDrawable: Integer read _GetAppCompatTheme_actionModePasteDrawable;
    {class} property AppCompatTheme_actionModePopupWindowStyle: Integer read _GetAppCompatTheme_actionModePopupWindowStyle;
    {class} property AppCompatTheme_actionModeSelectAllDrawable: Integer read _GetAppCompatTheme_actionModeSelectAllDrawable;
    {class} property AppCompatTheme_actionModeShareDrawable: Integer read _GetAppCompatTheme_actionModeShareDrawable;
    {class} property AppCompatTheme_actionModeSplitBackground: Integer read _GetAppCompatTheme_actionModeSplitBackground;
    {class} property AppCompatTheme_actionModeStyle: Integer read _GetAppCompatTheme_actionModeStyle;
    {class} property AppCompatTheme_actionModeWebSearchDrawable: Integer read _GetAppCompatTheme_actionModeWebSearchDrawable;
    {class} property AppCompatTheme_actionOverflowButtonStyle: Integer read _GetAppCompatTheme_actionOverflowButtonStyle;
    {class} property AppCompatTheme_actionOverflowMenuStyle: Integer read _GetAppCompatTheme_actionOverflowMenuStyle;
    {class} property AppCompatTheme_activityChooserViewStyle: Integer read _GetAppCompatTheme_activityChooserViewStyle;
    {class} property AppCompatTheme_alertDialogButtonGroupStyle: Integer read _GetAppCompatTheme_alertDialogButtonGroupStyle;
    {class} property AppCompatTheme_alertDialogCenterButtons: Integer read _GetAppCompatTheme_alertDialogCenterButtons;
    {class} property AppCompatTheme_alertDialogStyle: Integer read _GetAppCompatTheme_alertDialogStyle;
    {class} property AppCompatTheme_alertDialogTheme: Integer read _GetAppCompatTheme_alertDialogTheme;
    {class} property AppCompatTheme_android_windowAnimationStyle: Integer read _GetAppCompatTheme_android_windowAnimationStyle;
    {class} property AppCompatTheme_android_windowIsFloating: Integer read _GetAppCompatTheme_android_windowIsFloating;
    {class} property AppCompatTheme_autoCompleteTextViewStyle: Integer read _GetAppCompatTheme_autoCompleteTextViewStyle;
    {class} property AppCompatTheme_borderlessButtonStyle: Integer read _GetAppCompatTheme_borderlessButtonStyle;
    {class} property AppCompatTheme_buttonBarButtonStyle: Integer read _GetAppCompatTheme_buttonBarButtonStyle;
    {class} property AppCompatTheme_buttonBarNegativeButtonStyle: Integer read _GetAppCompatTheme_buttonBarNegativeButtonStyle;
    {class} property AppCompatTheme_buttonBarNeutralButtonStyle: Integer read _GetAppCompatTheme_buttonBarNeutralButtonStyle;
    {class} property AppCompatTheme_buttonBarPositiveButtonStyle: Integer read _GetAppCompatTheme_buttonBarPositiveButtonStyle;
    {class} property AppCompatTheme_buttonBarStyle: Integer read _GetAppCompatTheme_buttonBarStyle;
    {class} property AppCompatTheme_buttonStyle: Integer read _GetAppCompatTheme_buttonStyle;
    {class} property AppCompatTheme_buttonStyleSmall: Integer read _GetAppCompatTheme_buttonStyleSmall;
    {class} property AppCompatTheme_checkboxStyle: Integer read _GetAppCompatTheme_checkboxStyle;
    {class} property AppCompatTheme_checkedTextViewStyle: Integer read _GetAppCompatTheme_checkedTextViewStyle;
    {class} property AppCompatTheme_colorAccent: Integer read _GetAppCompatTheme_colorAccent;
    {class} property AppCompatTheme_colorBackgroundFloating: Integer read _GetAppCompatTheme_colorBackgroundFloating;
    {class} property AppCompatTheme_colorButtonNormal: Integer read _GetAppCompatTheme_colorButtonNormal;
    {class} property AppCompatTheme_colorControlActivated: Integer read _GetAppCompatTheme_colorControlActivated;
    {class} property AppCompatTheme_colorControlHighlight: Integer read _GetAppCompatTheme_colorControlHighlight;
    {class} property AppCompatTheme_colorControlNormal: Integer read _GetAppCompatTheme_colorControlNormal;
    {class} property AppCompatTheme_colorError: Integer read _GetAppCompatTheme_colorError;
    {class} property AppCompatTheme_colorPrimary: Integer read _GetAppCompatTheme_colorPrimary;
    {class} property AppCompatTheme_colorPrimaryDark: Integer read _GetAppCompatTheme_colorPrimaryDark;
    {class} property AppCompatTheme_colorSwitchThumbNormal: Integer read _GetAppCompatTheme_colorSwitchThumbNormal;
    {class} property AppCompatTheme_controlBackground: Integer read _GetAppCompatTheme_controlBackground;
    {class} property AppCompatTheme_dialogCornerRadius: Integer read _GetAppCompatTheme_dialogCornerRadius;
    {class} property AppCompatTheme_dialogPreferredPadding: Integer read _GetAppCompatTheme_dialogPreferredPadding;
    {class} property AppCompatTheme_dialogTheme: Integer read _GetAppCompatTheme_dialogTheme;
    {class} property AppCompatTheme_dividerHorizontal: Integer read _GetAppCompatTheme_dividerHorizontal;
    {class} property AppCompatTheme_dividerVertical: Integer read _GetAppCompatTheme_dividerVertical;
    {class} property AppCompatTheme_dropDownListViewStyle: Integer read _GetAppCompatTheme_dropDownListViewStyle;
    {class} property AppCompatTheme_dropdownListPreferredItemHeight: Integer read _GetAppCompatTheme_dropdownListPreferredItemHeight;
    {class} property AppCompatTheme_editTextBackground: Integer read _GetAppCompatTheme_editTextBackground;
    {class} property AppCompatTheme_editTextColor: Integer read _GetAppCompatTheme_editTextColor;
    {class} property AppCompatTheme_editTextStyle: Integer read _GetAppCompatTheme_editTextStyle;
    {class} property AppCompatTheme_homeAsUpIndicator: Integer read _GetAppCompatTheme_homeAsUpIndicator;
    {class} property AppCompatTheme_imageButtonStyle: Integer read _GetAppCompatTheme_imageButtonStyle;
    {class} property AppCompatTheme_listChoiceBackgroundIndicator: Integer read _GetAppCompatTheme_listChoiceBackgroundIndicator;
    {class} property AppCompatTheme_listDividerAlertDialog: Integer read _GetAppCompatTheme_listDividerAlertDialog;
    {class} property AppCompatTheme_listMenuViewStyle: Integer read _GetAppCompatTheme_listMenuViewStyle;
    {class} property AppCompatTheme_listPopupWindowStyle: Integer read _GetAppCompatTheme_listPopupWindowStyle;
    {class} property AppCompatTheme_listPreferredItemHeight: Integer read _GetAppCompatTheme_listPreferredItemHeight;
    {class} property AppCompatTheme_listPreferredItemHeightLarge: Integer read _GetAppCompatTheme_listPreferredItemHeightLarge;
    {class} property AppCompatTheme_listPreferredItemHeightSmall: Integer read _GetAppCompatTheme_listPreferredItemHeightSmall;
    {class} property AppCompatTheme_listPreferredItemPaddingLeft: Integer read _GetAppCompatTheme_listPreferredItemPaddingLeft;
    {class} property AppCompatTheme_listPreferredItemPaddingRight: Integer read _GetAppCompatTheme_listPreferredItemPaddingRight;
    {class} property AppCompatTheme_panelBackground: Integer read _GetAppCompatTheme_panelBackground;
    {class} property AppCompatTheme_panelMenuListTheme: Integer read _GetAppCompatTheme_panelMenuListTheme;
    {class} property AppCompatTheme_panelMenuListWidth: Integer read _GetAppCompatTheme_panelMenuListWidth;
    {class} property AppCompatTheme_popupMenuStyle: Integer read _GetAppCompatTheme_popupMenuStyle;
    {class} property AppCompatTheme_popupWindowStyle: Integer read _GetAppCompatTheme_popupWindowStyle;
    {class} property AppCompatTheme_radioButtonStyle: Integer read _GetAppCompatTheme_radioButtonStyle;
    {class} property AppCompatTheme_ratingBarStyle: Integer read _GetAppCompatTheme_ratingBarStyle;
    {class} property AppCompatTheme_ratingBarStyleIndicator: Integer read _GetAppCompatTheme_ratingBarStyleIndicator;
    {class} property AppCompatTheme_ratingBarStyleSmall: Integer read _GetAppCompatTheme_ratingBarStyleSmall;
    {class} property AppCompatTheme_searchViewStyle: Integer read _GetAppCompatTheme_searchViewStyle;
    {class} property AppCompatTheme_seekBarStyle: Integer read _GetAppCompatTheme_seekBarStyle;
    {class} property AppCompatTheme_selectableItemBackground: Integer read _GetAppCompatTheme_selectableItemBackground;
    {class} property AppCompatTheme_selectableItemBackgroundBorderless: Integer read _GetAppCompatTheme_selectableItemBackgroundBorderless;
    {class} property AppCompatTheme_spinnerDropDownItemStyle: Integer read _GetAppCompatTheme_spinnerDropDownItemStyle;
    {class} property AppCompatTheme_spinnerStyle: Integer read _GetAppCompatTheme_spinnerStyle;
    {class} property AppCompatTheme_switchStyle: Integer read _GetAppCompatTheme_switchStyle;
    {class} property AppCompatTheme_textAppearanceLargePopupMenu: Integer read _GetAppCompatTheme_textAppearanceLargePopupMenu;
    {class} property AppCompatTheme_textAppearanceListItem: Integer read _GetAppCompatTheme_textAppearanceListItem;
    {class} property AppCompatTheme_textAppearanceListItemSecondary: Integer read _GetAppCompatTheme_textAppearanceListItemSecondary;
    {class} property AppCompatTheme_textAppearanceListItemSmall: Integer read _GetAppCompatTheme_textAppearanceListItemSmall;
    {class} property AppCompatTheme_textAppearancePopupMenuHeader: Integer read _GetAppCompatTheme_textAppearancePopupMenuHeader;
    {class} property AppCompatTheme_textAppearanceSearchResultSubtitle: Integer read _GetAppCompatTheme_textAppearanceSearchResultSubtitle;
    {class} property AppCompatTheme_textAppearanceSearchResultTitle: Integer read _GetAppCompatTheme_textAppearanceSearchResultTitle;
    {class} property AppCompatTheme_textAppearanceSmallPopupMenu: Integer read _GetAppCompatTheme_textAppearanceSmallPopupMenu;
    {class} property AppCompatTheme_textColorAlertDialogListItem: Integer read _GetAppCompatTheme_textColorAlertDialogListItem;
    {class} property AppCompatTheme_textColorSearchUrl: Integer read _GetAppCompatTheme_textColorSearchUrl;
    {class} property AppCompatTheme_toolbarNavigationButtonStyle: Integer read _GetAppCompatTheme_toolbarNavigationButtonStyle;
    {class} property AppCompatTheme_toolbarStyle: Integer read _GetAppCompatTheme_toolbarStyle;
    {class} property AppCompatTheme_tooltipForegroundColor: Integer read _GetAppCompatTheme_tooltipForegroundColor;
    {class} property AppCompatTheme_tooltipFrameBackground: Integer read _GetAppCompatTheme_tooltipFrameBackground;
    {class} property AppCompatTheme_viewInflaterClass: Integer read _GetAppCompatTheme_viewInflaterClass;
    {class} property AppCompatTheme_windowActionBar: Integer read _GetAppCompatTheme_windowActionBar;
    {class} property AppCompatTheme_windowActionBarOverlay: Integer read _GetAppCompatTheme_windowActionBarOverlay;
    {class} property AppCompatTheme_windowActionModeOverlay: Integer read _GetAppCompatTheme_windowActionModeOverlay;
    {class} property AppCompatTheme_windowFixedHeightMajor: Integer read _GetAppCompatTheme_windowFixedHeightMajor;
    {class} property AppCompatTheme_windowFixedHeightMinor: Integer read _GetAppCompatTheme_windowFixedHeightMinor;
    {class} property AppCompatTheme_windowFixedWidthMajor: Integer read _GetAppCompatTheme_windowFixedWidthMajor;
    {class} property AppCompatTheme_windowFixedWidthMinor: Integer read _GetAppCompatTheme_windowFixedWidthMinor;
    {class} property AppCompatTheme_windowMinWidthMajor: Integer read _GetAppCompatTheme_windowMinWidthMajor;
    {class} property AppCompatTheme_windowMinWidthMinor: Integer read _GetAppCompatTheme_windowMinWidthMinor;
    {class} property AppCompatTheme_windowNoTitle: Integer read _GetAppCompatTheme_windowNoTitle;
    {class} property ButtonBarLayout: TJavaArray<Integer> read _GetButtonBarLayout;
    {class} property ButtonBarLayout_allowStacking: Integer read _GetButtonBarLayout_allowStacking;
    {class} property ColorStateListItem: TJavaArray<Integer> read _GetColorStateListItem;
    {class} property ColorStateListItem_alpha: Integer read _GetColorStateListItem_alpha;
    {class} property ColorStateListItem_android_alpha: Integer read _GetColorStateListItem_android_alpha;
    {class} property ColorStateListItem_android_color: Integer read _GetColorStateListItem_android_color;
    {class} property CompoundButton: TJavaArray<Integer> read _GetCompoundButton;
    {class} property CompoundButton_android_button: Integer read _GetCompoundButton_android_button;
    {class} property CompoundButton_buttonTint: Integer read _GetCompoundButton_buttonTint;
    {class} property CompoundButton_buttonTintMode: Integer read _GetCompoundButton_buttonTintMode;
    {class} property CoordinatorLayout: TJavaArray<Integer> read _GetCoordinatorLayout;
    {class} property CoordinatorLayout_keylines: Integer read _GetCoordinatorLayout_keylines;
    {class} property CoordinatorLayout_statusBarBackground: Integer read _GetCoordinatorLayout_statusBarBackground;
    {class} property CoordinatorLayout_Layout: TJavaArray<Integer> read _GetCoordinatorLayout_Layout;
    {class} property CoordinatorLayout_Layout_android_layout_gravity: Integer read _GetCoordinatorLayout_Layout_android_layout_gravity;
    {class} property CoordinatorLayout_Layout_layout_anchor: Integer read _GetCoordinatorLayout_Layout_layout_anchor;
    {class} property CoordinatorLayout_Layout_layout_anchorGravity: Integer read _GetCoordinatorLayout_Layout_layout_anchorGravity;
    {class} property CoordinatorLayout_Layout_layout_behavior: Integer read _GetCoordinatorLayout_Layout_layout_behavior;
    {class} property CoordinatorLayout_Layout_layout_dodgeInsetEdges: Integer read _GetCoordinatorLayout_Layout_layout_dodgeInsetEdges;
    {class} property CoordinatorLayout_Layout_layout_insetEdge: Integer read _GetCoordinatorLayout_Layout_layout_insetEdge;
    {class} property CoordinatorLayout_Layout_layout_keyline: Integer read _GetCoordinatorLayout_Layout_layout_keyline;
    {class} property DrawerArrowToggle: TJavaArray<Integer> read _GetDrawerArrowToggle;
    {class} property DrawerArrowToggle_arrowHeadLength: Integer read _GetDrawerArrowToggle_arrowHeadLength;
    {class} property DrawerArrowToggle_arrowShaftLength: Integer read _GetDrawerArrowToggle_arrowShaftLength;
    {class} property DrawerArrowToggle_barLength: Integer read _GetDrawerArrowToggle_barLength;
    {class} property DrawerArrowToggle_color: Integer read _GetDrawerArrowToggle_color;
    {class} property DrawerArrowToggle_drawableSize: Integer read _GetDrawerArrowToggle_drawableSize;
    {class} property DrawerArrowToggle_gapBetweenBars: Integer read _GetDrawerArrowToggle_gapBetweenBars;
    {class} property DrawerArrowToggle_spinBars: Integer read _GetDrawerArrowToggle_spinBars;
    {class} property DrawerArrowToggle_thickness: Integer read _GetDrawerArrowToggle_thickness;
    {class} property FontFamily: TJavaArray<Integer> read _GetFontFamily;
    {class} property FontFamily_fontProviderAuthority: Integer read _GetFontFamily_fontProviderAuthority;
    {class} property FontFamily_fontProviderCerts: Integer read _GetFontFamily_fontProviderCerts;
    {class} property FontFamily_fontProviderFetchStrategy: Integer read _GetFontFamily_fontProviderFetchStrategy;
    {class} property FontFamily_fontProviderFetchTimeout: Integer read _GetFontFamily_fontProviderFetchTimeout;
    {class} property FontFamily_fontProviderPackage: Integer read _GetFontFamily_fontProviderPackage;
    {class} property FontFamily_fontProviderQuery: Integer read _GetFontFamily_fontProviderQuery;
    {class} property FontFamilyFont: TJavaArray<Integer> read _GetFontFamilyFont;
    {class} property FontFamilyFont_android_font: Integer read _GetFontFamilyFont_android_font;
    {class} property FontFamilyFont_android_fontStyle: Integer read _GetFontFamilyFont_android_fontStyle;
    {class} property FontFamilyFont_android_fontVariationSettings: Integer read _GetFontFamilyFont_android_fontVariationSettings;
    {class} property FontFamilyFont_android_fontWeight: Integer read _GetFontFamilyFont_android_fontWeight;
    {class} property FontFamilyFont_android_ttcIndex: Integer read _GetFontFamilyFont_android_ttcIndex;
    {class} property FontFamilyFont_font: Integer read _GetFontFamilyFont_font;
    {class} property FontFamilyFont_fontStyle: Integer read _GetFontFamilyFont_fontStyle;
    {class} property FontFamilyFont_fontVariationSettings: Integer read _GetFontFamilyFont_fontVariationSettings;
    {class} property FontFamilyFont_fontWeight: Integer read _GetFontFamilyFont_fontWeight;
    {class} property FontFamilyFont_ttcIndex: Integer read _GetFontFamilyFont_ttcIndex;
    {class} property GradientColor: TJavaArray<Integer> read _GetGradientColor;
    {class} property GradientColor_android_centerColor: Integer read _GetGradientColor_android_centerColor;
    {class} property GradientColor_android_centerX: Integer read _GetGradientColor_android_centerX;
    {class} property GradientColor_android_centerY: Integer read _GetGradientColor_android_centerY;
    {class} property GradientColor_android_endColor: Integer read _GetGradientColor_android_endColor;
    {class} property GradientColor_android_endX: Integer read _GetGradientColor_android_endX;
    {class} property GradientColor_android_endY: Integer read _GetGradientColor_android_endY;
    {class} property GradientColor_android_gradientRadius: Integer read _GetGradientColor_android_gradientRadius;
    {class} property GradientColor_android_startColor: Integer read _GetGradientColor_android_startColor;
    {class} property GradientColor_android_startX: Integer read _GetGradientColor_android_startX;
    {class} property GradientColor_android_startY: Integer read _GetGradientColor_android_startY;
    {class} property GradientColor_android_tileMode: Integer read _GetGradientColor_android_tileMode;
    {class} property GradientColor_android_type: Integer read _GetGradientColor_android_type;
    {class} property GradientColorItem: TJavaArray<Integer> read _GetGradientColorItem;
    {class} property GradientColorItem_android_color: Integer read _GetGradientColorItem_android_color;
    {class} property GradientColorItem_android_offset: Integer read _GetGradientColorItem_android_offset;
    {class} property JCameraView: TJavaArray<Integer> read _GetJCameraView;
    {class} property JCameraView_duration_max: Integer read _GetJCameraView_duration_max;
    {class} property JCameraView_iconLeft: Integer read _GetJCameraView_iconLeft;
    {class} property JCameraView_iconMargin: Integer read _GetJCameraView_iconMargin;
    {class} property JCameraView_iconRight: Integer read _GetJCameraView_iconRight;
    {class} property JCameraView_iconSize: Integer read _GetJCameraView_iconSize;
    {class} property JCameraView_iconSrc: Integer read _GetJCameraView_iconSrc;
    {class} property LinearLayoutCompat: TJavaArray<Integer> read _GetLinearLayoutCompat;
    {class} property LinearLayoutCompat_android_baselineAligned: Integer read _GetLinearLayoutCompat_android_baselineAligned;
    {class} property LinearLayoutCompat_android_baselineAlignedChildIndex: Integer read _GetLinearLayoutCompat_android_baselineAlignedChildIndex;
    {class} property LinearLayoutCompat_android_gravity: Integer read _GetLinearLayoutCompat_android_gravity;
    {class} property LinearLayoutCompat_android_orientation: Integer read _GetLinearLayoutCompat_android_orientation;
    {class} property LinearLayoutCompat_android_weightSum: Integer read _GetLinearLayoutCompat_android_weightSum;
    {class} property LinearLayoutCompat_divider: Integer read _GetLinearLayoutCompat_divider;
    {class} property LinearLayoutCompat_dividerPadding: Integer read _GetLinearLayoutCompat_dividerPadding;
    {class} property LinearLayoutCompat_measureWithLargestChild: Integer read _GetLinearLayoutCompat_measureWithLargestChild;
    {class} property LinearLayoutCompat_showDividers: Integer read _GetLinearLayoutCompat_showDividers;
    {class} property LinearLayoutCompat_Layout: TJavaArray<Integer> read _GetLinearLayoutCompat_Layout;
    {class} property LinearLayoutCompat_Layout_android_layout_gravity: Integer read _GetLinearLayoutCompat_Layout_android_layout_gravity;
    {class} property LinearLayoutCompat_Layout_android_layout_height: Integer read _GetLinearLayoutCompat_Layout_android_layout_height;
    {class} property LinearLayoutCompat_Layout_android_layout_weight: Integer read _GetLinearLayoutCompat_Layout_android_layout_weight;
    {class} property LinearLayoutCompat_Layout_android_layout_width: Integer read _GetLinearLayoutCompat_Layout_android_layout_width;
    {class} property ListPopupWindow: TJavaArray<Integer> read _GetListPopupWindow;
    {class} property ListPopupWindow_android_dropDownHorizontalOffset: Integer read _GetListPopupWindow_android_dropDownHorizontalOffset;
    {class} property ListPopupWindow_android_dropDownVerticalOffset: Integer read _GetListPopupWindow_android_dropDownVerticalOffset;
    {class} property MenuGroup: TJavaArray<Integer> read _GetMenuGroup;
    {class} property MenuGroup_android_checkableBehavior: Integer read _GetMenuGroup_android_checkableBehavior;
    {class} property MenuGroup_android_enabled: Integer read _GetMenuGroup_android_enabled;
    {class} property MenuGroup_android_id: Integer read _GetMenuGroup_android_id;
    {class} property MenuGroup_android_menuCategory: Integer read _GetMenuGroup_android_menuCategory;
    {class} property MenuGroup_android_orderInCategory: Integer read _GetMenuGroup_android_orderInCategory;
    {class} property MenuGroup_android_visible: Integer read _GetMenuGroup_android_visible;
    {class} property MenuItem: TJavaArray<Integer> read _GetMenuItem;
    {class} property MenuItem_actionLayout: Integer read _GetMenuItem_actionLayout;
    {class} property MenuItem_actionProviderClass: Integer read _GetMenuItem_actionProviderClass;
    {class} property MenuItem_actionViewClass: Integer read _GetMenuItem_actionViewClass;
    {class} property MenuItem_alphabeticModifiers: Integer read _GetMenuItem_alphabeticModifiers;
    {class} property MenuItem_android_alphabeticShortcut: Integer read _GetMenuItem_android_alphabeticShortcut;
    {class} property MenuItem_android_checkable: Integer read _GetMenuItem_android_checkable;
    {class} property MenuItem_android_checked: Integer read _GetMenuItem_android_checked;
    {class} property MenuItem_android_enabled: Integer read _GetMenuItem_android_enabled;
    {class} property MenuItem_android_icon: Integer read _GetMenuItem_android_icon;
    {class} property MenuItem_android_id: Integer read _GetMenuItem_android_id;
    {class} property MenuItem_android_menuCategory: Integer read _GetMenuItem_android_menuCategory;
    {class} property MenuItem_android_numericShortcut: Integer read _GetMenuItem_android_numericShortcut;
    {class} property MenuItem_android_onClick: Integer read _GetMenuItem_android_onClick;
    {class} property MenuItem_android_orderInCategory: Integer read _GetMenuItem_android_orderInCategory;
    {class} property MenuItem_android_title: Integer read _GetMenuItem_android_title;
    {class} property MenuItem_android_titleCondensed: Integer read _GetMenuItem_android_titleCondensed;
    {class} property MenuItem_android_visible: Integer read _GetMenuItem_android_visible;
    {class} property MenuItem_contentDescription: Integer read _GetMenuItem_contentDescription;
    {class} property MenuItem_iconTint: Integer read _GetMenuItem_iconTint;
    {class} property MenuItem_iconTintMode: Integer read _GetMenuItem_iconTintMode;
    {class} property MenuItem_numericModifiers: Integer read _GetMenuItem_numericModifiers;
    {class} property MenuItem_showAsAction: Integer read _GetMenuItem_showAsAction;
    {class} property MenuItem_tooltipText: Integer read _GetMenuItem_tooltipText;
    {class} property MenuView: TJavaArray<Integer> read _GetMenuView;
    {class} property MenuView_android_headerBackground: Integer read _GetMenuView_android_headerBackground;
    {class} property MenuView_android_horizontalDivider: Integer read _GetMenuView_android_horizontalDivider;
    {class} property MenuView_android_itemBackground: Integer read _GetMenuView_android_itemBackground;
    {class} property MenuView_android_itemIconDisabledAlpha: Integer read _GetMenuView_android_itemIconDisabledAlpha;
    {class} property MenuView_android_itemTextAppearance: Integer read _GetMenuView_android_itemTextAppearance;
    {class} property MenuView_android_verticalDivider: Integer read _GetMenuView_android_verticalDivider;
    {class} property MenuView_android_windowAnimationStyle: Integer read _GetMenuView_android_windowAnimationStyle;
    {class} property MenuView_preserveIconSpacing: Integer read _GetMenuView_preserveIconSpacing;
    {class} property MenuView_subMenuArrow: Integer read _GetMenuView_subMenuArrow;
    {class} property PopupWindow: TJavaArray<Integer> read _GetPopupWindow;
    {class} property PopupWindow_android_popupAnimationStyle: Integer read _GetPopupWindow_android_popupAnimationStyle;
    {class} property PopupWindow_android_popupBackground: Integer read _GetPopupWindow_android_popupBackground;
    {class} property PopupWindow_overlapAnchor: Integer read _GetPopupWindow_overlapAnchor;
    {class} property PopupWindowBackgroundState: TJavaArray<Integer> read _GetPopupWindowBackgroundState;
    {class} property PopupWindowBackgroundState_state_above_anchor: Integer read _GetPopupWindowBackgroundState_state_above_anchor;
    {class} property RatioImageView: TJavaArray<Integer> read _GetRatioImageView;
    {class} property RatioImageView_ratio: Integer read _GetRatioImageView_ratio;
    {class} property RecycleListView: TJavaArray<Integer> read _GetRecycleListView;
    {class} property RecycleListView_paddingBottomNoButtons: Integer read _GetRecycleListView_paddingBottomNoButtons;
    {class} property RecycleListView_paddingTopNoTitle: Integer read _GetRecycleListView_paddingTopNoTitle;
    {class} property RecyclerView: TJavaArray<Integer> read _GetRecyclerView;
    {class} property RecyclerView_android_descendantFocusability: Integer read _GetRecyclerView_android_descendantFocusability;
    {class} property RecyclerView_android_orientation: Integer read _GetRecyclerView_android_orientation;
    {class} property RecyclerView_fastScrollEnabled: Integer read _GetRecyclerView_fastScrollEnabled;
    {class} property RecyclerView_fastScrollHorizontalThumbDrawable: Integer read _GetRecyclerView_fastScrollHorizontalThumbDrawable;
    {class} property RecyclerView_fastScrollHorizontalTrackDrawable: Integer read _GetRecyclerView_fastScrollHorizontalTrackDrawable;
    {class} property RecyclerView_fastScrollVerticalThumbDrawable: Integer read _GetRecyclerView_fastScrollVerticalThumbDrawable;
    {class} property RecyclerView_fastScrollVerticalTrackDrawable: Integer read _GetRecyclerView_fastScrollVerticalTrackDrawable;
    {class} property RecyclerView_layoutManager: Integer read _GetRecyclerView_layoutManager;
    {class} property RecyclerView_reverseLayout: Integer read _GetRecyclerView_reverseLayout;
    {class} property RecyclerView_spanCount: Integer read _GetRecyclerView_spanCount;
    {class} property RecyclerView_stackFromEnd: Integer read _GetRecyclerView_stackFromEnd;
    {class} property SearchView: TJavaArray<Integer> read _GetSearchView;
    {class} property SearchView_android_focusable: Integer read _GetSearchView_android_focusable;
    {class} property SearchView_android_imeOptions: Integer read _GetSearchView_android_imeOptions;
    {class} property SearchView_android_inputType: Integer read _GetSearchView_android_inputType;
    {class} property SearchView_android_maxWidth: Integer read _GetSearchView_android_maxWidth;
    {class} property SearchView_closeIcon: Integer read _GetSearchView_closeIcon;
    {class} property SearchView_commitIcon: Integer read _GetSearchView_commitIcon;
    {class} property SearchView_defaultQueryHint: Integer read _GetSearchView_defaultQueryHint;
    {class} property SearchView_goIcon: Integer read _GetSearchView_goIcon;
    {class} property SearchView_iconifiedByDefault: Integer read _GetSearchView_iconifiedByDefault;
    {class} property SearchView_layout: Integer read _GetSearchView_layout;
    {class} property SearchView_queryBackground: Integer read _GetSearchView_queryBackground;
    {class} property SearchView_queryHint: Integer read _GetSearchView_queryHint;
    {class} property SearchView_searchHintIcon: Integer read _GetSearchView_searchHintIcon;
    {class} property SearchView_searchIcon: Integer read _GetSearchView_searchIcon;
    {class} property SearchView_submitBackground: Integer read _GetSearchView_submitBackground;
    {class} property SearchView_suggestionRowLayout: Integer read _GetSearchView_suggestionRowLayout;
    {class} property SearchView_voiceIcon: Integer read _GetSearchView_voiceIcon;
    {class} property Spinner: TJavaArray<Integer> read _GetSpinner;
    {class} property Spinner_android_dropDownWidth: Integer read _GetSpinner_android_dropDownWidth;
    {class} property Spinner_android_entries: Integer read _GetSpinner_android_entries;
    {class} property Spinner_android_popupBackground: Integer read _GetSpinner_android_popupBackground;
    {class} property Spinner_android_prompt: Integer read _GetSpinner_android_prompt;
    {class} property Spinner_popupTheme: Integer read _GetSpinner_popupTheme;
    {class} property StateListDrawable: TJavaArray<Integer> read _GetStateListDrawable;
    {class} property StateListDrawable_android_constantSize: Integer read _GetStateListDrawable_android_constantSize;
    {class} property StateListDrawable_android_dither: Integer read _GetStateListDrawable_android_dither;
    {class} property StateListDrawable_android_enterFadeDuration: Integer read _GetStateListDrawable_android_enterFadeDuration;
    {class} property StateListDrawable_android_exitFadeDuration: Integer read _GetStateListDrawable_android_exitFadeDuration;
    {class} property StateListDrawable_android_variablePadding: Integer read _GetStateListDrawable_android_variablePadding;
    {class} property StateListDrawable_android_visible: Integer read _GetStateListDrawable_android_visible;
    {class} property StateListDrawableItem: TJavaArray<Integer> read _GetStateListDrawableItem;
    {class} property StateListDrawableItem_android_drawable: Integer read _GetStateListDrawableItem_android_drawable;
    {class} property SwitchCompat: TJavaArray<Integer> read _GetSwitchCompat;
    {class} property SwitchCompat_android_textOff: Integer read _GetSwitchCompat_android_textOff;
    {class} property SwitchCompat_android_textOn: Integer read _GetSwitchCompat_android_textOn;
    {class} property SwitchCompat_android_thumb: Integer read _GetSwitchCompat_android_thumb;
    {class} property SwitchCompat_showText: Integer read _GetSwitchCompat_showText;
    {class} property SwitchCompat_splitTrack: Integer read _GetSwitchCompat_splitTrack;
    {class} property SwitchCompat_switchMinWidth: Integer read _GetSwitchCompat_switchMinWidth;
    {class} property SwitchCompat_switchPadding: Integer read _GetSwitchCompat_switchPadding;
    {class} property SwitchCompat_switchTextAppearance: Integer read _GetSwitchCompat_switchTextAppearance;
    {class} property SwitchCompat_thumbTextPadding: Integer read _GetSwitchCompat_thumbTextPadding;
    {class} property SwitchCompat_thumbTint: Integer read _GetSwitchCompat_thumbTint;
    {class} property SwitchCompat_thumbTintMode: Integer read _GetSwitchCompat_thumbTintMode;
    {class} property SwitchCompat_track: Integer read _GetSwitchCompat_track;
    {class} property SwitchCompat_trackTint: Integer read _GetSwitchCompat_trackTint;
    {class} property SwitchCompat_trackTintMode: Integer read _GetSwitchCompat_trackTintMode;
    {class} property TextAppearance: TJavaArray<Integer> read _GetTextAppearance;
    {class} property TextAppearance_android_fontFamily: Integer read _GetTextAppearance_android_fontFamily;
    {class} property TextAppearance_android_shadowColor: Integer read _GetTextAppearance_android_shadowColor;
    {class} property TextAppearance_android_shadowDx: Integer read _GetTextAppearance_android_shadowDx;
    {class} property TextAppearance_android_shadowDy: Integer read _GetTextAppearance_android_shadowDy;
    {class} property TextAppearance_android_shadowRadius: Integer read _GetTextAppearance_android_shadowRadius;
    {class} property TextAppearance_android_textColor: Integer read _GetTextAppearance_android_textColor;
    {class} property TextAppearance_android_textColorHint: Integer read _GetTextAppearance_android_textColorHint;
    {class} property TextAppearance_android_textColorLink: Integer read _GetTextAppearance_android_textColorLink;
    {class} property TextAppearance_android_textSize: Integer read _GetTextAppearance_android_textSize;
    {class} property TextAppearance_android_textStyle: Integer read _GetTextAppearance_android_textStyle;
    {class} property TextAppearance_android_typeface: Integer read _GetTextAppearance_android_typeface;
    {class} property TextAppearance_fontFamily: Integer read _GetTextAppearance_fontFamily;
    {class} property TextAppearance_textAllCaps: Integer read _GetTextAppearance_textAllCaps;
    {class} property Toolbar: TJavaArray<Integer> read _GetToolbar;
    {class} property Toolbar_android_gravity: Integer read _GetToolbar_android_gravity;
    {class} property Toolbar_android_minHeight: Integer read _GetToolbar_android_minHeight;
    {class} property Toolbar_buttonGravity: Integer read _GetToolbar_buttonGravity;
    {class} property Toolbar_collapseContentDescription: Integer read _GetToolbar_collapseContentDescription;
    {class} property Toolbar_collapseIcon: Integer read _GetToolbar_collapseIcon;
    {class} property Toolbar_contentInsetEnd: Integer read _GetToolbar_contentInsetEnd;
    {class} property Toolbar_contentInsetEndWithActions: Integer read _GetToolbar_contentInsetEndWithActions;
    {class} property Toolbar_contentInsetLeft: Integer read _GetToolbar_contentInsetLeft;
    {class} property Toolbar_contentInsetRight: Integer read _GetToolbar_contentInsetRight;
    {class} property Toolbar_contentInsetStart: Integer read _GetToolbar_contentInsetStart;
    {class} property Toolbar_contentInsetStartWithNavigation: Integer read _GetToolbar_contentInsetStartWithNavigation;
    {class} property Toolbar_logo: Integer read _GetToolbar_logo;
    {class} property Toolbar_logoDescription: Integer read _GetToolbar_logoDescription;
    {class} property Toolbar_maxButtonHeight: Integer read _GetToolbar_maxButtonHeight;
    {class} property Toolbar_navigationContentDescription: Integer read _GetToolbar_navigationContentDescription;
    {class} property Toolbar_navigationIcon: Integer read _GetToolbar_navigationIcon;
    {class} property Toolbar_popupTheme: Integer read _GetToolbar_popupTheme;
    {class} property Toolbar_subtitle: Integer read _GetToolbar_subtitle;
    {class} property Toolbar_subtitleTextAppearance: Integer read _GetToolbar_subtitleTextAppearance;
    {class} property Toolbar_subtitleTextColor: Integer read _GetToolbar_subtitleTextColor;
    {class} property Toolbar_title: Integer read _GetToolbar_title;
    {class} property Toolbar_titleMargin: Integer read _GetToolbar_titleMargin;
    {class} property Toolbar_titleMarginBottom: Integer read _GetToolbar_titleMarginBottom;
    {class} property Toolbar_titleMarginEnd: Integer read _GetToolbar_titleMarginEnd;
    {class} property Toolbar_titleMarginStart: Integer read _GetToolbar_titleMarginStart;
    {class} property Toolbar_titleMarginTop: Integer read _GetToolbar_titleMarginTop;
    {class} property Toolbar_titleMargins: Integer read _GetToolbar_titleMargins;
    {class} property Toolbar_titleTextAppearance: Integer read _GetToolbar_titleTextAppearance;
    {class} property Toolbar_titleTextColor: Integer read _GetToolbar_titleTextColor;
    {class} property View: TJavaArray<Integer> read _GetView;
    {class} property View_android_focusable: Integer read _GetView_android_focusable;
    {class} property View_android_theme: Integer read _GetView_android_theme;
    {class} property View_paddingEnd: Integer read _GetView_paddingEnd;
    {class} property View_paddingStart: Integer read _GetView_paddingStart;
    {class} property View_theme: Integer read _GetView_theme;
    {class} property ViewBackgroundHelper: TJavaArray<Integer> read _GetViewBackgroundHelper;
    {class} property ViewBackgroundHelper_android_background: Integer read _GetViewBackgroundHelper_android_background;
    {class} property ViewBackgroundHelper_backgroundTint: Integer read _GetViewBackgroundHelper_backgroundTint;
    {class} property ViewBackgroundHelper_backgroundTintMode: Integer read _GetViewBackgroundHelper_backgroundTintMode;
    {class} property ViewStubCompat: TJavaArray<Integer> read _GetViewStubCompat;
    {class} property ViewStubCompat_android_id: Integer read _GetViewStubCompat_android_id;
    {class} property ViewStubCompat_android_inflatedId: Integer read _GetViewStubCompat_android_inflatedId;
    {class} property ViewStubCompat_android_layout: Integer read _GetViewStubCompat_android_layout;
  end;

  [JavaSignature('com/devil/library/media/R$styleable')]
  JR_styleable_117 = interface(JObject)
  ['{2EDAF1AE-4667-4C07-A798-D3195E432D9F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_styleable_117 = class(TJavaGenericImport<JR_styleable_117Class, JR_styleable_117>) end;

  JR_xml_118Class = interface(JObjectClass)
  ['{6CCF827B-FE28-4F54-B874-A4D874EA04E9}']
    { static Property Methods }
    {class} function _Getprovider_paths: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JR_xml_118; cdecl;

    { static Property }
    {class} property provider_paths: Integer read _Getprovider_paths;
  end;

  [JavaSignature('com/devil/library/media/R$xml')]
  JR_xml_118 = interface(JObject)
  ['{4166840A-826E-419E-8708-877AAEE95E4E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_xml_118 = class(TJavaGenericImport<JR_xml_118Class, JR_xml_118>) end;

  JR_119Class = interface(JObjectClass)
  ['{E73259A8-3FBE-4FCD-9803-7286AB59CB3A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JR_119; cdecl;

    { static Property }
  end;

  [JavaSignature('com/devil/library/media/R')]
  JR_119 = interface(JObject)
  ['{7B7E5B7E-8F65-4A2C-89D7-B4DA56B35943}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJR_119 = class(TJavaGenericImport<JR_119Class, JR_119>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_015', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_015));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_016', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_016));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_017', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_017));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_018', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_018));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_019', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_019));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_020', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_020));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_021', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_021));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_022', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_022));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_023', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_023));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_024', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_024));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_025', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_025));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_026', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_026));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_027', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_027));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_028', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_028));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_029', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_029));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_030', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_030));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_031', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_031));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_032', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_032));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_033', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_033));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_034', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_034));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_035', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_035));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_036', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_036));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_037', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_037));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_038', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_038));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_039', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_039));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_040', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_040));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_041', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_041));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_042', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_042));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_043', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_043));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_044', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_044));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_045', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_045));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_046', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_046));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_047', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_047));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_048', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_048));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_049', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_049));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_050', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_050));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_051', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_051));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_052', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_052));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_053', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_053));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_054', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_054));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_055', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_055));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_056', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_056));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_057', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_057));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_058', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_058));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_059', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_059));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_060', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_060));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_061', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_061));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_062', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_062));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_063', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_063));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_064', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_064));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_065', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_065));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_066', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_066));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_067', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_067));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_068', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_068));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_069', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_069));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_070', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_070));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_071', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_071));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_072', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_072));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_073', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_073));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_074', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_074));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_075', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_075));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_076', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_076));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_077', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_077));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_078', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_078));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_079', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_079));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_080', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_080));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_081', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_081));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_082', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_082));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_083', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_083));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_084', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_084));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_085', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_085));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_086', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_086));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_087', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_087));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_088', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_088));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_089', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_089));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_090', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_090));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_091', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_091));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_092', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_092));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_093', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_093));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_094', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_094));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_095', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_095));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_096', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_096));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_097', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_097));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_098', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_098));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_099', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_099));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_100', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_100));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_101', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_101));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_102', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_102));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_103', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_103));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_104', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_104));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_105', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_anim_105));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_106', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_attr_106));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_107', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_bool_107));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_108', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_color_108));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_109', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_dimen_109));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_110', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_drawable_110));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_111', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_id_111));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_112', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_integer_112));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_113', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_layout_113));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_114', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_mipmap_114));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_115', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_string_115));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_116', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_style_116));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_117', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_styleable_117));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_118', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_xml_118));
  TRegTypes.RegisterType('Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_119', 
    TypeInfo(Androidapi.JNI.R_JAVA_TestDVMediaSelector.JR_119));
end;


initialization
  RegisterTypes;

end.
