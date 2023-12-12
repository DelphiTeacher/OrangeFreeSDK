//convert pas to utf8 by ¥

unit EasyServiceCommonMaterialDataMoudle_VCL;

interface

uses
  SysUtils, Classes, uSkinPanelType, uSkinMaterial,
  uSkinButtonType, uSkinEditType, uSkinScrollControlType, uSkinScrollBoxType,
  uSkinCheckBoxType, uDrawPicture, uSkinImageList, uSkinLabelType,
  StdCtrls,

  Controls,
  uGraphicCommon,

  uSkinImageType, uSkinFrameImageType, uSkinRadioButtonType,
  uSkinNotifyNumberIconType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uSkinSwitchPageListPanelType, uSkinPageControlType,
  uSkinComboBoxType, uSkinComboEditType, uSkinMemoType, uSkinTimeEditType,
  uSkinDateEditType, uSkinListViewType, uSkinPopupType, pngimage,
  uSkinFormType;

type
  TdmEasyServiceCommonMaterial = class(TDataModule)
    bdmReturnButton: TSkinButtonDefaultMaterial;
    pnlToolBarMaterial: TSkinPanelDefaultMaterial;
    edtHelpTextMaterial: TSkinEditDefaultMaterial;
    pnlBlackCaptionLeftMarginPanelMaterial: TSkinPanelDefaultMaterial;
    btnBlueColorButtonMaterial: TSkinButtonDefaultMaterial;
    lblNoticeTypeLabelMaterial: TSkinLabelDefaultMaterial;
    sbDefaultColorBackgroundScrollBoxMaterial: TSkinScrollBoxDefaultMaterial;
    btnRedColorButtonMaterial: TSkinButtonDefaultMaterial;
    pnlInputBlackCaptionPanelMaterial: TSkinPanelDefaultMaterial;
    btnOrangeRedBorderWhiteBackButtonMaterial: TSkinButtonDefaultMaterial;
    edtInputEditHasHelpTextMaterial: TSkinEditDefaultMaterial;
    chkDefaultCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    btnGrayBorderButtonMaterial: TSkinButtonDefaultMaterial;
    btnTransparentWhiteCaptionButtonMaterial: TSkinButtonDefaultMaterial;
    btnRedBorderButtonMaterial: TSkinButtonDefaultMaterial;
    rbRedRadioButtonMaterial: TSkinRadioButtonColorMaterial;
    btnSelectButtonMaterial: TSkinButtonDefaultMaterial;
    pnlInputMemoBlackCaptionPanelMaterial: TSkinPanelDefaultMaterial;
    edtSearchGoodsMaterial: TSkinEditDefaultMaterial;
    btnDeleteButtonMaterial: TSkinButtonDefaultMaterial;
    btnIconButtonMaterial: TSkinButtonDefaultMaterial;
    btnSearchButtonMaterial: TSkinButtonDefaultMaterial;
    btnNoticeNotifyNumberIconMaterial: TSkinNotifyNumberIconColorMaterial;
    nniRedNotifyNumberMaterial: TSkinNotifyNumberIconDefaultMaterial;
    lbFilterHorzListBoxMaterial: TSkinListBoxDefaultMaterial;
    imgTakePicList: TSkinImageList;
    btnRedRectButtonMaterial: TSkinButtonDefaultMaterial;
    bgIndicator_Material: TSkinButtonGroupDefaultMaterial;
    pcMain_Material: TSkinPageControlDefaultMaterial;
    edtInputPhone_Material: TSkinEditDefaultMaterial;
    imgListLoginPictures: TSkinImageList;
    imgHeadList: TSkinImageList;
    edtInputEditHasCenterHelpTextMaterial: TSkinEditDefaultMaterial;
    btnGrayBorderSmallTextButtonMaterial: TSkinButtonDefaultMaterial;
    btnSelectButtonRightAlignMaterial: TSkinButtonDefaultMaterial;
    pcOrder_Material: TSkinPageControlDefaultMaterial;
    lbOrderList_Material: TSkinListBoxDefaultMaterial;
    edtInputEditHasHelpTextAndIconMaterial: TSkinEditDefaultMaterial;
    cmbComboBox_Material: TSkinComboBoxDefaultMaterial;
    lblInputBlackCaptionPanelMaterial: TSkinLabelDefaultMaterial;
    btnTransparentIconButonMaterial: TSkinButtonDefaultMaterial;
    btnSmallIconMaterial: TSkinButtonDefaultMaterial;
    chkHookMaterial: TSkinCheckBoxColorMaterial;
    btnSelectWithHelpText_Material: TSkinButtonDefaultMaterial;
    btnScanHandCode_Material: TSkinButtonDefaultMaterial;
    btnGraySearchIconButtonMaterial: TSkinButtonDefaultMaterial;
    pcMainFramePageControlMaterial: TSkinPageControlDefaultMaterial;
    rbUseScore_Material: TSkinRadioButtonDefaultMaterial;
    chkDefaultRectCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    cmbComboEdit_Material: TSkinComboEditDefaultMaterial;
    lblInputValueMaterial: TSkinLabelDefaultMaterial;
    pnlToolWindowBarMaterial: TSkinPanelDefaultMaterial;
    memDefaultMaterial: TSkinMemoDefaultMaterial;
    detDefaultMaterial: TSkinDateEditDefaultMaterial;
    tetDefaultMaterial: TSkinTimeEditDefaultMaterial;
    chkDefaultFillRectCheckBoxMaterial: TSkinCheckBoxColorMaterial;
    lvDefaultMaterial: TSkinListViewDefaultMaterial;
    imgDefaultMaterial: TSkinImageDefaultMaterial;
    btnIconTopCaptionBottomButtonMaterial: TSkinButtonDefaultMaterial;
    btnSkinThemeColorMaterial: TSkinButtonDefaultMaterial;
    btnSkinTheme1ColorMaterial: TSkinButtonDefaultMaterial;
    btnTransparenThemeCaptionButtonMaterial: TSkinButtonDefaultMaterial;
    cmbDefaultComboEditMaterial: TSkinComboEditDefaultMaterial;
    edtBottomWhiteDashEditMaterial: TSkinEditDefaultMaterial;
    imglistArrow: TSkinImageList;
    btnButtonDefaultMaterial: TSkinButtonDefaultMaterial;
    btnDropDownButtonMaterial: TSkinButtonDefaultMaterial;
    btnBegin_Material: TSkinButtonDefaultMaterial;
    btnThemeColorIconLeftCaptionRight: TSkinButtonDefaultMaterial;
    btnThemeColor1IconLeftCaptionRight: TSkinButtonDefaultMaterial;
    pcLeftAlign: TSkinPageControlDefaultMaterial;
    btnThemeColor2IconLeftCaptionRight: TSkinButtonDefaultMaterial;
    btnThemeColor3IconLeftCaptionRight: TSkinButtonDefaultMaterial;
    btnWhiteColorBorderMaterial: TSkinButtonDefaultMaterial;
    btnThemeColorCaptionLeftIconRight: TSkinButtonDefaultMaterial;
    edtRoundGrayBorderMaterial: TSkinEditDefaultMaterial;
    btnWhiteColorGrayBorderMaterial: TSkinButtonDefaultMaterial;
    frmDefaultNormalMaterial: TSkinFormNormalMaterial;
    fsdForm_Material: TSkinFormDefaultMaterial;
    btnBlackTransHoverColorIconLeftCaptionRight: TSkinButtonDefaultMaterial;
    pcLeftMargin2: TSkinPageControlDefaultMaterial;
    btnThemeColorIconLeftCaptionRightGroupLeft: TSkinButtonDefaultMaterial;
    btnThemeColorIconLeftCaptionRightGroupMiddle: TSkinButtonDefaultMaterial;
    btnTransparentDropDownButtonMaterial: TSkinButtonDefaultMaterial;
    lbFilterClassify_Material: TSkinListBoxDefaultMaterial;
    btnWhiteColorGrayBorderThemeCaptionMaterial: TSkinButtonDefaultMaterial;
    btnDropDownGrayBorderBlackCaptionMaterial: TSkinButtonDefaultMaterial;
    edtGrayBorderFocusedThemeBorderEffectMaterial: TSkinEditDefaultMaterial;
    cmbGrayBorderFocusedThemeBorderEffectMaterial: TSkinComboBoxDefaultMaterial;
    dateedtGrayBorderFocusedThemeBorderEffectMaterial: TSkinDateEditDefaultMaterial;
    btnWhiteColorGrayBorderBlackCaptionMaterial: TSkinButtonDefaultMaterial;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

