object frmSmartDeploy: TfrmSmartDeploy
  Left = 0
  Top = 0
  Caption = #19977#26041'SDK'#26234#33021#24067#32626#24037#20855'-'#27426#36814#21152#20837'FMX'#19977#26041'SDK'#26381#21153#32676'670563729,'#25317#26377#22320#22270#12289#25903#20184#12289#25512#36865#31561#26356#22810'SDK'
  ClientHeight = 696
  ClientWidth = 1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter3: TSplitter
    Left = 1085
    Top = 0
    Height = 600
    Align = alRight
    Visible = False
    ExplicitLeft = 905
    ExplicitTop = 40
    ExplicitHeight = 620
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 1085
    Height = 600
    Align = alClient
    Caption = 'pnlClient'
    TabOrder = 0
    object pcClient: TPageControl
      Left = 1
      Top = 90
      Width = 1083
      Height = 509
      ActivePage = tsAndroidJar
      Align = alClient
      TabOrder = 0
      object tsCurrent: TTabSheet
        Caption = #24403#21069#24067#32626
        TabVisible = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 57
          Align = alTop
          TabOrder = 0
          object Label4: TLabel
            Left = 14
            Top = 19
            Width = 105
            Height = 16
            AutoSize = False
            Caption = #30446#26631#24179#21488
          end
          object cmbPlatform: TComboBox
            Left = 93
            Top = 16
            Width = 177
            Height = 24
            TabOrder = 0
            Items.Strings = (
              'iOSDevice32'
              'iOSDevice64'
              'Android'
              'Android64'
              'OSX32'
              'OSX64'
              'Win32'
              'Win64')
          end
          object cmbConfiguration: TComboBox
            Left = 292
            Top = 16
            Width = 145
            Height = 24
            TabOrder = 1
            Items.Strings = (
              'Release'
              'Debug')
          end
          object btnLoadDeploy: TButton
            Left = 453
            Top = 16
            Width = 196
            Height = 25
            Caption = #21152#36733#24067#32626#25991#20214#21015#34920
            TabOrder = 2
            OnClick = btnLoadDeployClick
          end
        end
        object dbgCurrent: TDBGrid
          Left = 0
          Top = 57
          Width = 1075
          Height = 421
          Align = alClient
          DataSource = dsCurrent
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object tsDeployConfig: TTabSheet
        Caption = #24067#32626#37197#32622
        ImageIndex = 5
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 137
          Align = alTop
          TabOrder = 0
          DesignSize = (
            1075
            137)
          object lblDeployLocalDirOrFile: TLabel
            Left = 0
            Top = 43
            Width = 173
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #36164#28304#30340#26412#22320#30446#24405#25110#25991#20214':'
          end
          object lblDeployRemoteDirOrFile: TLabel
            Left = 0
            Top = 75
            Width = 173
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24067#32626#21040#36828#31243#30446#24405#25110#25991#20214':'
          end
          object lblDeployTargetPlatform: TLabel
            Left = 0
            Top = 12
            Width = 173
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24067#32626#30446#26631#24179#21488':'
          end
          object edtDeployConfigLocalDir: TEdit
            Left = 192
            Top = 39
            Width = 559
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'E:\TBUISDK_Android\TBUISDK\audio\res\'
          end
          object cmbDeployConfigPlatform: TComboBox
            Left = 192
            Top = 9
            Width = 288
            Height = 24
            TabOrder = 1
            Text = 'Android'
            Items.Strings = (
              'Android'
              'Android64'
              'iOSDevice32'
              'iOSDevice64'
              'iOSSimulator'
              'OSX32'
              'OSX64'
              'Win32'
              'Win64')
          end
          object btnAddDeployConfigToGrid: TButton
            Left = 349
            Top = 102
            Width = 139
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #28155#21152#39033#21040#34920#26684
            TabOrder = 2
            OnClick = btnAddDeployConfigToGridClick
          end
          object btnSaveDeployConfig: TButton
            Left = 502
            Top = 102
            Width = 98
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #20445#23384#20462#25913
            TabOrder = 3
            OnClick = btnSaveDeployConfigClick
          end
          object btnDeleteDeployConfig: TButton
            Left = 615
            Top = 102
            Width = 136
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #21024#38500#34920#26684#36873#20013#35760#24405
            TabOrder = 4
            OnClick = btnDeleteDeployConfigClick
          end
          object cmbDeployConfigRemoteDir: TComboBox
            Left = 192
            Top = 72
            Width = 559
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object btnSelectDeployConfigLocalFile: TButton
            Left = 871
            Top = 39
            Width = 90
            Height = 26
            Anchors = [akTop, akRight]
            Caption = #36873#25321#25991#20214
            TabOrder = 6
            OnClick = btnSelectDeployConfigLocalFileClick
          end
          object btnSelectDeployConfigLocalDir: TButton
            Left = 757
            Top = 40
            Width = 108
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #36873#25321#25991#20214#22841
            TabOrder = 7
            OnClick = btnSelectDeployConfigLocalDirClick
          end
        end
        object dbgPreview: TDBGrid
          Left = 0
          Top = 337
          Width = 1075
          Height = 141
          Align = alClient
          DataSource = dsPreview
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object dbgDeployConfig: TDBGrid
          Left = 0
          Top = 137
          Width = 1075
          Height = 140
          Align = alTop
          DataSource = dsDeployConfig
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgDeployConfigCellClick
        end
        object Panel1: TPanel
          Left = 0
          Top = 277
          Width = 1075
          Height = 60
          Align = alTop
          TabOrder = 3
          object lblDeployPreviewFileList: TLabel
            Left = 13
            Top = 6
            Width = 292
            Height = 16
            AutoSize = False
            Caption = #39044#35272#25152#38656#24067#32626#30340#25991#20214#21015#34920
          end
          object lblDeployPreviewTargetPlatform: TLabel
            Left = 13
            Top = 30
            Width = 160
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #39044#35272#30340#30446#26631#24179#21488':'
          end
          object cmbPreviewDeployConfigPlatform: TComboBox
            Left = 190
            Top = 27
            Width = 290
            Height = 24
            TabOrder = 0
            Text = 'Android'
            Items.Strings = (
              'Android'
              'Android64'
              'iOSDevice32'
              'iOSDevice64'
              'iOSSimulator'
              'Mac'
              'Windows')
          end
          object btnPreviewDeployConfig: TButton
            Left = 486
            Top = 26
            Width = 122
            Height = 25
            Caption = #39044#35272#25991#20214#24067#32626
            TabOrder = 1
            OnClick = btnPreviewDeployConfigClick
          end
          object btnProcessDeployConfig: TButton
            Left = 614
            Top = 26
            Width = 129
            Height = 25
            Caption = #22788#29702#25991#20214#24067#32626
            TabOrder = 2
            OnClick = btnProcessDeployConfigClick
          end
        end
      end
      object tsVariable: TTabSheet
        Caption = 'SDK'#21464#37327#37197#32622
        ImageIndex = 7
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 39
          Align = alTop
          TabOrder = 0
          object lblVariableHint: TLabel
            Left = 1
            Top = 1
            Width = 1073
            Height = 37
            Align = alClient
            AutoSize = False
            Caption = #19968#20010'SDK'#24212#29992#21040#19981#21516#30340'APP'#26102#65292#26377#20123#21442#25968#26159#19981#21516#30340#65292#27604#22914#21253#21517#12289'AppID'#31561#65292#25226#36825#20010#21442#25968#20316#20026#21464#37327#65292#20197#20415#35753#35813#37197#32622#25991#20214#36866#29992#20110#25152#26377#24037#31243
            WordWrap = True
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 133
            ExplicitHeight = 16
          end
        end
        object dbgAndroidVariables: TDBGrid
          Left = 0
          Top = 39
          Width = 1075
          Height = 439
          Align = alClient
          DataSource = dsAndroidVariables
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgDeployConfigCellClick
        end
      end
      object tsAndroidManifestConfig: TTabSheet
        Caption = 'Android'#26435#38480#37197#32622
        ImageIndex = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 475
          Width = 1075
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitLeft = -3
          ExplicitTop = 377
          ExplicitWidth = 1081
        end
        object memAndroidUsersPermissions: TMemo
          Left = 0
          Top = 39
          Width = 1075
          Height = 218
          Align = alTop
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object memAndroidApplicationChildNodes: TMemo
          Left = 0
          Top = 298
          Width = 1075
          Height = 177
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 39
          Align = alTop
          TabOrder = 2
          object lblAndroidPermissionHint: TLabel
            Left = 8
            Top = 11
            Width = 697
            Height = 16
            AutoSize = False
            Caption = 'Android'#26435#38480#39033':'
          end
          object btnProcessAndroidUsersPermissions: TButton
            Left = 468
            Top = 8
            Width = 155
            Height = 25
            Caption = #22788#29702#26435#38480#39033
            TabOrder = 0
            OnClick = btnProcessAndroidUsersPermissionsClick
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 257
          Width = 1075
          Height = 41
          Align = alTop
          TabOrder = 3
          object lblAndroidComponentHint: TLabel
            Left = 8
            Top = 14
            Width = 705
            Height = 16
            AutoSize = False
            Caption = 
              'Android'#32452#20214'(Activity/Service/BroadCast Recevicer/Content provider)' +
              ':'
          end
          object btnProcessAndroidApplicationChildNodes: TButton
            Left = 468
            Top = 10
            Width = 155
            Height = 25
            Caption = #22788#29702'Android'#32452#20214
            TabOrder = 0
            OnClick = btnProcessAndroidApplicationChildNodesClick
          end
        end
      end
      object tsWeiXinJar: TTabSheet
        Caption = #29983#25104'Jar'
        ImageIndex = 5
        DesignSize = (
          1075
          478)
        object Label13: TLabel
          Left = 5
          Top = 237
          Width = 62
          Height = 16
          Caption = 'Jar'#25991#20214#21517
        end
        object Label14: TLabel
          Left = 722
          Top = 238
          Width = 205
          Height = 16
          Caption = #36825#26159#20320#24076#26395#36755#20986#30340'JAR '#25991#20214#21517#12290
        end
        object Label15: TLabel
          Left = 5
          Top = 52
          Width = 50
          Height = 16
          Caption = 'JDK'#30446#24405
        end
        object Label16: TLabel
          Left = 883
          Top = 49
          Width = 179
          Height = 16
          Anchors = [akTop, akRight]
          Caption = #36825#20010#20301#32622#26159#20320#30340' jdk '#30340#30446#24405'.'
          ExplicitLeft = 724
        end
        object Label17: TLabel
          Left = 722
          Top = 84
          Width = 98
          Height = 16
          Caption = #23433#21331'SDK'#30340#30446#24405
        end
        object Label18: TLabel
          Left = 5
          Top = 82
          Width = 83
          Height = 16
          Caption = #23433#21331'SDK'#30446#24405
        end
        object Label19: TLabel
          Left = 5
          Top = 112
          Width = 95
          Height = 16
          Caption = 'SDKApiLevelPath'
        end
        object Label20: TLabel
          Left = 722
          Top = 114
          Width = 147
          Height = 16
          Caption = #23433#21331'SDK'#30340'API'#31561#32423#30446#24405
        end
        object Label21: TLabel
          Left = 5
          Top = 142
          Width = 74
          Height = 16
          Caption = 'SDKAaptPath'
        end
        object Label22: TLabel
          Left = 722
          Top = 144
          Width = 143
          Height = 16
          Caption = #23433#21331'SDK'#30340#36866#37197#22120#29256#26412
        end
        object Label23: TLabel
          Left = 3
          Top = 171
          Width = 92
          Height = 16
          Caption = #38656#35201#24341#29992#30340'Jar'
        end
        object Label24: TLabel
          Left = 5
          Top = 265
          Width = 62
          Height = 16
          Caption = 'Jar'#28304#25991#20214
        end
        object Label26: TLabel
          Left = 3
          Top = 442
          Width = 60
          Height = 16
          Caption = #24494#20449#21253#21517
        end
        object Label30: TLabel
          Left = 5
          Top = 21
          Width = 65
          Height = 16
          Caption = 'Delphi'#29256#26412
        end
        object pcJavaSourceFiles: TPageControl
          Left = 565
          Top = 368
          Width = 501
          Height = 107
          ActivePage = TabSheet4
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 10
          Visible = False
          object TabSheet2: TTabSheet
            Caption = 'WXEntryActivity.java'
            object memWXEntryActivity: TMemo
              Left = 0
              Top = 0
              Width = 493
              Height = 76
              Align = alClient
              Lines.Strings = (
                'package com.ggggcexx.orangeui.wxapi;'
                ''
                ''
                'import android.app.Activity;'
                'import android.content.Intent;'
                'import android.os.Bundle;'
                'import android.util.Log;'
                '//import android.view.View;'
                '//import android.widget.Button;'
                '//import android.widget.Toast;'
                ''
                ''
                'import com.ggggcexx.orangeui.wxapi.OnWeixinListener;;'
                ''
                ''
                'public class WXEntryActivity extends Activity {'
                #9
                #9'private static OnWeixinListener mListener;'
                #9
                
                  #9'public static void setOnWeixinListener(OnWeixinListener Listene' +
                  'r)'
                #9'{'
                #9#9'Log.d("OrangeUI ","OrangeUI setOnWeixinListener begin");'
                #9#9'mListener = Listener;'
                #9#9'Log.d("OrangeUI ","OrangeUI setOnWeixinListener end");'
                ''
                #9'}'
                #9'public static final OnWeixinListener getOnOnWeixinListener()'
                #9'{'
                #9#9'Log.d("OrangeUI ","OrangeUI getOnOnWeixinListener");'
                #9#9'return mListener;'
                #9'}'
                #9
                #9
                '    @Override'
                '    public void onCreate(Bundle savedInstanceState) {'
                '        super.onCreate(savedInstanceState);'
                ''
                '        Log.d("OrangeUI ","OrangeUI onCreate begin");'
                ''
                '        if (mListener!=null)'
                '        {'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent begin");'
                '        '#9'mListener.onHandleIntent(getIntent(),this);'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent end");'
                '        }'
                '        finish();'
                '    }'
                ''
                #9'@Override'
                #9'protected void onNewIntent(Intent intent) {'
                #9#9'super.onNewIntent(intent);'
                ''
                '        Log.d("OrangeUI ","OrangeUI onNewIntent begin");'
                ''
                '        if (mListener!=null)'
                '        {'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent begin");'
                '        '#9'mListener.onHandleIntent(intent,this);'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent end");'
                '        }'#9#9
                '        finish();'
                ''
                #9'}'
                ''
                ''
                #9
                '}')
              TabOrder = 0
              WordWrap = False
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'WXPayEntryActivity.java'
            ImageIndex = 1
            object memWXPayEntryActivity: TMemo
              Left = 0
              Top = 0
              Width = 493
              Height = 76
              Align = alClient
              Lines.Strings = (
                'package com.ggggcexx.orangeui.wxapi;'
                ''
                'import android.app.Activity;'
                'import android.content.Intent;'
                'import android.os.Bundle;'
                'import android.util.Log;'
                '//import android.view.View;'
                '//import android.widget.Button;'
                '//import android.widget.Toast;'
                ''
                ''
                'import com.ggggcexx.orangeui.wxapi.OnWeixinListener;;'
                ''
                ''
                'public class WXPayEntryActivity extends Activity {'
                #9
                #9'private static OnWeixinListener mListener;'
                #9
                
                  #9'public static void setOnWeixinListener(OnWeixinListener Listene' +
                  'r)'
                #9'{'
                #9#9'Log.d("OrangeUI ","OrangeUI setOnWeixinListener begin");'
                #9#9'mListener = Listener;'
                #9#9'Log.d("OrangeUI ","OrangeUI setOnWeixinListener end");'
                ''
                #9'}'
                #9'public static final OnWeixinListener getOnOnWeixinListener()'
                #9'{'
                #9#9'Log.d("OrangeUI ","OrangeUI getOnOnWeixinListener");'
                #9#9'return mListener;'
                #9'}'
                #9
                #9
                '    @Override'
                '    public void onCreate(Bundle savedInstanceState) {'
                '        super.onCreate(savedInstanceState);'
                ''
                '        Log.d("OrangeUI ","OrangeUI onCreate begin");'
                ''
                '        if (mListener!=null)'
                '        {'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent begin");'
                '        '#9'mListener.onHandleIntent(getIntent(),this);'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent end");'
                '        }'
                '        finish();'
                '    }'
                ''
                #9'@Override'
                #9'protected void onNewIntent(Intent intent) {'
                #9#9'super.onNewIntent(intent);'
                ''
                '        Log.d("OrangeUI ","OrangeUI onNewIntent begin");'
                ''
                '        if (mListener!=null)'
                '        {'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent begin");'
                '        '#9'mListener.onHandleIntent(intent,this);'
                
                  '                Log.d("OrangeUI ","OrangeUI mListener.onHandleIn' +
                  'tent end");'
                '        }'#9#9
                '        finish();'
                ''
                #9'}'
                ''
                ''
                #9
                '}')
              TabOrder = 0
              WordWrap = False
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'OnWeixinListener.java'
            ImageIndex = 2
            object memOnWeixinListener: TMemo
              Left = 0
              Top = 0
              Width = 493
              Height = 76
              Align = alClient
              Lines.Strings = (
                'package com.ggggcexx.orangeui.wxapi;'
                ''
                'import android.content.Intent;'
                'import android.app.Activity;'
                ''
                'public abstract interface OnWeixinListener'
                '{'
                
                  '  public abstract void onHandleIntent(Intent paramIntent,Activit' +
                  'y AActivity);'
                '}')
              TabOrder = 0
              WordWrap = False
            end
          end
          object TabSheet5: TTabSheet
            Caption = 'wxapi.pas'
            ImageIndex = 3
            object memWxApiPas: TMemo
              Left = 0
              Top = 0
              Width = 493
              Height = 76
              Align = alClient
              Lines.Strings = (
                'unit Androidapi.JNI.wxapi;'
                ''
                'interface'
                ''
                '{$IFDEF ANDROID}'
                'uses'
                '  Androidapi.JNIBridge,'
                '  Androidapi.JNI.JavaTypes,'
                '  Androidapi.JNI.GraphicsContentViewText,'
                '  Androidapi.JNI.App,'
                '  Androidapi.JNI.os;'
                ''
                ''
                'type'
                '// ===== Forward declarations ====='
                ''
                
                  '  JOnWeixinListener = interface; //com.ggggcexx.orangeui.wxapi.O' +
                  'nWeixinListener'
                
                  '  JWXEntryActivity = interface; //com.ggggcexx.orangeui.wxapi.WX' +
                  'EntryActivity'
                
                  '  JWXPayEntryActivity = interface; //com.ggggcexx.orangeui.wxapi' +
                  '.WXPayEntryActivity'
                ''
                '// ===== Interface declarations ====='
                ''
                '  JOnWeixinListenerClass = interface(JObjectClass)'
                '  ['#39'{3E9109B1-7665-4583-B461-31346A2DA793}'#39']'
                '    { static Property Methods }'
                ''
                '    { static Methods }'
                ''
                '    { static Property }'
                '  end;'
                ''
                
                  '  [JavaSignature('#39'com/ggggcexx/orangeui/wxapi/OnWeixinListener'#39')' +
                  ']'
                '  JOnWeixinListener = interface(IJavaInstance)'
                '  ['#39'{19474D80-F04B-4108-91A8-FA33A0AD5BD3}'#39']'
                '    { Property Methods }'
                ''
                '    { methods }'
                '    procedure onHandleIntent(P1: JIntent; P2: JActivity); cdecl;'
                ''
                '    { Property }'
                '  end;'
                ''
                
                  '  TJOnWeixinListener = class(TJavaGenericImport<JOnWeixinListene' +
                  'rClass, JOnWeixinListener>) end;'
                ''
                '  JWXEntryActivityClass = interface(JObjectClass)'
                '  ['#39'{7BA83A95-6995-4F2B-9BB6-883F16A75181}'#39']'
                '    { static Property Methods }'
                ''
                '    { static Methods }'
                '    {class} function init: JWXEntryActivity; cdecl;'
                
                  '    {class} procedure setOnWeixinListener(P1: JOnWeixinListener)' +
                  '; cdecl;'
                
                  '    {class} function getOnOnWeixinListener: JOnWeixinListener; c' +
                  'decl;'
                ''
                '    { static Property }'
                '  end;'
                ''
                '  [JavaSignature('#39'com/ggggcexx/orangeui/wxapi/WXEntryActivity'#39')]'
                '  JWXEntryActivity = interface(JObject)'
                '  ['#39'{0853F9BC-2D10-42EB-916A-EFF5F041C851}'#39']'
                '    { Property Methods }'
                ''
                '    { methods }'
                '    procedure onCreate(savedInstanceState: JBundle); cdecl;'
                ''
                '    { Property }'
                '  end;'
                ''
                
                  '  TJWXEntryActivity = class(TJavaGenericImport<JWXEntryActivityC' +
                  'lass, JWXEntryActivity>) end;'
                ''
                '  JWXPayEntryActivityClass = interface(JObjectClass)'
                '  ['#39'{DBEA7BD9-9625-4BCA-B7EC-D2897CA1EB51}'#39']'
                '    { static Property Methods }'
                ''
                '    { static Methods }'
                '    {class} function init: JWXPayEntryActivity; cdecl;'
                
                  '    {class} procedure setOnWeixinListener(P1: JOnWeixinListener)' +
                  '; cdecl;'
                
                  '    {class} function getOnOnWeixinListener: JOnWeixinListener; c' +
                  'decl;'
                ''
                '    { static Property }'
                '  end;'
                ''
                
                  '  [JavaSignature('#39'com/ggggcexx/orangeui/wxapi/WXPayEntryActivity' +
                  #39')]'
                '  JWXPayEntryActivity = interface(JObject)'
                '  ['#39'{EACB92D2-4240-4D71-92A5-9D904BEFA151}'#39']'
                '    { Property Methods }'
                ''
                '    { methods }'
                '    procedure onCreate(savedInstanceState: JBundle); cdecl;'
                ''
                '    { Property }'
                '  end;'
                ''
                
                  '  TJWXPayEntryActivity = class(TJavaGenericImport<JWXPayEntryAct' +
                  'ivityClass, JWXPayEntryActivity>) end;'
                ''
                '{$ENDIF}'
                'implementation'
                '//{$IFDEF ANDROID}'
                '//'
                '//'
                '//procedure RegisterTypes;'
                '//begin'
                
                  '//  TRegTypes.RegisterType('#39'Androidapi.JNI.wxapi.JOnWeixinListen' +
                  'er'#39','
                '//    TypeInfo(Androidapi.JNI.wxapi.JOnWeixinListener));'
                
                  '//  TRegTypes.RegisterType('#39'Androidapi.JNI.wxapi.JWXEntryActivit' +
                  'y'#39','
                '//    TypeInfo(Androidapi.JNI.wxapi.JWXEntryActivity));'
                
                  '//  TRegTypes.RegisterType('#39'Androidapi.JNI.wxapi.JWXPayEntryActi' +
                  'vity'#39','
                '//    TypeInfo(Androidapi.JNI.wxapi.JWXPayEntryActivity));'
                '//end;'
                '//'
                '//'
                '//initialization'
                '//  RegisterTypes;'
                '//'
                '//{$ENDIF}'
                ''
                'end.')
              TabOrder = 0
              WordWrap = False
            end
          end
        end
        object edtJarName: TEdit
          Left = 157
          Top = 234
          Width = 710
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'wxapi.jar'
        end
        object edtJDKDir: TEdit
          Left = 157
          Top = 49
          Width = 710
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'C:\Program Files\Java\jdk1.8.0_151'
        end
        object edtAndroidSDKDir: TEdit
          Left = 157
          Top = 79
          Width = 710
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows'
        end
        object edtAndroidSDKPlatform: TEdit
          Left = 157
          Top = 109
          Width = 710
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows\platforms\android-22'
        end
        object edtAndroidSDKBuildTools: TEdit
          Left = 157
          Top = 139
          Width = 710
          Height = 24
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows\build-tools\22.0.1'
        end
        object memUsedAndroidJars: TMemo
          Left = 157
          Top = 168
          Width = 710
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '%ANDROID_PLATFORM%\android.jar')
          TabOrder = 5
          WordWrap = False
        end
        object memJavaSourceFiles: TMemo
          Left = 157
          Top = 265
          Width = 710
          Height = 59
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            
              'E:\MyFiles\ThirdPartySDK\'#24494#20449#25903#20184#25509#21475'\'#19981#35013'eclipse'#22914#20309#29983#25104#24494#20449'Jar\src\com\ggggc' +
              'exx\orangeui\wxapi\*.java')
          TabOrder = 6
          WordWrap = False
        end
        object btnGenerateJar: TButton
          Left = 157
          Top = 330
          Width = 280
          Height = 25
          Caption = #19981#35013'Eclipse'#29983#25104'Jar('#30446#24405#19981#33021#26377#20013#25991')'
          TabOrder = 7
          OnClick = btnGenerateJarClick
        end
        object btnGenerateWeiXinJar: TButton
          Left = 332
          Top = 436
          Width = 105
          Height = 25
          Caption = #29983#25104#24494#20449'Jar'
          TabOrder = 8
          OnClick = btnGenerateWeiXinJarClick
        end
        object edtWeiXinAndroidPackage: TEdit
          Left = 122
          Top = 437
          Width = 191
          Height = 24
          TabOrder = 9
          Text = 'com.ggggcexx.orangeui'
          TextHint = #24212#29992#21253#21517
        end
        object btnLoadAndroidSDKFromReg: TButton
          Left = 280
          Top = 18
          Width = 279
          Height = 25
          Caption = #20174#27880#20876#34920#21152#36733'AndroidSDK'#37197#32622
          TabOrder = 11
          OnClick = btnLoadAndroidSDKFromRegClick
        end
        object cmbDelphiVersions: TComboBox
          Left = 157
          Top = 19
          Width = 92
          Height = 24
          ItemIndex = 0
          TabOrder = 12
          Text = '20.0'
          Items.Strings = (
            '20.0'
            '19.0'
            '18.0')
        end
        object Button3: TButton
          Left = 488
          Top = 330
          Width = 167
          Height = 25
          Caption = #20445#23384'AndroidSDK'#37197#32622
          TabOrder = 13
          OnClick = Button3Click
        end
      end
      object tsAndroidJar: TTabSheet
        Caption = 'AndroidJar'#37197#32622
        ImageIndex = 4
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 47
          Align = alTop
          TabOrder = 0
          object Label29: TLabel
            Left = 385
            Top = 49
            Width = 4
            Height = 16
          end
          object btnAddAndroidJar: TButton
            Left = 1
            Top = 11
            Width = 192
            Height = 25
            Caption = #28155#21152'Jar'
            TabOrder = 0
            OnClick = btnAddAndroidJarClick
          end
          object btnProcessAndroidJar: TButton
            Left = 199
            Top = 11
            Width = 192
            Height = 25
            Caption = #22788#29702'Jar'
            TabOrder = 1
            OnClick = btnProcessAndroidJarClick
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 47
          Width = 1075
          Height = 431
          Align = alClient
          TabOrder = 1
          object pnlAndroidAarToolBar: TPanel
            Left = 1
            Top = 168
            Width = 1073
            Height = 47
            Align = alBottom
            TabOrder = 0
            ExplicitLeft = -15
            ExplicitTop = 174
            object btnAddAndroidAar: TButton
              Left = 0
              Top = 16
              Width = 192
              Height = 25
              Caption = #28155#21152'aar'
              TabOrder = 0
              OnClick = btnAddAndroidAarClick
            end
            object btnProcessAndroidAAR: TButton
              Left = 198
              Top = 16
              Width = 192
              Height = 25
              Caption = #22788#29702'Aar'
              TabOrder = 1
              OnClick = btnProcessAndroidAARClick
            end
            object btnGenerateAndroidAAR: TButton
              Left = 396
              Top = 16
              Width = 240
              Height = 25
              Caption = #29983#25104'R.Java'
              TabOrder = 2
              OnClick = btnGenerateAndroidAARClick
            end
            object chkGenerateAndroid64AAR: TCheckBox
              Left = 656
              Top = 19
              Width = 185
              Height = 17
              Caption = '64'#20301'Android'
              TabOrder = 3
            end
          end
          object memAndroidAars: TMemo
            Left = 1
            Top = 215
            Width = 1073
            Height = 215
            Align = alBottom
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
          end
          object memAndroidJars: TMemo
            Left = 1
            Top = 1
            Width = 1073
            Height = 167
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 2
            WordWrap = False
          end
        end
      end
      object tsIOSConfig: TTabSheet
        Caption = 'iOS'#24211#37197#32622
        ImageIndex = 6
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 65
          Align = alTop
          TabOrder = 0
          DesignSize = (
            1075
            65)
          object lblIOSLinkerOptionsHint: TLabel
            Left = 2
            Top = 4
            Width = 887
            Height = 16
            AutoSize = False
            Caption = 
              #38142#25509#21442#25968'(Project Options->Building->Delphi Compiler->Linking->option' +
              's passed to LD linker):'
          end
          object edtIOSLinkerOptions: TEdit
            Left = 2
            Top = 26
            Width = 842
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = '-framework SystemConfiguration'
          end
          object btnProcessIOSLinkerOptions: TButton
            Left = 850
            Top = 24
            Width = 197
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #22788#29702#38142#25509#21442#25968
            TabOrder = 1
            OnClick = btnProcessIOSLinkerOptionsClick
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 65
          Width = 1075
          Height = 413
          Align = alClient
          TabOrder = 1
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 304
            Height = 411
            Align = alLeft
            TabOrder = 0
            object lblAddIOSFrameworkHint: TLabel
              Left = 1
              Top = 1
              Width = 302
              Height = 46
              Align = alTop
              AutoSize = False
              Caption = #27880#24847':'#28155#21152#23436#20043#21518#36824#38656#35201#22312'SDK Manager'#20013#32473#27599#20010'SDK'#28857#20987'"Upate Local File Cache"'
              WordWrap = True
              ExplicitLeft = -3
              ExplicitTop = -5
            end
            object memIOS_SDK_Frameworks: TMemo
              Left = 1
              Top = 72
              Width = 302
              Height = 185
              Align = alClient
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
            object btnAddFrameworksToAllIOSSDK: TButton
              Left = 1
              Top = 47
              Width = 302
              Height = 25
              Align = alTop
              Caption = #28155#21152#19979#38754#30340#26694#26550#21040#25152#26377#30340'iPhone SDK'
              TabOrder = 1
              OnClick = btnAddFrameworksToAllIOSSDKClick
            end
            object memIOS_SDK_Dylibs: TMemo
              Left = 1
              Top = 282
              Width = 302
              Height = 128
              Align = alBottom
              Lines.Strings = (
                'libicucore.tbd')
              ScrollBars = ssBoth
              TabOrder = 2
              WordWrap = False
            end
            object btnAddDylibsToAllIOSSDK: TButton
              Left = 1
              Top = 257
              Width = 302
              Height = 25
              Align = alBottom
              Caption = #28155#21152#19979#38754#30340#24211#21040#25152#26377#30340'iPhone SDK'
              TabOrder = 3
              OnClick = btnAddDylibsToAllIOSSDKClick
            end
          end
          object Panel14: TPanel
            Left = 305
            Top = 1
            Width = 769
            Height = 411
            Align = alClient
            TabOrder = 1
            object btnProcessIOSPlistRootNodes: TButton
              Left = 1
              Top = 1
              Width = 767
              Height = 25
              Align = alTop
              Caption = #28155#21152#19979#38754#30340#37197#32622#21040'info.plist.TemplateiOS.xml'
              TabOrder = 0
              OnClick = btnProcessIOSPlistRootNodesClick
            end
            object memIOSPlistRootNodes: TMemo
              Left = 1
              Top = 26
              Width = 767
              Height = 384
              Align = alClient
              Lines.Strings = (
                '    <key>CFBundleURLTypes</key>'
                '    <array>'
                '        <dict>'
                '            <key>CFBundleURLSchemes</key>'
                '            <array>'
                '                <string>fb1218646208237299</string>'
                '            </array>'
                '        </dict>'
                '    </array>'
                '    <key>FacebookAppID</key>'
                '    <string>1218646208237299</string>'
                '    <key>FacebookDisplayName</key>'
                '    <string>OrangeUI</string>'
                '    '
                '    <key>LSApplicationQueriesSchemes</key>'
                '    <array>'
                '        <string>fbapi</string>'
                '        <string>fb-messenger-api</string>'
                '        <string>fbauth2</string>'
                '        <string>fbshareextension</string>'
                '    </array>')
              ScrollBars = ssBoth
              TabOrder = 1
              WordWrap = False
            end
          end
        end
      end
      object tsIconConfig: TTabSheet
        Caption = #24037#31243#22270#26631#21644#21551#21160#22270#29255#35774#32622
        ImageIndex = 3
        object pnlAppIcon: TPanel
          Left = 0
          Top = 0
          Width = 1075
          Height = 186
          Align = alTop
          TabOrder = 0
          object lblAppIconHint: TLabel
            Left = 13
            Top = 9
            Width = 161
            Height = 16
            AutoSize = False
            Caption = 'App'#22270#26631':'
          end
          object lblIconCornerSize: TLabel
            Left = 196
            Top = 80
            Width = 170
            Height = 16
            Caption = #22278#35282#35282#24230#23610#23544#30334#20998#27604'(0.15)'
          end
          object btnSelectProjectIcon: TButton
            Left = 194
            Top = 37
            Width = 266
            Height = 25
            Caption = #36873#21462#22270#26631#25991#20214
            TabOrder = 0
            OnClick = btnSelectProjectIconClick
          end
          object btnProcessProjectIcon: TButton
            Left = 196
            Top = 147
            Width = 264
            Height = 25
            Caption = #35774#32622#20026#24037#31243#22270#26631
            TabOrder = 1
            OnClick = btnProcessProjectIconClick
          end
          object Panel9: TPanel
            Left = 30
            Top = 33
            Width = 144
            Height = 144
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object imgProjectIcon: TImage
              Left = 2
              Top = 2
              Width = 136
              Height = 136
              Align = alClient
              Stretch = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 144
              ExplicitHeight = 144
            end
          end
          object btnGenerateProjectIconEverySize: TButton
            Left = 196
            Top = 108
            Width = 266
            Height = 25
            Caption = #29983#25104#21508#31181#23610#23544#21040#24037#31243#30446#24405
            TabOrder = 3
            OnClick = btnGenerateProjectIconEverySizeClick
          end
          object edtIconCornerSizePercent: TEdit
            Left = 392
            Top = 74
            Width = 70
            Height = 24
            TabOrder = 4
            Text = '0'
          end
          object Button5: TButton
            Left = 490
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Button5'
            TabOrder = 5
            OnClick = Button5Click
          end
        end
        object pnlAppLaunch: TPanel
          Left = 0
          Top = 186
          Width = 1075
          Height = 292
          Align = alClient
          TabOrder = 1
          object lblAppLaunchImageHint: TLabel
            Left = 13
            Top = 16
            Width = 204
            Height = 16
            AutoSize = False
            Caption = 'App'#21551#21160#22270#29255':'
          end
          object lblLaunchImageBackColorHint: TLabel
            Left = 490
            Top = 100
            Width = 140
            Height = 16
            Caption = #36873#25321#21512#25104#30340#32972#26223#39068#33394':'
          end
          object lblLaunchImageScaleBaseHeightHint: TLabel
            Left = 490
            Top = 70
            Width = 140
            Height = 16
            Caption = #22270#29255#25918#22823#30340#22522#20934#39640#24230':'
          end
          object lblBackColorHexCodeHint: TLabel
            Left = 631
            Top = 165
            Width = 154
            Height = 16
            Caption = #25110#32972#26223#39068#33394'16'#36827#21046#20195#30721':'
          end
          object cmbProjectLaunchBackColor: TColorListBox
            Left = 490
            Top = 120
            Width = 135
            Height = 91
            NoneColorColor = clWhite
            Selected = clWhite
            TabOrder = 0
            OnClick = cmbProjectLaunchBackColorClick
          end
          object edtProjectLaunchBackColor: TEdit
            Left = 631
            Top = 187
            Width = 115
            Height = 24
            TabOrder = 1
          end
          object Panel12: TPanel
            Left = 30
            Top = 38
            Width = 160
            Height = 240
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object imgProjectLaunchImage: TImage
              Left = 2
              Top = 2
              Width = 152
              Height = 232
              Align = alClient
              Stretch = True
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 144
              ExplicitHeight = 144
            end
          end
          object btnSelectProjectLaunchImage: TButton
            Left = 196
            Top = 42
            Width = 264
            Height = 25
            Caption = #36873#25321#21551#21160#22270#29255#25110#22270#26631
            TabOrder = 3
            OnClick = btnSelectProjectLaunchImageClick
          end
          object btnGenerateProjectLaunchImageEverySize: TButton
            Left = 196
            Top = 217
            Width = 264
            Height = 25
            Caption = #30452#25509#29983#25104#21508#31181#23610#23544#21040#24037#31243#30446#24405
            TabOrder = 4
            OnClick = btnGenerateProjectLaunchImageEverySizeClick
          end
          object btnProcessProjectLaunchImage: TButton
            Left = 192
            Top = 248
            Width = 554
            Height = 25
            Caption = #35774#32622#20026#24037#31243#21551#21160#22270#29255
            TabOrder = 5
            OnClick = btnProcessProjectLaunchImageClick
          end
          object Button2: TButton
            Left = 743
            Top = 310
            Width = 172
            Height = 25
            Caption = #28165#38500'10.3.1'#30340'IOS'#21551#21160#22270#29255
            TabOrder = 6
            Visible = False
            OnClick = Button2Click
          end
          object btnCombineLaunchImageByBackColor: TButton
            Left = 490
            Top = 217
            Width = 256
            Height = 25
            Caption = #25110#26681#25454#32972#26223#39068#33394#21512#25104#21551#21160#22270#29255
            TabOrder = 7
            OnClick = btnCombineLaunchImageByBackColorClick
          end
          object edtScaleBaseHeight: TEdit
            Left = 648
            Top = 67
            Width = 98
            Height = 24
            TabOrder = 8
            Text = '960'
          end
          object Button4: TButton
            Left = 896
            Top = 48
            Width = 75
            Height = 25
            Caption = 'Button4'
            TabOrder = 9
            OnClick = Button4Click
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #25209#37327#37197#32622#24037#31243#25152#38656#35201#30340'SDK'
        ImageIndex = 8
        object lvNeedUseSDKs: TListView
          Left = 0
          Top = 0
          Width = 353
          Height = 478
          Align = alLeft
          Checkboxes = True
          Columns = <
            item
              Caption = 'SDK'
              Width = 100
            end>
          Items.ItemData = {
            05580000000200000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
            000941006C006900700061007900530044004B0000000000FFFFFFFFFFFFFFFF
            00000000FFFFFFFF0000000009570065006900780069006E00530044004B00}
          MultiSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object btnBatchProcessSDKs: TButton
          Left = 359
          Top = 123
          Width = 193
          Height = 25
          Caption = #25209#37327#22788#29702#25152#36873#20013#30340'SDK'
          TabOrder = 1
          OnClick = btnBatchProcessSDKsClick
        end
        object Button1: TButton
          Left = 359
          Top = 20
          Width = 193
          Height = 25
          Caption = #21152#36733#36873#20013#30340'SDK'
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button7: TButton
          Left = 359
          Top = 68
          Width = 193
          Height = 25
          Caption = #20445#23384#36873#20013#30340'SDK'
          TabOrder = 3
          OnClick = Button7Click
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 49
      Width = 1083
      Height = 41
      Align = alTop
      TabOrder = 1
      DesignSize = (
        1083
        41)
      object lblCurrentProject: TLabel
        Left = 104
        Top = 11
        Width = 145
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24453#22788#29702#24037#31243#25991#20214':'
      end
      object btnSelectProject: TButton
        Left = 794
        Top = 10
        Width = 122
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #36873#25321#24037#31243#25991#20214
        TabOrder = 0
        OnClick = btnSelectProjectClick
      end
      object btnProcessConfigToProject: TButton
        Left = 943
        Top = 8
        Width = 128
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #37197#32622#21040#35813#24037#31243
        TabOrder = 1
        OnClick = btnProcessConfigToProjectClick
      end
      object edtProjectFilePath: TComboBox
        Left = 255
        Top = 6
        Width = 494
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'E:\TBUISDK_Android\TBUISDK.dproj'
      end
      object RadioButton1: TRadioButton
        Left = 6
        Top = 10
        Width = 113
        Height = 17
        Caption = #20013#25991
        TabOrder = 3
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 65
        Top = 10
        Width = 113
        Height = 17
        Caption = 'English'
        TabOrder = 4
        OnClick = RadioButton2Click
      end
    end
    object pnlToolBar: TPanel
      Left = 1
      Top = 1
      Width = 1083
      Height = 48
      Align = alTop
      TabOrder = 2
      DesignSize = (
        1083
        48)
      object lblCurrentConfig: TLabel
        Left = 145
        Top = 16
        Width = 104
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24403#21069#37197#32622#25991#20214':'
      end
      object btnSaveConfig: TButton
        Left = 943
        Top = 10
        Width = 128
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20445#23384#24403#21069#37197#32622
        TabOrder = 0
        OnClick = btnSaveConfigClick
      end
      object btnOpenConfig: TButton
        Left = 794
        Top = 12
        Width = 122
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #36873#25321#37197#32622#25991#20214
        TabOrder = 1
        OnClick = btnOpenConfigClick
      end
      object btnNewConfig: TButton
        Left = 17
        Top = 10
        Width = 122
        Height = 25
        Caption = #26032#24314#37197#32622#25991#20214
        TabOrder = 2
        OnClick = btnNewConfigClick
      end
      object cmbConfigFilePath: TComboBox
        Left = 264
        Top = 11
        Width = 494
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Text = 'E:\TBUISDK_Android\TBUISDK.dproj'
        OnChange = cmbConfigFilePathChange
      end
    end
  end
  object pcLogBottom: TPanel
    Left = 0
    Top = 600
    Width = 1088
    Height = 96
    Align = alBottom
    TabOrder = 1
    Visible = False
    object memLog: TMemo
      Left = 1
      Top = 25
      Width = 1086
      Height = 70
      Align = alClient
      TabOrder = 0
      WordWrap = False
    end
    object pnlLogCaption: TPanel
      Left = 1
      Top = 1
      Width = 1086
      Height = 24
      Align = alTop
      Caption = 'Messages'
      TabOrder = 1
    end
  end
  object dsCurrent: TDataSource
    Left = 236
    Top = 44
  end
  object dsPreview: TDataSource
    Left = 412
    Top = 44
  end
  object dsDeployConfig: TDataSource
    Left = 316
    Top = 44
  end
  object odSelectConfig: TOpenDialog
    DefaultExt = '*.ini'
    Filter = #37197#32622#25991#20214'(*.ini)|*.ini'
    Left = 628
    Top = 65532
  end
  object sdSaveConfig: TSaveDialog
    DefaultExt = '*.ini'
    Filter = #37197#32622#25991#20214'(*.ini)|*.ini'
    Left = 708
    Top = 65532
  end
  object odSelectProject: TOpenDialog
    DefaultExt = '*.dproj'
    Filter = 'Delphi'#24037#31243#25991#20214'(*.dproj)|*.dproj'
    Left = 792
    Top = 1
  end
  object odSelectAndroidJar: TOpenDialog
    DefaultExt = '*.jar'
    Filter = 'Android'#21253#25991#20214'(*.jar)|*.jar'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 428
    Top = 65533
  end
  object opdSelectProjectIcon: TOpenPictureDialog
    Left = 532
    Top = 65528
  end
  object odSelectNeedDeployFile: TOpenDialog
    Left = 900
  end
  object dsAndroidVariables: TDataSource
    Left = 492
    Top = 44
  end
  object opdSelectProjectLaunchImage: TOpenPictureDialog
    Left = 724
    Top = 264
  end
  object odSelectAndroidAar: TOpenDialog
    DefaultExt = '*.jar'
    Filter = 'Android'#21253#25991#20214'(*.aar)|*.aar'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 436
    Top = 5
  end
end
