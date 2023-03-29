unit ListItemStyle_HistoryMadical;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,


  Types,
  Math,
  uGraphicCommon,
  uDrawCanvas,
  uSkinItems,
//  uBufferBitmap,
  uSkinVirtualListType,
  uSkinCustomListType,


  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinButtonType,
  uSkinLabelType, uSkinWindowsControl, uSkinItemDesignerPanelType, uSkinMaterial,
  uSkinPanelType;

type
  TFrameListItemStyle_HistoryMadical = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    swlblEndtime: TSkinWinLabel;
    swlblZlh: TSkinWinLabel;
    swlblName: TSkinWinLabel;
    swbtnCopy: TSkinWinButton;
    pnlHome: TSkinWinPanel;
    lblDepartmentName: TSkinWinLabel;
    lblTreatmentDate: TSkinWinLabel;
    SkinWinLabel1: TSkinWinLabel;
    pnlNowSick: TSkinWinPanel;
    lblNowSickHint: TSkinWinLabel;
    lblNowSick: TSkinWinLabel;
    pnlChiefSay: TSkinWinPanel;
    lblChiefSayHint: TSkinWinLabel;
    lblChiefSay: TSkinWinLabel;
    pnlDiagnose: TSkinWinPanel;
    lblDiagnoseHint: TSkinWinLabel;
    lblDiagnose: TSkinWinLabel;
    swlblName_Material: TSkinLabelDefaultMaterial;
    lblHintLabelMaterial: TSkinLabelDefaultMaterial;
    lblDoctorName: TSkinWinLabel;
    procedure ItemDesignerPanelPrepareDrawItem(Sender: TObject;
      ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
      AItem: TSkinItem; AItemDrawRect: TRectF);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeHistoryMadical }
{
	"RowNumber": 1,
	"Zdxh": 135,
	"Zlh": 1387209,
	"Zdrq": "2020-11-20 13:44:48",
	"Zdys": 12,
	"Cfzbz": 0,
	"Zddm": "I10.x05",
	"Ssy": 90,
	"Szy": 120,
	"Xtz": 90,
	"Sffr": 1,
	"Bz": "无",
	"Jlzt": 0,
	"Fbrq": "1900-01-01 00:00:00",
	"Tj": "右面下部稍肿大。右下8阻生，远中龈瓣覆盖，有盲袋。牙龈肿，压痛剧烈，张口痛，吞咽痛，张口受限<2指。",
	"Mb": 60,
	"Xt": 80,
	"Tw": 40,
	"Sfxysccb": 1,
	"Jbxxbh": 168794,
	"Zs": "周身酸痛3天。",
	"xbs": "患者近三天来感周身酸痛、困重、乏力，无头痛发热，无明显心悸胸闷，无肢体麻木及活动障碍。纳可，寐可。余可。",
	"Jws": "否认有药物过敏史，否认有其他慢性病史。",
	"Fjjg": "血常规：WBC  *10/L,L%N%，ＲＢＣ＊１０，Ｈｂｇ／Ｌ;粪常规：WBC 个，RBC 个，隐血：",
	"Cl": "代配药,患者目前病情稳定,维持原治疗方案.",
	"Zzdmc": "高血压3级",
	"Sg": 183,
	"Tz": 70,
	"Tzzs": 0,
	"Zgxm": "金立",
	"Ksmc": "全科"
}
function TFrameListItemStyle_HistoryMadical.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;

procedure TFrameListItemStyle_HistoryMadical.ItemDesignerPanelPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas;
  AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
  AItemDrawRect: TRectF);
var
  AAutoSizeHeight:Double;
begin
//
//  //计算并设置主诉的高度
//  AAutoSizeHeight:=
//    uBufferBitmap.GetStringHeight(Self.lblChiefSay.Caption,
//                                  RectF(0,0,Self.lblChiefSay.Width,MaxInt),
//                                  Self.swlblName_Material.DrawCaptionParam
//                                  );
//  pnlChiefSay.Height:=Ceil(AAutoSizeHeight)+Self.lblChiefSay.Margins.Top*2;
//
//
//
//  //计算并设置现病史的高度
//  AAutoSizeHeight:=
//    uBufferBitmap.GetStringHeight(Self.lblNowSick.Caption,
//                                  RectF(0,0,Self.lblNowSick.Width,MaxInt),
//                                  Self.swlblName_Material.DrawCaptionParam
//                                  );
//  pnlNowSick.Height:=Ceil(AAutoSizeHeight)+Self.lblChiefSay.Margins.Top*2;
//  pnlNowSick.Top:=pnlChiefSay.Top+pnlChiefSay.Height;
//
//
//  //计算并设置诊断的高度
//  AAutoSizeHeight:=
//    uBufferBitmap.GetStringHeight(Self.lblDiagnose.Caption,
//                                  RectF(0,0,Self.lblDiagnose.Width,MaxInt),
//                                  Self.swlblName_Material.DrawCaptionParam
//                                  );
//  pnlDiagnose.Height:=Ceil(AAutoSizeHeight)+Self.lblChiefSay.Margins.Top*2;
//  pnlDiagnose.Top:=pnlNowSick.Top+pnlNowSick.Height;




end;

initialization
  RegisterListItemStyle('HistoryMadical',TFrameListItemStyle_HistoryMadical);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_HistoryMadical);


end.