var
  dmEasyServiceCommonMaterial: TdmEasyServiceCommonMaterial;

function GetBankIconIndex(ABankName:String):Integer;

procedure SetAllLabelFontName(AParent:TWinControl);


implementation

//uses
//  uUIFunction;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}



procedure SetAllLabelFontName(AParent:TWinControl);
var
  I: Integer;
begin
  for I := 0 to AParent.ControlCount-1 do
  begin
    if AParent.Controls[I] is TLabel then
    begin
      TLabel(AParent.Controls[I]).Font.Name:='微软雅黑';
    end;

    if AParent.Controls[I] is TWinControl then
    begin
      SetAllLabelFontName(TWinControl(AParent.Controls[I]));
    end;
  end;
end;


function GetBankIconIndex(ABankName:String):Integer;
begin
  Result:=0;
  if Pos('交通银行',ABankName)>0 then
  begin
    Result:=1;
  end;
  if Pos('兴业银行',ABankName)>0 then
  begin
    Result:=2;
  end;
  if Pos('工商银行',ABankName)>0 then
  begin
    Result:=3;
  end;
  if Pos('建设银行',ABankName)>0 then
  begin
    Result:=4;
  end;
  if Pos('农业银行',ABankName)>0 then
  begin
    Result:=5;
  end;
  if Pos('中国银行',ABankName)>0 then
  begin
    Result:=6;
  end;
