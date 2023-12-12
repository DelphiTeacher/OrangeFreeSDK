unit uCxDBGridColumnItemDesignerPanelManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  Types,
  uDrawEngine,
  uGraphicCommon,
  //�����ز�ģ��
  EasyServiceCommonMaterialDataMoudle_VCL,
  GridSwitchPage2Frame,
  BaseForm,
  uComponentType,
  uDrawCanvas,
  uDrawParam,
  uFuncCommon,
  uSkinVirtualListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl,
  uSkinPanelType, uSkinButtonType, Vcl.StdCtrls, uSkinWindowsEdit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, cxLabel, GridSwitchPageFrame, uSkinLabelType,
  Vcl.ComCtrls, uSkinWindowsDateEdit, uSkinItemDesignerPanelType;


type
  TCxDBGridColumnItemDesignerPanelManager=class
  public
    //��ǰ���ͣ����Ϣ
    FHitTest:TcxGridRecordCellHitTest;
    FIsMouseDown:Boolean;
  public
    //�ֶ�
    FFieldName:String;
    FColumn:TcxGridDBColumn;
    //��ʹ�õ�������
    FItemDesignerPanel:TSkinItemDesignerPanel;

    cxGrid1DBTableView1: TcxGridDBTableView;

    //��ǰ���Ƶĵ�Ԫ��
    FDrawCellViewInfo: TcxGridTableDataCellViewInfo;

    constructor Create(AcxGrid1DBTableView1: TcxGridDBTableView;AFieldName:String;AItemDesignerPanel:TSkinItemDesignerPanel);overload;
    constructor Create(AcxGrid1DBTableView1: TcxGridDBTableView;AColumn:TcxGridDBColumn;AItemDesignerPanel:TSkinItemDesignerPanel);overload;

    procedure ColumnCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure MouseMove(Sender: TObject;
                Shift: TShiftState; X, Y: Integer);
    procedure MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    //ÿ�λ����б���֮ǰ׼��,����OnPrepareDrawItem�¼�
    //��Ϊÿ�λ���ʱ����OnPrepareDrawItem�¼��ǳ���ʱ,��˵����û����ʱ��,����Ҫÿ�ζ�������,���Ч��
    procedure CallOnPrepareDrawItemEvent(
                  Sender:TObject;
                  ACanvas:TDrawCanvas;
                  AItemDrawRect:TRectF;
                  AIsDrawItemInteractiveState:Boolean);
  end;



implementation

{ TCxDBGridColumnItemDesignerPanelManage }

procedure TCxDBGridColumnItemDesignerPanelManager.CallOnPrepareDrawItemEvent(
  Sender: TObject; ACanvas: TDrawCanvas; AItemDrawRect: TRectF;
  AIsDrawItemInteractiveState: Boolean);
begin
              LockSkinControlInvalidate;
              try

                //�Զ���ֵ,��Item������ֵ����ItemDesignerPanel����Ŀؼ�
  //              Self.FSkinVirtualListIntf.Prop.BindItemDesignerPanelAndItem(
  //                    AItemDesignerPanel,
  //                    AItem,
  //                    AIsDrawItemInteractiveState);
//                AItemDesignerPanel.Prop.SetControlsValueByItem(
//                      Self.SkinImageList,
//                      TSkinItem(AItem),
//                      AIsDrawItemInteractiveState);


                //����ListBox��OnPrepareDrawItem
                if Assigned(FItemDesignerPanel.OnPrepareDrawItem) then
                begin
                  //�ֶ���ֵ
                  FItemDesignerPanel.OnPrepareDrawItem(Self,
                          ACanvas,
                          TItemDesignerPanel(FItemDesignerPanel),
                          nil,//TSkinItem(AItem),
                          RectF2Rect(AItemDrawRect));
                end;


//                //�����������OnPrepareDrawItem
//                if Assigned(AItemDesignerPanel.OnPrepareDrawItem) then
//                begin
//                  AItemDesignerPanel.OnPrepareDrawItem(Self,ACanvas,
//                                            TSkinItemDesignerPanel(TSkinItem(AItem).FDrawItemDesignerPanel),
//                                            TSkinItem(AItem),
//                                            AItemDrawRect);
//                end;
              finally
                UnLockSkinControlInvalidate;
              end;
end;

procedure TCxDBGridColumnItemDesignerPanelManager.ColumnCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  AItemDrawRect:TRectF;
  AItemPaintData:TPaintData;
  ADrawCanvas:TDrawCanvas;
  AItemEffectStates:TDPEffectStates;
begin
  //�Ի浥Ԫ��
//  Exit;

