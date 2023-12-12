unit ListItemStyle_HospitalDoctorForRegisterNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,


  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,


  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinButtonType,
  uSkinLabelType, uSkinWindowsControl, uSkinItemDesignerPanelType, uSkinMaterial;

type
  TFrameListItemStyle_HospitalDoctorForRegisterNumber = class(TFrame,IFrameBaseListItemStyle)
    swidpnlItem: TSkinWinItemDesignerPanel;
    swlblEndtime: TSkinWinLabel;
    lblLevel: TSkinWinLabel;
    lblWorkTime: TSkinWinLabel;
    swlblDoctor: TSkinWinLabel;
    lblLeftNumber: TSkinWinLabel;
    lblAlreadyNumber: TSkinWinLabel;
    lblMoney: TSkinWinLabel;
    swbtnCopy: TSkinWinButton;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinLabel3: TSkinWinLabel;
    SkinWinLabel4: TSkinWinLabel;
    SkinWinLabel5: TSkinWinLabel;
    SkinWinLabel6: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_HospitalDoctorForRegisterNumber }

function TFrameListItemStyle_HospitalDoctorForRegisterNumber.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlItem;
end;

initialization
  RegisterListItemStyle('HospitalDoctorForRegisterNumber',TFrameListItemStyle_HospitalDoctorForRegisterNumber);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_HospitalDoctorForRegisterNumber);


end.
