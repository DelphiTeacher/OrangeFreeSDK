object frmSmartDeploy: TfrmSmartDeploy
  Left = 0
  Top = 0
  Caption = #19977#26041'SDK'#26234#33021#24067#32626#24037#20855'-'#27426#36814#21152#20837'FMX'#19977#26041'SDK'#26381#21153#32676'670563729,'#25317#26377#22320#22270#12289#25903#20184#12289#25512#36865#31561#26356#22810'SDK'
  ClientHeight = 736
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 16
  object Splitter3: TSplitter
    Left = 1074
    Top = 0
    Width = 2
    Height = 544
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alRight
    Visible = False
    ExplicitLeft = 868
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 544
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    Caption = 'pnlClient'
    TabOrder = 0
    ExplicitWidth = 1070
    ExplicitHeight = 543
    object pcClient: TPageControl
      Left = 1
      Top = 72
      Width = 1072
      Height = 471
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      ActivePage = tsAndroidJar
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 1068
      ExplicitHeight = 470
      object tsCurrent: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #24403#21069#24067#32626
        TabVisible = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 46
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          object Label4: TLabel
            Left = 11
            Top = 15
            Width = 84
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = #30446#26631#24179#21488
          end
          object cmbPlatform: TComboBox
            Left = 74
            Top = 13
            Width = 142
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
            Left = 234
            Top = 13
            Width = 116
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            TabOrder = 1
            Items.Strings = (
              'Release'
              'Debug')
          end
          object btnLoadDeploy: TButton
            Left = 362
            Top = 13
            Width = 157
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #21152#36733#24067#32626#25991#20214#21015#34920
            TabOrder = 2
            OnClick = btnLoadDeployClick
          end
        end
        object dbgCurrent: TDBGrid
          Left = 0
          Top = 46
          Width = 1064
          Height = 394
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
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
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #24067#32626#37197#32622
        ImageIndex = 5
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 110
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          DesignSize = (
            1064
            110)
          object lblDeployLocalDirOrFile: TLabel
            Left = 0
            Top = 34
            Width = 138
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = #36164#28304#30340#26412#22320#30446#24405#25110#25991#20214':'
          end
          object lblDeployRemoteDirOrFile: TLabel
            Left = 0
            Top = 60
            Width = 138
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24067#32626#21040#36828#31243#30446#24405#25110#25991#20214':'
          end
          object lblDeployTargetPlatform: TLabel
            Left = 0
            Top = 10
            Width = 138
            Height = 12
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24067#32626#30446#26631#24179#21488':'
          end
          object edtDeployConfigLocalDir: TEdit
            Left = 154
            Top = 31
            Width = 643
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'E:\TBUISDK_Android\TBUISDK\audio\res\'
          end
          object cmbDeployConfigPlatform: TComboBox
            Left = 154
            Top = 7
            Width = 230
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
            Left = 475
            Top = 82
            Width = 111
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #28155#21152#39033#21040#34920#26684
            TabOrder = 2
            OnClick = btnAddDeployConfigToGridClick
          end
          object btnSaveDeployConfig: TButton
            Left = 598
            Top = 82
            Width = 78
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #20445#23384#20462#25913
            TabOrder = 3
            OnClick = btnSaveDeployConfigClick
          end
          object btnDeleteDeployConfig: TButton
            Left = 688
            Top = 82
            Width = 109
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #21024#38500#34920#26684#36873#20013#35760#24405
            TabOrder = 4
            OnClick = btnDeleteDeployConfigClick
          end
          object cmbDeployConfigRemoteDir: TComboBox
            Left = 154
            Top = 58
            Width = 643
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object btnSelectDeployConfigLocalFile: TButton
            Left = 893
            Top = 31
            Width = 72
            Height = 21
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #36873#25321#25991#20214
            TabOrder = 6
            OnClick = btnSelectDeployConfigLocalFileClick
          end
          object btnSelectDeployConfigLocalDir: TButton
            Left = 802
            Top = 32
            Width = 86
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #36873#25321#25991#20214#22841
            TabOrder = 7
            OnClick = btnSelectDeployConfigLocalDirClick
          end
        end
        object dbgPreview: TDBGrid
          Left = 0
          Top = 270
          Width = 1064
          Height = 170
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
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
          Top = 110
          Width = 1064
          Height = 112
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
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
          Top = 222
          Width = 1064
          Height = 48
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 3
          object lblDeployPreviewFileList: TLabel
            Left = 10
            Top = 5
            Width = 234
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = #39044#35272#25152#38656#24067#32626#30340#25991#20214#21015#34920
          end
          object lblDeployPreviewTargetPlatform: TLabel
            Left = 10
            Top = 24
            Width = 128
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = #39044#35272#30340#30446#26631#24179#21488':'
          end
          object cmbPreviewDeployConfigPlatform: TComboBox
            Left = 152
            Top = 22
            Width = 232
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
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
            Left = 389
            Top = 21
            Width = 97
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #39044#35272#25991#20214#24067#32626
            TabOrder = 1
            OnClick = btnPreviewDeployConfigClick
          end
          object btnProcessDeployConfig: TButton
            Left = 491
            Top = 21
            Width = 103
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #22788#29702#25991#20214#24067#32626
            TabOrder = 2
            OnClick = btnProcessDeployConfigClick
          end
        end
      end
      object tsVariable: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'SDK'#21464#37327#37197#32622
        ImageIndex = 7
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 31
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          object lblVariableHint: TLabel
            Left = 1
            Top = 1
            Width = 1062
            Height = 29
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            AutoSize = False
            Caption = #19968#20010'SDK'#24212#29992#21040#19981#21516#30340'APP'#26102#65292#26377#20123#21442#25968#26159#19981#21516#30340#65292#27604#22914#21253#21517#12289'AppID'#31561#65292#25226#36825#20010#21442#25968#20316#20026#21464#37327#65292#20197#20415#35753#35813#37197#32622#25991#20214#36866#29992#20110#25152#26377#24037#31243
            WordWrap = True
            ExplicitWidth = 858
          end
        end
        object dbgAndroidVariables: TDBGrid
          Left = 0
          Top = 31
          Width = 1064
          Height = 409
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
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
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Android'#26435#38480#37197#32622
        ImageIndex = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 438
          Width = 1064
          Height = 2
          Cursor = crVSplit
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alBottom
          ExplicitTop = 442
          ExplicitWidth = 860
        end
        object memAndroidUsersPermissions: TMemo
          Left = 0
          Top = 31
          Width = 1064
          Height = 175
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object memAndroidApplicationChildNodes: TMemo
          Left = 0
          Top = 238
          Width = 1064
          Height = 200
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 31
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 2
          object lblAndroidPermissionHint: TLabel
            Left = 6
            Top = 9
            Width = 558
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = 'Android'#26435#38480#39033':'
          end
          object btnProcessAndroidUsersPermissions: TButton
            Left = 374
            Top = 6
            Width = 124
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #22788#29702#26435#38480#39033
            TabOrder = 0
            OnClick = btnProcessAndroidUsersPermissionsClick
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 206
          Width = 1064
          Height = 32
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 3
          object lblAndroidComponentHint: TLabel
            Left = 6
            Top = 11
            Width = 564
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = 
              'Android'#32452#20214'(Activity/Service/BroadCast Recevicer/Content provider)' +
              ':'
          end
          object btnProcessAndroidApplicationChildNodes: TButton
            Left = 374
            Top = 8
            Width = 124
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #22788#29702'Android'#32452#20214
            TabOrder = 0
            OnClick = btnProcessAndroidApplicationChildNodesClick
          end
        end
      end
      object tsAndroidJar: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'AndroidJar'#37197#32622
        ImageIndex = 4
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 38
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 1060
          object Label29: TLabel
            Left = 308
            Top = 39
            Width = 4
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 38
          Width = 1064
          Height = 402
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          TabOrder = 1
          ExplicitWidth = 1060
          ExplicitHeight = 401
          object pnlAndroidAarToolBar: TPanel
            Left = 1
            Top = 104
            Width = 1062
            Height = 125
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alBottom
            TabOrder = 0
            ExplicitTop = 103
            ExplicitWidth = 1058
            object btnAddAndroidAar: TButton
              Left = 0
              Top = 46
              Width = 154
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #28155#21152'aar'
              TabOrder = 0
              OnClick = btnAddAndroidAarClick
            end
            object btnProcessAndroidAAR: TButton
              Left = 158
              Top = 46
              Width = 154
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #22788#29702'Aar'
              TabOrder = 1
              OnClick = btnProcessAndroidAARClick
            end
            object btnGenerateAndroidAAR: TButton
              Left = 317
              Top = 46
              Width = 192
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #29983#25104'R.jar'
              TabOrder = 2
              OnClick = btnGenerateAndroidAARClick
            end
            object chkGenerateAndroid64AAR: TCheckBox
              Left = 525
              Top = 48
              Width = 109
              Height = 14
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = '64'#20301'Android'
              TabOrder = 3
            end
            object chkGenerateReleaseRJar: TCheckBox
              Left = 631
              Top = 48
              Width = 74
              Height = 15
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Alignment = taLeftJustify
              BiDiMode = bdRightToLeft
              Caption = 'Release'
              Checked = True
              ParentBiDiMode = False
              State = cbChecked
              TabOrder = 4
            end
            object Button6: TButton
              Left = 873
              Top = 41
              Width = 129
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #20174'Gradle'#20013#23548#20986'aar'
              TabOrder = 5
              OnClick = Button6Click
            end
            object Button8: TButton
              Left = 724
              Top = 43
              Width = 129
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #22788#29702#37325#22797#30340'XML'
              TabOrder = 6
              OnClick = Button8Click
            end
            object Button12: TButton
              Left = 0
              Top = 77
              Width = 153
              Height = 25
              Caption = #19979#36733'aar'
              TabOrder = 7
              OnClick = Button12Click
            end
            object btnAddAndroidJar: TButton
              Left = 1
              Top = 9
              Width = 153
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #28155#21152'Jar'
              TabOrder = 8
              OnClick = btnAddAndroidJarClick
            end
            object btnProcessAndroidJar: TButton
              Left = 159
              Top = 9
              Width = 154
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Caption = #22788#29702'Jar'
              TabOrder = 9
              OnClick = btnProcessAndroidJarClick
            end
          end
          object memAndroidAars: TMemo
            Left = 1
            Top = 229
            Width = 1062
            Height = 172
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alBottom
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
            ExplicitTop = 228
            ExplicitWidth = 1058
          end
          object memAndroidJars: TMemo
            Left = 1
            Top = 1
            Width = 1062
            Height = 103
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 2
            WordWrap = False
            ExplicitWidth = 1058
            ExplicitHeight = 102
          end
        end
      end
      object tsIOSConfig: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'iOS'#24211#37197#32622
        ImageIndex = 6
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 52
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          DesignSize = (
            1064
            52)
          object lblIOSLinkerOptionsHint: TLabel
            Left = 2
            Top = 3
            Width = 709
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = 
              #38142#25509#21442#25968'(Project Options->Building->Delphi Compiler->Linking->option' +
              's passed to LD linker):'
          end
          object edtIOSLinkerOptions: TEdit
            Left = 2
            Top = 21
            Width = 871
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = '-framework SystemConfiguration'
          end
          object btnProcessIOSLinkerOptions: TButton
            Left = 876
            Top = 19
            Width = 158
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Anchors = [akTop, akRight]
            Caption = #22788#29702#38142#25509#21442#25968
            TabOrder = 1
            OnClick = btnProcessIOSLinkerOptionsClick
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 52
          Width = 1064
          Height = 388
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          TabOrder = 1
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 243
            Height = 386
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alLeft
            TabOrder = 0
            object lblAddIOSFrameworkHint: TLabel
              Left = 1
              Top = 1
              Width = 241
              Height = 37
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alTop
              AutoSize = False
              Caption = #27880#24847':'#28155#21152#23436#20043#21518#36824#38656#35201#22312'SDK Manager'#20013#32473#27599#20010'SDK'#28857#20987'"Upate Local File Cache"'
              WordWrap = True
            end
            object memIOS_SDK_Frameworks: TMemo
              Left = 1
              Top = 58
              Width = 241
              Height = 204
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
            object btnAddFrameworksToAllIOSSDK: TButton
              Left = 1
              Top = 38
              Width = 241
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alTop
              Caption = #28155#21152#19979#38754#30340#26694#26550#21040#25152#26377#30340'iPhone SDK'
              TabOrder = 1
              OnClick = btnAddFrameworksToAllIOSSDKClick
            end
            object memIOS_SDK_Dylibs: TMemo
              Left = 1
              Top = 282
              Width = 241
              Height = 103
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alBottom
              Lines.Strings = (
                'libicucore.tbd')
              ScrollBars = ssBoth
              TabOrder = 2
              WordWrap = False
            end
            object btnAddDylibsToAllIOSSDK: TButton
              Left = 1
              Top = 262
              Width = 241
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alBottom
              Caption = #28155#21152#19979#38754#30340#24211#21040#25152#26377#30340'iPhone SDK'
              TabOrder = 3
              OnClick = btnAddDylibsToAllIOSSDKClick
            end
          end
          object Panel14: TPanel
            Left = 244
            Top = 1
            Width = 819
            Height = 386
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 1
            object btnProcessIOSPlistRootNodes: TButton
              Left = 1
              Top = 1
              Width = 817
              Height = 20
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alTop
              Caption = #28155#21152#19979#38754#30340#37197#32622#21040'info.plist.TemplateiOS.xml'
              TabOrder = 0
              OnClick = btnProcessIOSPlistRootNodesClick
            end
            object memIOSPlistRootNodes: TMemo
              Left = 1
              Top = 21
              Width = 817
              Height = 364
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
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
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #24037#31243#22270#26631#21644#21551#21160#22270#29255#35774#32622
        ImageIndex = 3
        object pnlAppIcon: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 149
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          TabOrder = 0
          object lblAppIconHint: TLabel
            Left = 10
            Top = 7
            Width = 129
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = 'App'#22270#26631':'
          end
          object lblIconCornerSize: TLabel
            Left = 157
            Top = 64
            Width = 170
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #22278#35282#35282#24230#23610#23544#30334#20998#27604'(0.15)'
          end
          object btnSelectProjectIcon: TButton
            Left = 155
            Top = 30
            Width = 213
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #36873#21462#22270#26631#25991#20214
            TabOrder = 0
            OnClick = btnSelectProjectIconClick
          end
          object btnProcessProjectIcon: TButton
            Left = 157
            Top = 118
            Width = 211
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #35774#32622#20026#24037#31243#22270#26631
            TabOrder = 1
            OnClick = btnProcessProjectIconClick
          end
          object Panel9: TPanel
            Left = 24
            Top = 26
            Width = 115
            Height = 116
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object imgProjectIcon: TImage
              Left = 2
              Top = 2
              Width = 107
              Height = 108
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              Stretch = True
              ExplicitWidth = 108
            end
          end
          object btnGenerateProjectIconEverySize: TButton
            Left = 157
            Top = 86
            Width = 213
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #29983#25104#21508#31181#23610#23544#21040#24037#31243#30446#24405
            TabOrder = 3
            OnClick = btnGenerateProjectIconEverySizeClick
          end
          object edtIconCornerSizePercent: TEdit
            Left = 314
            Top = 59
            Width = 56
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            TabOrder = 4
            Text = '0'
          end
          object Button5: TButton
            Left = 392
            Top = 58
            Width = 60
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Button5'
            TabOrder = 5
            Visible = False
            OnClick = Button5Click
          end
        end
        object pnlAppLaunch: TPanel
          Left = 0
          Top = 149
          Width = 1064
          Height = 291
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          TabOrder = 1
          object lblAppLaunchImageHint: TLabel
            Left = 10
            Top = 13
            Width = 164
            Height = 13
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            AutoSize = False
            Caption = 'App'#21551#21160#22270#29255':'
          end
          object lblLaunchImageBackColorHint: TLabel
            Left = 392
            Top = 80
            Width = 140
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #36873#25321#21512#25104#30340#32972#26223#39068#33394':'
          end
          object lblLaunchImageScaleBaseHeightHint: TLabel
            Left = 392
            Top = 56
            Width = 140
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #22270#29255#25918#22823#30340#22522#20934#39640#24230':'
          end
          object lblBackColorHexCodeHint: TLabel
            Left = 505
            Top = 132
            Width = 154
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #25110#32972#26223#39068#33394'16'#36827#21046#20195#30721':'
          end
          object cmbProjectLaunchBackColor: TColorListBox
            Left = 392
            Top = 96
            Width = 108
            Height = 73
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            NoneColorColor = clWhite
            Selected = clWhite
            ItemHeight = 13
            TabOrder = 0
            OnClick = cmbProjectLaunchBackColorClick
          end
          object edtProjectLaunchBackColor: TEdit
            Left = 505
            Top = 150
            Width = 92
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            TabOrder = 1
          end
          object Panel12: TPanel
            Left = 24
            Top = 30
            Width = 128
            Height = 192
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object imgProjectLaunchImage: TImage
              Left = 2
              Top = 2
              Width = 120
              Height = 184
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
              Align = alClient
              Stretch = True
              ExplicitWidth = 121
              ExplicitHeight = 185
            end
          end
          object btnSelectProjectLaunchImage: TButton
            Left = 157
            Top = 34
            Width = 211
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #36873#25321#21551#21160#22270#29255#25110#22270#26631
            TabOrder = 3
            OnClick = btnSelectProjectLaunchImageClick
          end
          object btnGenerateProjectLaunchImageEverySize: TButton
            Left = 157
            Top = 174
            Width = 211
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #30452#25509#29983#25104#21508#31181#23610#23544#21040#24037#31243#30446#24405
            TabOrder = 4
            OnClick = btnGenerateProjectLaunchImageEverySizeClick
          end
          object btnProcessProjectLaunchImage: TButton
            Left = 154
            Top = 198
            Width = 443
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #35774#32622#20026#24037#31243#21551#21160#22270#29255
            TabOrder = 5
            OnClick = btnProcessProjectLaunchImageClick
          end
          object Button2: TButton
            Left = 594
            Top = 248
            Width = 138
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #28165#38500'10.3.1'#30340'IOS'#21551#21160#22270#29255
            TabOrder = 6
            Visible = False
            OnClick = Button2Click
          end
          object btnCombineLaunchImageByBackColor: TButton
            Left = 392
            Top = 174
            Width = 205
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = #25110#26681#25454#32972#26223#39068#33394#21512#25104#21551#21160#22270#29255
            TabOrder = 7
            OnClick = btnCombineLaunchImageByBackColorClick
          end
          object edtScaleBaseHeight: TEdit
            Left = 518
            Top = 54
            Width = 79
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            TabOrder = 8
            Text = '960'
          end
          object Button4: TButton
            Left = 717
            Top = 38
            Width = 60
            Height = 20
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'Button4'
            TabOrder = 9
            OnClick = Button4Click
          end
        end
      end
      object TabSheet1: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #25209#37327#37197#32622#24037#31243#25152#38656#35201#30340'SDK'
        ImageIndex = 8
        object lvNeedUseSDKs: TListView
          Left = 0
          Top = 0
          Width = 353
          Height = 440
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alLeft
          Checkboxes = True
          Columns = <
            item
              Caption = 'SDK'
              Width = 80
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
          Left = 287
          Top = 98
          Width = 155
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #25209#37327#22788#29702#25152#36873#20013#30340'SDK'
          TabOrder = 1
          OnClick = btnBatchProcessSDKsClick
        end
        object Button1: TButton
          Left = 287
          Top = 16
          Width = 155
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #21152#36733#36873#20013#30340'SDK'
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button7: TButton
          Left = 287
          Top = 54
          Width = 155
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #20445#23384#36873#20013#30340'SDK'
          TabOrder = 3
          OnClick = Button7Click
        end
      end
      object tsWeiXinJar: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'AndroidSDK'#37197#32622
        ImageIndex = 5
        DesignSize = (
          1064
          440)
        object Label13: TLabel
          Left = 4
          Top = 190
          Width = 62
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Jar'#25991#20214#21517
        end
        object Label14: TLabel
          Left = 578
          Top = 190
          Width = 205
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #36825#26159#20320#24076#26395#36755#20986#30340'JAR '#25991#20214#21517#12290
        end
        object Label15: TLabel
          Left = 4
          Top = 42
          Width = 50
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'JDK'#30446#24405
        end
        object Label16: TLabel
          Left = 902
          Top = 39
          Width = 179
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akTop, akRight]
          Caption = #36825#20010#20301#32622#26159#20320#30340' jdk '#30340#30446#24405'.'
          ExplicitLeft = 704
        end
        object Label17: TLabel
          Left = 578
          Top = 67
          Width = 98
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #23433#21331'SDK'#30340#30446#24405
        end
        object Label18: TLabel
          Left = 4
          Top = 66
          Width = 83
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #23433#21331'SDK'#30446#24405
        end
        object Label19: TLabel
          Left = 4
          Top = 90
          Width = 95
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'SDKApiLevelPath'
        end
        object Label20: TLabel
          Left = 578
          Top = 91
          Width = 147
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #23433#21331'SDK'#30340'API'#31561#32423#30446#24405
        end
        object Label21: TLabel
          Left = 4
          Top = 114
          Width = 74
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'SDKAaptPath'
        end
        object Label22: TLabel
          Left = 578
          Top = 115
          Width = 143
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #23433#21331'SDK'#30340#36866#37197#22120#29256#26412
        end
        object Label23: TLabel
          Left = 2
          Top = 137
          Width = 92
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #38656#35201#24341#29992#30340'Jar'
        end
        object Label24: TLabel
          Left = 4
          Top = 212
          Width = 62
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Jar'#28304#25991#20214
        end
        object Label26: TLabel
          Left = 2
          Top = 354
          Width = 60
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #24494#20449#21253#21517
        end
        object Label30: TLabel
          Left = 4
          Top = 17
          Width = 65
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Delphi'#29256#26412
        end
        object pcJavaSourceFiles: TPageControl
          Left = 452
          Top = 294
          Width = 597
          Height = 144
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ActivePage = TabSheet4
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 10
          Visible = False
          object TabSheet2: TTabSheet
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'WXEntryActivity.java'
            object memWXEntryActivity: TMemo
              Left = 0
              Top = 0
              Width = 589
              Height = 113
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
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
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'WXPayEntryActivity.java'
            ImageIndex = 1
            object memWXPayEntryActivity: TMemo
              Left = 0
              Top = 0
              Width = 589
              Height = 113
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
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
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'OnWeixinListener.java'
            ImageIndex = 2
            object memOnWeixinListener: TMemo
              Left = 0
              Top = 0
              Width = 589
              Height = 113
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
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
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'wxapi.pas'
            ImageIndex = 3
            object memWxApiPas: TMemo
              Left = 0
              Top = 0
              Width = 589
              Height = 113
              Margins.Left = 2
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 2
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
          Left = 126
          Top = 187
          Width = 764
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'wxapi.jar'
        end
        object edtJDKDir: TEdit
          Left = 126
          Top = 39
          Width = 764
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'C:\Program Files\Java\jdk1.8.0_151'
        end
        object edtAndroidSDKDir: TEdit
          Left = 126
          Top = 63
          Width = 764
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows'
        end
        object edtAndroidSDKPlatform: TEdit
          Left = 126
          Top = 87
          Width = 764
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows\platforms\android-22'
        end
        object edtAndroidSDKBuildTools: TEdit
          Left = 126
          Top = 111
          Width = 677
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Text = 
            'C:\Users\Public\Documents\Embarcadero\Studio\17.0\PlatformSDKs\a' +
            'ndroid-sdk-windows\build-tools\22.0.1'
        end
        object memUsedAndroidJars: TMemo
          Left = 126
          Top = 134
          Width = 764
          Height = 48
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '%ANDROID_PLATFORM%\android.jar')
          TabOrder = 5
          WordWrap = False
        end
        object memJavaSourceFiles: TMemo
          Left = 126
          Top = 212
          Width = 764
          Height = 47
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            
              'E:\MyFiles\ThirdPartySDK\'#24494#20449#25903#20184#25509#21475'\'#19981#35013'eclipse'#22914#20309#29983#25104#24494#20449'Jar\src\com\ggggc' +
              'exx\orangeui\wxapi\*.java')
          TabOrder = 6
          WordWrap = False
        end
        object btnGenerateJar: TButton
          Left = 126
          Top = 264
          Width = 260
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #19981#35013'Eclipse'#29983#25104'Jar('#30446#24405#19981#33021#26377#20013#25991')'
          TabOrder = 7
          OnClick = btnGenerateJarClick
        end
        object btnGenerateWeiXinJar: TButton
          Left = 266
          Top = 349
          Width = 84
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #29983#25104#24494#20449'Jar'
          TabOrder = 8
          OnClick = btnGenerateWeiXinJarClick
        end
        object edtWeiXinAndroidPackage: TEdit
          Left = 98
          Top = 350
          Width = 152
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          TabOrder = 9
          Text = 'com.ggggcexx.orangeui'
          TextHint = #24212#29992#21253#21517
        end
        object btnLoadAndroidSDKFromReg: TButton
          Left = 224
          Top = 14
          Width = 223
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #20174#27880#20876#34920#21152#36733'AndroidSDK'#37197#32622
          TabOrder = 11
          OnClick = btnLoadAndroidSDKFromRegClick
        end
        object cmbDelphiVersions: TComboBox
          Left = 126
          Top = 15
          Width = 73
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ItemIndex = 0
          TabOrder = 12
          Text = '21.0'
          Items.Strings = (
            '21.0'
            '20.0'
            '19.0'
            '18.0')
        end
        object Button3: TButton
          Left = 390
          Top = 263
          Width = 171
          Height = 20
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #20445#23384'AndroidSDK'#37197#32622
          TabOrder = 13
          OnClick = Button3Click
        end
        object Button9: TButton
          Left = 98
          Top = 392
          Width = 152
          Height = 25
          Caption = #29983#25104#33258#23450#20041'jar'
          TabOrder = 14
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 902
          Top = 137
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #28155#21152'Jar'
          TabOrder = 15
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 902
          Top = 209
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #28155#21152'Java'
          TabOrder = 16
          OnClick = Button11Click
        end
        object cmbBuildToolsVersion: TComboBox
          Left = 808
          Top = 111
          Width = 82
          Height = 24
          Anchors = [akTop, akRight]
          TabOrder = 17
          OnChange = cmbBuildToolsVersionChange
        end
      end
      object tsThanks: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #40483#35874
        ImageIndex = 9
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 1064
          Height = 440
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Lines.Strings = (
            'xm QQ:910885622')
          TabOrder = 0
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 39
      Width = 1072
      Height = 33
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 1068
      DesignSize = (
        1072
        33)
      object lblCurrentProject: TLabel
        Left = 83
        Top = 9
        Width = 116
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24453#22788#29702#24037#31243#25991#20214':'
      end
      object btnSelectProject: TButton
        Left = 833
        Top = 6
        Width = 98
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Caption = #36873#25321#24037#31243#25991#20214
        TabOrder = 0
        OnClick = btnSelectProjectClick
        ExplicitLeft = 829
      end
      object btnProcessConfigToProject: TButton
        Left = 952
        Top = 6
        Width = 103
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Caption = #37197#32622#21040#35813#24037#31243
        TabOrder = 1
        OnClick = btnProcessConfigToProjectClick
        ExplicitLeft = 948
      end
      object edtProjectFilePath: TComboBox
        Left = 211
        Top = 5
        Width = 593
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'E:\TBUISDK_Android\TBUISDK.dproj'
        ExplicitWidth = 589
      end
      object RadioButton1: TRadioButton
        Left = 5
        Top = 8
        Width = 90
        Height = 14
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #20013#25991
        TabOrder = 3
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 52
        Top = 8
        Width = 90
        Height = 14
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'English'
        TabOrder = 4
        OnClick = RadioButton2Click
      end
    end
    object pnlToolBar: TPanel
      Left = 1
      Top = 1
      Width = 1072
      Height = 38
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 1068
      DesignSize = (
        1072
        38)
      object lblCurrentConfig: TLabel
        Left = 116
        Top = 13
        Width = 83
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taRightJustify
        AutoSize = False
        Caption = #24403#21069#37197#32622#25991#20214':'
      end
      object btnSaveConfig: TButton
        Left = 952
        Top = 8
        Width = 103
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Caption = #20445#23384#24403#21069#37197#32622
        TabOrder = 0
        OnClick = btnSaveConfigClick
        ExplicitLeft = 948
      end
      object btnOpenConfig: TButton
        Left = 833
        Top = 10
        Width = 98
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Caption = #36873#25321#37197#32622#25991#20214
        TabOrder = 1
        OnClick = btnOpenConfigClick
        ExplicitLeft = 829
      end
      object btnNewConfig: TButton
        Left = 14
        Top = 8
        Width = 97
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #26032#24314#37197#32622#25991#20214
        TabOrder = 2
        OnClick = btnNewConfigClick
      end
      object cmbConfigFilePath: TComboBox
        Left = 211
        Top = 8
        Width = 593
        Height = 24
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Text = 'E:\TBUISDK_Android\TBUISDK.dproj'
        OnChange = cmbConfigFilePathChange
        ExplicitWidth = 589
      end
    end
  end
  object pcLogBottom: TPanel
    Left = 0
    Top = 544
    Width = 1076
    Height = 192
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 543
    ExplicitWidth = 1072
    object memLog: TMemo
      Left = 1
      Top = 20
      Width = 1074
      Height = 171
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
      ExplicitWidth = 1070
    end
    object pnlLogCaption: TPanel
      Left = 1
      Top = 1
      Width = 1074
      Height = 19
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Messages'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      ExplicitWidth = 1070
    end
  end
  object dsCurrent: TDataSource
    Left = 180
    Top = 28
  end
  object dsPreview: TDataSource
    Left = 412
    Top = 28
  end
  object dsDeployConfig: TDataSource
    Left = 316
    Top = 12
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
    Left = 500
    Top = 28
  end
  object opdSelectProjectLaunchImage: TOpenPictureDialog
    Left = 532
    Top = 136
  end
  object odSelectAndroidAar: TOpenDialog
    DefaultExt = '*.jar'
    Filter = 'Android'#21253#25991#20214'(*.aar)|*.aar|Android'#21253#25991#20214'(*.jar)|*.jar'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 724
    Top = 117
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.xml'
    Filter = 'xml|*.xml'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 733
    Top = 471
  end
  object odSelectJava: TOpenDialog
    DefaultExt = '*.java'
    Filter = 'Java'#25991#20214'(*.java)|*.java'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 820
    Top = 341
  end
end