//  OutputDebugString(PWideChar('cxGrid1DBTableView1Column10CustomDrawCell '+StdDateTimeToStr(Now)));

  FDrawCellViewInfo:=AViewInfo;


  AItemDrawRect:=RectF(AViewInfo.Bounds.Left,AViewInfo.Bounds.Top,AViewInfo.Bounds.Right,AViewInfo.Bounds.Bottom);

  uSkinVirtualListType.AutoAdjustItemDesignerPanelSize(FItemDesignerPanel,nil,AItemDrawRect);

  FItemDesignerPanel.Material.IsTransparent:=False;
  FItemDesignerPanel.Material.BackColor.IsFill:=False;

  ADrawCanvas:=CreateDrawCanvas('CustomDrawCell');
  try
//    try
              ADrawCanvas.Prepare(ACanvas.Handle);

              Self.CallOnPrepareDrawItemEvent(Sender,ADrawCanvas,AItemDrawRect,False);


              AItemEffectStates:=[];
              if AViewInfo.Focused then
              begin
                AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstPushed];
              end;

              if FHitTest<>nil then
              begin
                if AViewInfo.GridRecord=TcxGridRecordCellHitTest(FHitTest).GridRecord then
                begin
                  AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstMouseOver];
                  if FIsMouseDown then
                  begin
                    AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstMouseDown];
                  end;
                end;
              end;

              FItemDesignerPanel.SkinControlType.IsUseCurrentEffectStates:=True;
              FItemDesignerPanel.SkinControlType.CurrentEffectStates:=AItemEffectStates;


              //����ItemDesignerPanel�ı���,����ɫ
              AItemPaintData:=GlobalNullPaintData;
              AItemPaintData.IsDrawInteractiveState:=True;
              AItemPaintData.IsInDrawDirectUI:=True;
              FItemDesignerPanel.SkinControlType.Paint(ADrawCanvas,
                        FItemDesignerPanel.SkinControlType.GetPaintCurrentUseMaterial,
                        AItemDrawRect,
                        AItemPaintData);

              //����ItemDesignerPanel���ӿؼ�
              AItemPaintData:=GlobalNullPaintData;
              AItemPaintData.IsDrawInteractiveState:=(FHitTest<>nil) and (AViewInfo.GridRecord=TcxGridRecordCellHitTest(FHitTest).GridRecord);//False;///True;//AIsDrawItemInteractiveState;
              AItemPaintData.IsInDrawDirectUI:=True;
              //���ڱ༭�İ󶨿ؼ�������
//              ACustomListItemPaintOtherData.IsEditingItem:=(Self.FSkinVirtualListIntf.Prop.FEditingItem=ASkinItem);
//              ACustomListItemPaintOtherData.EditingItemDataType:=Self.FSkinVirtualListIntf.Prop.FEditingItem_DataType;
//              ACustomListItemPaintOtherData.EditingSubItemsIndex:=Self.FSkinVirtualListIntf.Prop.FEditingItem_SubItemsIndex;
//              ACustomListItemPaintOtherData.EditingItemDataType:=Self.FSkinVirtualListIntf.Prop.FEditingItem_DataType;
//              ACustomListItemPaintOtherData.EditingItemFieldName:=Self.FSkinVirtualListIntf.Prop.FEditingItem_FieldName;
//              AItemPaintData.OtherData:=@ACustomListItemPaintOtherData;
              FItemDesignerPanel.SkinControlType.DrawChildControls(ADrawCanvas,AItemDrawRect,AItemPaintData,AItemDrawRect);//RectF(0,0,cxGrid1.Width,Self.cxGrid1.Height));
//    except
//      on E:Exception do
//      begin
//
//      end;
//    end;
  finally
    FreeAndNil(ADrawCanvas);
    FDrawCellViewInfo:=nil;
  end;
  ADone:=True;

end;

constructor TCxDBGridColumnItemDesignerPanelManager.Create(
  AcxGrid1DBTableView1: TcxGridDBTableView; AFieldName: String;
  AItemDesignerPanel: TSkinItemDesignerPanel);
begin
  FFieldName:=AFieldName;
  FItemDesignerPanel:=AItemDesignerPanel;
  cxGrid1DBTableView1:=AcxGrid1DBTableView1;
end;

constructor TCxDBGridColumnItemDesignerPanelManager.Create(
  AcxGrid1DBTableView1: TcxGridDBTableView;AColumn:TcxGridDBColumn;
  AItemDesignerPanel: TSkinItemDesignerPanel);
begin
  FColumn:=AColumn;
  FItemDesignerPanel:=AItemDesignerPanel;
  cxGrid1DBTableView1:=AcxGrid1DBTableView1;
end;

