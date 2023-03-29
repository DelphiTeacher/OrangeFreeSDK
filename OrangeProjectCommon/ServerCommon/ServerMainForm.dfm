object frmServerMain: TfrmServerMain
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 717
  Height = 492
  AutoScroll = True
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object pnlToolBar: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 701
    object Label1: TLabel
      Left = 52
      Top = 12
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #31471#21475
    end
    object Label2: TLabel
      Left = 29
      Top = 45
      Width = 51
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'SSL'#31471#21475
    end
    object btnDBConfig: TButton
      Left = 403
      Top = 56
      Width = 141
      Height = 33
      Caption = #25968#25454#24211#37197#32622
      TabOrder = 0
      OnClick = btnDBConfigClick
    end
    object btnStartServer: TButton
      Left = 255
      Top = 9
      Width = 141
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21551#21160#26381#21153#31471
      TabOrder = 1
      OnClick = btnStartServerClick
    end
    object btnStopService: TButton
      Left = 404
      Top = 9
      Width = 141
      Height = 40
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20572#27490#26381#21153#31471
      TabOrder = 2
      OnClick = btnStopServiceClick
    end
    object edtPort: TEdit
      Left = 96
      Top = 9
      Width = 151
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 3
      Text = '10000'
    end
    object edtSSLPort: TEdit
      Left = 96
      Top = 42
      Width = 151
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      Text = '443'
    end
  end
  object pcClient: TPageControl
    Left = 0
    Top = 105
    Width = 705
    Height = 349
    ActivePage = tsLog
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 701
    ExplicitHeight = 348
    object tsPerformance: TTabSheet
      Caption = #24615#33021
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 117
        Height = 17
        Caption = #25509#21475#20013#24635#35843#29992#27425#25968':'
      end
      object Label4: TLabel
        Left = 16
        Top = 48
        Width = 103
        Height = 17
        Caption = #27599#31186#26368#39640#24182#21457#25968':'
      end
      object Label5: TLabel
        Left = 16
        Top = 120
        Width = 89
        Height = 17
        Caption = #26080#25928#35843#29992#27425#25968':'
        Visible = False
      end
      object lblSumCallCount: TLabel
        Left = 152
        Top = 16
        Width = 8
        Height = 17
        Caption = '0'
      end
      object lblMaxCallCountPerSecond: TLabel
        Left = 152
        Top = 50
        Width = 8
        Height = 17
        Caption = '0'
      end
      object lblInvalidCallCount: TLabel
        Left = 152
        Top = 120
        Width = 8
        Height = 17
        Caption = '0'
        Visible = False
      end
      object Label6: TLabel
        Left = 16
        Top = 82
        Width = 79
        Height = 17
        Caption = 'Redis'#32531#20914#27744':'
      end
      object lblRedisPoolCount: TLabel
        Left = 152
        Top = 82
        Width = 8
        Height = 17
        Caption = '0'
      end
    end
    object tsLog: TTabSheet
      Caption = #26085#24535
      ImageIndex = 1
      object memLog: TMemo
        Left = 0
        Top = 0
        Width = 697
        Height = 317
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = memLogDblClick
        ExplicitWidth = 693
        ExplicitHeight = 316
      end
    end
    object tsDatabasePool: TTabSheet
      Caption = #25968#25454#24211#36830#25509#27744
      ImageIndex = 2
      object gridDatabasePool: TStringGrid
        Left = 0
        Top = 0
        Width = 697
        Height = 317
        Align = alClient
        DefaultColWidth = 100
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ColWidths = (
          100
          100
          100
          100
          100)
        RowHeights = (
          24
          24
          24
          24
          24)
      end
    end
  end
  object timerCopySQL: TTimer
    Enabled = False
    Interval = 3600000
    OnTimer = timerCopySQLTimer
    Left = 544
    Top = 208
  end
  object tmrStartServer: TTimer
    Interval = 2000
    OnTimer = tmrStartServerTimer
    Left = 424
    Top = 216
  end
  object tmrSyncUI: TTimer
    OnTimer = tmrSyncUITimer
    Left = 292
    Top = 317
  end
end
