object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmMain'
  ClientHeight = 273
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 12
    Top = 59
    Width = 36
    Height = 12
    Caption = #20844#38053#65306
  end
  object Label2: TLabel
    Left = 12
    Top = 26
    Width = 36
    Height = 12
    Caption = #31169#38053#65306
  end
  object Label3: TLabel
    Left = 12
    Top = 92
    Width = 36
    Height = 12
    Caption = #26126#25991#65306
  end
  object Label4: TLabel
    Left = 12
    Top = 124
    Width = 36
    Height = 12
    Caption = #23494#25991#65306
  end
  object Label5: TLabel
    Left = 8
    Top = 157
    Width = 84
    Height = 12
    Caption = #35299#23494#21518#30340#26126#25991#65306
  end
  object Label6: TLabel
    Left = 688
    Top = 26
    Width = 24
    Height = 12
    Caption = #38271#24230
  end
  object Button1: TButton
    Left = 264
    Top = 216
    Width = 75
    Height = 25
    Caption = #21152#23494
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 416
    Top = 216
    Width = 75
    Height = 25
    Caption = #35299#23494
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 54
    Top = 21
    Width = 481
    Height = 20
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 54
    Top = 54
    Width = 658
    Height = 20
    ReadOnly = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 54
    Top = 88
    Width = 658
    Height = 20
    TabOrder = 4
    Text = #22825#21738#65281#25105#30340#34915#26381#21448#30246#20102#12290
  end
  object Edit4: TEdit
    Left = 54
    Top = 121
    Width = 658
    Height = 20
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 54
    Top = 175
    Width = 658
    Height = 20
    TabOrder = 6
  end
  object Button3: TButton
    Left = 541
    Top = 19
    Width = 80
    Height = 25
    Caption = #38543#26426#21462#31169#38053
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 112
    Top = 216
    Width = 75
    Height = 25
    Caption = #29983#25104#20844#38053
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit6: TEdit
    Left = 627
    Top = 21
    Width = 40
    Height = 20
    MaxLength = 3
    NumbersOnly = True
    TabOrder = 9
    Text = '12'
  end
  object UpDown1: TUpDown
    Left = 667
    Top = 21
    Width = 16
    Height = 20
    Associate = Edit6
    Min = 12
    Max = 256
    Position = 12
    TabOrder = 10
  end
end