procedure TCxDBGridColumnItemDesignerPanelManager.MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FIsMouseDown:=True;

  if FHitTest=nil then Exit;

  Self.CallOnPrepareDrawItemEvent(Sender,nil,
            RectF(FHitTest.ViewInfo.Bounds.Left,FHitTest.ViewInfo.Bounds.Top,FHitTest.ViewInfo.Bounds.Right,FHitTest.ViewInfo.Bounds.Bottom),
            False);
  //������갴����Ϣ
  FItemDesignerPanel.SkinControlType.DirectUIMouseDown(FItemDesignerPanel,Button,Shift,X-FHitTest.ViewInfo.Bounds.Left,Y-FHitTest.ViewInfo.Bounds.Top);

  //���벻���Ի����ˢ���������Ͽؼ���״̬
  Self.cxGrid1DBTableView1.Invalidate;

end;

procedure TCxDBGridColumnItemDesignerPanelManager.MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
  ACellBounds:TRect;
  AHitTest:TcxCustomGridHitTest;
begin
  //��ȡ���ͣ���ĵ�Ԫ����Ϣ
  AHitTest := (Sender as TcxGridSite).GridView.ViewInfo.GetHitTest(X, Y);


  //����ƶ��¼�����������Ӧ
  if not (AHitTest is TcxGridRecordCellHitTest) then
  begin
    TcxGrid(Sender).Cursor := crDefault;
    FHitTest:=nil;
//    FTrackItem := nil;
//    FTrackRec := nil;
    FItemDesignerPanel.SkinControlType.DirectUIMouseLeave;
    //���벻���Ի����ˢ���������Ͽؼ���״̬
    Self.cxGrid1DBTableView1.Invalidate;
    Exit;
  end;

  //�ж��Ƿ���ָ��������
  //������ڵ����Ƿ��ǲ����У������򲻴���
  if (FFieldName<>'') and (TcxGridDBColumn(TcxGridRecordCellHitTest(AHitTest).Item).DataBinding.FieldName <> FFieldName)
    or (FColumn<>nil) and (TcxGridDBColumn(TcxGridRecordCellHitTest(AHitTest).Item) <> FColumn) then
  begin
    TcxGridRecordCellHitTest(AHitTest).GridRecord.GridView.Site.Cursor := crDefault;
    FHitTest:=nil;
    FItemDesignerPanel.SkinControlType.DirectUIMouseLeave;
    //���벻���Ի����ˢ���������Ͽؼ���״̬
    Self.cxGrid1DBTableView1.Invalidate;
    Exit;
  end;
//  FTrackItem := TcxGridRecordCellHitTest(FHitTest).Item;
//  FTrackRec := TcxGridRecordCellHitTest(FHitTest).GridRecord;


  FHitTest:=TcxGridRecordCellHitTest(AHitTest);


  TcxGridRecordCellHitTest(FHitTest).GridRecord.GridView.Site.Cursor := crHandPoint;

  Self.CallOnPrepareDrawItemEvent(Sender,nil,
            RectF(FHitTest.ViewInfo.Bounds.Left,FHitTest.ViewInfo.Bounds.Top,FHitTest.ViewInfo.Bounds.Right,FHitTest.ViewInfo.Bounds.Bottom),
            False);

  //��������ƶ��¼�
  FItemDesignerPanel.SkinControlType.DirectUIMouseMove(FItemDesignerPanel,Shift,
    X-FHitTest.ViewInfo.Bounds.Left,
    Y-FHitTest.ViewInfo.Bounds.Top);

  //���벻���Ի����ˢ���������Ͽؼ���״̬
  Self.cxGrid1DBTableView1.Invalidate;

end;

procedure TCxDBGridColumnItemDesignerPanelManager.MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      FIsMouseDown:=False;

      if FHitTest=nil then Exit;

      Self.CallOnPrepareDrawItemEvent(Sender,nil,
                RectF(FHitTest.ViewInfo.Bounds.Left,FHitTest.ViewInfo.Bounds.Top,FHitTest.ViewInfo.Bounds.Right,FHitTest.ViewInfo.Bounds.Bottom),
                False);

      FItemDesignerPanel.SkinControlType.DirectUIMouseUp(Self.FItemDesignerPanel,Button,Shift,X-FHitTest.ViewInfo.Bounds.Left,Y-FHitTest.ViewInfo.Bounds.Top,
              //�ƶ�����С��5���ܵ��õ���¼�
              True
//              (Abs(FMouseDownAbsolutePt.X-Self.FMouseUpAbsolutePt.X)<Const_CanCallClickEventDistance)
//                and (Abs(FMouseDownAbsolutePt.Y-FMouseUpAbsolutePt.Y)<Const_CanCallClickEventDistance)
                );



      //���벻���Ի����ˢ���������Ͽؼ���״̬
      Self.cxGrid1DBTableView1.Invalidate;


end;

end.
