object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #22797#21046#25511#20214#21040#25351#23450#30340#26174#31034#22120
  ClientHeight = 404
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 41
    Width = 478
    Height = 363
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    ExplicitTop = 39
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 36
      Height = 13
      Caption = #23558#35270#39057
    end
    object Label2: TLabel
      Left = 151
      Top = 13
      Width = 72
      Height = 13
      Caption = #26174#31034#21040#26174#31034#22120
    end
    object btnOK: TButton
      Left = 334
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object cmbMonitor: TComboBox
      Left = 232
      Top = 10
      Width = 88
      Height = 21
      TabOrder = 1
      Text = 'cmbMonitor'
    end
    object cmbVideo: TComboBox
      Left = 58
      Top = 14
      Width = 87
      Height = 21
      TabOrder = 2
      Text = '1'
    end
  end
end
