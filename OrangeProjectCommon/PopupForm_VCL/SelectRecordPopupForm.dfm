inherited frmSelectRecordPopup: TfrmSelectRecordPopup
  ClientHeight = 239
  ClientWidth = 445
  Padding.Left = 1
  Padding.Top = 1
  Padding.Right = 1
  Padding.Bottom = 1
  OnPaint = FormPaint
  ExplicitWidth = 451
  ExplicitHeight = 268
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 1
    Top = 1
    Width = 443
    Height = 237
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  inherited fsdForm: TSkinWinForm
    DesignWidth = 451
    DesignHeight = 268
  end
  object RestMemTable1: TRestMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'RowNumber'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    FieldDefsInterfaceUrl = 
      'http://127.0.0.1:10020/tablecommonrest/get_record_list?appid=101' +
      '2&rest_name=MedicineSimpleInfo&pageindex=1&pagesize=100'
    OnGetRestDatasetPage = RestMemTable1GetRestDatasetPage
    Left = 360
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = RestMemTable1
    Left = 96
    Top = 72
  end
end
