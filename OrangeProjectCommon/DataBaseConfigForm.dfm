object frmDataBaseConfig: TfrmDataBaseConfig
  Left = 271
  Top = 114
  Caption = #25968#25454#24211#37197#32622
  ClientHeight = 248
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = -4
    Top = 41
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25968#25454#24211#26381#21153#22120
  end
  object Label6: TLabel
    Left = -4
    Top = 68
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25968#25454#24211#31471#21475
  end
  object Label3: TLabel
    Left = -4
    Top = 95
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29992#25143#21517':'
  end
  object Label4: TLabel
    Left = -4
    Top = 124
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23494#30721':'
  end
  object Label5: TLabel
    Left = -4
    Top = 149
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25968#25454#24211':'
  end
  object Label1: TLabel
    Left = -4
    Top = 11
    Width = 120
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25968#25454#24211#31867#22411
  end
  object btnOK: TButton
    Left = 133
    Top = 185
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 214
    Top = 185
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtDBHostName: TEdit
    Left = 132
    Top = 38
    Width = 160
    Height = 21
    TabOrder = 2
    Text = 'www.orangeui.cn'
  end
  object edtDBHostPort: TEdit
    Left = 132
    Top = 65
    Width = 160
    Height = 21
    TabOrder = 3
    Text = '1433'
  end
  object edtDBUserName: TEdit
    Left = 132
    Top = 92
    Width = 160
    Height = 21
    TabOrder = 4
    Text = 'sa'
  end
  object edtDBPassword: TEdit
    Left = 132
    Top = 119
    Width = 160
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
    Text = '138575wangneng'
  end
  object edtDBDataBaseName: TEdit
    Left = 132
    Top = 146
    Width = 160
    Height = 21
    TabOrder = 6
    Text = 'GetuiPush'
  end
  object cmbDBType: TComboBox
    Left = 132
    Top = 8
    Width = 160
    Height = 21
    ItemIndex = 0
    TabOrder = 7
    Text = 'MYSQL'
    Items.Strings = (
      'MYSQL'
      'MSSQL')
  end
  object btnSelect: TButton
    Left = 8
    Top = 185
    Width = 75
    Height = 25
    Caption = #36873#25321
    TabOrder = 8
    OnClick = btnSelectClick
  end
  object OpenDialog1: TOpenDialog
    Filter = 'ini|*.ini'
    Left = 40
    Top = 136
  end
end
