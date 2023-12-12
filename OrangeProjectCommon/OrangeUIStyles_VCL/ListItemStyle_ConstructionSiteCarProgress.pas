unit ListItemStyle_ConstructionSiteCarProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinMaterial,
  uSkinProgressBarType, uSkinPanelType;

type
  TFrameListItemStyle_ConstructionSiteCarProgress = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    pbProgress: TSkinWinProgressBar;
    imgFactory: TSkinWinImage;
    imgSite: TSkinWinImage;
    lblItemCaption: TSkinWinLabel;
    pnlRight: TSkinWinPanel;
    lblDistance: TSkinWinLabel;
    lblPlan: TSkinWinLabel;
    lblCarCount: TSkinWinLabel;
    lblFinished: TSkinWinLabel;
    imgCar1: TSkinWinImage;
    imgCar2: TSkinWinImage;
    imgCar3: TSkinWinImage;
    SkinImageDefaultMaterial1: TSkinImageDefaultMaterial;
    imgCar4: TSkinWinImage;
    SkinImageDefaultMaterial2: TSkinImageDefaultMaterial;
    imgCar5: TSkinWinImage;
    imgCar6: TSkinWinImage;
    pnlTop: TSkinWinPanel;
    lblOverflow: TSkinWinLabel;
  private
    { Private declarations }
  public
    FCarImageList:TList;
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TFrameListItemStyle_Caption }

constructor TFrameListItemStyle_ConstructionSiteCarProgress.Create(
  AOwner: TComponent);
begin
  inherited;
  FCarImageList:=TList.Create;
  FCarImageList.Add(Self.imgCar1);
  FCarImageList.Add(Self.imgCar2);
  FCarImageList.Add(Self.imgCar3);
  FCarImageList.Add(Self.imgCar4);
  FCarImageList.Add(Self.imgCar5);
  FCarImageList.Add(Self.imgCar6);
end;

destructor TFrameListItemStyle_ConstructionSiteCarProgress.Destroy;
begin
  FreeAndNil(FCarImageList);
  inherited;
end;

function TFrameListItemStyle_ConstructionSiteCarProgress.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('ConstructionSiteCarProgress',TFrameListItemStyle_ConstructionSiteCarProgress);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_ConstructionSiteCarProgress);

end.
