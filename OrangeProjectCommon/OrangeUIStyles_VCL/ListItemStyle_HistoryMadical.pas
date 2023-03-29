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
	"Bz": "��",
	"Jlzt": 0,
	"Fbrq": "1900-01-01 00:00:00",
	"Tj": "�����²����״�����8������Զ�����긲�ǣ���ä���������ף�ѹʹ���ң��ſ�ʹ������ʹ���ſ�����<2ָ��",
	"Mb": 60,
	"Xt": 80,
	"Tw": 40,
	"Sfxysccb": 1,
	"Jbxxbh": 168794,
	"Zs": "������ʹ3�졣",
	"xbs": "���߽���������������ʹ�����ء���������ͷʹ���ȣ��������ļ����ƣ���֫����ľ����ϰ����ɿɣ��¿ɡ���ɡ�",
	"Jws": "������ҩ�����ʷ���������������Բ�ʷ��",
	"Fjjg": "Ѫ���棺WBC  *10/L,L%N%���ң£ã��������ȣ�磯��;�ೣ�棺WBC ����RBC ������Ѫ��",
	"Cl": "����ҩ,����Ŀǰ�����ȶ�,ά��ԭ���Ʒ���.",
	"Zzdmc": "��Ѫѹ3��",
	"Sg": 183,
	"Tz": 70,
	"Tzzs": 0,
	"Zgxm": "����",
	"Ksmc": "ȫ��"
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
//  //���㲢�������ߵĸ߶�
//  AAutoSizeHeight:=
//    uBufferBitmap.GetStringHeight(Self.lblChiefSay.Caption,
//                                  RectF(0,0,Self.lblChiefSay.Width,MaxInt),
//                                  Self.swlblName_Material.DrawCaptionParam
//                                  );
//  pnlChiefSay.Height:=Ceil(AAutoSizeHeight)+Self.lblChiefSay.Margins.Top*2;
//
//
//
//  //���㲢�����ֲ�ʷ�ĸ߶�
//  AAutoSizeHeight:=
//    uBufferBitmap.GetStringHeight(Self.lblNowSick.Caption,
//                                  RectF(0,0,Self.lblNowSick.Width,MaxInt),
//                                  Self.swlblName_Material.DrawCaptionParam
//                                  );
//  pnlNowSick.Height:=Ceil(AAutoSizeHeight)+Self.lblChiefSay.Margins.Top*2;
//  pnlNowSick.Top:=pnlChiefSay.Top+pnlChiefSay.Height;
//
//
//  //���㲢������ϵĸ߶�
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
