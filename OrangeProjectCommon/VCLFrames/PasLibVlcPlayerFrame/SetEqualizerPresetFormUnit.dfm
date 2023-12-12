object SetEqualizerPresetForm: TSetEqualizerPresetForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Set Equalizer Preset'
  ClientHeight = 295
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PresetListLabel: TLabel
    Left = 16
    Top = 13
    Width = 40
    Height = 13
    Caption = 'Presets:'
    FocusControl = PresetListLB
  end
  object BandInfoLabel: TLabel
    Left = 140
    Top = 13
    Width = 83
    Height = 13
    Caption = 'Preset band info:'
    FocusControl = BandInfoLB
  end
  object PresetListLB: TListBox
    Left = 16
    Top = 32
    Width = 105
    Height = 245
    ItemHeight = 13
    TabOrder = 0
    OnClick = PresetListLBClick
  end
  object OkBtn: TButton
    Left = 380
    Top = 13
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 380
    Top = 44
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object BandInfoLB: TListBox
    Left = 140
    Top = 32
    Width = 221
    Height = 245
    ItemHeight = 13
    TabOrder = 3
  end
end