end;


{ TdmEasyServiceCommonMaterial }

constructor TdmEasyServiceCommonMaterial.Create(AOwner: TComponent);
begin
  inherited;

  //工具栏
  Self.pnlToolBarMaterial.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;

//  //常用背景色按钮
//  Self.btnRedColorButtonMaterial.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor1;
//  Self.btnRedRectButtonMaterial.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor1;

//  //常用边框按钮
//  Self.btnRedBorderButtonMaterial.BackColor.BorderColor.Color:=uGraphicCommon.SkinThemeColor;
//  Self.btnRedBorderButtonMaterial.DrawCaptionParam.FontColor:=uGraphicCommon.SkinThemeColor;

  Self.btnBlueColorButtonMaterial.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;

  Self.btnGrayBorderSmallTextButtonMaterial.BackColor.BorderColor.Color:=uGraphicCommon.SkinThemeColor;
  Self.btnGrayBorderSmallTextButtonMaterial.DrawCaptionParam.FontColor:=uGraphicCommon.SkinThemeColor;

  //小标题直角边框按钮
  Self.btnOrangeRedBorderWhiteBackButtonMaterial.BackColor.BorderColor.Color:=uGraphicCommon.SkinThemeColor;
  Self.btnOrangeRedBorderWhiteBackButtonMaterial.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;
//  Self.btnOrangeRedBorderWhiteBackButtonMaterial.DrawCaptionParam.FontColor:=SkinThemeColor;

  //分类水平列表框
  Self.lbFilterHorzListBoxMaterial.DrawItemBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Color:=uGraphicCommon.SkinThemeColor;

  //复选框
  Self.chkDefaultCheckBoxMaterial.DrawCheckRectParam.DrawEffectSetting.PushedEffect.FillColor.Color:=uGraphicCommon.SkinThemeColor;

  //单选框
  Self.rbRedRadioButtonMaterial.DrawCheckRectParam.DrawEffectSetting.PushedEffect.BorderColor.Color:=uGraphicCommon.SkinThemeColor;
  Self.rbRedRadioButtonMaterial.DrawCheckStateParam.DrawEffectSetting.PushedEffect.FillColor.Color:=uGraphicCommon.SkinThemeColor;


//  //删除按钮
//  Self.btnDeleteButtonMaterial.DrawCaptionParam.FontColor:=SkinThemeColor;


  //未读数按钮
  Self.btnNoticeNotifyNumberIconMaterial.DrawCaptionParam.FontColor:=SkinThemeColor;

//  //分页
//  Self.pcMain_Material.DrawTabCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Color:=SkinThemeColor;

//  //分页
//  Self.edtInputPhone_Material.BackColor.BorderColor.Color:=SkinThemeColor;


end;

//initialization
//  dmEasyServiceCommonMaterial:=TdmEasyServiceCommonMaterial.Create(nil);
//
//finalization
//  FreeAndNil(dmEasyServiceCommonMaterial);


end.
