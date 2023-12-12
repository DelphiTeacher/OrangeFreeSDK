object FrameBaseWebBrowser: TFrameBaseWebBrowser
  Left = 0
  Top = 0
  Width = 993
  Height = 524
  TabOrder = 0
  object CEFWindowParent1: TCEFWindowParent
    Left = 0
    Top = 178
    Width = 993
    Height = 326
    Align = alClient
    TabStop = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 993
    Height = 25
    Align = alTop
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 25
    Width = 993
    Height = 25
    Align = alTop
    Caption = #27979#35797#33050#26412#26159#21542#21152#36733'/'#33719#21462#29992#25143#20449#24687
    TabOrder = 2
    Visible = False
    OnClick = Button2Click
  end
  object pnlTest: TPanel
    Left = 0
    Top = 50
    Width = 993
    Height = 87
    Align = alTop
    TabOrder = 3
    object btnLoadFacebookAPI: TButton
      Left = 17
      Top = 6
      Width = 75
      Height = 25
      Caption = #21152#36733#33050#26412
      TabOrder = 0
      OnClick = btnLoadFacebookAPIClick
    end
    object btnTransferPicContent: TButton
      Left = 96
      Top = 6
      Width = 90
      Height = 25
      Caption = #36716#21457#22270#29255#24086#23376
      TabOrder = 1
      OnClick = btnTransferPicContentClick
    end
    object btnTransferVideoContent: TButton
      Left = 199
      Top = 6
      Width = 90
      Height = 25
      Caption = #36716#21457#35270#39057#24086#23376
      TabOrder = 2
      OnClick = btnTransferVideoContentClick
    end
    object btnTransferGroupContent: TButton
      Left = 304
      Top = 6
      Width = 97
      Height = 25
      Caption = #36716#21457#32676#32452#24086#23376
      TabOrder = 3
      OnClick = btnTransferGroupContentClick
    end
    object btnLogin: TButton
      Left = 457
      Top = 6
      Width = 75
      Height = 25
      Caption = #30331#24405
      TabOrder = 10
      OnClick = btnLoginClick
    end
    object btnGetLoginCaptcha: TButton
      Left = 538
      Top = 6
      Width = 90
      Height = 25
      Caption = #33719#21462#30331#24405#39564#35777#30721
      TabOrder = 11
      OnClick = btnGetLoginCaptchaClick
    end
    object btnSetSearchWord: TButton
      Left = 105
      Top = 47
      Width = 75
      Height = 25
      Caption = #35774#32622#25628#32034#35789
      TabOrder = 4
      OnClick = btnSetSearchWordClick
    end
    object btnOpenSearch: TButton
      Left = 17
      Top = 47
      Width = 75
      Height = 25
      Caption = #28857#20987#25628#32034#26694
      TabOrder = 5
      OnClick = btnOpenSearchClick
    end
    object btnIsShop: TButton
      Left = 193
      Top = 47
      Width = 75
      Height = 25
      Caption = #36807#28388#21830#24215
      TabOrder = 6
      OnClick = btnIsShopClick
    end
    object btnCertified: TButton
      Left = 281
      Top = 47
      Width = 75
      Height = 25
      Caption = #36807#28388#24050#35748#35777
      TabOrder = 7
      OnClick = btnCertifiedClick
    end
    object btnCatrgory: TButton
      Left = 369
      Top = 47
      Width = 75
      Height = 25
      Caption = #36807#28388#31867#21035
      TabOrder = 8
      OnClick = btnCatrgoryClick
    end
    object btnChoseCountry: TButton
      Left = 458
      Top = 47
      Width = 75
      Height = 25
      Caption = #22478#24066#36873#25321
      TabOrder = 9
      OnClick = btnChoseCountryClick
    end
    object btnLoadFacebook: TButton
      Left = 640
      Top = 6
      Width = 75
      Height = 25
      Caption = #21152#36733'Facebook'
      TabOrder = 12
      OnClick = btnLoadFacebookClick
    end
    object Button3: TButton
      Left = 539
      Top = 47
      Width = 89
      Height = 25
      Caption = #33719#21462#36755#20837#26694#20301#32622
      TabOrder = 13
      OnClick = Button3Click
    end
    object edtX: TEdit
      Left = 643
      Top = 48
      Width = 46
      Height = 21
      TabOrder = 14
    end
    object edtY: TEdit
      Left = 695
      Top = 48
      Width = 46
      Height = 21
      TabOrder = 15
    end
    object Button4: TButton
      Left = 747
      Top = 56
      Width = 142
      Height = 25
      Caption = #27169#25311#40736#26631#28857#20987#33719#21462#28966#28857
      TabOrder = 16
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 895
      Top = 48
      Width = 90
      Height = 25
      Caption = #21033#29992'js'#30340'focus'
      TabOrder = 17
    end
    object ComboBox1: TComboBox
      Left = 840
      Top = 6
      Width = 145
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      Text = 'ComboBox1'
    end
    object btnGetAccountInfo: TButton
      Left = 736
      Top = 6
      Width = 75
      Height = 25
      Caption = #33719#21462#29992#25143#20449#24687
      TabOrder = 19
      OnClick = btnGetAccountInfoClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 504
    Width = 993
    Height = 20
    Panels = <
      item
        Width = 100
      end
      item
        Width = 500
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
  end
  object pnlUrl: TPanel
    Left = 0
    Top = 137
    Width = 993
    Height = 41
    Align = alTop
    TabOrder = 5
    Visible = False
    object edtUrl: TEdit
      AlignWithMargins = True
      Left = 11
      Top = 6
      Width = 971
      Height = 29
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'http://www.facebook.com'
      ExplicitHeight = 27
    end
  end
  object tmrInit: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmrInitTimer
    Left = 112
    Top = 204
  end
  object Chromium1: TChromium
    OnCookiesVisited = Chromium1CookiesVisited
    OnCookieVisitorDestroyed = Chromium1CookieVisitorDestroyed
    OnZoomPctAvailable = Chromium1ZoomPctAvailable
    OnRenderCompMsg = Chromium1RenderCompMsg
    OnProcessMessageReceived = Chromium1ProcessMessageReceived
    OnLoadEnd = Chromium1LoadEnd
    OnLoadError = Chromium1LoadError
    OnLoadingStateChange = Chromium1LoadingStateChange
    OnSetFocus = Chromium1SetFocus
    OnBeforeContextMenu = Chromium1BeforeContextMenu
    OnContextMenuCommand = Chromium1ContextMenuCommand
    OnFullScreenModeChange = Chromium1FullScreenModeChange
    OnStatusMessage = Chromium1StatusMessage
    OnLoadingProgressChange = Chromium1LoadingProgressChange
    OnBeforeDownload = Chromium1BeforeDownload
    OnDownloadUpdated = Chromium1DownloadUpdated
    OnDialogClosed = Chromium1DialogClosed
    OnBeforePopup = Chromium1BeforePopup
    OnAfterCreated = Chromium1AfterCreated
    OnBeforeClose = Chromium1BeforeClose
    OnClose = Chromium1Close
    OnFileDialog = Chromium1FileDialog
    Left = 32
    Top = 204
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 32
    Top = 280
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 3000
    Left = 112
    Top = 280
  end
  object tmrProcessCustomMessage: TTimer
    OnTimer = tmrProcessCustomMessageTimer
    Left = 488
    Top = 240
  end
end
