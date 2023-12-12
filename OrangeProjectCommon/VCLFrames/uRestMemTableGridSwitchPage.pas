unit uRestMemTableGridSwitchPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Types,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uSkinWindowsControl,
  uSkinButtonType, Vcl.ExtCtrls, uSkinWindowsEdit,
//  uManager,
  uOpenClientCommon,
//  uJsonToDataset,
  XSuperObject, System.StrUtils,


  Math,
//  uWaitingForm,
  EasyServiceCommonMaterialDataMoudle_VCL,

  //kbmMemTable,
  uRestInterfaceCall, DateUtils, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uRestIntfMemTable, uSkinMaterial, uDrawPicture, uSkinImageList,
  uSkinImageListPlayerType, uSkinLabelType, uSkinWindowsComboBox;

type
  TFrameRestMemTableGridSwitchPage=class(TFrameGridSwitchPage)
    procedure btnFirstPageClick(Sender: TObject);override;
    procedure btnPriorPageClick(Sender: TObject);override;
    procedure btnNextPageClick(Sender: TObject);override;
    procedure btnLastPageClick(Sender: TObject);override;
    procedure btnRefreshClick(Sender: TObject);override;
    procedure edtPageIndexKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);override;
  private
    FRestMemTable1: TRestMemTable;

//    procedure DoRestMemTableExecuteBegin(Sender:TObject);
//    procedure DoRestMemTableExecuteEnd(Sender:TObject);
  public
    procedure DoCustomLoadData();override;
    procedure DoRestMemTableChange(Sender:TObject);virtual;
    procedure Load(ARestMemTable1: TRestMemTable);

  end;

implementation

{ TFrameRestMemTableGridSwitchPage }

procedure TFrameRestMemTableGridSwitchPage.btnFirstPageClick(Sender: TObject);
begin
  inherited;
//  if FRestMemTable1<>nil then
//  begin
//    FRestMemTable1.GetFirstPage;
//    Self.edtPageIndex.Text:=IntToStr(FRestMemTable1.PageIndex);
//  end
//  else
//  begin
//    if Self.edtPageIndex.Text <> '1' then
//    begin
//      Self.edtPageIndex.Text:= '1';
//    end
//    else
//    begin
//      Exit;
//    end;
//  end;
//  DoChange;

end;

procedure TFrameRestMemTableGridSwitchPage.btnLastPageClick(Sender: TObject);
begin
  inherited;
//  if FRestMemTable1<>nil then
//  begin
//    FRestMemTable1.GetLastPage;
//    Self.edtPageIndex.Text:=IntToStr(FRestMemTable1.PageIndex);
//  end
//  else
//  begin
//    if Self.edtPageIndex.Text <> Self.lblPageCount.Caption then
//    begin
//      Self.edtPageIndex.Text:= Self.lblPageCount.Caption;
//    end
//    else
//    begin
//      Exit;
//    end;
//  end;
//  DoChange;

end;

procedure TFrameRestMemTableGridSwitchPage.btnNextPageClick(Sender: TObject);
begin
  inherited;
//  if FRestMemTable1<>nil then
//  begin
//    FRestMemTable1.GetNextPage;
//    Self.edtPageIndex.Text:=IntToStr(FRestMemTable1.PageIndex);
//  end
//  else
//  begin
//    if StrToInt(Self.edtPageIndex.Text) < StrToInt(Self.lblPageCount.Caption) then
//    begin
//      Self.edtPageIndex.Text:=IntToStr(StrToInt(Self.edtPageIndex.Text)+1);
//    end
//    else
//    begin
//      Exit;
//    end;
//  end;
//  DoChange;

end;

procedure TFrameRestMemTableGridSwitchPage.btnPriorPageClick(Sender: TObject);
begin
  inherited;
//  if FRestMemTable1<>nil then
//  begin
//    FRestMemTable1.GetPriorPage;
//    Self.edtPageIndex.Text:=IntToStr(FRestMemTable1.PageIndex);
//  end
//  else
//  begin
//    if StrToInt(Self.edtPageIndex.Text) > 1 then
//    begin
//      Self.edtPageIndex.Text:=IntToStr(StrToInt(Self.edtPageIndex.Text)-1);
//    end
//    else
//    begin
//      Exit;
//    end;
//  end;
//  DoChange;

end;

procedure TFrameRestMemTableGridSwitchPage.btnRefreshClick(Sender: TObject);
begin
  inherited;

end;

//procedure TFrameRestMemTableGridSwitchPage.DoRestMemTableChange(
//  Sender: TObject);
//begin
//
//end;

procedure TFrameRestMemTableGridSwitchPage.edtPageIndexKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if Key=13 then
//  begin
//    if FRestMemTable1<>nil then
//    begin
//      FRestMemTable1.PageIndex:=StrToInt(Self.edtPageIndex.Text);
//      FRestMemTable1.Refresh;
//    end;
//    DoChange;
//  end;

end;

procedure TFrameRestMemTableGridSwitchPage.DoRestMemTableChange(Sender: TObject);
begin
  Self.edtPageIndex.Text:=IntToStr(FRestMemTable1.PageIndex);
  Self.lblPageCount.Caption:=IntToStr(FRestMemTable1.PageCount);
  Self.cmbPageSize.Text:=IntToStr(FRestMemTable1.PageSize);
  LoadFinished(FRestMemTable1.SumRecordCount);

//  if Self.FRestMemTable1.PageCount=0 then
//  begin
//    Self.btnFirstPage.Enabled:=False;
//    Self.btnPriorPage.Enabled:=False;
//    Self.btnNextPage.Enabled:=False;
//    Self.btnLastPage.Enabled:=False;
//  end
//  else
//  begin
//
//  end;


end;

procedure TFrameRestMemTableGridSwitchPage.Load(ARestMemTable1: TRestMemTable);
begin
  FRestMemTable1:=ARestMemTable1;
  FRestMemTable1.OnChange:=DoRestMemTableChange;
//  FRestMemTable1.OnExecuteBegin:=DoRestMemTableExecuteBegin;
//  FRestMemTable1.OnExecuteEnd:=DoRestMemTableExecuteEnd;

end;

procedure TFrameRestMemTableGridSwitchPage.DoCustomLoadData;
begin
  inherited;
  if FRestMemTable1<>nil then
  begin
    FRestMemTable1.Refresh;
  end;

end;

end.
