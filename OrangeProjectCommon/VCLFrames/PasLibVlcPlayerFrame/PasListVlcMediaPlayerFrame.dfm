object framePasLibVlcMediaPlayer: TframePasLibVlcMediaPlayer
  Left = 0
  Top = 0
  Width = 529
  Height = 507
  Constraints.MinHeight = 240
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  PopupMenu = PopupMenu
  TabOrder = 0
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  object PR: TPanel
    Left = 350
    Top = 0
    Width = 179
    Height = 507
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object PlayBtn: TButton
      Left = 6
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Play'
      TabOrder = 0
      OnClick = PlayClick
    end
    object PauseBtn: TButton
      Left = 8
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Pause'
      TabOrder = 1
      OnClick = PauseClick
    end
    object GetWidthBtn: TButton
      Left = 8
      Top = 99
      Width = 75
      Height = 25
      Caption = 'Get width'
      TabOrder = 2
      OnClick = GetWidthClick
    end
    object GetHeightBtn: TButton
      Left = 8
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Get height'
      TabOrder = 3
      OnClick = GetHeightBtnClick
    end
    object GetStateBtn: TButton
      Left = 8
      Top = 157
      Width = 75
      Height = 25
      Caption = 'Get state'
      TabOrder = 4
      OnClick = GetStateClick
    end
    object ResumeBtn: TButton
      Left = 8
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Resume'
      TabOrder = 5
      OnClick = ResumeClick
    end
    object GetPosLenBtn: TButton
      Left = 8
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Get pos, len'
      TabOrder = 6
      OnClick = GetPosLenClick
    end
    object Scale10Btn: TButton
      Left = 8
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Scale -10%'
      TabOrder = 7
      OnClick = Scale10Click
    end
    object ScaleFitBtn: TButton
      Left = 8
      Top = 244
      Width = 75
      Height = 25
      Caption = 'ScaleFit'
      TabOrder = 8
      OnClick = ScaleFitClick
    end
    object SnapShotBtn: TButton
      Left = 8
      Top = 273
      Width = 75
      Height = 25
      Caption = 'SnapShot'
      TabOrder = 9
      OnClick = SnapShotClick
    end
    object NextFrameBtn: TButton
      Left = 8
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Next Frame'
      TabOrder = 10
      OnClick = NextFrameClick
    end
    object GetASpectRatioBtn: TButton
      Left = 96
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Get Aspect'
      TabOrder = 11
      OnClick = GetASpectRatioClick
    end
    object SetAsp11Btn: TButton
      Left = 96
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Set asp 1:1'
      TabOrder = 12
      OnClick = SetAsp11Click
    end
    object SetAsp43Btn: TButton
      Left = 96
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Set asp 4:3'
      TabOrder = 13
      OnClick = SetAsp43Click
    end
    object GetVolume: TButton
      Left = 96
      Top = 99
      Width = 75
      Height = 25
      Caption = 'Get Volume'
      TabOrder = 14
      OnClick = GetVolumeClick
    end
    object SetVolumeUp10: TButton
      Left = 96
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Volume +10'
      TabOrder = 15
      OnClick = SetVolumeUp10Click
    end
    object SetVolumeDo10: TButton
      Left = 96
      Top = 157
      Width = 75
      Height = 25
      Caption = 'Volume -10'
      TabOrder = 16
      OnClick = SetVolumeDo10Click
    end
    object GetPlayRateBtn: TButton
      Left = 96
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Get Play Rate'
      TabOrder = 17
      OnClick = GetPlayRateBtnClick
    end
    object SetPlayRate2xBtn: TButton
      Left = 96
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Play Rate 2x'
      TabOrder = 18
      OnClick = SetPlayRate2xBtnClick
    end
    object SetPlayRateHalfBtn: TButton
      Left = 96
      Top = 244
      Width = 75
      Height = 25
      Caption = 'Play Rate 1/2'
      TabOrder = 19
      OnClick = SetPlayRateHalfBtnClick
    end
    object FullScreenYesBtn: TButton
      Left = 96
      Top = 273
      Width = 75
      Height = 25
      Caption = 'FullScreen'
      TabOrder = 20
      OnClick = FullScreenYesBtnClick
    end
    object DeInterlaceBtn: TButton
      Left = 8
      Top = 335
      Width = 75
      Height = 25
      Caption = 'DeInterlace'
      TabOrder = 21
      OnClick = DeInterlaceBtnClick
    end
    object GetAudioChannel: TButton
      Left = 96
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Get Audio Ch'
      TabOrder = 22
      OnClick = GetAudioChannelClick
    end
    object SetAudioChannelLeft: TButton
      Left = 96
      Top = 335
      Width = 75
      Height = 25
      Caption = 'Set Audio C L'
      TabOrder = 23
      OnClick = SetAudioChannelLeftClick
    end
    object SetAudioChannelRight: TButton
      Left = 96
      Top = 366
      Width = 75
      Height = 25
      Caption = 'Set Audio C R'
      TabOrder = 24
      OnClick = SetAudioChannelRightClick
    end
    object SetAudioChannelStereo: TButton
      Left = 96
      Top = 397
      Width = 75
      Height = 25
      Caption = 'Set Audio C S'
      TabOrder = 26
      OnClick = SetAudioChannelStereoClick
    end
    object GetAudioOutListBtn: TButton
      Left = 8
      Top = 366
      Width = 75
      Height = 25
      Caption = 'AudioOutList'
      TabOrder = 25
      OnClick = GetAudioOutListBtnClick
    end
    object GetAudioOutDevEnumBtn: TButton
      Left = 8
      Top = 397
      Width = 75
      Height = 25
      Caption = 'AOutDevEnum'
      TabOrder = 27
      OnClick = GetAudioOutDevEnumBtnClick
    end
    object GetEqPreListBtn: TButton
      Left = 96
      Top = 459
      Width = 75
      Height = 25
      Caption = 'EqalizerPreList'
      TabOrder = 28
      OnClick = GetEqPreListBtnClick
    end
    object SetEqualizerBtn: TButton
      Left = 96
      Top = 428
      Width = 75
      Height = 25
      Caption = 'Set Equalizer'
      TabOrder = 29
      OnClick = SetEqualizerBtnClick
    end
    object ChAudioOut: TButton
      Left = 8
      Top = 428
      Width = 75
      Height = 25
      Caption = 'Ch Audio Out'
      TabOrder = 30
      OnClick = ChAudioOutClick
    end
    object GetAudioTrackList: TButton
      Left = 8
      Top = 459
      Width = 75
      Height = 25
      Caption = 'AudioTrackList'
      TabOrder = 31
      OnClick = GetAudioTrackListClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 507
    Align = alClient
    TabOrder = 1
    object MrlLab: TLabel
      Left = 1
      Top = 1
      Width = 60
      Height = 13
      Align = alTop
      Caption = 'MRL to play:'
      FocusControl = MrlEdit
    end
    object ProgPanel: TPanel
      Left = 1
      Top = 268
      Width = 348
      Height = 46
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object ProgLabel1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 44
        Height = 13
        Align = alLeft
        Caption = '00:00:00'
      end
      object ProgLabel2: TLabel
        AlignWithMargins = True
        Left = 301
        Top = 27
        Width = 44
        Height = 13
        Align = alRight
        Caption = '00:00:00'
      end
      object ProgBar: TTrackBar
        Left = 0
        Top = 0
        Width = 348
        Height = 24
        Align = alTop
        PositionToolTip = ptBottom
        TabOrder = 0
        ThumbLength = 15
        TickStyle = tsNone
        OnChange = ProgBarChange
      end
    end
    object LB: TListBox
      AlignWithMargins = True
      Left = 9
      Top = 322
      Width = 332
      Height = 176
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alBottom
      ItemHeight = 13
      PopupMenu = LbPopupMenu
      TabOrder = 1
      Visible = False
    end
    object MrlEdit: TEdit
      Left = 1
      Top = 14
      Width = 348
      Height = 21
      Align = alTop
      TabOrder = 2
      OnClick = MrlEditClick
    end
    object PasLibVlcPlayer1: TPasLibVlcPlayer
      Left = 1
      Top = 35
      Width = 348
      Height = 233
      Align = alClient
      OnClick = PasLibVlcPlayer1Click
      OnDblClick = PasLibVlcPlayer1DblClick
      OnMouseDown = PasLibVlcPlayer1MouseDown
      OnMouseEnter = PasLibVlcPlayer1MouseEnter
      OnMouseLeave = PasLibVlcPlayer1MouseLeave
      OnMouseMove = PasLibVlcPlayer1MouseMove
      OnMouseUp = PasLibVlcPlayer1MouseUp
      AudioOutput = aoWaveOut
      SnapShotFmt = 'png'
      OnMediaPlayerMediaChanged = PasLibVlcPlayer1MediaPlayerMediaChanged
      OnMediaPlayerNothingSpecial = PasLibVlcPlayer1MediaPlayerNothingSpecial
      OnMediaPlayerOpening = PasLibVlcPlayer1MediaPlayerOpening
      OnMediaPlayerBuffering = PasLibVlcPlayer1MediaPlayerBuffering
      OnMediaPlayerPlaying = PasLibVlcPlayer1MediaPlayerPlaying
      OnMediaPlayerPaused = PasLibVlcPlayer1MediaPlayerPaused
      OnMediaPlayerStopped = PasLibVlcPlayer1MediaPlayerStopped
      OnMediaPlayerForward = PasLibVlcPlayer1MediaPlayerForward
      OnMediaPlayerBackward = PasLibVlcPlayer1MediaPlayerBackward
      OnMediaPlayerEndReached = PasLibVlcPlayer1MediaPlayerEndReached
      OnMediaPlayerEncounteredError = PasLibVlcPlayer1MediaPlayerEncounteredError
      OnMediaPlayerTimeChanged = PasLibVlcPlayer1MediaPlayerTimeChanged
      OnMediaPlayerPositionChanged = PasLibVlcPlayer1MediaPlayerPositionChanged
      OnMediaPlayerSeekableChanged = PasLibVlcPlayer1MediaPlayerSeekableChanged
      OnMediaPlayerPausableChanged = PasLibVlcPlayer1MediaPlayerPausableChanged
      OnMediaPlayerTitleChanged = PasLibVlcPlayer1MediaPlayerTitleChanged
      OnMediaPlayerSnapshotTaken = PasLibVlcPlayer1MediaPlayerSnapshotTaken
      OnMediaPlayerLengthChanged = PasLibVlcPlayer1MediaPlayerLengthChanged
      OnMediaPlayerVideoOutChanged = PasLibVlcPlayer1MediaPlayerVideoOutChanged
      OnMediaPlayerScrambledChanged = PasLibVlcPlayer1MediaPlayerScrambledChanged
      OnMediaPlayerCorked = PasLibVlcPlayer1MediaPlayerCorked
      OnMediaPlayerUnCorked = PasLibVlcPlayer1MediaPlayerUnCorked
      OnMediaPlayerMuted = PasLibVlcPlayer1MediaPlayerMuted
      OnMediaPlayerUnMuted = PasLibVlcPlayer1MediaPlayerUnMuted
      OnMediaPlayerAudioVolumeChanged = PasLibVlcPlayer1MediaPlayerAudioVolumeChanged
      ExplicitLeft = 4
      ExplicitTop = 29
    end
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 56
    object a1: TMenuItem
      Caption = 'a'
    end
    object b1: TMenuItem
      Caption = 'b'
    end
    object c1: TMenuItem
      Caption = 'c'
    end
    object d1: TMenuItem
      Caption = 'd'
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 288
    Top = 4
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'PasLibVlcDemo.txt'
    Left = 20
    Top = 316
  end
  object LbPopupMenu: TPopupMenu
    Left = 56
    Top = 316
    object LbPmClear: TMenuItem
      Caption = 'Clear'
      OnClick = LbPmClearClick
    end
    object LnPmSaveAs: TMenuItem
      Caption = 'Save as'
      OnClick = LnPmSaveAsClick
    end
  end
end
