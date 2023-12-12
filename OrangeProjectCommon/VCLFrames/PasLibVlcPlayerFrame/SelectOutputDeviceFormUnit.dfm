object SelectOutputDeviceForm: TSelectOutputDeviceForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Select output device'
  ClientHeight = 242
  ClientWidth = 395
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
  object OutputDevicesLabel: TLabel
    Left = 12
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Output devices:'
    FocusControl = OutputDevicesLB
  end
  object OutputDevicesLB: TListBox
    Left = 12
    Top = 27
    Width = 285
    Height = 198
    Style = lbOwnerDrawFixed
    TabOrder = 0
    OnDblClick = OutputDevicesLBDblClick
    OnDrawItem = OutputDevicesLBDrawItem
  end
  object OkBtn: TButton
    Left = 310
    Top = 28
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 310
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
