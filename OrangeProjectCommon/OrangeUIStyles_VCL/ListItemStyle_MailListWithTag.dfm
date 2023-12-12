object FrameListItemStyle_MailListWithTag: TFrameListItemStyle_MailListWithTag
  Left = 0
  Top = 0
  Width = 700
  Height = 426
  TabOrder = 0
  OnMouseLeave = FrameMouseLeave
  object ItemDesignerPanel: TSkinWinItemDesignerPanel
    Left = 28
    Top = 72
    Width = 300
    Height = 177
    ParentMouseEvent = True
    DirectUIVisible = False
    ComponentTypeUseKind = ctukDefault
    MaterialUseKind = mukSelfOwn
    KeepSelfOwnMaterial = True
    SelfOwnMaterial.BackColor.Color = clWhite
    SelfOwnMaterial.BackColor.IsFill = True
    SelfOwnMaterial.BackColor.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawRectSetting.Left = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Top = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Right = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Bottom = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Enabled = True
    SelfOwnMaterial.BackColor.DrawRectSetting.SizeType = dpstPixel
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.IsFill = True
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Color = 16381943
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.EffectTypes = [drpetFillColorChange, drpetIsFillChange]
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.IsFill = True
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Color = 15987441
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.EffectTypes = [drpetFillColorChange]
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.IsTransparent = True
    HitTest = False
    MouseDownFocus = False
    TabOrder = 0
    OnPrepareDrawItem = ItemDesignerPanelPrepareDrawItem
    Properties.IsPreview = False
    Properties.PreviewItem.Selected = False
    Properties.PreviewItem.Checked = False
    Properties.PreviewItem.Height = -1.000000000000000000
    Properties.PreviewItem.Visible = True
    Properties.PreviewItem.Color = clBlack
    Properties.PreviewItem.Width = -1.000000000000000000
    Properties.PreviewItem.Icon.IsClipRound = False
    Properties.PreviewItem.Pic.IsClipRound = False
    Properties.PreviewItem.Tag = 0
    Properties.PreviewItem.Tag1 = 0
    Properties.PreviewItem.ItemType = sitDefault
    Properties.PreviewItem.IsParent = False
    Properties.PreviewItem.Expanded = True
    Properties.PreviewItem.Childs.Data = {140000000000000400000000005C000000}
    Properties.PreviewItem.Accessory = satNone
    Properties.ItemStringsBindingControlCollection = <>
    object imgHead: TSkinWinImage
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 40
      Height = 153
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 8
      Margins.Bottom = 12
      ParentMouseEvent = True
      BindItemFieldName = 'ItemIcon'
      DirectUIVisible = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = False
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = True
      SelfOwnMaterial.DrawPictureParam.IsAutoFit = True
      SelfOwnMaterial.DrawPictureParam.PictureHorzAlign = phaCenter
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      HitTest = True
      MouseDownFocus = False
      Align = alLeft
      TabOrder = 0
      Caption = ''
      Properties.AutoSize = False
      Properties.Picture.IsClipRound = False
      Properties.Animated = False
      Properties.AnimateSpeed = 10.000000000000000000
      Properties.GIFDelayExp = 12
      Properties.CurrentRotateAngle = 0
      Properties.Rotated = False
      Properties.RotateSpeed = 5.000000000000000000
      Properties.RotateIncrement = 20
    end
    object pnlClient: TSkinWinPanel
      Left = 60
      Top = 0
      Width = 240
      Height = 177
      Margins.Left = 0
      ParentMouseEvent = True
      DirectUIVisible = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = False
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = True
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      HitTest = False
      MouseDownFocus = False
      Align = alClient
      TabOrder = 1
      Caption = ''
      Text = ''
      object pnlUserInfo: TSkinWinPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 230
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentMouseEvent = True
        DirectUIVisible = False
        ComponentTypeUseKind = ctukDefault
        MaterialUseKind = mukSelfOwn
        KeepSelfOwnMaterial = True
        SelfOwnMaterial.BackColor.Color = clWhite
        SelfOwnMaterial.BackColor.IsFill = False
        SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsTransparent = True
        SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawCaptionParam.FontSize = 8
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        HitTest = True
        MouseDownFocus = False
        Align = alTop
        TabOrder = 0
        Caption = ''
        Text = ''
        object lblUserName: TSkinWinLabel
          Left = 0
          Top = 0
          Width = 45
          Height = 30
          ParentMouseEvent = True
          BindItemFieldName = 'ItemCaption'
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 9
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -12
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaBottom
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          HitTest = True
          MouseDownFocus = False
          Align = alLeft
          TabOrder = 0
          Caption = #29992#25143#21517
          Text = #29992#25143#21517
          Properties.AutoSize = True
        end
        object lblCompanyName: TSkinWinLabel
          AlignWithMargins = True
          Left = 46
          Top = 0
          Width = 226
          Height = 30
          Margins.Left = 1
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentMouseEvent = True
          BindItemFieldName = 'ItemDetail1'
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 9
          SelfOwnMaterial.DrawCaptionParam.FontColor = clRed
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = clRed
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -12
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = clRed
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttCharacter
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaBottom
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          HitTest = True
          MouseDownFocus = False
          Align = alClient
          TabOrder = 1
          Caption = '@US Nike INCNike INCNike INCNike INC'
          Text = '@US Nike INCNike INCNike INCNike INC'
          Properties.AutoSize = True
        end
        object lblTime: TSkinWinLabel
          AlignWithMargins = True
          Left = 191
          Top = 0
          Width = 39
          Height = 30
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentMouseEvent = True
          BindItemFieldName = 'ItemDetail2'
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 10
          SelfOwnMaterial.DrawCaptionParam.FontColor = clGray
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = clGray
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -13
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = clGray
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fftWord
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaBottom
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          HitTest = True
          MouseDownFocus = False
          Align = alRight
          TabOrder = 2
          Caption = '20:08'
          Text = '20:08'
          Properties.AutoSize = True
        end
      end
      object pnlMessageInfo: TSkinWinPanel
        AlignWithMargins = True
        Left = 0
        Top = 30
        Width = 230
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentMouseEvent = True
        DirectUIVisible = False
        ComponentTypeUseKind = ctukDefault
        MaterialUseKind = mukSelfOwn
        KeepSelfOwnMaterial = True
        SelfOwnMaterial.BackColor.Color = clWhite
        SelfOwnMaterial.BackColor.IsFill = False
        SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsTransparent = True
        SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawCaptionParam.FontSize = 8
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        HitTest = False
        MouseDownFocus = False
        Align = alTop
        TabOrder = 1
        Caption = ''
        Text = ''
        object lblMessage: TSkinWinLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 182
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentMouseEvent = True
          BindItemFieldName = 'ItemDetail'
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 8
          SelfOwnMaterial.DrawCaptionParam.FontColor = clGray
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = clGray
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = clGray
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fftWord
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaCenter
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          HitTest = True
          MouseDownFocus = False
          Align = alClient
          TabOrder = 0
          Caption = #25105#65306'Hello,nice to meet you.'
          Text = #25105#65306'Hello,nice to meet you.'
          Properties.AutoSize = False
          ExplicitTop = 5
          ExplicitHeight = 30
        end
        object btnMenu: TSkinWinButton
          AlignWithMargins = True
          Left = 206
          Top = 0
          Width = 24
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentMouseEvent = True
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.IsAutoCenterIconAndCaption = False
          SelfOwnMaterial.DrawDetailParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawDetailParam.FontSize = 8
          SelfOwnMaterial.DrawDetailParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawDetailParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawDetailParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawDetailParam.DrawFont.Style = []
          SelfOwnMaterial.DrawDetailParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawDetailParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawDetailParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.FontName = 'Tahoma'
          SelfOwnMaterial.DrawDetail1Param.FontSize = 8
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Height = -11
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Style = []
          SelfOwnMaterial.DrawDetail1Param.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.FontTrimming = fttNone
          SelfOwnMaterial.DrawDetail1Param.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawDetail1Param.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawHelpTextParam.FontSize = 8
          SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
          SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawIconParam.IsAutoFit = True
          SelfOwnMaterial.DrawIconParam.IsStretch = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 8
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.NormalPicture.IsClipRound = False
          SelfOwnMaterial.HoverPicture.IsClipRound = False
          SelfOwnMaterial.DownPicture.IsClipRound = False
          SelfOwnMaterial.DisabledPicture.IsClipRound = False
          SelfOwnMaterial.FocusedPicture.IsClipRound = False
          SelfOwnMaterial.PushedPicture.IsClipRound = False
          HitTest = True
          MouseDownFocus = False
          Align = alRight
          TabOrder = 1
          Caption = ''
          Text = ''
          Properties.AutoSize = False
          Properties.IsAutoPush = False
          Properties.IsPushed = False
          Properties.Icon.IsClipRound = False
          Properties.Icon.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
            00400806000000AA6971DE000002F24944415478DAED9B3F8B134118C6DD4DD6
            2CDA791211C54A3934B516D1ECDF7C0041EF1A0B0B3D82DA1C2A28A8579C085A
            1C87C59D1285EB2CA2E0175836BB8B49A169554E50904344386D824524D9F8AC
            E4400EB24E35AF999D079677D87D8B677EF36632B399283B322E85DA00B52400
            6A03D4E20E60381C2A4110CC222E288A726C74EF3B4243D7F5DBE572F987B000
            9ACD661EE119AE993170D6E33836ABD5EA372101F8BE5FC7A8CFA5E50042DB71
            9C93C20108C3F00846F7034BAEAAAA2614090500E57F03E13E4B2EAAE02EAA60
            41280028FF1594FF6546008F0080297792002C02C01D4600E25500E600037340
            C8922BE41C900855F00A55903AC363F45B18FD53BC3C7105E079DE3E8C6E0808
            D3633A2FF63A2051BBDDDED3EBF5EEA1B333003135EA780FEDB542A1704BE895
            E0768DD6060772B9DCBA61185F293CC8CD10B5016A4900D406A82501501BA096
            04406D805A1200B5016A9100C0DA5FC532F80C6269746B134BE297AEEB7E111E
            40144527FAFDFEDAD62BF1BFA0241BA26BB66DAF080B200882E318E9001DDD95
            923607084F8503D0E974B46EB7FB09CD836979A8849FBAAE1FE2B52DE6F956F8
            2CC273965C40A8398E53170A80EFFB4B28FDAB8CE90FF13198170A002A601981
            B5534B00705D34003584C74CA61465D6B22CA68FCBC400F03C6F4A55D5CFE8DC
            EE7FA46E148BC5C3A552E997500012A10A2E223C19F73CF906C8E7F38E6118AF
            7979E2BE10C26498FCE4B58C4AD8B9EDD17BDC3B8FD27FC3D30FC952189590AC
            054EE3DAFBC784A2BC354DF305E290B717B919A236402D0980DA00B524006A03
            D49200A80D504B02A036402D32005114ED1F0C06D3711C6FB8AEFB313300B68E
            C8A079019796DCCBCC61E956AB5544E7A3CC1E92C256B885CE97D372443E2C9D
            ED8392993F2A0B00AB00708911C02A005C110D00730540376DDB7E201400D639
            00A31F6B9A76B452A930FDB962620024623C2C5D47F9D77879FADF0E4B37F0EC
            1CCABF2F248044630E4BBF437BD1B2AC06EF37C37233446D805A1200B5016AFD
            066BB05250D37E73CB0000000049454E44AE426082}
          Properties.PushedIcon.IsClipRound = False
          Properties.ButtonIndex = -1
          Properties.PushedGroupIndex = 0
          ExplicitTop = 3
          ExplicitHeight = 29
        end
        object btnChat: TSkinWinButton
          AlignWithMargins = True
          Left = 182
          Top = 0
          Width = 24
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          ParentMouseEvent = True
          DirectUIVisible = False
          ComponentTypeUseKind = ctukDefault
          MaterialUseKind = mukSelfOwn
          KeepSelfOwnMaterial = True
          SelfOwnMaterial.BackColor.Color = clWhite
          SelfOwnMaterial.BackColor.IsFill = False
          SelfOwnMaterial.BackColor.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
          SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
          SelfOwnMaterial.IsTransparent = True
          SelfOwnMaterial.IsAutoCenterIconAndCaption = False
          SelfOwnMaterial.DrawDetailParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawDetailParam.FontSize = 8
          SelfOwnMaterial.DrawDetailParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawDetailParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawDetailParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawDetailParam.DrawFont.Style = []
          SelfOwnMaterial.DrawDetailParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawDetailParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawDetailParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.FontName = 'Tahoma'
          SelfOwnMaterial.DrawDetail1Param.FontSize = 8
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Height = -11
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawDetail1Param.DrawFont.Style = []
          SelfOwnMaterial.DrawDetail1Param.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.FontTrimming = fttNone
          SelfOwnMaterial.DrawDetail1Param.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawDetail1Param.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawHelpTextParam.FontSize = 8
          SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
          SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.DrawIconParam.IsAutoFit = True
          SelfOwnMaterial.DrawIconParam.IsStretch = True
          SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.FontSize = 8
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
          SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = []
          SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
          SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
          SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
          SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
          SelfOwnMaterial.NormalPicture.IsClipRound = False
          SelfOwnMaterial.HoverPicture.IsClipRound = False
          SelfOwnMaterial.DownPicture.IsClipRound = False
          SelfOwnMaterial.DisabledPicture.IsClipRound = False
          SelfOwnMaterial.FocusedPicture.IsClipRound = False
          SelfOwnMaterial.PushedPicture.IsClipRound = False
          HitTest = True
          MouseDownFocus = False
          Align = alRight
          TabOrder = 2
          Caption = ''
          Text = ''
          Properties.AutoSize = False
          Properties.IsAutoPush = False
          Properties.IsPushed = False
          Properties.Icon.IsClipRound = False
          Properties.Icon.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
            00400806000000AA6971DE000009CC4944415478DAE59B7B7054D51DC7779325
            2CEAA63E485406AAB455AA014A2CD1E69DB0492929F5D1B1A0A2152CA23332B5
            0252C5918280C5A180DAF60F405BB4A218CB60E920A6CD7B43928E41CA486A95
            19AD52AC795120C524E4D5CF6F7336DCDCECDDBDBBC97237F29B39F3BBE79C7B
            CEEFF7FBDEF3F89DC7B5DBCE73B25BAD80D5744E00E8EDEDB5D7D4D45CD2DDDD
            3DB6B3B33381A4CB6262622E838F252F06DE0C6F162EA1A7A7A7D9ED761FB7DB
            EDBD23120031B8A2A22283C71C9EB3E0F2EC0CB19A36422DA1823ACADBDBDB6B
            0B0A0A3AA21A80F2F2F254949D4BB893AF9738CCBAB6536F352DE76D5AD1D6FC
            FCFC935101005F7A024D7B2106DF4374A29932187292F71BE18D442F12B0784E
            84C79A2C7F9A777FEF7038366766667E64090045454517C6C5C53D8E32CB5066
            B49F57A40917130E110EF0DE51DE6BE0F9F3DCDCDC2E3F4679C7898E8E0E0162
            82741D423E5929C4630C80E886BD0E10EBB2B2B2FE71CE00282B2B9B07DB40B8
            D24F768DFA3A3B3332325AC305D8471E8FE7129A7C3E751660F0ADF0AFF8C382
            B0D1E572AD983E7D7A67C40040996B51661B4A64E9B2DA09AFC4C6C66E0EF74B
            9821807722FB47CC120FC16F1A84426FEF21D2EFA085FD73D80140F8ED08D88E
            800B3502A509FE8EAEB08AAFFD59A40CF7470CB8B390FF0C8F537420C8F8301F
            10FE382C00C83C8DF11BA874892EAB84B03814B4879B64DC00888779FCA56DF0
            34BB31272767397AF7840D00865F04DB4DC8D3083DC954B480CA775B65B81F3D
            BF017B9590A2CB2A22DCCE47FA5FC8005457578F11E70304A76A920F62FC2DD9
            D9D947AD365A4F757575A34E9D3AB50E7D9769EDE283BDEB743A33D2D2D2DA42
            020054E50BDFAA49AA3D73E64CDECC99334F5B6D6C205233D476824393FC26AD
            E036D300949696AE00C9759AA4F2D1A3471718A1186D84FE37C3DEC086385F1A
            2DE1891933663C1D14003CBB643CBB3A9FF321534B7C7C7C1AF3EB17561B1622
            0805B03D3EEF123B7AF04D5298A6DF3504407977EFD9CEBAB44DCCED49146AB2
            DAA07088EE70AFADAF3BD814081FE1C74CD57663BBAEC0AF604B7D711C8E992C
            4BFF62B52143044100B85703C206BAC2F24100D06426C1EA350B92171938165A
            6DC050C94FAB165779AACF7FE90700A476C2E6AAE80929C04B27AC3660384879
            8D6F69927662DB9DFD001417175F4E5FFFB74D4D1D4623E648265AF85E5950A9
            681703FDF8BCBCBC062F007CFD55B05F28E33B701CC631E51DB75AE9E1246CCC
            11A6495A452B586D57E848DFBF5E01F01A5FFF2EAB158E100832164C56D1C300
            30C54EE2D5443EF6BD041073F0F3DFB05AD948101F7A09F66DD4244DB493B888
            C42D2AA10B8F2F3E148F0FC7690AAD46363D1D4C9B95B49E4321287413B25309
            A719832A3233333F345BB6A4A46406E5A6118E8F1A35AA94E5F8A7C1CAECDFBF
            3F1177BE419374BFB4805FF3B05862E2F561C034B34A50762D6C856DE0E26313
            752C0D5616E35F42F91F6BCA75B3D07A9CD6B72150B9FAFAFAB8C6C6C6BD36CD
            0AD5D6B7FDB68826FD8A099D650F71A292F9BC0050CA73AECA7F894AE69B311E
            03DC1850EC2F8F8A6703C2DE004A887FB1CD7FD1DEE440AD08B9AB91BBD24F56
            1B004E0AB65245F69BB05B94B0520140B6B0AE53F9AB0160954900B6A0C82283
            EC80402253E6E45906E0AD0180954665917B18B949FEF2441F5AD0365B00D27A
            BBC8AA9731E01805C7A9FC4750FC5933006891F4436F53CF2CA3B2C83C80CC1B
            0C00D80A000F04902BEB92B106D94F22776D20BD752BDDA30280ECD1C72BE10F
            207CAB190028B79272AB0D8C789A7A9E0860847C252337FB418CD8625416B945
            C8FDAE81DCEF23F72D5B00A2FC4F29FF9C8A9E902E209B99BEEDED505AC0C5B0
            F70957E894686136988497D512A0EC78988CF8637459FF4A4C4C9C9494947426
            8001DFC680776CBA851C72FF86F1DF31A1B77C98B5AACC31FD18E0F58ECC0020
            C4547415CA6CB2F59DFD3978F6B0E65E62E6B446A64FDC51E98F3215CA5E4309
            8B96A5E9E9E98DC1CAE2DB67A2BC34E364019CF2FBBABABA1E33735C36680C20
            E1AFB6B3538AE95960A412F6EE81FD4001E09D05A4C93FACF2DF01801BAD5632
            C20088D77BB58A3E2B83E07D34A11755829CD9B900A1DD6A4523416AD5FBB92F
            8EDDF7D9ABAAAABEDAD9D9F98926B180B9749FD5CA4682183BEE9769D617C785
            BECAB71AFC00C3AF55E95FDA714037DEF5AD0615004F01C0932AA39505D1E523
            650BDC2C555656DEC0AC734093E4F57A7D1B225778E7C4B3E7F03F23F3B9D0C5
            442F61E39F61B35574E08E907AE135D81DF20C189F3A9DCE6F7E595A017D3F57
            A63C4DD2C03D41218FC7F33506C3239A0391CD78564B42941575E46F5718DBA6
            60DB07030010A215BC00FB898AF602869B19A1CCBCB8E823FDB900F40C5FFF31
            5F440F80ACB28E102EF622809B49F896DBED3E66B521611A7F37EC0F9AA48F5D
            2ED764ED319FDD4F2169012F68928E305FE69CEB1B204325FA7D0A8B328FE602
            57574C4CCC8DD9D9D907B5EF199D0EEFA2E00F35494719355364D4B4DA3033C4
            42EB3A8CAFE031C19766FA7458A8AEAEEE82D6D6D62A1E9335C9DBE93B0BAC36
            2E18D1826763EC4EDD5DA63D18EF77F3C6F082845C4F63892953877693341910
            FE6EB591018CFF396CBD2EF9208E5D7AC83744846A6B6BE3DBDADAE4C8CC2571
            9A15E3A1BBD4166524D7E7F8CABF95C58D2E4B366D6F0BEB8E90506161616C42
            4242FFAD4E00181F4D3382BA947D377AADD7EC6BFAF23661F8A343BA2546E5D7
            50F987AAC20EFA51A837BE234681EE09C2EE42D73D66EA09764DEE7BB07DAAE2
            03543ADD409905E43F6AEBF31F64062964BAA91AEEFBFE9A9BA28BE183366ED0
            A192F5FE42641F315B6730001E82FD4655FE2A00CCD3E58BC12FDBD416938EFE
            4399DD845D2D2D2D1573E6CCE90ED770D9088549FF9E67705758363996D1E477
            845A77400010BC09818F785FB4DB57E216AFF1E5D13DD2F812BB6CBA5D617F04
            08A7285F0D17C7A41A9FE27DBD4FA1BD2D4EBDE3705AAE274DEE28A6FB4EAEFD
            90FC43B09935CCBA70AFEF0503E04F08BF592938971650281712F1119E22BE5C
            778D5DF6DA4CFD2FA0A8953A6447DA19C6FF02B2EBBC83E6BE6DA897368301D0
            7F0C85D069B8C4ADF8067209B9DF4122FD137575B64CDC4FE2E24ACBFD02D750
            14F363F467E822C7F6B294AD1DAE7A838D01E23C389502321EC8A5E90B54BC87
            E7E7713256E89D0C39C16D68684896A36FA26984C9BCFF75EDC54513067FC1FB
            F2EF4105A1242B2BAB26123F51190250595979257DD568017498704F285EA1DC
            3AA7454DA0B54CE459FE1ABB54384675D3E7E514A99926DD4CBA97A7A6A6FED7
            D2BFC6F8FA72DAE3D119D181526B9A9A9AD60F65548F260A04C0805B960286C3
            E1983FD49F94A28D0C01F0ED14CBFF0144979B3D351E691408801D0030262E2E
            EE4133079623950C0190D35BE6D8F7AC56D03200CE173AEF01F83F35E6EC900C
            39AF4A0000000049454E44AE426082}
          Properties.PushedIcon.IsClipRound = False
          Properties.ButtonIndex = -1
          Properties.PushedGroupIndex = 0
          ExplicitTop = 3
          ExplicitHeight = 29
        end
      end
      object lvTags: TSkinWinListView
        Left = 0
        Top = 58
        Width = 240
        Height = 105
        Margins.Right = 20
        ParentMouseEvent = True
        DirectUIVisible = False
        ComponentTypeUseKind = ctukDefault
        MaterialUseKind = mukSelfOwn
        KeepSelfOwnMaterial = True
        SelfOwnMaterial.BackColor.Color = clWhite
        SelfOwnMaterial.BackColor.IsFill = False
        SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsTransparent = True
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.Color = clWhite
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.IsFill = True
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.IsTransparent = False
        SelfOwnMaterial.PullDownRefreshPanelMaterial.IndicatorColor = clBlack
        SelfOwnMaterial.PullDownRefreshPanelMaterial.LoadingPicture.IsClipRound = False
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontSize = 8
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableAutoCenterPosition = False
        SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableLoadingImageBiggerEffect = False
        SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableLoadingImageRotateEffect = True
        SelfOwnMaterial.PullDownRefreshPanelMaterial.LoadingCaption = #27491#22312#21047#26032'...'
        SelfOwnMaterial.PullDownRefreshPanelMaterial.DecidedLoadCaption = #26494#24320#21047#26032
        SelfOwnMaterial.PullDownRefreshPanelMaterial.UnDecidedLoadCaption = #19979#25289#21047#26032
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.Color = clWhite
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.IsFill = True
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.IsTransparent = False
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.IndicatorColor = clBlack
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.LoadingPicture.IsClipRound = False
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontSize = 8
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableAutoCenterPosition = False
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableLoadingImageBiggerEffect = False
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableLoadingImageRotateEffect = True
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.LoadingCaption = #27491#22312#21152#36733'...'
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.DecidedLoadCaption = #26494#24320#21152#36733#26356#22810
        SelfOwnMaterial.PullUpLoadMorePanelMaterial.UnDecidedLoadCaption = #19978#25289#21152#36733#26356#22810
        SelfOwnMaterial.DrawEmptyContentCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawEmptyContentCaptionParam.FontSize = 8
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawEmptyContentCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawEmptyContentCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontSize = 8
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Height = -11
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Style = []
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.ItemBackNormalPicture.IsClipRound = False
        SelfOwnMaterial.ItemBackHoverPicture.IsClipRound = False
        SelfOwnMaterial.ItemBackDownPicture.IsClipRound = False
        SelfOwnMaterial.ItemBackPushedPicture.IsClipRound = False
        SelfOwnMaterial.DrawItemBackColorParam.Color = clWhite
        SelfOwnMaterial.DrawItemBackColorParam.IsFill = False
        SelfOwnMaterial.DrawItemBackColorParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.ItemAccessoryPicture.IsClipRound = False
        SelfOwnMaterial.IsDrawCenterItemRect = False
        SelfOwnMaterial.DrawCenterItemRectParam.Color = 15592941
        SelfOwnMaterial.DrawCenterItemRectParam.IsFill = False
        SelfOwnMaterial.DrawCenterItemRectParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawCenterItemRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsSimpleDrawItemDevide = True
        SelfOwnMaterial.DrawItemDevideParam.Color = 15592941
        SelfOwnMaterial.DrawItemDevideParam.IsFill = False
        SelfOwnMaterial.DrawItemDevideParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawItemDevideParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemCaptionParam.FontSize = 10
        SelfOwnMaterial.DrawItemCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemCaptionParam.DrawFont.Height = -13
        SelfOwnMaterial.DrawItemCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.DrawItemCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.IsWordWrap = True
        SelfOwnMaterial.DrawItemCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemCaptionParam.FontVertAlign = fvaCenter
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetailParam.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetailParam.FontSize = 8
        SelfOwnMaterial.DrawItemDetailParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetailParam.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetailParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetailParam.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetailParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetailParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetailParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail1Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail1Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail1Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail1Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail1Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail1Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail1Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail1Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail1Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail2Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail2Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail2Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail2Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail2Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail2Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail2Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail2Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail2Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail3Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail3Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail3Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail3Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail3Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail3Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail3Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail3Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail3Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail4Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail4Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail4Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail4Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail4Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail4Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail4Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail4Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail4Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail5Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail5Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail5Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail5Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail5Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail5Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail5Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail5Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail5Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail6Param.FontName = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail6Param.FontSize = 8
        SelfOwnMaterial.DrawItemDetail6Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DrawItemDetail6Param.DrawFont.Height = -11
        SelfOwnMaterial.DrawItemDetail6Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DrawItemDetail6Param.DrawFont.Style = []
        SelfOwnMaterial.DrawItemDetail6Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.FontTrimming = fttNone
        SelfOwnMaterial.DrawItemDetail6Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DrawItemDetail6Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.ItemAccessoryPicture.IsClipRound = False
        SelfOwnMaterial.DefaultTypeItemMaterial.ItemBackNormalPicture.IsClipRound = False
        SelfOwnMaterial.DefaultTypeItemMaterial.ItemBackHoverPicture.IsClipRound = False
        SelfOwnMaterial.DefaultTypeItemMaterial.ItemBackDownPicture.IsClipRound = False
        SelfOwnMaterial.DefaultTypeItemMaterial.ItemBackPushedPicture.IsClipRound = False
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.Color = clWhite
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.IsFill = False
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.FontSize = 10
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawFont.Height = -13
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.IsWordWrap = True
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.FontVertAlign = fvaCenter
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.FontName = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.FontSize = 8
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawFont.Height = -11
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawFont.Style = []
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.FontTrimming = fttNone
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.FontVertAlign = fvaTop
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.DefaultTypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.ItemAccessoryPicture.IsClipRound = False
        SelfOwnMaterial.Item1TypeItemMaterial.ItemBackNormalPicture.IsClipRound = False
        SelfOwnMaterial.Item1TypeItemMaterial.ItemBackHoverPicture.IsClipRound = False
        SelfOwnMaterial.Item1TypeItemMaterial.ItemBackDownPicture.IsClipRound = False
        SelfOwnMaterial.Item1TypeItemMaterial.ItemBackPushedPicture.IsClipRound = False
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.Color = clWhite
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.IsFill = False
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemBackColorParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail2Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail3Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail4Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail5Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.FontName = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.FontSize = 8
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawFont.Charset = DEFAULT_CHARSET
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawFont.Height = -11
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawFont.Name = 'Tahoma'
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawFont.Style = []
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawFont.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.FontTrimming = fttNone
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.FontHorzAlign = fhaLeft
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.FontVertAlign = fvaTop
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.PushedEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.DisabledEffect.FontSize = 12
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
        SelfOwnMaterial.Item1TypeItemMaterial.DrawItemDetail6Param.DrawEffectSetting.FocusedEffect.FontSize = 12
        SelfOwnMaterial.DrawSpaceParam.Color = clWhite
        SelfOwnMaterial.DrawSpaceParam.IsFill = False
        SelfOwnMaterial.DrawSpaceParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsSimpleDrawGroupRoundRect = False
        SelfOwnMaterial.IsSimpleDrawGroupBeginDevide = True
        SelfOwnMaterial.IsSimpleDrawGroupEndDevide = True
        SelfOwnMaterial.DrawGroupBeginDevideParam.Color = 15592941
        SelfOwnMaterial.DrawGroupBeginDevideParam.IsFill = False
        SelfOwnMaterial.DrawGroupBeginDevideParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.Color = 15592941
        SelfOwnMaterial.DrawGroupEndDevideParam.IsFill = False
        SelfOwnMaterial.DrawGroupEndDevideParam.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        SelfOwnMaterial.IsAutoAdjustItemDesignerPanelSize = True
        SelfOwnMaterial.IsDrawRowLine = False
        SelfOwnMaterial.IsDrawRowBeginLine = False
        SelfOwnMaterial.IsDrawRowEndLine = False
        SelfOwnMaterial.IsDrawColLine = False
        SelfOwnMaterial.IsDrawColBeginLine = False
        SelfOwnMaterial.IsDrawColEndLine = False
        SelfOwnMaterial.DrawRowLineParam.Color.Alpha = 255
        SelfOwnMaterial.DrawRowLineParam.Color.Color = -2830136
        SelfOwnMaterial.DrawRowLineParam.PenWidth = 1.000000000000000000
        SelfOwnMaterial.DrawColLineParam.Color.Alpha = 255
        SelfOwnMaterial.DrawColLineParam.Color.Color = -2830136
        SelfOwnMaterial.DrawColLineParam.PenWidth = 1.000000000000000000
        HitTest = False
        MouseDownFocus = False
        Align = alTop
        TabOrder = 2
        VertScrollBar.Left = 0
        VertScrollBar.Top = 0
        VertScrollBar.Width = 12
        VertScrollBar.Height = 120
        VertScrollBar.ParentMouseEvent = True
        VertScrollBar.DirectUIVisible = False
        VertScrollBar.ComponentTypeUseKind = ctukDefault
        VertScrollBar.MaterialUseKind = mukSelfOwn
        VertScrollBar.KeepSelfOwnMaterial = True
        VertScrollBar.SelfOwnMaterial.BackColor.Color = clWhite
        VertScrollBar.SelfOwnMaterial.BackColor.IsFill = True
        VertScrollBar.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.IsTransparent = False
        VertScrollBar.SelfOwnMaterial.ThumbBtnMinSize = 40
        VertScrollBar.SelfOwnMaterial.ThumbBtnDrawSize = 4
        VertScrollBar.SelfOwnMaterial.IsDefaultDrawThumbBtn = True
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.Color = 11513775
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.IsFill = False
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Color = 11513775
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        VertScrollBar.HitTest = False
        VertScrollBar.MouseDownFocus = False
        VertScrollBar.Properties.AutoSize = False
        VertScrollBar.Properties.Kind = sbVertical
        VertScrollBar.Properties.SmallChange = 1
        VertScrollBar.Properties.LargeChange = 10
        VertScrollBar.Properties.CanOverRangeTypes = [cortMin, cortMax]
        HorzScrollBar.Left = 0
        HorzScrollBar.Top = 93
        HorzScrollBar.Width = 240
        HorzScrollBar.Height = 12
        HorzScrollBar.ParentMouseEvent = True
        HorzScrollBar.DirectUIVisible = False
        HorzScrollBar.ComponentTypeUseKind = ctukDefault
        HorzScrollBar.MaterialUseKind = mukSelfOwn
        HorzScrollBar.KeepSelfOwnMaterial = True
        HorzScrollBar.SelfOwnMaterial.BackColor.Color = clWhite
        HorzScrollBar.SelfOwnMaterial.BackColor.IsFill = True
        HorzScrollBar.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.IsTransparent = False
        HorzScrollBar.SelfOwnMaterial.ThumbBtnMinSize = 40
        HorzScrollBar.SelfOwnMaterial.ThumbBtnDrawSize = 4
        HorzScrollBar.SelfOwnMaterial.IsDefaultDrawThumbBtn = True
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.Color = clGray
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.IsFill = False
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Color = clGray
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        HorzScrollBar.HitTest = False
        HorzScrollBar.MouseDownFocus = False
        HorzScrollBar.Properties.AutoSize = False
        HorzScrollBar.Properties.Kind = sbHorizontal
        HorzScrollBar.Properties.SmallChange = 1
        HorzScrollBar.Properties.LargeChange = 10
        HorzScrollBar.Properties.CanOverRangeTypes = []
        ScrollControlCorner.Left = 228
        ScrollControlCorner.Top = 93
        ScrollControlCorner.Width = 12
        ScrollControlCorner.Height = 12
        ScrollControlCorner.ParentMouseEvent = True
        ScrollControlCorner.DirectUIVisible = False
        ScrollControlCorner.ComponentTypeUseKind = ctukDefault
        ScrollControlCorner.MaterialUseKind = mukSelfOwn
        ScrollControlCorner.KeepSelfOwnMaterial = True
        ScrollControlCorner.SelfOwnMaterial.BackColor.Color = clWhite
        ScrollControlCorner.SelfOwnMaterial.BackColor.IsFill = True
        ScrollControlCorner.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
        ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
        ScrollControlCorner.SelfOwnMaterial.IsTransparent = False
        ScrollControlCorner.HitTest = False
        ScrollControlCorner.MouseDownFocus = False
        Properties.ContentWidth = -1.000000000000000000
        Properties.ContentHeight = -1.000000000000000000
        Properties.EnableAutoPullDownRefreshPanel = False
        Properties.EnableAutoPullUpLoadMorePanel = False
        Properties.VertCanOverRangeTypes = [cortMin, cortMax]
        Properties.HorzCanOverRangeTypes = []
        Properties.VertScrollBarShowType = sbstNone
        Properties.HorzScrollBarShowType = sbstNone
        Properties.MultiSelect = False
        Properties.IsAutoSelected = True
        Properties.ItemHeight = 24.000000000000000000
        Properties.ItemSpaceType = sistDefault
        Properties.SelectedItemHeight = -1.000000000000000000
        Properties.ItemHeightCalcType = isctSeparate
        Properties.ItemPanDragGestureDirection = ipdgdtLeft
        Properties.IsEmptyContent = False
        Properties.EmptyContentPicture.IsClipRound = False
        Properties.IsEnabledCenterItemSelectMode = False
        Properties.ItemWidth = 60.000000000000000000
        Properties.SelectedItemWidth = -1.000000000000000000
        Properties.ItemWidthCalcType = isctSeparate
        Properties.ItemLayoutType = iltVertical
        Properties.DefaultItemStyle = 'CustomerTag'
        Properties.Item1ItemStyle = 'IconButton'
        Properties.ItemColorType = sictBackColor
        Properties.Items.Data = {
          140000060000000400000000005C00000018150000001A000000000042006900
          6E006100720079004F0062006A0065006300740000000E000000000E00080000
          004800650069006700680074000000000000000000F0BF0E000000000C000800
          0000570069006400740068000000000000000000494015000000001000040000
          00560069007300690062006C0065000000FFFFFFFF04000000000A0000000000
          4E0061006D006500000007000000000800040000005400610067000000000000
          0007000000000A00040000005400610067003100000000000000150000000010
          000400000043006800650063006B006500640000000000000007000000001200
          040000004900740065006D00540079007000650000000000000018100000000A
          001A000000490063006F006E0000005400440072006100770050006900630074
          007500720065000000040000000014000000000049006D006100670065004E00
          61006D00650000001700000000180000000000470049004600460069006C0065
          004400610074006100000004000000000A060A0000004E0061006D0065000000
          0D54F0790000490063006F006E00000004000000001006060000004300610070
          00740069006F006E000000076898980000FE560768000004000000000C060000
          0000470072006F007500700000000652C47E0000070000000012060400000052
          006F00770043006F0075006E00740000004C8870650000010000000700000000
          12060400000043006F006C0043006F0075006E00740000001752706500000100
          0000070000000012080400000052006F00770049006E0064006500780000004C
          880B4E07680000FFFFFFFF070000000012080400000043006F006C0049006E00
          640065007800000017520B4E07680000FFFFFFFF0700000000200A0400000050
          00690063007400750072006500440072006100770054007900700065000000D8
          7E36527B7C8B570000000000000700000000160A0400000049006D0061006700
          650049006E006400650078000000FE5647720B4E07680000FFFFFFFF04000000
          00140A0000000049006D006100670065004E0061006D0065000000FE5647720D
          54F07900000400000000120C00000000460069006C0065004E0061006D006500
          0000FE5647728765F64E0D54000004000000001A0E000000005200650073006F
          0075007200630065004E0061006D0065000000FE564772448D906E0D54F07900
          000400000000080A00000000550072006C000000FE564772FE94A56300001500
          0000001810040000004900730043006C006900700052006F0075006E00640000
          002F6626546A52C18810620657625F000000000000181000000008001A000000
          5000690063000000540044007200610077005000690063007400750072006500
          0000040000000014000000000049006D006100670065004E0061006D00650000
          001700000000180000000000470049004600460069006C006500440061007400
          6100000004000000000A06080000004E0061006D00650000000D54F079000050
          006900630000000400000000100606000000430061007000740069006F006E00
          0000076898980000FE564772000004000000000C0600000000470072006F0075
          00700000000652C47E0000070000000012060400000052006F00770043006F00
          75006E00740000004C887065000001000000070000000012060400000043006F
          006C0043006F0075006E00740000001752706500000100000007000000001208
          0400000052006F00770049006E0064006500780000004C880B4E07680000FFFF
          FFFF070000000012080400000043006F006C0049006E00640065007800000017
          520B4E07680000FFFFFFFF0700000000200A0400000050006900630074007500
          72006500440072006100770054007900700065000000D87E36527B7C8B570000
          000000000700000000160A0400000049006D0061006700650049006E00640065
          0078000000FE5647720B4E07680000FFFFFFFF0400000000140A000000004900
          6D006100670065004E0061006D0065000000FE5647720D54F079000004000000
          00120C00000000460069006C0065004E0061006D0065000000FE5647728765F6
          4E0D54000004000000001A0E000000005200650073006F007500720063006500
          4E0061006D0065000000FE564772448D906E0D54F07900000400000000080A00
          000000550072006C000000FE564772FE94A56300001500000000181004000000
          4900730043006C006900700052006F0075006E00640000002F6626546A52C188
          10620657625F00000000000007000000001200040000004900740065006D0054
          0079007000650000000000000019000000000C000500000043006F006C006F00
          72000000F27F0C00610400000000100008000000430061007000740069006F00
          6E000000B065A25B3762000004000000000E0000000000440065007400610069
          006C0000000400000000100000000000440065007400610069006C0031000000
          0400000000100000000000440065007400610069006C00320000000400000000
          100000000000440065007400610069006C003300000004000000001000000000
          00440065007400610069006C0034000000040000000010000000000044006500
          7400610069006C00350000000400000000100000000000440065007400610069
          006C003600000007000000001400040000004100630063006500730073006F00
          7200790000000000000018150000001A0000000000420069006E006100720079
          004F0062006A0065006300740000000E000000000E0008000000480065006900
          6700680074000000000000000000F0BF0E000000000C00080000005700690064
          0074006800000000000000000049401500000000100004000000560069007300
          690062006C0065000000FFFFFFFF04000000000A00000000004E0061006D0065
          000000070000000008000400000054006100670000000000000007000000000A
          0004000000540061006700310000000000000015000000001000040000004300
          6800650063006B00650064000000000000000700000000120004000000490074
          0065006D00540079007000650000000000000018100000000A001A0000004900
          63006F006E000000540044007200610077005000690063007400750072006500
          0000040000000014000000000049006D006100670065004E0061006D00650000
          001700000000180000000000470049004600460069006C006500440061007400
          6100000004000000000A060A0000004E0061006D00650000000D54F079000049
          0063006F006E0000000400000000100606000000430061007000740069006F00
          6E000000076898980000FE560768000004000000000C0600000000470072006F
          007500700000000652C47E0000070000000012060400000052006F0077004300
          6F0075006E00740000004C887065000001000000070000000012060400000043
          006F006C0043006F0075006E0074000000175270650000010000000700000000
          12080400000052006F00770049006E0064006500780000004C880B4E07680000
          FFFFFFFF070000000012080400000043006F006C0049006E0064006500780000
          0017520B4E07680000FFFFFFFF0700000000200A040000005000690063007400
          750072006500440072006100770054007900700065000000D87E36527B7C8B57
          0000000000000700000000160A0400000049006D0061006700650049006E0064
          00650078000000FE5647720B4E07680000FFFFFFFF0400000000140A00000000
          49006D006100670065004E0061006D0065000000FE5647720D54F07900000400
          000000120C00000000460069006C0065004E0061006D0065000000FE56477287
          65F64E0D54000004000000001A0E000000005200650073006F00750072006300
          65004E0061006D0065000000FE564772448D906E0D54F0790000040000000008
          0A00000000550072006C000000FE564772FE94A5630000150000000018100400
          00004900730043006C006900700052006F0075006E00640000002F6626546A52
          C18810620657625F000000000000181000000008001A00000050006900630000
          0054004400720061007700500069006300740075007200650000000400000000
          14000000000049006D006100670065004E0061006D0065000000170000000018
          0000000000470049004600460069006C00650044006100740061000000040000
          00000A06080000004E0061006D00650000000D54F07900005000690063000000
          0400000000100606000000430061007000740069006F006E0000000768989800
          00FE564772000004000000000C0600000000470072006F007500700000000652
          C47E0000070000000012060400000052006F00770043006F0075006E00740000
          004C887065000001000000070000000012060400000043006F006C0043006F00
          75006E007400000017527065000001000000070000000012080400000052006F
          00770049006E0064006500780000004C880B4E07680000FFFFFFFF0700000000
          12080400000043006F006C0049006E00640065007800000017520B4E07680000
          FFFFFFFF0700000000200A040000005000690063007400750072006500440072
          006100770054007900700065000000D87E36527B7C8B57000000000000070000
          0000160A0400000049006D0061006700650049006E006400650078000000FE56
          47720B4E07680000FFFFFFFF0400000000140A0000000049006D006100670065
          004E0061006D0065000000FE5647720D54F07900000400000000120C00000000
          460069006C0065004E0061006D0065000000FE5647728765F64E0D5400000400
          0000001A0E000000005200650073006F0075007200630065004E0061006D0065
          000000FE564772448D906E0D54F07900000400000000080A0000000055007200
          6C000000FE564772FE94A563000015000000001810040000004900730043006C
          006900700052006F0075006E00640000002F6626546A52C18810620657625F00
          000000000007000000001200040000004900740065006D005400790070006500
          00000000000019000000000C000500000043006F006C006F0072000000F27F0C
          00650400000000100008000000430061007000740069006F006E000000B065A2
          5B3762000004000000000E0000000000440065007400610069006C0000000400
          000000100000000000440065007400610069006C003100000004000000001000
          00000000440065007400610069006C0032000000040000000010000000000044
          0065007400610069006C00330000000400000000100000000000440065007400
          610069006C00340000000400000000100000000000440065007400610069006C
          00350000000400000000100000000000440065007400610069006C0036000000
          07000000001400040000004100630063006500730073006F0072007900000000
          00000018150000001A0000000000420069006E006100720079004F0062006A00
          65006300740000000E000000000E000800000048006500690067006800740000
          00000000000000F0BF0E000000000C0008000000570069006400740068000000
          00000000000049401500000000100004000000560069007300690062006C0065
          000000FFFFFFFF04000000000A00000000004E0061006D006500000007000000
          0008000400000054006100670000000000000007000000000A00040000005400
          610067003100000000000000150000000010000400000043006800650063006B
          006500640000000000000007000000001200040000004900740065006D005400
          79007000650000000000000018100000000A001A000000490063006F006E0000
          0054004400720061007700500069006300740075007200650000000400000000
          14000000000049006D006100670065004E0061006D0065000000170000000018
          0000000000470049004600460069006C00650044006100740061000000040000
          00000A060A0000004E0061006D00650000000D54F0790000490063006F006E00
          00000400000000100606000000430061007000740069006F006E000000076898
          980000FE560768000004000000000C0600000000470072006F00750070000000
          0652C47E0000070000000012060400000052006F00770043006F0075006E0074
          0000004C887065000001000000070000000012060400000043006F006C004300
          6F0075006E007400000017527065000001000000070000000012080400000052
          006F00770049006E0064006500780000004C880B4E07680000FFFFFFFF070000
          000012080400000043006F006C0049006E00640065007800000017520B4E0768
          0000FFFFFFFF0700000000200A04000000500069006300740075007200650044
          0072006100770054007900700065000000D87E36527B7C8B5700000000000007
          00000000160A0400000049006D0061006700650049006E006400650078000000
          FE5647720B4E07680000FFFFFFFF0400000000140A0000000049006D00610067
          0065004E0061006D0065000000FE5647720D54F07900000400000000120C0000
          0000460069006C0065004E0061006D0065000000FE5647728765F64E0D540000
          04000000001A0E000000005200650073006F0075007200630065004E0061006D
          0065000000FE564772448D906E0D54F07900000400000000080A000000005500
          72006C000000FE564772FE94A563000015000000001810040000004900730043
          006C006900700052006F0075006E00640000002F6626546A52C1881062065762
          5F000000000000181000000008001A0000005000690063000000540044007200
          6100770050006900630074007500720065000000040000000014000000000049
          006D006100670065004E0061006D006500000017000000001800000000004700
          49004600460069006C0065004400610074006100000004000000000A06080000
          004E0061006D00650000000D54F0790000500069006300000004000000001006
          06000000430061007000740069006F006E000000076898980000FE5647720000
          04000000000C0600000000470072006F007500700000000652C47E0000070000
          000012060400000052006F00770043006F0075006E00740000004C8870650000
          01000000070000000012060400000043006F006C0043006F0075006E00740000
          0017527065000001000000070000000012080400000052006F00770049006E00
          64006500780000004C880B4E07680000FFFFFFFF070000000012080400000043
          006F006C0049006E00640065007800000017520B4E07680000FFFFFFFF070000
          0000200A04000000500069006300740075007200650044007200610077005400
          7900700065000000D87E36527B7C8B570000000000000700000000160A040000
          0049006D0061006700650049006E006400650078000000FE5647720B4E076800
          00FFFFFFFF0400000000140A0000000049006D006100670065004E0061006D00
          65000000FE5647720D54F07900000400000000120C00000000460069006C0065
          004E0061006D0065000000FE5647728765F64E0D54000004000000001A0E0000
          00005200650073006F0075007200630065004E0061006D0065000000FE564772
          448D906E0D54F07900000400000000080A00000000550072006C000000FE5647
          72FE94A563000015000000001810040000004900730043006C00690070005200
          6F0075006E00640000002F6626546A52C18810620657625F0000000000000700
          0000001200040000004900740065006D00540079007000650000000000000019
          000000000C000500000043006F006C006F0072000000F27F0C00740400000000
          100008000000430061007000740069006F006E000000B065A25B376200000400
          0000000E0000000000440065007400610069006C000000040000000010000000
          0000440065007400610069006C00310000000400000000100000000000440065
          007400610069006C003200000004000000001000000000004400650074006100
          69006C00330000000400000000100000000000440065007400610069006C0034
          0000000400000000100000000000440065007400610069006C00350000000400
          000000100000000000440065007400610069006C003600000007000000001400
          040000004100630063006500730073006F007200790000000000000018150000
          001A0000000000420069006E006100720079004F0062006A0065006300740000
          000E000000000E00080000004800650069006700680074000000000000000000
          F0BF0E000000000C000800000057006900640074006800000000000000000049
          401500000000100004000000560069007300690062006C0065000000FFFFFFFF
          04000000000A00000000004E0061006D00650000000700000000080004000000
          54006100670000000000000007000000000A0004000000540061006700310000
          0000000000150000000010000400000043006800650063006B00650064000000
          0000000007000000001200040000004900740065006D00540079007000650000
          000000000018100000000A001A000000490063006F006E000000540044007200
          6100770050006900630074007500720065000000040000000014000000000049
          006D006100670065004E0061006D006500000017000000001800000000004700
          49004600460069006C0065004400610074006100000004000000000A060A0000
          004E0061006D00650000000D54F0790000490063006F006E0000000400000000
          100606000000430061007000740069006F006E000000076898980000FE560768
          000004000000000C0600000000470072006F007500700000000652C47E000007
          0000000012060400000052006F00770043006F0075006E00740000004C887065
          000001000000070000000012060400000043006F006C0043006F0075006E0074
          00000017527065000001000000070000000012080400000052006F0077004900
          6E0064006500780000004C880B4E07680000FFFFFFFF07000000001208040000
          0043006F006C0049006E00640065007800000017520B4E07680000FFFFFFFF07
          00000000200A0400000050006900630074007500720065004400720061007700
          54007900700065000000D87E36527B7C8B570000000000000700000000160A04
          00000049006D0061006700650049006E006400650078000000FE5647720B4E07
          680000FFFFFFFF0400000000140A0000000049006D006100670065004E006100
          6D0065000000FE5647720D54F07900000400000000120C00000000460069006C
          0065004E0061006D0065000000FE5647728765F64E0D54000004000000001A0E
          000000005200650073006F0075007200630065004E0061006D0065000000FE56
          4772448D906E0D54F07900000400000000080A00000000550072006C000000FE
          564772FE94A563000015000000001810040000004900730043006C0069007000
          52006F0075006E00640000002F6626546A52C18810620657625F000000000000
          181000000008001A000000500069006300000054004400720061007700500069
          00630074007500720065000000040000000014000000000049006D0061006700
          65004E0061006D00650000001700000000180000000000470049004600460069
          006C0065004400610074006100000004000000000A06080000004E0061006D00
          650000000D54F079000050006900630000000400000000100606000000430061
          007000740069006F006E000000076898980000FE564772000004000000000C06
          00000000470072006F007500700000000652C47E000007000000001206040000
          0052006F00770043006F0075006E00740000004C887065000001000000070000
          000012060400000043006F006C0043006F0075006E0074000000175270650000
          01000000070000000012080400000052006F00770049006E0064006500780000
          004C880B4E07680000FFFFFFFF070000000012080400000043006F006C004900
          6E00640065007800000017520B4E07680000FFFFFFFF0700000000200A040000
          0050006900630074007500720065004400720061007700540079007000650000
          00D87E36527B7C8B570000000000000700000000160A0400000049006D006100
          6700650049006E006400650078000000FE5647720B4E07680000FFFFFFFF0400
          000000140A0000000049006D006100670065004E0061006D0065000000FE5647
          720D54F07900000400000000120C00000000460069006C0065004E0061006D00
          65000000FE5647728765F64E0D54000004000000001A0E000000005200650073
          006F0075007200630065004E0061006D0065000000FE564772448D906E0D54F0
          7900000400000000080A00000000550072006C000000FE564772FE94A5630000
          15000000001810040000004900730043006C006900700052006F0075006E0064
          0000002F6626546A52C18810620657625F000000000000070000000012000400
          00004900740065006D00540079007000650000000000000019000000000C0005
          00000043006F006C006F0072000000F27F0C0053040000000010000800000043
          0061007000740069006F006E000000B065A25B3762000004000000000E000000
          0000440065007400610069006C00000004000000001000000000004400650074
          00610069006C0031000000040000000010000000000044006500740061006900
          6C00320000000400000000100000000000440065007400610069006C00330000
          000400000000100000000000440065007400610069006C003400000004000000
          00100000000000440065007400610069006C0035000000040000000010000000
          0000440065007400610069006C00360000000700000000140004000000410063
          0063006500730073006F007200790000000000000018150000001A0000000000
          420069006E006100720079004F0062006A0065006300740000000E000000000E
          00080000004800650069006700680074000000000000000000F0BF0E00000000
          0C00080000005700690064007400680000000000000000004940150000000010
          0004000000560069007300690062006C0065000000FFFFFFFF04000000000A00
          000000004E0061006D0065000000070000000008000400000054006100670000
          000000000007000000000A000400000054006100670031000000000000001500
          00000010000400000043006800650063006B0065006400000000000000070000
          00001200040000004900740065006D0054007900700065000000000000001810
          0000000A001A000000490063006F006E00000054004400720061007700500069
          00630074007500720065000000040000000014000000000049006D0061006700
          65004E0061006D00650000001700000000180000000000470049004600460069
          006C0065004400610074006100000004000000000A060A0000004E0061006D00
          650000000D54F0790000490063006F006E000000040000000010060600000043
          0061007000740069006F006E000000076898980000FE56076800000400000000
          0C0600000000470072006F007500700000000652C47E00000700000000120604
          00000052006F00770043006F0075006E00740000004C88706500000100000007
          0000000012060400000043006F006C0043006F0075006E007400000017527065
          000001000000070000000012080400000052006F00770049006E006400650078
          0000004C880B4E07680000FFFFFFFF070000000012080400000043006F006C00
          49006E00640065007800000017520B4E07680000FFFFFFFF0700000000200A04
          0000005000690063007400750072006500440072006100770054007900700065
          000000D87E36527B7C8B570000000000000700000000160A0400000049006D00
          61006700650049006E006400650078000000FE5647720B4E07680000FFFFFFFF
          0400000000140A0000000049006D006100670065004E0061006D0065000000FE
          5647720D54F07900000400000000120C00000000460069006C0065004E006100
          6D0065000000FE5647728765F64E0D54000004000000001A0E00000000520065
          0073006F0075007200630065004E0061006D0065000000FE564772448D906E0D
          54F07900000400000000080A00000000550072006C000000FE564772FE94A563
          000015000000001810040000004900730043006C006900700052006F0075006E
          00640000002F6626546A52C18810620657625F00000000000018100000000800
          1A00000050006900630000005400440072006100770050006900630074007500
          720065000000040000000014000000000049006D006100670065004E0061006D
          00650000001700000000180000000000470049004600460069006C0065004400
          610074006100000004000000000A06080000004E0061006D00650000000D54F0
          7900005000690063000000040000000010060600000043006100700074006900
          6F006E000000076898980000FE564772000004000000000C0600000000470072
          006F007500700000000652C47E0000070000000012060400000052006F007700
          43006F0075006E00740000004C88706500000100000007000000001206040000
          0043006F006C0043006F0075006E007400000017527065000001000000070000
          000012080400000052006F00770049006E0064006500780000004C880B4E0768
          0000FFFFFFFF070000000012080400000043006F006C0049006E006400650078
          00000017520B4E07680000FFFFFFFF0700000000200A04000000500069006300
          7400750072006500440072006100770054007900700065000000D87E36527B7C
          8B570000000000000700000000160A0400000049006D0061006700650049006E
          006400650078000000FE5647720B4E07680000FFFFFFFF0400000000140A0000
          000049006D006100670065004E0061006D0065000000FE5647720D54F0790000
          0400000000120C00000000460069006C0065004E0061006D0065000000FE5647
          728765F64E0D54000004000000001A0E000000005200650073006F0075007200
          630065004E0061006D0065000000FE564772448D906E0D54F079000004000000
          00080A00000000550072006C000000FE564772FE94A563000015000000001810
          040000004900730043006C006900700052006F0075006E00640000002F662654
          6A52C18810620657625F00000000000007000000001200040000004900740065
          006D00540079007000650000000000000019000000000C000500000043006F00
          6C006F0072000000F27F0C006504000000001000080000004300610070007400
          69006F006E000000B065A25B3762000004000000000E00000000004400650074
          00610069006C0000000400000000100000000000440065007400610069006C00
          310000000400000000100000000000440065007400610069006C003200000004
          00000000100000000000440065007400610069006C0033000000040000000010
          0000000000440065007400610069006C00340000000400000000100000000000
          440065007400610069006C003500000004000000001000000000004400650074
          00610069006C0036000000070000000014000400000041006300630065007300
          73006F007200790000000000000018150000001A0000000000420069006E0061
          00720079004F0062006A0065006300740000000E000000000E00080000004800
          650069006700680074000000000000000000F0BF0E000000000C000800000057
          0069006400740068000000000000000000494015000000001000040000005600
          69007300690062006C0065000000FFFFFFFF04000000000A00000000004E0061
          006D006500000007000000000800040000005400610067000000000000000700
          0000000A00040000005400610067003100000000000000150000000010000400
          000043006800650063006B006500640000000000000007000000001200040000
          004900740065006D00540079007000650000000000000018100000000A001A00
          0000490063006F006E0000005400440072006100770050006900630074007500
          720065000000040000000014000000000049006D006100670065004E0061006D
          00650000001700000000180000000000470049004600460069006C0065004400
          610074006100000004000000000A060A0000004E0061006D00650000000D54F0
          790000490063006F006E00000004000000001006060000004300610070007400
          69006F006E000000076898980000FE560768000004000000000C060000000047
          0072006F007500700000000652C47E0000070000000012060400000052006F00
          770043006F0075006E00740000004C8870650000010000000700000000120604
          00000043006F006C0043006F0075006E00740000001752706500000100000007
          0000000012080400000052006F00770049006E0064006500780000004C880B4E
          07680000FFFFFFFF070000000012080400000043006F006C0049006E00640065
          007800000017520B4E07680000FFFFFFFF0700000000200A0400000050006900
          63007400750072006500440072006100770054007900700065000000D87E3652
          7B7C8B570000000000000700000000160A0400000049006D0061006700650049
          006E006400650078000000FE5647720B4E07680000FFFFFFFF0400000000140A
          0000000049006D006100670065004E0061006D0065000000FE5647720D54F079
          00000400000000120C00000000460069006C0065004E0061006D0065000000FE
          5647728765F64E0D54000004000000001A0E000000005200650073006F007500
          7200630065004E0061006D0065000000FE564772448D906E0D54F07900000400
          000000080A00000000550072006C000000FE564772FE94A56300001500000000
          1810040000004900730043006C006900700052006F0075006E00640000002F66
          26546A52C18810620657625F000000000000181000000008001A000000500069
          0063000000540044007200610077005000690063007400750072006500000004
          0000000014000000000049006D006100670065004E0061006D00650000001700
          000000180000000000470049004600460069006C006500440061007400610000
          0004000000000A06080000004E0061006D00650000000D54F079000050006900
          630000000400000000100606000000430061007000740069006F006E00000007
          6898980000FE564772000004000000000C0600000000470072006F0075007000
          00000652C47E0000070000000012060400000052006F00770043006F0075006E
          00740000004C887065000001000000070000000012060400000043006F006C00
          43006F0075006E00740000001752706500000100000007000000001208040000
          0052006F00770049006E0064006500780000004C880B4E07680000FFFFFFFF07
          0000000012080400000043006F006C0049006E00640065007800000017520B4E
          07680000FFFFFFFF0700000000200A0400000050006900630074007500720065
          00440072006100770054007900700065000000D87E36527B7C8B570000000000
          000700000000160A0400000049006D0061006700650049006E00640065007800
          0000FE5647720B4E07680000FFFFFFFF0400000000140A0000000049006D0061
          00670065004E0061006D0065000000FE5647720D54F07900000400000000120C
          00000000460069006C0065004E0061006D0065000000FE5647728765F64E0D54
          000004000000001A0E000000005200650073006F0075007200630065004E0061
          006D0065000000FE564772448D906E0D54F07900000400000000080A00000000
          550072006C000000FE564772FE94A56300001500000000181004000000490073
          0043006C006900700052006F0075006E00640000002F6626546A52C188106206
          57625F00000000000007000000001200040000004900740065006D0054007900
          7000650000000000000019000000000C000500000043006F006C006F00720000
          00F27F0C00060400000000100008000000430061007000740069006F006E0000
          00B065A25B3762000004000000000E0000000000440065007400610069006C00
          00000400000000100000000000440065007400610069006C0031000000040000
          0000100000000000440065007400610069006C00320000000400000000100000
          000000440065007400610069006C003300000004000000001000000000004400
          65007400610069006C0034000000040000000010000000000044006500740061
          0069006C00350000000400000000100000000000440065007400610069006C00
          3600000007000000001400040000004100630063006500730073006F00720079
          00000000000000}
        Properties.EnableBuffer = False
        Properties.ColCount = -1
        Properties.ItemCountPerLine = -1
        Properties.IsItemCountFitControl = True
        Properties.ViewType = lvtIcon
        ExplicitTop = 65
      end
    end
  end
end
