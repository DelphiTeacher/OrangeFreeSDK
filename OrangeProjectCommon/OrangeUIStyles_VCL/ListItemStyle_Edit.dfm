object FrameListItemStyle_Edit: TFrameListItemStyle_Edit
  Left = 0
  Top = 0
  Width = 538
  Height = 271
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  object ItemDesignerPanel: TSkinWinItemDesignerPanel
    Left = 60
    Top = 72
    Width = 189
    Height = 41
    ParentMouseEvent = True
    DirectUIVisible = False
    ComponentTypeUseKind = ctukDefault
    MaterialUseKind = mukSelfOwn
    KeepSelfOwnMaterial = True
    SelfOwnMaterial.BackColor.IsFill = False
    SelfOwnMaterial.BackColor.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawRectSetting.Left = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Top = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Right = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Bottom = 5.000000000000000000
    SelfOwnMaterial.BackColor.DrawRectSetting.Enabled = True
    SelfOwnMaterial.BackColor.DrawRectSetting.SizeType = dpstPixel
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Color = 8501277
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.EffectTypes = [drpetIsFillChange]
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Color = clWhite
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.IsTransparent = True
    HitTest = False
    MouseDownFocus = False
    TabOrder = 0
    Properties.IsPreview = False
    Properties.PreviewItem.Selected = False
    Properties.PreviewItem.Checked = False
    Properties.PreviewItem.Height = -1
    Properties.PreviewItem.Visible = True
    Properties.PreviewItem.Color = clBlack
    Properties.PreviewItem.Width = -1
    Properties.PreviewItem.Tag = 0
    Properties.PreviewItem.Tag1 = 0
    Properties.PreviewItem.ItemType = sitDefault
    Properties.PreviewItem.IsParent = False
    Properties.PreviewItem.Expanded = True
    Properties.PreviewItem.Childs.Data = {140000000000000400000000005C000000}
    Properties.PreviewItem.Accessory = satNone
    Properties.ItemStringsBindingControlCollection = <>
    object edtInput: TSkinWinEdit
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 123
      Height = 31
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 5
      ParentMouseEvent = True
      BindItemFieldName = 'GridCellValue'
      DirectUIVisible = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukRef
      KeepSelfOwnMaterial = False
      RefMaterial = dmEasyServiceCommonMaterial.edtRoundGrayBorderMaterial
      BorderMargins.Left = 3
      BorderMargins.Top = 3
      BorderMargins.Right = 3
      BorderMargins.Bottom = 3
      NCBorderMargins.Left = 3
      NCBorderMargins.Top = 3
      NCBorderMargins.Right = 3
      NCBorderMargins.Bottom = 3
      HitTest = True
      Properties.HelpText = #35831#36755#20837
      Properties.IsDrawHelpWhenFocused = False
      Properties.IsAlwaysDrawHelp = True
      EditProperties.HelpText = #35831#36755#20837
      EditProperties.IsDrawHelpWhenFocused = False
      EditProperties.IsAlwaysDrawHelp = True
      Align = alClient
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 129
    end
    object btnShowPwd: TSkinWinButton
      AlignWithMargins = True
      Left = 146
      Top = 3
      Width = 40
      Height = 35
      ParentMouseEvent = True
      DirectUIVisible = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.IsFill = True
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = False
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
      SelfOwnMaterial.DrawPictureParam.IsAutoFit = True
      SelfOwnMaterial.DrawPictureParam.IsStretch = True
      HitTest = True
      MouseDownFocus = False
      Align = alRight
      Visible = False
      TabOrder = 1
      Caption = ''
      Text = ''
      Properties.AutoSize = False
      Properties.IsAutoPush = False
      Properties.IsPushed = False
      Properties.Icon.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000040
        000000400806000000AA6971DE0000082649444154785EED9A7D90557519C73F
        CF39CB2EC850142F61353A4553185A23BE8C88ECEEB95038BC3415B9827BEF5A
        A35636F6623A4DE134908E3AC55492D2686A8C7BEF35DA312627652CE09E0D01
        671028C7304230995006504410887DB94FF3BB17D87BEE9E7BCEB9772F2FEDEE
        D9FFEEF93D2FDFEFF3FC9EDFF3FCCE0A03FC91018E9F4102063360803330B805
        0678020C16C1FEB705DCD41DA8FE0C91E3A05FC6493C1794E5FD8B00377927C8
        E202C0DB70E2170D0C027A8307653DB1F835FD9F003FF0B08DDA6C03535AF6F5
        6F024A81B76BEBA96FDA1F76CAFD7FD7803E8237E49C5902D6B78EE578CD4548
        778F5D9123A8BD9F8ECEFDCC68391216B153EFAB00FEF413B072651DC30E7C0E
        743A2AD3112686007C07E515D0AD082F62E91A1A5AFEDD4BA64AE04F0F016D6D
        36A33AA661311F742EC888C851F55FF83AE8D3A0299C964D54117C750930C0C7
        1E6F21CB22442EE823687F716517C285452FB711B1E0F929AD4E0D7053D7A37A
        2F22E3230057E020E8DB206FA17AFC84CC50E0A3C0F9885811F498257D02DFF7
        0C70978D849A569039251D563D82C86A940D58FA0247476D64E6CC93A07B8BB9
        CB86223557A0527F620B5D5A42779FC1F78D80BFA6EBC9667F0F32AE978326AA
        22BF43B22B383AFA2F8180C342ED261F05B9B99A695FA8ABB22DD09EBE1DD59F
        973846D790959B98D6BC2B0C5BE87B37B908646124F06E7A3A4EF3EA509D450B
        CA23401759B89F7818E1161F43BB51F92EB1E615A14E6C6DAB656FE72590BD0C
        317FB28531B52F31B1A9A3E09C5F0C726724F099E4DD88FC1834CDFEBA1B696A
        EA0EF5E1C482E8046C7A640887871B70B33DCA55B3200FD1995D10DAC8B8AD17
        83751BD0020C2BD27314248DCD8364B5A50CF0BF46E4D6025D7F868FCCC671BA
        A290109D0037B51CB8BE97D3C22C9C447BA03155A13D7D0F705714A77CD6F817
        3CB76D1CDAB119E1C35E19FD038D3B9B9045D9307BD10870D30B4117F5066FCF
        C0B9615D981132C9DF22F2B5D075FE0B82ABFDBAD60BE89476908F15893F8013
        BF3DCC663801EDE9EB506D2B52740CACCF4702EF26BF01F2B08F23A607D89AFB
        3DDF3F981EA0F88976D4B92923FB3760B43748F24562CD4F0791104C406E78B1
        B623BCFF9412B3E7F3691F78D5945BEF3E391AEDDE85C87905F24710EEA1AEEE
        575CDD742CBF2EF54BE07B458E46037F52C86DBD1CACB5DEDAA287C90EB99469
        F37696222198804CF25944667A85E5669CE6C7C3522BF73E935A82F09D1EF0EC
        C5CE4EF60C38D5007F8A84E4B5A83C836017D8DC8CB3E3CA52F5A0340199E45C
        449EF202D5253889E248F973912B7CA9373D8D92CA5CCF31E9A6EE077ED8A7C8
        175B77D337813EE6DD0A7A17B1C47D7E8E9626C04DBE0C727101935BF950ED24
        CF591D9406CFA73F4E97F6A49EEADB38F131889859C0A47D74F09BFE741E97CF
        391A29EBF2BA4DCDBAAE67BD1E66C4C8717E3AFC09589B3C9F6E79B3007C0743
        BA2F61EA8DDB233B91494D43E8E9CC5457124BCCCA832FA7C34B2E46AD7561C5
        CCE3D7EA274661D93B3DB58BEC15B971BAE8F12720F3E44424FB0F0F01627F0A
        67FEEB910958D31AC3B2D614AC7F06273E07376552DE44BFF02971CE27F3DDA0
        EA6C62896723DBCE9D0AFA8AE72E427502B1C4BFA211606E72861ED887F0BE02
        12D6128B37447722D7F5BD5CB07E37B0B46CF04681654FA261BE39E6C21FD7AD
        41DF588F70A5C776E38E0BFD0A6150115C80C8BD5E8BFA4D9CC423E15E00F922
        78006464C0FAE0C8E7058F31B67664E4DA9349FD14E1071E9B5ABA1F284D407E
        F0D98870598F32FD2F3653A84F6C894482FF287B52340A78F3716305B1F8DC68
        F6D25F055D5614B4344E225E4A3EB80F58B37C3CD2F91222C30B14BC053A1927
        B123D4A9E79FF8249DD63F7D6E78A28137F0B13E8D73C3B6505BE6D88636AF2D
        DDC33099C055F143951160A4DC94612FE94D295EC3B61B6998FF9F40C7DA93B7
        A262F67D21D151C19B7DF4139C847706F133D8DE3A07B5CCA45AD353B3348BC5
        B534265605F9183E0B18E94CB278E434CEED013B56323A6ECA344CA6C52D7CCA
        01FF104EE2DB11223F0B913F7AC0E784A275ACD108C8DF05983EFBAAA2FD7510
        8B59342436787E2FF79CF75C7C68676E56684C98F139F871D3F3404D76F6443E
        27113173CAFA32941B8C6415229F29F2AA0BD58538F1FB735D5E39BDBD7BE29C
        CFF9CC21447F83CD2FA84FEC09449E6FD49678BBBD53124B71E2E6D225D2132D
        034EAA322DE9E177CD5E9BE1A3DD45F55544BE1E2DED970D859A7C46A9AD0CAD
        D9786A3A2CE57AEEDB43C7B77257F0C51F5C946E44EFC0491862223FE5119073
        D61C8FE31723F2FD0856CA1B69831466525310CC9033C167D97B205F3AFD97A2
        8596CDC7103067AEF76EAF674DDFC19B6DD7215F00F94A89AC33D65EA446E631
        B5F9B50801E9B5A4FC0C2854616606B21B3C2D73FE7D65E0D7B68DA1EBF86484
        AB51A6E68A6EE9AF445D88DECDBEBAFBCAB9052E66A06F0494F3A132936C4164
        29CA1BC05ED32B9BBBB013E48D42F583450D574040F539B07E84D3FCF74AA25E
        28533901E5806F4FDD82626688CAEDE5ABE52AD0057E636DA54454E65039E0DD
        E46D200F56EA20AADB4196A335AD41777B95EA2F9F8072C09B06EAD0F00460BE
        004D023E1B50344D843B41B6826E46650BB6FD42E431B84206CA23A01CF0A51C
        5AF7F80818F201B23523E9CA8EC0B68F42E7412CFB20D7BCFA6E948F191562F5
        158B4E4035C057D3F32AE98A46403F056F380C27C0BF885576CE57296AD55413
        4C40EE7E6DF77B88D41518ED37E0C333207F2DF64E41A7D7AFC087136056B8C9
        4694A710F651AB8D61FF7B5BCDF43C13BAC26BC099F0E22CDA1824E02C927F4E
        981ECC8073220C67D189C10C388BE49F13A6077C06FC0FF1C72D6E0A17960300
        00000049454E44AE426082}
      Properties.PushedIcon.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000040
        000000400806000000AA6971DE0000081849444154785EED9A7F8C54D515C73F
        6786DD0545B008DA8A094DAA554A5BA9816AE8C2CE9B85346EA4A18A6BD97DB3
        54B1A96D2511DBD2185B6B43B5964A5B8CB412B4B8CCCC1617499336A1A230B3
        B0B652BB46130B56A926162B951F56A880FB63DE69EEACCBEE9B9FEFCDCE9690
        9D9BCC3F93F3E37BBFF7DC7BCF39F709A37CC8289F3F15022A1130CA19A86C81
        511E009543B0B2052A5B60943350D902672400F6C4267062CC1482CE8548DF7B
        9C7BEA1FCCFA7AEF99C032F211906CBB027116E0E8E7406680CE40E4DC8CC9F6
        A1BC8EB00FD887E85E8281BF30B7F98D912665640848C667A27A0BA237827CB4
        E449286F806E07D98AD59C40444BB69547B17C04A80AC9B62F23FA036066B981
        020710DDC05859CB35F6F172D92F0F011D710BD5B5C0673C01537510DE41E500
        4235AA172332053C2466CA31441EA4A66A0D731A4F79F257406878043CFBD879
        F454FF14916F1404A2EC456433223B51E70087AB0FD2D89872E974ADAFE2D8F8
        8B19C3341CBD0A652EA20D206373DA56DE24A0114291CEE190503A011DB1D938
        6C4198961BA01E026925E86CA4AEE5959240EE6E9F42AA7B252AB7204CCA63E3
        11E85D8175F307A5F8288D80446C25703F423087D323283F63C2C48799B5F064
        29A0B2744C74BC3F7E118EAE42B83C87CDFDE05C8FD5F237BFFEFC11903EE8E2
        EB11BE96ED48CD0AACA5AAE73E6A97FDD72F104FF27BDBAB79A7E7C7082B8031
        193AE63C68C1B29FF464EB4321EF0418E7877A62C08D391C18A72BB0ECB7FC38
        2F597657FC321CFD35509F6543F57EC291BBBDDAF6464072E3F9E898A710B9DA
        6558B59B802C27646FF0EAB06C72FDD1F8DD3C5BF1012CFB2E2FBE8A13D019FF
        087D9AC8BADBCDE425381FABE9592F8E4ECB98483ADCDD8C23B3109D864A0A49
        DFF12F30A526CE8CC61E5FF6126D75E0FC1E61825B4F1FC48A18820A8EC20498
        C3E7F8397B10B92A63E54FA0FA25EA5B0C31DE8659B18ED8B7819590BEF3730C
        3D0CAC2664AFF195F575B67E92BEE04EE012374E5613B6BF570860610212B175
        08DFCC30F01F02C17AEA96BCE86DE6C09FDB27D1DDF30430DFA3CE0EFAAA17B3
        A0F1984779D81DFD187D7422F2890C9DDBB1EC75F9ECE42720195F06FA6806A3
        C70832973AFB65CFC0B66DAB61DCD12E904F7BD6E9177C99539366D3D0D0ED59
        2F11BD1C912E60FC101D45A49E507332979DDC0424E3F351673B22814125ED05
        998765EFF10CC80826629B1022BE7406855BB1ECAFFAD2DD1DFF3C29C71450E7
        9FD6533D8A3A5752BFF45F99B6B209D8D176118194495D2F1862C021208B09D9
        BFF305A67F45FEEE4B275338C80CE6D9A64CF63E12B12F2074B87305ED24F47A
        08B9D7196A289B80646C1B70ADDB9B2EC78A3CEC1DC18792C9E8A320CB7CEBB9
        15D663D9B7F9B6918CDD01FCC2BD857515E1C83DF9094846178164AEF21358F6
        577C03300AC9E87E904B4BD21D50527D8D702457FA5BDC6C32B60558EC8A64D1
        ABB15ACC39911EEE0848C6CCC93E58CBAB1E626CCD74E634BE5BDC5B0E8944EC
        688122C6ABC92358769E6BB3888964DB64D479D58D413BB122F3F211F01C70CD
        A059FD37D45C86D5F8BE57B42EB964F4E0B03A42C698F236617B6A69FEDB2643
        6A5F46DEB113CB3E7D1D674440340492795D3C8E65DF5C1A80D8F3C0EC927407
        959EC3B2E7946423197D12E406F739C07CC2B6499A726C01F35722F610C2F20C
        877761D90FF8069188AD46289A8E16B4ABC5B3B99CFA89E89D88AC714F5E7F4B
        38D234F4BF1CB7C0C6B1685517C28C0CE5C584235B7D91B03BF62952ECF5A593
        251C988ED5E4EF2A4D469B41A2AE33CE3458ABBB676696EAB913A15D9BA69392
        2E44CE398D275DF9052D424DE69CF03E92D10D20B77A57182AA971AC88ED4B77
        E7A6301278DAD5AC517A08504BC8FE6BA6AD02A9706C29F0B85B41DF4383B584
        9BBCAFAA4985C71E7D1E91CFFA9A087A90717285AF0E70B2AD164D990C7670E1
        D24EF3E731458AA1A8A9CAEECCD80A87A872E63277E96B9E27E4BB18D25720D0
        84D5FC92671F89E8958898D27C681D00AA9B0847CC62E61C850948371D627144
        9664906072EA7AC291573D03F45C0ECBCF39EFC41A5F4F6526E5863FB9D2F7F4
        C2F33447AA1BB23AD04340176F88B4B70799D2DD0AD2EC26C1F4E703D795A521
        026F11D0AE3237449EE1D4050B8B5593C5094833796F808E4BDB809B32CE845E
        54EE206CFFCA7324944BB03FA24CCBFCBEACEEB4EA36269C5CE4258ABC116040
        A723A167B32BB71E9CCC1682D5DF625EA3E9E88CFC4837459D75200BB29CA926
        B8A8E65AAFAD35EF04A42341855DB1EFA3F2A3AC3A42398EE8DD70C9235856DF
        88B050B82D6E5CAE87A9B7FBF1EF8F8081592562F5A06D885C9863A2FB51FD0E
        96FD075F7DBD428CF537526FC0911FE67C18513D4920701BA16693FCF81AA511
        605CA42BAD542B220D393D9ACC2BC02F09546F2E796BEC8ACE21C552909B1026
        E69E99BEC898C0E252BF25289D8001341DF108EA3CE46A41659C942826037B0A
        F405AAF5256A5BFE99359981C751918F83D380607276779777A892C9EE445671
        B8EA2785AEB962E1307C028C87741BCD319D965BD3CFDD45877E80720811934F
        8CF3F53CDE6F7B7BFA41A6AE797F51574504CA43C080939DAD5391E04A445B0A
        4444A998157407C83DBE1BB3053C9697800147E977C4DEEB515D88E882FC0F21
        1EB830DF16C056547E437DF39B1E347C898C0C019910D2793AA6D96281D6E58D
        0EE5DDF4075288F9755115F823B54BDEF635239FC2FF1F0232413DD33E918033
        39FD999CF6F5E2040FD3973AC2175B4EF8C43F6CF13343C0B06197CF408580F2
        7179765AAA44C0D9B96EE5435D8980F27179765AAA44C0D9B96EE5435D8980F2
        7179765A1AF511F03F5AEABB5F4C3B9D540000000049454E44AE426082}
      Properties.ButtonIndex = -1
      Properties.PushedGroupIndex = 0
      ExplicitLeft = 149
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
  object edtInput_Material: TSkinEditDefaultMaterial
    BackColor.IsFill = True
    BackColor.FillColor.Alpha = 255
    BackColor.IsRound = True
    BackColor.RoundWidth = 3
    BackColor.RoundHeight = 3
    BackColor.BorderColor.Alpha = 255
    BackColor.BorderColor.Color = clGray
    BackColor.BorderWidth = 1
    BackColor.DrawRectSetting.Right = 1.000000000000000000
    BackColor.DrawRectSetting.Bottom = 1.000000000000000000
    BackColor.DrawRectSetting.SizeType = dpstPixel
    BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
    BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
    BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
    BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
    BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
    BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
    BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
    BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
    BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
    BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
    IsTransparent = True
    DrawHelpTextParam.FontName = 'Tahoma'
    DrawHelpTextParam.FontSize = 12
    DrawHelpTextParam.FontColor = clGray
    DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
    DrawHelpTextParam.DrawFont.Color = clGray
    DrawHelpTextParam.DrawFont.Height = -16
    DrawHelpTextParam.DrawFont.Name = 'Tahoma'
    DrawHelpTextParam.DrawFont.Style = []
    DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
    DrawHelpTextParam.DrawFont.FontColor.Color = clGray
    DrawHelpTextParam.FontTrimming = fttNone
    DrawHelpTextParam.FontHorzAlign = fhaLeft
    DrawHelpTextParam.FontVertAlign = fvaCenter
    DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    DrawTextParam.FontName = 'Tahoma'
    DrawTextParam.FontSize = 12
    DrawTextParam.DrawFont.Charset = DEFAULT_CHARSET
    DrawTextParam.DrawFont.Height = -16
    DrawTextParam.DrawFont.Name = 'Tahoma'
    DrawTextParam.DrawFont.Style = []
    DrawTextParam.DrawFont.FontColor.Alpha = 255
    DrawTextParam.FontTrimming = fttNone
    DrawTextParam.FontHorzAlign = fhaLeft
    DrawTextParam.FontVertAlign = fvaCenter
    DrawTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    DrawTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    DrawTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    DrawTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    DrawTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    DrawTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    DrawTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    DrawTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    DrawTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    DrawTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    Left = 88
    Top = 16
  end
end
