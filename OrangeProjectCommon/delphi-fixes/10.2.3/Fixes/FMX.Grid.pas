(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2016-09-01　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Grid;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Rtti, System.Types, System.UITypes, System.Generics.Collections,
  System.ImageList, System.Messaging, FMX.Utils, FMX.ActnList, FMX.Types, FMX.Graphics, FMX.ImgList, FMX.Controls,
  FMX.StdActns, FMX.TextLayout, FMX.Controls.Presentation, FMX.Controls.Model, FMX.ScrollBox,
  FMX.Text;

const
  MM_CONTENT_CHANGED = MM_SCROLLBOX_USER + 1;
  MM_COLUMN_CHANGED = MM_SCROLLBOX_USER + 2;
  MM_COLUMN_MOVED = MM_SCROLLBOX_USER + 3;
  MM_SEL_CHANGED = MM_SCROLLBOX_USER + 4;
  MM_INVALIDATE_CELL = MM_SCROLLBOX_USER + 5;
  MM_INVALIDATE_CONTENT_SIZE = MM_SCROLLBOX_USER + 6;
  MM_GET_ROW_HEIGHT = MM_SCROLLBOX_USER + 7;
  MM_CELL_RECT = MM_SCROLLBOX_USER + 8;
  MM_SHOW_EDITOR = MM_SCROLLBOX_USER + 9;
  MM_HIDE_EDITOR = MM_SCROLLBOX_USER + 10;
  MM_EDITOR_MODE = MM_SCROLLBOX_USER + 11;
  MM_GET_EDITOR_VALUE = MM_SCROLLBOX_USER + 12;
  MM_POST_EDITOR_VALUE = MM_SCROLLBOX_USER + 13;
  MM_REFRESH_EDITOR_VALUE = MM_SCROLLBOX_USER + 14;

  MM_GRID_USER = MM_SCROLLBOX_USER + 15;

  PM_CREATE_CELL_OBJECT = PM_USER_SCROLLBOX + 1;
  PM_CAN_EDIT = PM_USER_SCROLLBOX + 2;
  PM_CELL_BY_POINT = PM_USER_SCROLLBOX + 3;
  PM_SET_TOP_LEFT = PM_USER_SCROLLBOX + 4;
  PM_GET_DISPLAY_CELLS = PM_USER_SCROLLBOX + 5;
  PM_SCROLL_TO_SELECT = PM_USER_SCROLLBOX + 6;
  PM_VKDISPLACEMENT = PM_USER_SCROLLBOX + 7;

  PM_GRID_USER = PM_USER_SCROLLBOX + 15;

type
  TColumn = class;
  TGridModel = class;
  TGridValues = class;
  TColumnClass = class of TColumn;

  /// <summary> The state, which affects the view of cell
  /// <para> <b>Selected</b> The cell is selected but does not have the input focus </para>
  /// <para> <b>Focused</b> The cell is selected and has focus </para>
  /// <para> <b>RowSelected</b> The cell placed in the selected row. See <b>TGridOption.RowSelect</b> </para>
  /// </summary>
  TGridDrawState = (Selected, Focused, RowSelected);
  TGridDrawStates = set of TGridDrawState;
  /// <summary> This type defines the action which is performed after the finish cell editing by pressing Enter (Return)
  /// <para>None - the selected cell does not change</para>
  /// <para>GotoNextRow - the next row is selected</para>
  /// <para>GotoNextColumn - the next editable cell in row is selected</para>
  /// </summary>
  TCellReturnAction = (None, GotoNextRow, GotoNextColumn);

  IDrawableCell = interface
    ['{5AF33274-5E60-4EA9-81D3-0BA33050C68C}']
    procedure BeforeDrawing(const Canvas: TCanvas);
    procedure AfterDrawing(const Canvas: TCanvas);
    procedure DrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates);
  end;

  /// <summary> This interface can be used by the presentation to paint the cells
  /// <para> See also <see cref="FMX.Grid|IDrawableCell">IDrawableCell</see> </para> </summary>
  IDrawableCellEx = interface(IDrawableCell)
    ['{A96CF08A-F868-4CDB-B4F5-A2D18DD7EDDD}']
    /// <summary> This method should draw the cell background </summary>
    procedure DrawBackground(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates);
  end;

  TGridOption = (AlternatingRowBackground, Editing, AlwaysShowEditor, ColumnResize, ColumnMove, ColLines, RowLines,
    RowSelect, AlwaysShowSelection, Tabs, Header, HeaderClick, CancelEditingByDefault, AutoDisplacement);
  TGridOptions = set of TGridOption;

  TOnGetValue = procedure(Sender: TObject; const ACol, ARow: Integer; var Value: System.Rtti.TValue) of object;

  TOnSetValue = procedure(Sender: TObject; const ACol, ARow: Integer; const Value: System.Rtti.TValue) of object;

  TOnEditingDone = procedure(Sender: TObject; const ACol, ARow: Integer) of object;

  TOnCallbackGetValue = procedure(Sender: TObject; const ACol, ARow: Integer; ACallback: TProc<System.Rtti.TValue>)
    of object;

  TSelectCell = procedure(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean) of object;

  THeaderClick = procedure(Column: TColumn) of object;

  TCellClick = procedure(const Column: TColumn; const Row: Integer) of object;

  TColumnMovedEvent = procedure(Column: TColumn; FromIndex, ToIndex: Integer) of object;

  TDrawColumnCellEvent = procedure(Sender: TObject; const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
    const Row: Integer; const Value: TValue; const State: TGridDrawStates) of object;

  TDrawColumnHeaderEvent = procedure(Sender: TObject; const Canvas: TCanvas; const Column: TColumn;
    const Bounds: TRectF) of object;

  TCreateCustomEditorEvent = procedure(Sender: TObject; const Column: TColumn; var Control: TStyledControl) of object;

  TGetImageIndexEvent = procedure(Column: TColumn; const Value: TValue; var ImageIndex: TImageIndex) of object;

  /// <summary> Interface to access to the column which this object belong to </summary>
  ICellControl = interface
  ['{67922698-EEEE-4326-B114-F11145A1D200}']
    function GetColumn: TColumn;
    procedure SetColumn(const Value: TColumn);
    /// <summary> This is the column which this object belong to </summary>
    property Column: TColumn read GetColumn write SetColumn;
  end;

  /// <summary> The base class of all columns </summary>
  TColumn = class(TControl, ICaption, IDrawableCellEx, IReadOnly)
  public const
    HorzTextMargin = 3;
    VertTextMargin = 3;
  public type
    /// <summary> The status of the cell editor of this column
    ///  <para>None - the cell editor is not shown</para>
    ///  <para>ReadOnly - the cell editor is shown but cannot edit</para>
    ///  <para>Unmodified - the cell editor is shown but not has changes</para>
    ///  <para>ReadOnly - the cell editor is shown and has changes</para>
    /// </summary>
    TEditorState = (None, ReadOnly, Unmodified, Modified);
  private
    [Weak] FModel: TGridModel;
    [Weak] FPresentedControl: TPresentedControl;
    FHeader: string;
    FChanged: Boolean;
    FLayout: TTextLayout;
    FReadOnly: Boolean;
    [Weak] FCellObject: TObject;
    FDrawableCell: IDrawableCell;
    FNeedCreateCellControl: Boolean;
    FColumnVisible: Boolean;
    FEditorState: TEditorState;
    FEditorStateChanging: Boolean;
    { ICaption }
    function GetText: string;
    procedure ICaption.SetText = SetHeader;
    function TextStored: Boolean; virtual;
    procedure SetHeader(const Value: string);
    function GetCellObject: TObject;
    procedure ReadWidth(Reader: TReader);
    procedure WriteWidth(Writer: TWriter);
    procedure SkipOldProperty(Reader: TReader);
    function GetDrawableCell: IDrawableCell;
    function GetEffectiveVisible: Boolean; inline;
    function GetDefaultTextSettings: TTextSettings; inline;
    procedure Init;
    procedure ClearCacheIfNeed;
    function UpdateReadOnly(const InplaceEdit: TObject): Boolean;
    { IReadOnly }
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    procedure SetColumnVisible(const Value: Boolean);
    function GetInEditMode: Boolean;
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure AncestorParentChanged; override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetObservers: TObservers; override;
    procedure EnabledChanged; override;
    procedure VisibleChanged; override;
    function GetDefaultSize: TSizeF; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    { IDrawableCellEx }
    /// <summary> This method called before draw of column. If <b>DrawableCell</b> exists then is called
    /// <b>DrawableCell.BeforeDrawing</b> </summary>
    procedure BeforeDrawing(const Canvas: TCanvas); virtual;
    /// <summary> This method called after draw of column. If <b>DrawableCell</b> exists then is called
    /// <b>DrawableCell.AfterDrawing</b> </summary>
    procedure AfterDrawing(const Canvas: TCanvas); virtual;
    /// <summary> This method is called when need to draw the cell. If property <b>Model.DefaultDrawing</b> is
    /// <c>true</c> then thist method call <b>DrawableCell.DrawCell</b> and <b>DefaultDrawCell</b>. After that
    /// <b>Model.DoDrawColumnCell</b> is called. See also <b>DefaultDrawCell</b>,
    /// <b>Model.OnDrawColumnCell</b> </summary>
    procedure DrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); virtual;
    /// <summary> This method is called before <b>DrawCell</b> when need to draw the background of cell. This method
    /// only call <b>Model.DoDrawColumnBackground</b>. In event handler <b>TGridModel.OnDrawColumnBackground</b>
    /// user can paint the background image of the cell. By default, the background is missing.
    /// </summary>
    /// <param name="Canvas"> The canvas on which to paint a background</param>
    /// <param name="Bounds"> The coordinates of the rectangle inside which should be painted the background. This is
    /// same as <b>CellRect</b></param>
    /// <param name="Row"> The row number in which placed the cell </param>
    /// <param name="Value"> The value that should be shown </param>
    /// <param name="State"> One or more states of the cell that should be taken into account when drawing</param>
    procedure DrawBackground(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); virtual;
    function GetAbsoluteOpacity: Single; override;
    /// <summary> This oject is used to draw the cells in the column. The instance is created when you first access
    /// this property. The class of the object being created is determined by using the method
    /// <b>TGridModel.GetCellClass</b>. Usually this is control that supports the interface <b>IDrawableCell</b>
    /// See <b>DrawableCell</b></summary>
    /// <remarks> Can be <c>nil</c>. The class of the object being created is determined by the native or stylistic
    /// control that is registered with using the class <b>TPresentationProxyFactory</b> </remarks>
    property CellObject: TObject read GetCellObject;
    /// <summary> Interface <b>IDrawableCell</b> from the object <b>CellObject</b> if it exists, and
    /// supports this interface. Its methods are used when drawing of column. The methods of <b>DrawableCell</b> called
    /// from the same methods of <b>TColumn</b> (<b>BeforeDrawing</b>, <b>AfterDrawing</b>, <b>DrawCell</b>).
    /// Otherwise this property is <c>nil</c>
    /// </summary>
    property DrawableCell: IDrawableCell read GetDrawableCell;
    /// <summary> The current text layout that used to draw text in cells </summary>
    property Layout: TTextLayout read FLayout;
    procedure ChangeOrder; override;
    /// <summary> This virtual method is called when changed the data in the cell editor. You should not perform this
    /// method on your own. Use for this the <see cref='FMX.Grid|TColumn.EditorModified'>EditorModified</see> method.
    /// You can override this method to doing something</summary>
    /// <returns> <c>True</c> if it is possible to change <see cref='FMX.Grid|TColumn.EditorState'>EditorState</see> value
    /// </returns>
    function DoEditorModified: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary> Determines what column is in edit mode. This property is left for compatibility.
    ///  See <see cref='FMX.Grid|TColumn.EditorState'>EditorState</see> </summary>
    property InEditMode: Boolean read GetInEditMode;
    /// <summary> This property specifies the current state of the cell editor </summary>
    property EditorState: TEditorState read FEditorState;
    /// <summary> Refresh the contents of a cell, according to new data
    /// <para>See also <b>Fmx.Bind.Editors.TBindListGridEditor</b></para>
    /// </summary>
    /// <param name="ARow"> The index of row </param>
    /// <remarks> This method is called in <b>IBindListVirtualEditor.UpdateCell</b> after the data of <b>DataSource</b>
    /// was changed </remarks>
    procedure UpdateCell(const ARow: Integer); virtual;
    /// <summary> This method execute <b>Model.ColumnChanged</b>. This method is called after some changes in properties
    /// of column. </summary>
    procedure Changed; virtual;
    procedure SetBounds(X: Single; Y: Single; AWidth: Single; AHeight: Single); override;
    /// <summary> This property is True if should be allocated some space for the column. Is used to calculate the
    /// coordinates of the columns in design-time.
    /// </summary>
    property EffectiveVisible: Boolean read GetEffectiveVisible;
    /// <summary> This virtual method should return <c>True</c> if this column can show editor. If property
    /// <b>Enabled</b> is <c>False</c> or property <b>Width</b> is <c>0</c> then this method unused. This method called
    /// in <b>TGridModel.CanEdit</b>. Use the methods <b>TGridModel.CanEdit</b> to determine that the editor of current
    /// cell could display. </summary>
    function CanEdit: Boolean; virtual;
    /// <summary> This virtual method can be used to initialize data of the cell editor. Before calling this method,
    /// the data of the editor is already be assigned. Override this method only if you require some additional
    /// steps </summary>
    /// <param name="InplaceEdit"> The cell editor, can be <c>nil</c> </param>
    /// <param name="Value"> The value which must be set in the editor</param>
    /// <returns> <c>False</c> if the editor of cell can't be shown and the grid can't set state <b>EditorMode</b> to
    /// <c>True</c>. <para>For example: the column is read only, but editor not has property <b>ReadOnly</b></para>
    /// </returns>
    function RefreshEditor(const InplaceEdit: TObject; const Value: TValue): Boolean; virtual;
    /// <summary> This method should be perform in cell editor to notify the grid about changes.
    /// See also <see cref='FMX.Grid|TColumn.DoEditorModified'>DoEditorModified</see>,
    /// <see cref='FMX.Grid|TColumn.EditorState'>EditorState</see>
    /// </summary>
    procedure EditorModified;
    /// <summary> Modifies the source data after editing the cell, if possible. See <b>TGridModel.DoSetValue</b>,
    /// <b>TGridModel.OnEditingDone</b>, <b>TGridModel.EditorMode</b>, <b>TGridModel.HideEditor</b> </summary>
    /// <param name="InplaceEdit"> The reference to the cell editor if it exists</param>
    /// <param name="Value"> The value extracted from the cell editor after editing </param>
    /// <param name="Accept"> If <c>True</c>, then need make changes in the source data, otherwise the data
    /// remains unchanged </param>
    /// <returns> <c>True</c> if the data was indeed successfully changed </returns>
    function EditingDone(const InplaceEdit: TObject; const Value: TValue; const Accept: Boolean): Boolean;
    /// <summary> This virtual method is called from the <see cref="FMX.Grid|TColumn.EditingDone">EditingDone</see>
    /// method if the <b>Accept</b> parameter is <c>True</c>. You can override this method in the heir, but you not have
    /// to call it manually
    /// </summary>
    /// <param name="InplaceEdit"> The reference to the cell editor if it exists (can be <c>nil</c>)</param>
    /// <param name="Value"> The value extracted from the cell editor after editing </param>
    /// <returns> <c>True</c> if the data was indeed successfully changed </returns>
    /// <remarks> This method is used to interact with the LiveBinding </remarks>
    function PostEditorValue(const InplaceEdit: TObject; const Value: TValue): Boolean; virtual;
    /// <summary> This virtual method is called from the <see cref="FMX.Grid|TColumn.EditingDone">EditingDone</see>
    /// method if the <b>Accept</b> parameter is <c>False</c> and some changes are made. You can override this method in
    /// the heir, but you not have to call it manually </summary>
    /// <remarks> This method is used to interact with the LiveBinding </remarks>
    procedure EditingCancelled; virtual;
    /// <summary> This function determines that the specified value should not be displayed in the cell and stored in
    /// the cache <see cref="FMX.Grid|TGridValues">TGridValues</see> </summary>
    class function ValueIsEmpty(const Value: TValue): Boolean;
    /// <summary> Convert a value to a string value. This method is used by default for drawing the cell </summary>
    function ValueToString(const Value: TValue): string; virtual;
    /// <summary> Check symbol for validity. See <b>TLinkObservers.EditGridLinkIsValidChar</b> </summary>
    /// <param name="KeyChar"> The character that we check for validity. See <b>KeyDown</b> </param>
    /// <returns> If using data source then <b>EditGridLinkIsValidChar</b> otherwise always <c>True</c> </returns>
    function ValidChar(const KeyChar: Char): Boolean; virtual;
    /// <summary> The reference to the data model of parental control. This property is set when changing the parent
    /// (see <b>AncestorParentChanged</b>). If a current column does not belong to the heir <b>TPresentedControl</b>,
    /// or the model of <b>PresentedControl</b> is not the heir <b>TGridModel</b>, then this property contains
    /// <c>nil</c> </summary>
    property Model: TGridModel read FModel;
    /// <summary> The reference to the control that uses this column and the data model (see property <b>Model</b>)
    /// </summary>
    property PresentedControl: TPresentedControl read FPresentedControl;
    /// <summary> This method performs the default drawing of the cell. It is called in <b>DrawCell</b> if the property
    /// <b>TGridModel.DefaultDrawing</b> is <c>True</c> </summary>
    /// <param name="Canvas"> The canvas on which to paint an image of the cell </param>
    /// <param name="Bounds"> The coordinates of the rectangle inside which should be painted the cell. This is
    /// <b>CellRect</b> that reduced by the <b>TColumn.Padding</b> value </param>
    /// <param name="Row"> The row number in which placed the cell </param>
    /// <param name="Value"> The value that should be shown </param>
    /// <param name="State">One or more states of the cell that should be taken into account when drawing</param>
    procedure DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); virtual;
    /// <summary> The default text settings are taken from the <b>Model</b>. See
    /// <b>TGridModel.GetResultingTextSettings</b> </summary>
    property DefaultTextSettings: TTextSettings read GetDefaultTextSettings;
    /// <summary> This method places the source rectangle in the bounds rectangle and uses alignment parameters of text
    /// settings</summary>
    function RectPlaceIntoBounds(const Source, Bounds: TRectF): TRectF;
  published
    property Action;
    property Enabled;
    property Locked;
    property Header: string read FHeader write SetHeader;
    /// <summary> The padding of any cells in this column </summary>
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    /// <summary> This property specifies whether you can modify the column </summary>
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    /// <summary> This property specifies whether to display this column in run-time. In design time the column always
    /// is displayed so you can reorder and change of column width </summary>
    property Visible: Boolean read FColumnVisible write SetColumnVisible default True;
    property Width;
    property OnResize;
    property OnResized;
  end;

  TStringColumn = class(TColumn);

  TProgressColumn = class(TColumn)
  public const
    DefaultMax = 100;
  private
    FMin: Single;
    FMax: Single;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
  protected
    /// <summary> This virtual method returns <c>True</c>, if the <b>Max</b> property is different from the default
    /// values (<see cref="FMX.Grid|TProgressColumn.DefaultMax">TProgressColumn.DefaultMax</see>) </summary>
    function IsMaxStored: Boolean; virtual;
    /// <summary> This virtual method returns <c>True</c>, if the <b>Min</b> property is different from the default
    /// values (<c>0</c>) </summary>
    function IsMinStored: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    function CanEdit: Boolean; override;
    procedure DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); override;
  published
    property Max: Single read FMax write SetMax stored IsMaxStored nodefault;
    property Min: Single read FMin write SetMin stored IsMinStored nodefault;
  end;

  TCheckColumn = class(TColumn)
  public const
    StrStyleName = 'checkcellstyle'; // do not localize
  protected
    function GetDefaultSize: TSizeF; override;
  public
    /// <summary> Creating of picture which contains <b>CheckBox</b>. This picture can be used to painting of grid cells
    /// </summary>
    class function CreateBitmap(const Model: TGridModel; const Checked: Boolean;
      const EditorMode: Boolean = False): TBitmap;
    procedure DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); override;
    function ValueToString(const Value: TValue): string; override;
    /// <summary> Try to convert the <c>TValue</c> value into a <c>Boolean</c> value </summary>
    /// <param name="Value"> The source value that has type <c>TValue</c> </param>
    /// <param name="BoolValue"> In case of success the <c>Boolean</c> value after conversion otherwise it is not
    /// changed </param>
    /// <returns> <c>True</c> in case of success otherwise <c>False</c> </returns>
    function TryGetAsBoolean(const Value: TValue; var BoolValue: Boolean): Boolean;
  end;

  TDateColumn = class(TColumn)
  private
    FShowClearButton: Boolean;
    FFormat: string;
    procedure SetShowClearButton(const Value: Boolean);
    procedure SetFormat(const Value: string);
  protected
    /// <summary> This virtual method allows you to determine whether to keep the
    /// <see cref="FMX.Grid|TDateColumn.Format">Format</see> property in fmx-file </summary>
    /// <returns> <c>True</c> if value is not empty </returns>
    function IsFormatStored: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    function ValueToString(const Value: TValue): string; override;
  published
    /// <summary> The display format of the date or time. <para> For example: <c>'dd.mm.yy'</c>. If empty there is used
    /// current default format</para> </summary>
    property Format: string read FFormat write SetFormat stored IsFormatStored;
    /// <summary> Whether you want to display a button for clearing the contents in the cell editor </summary>
    property ShowClearButton: Boolean read FShowClearButton write SetShowClearButton default False;
  end;

  TTimeColumn = class(TDateColumn)
  public
    function ValueToString(const Value: TValue): string; override;
  end;

  TPopupColumn = class(TColumn)
  private
    FItems: TStringList;
    procedure SetItems(const Value: TStringList);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Items: TStringList read FItems write SetItems;
  end;

  TImageColumn = class(TColumn)
  private
    FPreviewSize: TSize;
    procedure SetPreviewSize(const Value: TSize);
  public
    constructor Create(AOwner: TComponent); override;
    procedure DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); override;
    /// <summary> The maximum size of the thumbnail that is displayed in the cell </summary>
    /// <remarks> To improve performance when you use big pictures they are reduced to specified value, stored in
    /// internal cache and drawn during everything repainting. </remarks>
    property PreviewSize: TSize read FPreviewSize write SetPreviewSize;
  end;

  /// <summary> The special column type to display numbers. The text is always right-aligned and cell editor uses
  /// the numerical keyboard on mobile devices by default </summary>
  TCustomNumberColumn = class(TColumn)
  private
    FDecimalDigits: Integer;
    FValueType: TNumValueType;
    FShowThousandSeparator: Boolean;
    procedure SetDecimalDigits(const Value: Integer);
    procedure SetValueType(const Value: TNumValueType);
    procedure SetShowThousandSeparator(const Value: Boolean);
  protected
    procedure BeforeDrawing(const Canvas: TCanvas); override;
  public
    constructor Create(AOwner: TComponent); override;
    class function TryValueToString(const Value: TValue; const ValueType: TNumValueType;
      out Text: string; const DecimalDigits: Integer = -1; const ShowThousandSeparator: Boolean = False): Boolean;
    function ValueToString(const Value: TValue): string; override;
    function ValidChar(const KeyChar: Char): Boolean; override;
    /// <summary> The number of decimal places when displaying float numbers </summary>
    property DecimalDigits: Integer read FDecimalDigits write SetDecimalDigits default 2;
    property ValueType: TNumValueType read FValueType write SetValueType;
    property ShowThousandSeparator: Boolean read FShowThousandSeparator write SetShowThousandSeparator;
  end;

  /// <summary> When the input there is used number with a fixed number of decimal places </summary>
  TCurrencyColumn = class(TCustomNumberColumn)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DecimalDigits;
    property ShowThousandSeparator default True;
  end;

  /// <summary> When the input there is used original value </summary>
  TFloatColumn = class(TCustomNumberColumn)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DecimalDigits;
    property ShowThousandSeparator;
  end;

  /// <summary> When the input there is used original value also we can use only integer values </summary>
  TIntegerColumn = class(TCustomNumberColumn)
  public
    constructor Create(AOwner: TComponent); override;
    function ValidChar(const KeyChar: Char): Boolean; override;
    property ShowThousandSeparator;
  end;

  /// <summary> The special column type to display images from <see cref="FMX.Grid|TCustomGrid.Images">Images</see>
  /// </summary>
  TGlyphColumn = class(TColumn)
  private
    FGlyph: IGlyph;
    FOnGetImageIndex: TGetImageIndexEvent;
    FStretch: Boolean;
    procedure SetStretch(const Value: Boolean);
    procedure SetOnGetImageIndex(const Value: TGetImageIndexEvent);
  protected
    procedure AncestorParentChanged; override;
    procedure Loaded; override;
    /// <summary> This virtual method call event handler
    /// <see cref="FMX.Grid|TGlyphColumn.OnGetImageIndex">OnGetImageIndex</see> and return index of image. You can
    /// override this method but you should not perform it on their own. To do this, use the method
    /// <see cref="FMX.Grid|TGlyphColumn.GetImageIndex">GetImageIndex</see>
    /// </summary>
    procedure DoGetImageIndex(const Value: TValue; var ImageIndex: TImageIndex);
  public
    /// <summary> Contains appropriate interface of <see cref="FMX.Grid|TColumn.PresentedControl">PresentedControl</see>
    /// (usualy <see cref="FMX.Grid|TCustomGrid">TCustomGrid</see>) </summary>
    property GlyphInterface: IGlyph read FGlyph;
    /// <summary> Return index of image by some value of <c>Value</c> parameter. This method call the virtual
    /// method <see cref="FMX.Grid|TGlyphColumn.DoGetImageIndex">DoGetImageIndex</see>
    /// </summary>
    function GetImageIndex(const Value: TValue): TImageIndex;
    function CanEdit: Boolean; override;
    procedure DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
      const State: TGridDrawStates); override;
    /// <summary> Returns the rectangle of picture from <see cref="FMX.Grid|TCustomGrid.Images">Images</see> taking into
    /// account the parameters text alignment </summary>
    function GlyphPlaceIntoBounds(const Index: TImageIndex; const Bounds: TRectF; const Scale: Single): TRectF;
  published
    /// <summary> Same as the <see cref="FMX.ImgList|TGlyph.Stretch">TGlyph.Stretch</see> property</summary>
    property Stretch: Boolean read FStretch write SetStretch default False;
    /// <summary> This event handler can return the custom defined image index of
    /// <see cref="FMX.Grid|TCustomGrid.Images">Images</see>. See also
    /// <see cref="FMX.Grid|TGlyphColumn.DoGetImageIndex">DoGetImageIndex</see> </summary>
    property OnGetImageIndex: TGetImageIndexEvent read FOnGetImageIndex write SetOnGetImageIndex;
  end;

  /// <summary> The base class of data model for grids. This class contains the most properties to manage of grid
  /// exterior </summary>
  TGridModel = class(TCustomScrollBoxModel)
  public const
    /// <summary> This is the default grid <see cref="FMX.Grid|TGridModel.Options">Options</see> which are used when
    /// creating a new instance of the <b>TGridModel</b> class</summary>
    DefaultGridOptions: TGridOptions = [TGridOption.Editing, TGridOption.ColumnResize, TGridOption.ColumnMove,
      TGridOption.ColLines, TGridOption.RowLines, TGridOption.Tabs, TGridOption.Header, TGridOption.HeaderClick,
      TGridOption.AutoDisplacement];
  public type
    TColumnIndexes = record
      Column: TColumn;
      FromIndex, ToIndex: Integer;
    end;
    TCellObjectInfo = record
      Column: TColumn;
      CellObject: TObject;
    end;
    TCoord = record
      procedure Clear;
      function IsEmpty: Boolean;
      case Boolean of
        False:
          (Col, Row: Integer);
        True:
          (AsArray: array [0 .. 1] of Integer);
    end;
    TRectCoord = record
      TopLeft, BottomRight: TGridModel.TCoord;
    end;
    TPointInfo = record
      Point: TPointF;
      Coord: TGridModel.TCoord;
    end;
    TCellInfo = record
      Coord: TGridModel.TCoord;
      Rect: TRect;
    end;
    TVKInfo = record
      Shown: Boolean;
      AbsoluteRect: TRectF;
    end;
  private
    FUpdateCount: Integer;
    FTextSettingsInfo: TTextSettingsInfo;
    FOptions: TGridOptions;
    FContentChanged: Boolean;
    FCol: Integer;
    FRow: Integer;
    FOldCoord: TCoord;
    FRowCount: Integer;
    FRowHeight: Single;
    FColumns: TList<TColumn>;
    FDefaultDrawing: Boolean;
    FOnHeaderClick: THeaderClick;
    FOnCellClick: TCellClick;
    FOnCellDblClick: TCellClick;
    FOnColumnMoved: TColumnMovedEvent;
    FOnDrawColumnHeader: TDrawColumnHeaderEvent;
    FOnSelectCell: TSelectCell;
    FOnSelChanged: TNotifyEvent;
    FOnDrawColumnBackground: TDrawColumnCellEvent;
    FOnDrawColumnCell: TDrawColumnCellEvent;
    FOnCallbackGetValue: TOnCallbackGetValue;
    FOnGetValue: TOnGetValue;
    FOnSetValue: TOnSetValue;
    FOnCreateCustomEditor: TCreateCustomEditorEvent;
    FOnEditingDone: TOnEditingDone;
    FEnabled: Boolean;
    FCache: TGridValues;
    FCellReturnAction: TCellReturnAction;
    FDataStored: Boolean;
    FIsUsedInBinding: Boolean;
    FOrderChanging: Boolean;
    procedure SetRowHeight(const Value: Single);
    procedure DoContentChanged;
    procedure DoColumnChanged(const Index: Integer);
    procedure SetRowCount(const Value: Integer);
    function GetColumnCount: Integer;
    function GetColumns(const Index: Integer): TColumn;
    procedure SetOptions(const Value: TGridOptions);
    function IsOptionsStored: Boolean;
    procedure SetDefaultDrawing(const Value: Boolean);
    procedure SetCol(const Value: Integer);
    procedure SetRow(const Value: Integer);
    function TrySelectCell(const ACol, ARow: Integer; const AObservable: Boolean): Boolean;
    function GetEffectiveRowHeight: Integer;
    procedure SetEnabled(const Value: Boolean);
    function GetEditorMode: Boolean;
    procedure SetEditorMode(const Value: Boolean);
    procedure DoDrawColumnBackground(const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
      const Row: Integer; const Value: TValue; const State: TGridDrawStates);
    function GetDesign: Boolean;
    procedure SetDesign(const Value: Boolean);
    procedure SetDefaultTextSettings(const Value: TTextSettings);
    function CreatePreviewBitmap(const Column: TImageColumn; const Bitmap: TBitmap): TBitmap;
    procedure SetDataStored(const Value: Boolean);
    procedure SetIsUsedInBinding(const Value: Boolean);
    procedure UpdateColumnsIndex(const Force: Boolean = False);
    procedure InternalInsertColumn(const Index: Integer; const Column: TColumn);
  protected
    /// <summary> This method create instance of <see cref="FMX.Grid|TGridModel.Cache">Cache</see> property </summary>
    function CreateCache: TGridValues; virtual;
    /// <summary> This virtual method is perform after <see cref="FMX.Grid|TGridModel.IsUpdating">IsUpdating</see> is
    /// changed from <c>True</c> to <c>Talse</c> </summary>
    procedure DoEndUpdate; virtual;
    /// <summary> This virtual method returns default options of grid </summary>
    function GetDefaultGridOptions: TGridOptions; virtual;
    /// <summary> This virtual method is called from <see cref="FMX.Grid|TGridModel.SelectCell">SelectCell</see> before
    /// changing current cell </summary>
    procedure DoSelectCell(Col, Row: Integer; var CanSelect: Boolean); virtual;
    /// <summary> This virtual method is called from <see cref="FMX.Grid|TGridModel.SelectCell">SelectCell</see> after
    /// changing current cell </summary>
    procedure DoSelChanged; virtual;
    /// <summary> This virtual method is called from <see cref="FMX.Grid|TColumn.DrawCell">TColumn.DrawCell</see>.
    /// By default this method perform <see cref="FMX.Grid|TGridModel.OnDrawColumnCell">OnDrawColumnCell</see> event
    /// handler </summary>
    procedure DoDrawColumnCell(const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates); virtual;
    /// <summary> This virtual method must return the class which encapsulates the text settings </summary>
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; virtual;
    /// <summary> This virtual method is called after changing text settings </summary>
    procedure DoTextSettingsChanged; virtual;
    /// <summary> This virtual method specifies whether to save the StyledSettings value in fmx-file </summary>
    /// <returns> <c>True</c> if value is not equal to default value otherwise <c>False</c> </returns>
    function StyledSettingsStored: Boolean; virtual;
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.GetDefaultTextSettings">ITextSettings.GetDefaultTextSettings</see>
    /// </summary>
    function GetDefaultTextSettings: TTextSettings;
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.GetTextSettings">ITextSettings.GetTextSettings</see>
    /// </summary>
    function GetTextSettings: TTextSettings;
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.SetTextSettings">ITextSettings.SetTextSettings</see>
    /// </summary>
    procedure SetTextSettings(const Value: TTextSettings);
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.GetResultingTextSettings">ITextSettings.GetResultingTextSettings</see>
    /// </summary>
    function GetResultingTextSettings: TTextSettings;
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.GetStyledSettings">ITextSettings.GetStyledSettings</see>
    /// </summary>
    function GetStyledSettings: TStyledSettings;
    /// <summary> This is same as
    /// <see cref="FMX.Graphics|ITextSettings.SetStyledSettings">ITextSettings.SetStyledSettings</see>
    /// </summary>
    procedure SetStyledSettings(const Value: TStyledSettings);
    /// <summary> The current value of cell editor </summary>
    /// <returns> The cell editor value if <see cref="FMX.Grid|TGridModel.EditorMode">EditorMode</see> is <c>True</c>
    /// otherwise <c>TValue.Empty</c>
    /// </returns>
    function GetEditorValue: TValue;
    /// <summary> Same as <see cref="FMX.Controls|TTextSettingsInfo.Design">TTextSettingsInfo.Design</see> </summary>
    property Design: Boolean read GetDesign write SetDesign;
    /// <summary> This virtual method perform <see cref="FMX.Grid|TGridModel.OnGetValue">OnGetValue</see> event
    /// handler </summary>
    function DoGetValue(Col, Row: Integer): TValue; virtual;
    /// <summary> This virtual method perform <see cref="FMX.Grid|TGridModel.OnSetValue">OnSetValue</see> event
    /// handler </summary>
    procedure DoSetValue(Col, Row: Integer; const Value: TValue); virtual;
    /// <summary> This virtual method perform
    /// <see cref="FMX.Grid|TGridModel.OnCallbackGetValue">OnCallbackGetValue</see> event handler </summary>
    procedure DoCallbackGetValue(Col, Row: Integer; ACallback: TProc<TValue>); virtual;
    /// <summary> This virtual method is called after new column was added </summary>
    procedure DoColumnAdded(const Column: TColumn); virtual;
    /// <summary> This virtual method is called after column was deleted </summary>
    procedure DoColumnRemoved(const Column: TColumn); virtual;
    /// <summary> This virtual method is called after number of rows was changed </summary>
    procedure DoRowCountChanged(const OldValue, NewValue: Integer); virtual;
    /// <summary> This event handler is used to get cell data from the some custom defined source </summary>
    property OnGetValue: TOnGetValue read FOnGetValue write FOnGetValue;
    /// <summary> This property contains the cell values of grid.
    /// <para>See also <see cref="FMX.Grid|TGridModel.CreateCache">CreateCache</see>,
    /// <see cref="FMX.Grid|TGridModel.DataStored">DataStored</see></para> </summary>
    property Cache: TGridValues read FCache;
    /// <summary>This method should be used inside the Live Binding system to change current row. Use property
    /// <see cref="FMX.Grid|TGridModel.Row">Row</see> if you want change current row manually </summary>
    procedure SetSelected(const Value: Integer);
  public
    constructor Create(const AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary> Marks the start of an update session of this instance
    /// <para>See also <see cref="FMX.Grid|TGridModel.IsUpdating">IsUpdating</see>,
    /// <see cref="FMX.Grid|TGridModel.EndUpdate">EndUpdate</see></para>
    /// </summary>
    procedure BeginUpdate;
    /// <summary> Returns True if this instance is in the middle of one or more update sessions
    /// <para>See also <see cref="FMX.Grid|TGridModel.BeginUpdate">BeginUpdate</see>,
    /// <see cref="FMX.Grid|TGridModel.EndUpdate">EndUpdate</see>,
    /// <see cref="FMX.Grid|TGridModel.DoEndUpdate">DoEndUpdate</see></para>
    /// </summary>
    function IsUpdating: Boolean; inline;
    /// <summary> Marks the finish of an update session of this instance
    /// <para>See also <see cref="FMX.Grid|TGridModel.IsUpdating">IsUpdating</see>,
    /// <see cref="FMX.Grid|TGridModel.BeginUpdate">BeginUpdate</see></para>
    /// </summary>
    procedure EndUpdate;
    /// <summary> This method notifies the presentation, that in the column with the specified number have been some
    /// changes. If this method is executed between a <see cref="FMX.Grid|TGridModel.BeginUpdate">BeginUpdate</see>,
    /// <see cref="FMX.Grid|TGridModel.EndUpdate">EndUpdate</see>, the column is just marked as changed </summary>
    /// <remarks> You should not perform this method if size of column is changed. In this case use
    /// <see cref="FMX.Grid|TGridModel.ContentChanged">ContentChanged</see> </remarks>
    procedure ColumnChanged(const Index: Integer);
    /// <summary> This method notifies the presentation, that in the content of grid have been some changes (for example:
    /// size, count, order of columns or rows). If this method is executed between a
    /// <see cref="FMX.Grid|TGridModel.BeginUpdate">BeginUpdate</see>,
    /// <see cref="FMX.Grid|TGridModel.EndUpdate">EndUpdate</see>, the content is just marked as changed
    /// <para> See also <see cref="FMX.Grid|TGridModel.InvalidateContentSize">InvalidateContentSize</see> </para>
    /// </summary>
    procedure ContentChanged;
    /// <summary> This method notifies the presentation, that previously calculated content size is no longer relevant
    /// </summary>
    procedure InvalidateContentSize;
    /// <summary> This method notifies the presentation, that current row or column index is changed </summary>
    procedure SelectionChanged;
    /// <summary> Inserting a new column before the column with the specified number (with moving to right) </summary>
    procedure InsertColumn(const Index: Integer; const Column: TColumn);
    /// <summary> Deleting column with the specified order number </summary>
    procedure RemoveColumn(const Index: Integer);
    /// <summary> Changing order number and moving of the column </summary>
    procedure MoveColumn(const OldIndex, NewIndex: Integer);
    /// <summary> The height of the row. If <c>0</c>, then use the automatic value which derived from the font size
    /// See <b>EffectiveRowHeight</b></summary>
    property RowHeight: Single read FRowHeight write SetRowHeight;
    /// <summary> Real used the row height. See <b>RowHeight</b> </summary>
    property EffectiveRowHeight: Integer read GetEffectiveRowHeight;
    /// <summary> The number of rows </summary>
    property RowCount: Integer read FRowCount write SetRowCount;
    /// <summary> Specifies whether the presentation responds to mouse, keyboard, etc </summary>
    property Enabled: Boolean read FEnabled write SetEnabled;
    /// <summary> An array containing all the columns </summary>
    property Columns[const Index: Integer]: TColumn read GetColumns;
    /// <summary> The number of columns. See array <b>Columns</b> </summary>
    property ColumnCount: Integer read GetColumnCount;
    /// <summary> Returns the column number. If the column is not found, then -1 </summary>
    function IndexOfColumn(const Column: TColumn): Integer;
    /// <summary> Select the cell with the specified indexes of column and rows. Before changing selection the method
    /// <b>DoSelectCell</b> is called, after changing the method <b>DoSelChanged</b> is called </summary>
    procedure SelectCell(const ACol, ARow: Integer); overload;
    /// <summary> Displays the cell editor and sets the edit mode, if possible. See <b>CanEdit</b>, <b>RefreshEditor</b>
    /// </summary>
    procedure ShowEditor;
    /// <summary> Removes the cell editor and reset the edit mode. See <b>EditingDone</b></summary>
    /// <param name="Accept"> If <c>true</c>, we need to take the data from cell editor, otherwise in grid should remain
    /// old data </param>
    /// <remarks> If the parameter is missing, the behavior is determined by the presence option
    /// <b>CancelEditingByDefault</b> in <b>Options</b> </remarks>
    procedure HideEditor(const Accept: Boolean); overload;
    /// <summary> Send the <see cref="FMX.Grid|MM_POST_EDITOR_VALUE">MM_POST_EDITOR_VALUE</see> message to the
    /// presentation. This method is used in LiveBinding </summary>
    procedure PostEditorValue;
    /// <summary> Send the <see cref="FMX.Grid|MM_REFRESH_EDITOR_VALUE">MM_REFRESH_EDITOR_VALUE</see> message to the
    /// presentation. This method is used in LiveBinding </summary>
    procedure RefreshEditorValue;
    /// <summary> This method call <b>HideEditor</b> with parameter <b>Accept</b> which is <c>True</c>, in case if the
    /// property <b>Options</b> don't contains <b>CancelEditingByDefault</b></summary>
    procedure HideEditor; overload;
    /// <summary> This method returns a column and row of the cell that can be select after the defined cell </summary>
    /// <param name="RightToLeft"> <c>True</c> is if need search in the opposite direction. Usually the search is
    /// performed from left to right and top to bottom </param>
    /// <param name="OnlyRow"> <c>True</c> if allowed to change only the row number </param>
    /// <param name="Editing"> <c>True</c> if allowed go to only editable cells </param>
    /// <param name="ACol"> Before calling the column number from which begun searching, then column of desired cell
    /// </param>
    /// <param name="ARow"> Before calling the row number from which begun searching, then row of desired cell
    /// </param>
    /// <returns> <c>True</c> if found desired cell and <b>ACol</b>, <b>ARow</b> contain new correct values </returns>
    function FindNextCell(const RightToLeft, OnlyRow, Editing: Boolean; var ACol, ARow: Integer): Boolean;
    /// <summary> <c>True</c> if the grid is in edit mode of one cell </summary>
    property EditorMode: Boolean read GetEditorMode write SetEditorMode;
    /// <summary> This is various flags which responsible for the appearance and behavior of the grid </summary>
    property Options: TGridOptions read FOptions write SetOptions stored IsOptionsStored;
    /// <summary> Determines whether the <b>Cells</b> are painted with using default methods. If <c>False</c> then is
    /// using only user defined methods. See <b>DoDrawColumnCell</b>, <b>OnDrawColumnCell</b> </summary>
    property DefaultDrawing: Boolean read FDefaultDrawing write SetDefaultDrawing default True;
    /// <summary> This property is set by Live Binding. You cannot change <b>OnSetValue</b>, <b>OnCallbackGetValue</b>
    /// if this property is <c>True</c> </summary>
    property IsUsedInBinding: Boolean read FIsUsedInBinding write SetIsUsedInBinding;
    /// <summary> If <c>True</c>, then in the internal <see cref="FMX.Grid|TGridModel.Cache">Cache</see> stores all the
    /// data, otherwise only the currently visible </summary>
    property DataStored: Boolean read FDataStored write SetDataStored default False;
    /// <summary> Clear internal cache of values</summary>
    procedure ClearCache;
    /// <summary> Removes unused data from the cache. If the arguments are set, you will delete the data cells that are
    /// outside the specified coordinates. If the arguments are not set, you will delete only the data cells outside
    /// RowCount, ColumnCount. <para> See also DataStored, IsUsedInBinding</para> </summary>
    procedure ReduceCache; overload;
    procedure ReduceCache(const LeftColumn, TopRow, RigthColumn, BottomRow: Integer); overload;
    /// <summary> Clears and moving values of other columns to left.
    /// <para>See also <see cref="FMX.Grid|TGridModel.ClearColumnInCache">ClearColumnInCache</see></para> </summary>
    procedure RemoveColumnFromCache(const Index: Integer);
    /// <summary> Clears all values with the specified column number from the internal cache. The instances of objects
    /// will disposed.
    /// <para>See also <see cref="FMX.Grid|TGridModel.RemoveColumnFromCache">RemoveColumnFromCache</see>
    /// </para> </summary>
    procedure ClearColumnInCache(const Index: Integer);
    /// <summary> Clears and moving values of other rows to top.
    /// <para>See also <see cref="FMX.Grid|TGridModel.ClearRowInCache">ClearRowInCache</see></para> </summary>
    procedure RemoveRowFromCache(const Index: Integer);
    /// <summary> Clears all values with the specified row number from the internal cache. The instances of objects
    /// will disposed.
    /// <para>See also <see cref="FMX.Grid|TGridModel.RemoveRowFromCache">RemoveRowFromCache</see>
    /// </para> </summary>
    procedure ClearRowInCache(const Index: Integer);
    /// <summary> Moving all values of internal cache with the specified column number (from the old index to the new
    /// index) </summary>
    procedure MoveColumnInCache(const OldIndex, NewIndex: Integer);
    /// <summary> Move to right all values of internal cache with column number that greater or equal to the specified
    /// column number </summary>
    procedure InsertColumnIntoCache(const Index: Integer);
    /// <summary> Removes from the cache the value of one cell and invalidates the area of the cell </summary>
    procedure DataChanged(const ACol, ARow: Integer);
    /// <summary> Returns a value from a cell. See also <b>OnGetValue</b>, <b>OnCallbackGetValue</b>,
    /// <b>InvalidateCache</b> </summary>
    /// <param name="Col"> The column number of the cell </param>
    /// <param name="Row"> The row number of the cell </param>
    /// <param name="InvalidateCache"> If <c>False</c> then in order to speed up, the data are taken from the internal
    /// cache (if they are there). If <b>InvalidateCache</b> is <c>true</c>, then data are force taken from the data
    /// source </param>
    function GetValue(const Col, Row: Integer; const InvalidateCache: Boolean): TValue;
    /// <summary> The column number of selected cell. If <c>-1</c> then cell isn't selected </summary>
    property Col: Integer read FCol write SetCol;
    /// <summary> The row number of selected cell. If <c>-1</c> then row isn't selected </summary>
    property Row: Integer read FRow write SetRow;
    /// <summary> This object provide custom text properties </summary>
    property TextSettings: TTextSettings read GetTextSettings write SetTextSettings;
    /// <summary> This object provide default text properties (style of system defined) </summary>
    property DefaultTextSettings: TTextSettings read GetDefaultTextSettings write SetDefaultTextSettings;
    /// <summary> This property indicates whether the custom text settings is used or default </summary>
    property StyledSettings: TStyledSettings read GetStyledSettings write SetStyledSettings
      stored StyledSettingsStored nodefault;
    /// <summary> This property define a behavior after pressing key <b>Return</b> in cell editor </summary>
    property CellReturnAction: TCellReturnAction read FCellReturnAction write FCellReturnAction
      default TCellReturnAction.None;
    /// <summary> This event can by called from presentation (depends on the implementation) after
    /// clicking in column header </summary>
    property OnHeaderClick: THeaderClick read FOnHeaderClick write FOnHeaderClick;
    /// <summary> This event can by called from presentation (depends on the implementation) when
    /// clicking in grid cell after the selection was changed </summary>
    property OnCellClick: TCellClick read FOnCellClick write FOnCellClick;
    /// <summary> This event can by called from presentation (depends on the implementation) when
    /// double clicking in grid cell  after the selection was changed </summary>
    property OnCellDblClick: TCellClick read FOnCellDblClick write FOnCellDblClick;
    /// <summary> This event is called after successfully changing of column order </summary>
    property OnColumnMoved: TColumnMovedEvent read FOnColumnMoved write FOnColumnMoved;
    /// <summary> This event can by called from presentation (depends on the implementation) to
    /// draw header of column </summary>
    property OnDrawColumnHeader: TDrawColumnHeaderEvent read FOnDrawColumnHeader write FOnDrawColumnHeader;
    /// <summary> This event is called before changing of index selected row or column </summary>
    property OnSelectCell: TSelectCell read FOnSelectCell write FOnSelectCell;
    /// <summary> This event is called after successfully changing of index selected row or column </summary>
    property OnSelChanged: TNotifyEvent read FOnSelChanged write FOnSelChanged;
    /// <summary> This event can by called from presentation (depends on the implementation) to
    /// draw background of cell </summary>
    property OnDrawColumnBackground: TDrawColumnCellEvent read FOnDrawColumnBackground write FOnDrawColumnBackground;
    /// <summary> This event can by called from presentation (depends on the implementation) to
    /// draw cell </summary>
    property OnDrawColumnCell: TDrawColumnCellEvent read FOnDrawColumnCell write FOnDrawColumnCell;
    /// <summary> In this event handler you should call ACallback procedure for define value of cell.
    /// <para> See also <see cref="FMX.Grid|TGridModel.DoGetValue">DoGetValue</see>,
    /// <see cref="FMX.Grid|TGridModel.GetValue">GetValue</see></para> </summary>
    /// <remarks> It is used Live Binding </remarks>
    property OnCallbackGetValue: TOnCallbackGetValue read FOnCallbackGetValue write FOnCallbackGetValue;
    /// <summary> In this event handler you should setup value in some custom defined data after cell changing
    /// </summary>
    property OnSetValue: TOnSetValue read FOnSetValue write FOnSetValue;
    /// <summary> This event can by called from presentation (depends on the implementation) to create the custom
    /// defined cell editors </summary>
    property OnCreateCustomEditor: TCreateCustomEditorEvent read FOnCreateCustomEditor write FOnCreateCustomEditor;
    /// <summary> This event can by called from presentation (depends on the implementation) to
    /// create the custom defined cell editors </summary>
    property OnEditingDone: TOnEditingDone read FOnEditingDone write FOnEditingDone;
  end;

  /// <summary> This sparse array to store the values of any cells </summary>
  /// <remarks> The class TGridValues are owner of objects. If value contains some object then this object can be
  /// destroyed in methods SetCells, Clear, RemoveCell, etc </remarks>
  TGridValues = class(TDictionary<TGridModel.TCoord, TValue>)
  public type
    TCellRec = TPair<TGridModel.TCoord, System.Rtti.TValue>;
  private
    FOwner: TGridModel;
    function GetCells(const ACol, ARow: Integer): TValue;
    procedure SetCells(const ACol, ARow: Integer; const Value: TValue);
  protected
    /// <summary> Removing all items </summary>
    procedure Clear;
    /// <summary> Removing all items except those who included in the rectangle AExcepRect </summary>
    procedure Reduce(const AExcepRect: TGridModel.TRectCoord);
    /// <summary> Removing item by coordinates ACoord </summary>
    procedure RemoveCell(const ACoord: TGridModel.TCoord);
    /// <summary> Removing all items in which the row or col is equals Index </summary>
    /// <param name="Index"> The index of row or column </param>
    /// <param name="ByRow"> If <c>True</c> then Index contains Row index otherwise it contains Column index</param>
    /// <param name="OnlyClear"> If <c>True</c> then only the cells contents are cleared without moving</param>
    procedure RemoveCells(const Index: Integer; const ByRow, OnlyClear: Boolean);
    /// <summary> Change index of Column or Row </summary>
    /// <param name="OldIndex"> The original value of row or column </param>
    /// <param name="NewIndex"> The new value of row or column </param>
    /// <param name="ByRow"> If <c>True</c> then OldIndex, NewIndex contains Row indexes otherwise it contains Column
    /// indexes</param>
    procedure MoveCells(const OldIndex, NewIndex: Integer; const ByRow: Boolean);
    /// <summary> Inserts one column or row with a shift of cells right or down </summary>
    /// <param name="Index"> The order number of column or row </param>
    /// <param name="ByRow"> If <c>True</c> then Index contains Row indexes otherwise it contains Column
    /// indexes</param>
    procedure InsertCells(const Index: Integer; const ByRow: Boolean);
    /// <summary> Removing all items in which the column is equals ACol </summary>
    procedure RemoveColumn(const ACol: Integer; const OnlyClear: Boolean); inline;
    /// <summary> Removing all items in which the row is equals ARow </summary>
    procedure RemoveRow(const ARow: Integer; const OnlyClear: Boolean); inline;
    /// <summary> Change index of column </summary>
    procedure MoveColumn(const OldCol, NewCol: Integer); inline;
    /// <summary> Change index of row </summary>
    procedure MoveRow(const OldRow, NewRow: Integer); inline;
    /// <summary> Inserts one column with a shift of cells right </summary>
    procedure InsertColumn(const ACol: Integer); inline;
    /// <summary> Inserts one row with a shift of cells down </summary>
    procedure InsertRow(const ARow: Integer); inline;
    /// <summary> Check for equality of two values. This method is called in SetCells (see Cells) </summary>
    function IsEqual(const OldValue, NewValue: TValue): Boolean; virtual;
    /// <summary> This virtual method is called after you change the property Cells. This method not is called after
    /// other methods (Clear, RemoveRow, etc) </summary>
    procedure Changed(const ACoord: TGridModel.TCoord); virtual;
    /// <summary> The values of cells </summary>
    property Cells[const ACol, ARow: Integer]: TValue read GetCells write SetCells; default;
  public
    constructor Create(const AOwner: TGridModel); virtual;
    destructor Destroy; override;
    /// <summary> The value that have used in the constructor </summary>
    property Owner: TGridModel read FOwner;
  end;

  /// <summary> The base class of grid controls </summary>
  TCustomGrid = class(TCustomPresentedScrollBox, IItemsContainer, ITextSettings, IReadOnly, IGlyph)
  private
    FVKMessageId: Integer;
    FVKDisplacement: Boolean;
    FImageLink: TGlyphImageLink;
    { Trivial getters and setters that refer to Model }
    function GetIsUsedInBinding: Boolean;
    procedure SetIsUsedInBinding(const Value: Boolean);
    function GetRowHeight: Single; inline;
    procedure SetRowHeight(const Value: Single); inline;
    function GetRowCount: Integer; inline;
    procedure SetRowCount(const Value: Integer); inline;
    function GetOptions: TGridOptions; inline;
    procedure SetOptions(const Value: TGridOptions); inline;
    function OptionsStored: Boolean; inline;
    function GetDefaultDrawing: Boolean; inline;
    procedure SetDefaultDrawing(const Value: Boolean); inline;
    function GetCol: Integer; inline;
    procedure SetCol(const Value: Integer); inline;
    function GetRow: Integer; inline;
    procedure SetRow(const Value: Integer); inline;
    function GetOnHeaderClick: THeaderClick; inline;
    procedure SetOnHeaderClick(const Value: THeaderClick); inline;
    function GetOnColumnMoved: TColumnMovedEvent; inline;
    procedure SetOnColumnMoved(const Value: TColumnMovedEvent); inline;
    function GetOnDrawColumnHeader: TDrawColumnHeaderEvent; inline;
    procedure SetOnDrawColumnHeader(const Value: TDrawColumnHeaderEvent); inline;
    function GetOnSelectCell: TSelectCell; inline;
    procedure SetOnSelectCell(const Value: TSelectCell); inline;
    function GetOnSelChanged: TNotifyEvent; inline;
    procedure SetOnSelChanged(const Value: TNotifyEvent); inline;
    function GetOnDrawColumnBackground: TDrawColumnCellEvent; inline;
    procedure SetOnDrawColumnBackground(const Value: TDrawColumnCellEvent); inline;
    function GetOnDrawColumnCell: TDrawColumnCellEvent; inline;
    procedure SetOnDrawColumnCell(const Value: TDrawColumnCellEvent); inline;
    function GetOnCallbackGetValue: TOnCallbackGetValue; inline;
    procedure SetOnCallbackGetValue(const Value: TOnCallbackGetValue); inline;
    function GetOnGetValue: TOnGetValue; inline;
    procedure SetOnGetValue(const Value: TOnGetValue); inline;
    function GetOnSetValue: TOnSetValue; inline;
    procedure SetOnSetValue(const Value: TOnSetValue); inline;
    function GetOnCreateCustomEditor: TCreateCustomEditorEvent; inline;
    procedure SetOnCreateCustomEditor(const Value: TCreateCustomEditorEvent); inline;
    function GetOnEditingDone: TOnEditingDone; inline;
    procedure SetOnEditingDone(const Value: TOnEditingDone); inline;
    { Other getters and setters }
    function GetModel: TGridModel; overload;
    function GetColumnCount: Integer; inline;
    function GetColumns(Index: Integer): TColumn; inline;
    function GetVisibleColumnCount: Integer;
    function GetBottomRow: Integer;
    function GetTopRow: Integer;
    procedure SetTopRow(const Value: Integer);
    function GetVisibleRows: Integer;
    { ITextSettings }
    function GetDefaultTextSettings: TTextSettings; inline;
    function GetTextSettings: TTextSettings; inline;
    procedure SetTextSettings(const Value: TTextSettings); inline;
    function GetResultingTextSettings: TTextSettings; inline;
    function GetStyledSettings: TStyledSettings; inline;
    procedure SetStyledSettings(const Value: TStyledSettings); inline;
    function StyledSettingsStored: Boolean; inline;
    { IItemsContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetObject: TFmxObject;
    { IReadOnly }
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    { IGlyph }
    function GetImageIndex: TImageIndex;
    procedure SetImageIndex(const Value: TImageIndex);
    function GetImageList: TBaseImageList; inline;
    procedure SetImageList(const Value: TBaseImageList);
    function IGlyph.GetImages = GetImageList;
    procedure IGlyph.SetImages = SetImageList;
    procedure SetImages(const Value: TCustomImageList);
    function GetImages: TCustomImageList;

    function GetLeftColumn: Integer;
    function GetRightColumn: Integer;
    procedure SetLeftColumn(const Value: Integer);
    function ObserverCurrent: TVarRec;
    procedure ObserverToggle(const AObserver: IObserver; const Value: Boolean);
    procedure VKDisplacementHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
    procedure SetSelected(const Value: Integer); inline;
    function GetEditorMode: Boolean; inline;
    procedure SetEditorMode(const Value: Boolean); inline;
    function GetOnCellClick: TCellClick;
    procedure SetOnCellClick(const Value: TCellClick);
    function GetOnCellDblClick: TCellClick;
    procedure SetOnCellDblClick(const Value: TCellClick);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Loaded; override;
    procedure ContentAddObject(const AObject: TFmxObject); override;
    procedure ContentInsertObject(Index: Integer; const AObject: TFmxObject); override;
    procedure ContentBeforeRemoveObject(AObject: TFmxObject); override;
    function CreateScrollContent: TScrollContent; override;
    function DefineModelClass: TDataModelClass; override;
    procedure SetEnabled(const Value: Boolean); override;
    function GetDefaultSize: TSizeF; override;
    procedure DoBeginUpdate; override;
    procedure DoEndUpdate; override;
    procedure ImagesChanged; virtual;
    { observers }
    function CanObserve(const ID: Integer): Boolean; override;
    procedure ObserverAdded(const ID: Integer; const Observer: IObserver); override;
    procedure AfterPaint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BeforeDestruction; override;
    procedure UnloadPresentation; override;
    property AniCalculations;
    property Anchors;
    property CanFocus default False;
    property Enabled;
    property Visible;
    /// <summary> The removing and destroying all columns </summary>
    procedure ClearColumns;
    /// <summary> Returns some column by number. If the column with that number don't exist, then <c>nil</c></summary>
    function ColumnByIndex(const Idx: Integer): TColumn;
    /// <summary> Determine indexes column and row of cell by local coordinates. See <b>MouseDown</b>, <b>MouseUp</b> </summary>
    /// <param name="X"> Local position by horizontal</param>
    /// <param name="Y"> Local position by vertical</param>
    /// <param name="ACol"> The column number. If <b>X</b> is beyond the horizontal boundary of the grid, then <c>-1</c>
    /// </param>
    /// <param name="ARow"> The column number. If <b>Y</b> is beyond the vertical boundary of the grid, then <c>-1</c>
    /// </param>
    /// <returns> <c>True</c> in case if <b>ACol</b> and <b>ARow</b> contains correct values</returns>
    function CellByPoint(const X, Y: Single; var ACol, ARow: Integer): Boolean;
    function ColumnByPoint(const X, Y: Single): TColumn;
    function RowByPoint(const X, Y: Single): Integer;
    /// <summary> Obtain the coordinates of the rectangle for the cell which is specified by row <b>ARow</b> and column
    /// <b>ACol</b>. Numbering of columns and rows starts at zero </summary>
    /// <param name="ACol"> The column number can have a value from 0 to ColumnCount </param>
    /// <param name="ARow"> The row number can have a value from 0 to RowCount </param>
    /// <returns><para>The coordinates of a cell don't include the borders</para>
    /// <para> If you specify numbers of row or column that are equal to the RowCount or ColumnCount, then the
    /// coordinates of the top left corner of the returned rectangle will correspond to the next one to the last cell
    /// </para>
    /// <para> If you specify an invalid value then exception won't be raised and a rectangle will return with
    /// coordinates <c>-1, -1, -1, -1</c></para>
    /// </returns>
    function CellRect(const ACol, ARow: Integer): TRect; overload;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.SelectCell">Model.SelectCell</see> </summary>
    procedure SelectCell(Col, Row: Integer); inline;
    /// <summary> Select the cell with the specified column index and old row index.
    /// <para> See also <see cref="FMX.Grid|TGridModel.SelectCell">Model.SelectCell</see> </para> </summary>
    procedure SelectColumn(const Value: Integer); inline;
    /// <summary> Select the cell with the specified row index and old column index.
    /// <para> See also <see cref="FMX.Grid|TGridModel.SelectCell">Model.SelectCell</see> </para> </summary>
    procedure SelectRow(const Value: Integer); inline;
    /// <summary> Determine whether we can edit the selected cell taking into account the current settings of the column
    /// and grid </summary>
    function CanEdit: Boolean;
    /// <summary> Moves the <b>ViewPortPosition</b> so that in the top left corner there was a cell with the specified
    /// column and row </summary>
    procedure SetTopLeft(const ACol, ARow: Integer); overload;
    /// <summary> Returns the number of cells that are at least partially visible </summary>
    /// <param name="TopLeft"> The column and row indexes of the top left cell </param>
    /// <param name="BottomRight"> The column and row indexes of the bottom right cell </param>
    /// <returns> <c>True</c> if something was returned in the arguments </returns>
    function DisplayCells(var TopLeft, BottomRight: TGridModel.TCoord): Boolean;
    /// <summary> Moves <b>ViewPortPosition</b> thus, to see the selected cell </summary>
    procedure ScrollToSelectedCell;
    /// <summary> The data model of this control </summary>
    property Model: TGridModel read GetModel;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.TextSettings">Model.TextSettings</see></summary>
    property TextSettings: TTextSettings read GetTextSettings write SetTextSettings;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.StyledSettings">Model.StyledSettings</see></summary>
    property StyledSettings: TStyledSettings read GetStyledSettings write SetStyledSettings
      stored StyledSettingsStored nodefault;
    ///<summary> The list of images. Can be <c>nil</c>. To display images you have to use
    /// <see cref="FMX.Grid|TGlyphColumn">TGlyphColumn</see> <para>See also <see cref="FMX.ActnList|IGlyph">IGlyph</see>
    ///</para></summary>
    property Images: TCustomImageList read GetImages write SetImages;

    property Columns[Index: Integer]: TColumn read GetColumns;
    property ColumnCount: Integer read GetColumnCount;
    /// <summary> The changing of this property does not changes the current row in the dataset  (if you are using the
    /// Live Binding). See also <see cref="FMX.Grid|TGridModel.SetSelected">Model.SetSelected</see>
    /// </summary>
    /// <remarks> Use this property if you change the row index a program way otherwise use
    /// <see cref="FMX.Grid|TCustomGrid.Row">Row</see> property </remarks>
    property Selected: Integer read GetRow write SetSelected;
    property TopRow: Integer read GetTopRow write SetTopRow;
    property BottomRow: Integer read GetBottomRow;
    /// <summary> The sequence number of first column, which is at least partially visible in work area of grid
    /// </summary>
    property LeftColumn: Integer read GetLeftColumn write SetLeftColumn;
    /// <summary> The sequence number of the far right column, which is at least partially visible in work area of grid
    /// </summary>
    property RightColumn: Integer read GetRightColumn;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly stored False;
    { These properties are retained only for compatibility }
    property ColumnIndex: Integer read GetCol write SetCol;
    property VisibleColumnCount: Integer read GetVisibleColumnCount;
    property VisibleRows: Integer read GetVisibleRows;
    { These duplicate properties model's }
    /// <summary> This flag indicates that the Live Bindings is used to display data </summary>
    property IsUsedInBinding: Boolean read GetIsUsedInBinding write SetIsUsedInBinding;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.RowHeight">Model.RowHeight</see></summary>
    property RowHeight: Single read GetRowHeight write SetRowHeight;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.RowCount">Model.RowCount</see></summary>
    property RowCount: Integer read GetRowCount write SetRowCount default 100;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.Options">Model.Options</see></summary>
    property Options: TGridOptions read GetOptions write SetOptions stored OptionsStored;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.DefaultDrawing">Model.DefaultDrawing</see></summary>
    property DefaultDrawing: Boolean read GetDefaultDrawing write SetDefaultDrawing default True;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.EditorMode">Model.EditorMode</see></summary>
    property EditorMode: Boolean read GetEditorMode write SetEditorMode;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.Col">Model.Col</see></summary>
    property Col: Integer read GetCol write SetCol;
    /// <summary> The changing of this property changes the current row in the dataset  (if you are using the Live
    /// Binding). See also <see cref="FMX.Grid|TGridModel.Row">Model.Row</see>
    /// </summary>
    /// <remarks> Use this property if you change row index as a result of user input otherwise use
    /// <see cref="FMX.Grid|TCustomGrid.Selected">Selected</see> property </remarks>
    property Row: Integer read GetRow write SetRow;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnHeaderClick">Model.OnHeaderClick</see></summary>
    property OnHeaderClick: THeaderClick read GetOnHeaderClick write SetOnHeaderClick;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnCellClick">Model.OnCellClick</see></summary>
    property OnCellClick: TCellClick read GetOnCellClick write SetOnCellClick;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnCellDblClick">Model.OnCellDblClick</see></summary>
    property OnCellDblClick: TCellClick read GetOnCellDblClick write SetOnCellDblClick;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnColumnMoved">Model.OnColumnMoved</see></summary>
    property OnColumnMoved: TColumnMovedEvent read GetOnColumnMoved write SetOnColumnMoved;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnDrawColumnHeader">Model.OnDrawColumnHeader</see></summary>
    property OnDrawColumnHeader: TDrawColumnHeaderEvent read GetOnDrawColumnHeader write SetOnDrawColumnHeader;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnSelectCell">Model.OnSelectCell</see></summary>
    property OnSelectCell: TSelectCell read GetOnSelectCell write SetOnSelectCell;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnSelChanged">Model.OnSelChanged</see></summary>
    property OnSelChanged: TNotifyEvent read GetOnSelChanged write SetOnSelChanged;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnDrawColumnBackground">Model.OnDrawColumnBackground</see>
    /// </summary>
    property OnDrawColumnBackground: TDrawColumnCellEvent read GetOnDrawColumnBackground
      write SetOnDrawColumnBackground;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnDrawColumnCell">Model.OnDrawColumnCell</see></summary>
    property OnDrawColumnCell: TDrawColumnCellEvent read GetOnDrawColumnCell write SetOnDrawColumnCell;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnCallbackGetValue">Model.OnCallbackGetValue</see></summary>
    property OnCallbackGetValue: TOnCallbackGetValue read GetOnCallbackGetValue write SetOnCallbackGetValue;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnGetValue">Model.OnGetValue</see></summary>
    property OnGetValue: TOnGetValue read GetOnGetValue write SetOnGetValue;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnSetValue">Model.OnSetValue</see></summary>
    property OnSetValue: TOnSetValue read GetOnSetValue write SetOnSetValue;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnCreateCustomEditor">Model.OnCreateCustomEditor</see></summary>
    property OnCreateCustomEditor: TCreateCustomEditorEvent read GetOnCreateCustomEditor write SetOnCreateCustomEditor;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.OnEditingDone">Model.OnEditingDone</see></summary>
    property OnEditingDone: TOnEditingDone read GetOnEditingDone write SetOnEditingDone;
  end;

  /// <summary> The grid component for displaying different data.
  /// <para>To data access use events <see cref="FMX.Grid|TCustomGrid.OnGetValue">OnGetValue</see>,
  /// <see cref="FMX.Grid|TCustomGrid.OnSetValue">OnSetValue</see> </para> </summary>
  TGrid = class(TCustomGrid)
  protected
    function GetDefaultStyleLookupName: string; override;
    procedure DoEndUpdate; override;
  published
    property Anchors;
    property Align;
    property CanFocus;
    property CanParentFocus;
    property ClipChildren;
    property ClipParent;
    property ControlType;
    property Cursor;
    property DisableFocusEffect;
    property DragMode;
    property EnableDragHighlight;
    property Enabled;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest;
    property Locked;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property ReadOnly;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TextSettings;
    property StyledSettings;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property RowHeight;
    property RowCount;
    property Options;
    property Images;

    property DefaultDrawing;
    property OnHeaderClick;
    property OnColumnMoved;
    property OnDrawColumnHeader;
    property OnSelectCell;
    property OnSelChanged;
    property OnDrawColumnBackground;
    property OnDrawColumnCell;
    property OnGetValue;
    property OnSetValue;
    property OnCreateCustomEditor;
    property OnEditingDone;
    property OnResize;
    property OnResized;
    property OnCellClick;
    property OnCellDblClick;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
  end;

  /// <summary> The model for the grid, which stores the string values. This class has
  /// <see cref="FMX.Grid|TGridModel.DataStored">DataStored</see> property is <c>True</c> </summary>
  TStringGridModel = class(TGridModel)
  private
    FCellsChanging: Boolean;
    function GetCells(const ACol, ARow: Integer): string;
    procedure SetCells(const ACol, ARow: Integer; const Value: string);
  protected
    /// <summary> This virtual method is called from then
    /// <see cref="FMX.Grid|TGridValues.Changed">TGridValues.Changed</see> method.
    /// </summary>
    procedure ValueChanged(const ACoord: TGridModel.TCoord); virtual;
    function CreateCache: TGridValues; override;
    function DoGetValue(Col, Row: Integer): TValue; override;
    procedure DoSetValue(Col, Row: Integer; const Value: TValue); override;
  public
    constructor Create(const AOwner: TComponent); override;
    /// <summary> Same as <see cref="FMX.Grid|TGridValues.Cells">TGridValues.Cells</see> but converted to string
    /// <para> See also <see cref="FMX.Grid|TGridModel.Cache">TGridModel.Cache</see></para> </summary>
    property Cells[const ACol, ARow: Integer]: string read GetCells write SetCells;
  end;

  /// <summary> The grid component for displaying and storing string values
  /// <para>To data access use property <see cref="FMX.Grid|TStringGrid.Cells">Cells</see> </para> </summary>
  TStringGrid = class(TCustomGrid)
  private
    function GetCells(const ACol, ARow: Integer): string;
    procedure SetCells(const ACol, ARow: Integer; const Value: string);
    function GetModel: TStringGridModel; overload;
  protected
    function GetDefaultStyleLookupName: string; override;
    function DefineModelClass: TDataModelClass; override;
  public
    /// <summary> The data model of this control </summary>
    property Model: TStringGridModel read GetModel;
    /// <summary> Same as <see cref="FMX.Grid|TStringGridModel.Cells">Model.Cells</see> </summary>
    property Cells[const ACol, ARow: Integer]: string read GetCells write SetCells;
  published
    property Anchors;
    property Align;
    property CanFocus;
    property CanParentFocus;
    property ClipChildren;
    property ClipParent;
    property ControlType;
    property Cursor;
    property DisableFocusEffect;
    property DragMode;
    property EnableDragHighlight;
    property Enabled;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest;
    property Locked;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property ReadOnly;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TextSettings;
    property StyledSettings;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property RowHeight;
    property RowCount;
    property Options;
    property DefaultDrawing;
    property Images;

    property OnApplyStyleLookup;
    property OnHeaderClick;
    property OnColumnMoved;
    property OnDrawColumnHeader;
    property OnSelectCell;
    property OnSelChanged;
    property OnDrawColumnBackground;
    property OnDrawColumnCell;
    property OnCreateCustomEditor;
    property OnEditingDone;
    property OnResize;
    property OnResized;
    property OnCellClick;
    property OnCellDblClick;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
  end;

  /// <summary> This class is designed to manage a list of column classes that are available in the IDE editors
  /// </summary>
  TColumnClasses = class sealed
  private
    class var FRegisteredColumns: TList<TColumnClass>;
    class var FUninitialized: Boolean;
    class procedure Uninitialize;
  public
    /// <summary> Add several classes of columns to the list of registered classes </summary>
    /// <remarks> Also registers classes with the use of the procedure <b>RegisterFmxClasses</b> </remarks>
    class procedure &Register(const RegColumns: array of TColumnClass);
    /// <summary> Remove several classes of columns from the list of registered classes. If some class was not
    /// registered then it is ignored.</summary>
    /// <remarks> Also unregisters classes with the use of the procedure <b>UnRegisterClass</b> </remarks>
    class procedure Unregister(const RegColumns: array of TColumnClass);
    /// <summary> This function returns array of all registered column classes </summary>
    class function RegisteredColumns: TArray<TColumnClass>;
    /// <summary> This function returns <c>True</c> if <b>AClass</b> is registered, otherwise it returns <c>False</c>
    /// </summary>
    class function IsRegistered(const AClass: TComponentClass): Boolean;
  end;

implementation

uses
  {$IFDEF MACOS}Macapi.CoreFoundation,{$ENDIF}
  {$IFDEF IOS}FMX.Grid.iOS, {$ENDIF}
  System.RTLConsts, System.Character, System.Math, System.Actions, System.TypInfo, FMX.Consts, System.Math.Vectors,
  FMX.Objects, FMX.Presentation.Factory, FMX.Edit, FMX.StdCtrls, FMX.Ani, FMX.Forms, FMX.Styles.Objects, FMX.Styles;

{ TColumn }

constructor TColumn.Create(AOwner: TComponent);
begin
  inherited;
  SetAcceptsControls(False);
  FNeedCreateCellControl := True;
  Padding.DefaultValue := TRectF.Create(HorzTextMargin, VertTextMargin, HorzTextMargin, VertTextMargin);
  Padding.Rect := Padding.DefaultValue;
  HitTest := False;
  Locked := False;
  FColumnVisible := True;
  inherited Visible := FColumnVisible;
end;

destructor TColumn.Destroy;
begin
  FreeAndNil(FLayout);
  FDrawableCell := nil;
  if FCellObject is TComponent then
  begin
    TComponent(FCellObject).RemoveFreeNotification(Self);
    FCellObject.DisposeOf;
    FCellObject := nil;
  end;
  inherited;
end;

procedure TColumn.Paint;
begin
  if (csDesigning in ComponentState) and not Locked and Visible then
    DrawDesignBorder;
  inherited;
end;

procedure TColumn.DefineProperties(Filer: TFiler);
const
  OldPropertyNames: array of string = [
    'Position.X',
    'Position.Y',
    'Size.Height',
    'Size.PlatformDefault',
    'Align',
    'ClipChildren',
    'ClipParent',
    'Cursor',
    'DragMode',
    'EnableDragHighlight',
    'Height',
    'HitTest',
    'RotationAngle',
    'RotationCenter',
    'Scale',
    'Size',
    'TabOrder',
    'TabStop',
    'TouchTargetExpansion',
    'OnApplyStyleLookup',
    'OnKeyDown',
    'OnKeyUp',
    'OnCanFocus',
    'OnClick',
    'OnDblClick',
    'OnEnter',
    'OnExit',
    'OnMouseDown',
    'OnMouseMove',
    'OnMouseUp',
    'OnMouseWheel',
    'OnMouseEnter',
    'OnMouseLeave'];
var
  I: Integer;
begin
  inherited;
  Filer.DefineProperty('Size.Width', ReadWidth, WriteWidth, not SameValue(Width, GetDefaultSize.cx, 0.5));
  for I := Low(OldPropertyNames) to High(OldPropertyNames) do
    Filer.DefineProperty(OldPropertyNames[I], SkipOldProperty, nil, False);
end;

procedure TColumn.ReadWidth(Reader: TReader);
begin
  Width := Reader.ReadFloat;
end;

function TColumn.RectPlaceIntoBounds(const Source, Bounds: TRectF): TRectF;
begin
  if TStyledSetting.Other in Model.StyledSettings then
    Result := Source.PlaceInto(Bounds)
  else
    Result := Source.PlaceInto(Bounds, DefaultTextSettings.HorzAlign.AsHorzRectAlign,
      DefaultTextSettings.VertAlign.AsVertRectAlign);
end;

procedure TColumn.WriteWidth(Writer: TWriter);
begin
  Writer.WriteFloat(Width);
end;

procedure TColumn.SkipOldProperty(Reader: TReader);
begin
  Reader.SkipValue;
end;

procedure TColumn.UpdateCell(const ARow: Integer);
var
  NeedUpdateEditor: Boolean;
  LCoord: TGridModel.TCoord;
begin
  if not FEditorStateChanging and (Model <> nil) and (Model.Cache <> nil) and (ARow >= 0) and
    (ARow < Model.RowCount) then
  begin
    LCoord.Col := Model.IndexOfColumn(Self);
    LCoord.Row := ARow;
    if LCoord.Col >= 0 then
    begin
      FEditorStateChanging := True;
      try
        NeedUpdateEditor := Model.EditorMode and (Model.Col = LCoord.Col) and (Model.Row = LCoord.Row);
        if NeedUpdateEditor then
          Model.HideEditor(False);
        Model.DataChanged(LCoord.Col, LCoord.Row);
        if NeedUpdateEditor then
          Model.ShowEditor;
      finally
        FEditorStateChanging := False;
      end;
    end;
  end;
end;

procedure TColumn.Changed;
var
  I: Integer;
begin
  if Model <> nil then
  begin
    I := Model.IndexOfColumn(Self);
    if I >= 0 then
      Model.ColumnChanged(I);
  end;
end;

procedure TColumn.ChangeOrder;
var
  OldIndex, NewIndex: Integer;
begin
  inherited;
  if (Model <> nil) and (not Model.FOrderChanging) then
  begin
    OldIndex := Model.IndexOfColumn(Self);
    if OldIndex >= 0 then
    begin
      NewIndex := Min(Index, Model.ColumnCount);
      if OldIndex <> NewIndex then
        Model.MoveColumn(OldIndex, NewIndex);
    end;
  end;
end;

procedure TColumn.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FCellObject) then
  begin
    FCellObject := nil;
    FDrawableCell := nil;
  end;
end;

procedure TColumn.Init;
var
  LParent: TFmxObject;
begin
  if FCellObject is TComponent then
  begin
    TComponent(FCellObject).RemoveFreeNotification(Self);
    FCellObject.DisposeOf;
    FCellObject := nil;
  end;
  FDrawableCell := nil;
  FPresentedControl := nil;
  FModel := nil;
  FNeedCreateCellControl := True;

  LParent := Parent;
  while (LParent <> nil) and not (LParent is TPresentedControl) do
    LParent := LParent.Parent;
  if LParent <> nil then
  begin
    FPresentedControl := TPresentedControl(LParent);
    if FPresentedControl.Model is TGridModel then
      FModel := TGridModel(FPresentedControl.Model);
  end;
end;

procedure TColumn.Loaded;
begin
  inherited;
  Init;
end;

procedure TColumn.AncestorParentChanged;
begin
  inherited;
  Init;
end;

procedure TColumn.Resize;
begin
  inherited;
  if Model <> nil then
  begin
    if not FDisableAlign then
      Changed;
    Model.ContentChanged;
  end;
end;

function TColumn.GetObservers: TObservers;
begin
  if PresentedControl <> nil then
    Result := PresentedControl.Observers
  else
    Result := inherited;
end;

function TColumn.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(100, 21);
end;

function TColumn.GetDefaultTextSettings: TTextSettings;
begin
  Result := Model.GetResultingTextSettings;
end;

function TColumn.GetDrawableCell: IDrawableCell;
begin
  if CellObject <> nil then
    Result := FDrawableCell
  else
    Result := nil;
end;

function TColumn.GetCellObject: TObject;
var
  Info: TGridModel.TCellObjectInfo;
begin
  if FNeedCreateCellControl and (FCellObject = nil) then
  begin
    Info.Column := Self;
    Info.CellObject := nil;
    FNeedCreateCellControl := False;
    Model.SendMessageWithResult<TGridModel.TCellObjectInfo>(PM_CREATE_CELL_OBJECT, Info);
    FCellObject := Info.CellObject;
    if FCellObject is TComponent then
      TComponent(FCellObject).FreeNotification(Self);
    Supports(FCellObject, IDrawableCell, FDrawableCell);
    UpdateReadOnly(FCellObject);
  end;
  Result := FCellObject;
end;

procedure TColumn.DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
  const State: TGridDrawStates);
begin
  FLayout.TopLeft := Bounds.TopLeft;
  FLayout.MaxSize := PointF(Bounds.Width, Bounds.Height);
  try
    FLayout.Text := ValueToString(Value);
  except
    FLayout.Text := SMsgDlgError;
  end;
  FLayout.RenderLayout(Canvas);
end;

function TColumn.CanEdit: Boolean;
begin
  Result := True;
end;

function TColumn.RefreshEditor(const InplaceEdit: TObject; const Value: TValue): Boolean;
var
  LReadOnly: Boolean;
begin
  LReadOnly := FReadOnly;
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
  begin
    if not LReadOnly then
      LReadOnly := TLinkObservers.EditGridLinkIsReadOnly(Observers);
  end;
  Result := UpdateReadOnly(InplaceEdit) or not LReadOnly;
  if Result then
    if LReadOnly then
      FEditorState := TEditorState.ReadOnly
    else
      FEditorState := TEditorState.Unmodified
  else
    FEditorState := TEditorState.None;
end;

function TColumn.DoEditorModified: Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
  begin
    Result := TLinkObservers.EditGridLinkEdit(Observers);
    if Result then
      TLinkObservers.EditGridLinkModified(Observers)
    else
      TLinkObservers.EditGridLinkReset(Observers);
  end
  else
    Result := True;
end;

procedure TColumn.EditorModified;
begin
  if not FEditorStateChanging and Model.EditorMode and (FEditorState = TEditorState.Unmodified) then
  begin
    FEditorStateChanging := True;
    try
      if DoEditorModified then
        FEditorState := TEditorState.Modified;
    finally
      FEditorStateChanging := False;
    end;
    if FEditorState <> TEditorState.Modified then
      UpdateCell(Model.Row);
  end;
end;

function TColumn.ValidChar(const KeyChar: Char): Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
    Result := TLinkObservers.EditGridLinkIsValidChar(Observers, KeyChar)
  else
    Result := True;
end;

function TColumn.EditingDone(const InplaceEdit: TObject; const Value: TValue; const Accept: Boolean): Boolean;
begin
  Result := False;
  if Accept then
  begin
    Result := PostEditorValue(InplaceEdit, Value);
    if Result then
      if Assigned(Model.OnEditingDone) then
        Model.OnEditingDone(PresentedControl, Model.IndexOfColumn(Self), Model.Row);
  end
  else if FEditorState = TEditorState.Modified then
    EditingCancelled;

  FEditorState := TEditorState.None;
end;

procedure TColumn.EditingCancelled;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) and TLinkObservers.EditGridLinkIsEditing(Observers) then
    TLinkObservers.EditGridLinkReset(Observers);
end;

function TColumn.PostEditorValue(const InplaceEdit: TObject; const Value: TValue): Boolean;
var
  LCoord: TGridModel.TCoord;
  LinkEditing: Boolean;
begin
  Result := False;
  LinkEditing := False;
  LCoord.Col := Model.IndexOfColumn(Self);
  LCoord.Row := Model.Row;
  if LCoord.Col >= 0 then
  begin
    if not Model.DataStored or Model.IsUsedInBinding then
      Model.ClearRowInCache(LCoord.Row);
    Result := True;
    if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
    begin
      LinkEditing := TLinkObservers.EditGridLinkIsEditing(Observers);
      Result := LinkEditing;
    end;
    if Result then
    begin
      try
        Model.DoSetValue(LCoord.Col, LCoord.Row, Value);
        if LinkEditing then
          TLinkObservers.EditGridLinkUpdate(Observers);
      except
        if LinkEditing then
          TLinkObservers.EditGridLinkReset(Observers);
        raise;
      end;
    end;
   end;
end;

procedure TColumn.BeforeDrawing(const Canvas: TCanvas);
begin
  if CellObject is TStyledControl then
    TStyledControl(CellObject).ApplyStyleLookup;

  if FLayout = nil then
    FLayout := TTextLayoutManager.DefaultTextLayout.Create(Canvas);
  FLayout.BeginUpdate;
  try
    FLayout.Text := string.Empty;
    FLayout.Opacity := AbsoluteOpacity;
    if not Enabled then
      FLayout.Opacity := FLayout.Opacity * DisabledOpacity;
    FLayout.HorizontalAlign := DefaultTextSettings.HorzAlign;
    FLayout.VerticalAlign := DefaultTextSettings.VertAlign;
    FLayout.Font.Assign(DefaultTextSettings.Font);
    FLayout.Color := DefaultTextSettings.FontColor;
    FLayout.Trimming := DefaultTextSettings.Trimming;
    FLayout.WordWrap := DefaultTextSettings.WordWrap;
  finally
    FLayout.EndUpdate;
  end;
  if DrawableCell <> nil then
    DrawableCell.BeforeDrawing(Canvas);
end;

procedure TColumn.AfterDrawing(const Canvas: TCanvas);
begin
  if DrawableCell <> nil then
    DrawableCell.AfterDrawing(Canvas);
end;

procedure TColumn.DrawBackground(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
  const State: TGridDrawStates);
begin
  if Model <> nil then
    Model.DoDrawColumnBackground(Canvas, Self, Bounds, Row, Value, State);
end;

procedure TColumn.DrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer; const Value: TValue;
  const State: TGridDrawStates);
begin
  if Model <> nil then
  begin
    if Model.DefaultDrawing then
    begin
      if DrawableCell <> nil then
        DrawableCell.DrawCell(Canvas, Bounds, Row, Value, State);
      DefaultDrawCell(Canvas, Bounds, Row, Value, State);
    end;
    Model.DoDrawColumnCell(Canvas, Self, Bounds, Row, Value, State);
  end;
end;

type
  TOpenControl = class(TControl);

procedure TColumn.SetBounds(X, Y, AWidth, AHeight: Single);
  function GetControlCenterX(const AControl: TControl): Single;
  begin
    Result := AControl.Position.X + AControl.Width / 2;
  end;
  function FindClosestColumn(const CurrentIndex: Integer; const CenterX: Single): Integer;
  var
    I: Integer;
    Distance, MinDistance: Single;
  begin
    MinDistance := MaxInt;
    Result := -1;
    for I := 0 to Model.ColumnCount - 1 do
      if I <> CurrentIndex then
      begin
        Distance := Abs(GetControlCenterX(Model.Columns[I]) - CenterX);
        if Distance < MinDistance then
        begin
          Result := I;
          MinDistance := Distance;
        end;
      end;
  end;
  procedure AdjustColumns(CurrentIndex: Integer; const ClosestIndex: Integer; const CenterX: Single);
  begin
    if GetControlCenterX(Model.Columns[CurrentIndex]) < CenterX then
    begin
      if CurrentIndex < ClosestIndex then
        Inc(CurrentIndex);
    end
    else if CurrentIndex > ClosestIndex then
      Dec(CurrentIndex);
    if InRange(CurrentIndex, 0, Model.ColumnCount - 1) and (CurrentIndex <> ClosestIndex) then
      Model.MoveColumn(ClosestIndex, CurrentIndex)
    else
    begin
      if not FDisableAlign then
        Changed;
      Model.ContentChanged;
    end;
  end;

var
  CurrentIndex, ClosestIndex: Integer;
  CenterX: Single;
begin
  if (Parent is TControl) and (not TOpenControl(Parent).FDisableAlign) and (Model <> nil) and (Model.ColumnCount > 1)
  then
  begin
    CenterX := X + AWidth / 2;
    CurrentIndex := Model.IndexOfColumn(Self);
    ClosestIndex := FindClosestColumn(CurrentIndex, CenterX);
    inherited SetBounds(Position.X, Position.Y, AWidth, Height);
    AdjustColumns(ClosestIndex, CurrentIndex, CenterX);
    ClearCacheIfNeed;
  end
  else
    inherited;
end;

function TColumn.GetEffectiveVisible: Boolean;
begin
  Result := inherited Visible;
end;

function TColumn.GetInEditMode: Boolean;
begin
  Result := (Model <> nil) and Model.EditorMode and (Model.IndexOfColumn(Self) = Model.Col);
end;

procedure TColumn.SetColumnVisible(const Value: Boolean);
begin
  if FColumnVisible <> Value then
  begin
    FColumnVisible := Value;
    inherited Visible := (csDesigning in ComponentState) or FColumnVisible;
  end;
end;

function TColumn.GetAbsoluteOpacity: Single;
begin
  Result := inherited;
  if not Visible then
    Result := Result * DefaultDisabledOpacity;
end;

procedure TColumn.EnabledChanged;
begin
  inherited;
  if Model <> nil then
  begin
    if not Enabled then
      Model.HideEditor(False);
    Changed;
  end;
end;

function TColumn.GetText: string;
begin
  Result := FHeader;
end;

procedure TColumn.SetHeader(const Value: string);
begin
  if FHeader <> Value then
  begin
    FHeader := Value;
    Changed;
  end;
end;

function TColumn.UpdateReadOnly(const InplaceEdit: TObject): Boolean;
var
  LReadOnly: IReadOnly;
begin
  Result := Supports(InplaceEdit, IReadOnly, LReadOnly);
  if Result then
    LReadOnly.ReadOnly := FReadOnly or (Observers.IsObserving(TObserverMapping.EditGridLinkID) and
      TLinkObservers.EditGridLinkIsReadOnly(Observers));
end;

function TColumn.GetReadOnly: Boolean;
begin
  Result := FReadOnly;
end;

procedure TColumn.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly <> Value then
  begin
    FReadOnly := Value;
    UpdateReadOnly(FCellObject);
  end;
end;

procedure TColumn.ClearCacheIfNeed;
var
  I: Integer;
begin
  if (Model <> nil) and (not Model.DataStored) and ((not EffectiveVisible) or (Width <= 0)) then
  begin
    I := Model.IndexOfColumn(Self);
    if I >= 0 then
      Model.ClearColumnInCache(I);
  end;
end;

procedure TColumn.VisibleChanged;
begin
  inherited;
  if not (inherited Visible) and (Model <> nil) then
  begin
    Model.HideEditor(False);
    ClearCacheIfNeed;
  end;
  Changed;
end;

function TColumn.TextStored: Boolean;
begin
  Result := (not FHeader.IsEmpty and not ActionClient) or (not (ActionClient and (ActionLink <> nil) and
    ActionLink.CaptionLinked and (Action is TContainedAction)));
end;

class function TColumn.ValueIsEmpty(const Value: TValue): Boolean;
var
  S: string;
  D: Double;
begin
  Result := Value.IsEmpty or ((Value.Kind in [tkString, tkChar, tkWChar, tkLString, tkWString, tkUString]) and
    Value.TryAsType<string>(S) and S.IsEmpty) or ((Value.Kind = tkFloat) and Value.TryAsType<Double>(D) and IsNan(D)) or
    (Value.IsObject and (Value.AsObject = nil));
end;

function TColumn.ValueToString(const Value: TValue): string;
var
  LStrings: TStrings;
begin
  if Value.IsEmpty then
    Result := string.Empty
  else if Value.Kind = TTypeKind.tkUString then
    Result := Value.AsString
  else if Value.TryAsType<TStrings>(LStrings) then
    Result := LStrings.Text
  else
    Result := Value.ToString;
end;

{ TProgressColumn }

function TProgressColumn.CanEdit: Boolean;
begin
  Result := False;
end;

constructor TProgressColumn.Create(AOwner: TComponent);
begin
  inherited;
  FMax := DefaultMax;
end;

procedure TProgressColumn.DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
begin
  if DrawableCell = nil then
    inherited;
end;

function TProgressColumn.IsMaxStored: Boolean;
begin
  Result := not SameValue(FMax, DefaultMax);
end;

function TProgressColumn.IsMinStored: Boolean;
begin
  Result := not SameValue(FMin, 0);
end;

procedure TProgressColumn.SetMax(const Value: Single);
var
  LValue: Single;
begin
  LValue := System.Math.Max(Value, FMin);
  if not SameValue(FMax, LValue, TEpsilon.Vector) then
  begin
    FMax := Value;
    Changed;
  end;
end;

procedure TProgressColumn.SetMin(const Value: Single);
var
  LValue: Single;
begin
  LValue := System.Math.Min(Value, FMax);
  if not SameValue(FMin, LValue, TEpsilon.Vector) then
  begin
    FMin := Value;
    Changed;
  end;
end;

{ TCheckColumn }

type
  TTmpCheckBox = class(TCheckBox)
  const
    StrTrigger = 'IsChecked=%s';
  protected
    function GetStyleObject(const Clone: Boolean): TFmxObject; override;
    function GetDefaultStyleLookupName: string; override;
  public
    function TestTrigger(Trigger: string; const Value: Boolean): Boolean;
    function ProcessColorAnimation(const Path: TPath; const ColorAni: TColorAnimation;
      const AChecked: Boolean): Boolean;
    function ProcessFloatAnimation(const Path: TPath; const FloatAni: TFloatAnimation;
      const AChecked: Boolean): Boolean;
    function ProcessAnimation(const Path: TPath; const AChecked: Boolean): Boolean;
  end;

function TTmpCheckBox.TestTrigger(Trigger: string; const Value: Boolean): Boolean;
var
  TestString: string;
begin
  Trigger := string.LowerCase(Trigger);
  TestString := string.LowerCase(Format(StrTrigger, [Value.ToString]));
  Result := Trigger.Contains(TestString);
end;

function TTmpCheckBox.ProcessColorAnimation(const Path: TPath; const ColorAni: TColorAnimation;
  const AChecked: Boolean): Boolean;
begin
  Result := True;
  if (TestTrigger(ColorAni.Trigger, True) and AChecked) or (TestTrigger(ColorAni.Trigger, False) and not AChecked) then
    Path.Fill.Color := ColorAni.StopValue
  else if TestTrigger(ColorAni.TriggerInverse, False) and not AChecked then
    Path.Fill.Color := ColorAni.StartValue
  else
    Result := False;
end;

function TTmpCheckBox.ProcessFloatAnimation(const Path: TPath; const FloatAni: TFloatAnimation;
  const AChecked: Boolean): Boolean;
begin
  Result := True;
  if (TestTrigger(FloatAni.Trigger, True) and AChecked) or (TestTrigger(FloatAni.Trigger, False) and not AChecked) then
    Path.Opacity := FloatAni.StopValue
  else if TestTrigger(FloatAni.TriggerInverse, False) and not AChecked then
    Path.Opacity := FloatAni.StartValue
  else
    Result := False;
end;

function TTmpCheckBox.GetDefaultStyleLookupName: string;
begin
  Result := TCheckColumn.StrStyleName;
end;

function TTmpCheckBox.GetStyleObject(const Clone: Boolean): TFmxObject;
  function LookupStyleInObject(const ASource: TFmxObject; const AStyleName: string): TFmxObject;
  var
    SavedLoadableStyle: TFmxObject;
  begin
    Result := nil;
    if ASource <> nil then
    begin
      SavedLoadableStyle := LoadableStyle;
      LoadableStyle := ASource;
      try
        Result := ASource.FindStyleResource(AStyleName, Clone);
        if Result <> nil then
          Result.TagString := AStyleName.ToLowerInvariant;
      finally
        LoadableStyle := SavedLoadableStyle;
      end;
    end;
  end;

  function LookupStyle(const ASource: TFmxObject): TFmxObject;
  begin
    Result := nil;
    if not StyleLookup.IsEmpty then
      Result := LookupStyleInObject(ASource, StyleLookup);
    if (Result = nil) and not GetDefaultStyleLookupName.IsEmpty then
      Result := LookupStyleInObject(ASource, GetDefaultStyleLookupName);
  end;

var
  ActiveStyleForScene: TFmxObject;

begin
  if ((Parent is TPresentedControl) and (TPresentedControl(Parent).ControlType = TControlType.Platform)) or
    ((Parent is TContent) and (TContent(Parent).ParentControl is TPresentedControl) and
     (TPresentedControl(TContent(Parent).ParentControl).ControlType = TControlType.Platform))   then
  begin
    ActiveStyleForScene := TStyleManager.ActiveStyleForScene(nil);
    if ActiveStyleForScene = nil then
      Result := inherited GetStyleObject(Clone)
    else
      Result := LookupStyle(ActiveStyleForScene);
  end
  else
    Result := inherited GetStyleObject(Clone);
end;

function TTmpCheckBox.ProcessAnimation(const Path: TPath; const AChecked: Boolean): Boolean;
var
  Child: TFmxObject;
begin
  for Child in Path.Children do
  begin
    if (Child is TColorAnimation) and ProcessColorAnimation(Path, TColorAnimation(Child), AChecked) then
      Exit(True);
    if (Child is TFloatAnimation) and ProcessFloatAnimation(Path, TFloatAnimation(Child), AChecked) then
      Exit(True);
  end;
  Result := False;
end;

class function TCheckColumn.CreateBitmap(const Model: TGridModel; const Checked: Boolean;
  const EditorMode: Boolean = False): TBitmap;
const
  StrCheckmark = 'checkmark'; // do not localize
  StrAltCheckmark = 'background'; // do not localize
  ObjectName: array [Boolean] of string = ('checkboxunchecked', 'checkboxchecked'); // do not localize

  function DrawCheckBox(ACheckBox: TTmpCheckBox; ABitmap: TBitmap): Boolean;
  var
    Path: TPath;
    DrawableObject: IDrawableObject;
    Control: IAlignableObject;
    StyledControl: TControl;
    DstRect, SrcRect: TRectF;
    Scale: Single;
    Link: TBitmapLink;
  begin
    Result := False;
    Scale := ACheckBox.Scene.GetSceneScale;
    Path := nil;
    DrawableObject := nil;
    StyledControl := nil;
    ABitmap.BitmapScale := Scale;
    if not EditorMode and Supports(ACheckBox.FindStyleResource(ObjectName[Checked]), IDrawableObject, DrawableObject)
      and Supports(DrawableObject, IAlignableObject, Control) then
    begin
      ABitmap.SetSize(Ceil(Control.Width * Scale), Ceil(Control.Height * Scale));
      DstRect := TRectF.Create(0, 0, Control.Width, Control.Height);
      Result := True;
    end
    else
    begin
      // for deprecated styles
      if ACheckBox.FindStyleResource<TPath>(StrCheckmark, Path) then
        Result := ACheckBox.ProcessAnimation(Path, Checked);
      if Result then
      begin
        StyledControl := Path;
        ABitmap.SetSize(Ceil(ACheckBox.Height * Scale), Ceil(ACheckBox.Height * Scale));
        DstRect := TRectF.Create(0, 0, ACheckBox.Height, ACheckBox.Height);
      end
      else
      begin
        ACheckBox.IsChecked := Checked;
        Result := ACheckBox.FindStyleResource<TControl>(StrAltCheckmark, StyledControl);
        if Result then
        begin
          if StyledControl is TCheckStyleObject then
          begin
            Link := TCheckStyleObject(StyledControl).SourceLink.LinkByScale(Scale, False);
            if Link <> nil then
            begin
              DstRect := Link.SourceRect.Rect;
              DstRect.Location := TPoint.Zero;
              ABitmap.SetSize(Ceil(DstRect.Width), Ceil(DstRect.Height));
              DstRect.Width := DstRect.Width / Scale;
              DstRect.Height := DstRect.Height / Scale;
              SrcRect := StyledControl.BoundsRect;
              DstRect := RectCenter(SrcRect, DstRect);
            end
            else
              Result := False;
          end
          else
          begin
            ABitmap.SetSize(Ceil(ACheckBox.Height * Scale), Ceil(ACheckBox.Height * Scale));
            DstRect := TRectF.Create(0, 0, ACheckBox.Height, ACheckBox.Height);
          end;
        end;
      end;
    end;
    //Fix By 爱吃猪头肉
    if not ABitmap.HandleAllocated then exit;
    if Result and ABitmap.Canvas.BeginScene then
    try
      ABitmap.Canvas.Clear(TAlphaColorRec.Null);
      if DrawableObject <> nil then
        DrawableObject.DrawToCanvas(ABitmap.Canvas, DstRect, 1)
      else if StyledControl <> nil then
        StyledControl.PaintTo(ABitmap.Canvas, DstRect);
    finally
      ABitmap.Canvas.EndScene;
    end;
  end;

var
  TmpCheckBox: TTmpCheckBox;
begin
  ValidateInheritance(Model.Owner, TFmxObject, False);
  Result := nil;
  TmpCheckBox := TTmpCheckBox.Create(nil);
  try
    TmpCheckBox.Parent := TFmxObject(Model.Owner);
    TmpCheckBox.ApplyStyleLookup;
    Result := TBitmap.Create;
    try
      DrawCheckBox(TmpCheckBox, Result);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    TmpCheckBox.DisposeOf;
  end;
end;

procedure TCheckColumn.DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
begin
  if DrawableCell = nil then
    inherited;
end;

function TCheckColumn.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(28, 21);
end;

function TCheckColumn.TryGetAsBoolean(const Value: TValue; var BoolValue: Boolean): Boolean;
  procedure CharToBool(C: Char; var BoolBalue: Boolean);
  begin
    if C.IsInArray(['T', 't', 'Y', 'y']) then
      BoolValue := True
    else if C.IsInArray(['F', 'f', 'N', 'n']) then
      BoolValue := False
    else
      Result := False;
  end;

var
  S: string;
  C: Char;
  Info: PTypeInfo;
begin
  Result := not ValueIsEmpty(Value);
  if Result and not Value.TryAsType<Boolean>(BoolValue) then
  begin
    if Value.Kind in [tkString, tkWChar, tkLString, tkWString, tkUString] then
    begin
      S := Value.AsString;
      if Length(S) = 1 then
        CharToBool(S.Chars[0], BoolValue)
      else
      begin
        Info := TypeInfo(Boolean);
        if string.Compare(GetEnumName(Info, Ord(False)), S, [TCompareOption.coIgnoreCase]) = 0 then
          BoolValue := False
        else if string.Compare(GetEnumName(Info, Ord(True)), S, [TCompareOption.coIgnoreCase]) = 0 then
          BoolValue := True
        else
          Result := False;
      end;
    end
    else if Value.Kind in [tkInteger, tkInt64] then
      BoolValue := Value.AsInt64 <> 0
    else if Value.Kind in [tkFloat] then
      BoolValue := Value.AsExtended <> 0
    else if (Value.Kind in [tkChar]) and (Value.TryAsType<Char>(C)) then
      CharToBool(C, BoolValue)
    else
      Result := False;
  end;
end;

function TCheckColumn.ValueToString(const Value: TValue): string;
var
  B: Boolean;
begin
  if ValueIsEmpty(Value) then
    Result := string.Empty
  else if TryGetAsBoolean(Value, B) then
    Result := GetEnumName(TypeInfo(Boolean), Ord(B))
  else
    Result := string.Empty
end;

{ TDateColumn }

constructor TDateColumn.Create(AOwner: TComponent);
begin
  inherited;
  FShowClearButton := False;
end;

procedure TDateColumn.SetShowClearButton(const Value: Boolean);
begin
  if FShowClearButton <> Value then
  begin
    FShowClearButton := Value;
    Changed;
  end;
end;

function TDateColumn.ValueToString(const Value: TValue): string;
  function InternalDateToStr(const Date: TDateTime): string;
  begin
    if Format.IsEmpty then
      Result := DateToStr(Date)
    else
      Result := FormatDateTime(Format, Date);
  end;
var
  LDate: TDateTime;
  S: string;
  Settings: TFormatSettings;
begin
  Result := string.Empty;
  if not ValueIsEmpty(Value) then
  begin
    if Value.Kind = TTypeKind.tkUString then
    begin
      S := Value.AsString;
      Settings := FormatSettings;
      if not Format.IsEmpty then
        Settings.ShortDateFormat := Format;
      if TryStrToDate(S, LDate, Settings) or TryStrToDateTime(S, LDate, Settings) then
        Result := InternalDateToStr(LDate)
    end
    else if Value.TryAsType<TDateTime>(LDate) then
      Result := InternalDateToStr(LDate)
  end;
  if Result.IsEmpty then
    Result := inherited ValueToString(Value);
end;

function TDateColumn.IsFormatStored: Boolean;
begin
  Result := not Format.Trim.IsEmpty;
end;

procedure TDateColumn.SetFormat(const Value: string);
begin
  if FFormat <> Value then
  begin
    FFormat := Value;
    Changed;
  end;
end;

{ TTimeColumn }

function TTimeColumn.ValueToString(const Value: TValue): string;
  function InternalTimeToStr(const Date: TDateTime): string;
  var
    I: Integer;
  begin
    if Format.IsEmpty then
    begin
      Result := TimeToStr(Date);
      if Result.Length > 4 then
      begin
        // '12:35:00' -> '12:35'
        I := Result.Length - 1;
        while (I > 0) and (Result.Chars[I] = '0') do
          Dec(I);
        if (I > 0) and (Result.Chars[I] = FormatSettings.TimeSeparator) then
          Result := Result.Remove(I);
      end;
    end
    else
      Result := FormatDateTime(Format, Date);
  end;
var
  LDate: TDateTime;
  S: string;
  Settings: TFormatSettings;
begin
  Result := string.Empty;
  if not ValueIsEmpty(Value) then
  begin
    if Value.Kind = TTypeKind.tkUString then
    begin
      S := Value.AsString;
      Settings := FormatSettings;
      if not Format.IsEmpty then
        Settings.ShortTimeFormat := Format;
      if TryStrToTime(S, LDate, Settings) or TryStrToDateTime(S, LDate, Settings) then
        Result := InternalTimeToStr(LDate)
    end
    else if Value.TryAsType<TDateTime>(LDate) then
      Result := InternalTimeToStr(LDate)
  end;
  if Result.IsEmpty then
    Result := inherited ValueToString(Value);
end;

type
  TPopupColumnStringList = class(TStringList)
  private
    [Weak] FColumn: TPopupColumn;
  protected
    procedure Changed; override;
  public
    constructor Create(AOwner: TPopupColumn);
  end;

{ TTPopupColumnStringList }

procedure TPopupColumnStringList.Changed;
begin
  inherited;
  FColumn.Changed;
end;

constructor TPopupColumnStringList.Create(AOwner: TPopupColumn);
begin
  if AOwner = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FColumn := AOwner;
end;

{ TPopupColumn }

constructor TPopupColumn.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TPopupColumnStringList.Create(Self);
end;

destructor TPopupColumn.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TPopupColumn.SetItems(const Value: TStringList);
begin
  FItems.Assign(Value);
end;

{ TImageColumn }

constructor TImageColumn.Create(AOwner: TComponent);
begin
  inherited;
  FPreviewSize := TSize.Create(75, 75);
end;

procedure TImageColumn.DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
begin
  if DrawableCell = nil then
    inherited;
end;

procedure TImageColumn.SetPreviewSize(const Value: TSize);
var
  I: Integer;
begin
  if FPreviewSize <> Value then
  begin
    FPreviewSize := Value;
    if (Model <> nil) and (not Model.DataStored) then
    begin
      I := Model.IndexOfColumn(Self);
      if I >= 0 then
        Model.ClearColumnInCache(I);
    end;
  end;
end;

{ TCustomNumberColumn }

constructor TCustomNumberColumn.Create(AOwner: TComponent);
begin
  inherited;
  FDecimalDigits := 2;
end;

procedure TCustomNumberColumn.BeforeDrawing(const Canvas: TCanvas);
begin
  inherited;
  Layout.HorizontalAlign := TTextAlign.Trailing;
end;

procedure TCustomNumberColumn.SetDecimalDigits(const Value: Integer);
begin
  if FDecimalDigits <> Value then
  begin
    FDecimalDigits := Value;
    Changed;
  end;
end;

procedure TCustomNumberColumn.SetValueType(const Value: TNumValueType);
begin
  if FValueType <> Value then
  begin
    FValueType := Value;
    Changed;
  end;
end;

procedure TCustomNumberColumn.SetShowThousandSeparator(const Value: Boolean);
begin
  if FShowThousandSeparator <> Value then
  begin
    FShowThousandSeparator := Value;
    Changed;
  end;
end;

function TCustomNumberColumn.ValidChar(const KeyChar: Char): Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
    Result := inherited ValidChar(KeyChar)
  else
    Result := KeyChar.IsNumber or (KeyChar.IsInArray(['+', '-', 'e', 'E', FormatSettings.DecimalSeparator,
      FormatSettings.ThousandSeparator, '.', ',']));
end;

class function TCustomNumberColumn.TryValueToString(const Value: TValue; const ValueType: TNumValueType;
  out Text: string; const DecimalDigits: Integer = -1; const ShowThousandSeparator: Boolean = False): Boolean;
  function Order(const D: Double): Integer;
  begin
    if D = 0 then
      Result := 0
    else
      Result := Trunc(Abs(Log10(Abs(D))));
  end;
  function FormatInt(const I: Int64): string;
  var
    E: Extended;
  begin
    if ShowThousandSeparator then
    begin
      E := I;
      Result := Format('%1.0n', [E]);
    end
    else
      Result := Format('%d', [I]);
  end;
  function FormatDbl(const D: Double): string;
  var
    LDecimalDigits: Integer;
  begin
    if ValueType = TNumValueType.Integer then
      LDecimalDigits := 0
    else
      LDecimalDigits := DecimalDigits;
    if D.IsNan or D.IsInfinity then
      Result := D.ToString
    else if (LDecimalDigits < 0) or (Order(D) >= 18) then
      Result := D.ToString
    else if ShowThousandSeparator then
      Result := Format(Format('%%1.%dn', [LDecimalDigits]), [D])
    else
      Result := Format(Format('%%1.%df', [LDecimalDigits]), [D]);
  end;
const
  PossibleDecimalDelimiters: string = '.,';
var
  I: Int64;
  D: Double;
  S: string;
begin
  Text := string.Empty;
  if ValueIsEmpty(Value) then
    Exit(True)
  else if Value.Kind = TTypeKind.tkUString then
  begin
    S := FixNumberText(Value.AsString);
    if S.IsEmpty or (S = NaN.ToString) then
      Exit(True)
    else if (S = Infinity.ToString) or (S = NegInfinity.ToString) then
      Text := S
    else if (ValueType = TNumValueType.Integer) and TryStrToInt64(S, I) then
      Text := FormatInt(I)
    else if TryStrToFloat(S, D) then
      Text := FormatDbl(D);
  end
  else if (Value.Kind in [TTypeKind.tkFloat, TTypeKind.tkInteger, TTypeKind.tkInt64]) then
  begin
    if (ValueType = TNumValueType.Integer) and Value.TryAsType<Int64>(I) then
      Text := FormatInt(I)
    else if Value.TryAsType<Double>(D) then
      Text := FormatDbl(D);
  end;
  Result := not Text.IsEmpty;
end;

function TCustomNumberColumn.ValueToString(const Value: TValue): string;
begin
  if not TryValueToString(Value, ValueType, Result, DecimalDigits, ShowThousandSeparator) then
    Result := inherited;
end;

{ TCurrencyColumn }

constructor TCurrencyColumn.Create(AOwner: TComponent);
begin
  inherited;
  ValueType := TNumValueType.Float;
  ShowThousandSeparator := True;
end;

{ TFloatColumn }

constructor TFloatColumn.Create(AOwner: TComponent);
begin
  inherited;
  ValueType := TNumValueType.Float;
end;

{ TIntegerColumn }

constructor TIntegerColumn.Create(AOwner: TComponent);
begin
  inherited;
  ValueType := TNumValueType.Integer;
end;

function TIntegerColumn.ValidChar(const KeyChar: Char): Boolean;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
    Result := inherited ValidChar(KeyChar)
  else
    Result := KeyChar.IsNumber or (KeyChar.IsInArray(['+', '-']));
end;

{ TGlyphColumn }

procedure TGlyphColumn.AncestorParentChanged;
begin
  FGlyph := nil;
  inherited;
  Supports(PresentedControl, IGlyph, FGlyph)
end;

function TGlyphColumn.CanEdit: Boolean;
begin
  Result := False;
end;

procedure TGlyphColumn.DefaultDrawCell(const Canvas: TCanvas; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
begin
  if DrawableCell = nil then
    inherited;
end;

procedure TGlyphColumn.DoGetImageIndex(const Value: TValue; var ImageIndex: TImageIndex);
begin
  if Assigned(OnGetImageIndex) then
    OnGetImageIndex(Self, Value, ImageIndex);
end;

function TGlyphColumn.GetImageIndex(const Value: TValue): TImageIndex;
var
  S: string;
begin
  Result := -1;
  if not ValueIsEmpty(Value) then
  begin
    if Value.IsOrdinal then
      Result := Value.AsOrdinal
    else if Value.Kind = TTypeKind.tkFloat then
      Result := Round(Value.AsType<Double>)
    else if Value.TryAsType<string>(S) and not S.IsEmpty then
      TryStrToInt(S.Trim, Integer(Result));
  end;
  DoGetImageIndex(Value, Result);
end;

function TGlyphColumn.GlyphPlaceIntoBounds(const Index: TImageIndex; const Bounds: TRectF;
  const Scale: Single): TRectF;
var
  Size: TSizeF;
  Images: TCustomImageList;
begin
  if (Index >= 0) and (GlyphInterface <> nil) and (GlyphInterface.Images is TCustomImageList) then
  begin
    Images := TCustomImageList(GlyphInterface.Images);
    Size := TSizeF.Create(Bounds.Width * Scale, Bounds.Height * Scale);
    if not Stretch and Images.BestSize(Index, Size) then
      Result := TRectF.Create(TPointF.Zero, Size.cx / Scale, Size.cy / Scale)
    else
    begin
      Size := TSizeF.Create(High(SmallInt), High(SmallInt));
      if Images.BestSize(Index, Size) then
        Result := TRectF.Create(TPointF.Zero, Size.cx, Size.cy)
      else
        Result := TRectF.Create(TPointF.Zero, Min(Bounds.Width, Bounds.Height),
          Min(Bounds.Width, Bounds.Height));
    end;
    Result := RectPlaceIntoBounds(Result, Bounds);
  end
  else
    Result := TRectF.Create(0, 0, 0, 0);
end;

procedure TGlyphColumn.Loaded;
begin
  FGlyph := nil;
  inherited;
  Supports(PresentedControl, IGlyph, FGlyph)
end;

procedure TGlyphColumn.SetOnGetImageIndex(const Value: TGetImageIndexEvent);
begin
  if @Value <> @FOnGetImageIndex then
  begin
    FOnGetImageIndex := Value;
    Changed;
  end;
end;

procedure TGlyphColumn.SetStretch(const Value: Boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Changed;
  end;
end;

type
  TGridTextSettings = class(TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property VertAlign;
    property HorzAlign;
    property Trimming default TTextTrimming.Character;
  end;

  { TGridTextSettings }

constructor TGridTextSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  Trimming := TTextTrimming.Character;
  WordWrap := False;
end;

type
  TGridSettingsInfo = class(TTextSettingsInfo)
  private
    [Weak] FModel: TGridModel;
  protected
    procedure DoCalculatedTextSettings; override;
  public
    constructor Create(AOwner: TPersistent; ATextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass); override;
    property Model: TGridModel read FModel;
  end;

  { TGridSettingsInfo }

constructor TGridSettingsInfo.Create(AOwner: TPersistent;
  ATextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass);
begin
  ValidateInheritance(AOwner, TGridModel, False);
  inherited;
  FModel := TGridModel(AOwner);
end;

procedure TGridSettingsInfo.DoCalculatedTextSettings;
begin
  inherited;
  FModel.DoTextSettingsChanged;
end;

{ TGridModel.TCoord }

procedure TGridModel.TCoord.Clear;
begin
  Self.Col := -1;
  Self.Row := -1;
end;

function TGridModel.TCoord.IsEmpty: Boolean;
begin
  Result := (Self.Col < 0) or (Self.Row < 0);
end;

{ TGridModel }

constructor TGridModel.Create(const AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextSettingsInfo := TGridSettingsInfo.Create(Self, GetTextSettingsClass);
  FTextSettingsInfo.StyledSettings := DefaultStyledSettings;
  FDefaultDrawing := True;
  FOptions := GetDefaultGridOptions;
  AutoCalculateContentSize := False;
  FColumns := TList<TColumn>.Create;
  FCol := -1;
  FRow := -1;
end;

destructor TGridModel.Destroy;
begin
  FCache.Free;
  FColumns.Free;
  FTextSettingsInfo.Free;
  inherited;
end;

procedure TGridModel.DoColumnChanged(const Index: Integer);
begin
  if Columns[Index].FChanged then
    try
      SendMessage<Integer>(MM_COLUMN_CHANGED, Index);
    finally
      Columns[Index].FChanged := False;
    end;
end;

procedure TGridModel.DoContentChanged;
begin
  if FContentChanged then
    try
      SendMessage(MM_CONTENT_CHANGED);
    finally
      FContentChanged := False;
    end;
end;

procedure TGridModel.DoDrawColumnBackground(const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
begin
  if Assigned(FOnDrawColumnBackground) then
    FOnDrawColumnBackground(Self.Owner, Canvas, Column, Bounds, Row, Value, State);
end;

procedure TGridModel.DoDrawColumnCell(const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
begin
  if Assigned(FOnDrawColumnCell) then
    FOnDrawColumnCell(Self.Owner, Canvas, Column, Bounds, Row, Value, State);
end;

function TGridModel.IndexOfColumn(const Column: TColumn): Integer;
begin
  Result := FColumns.IndexOf(Column)
end;

function TGridModel.DoGetValue(Col, Row: Integer): TValue;
begin
  Result := TValue.Empty;
  if Assigned(FOnGetValue) then
    FOnGetValue(Self.Owner, Col, Row, Result);
end;

procedure TGridModel.DoSetValue(Col, Row: Integer; const Value: TValue);
begin
  if Assigned(FOnSetValue) then
    FOnSetValue(Self.Owner, Col, Row, Value);
end;

procedure TGridModel.ShowEditor;
begin
  if (Owner <> nil) and not (csDesigning in Owner.ComponentState) then
    SendMessage(MM_SHOW_EDITOR);
end;

procedure TGridModel.HideEditor(const Accept: Boolean);
begin
  if (Owner <> nil) and not (csDesigning in Owner.ComponentState) then
    SendMessage<Boolean>(MM_HIDE_EDITOR, Accept);
end;

procedure TGridModel.PostEditorValue;
begin
  if (Owner <> nil) and not (csDesigning in Owner.ComponentState) then
    SendMessage(MM_POST_EDITOR_VALUE);
end;

procedure TGridModel.RefreshEditorValue;
begin
  if (Owner <> nil) and not (csDesigning in Owner.ComponentState) and (Col >= 0) and (Col < ColumnCount) and
    not Columns[Col].FEditorStateChanging then
    SendMessage(MM_REFRESH_EDITOR_VALUE);
end;

procedure TGridModel.HideEditor;
begin
  HideEditor(not (TGridOption.CancelEditingByDefault in Options) and (Col >= 0) and (Col < ColumnCount) and
    (Columns[Col].EditorState = TColumn.TEditorState.Modified));
end;

function TGridModel.FindNextCell(const RightToLeft, OnlyRow, Editing: Boolean; var ACol, ARow: Integer): Boolean;

  function CanSelect(const ACol: Integer; const Editing: Boolean): Boolean;
  begin
    Result := Columns[ACol].Visible and Columns[ACol].Enabled and (Columns[ACol].Width > 0) and
      (not Editing or Columns[ACol].CanEdit);
  end;

  function FindColRight(const Start: Integer; const Editing: Boolean): Integer;
  var
    X: Integer;
  begin
    X := Start + 1;
    if X < ColumnCount then
    begin
      while (X < ColumnCount) and not CanSelect(X, Editing) do
        Inc(X);
      if X < ColumnCount then
        Exit(X);
    end;
    X := 0;
    while (X <= Start) and not CanSelect(X, Editing) do
      Inc(X);
    if X <= Start then
      Exit(X);
    Result := -1;
  end;

  function FindColLeft(const Start: Integer; const Editing: Boolean): Integer;
  var
    X: Integer;
  begin
    X := Start - 1;
    if X >= 0 then
    begin
      while (X >= 0) and not CanSelect(X, Editing) do
        Dec(X);
      if X >= 0 then
        Exit(X);
    end;
    X := ColumnCount - 1;
    while (X >= Start) and not CanSelect(X, Editing) do
      Dec(X);
    if X >= Start then
      Exit(X);
    Result := -1;
  end;

var
  X: Integer;
begin
  Result := False;
  if (RowCount <= 0) and (ColumnCount <= 0) then
    Exit;

  if (ARow < 0) or (ARow >= RowCount) then
  begin
    if RightToLeft then
      ARow := RowCount - 1
    else
      ARow := 0;
  end;

  if ((ACol < 0) or (ACol >= ColumnCount)) and not OnlyRow then
  begin
    if RightToLeft then
      ACol := ColumnCount
    else
      ACol := -1;
  end;

  if OnlyRow then
  begin
    if RightToLeft then
      if ARow > 0 then
        Dec(ARow)
      else
        Exit
    else if ARow < RowCount - 1 then
      Inc(ARow)
    else
      Exit;
  end
  else
  begin
    if RightToLeft then
    begin
      if Editing then
      begin
        X := FindColLeft(ACol, True);
        if X = -1 then
          X := FindColLeft(ACol, False);
      end
      else
        X := FindColLeft(ACol, False);
      if X < 0 then
        Exit;
      if (X >= ACol) then
      begin
        if ARow > 0 then
        begin
          ACol := X;
          Dec(ARow);
        end
        else
          Exit;
      end
      else
        ACol := X;
    end
    else
    begin
      if Editing then
      begin
        X := FindColRight(ACol, True);
        if X = -1 then
          X := FindColRight(ACol, False);
      end
      else
        X := FindColRight(ACol, False);
      if X < 0 then
        Exit;
      if (X <= ACol) then
      begin
        if ARow < RowCount - 1 then
        begin
          ACol := X;
          Inc(ARow);
        end
        else
          Exit;
      end
      else
        ACol := X;
    end;
  end;
  Result := True;
end;

procedure TGridModel.ClearCache;
begin
  if Cache <> nil then
    Cache.Clear
end;

procedure TGridModel.ReduceCache;
var
  LExcepRect: TRectCoord;
begin
  if Cache <> nil then
  begin
    if IsUsedInBinding or (RowCount <= 0) or (ColumnCount <= 0) then
      Cache.Clear
    else
    begin
      LExcepRect.TopLeft.Col := 0;
      LExcepRect.TopLeft.Row := 0;
      LExcepRect.BottomRight.Col := ColumnCount - 1;
      LExcepRect.BottomRight.Row := RowCount - 1;
      Cache.Reduce(LExcepRect);
    end;
  end;
end;

procedure TGridModel.ReduceCache(const LeftColumn, TopRow, RigthColumn, BottomRow: Integer);
var
  LExcepRect: TRectCoord;
begin
  if Cache <> nil then
  begin
    if (RowCount <= 0) or (ColumnCount <= 0) then
      Cache.Clear
    else
    begin
      if DataStored then
      begin
        LExcepRect.TopLeft.Col := 0;
        LExcepRect.TopLeft.Row := 0;
        LExcepRect.BottomRight.Col := ColumnCount - 1;
        LExcepRect.BottomRight.Row := RowCount - 1;
      end
      else
      begin
        LExcepRect.TopLeft.Col := Max(0, LeftColumn);
        LExcepRect.TopLeft.Row := Max(0, TopRow);
        LExcepRect.BottomRight.Col := Min(ColumnCount - 1, RigthColumn);
        LExcepRect.BottomRight.Row := Min(RowCount - 1, BottomRow);
      end;
      Cache.Reduce(LExcepRect);
    end;
  end;
end;

procedure TGridModel.ClearColumnInCache(const Index: Integer);
begin
  if (Cache <> nil) and (Index >= 0) then
    Cache.RemoveColumn(Index, True);
end;

procedure TGridModel.RemoveColumnFromCache(const Index: Integer);
begin
  if (Cache <> nil) and (Index >= 0) then
    Cache.RemoveColumn(Index, False);
end;

procedure TGridModel.ClearRowInCache(const Index: Integer);
begin
  if (Cache <> nil) and (Index >= 0) then
    Cache.RemoveRow(Index, True);
end;

procedure TGridModel.RemoveRowFromCache(const Index: Integer);
begin
  if (Cache <> nil) and (Index >= 0) then
    Cache.RemoveRow(Index, False);
end;

procedure TGridModel.MoveColumnInCache(const OldIndex, NewIndex: Integer);
begin
  if Cache <> nil then
    Cache.MoveColumn(OldIndex, NewIndex);
end;

procedure TGridModel.InsertColumnIntoCache(const Index: Integer);
begin
  if Cache <> nil then
    Cache.InsertColumn(Index);
end;

procedure TGridModel.DataChanged(const ACol, ARow: Integer);
var
  Coord: TCoord;
begin
  if (Cache <> nil) and (ACol >= 0) and (ARow >= 0) then
  begin
    Coord.Col := ACol;
    Coord.Row := ARow;
    if not DataStored then
      Cache.RemoveCell(Coord);
    if (ACol < ColumnCount) and (ARow < RowCount) and (Columns[ACol].EffectiveVisible) and (Columns[ACol].Width > 0)
      then
      SendMessage<TCoord>(MM_INVALIDATE_CELL, Coord);
  end;
end;

function TGridModel.CreatePreviewBitmap(const Column: TImageColumn; const Bitmap: TBitmap): TBitmap;
var
  ResultRect, SourceRect: TRect;
  PaintRect: TRectF;
  Scale: Single;
begin
  Result := nil;
  if (Column.CellObject is TControl) and (TControl(Column.CellObject).Scene <> nil) then
    Scale := TControl(Column.CellObject).Scene.GetSceneScale
  else if (Owner is TControl) and (TControl(Owner).Scene <> nil) then
    Scale := TControl(Owner).Scene.GetSceneScale
  else
    Exit;
  SourceRect := Bitmap.Bounds;
  ResultRect := TRect.Create(TPoint.Zero, Min(Round(Column.PreviewSize.cx * Scale), Bitmap.Width),
    Min(Round(Column.PreviewSize.cy * Scale), Bitmap.Height));

  PaintRect := TRectF.Create(TPointF.Zero, SourceRect.Width * Scale, SourceRect.Height * Scale).PlaceInto(ResultRect).
    SnapToPixel(Scale, False);

  if (ResultRect.Width > 0) and (ResultRect.Height > 0) then
  begin
    Result := TBitmap.Create;
    try
      Result.SetSize(ResultRect.Width, ResultRect.Height);
      if Result.Canvas.BeginScene then
      try
        Result.Canvas.Clear(TAlphaColorRec.Null);
        Result.Canvas.DrawBitmap(Bitmap, Bitmap.BoundsF, PaintRect, 1, False);
      finally
        Result.Canvas.EndScene;
      end;
    except
      Result.Free;
      raise;
    end;
  end;
end;

function TGridModel.CreateCache: TGridValues;
begin
  Result := TGridValues.Create(Self);
end;

function TGridModel.GetValue(const Col, Row: Integer; const InvalidateCache: Boolean): TValue;
var
  Key: TCoord;
  LValue: TValue;
  TmpBitmap: TBitmap;
begin
  LValue := TValue.Empty;
  if (Owner <> nil) and not (csDestroying in Owner.ComponentState) then
  begin
    if FCache = nil then
      FCache := CreateCache;
    Key.Col := Col;
    Key.Row := Row;
    if (InvalidateCache or not FCache.TryGetValue(Key, LValue)) and not IsUpdating then
    begin
      TmpBitmap := nil;
      try
        DoCallbackGetValue(Col, Row,
          procedure(V: TValue)
          begin
            if not V.IsEmpty and V.IsObject then
            begin
              if V.AsObject = nil then
                LValue := TValue.Empty
              else if (V.AsObject is TBitmap) and (Columns[Col] is TImageColumn) then
                LValue := CreatePreviewBitmap(TImageColumn(Columns[Col]), TBitmap(V.AsObject))
              else if (V.AsObject is TPersistent) and (Columns[Col] is TImageColumn) then
              begin
                if TmpBitmap = nil then
                  TmpBitmap := TBitmap.Create;
                TmpBitmap.Assign(TPersistent(V.AsObject));
                LValue := CreatePreviewBitmap(TImageColumn(Columns[Col]), TmpBitmap);
              end
              else
                LValue := V.AsObject.ClassType.QualifiedClassName;
            end
            else
              LValue := V;
            FCache.AddOrSetValue(Key, LValue);
          end);
      finally
        TmpBitmap.Free;
      end;
    end;
  end;
  Result := LValue;
end;

procedure TGridModel.DoCallbackGetValue(Col, Row: Integer; ACallback: TProc<TValue>);
var
  LHaveValue: Boolean;
begin
  if Assigned(FOnCallbackGetValue) then
  begin
    LHaveValue := False;
    FOnCallbackGetValue(Self.Owner, Col, Row,
      procedure(AValue: TValue)
      begin
        LHaveValue := True;
        ACallback(AValue);
      end);
    if not LHaveValue then
      ACallback(TValue.Empty);
  end
  else
    ACallback(DoGetValue(Col, Row));
end;

procedure TGridModel.DoColumnAdded(const Column: TColumn);
begin
end;

procedure TGridModel.DoColumnRemoved(const Column: TColumn);
begin
end;

procedure TGridModel.DoRowCountChanged(const OldValue, NewValue: Integer);
begin

end;

procedure TGridModel.ColumnChanged(const Index: Integer);
begin
  Columns[Index].FChanged := True;
  if not IsUpdating then
    DoColumnChanged(Index);
end;

procedure TGridModel.ContentChanged;
begin
  FContentChanged := True;
  if not IsUpdating then
    DoContentChanged;
end;

procedure TGridModel.BeginUpdate;
begin
  if FUpdateCount = 0 then
  begin
    FOldCoord.Col := FCol;
    FOldCoord.Row := FRow;
  end;
  Inc(FUpdateCount);
end;

function TGridModel.IsUpdating: Boolean;
begin
  Result := FUpdateCount > 0;
end;

function TGridModel.IsOptionsStored: Boolean;
begin
  Result := FOptions <> GetDefaultGridOptions;
end;

procedure TGridModel.DoEndUpdate;
var
  I: Integer;
begin
  DoContentChanged;
  for I := 0 to ColumnCount - 1 do
    DoColumnChanged(I);
end;

procedure TGridModel.EndUpdate;
begin
  if FUpdateCount > 0 then
  begin
    Dec(FUpdateCount);
    if not IsUpdating then
      try
        if (FOldCoord.Col <> FCol) or (FOldCoord.Row <> FRow) then
        begin
          SelectionChanged;
          DoSelChanged;
        end;
      finally
        DoEndUpdate;
        if Owner is TControl then
          TControl(Owner).InvalidateRect(TControl(Owner).LocalRect);
      end;
  end;
end;

procedure TGridModel.UpdateColumnsIndex(const Force: Boolean = False);
var
  I: Integer;
begin
  if not FOrderChanging then
  begin
    FOrderChanging := True;
    try
      if (Owner <> nil) and (Force or (([csLoading, csDestroying] * Owner.ComponentState) = [])) then
        for I := 0 to ColumnCount - 1 do
          Columns[I].Index := I;
    finally
      FOrderChanging := False;
    end;
  end;
end;

procedure TGridModel.InvalidateContentSize;
begin
  SendMessage(MM_INVALIDATE_CONTENT_SIZE);
end;

procedure TGridModel.InternalInsertColumn(const Index: Integer; const Column: TColumn);
begin
  if Column <> nil then
  begin
    HideEditor;
    BeginUpdate;
    try
      InsertColumnIntoCache(Index);
      if Index >= ColumnCount then
        FColumns.Add(Column)
      else
        FColumns.Insert(Index, Column);
      UpdateColumnsIndex;
      DoColumnAdded(Column);
      if Owner is TControl then
      begin
        if Column.EffectiveVisible or (csDesigning in Owner.ComponentState) then
          InvalidateContentSize;
        ContentChanged;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TGridModel.InsertColumn(const Index: Integer; const Column: TColumn);
begin
  if Column = nil then
    raise EArgumentNilException.Create(SArgumentNil)at ReturnAddress;
  BeginUpdate;
  try
    if Owner is TFmxObject then
    begin
      Column.Parent := TFmxObject(Owner);
      MoveColumn(Column.Index, Index);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TGridModel.RemoveColumn(const Index: Integer);
var
  Column: TColumn;
begin
  HideEditor;
  BeginUpdate;
  try
    Column := FColumns[Index];
    RemoveColumnFromCache(Index);
    FColumns.Delete(Index);
    UpdateColumnsIndex;
    DoColumnRemoved(Column);
    if Owner is TControl then
    begin
      if Column.EffectiveVisible or (csDesigning in Owner.ComponentState) then
        InvalidateContentSize;
      ContentChanged;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TGridModel.MoveColumn(const OldIndex, NewIndex: Integer);
var
  Indexes: TColumnIndexes;
begin
  if OldIndex <> NewIndex then
  begin
    HideEditor;
    BeginUpdate;
    try
      Indexes.Column := FColumns[OldIndex];
      FColumns.Move(OldIndex, NewIndex);
      UpdateColumnsIndex;
      Indexes.FromIndex := OldIndex;
      Indexes.ToIndex := NewIndex;
      MoveColumnInCache(OldIndex, NewIndex);
      if Owner is TControl then
        SendMessageWithResult<TColumnIndexes>(MM_COLUMN_MOVED, Indexes);
    finally
      EndUpdate;
    end;
  end;
end;

function TGridModel.GetColumnCount: Integer;
begin
  Result := FColumns.Count;
end;

function TGridModel.GetColumns(const Index: Integer): TColumn;
begin
  if (Index < 0) or (Index >= ColumnCount) then
    raise EArgumentOutOfRangeException.CreateResFmt(@SInvalidColumnIndex, [Index])at ReturnAddress;
  Result := FColumns[Index];
end;

function TGridModel.GetDefaultGridOptions: TGridOptions;
begin
  Result := DefaultGridOptions;
end;

procedure TGridModel.DoSelChanged;
begin
  if (Owner <> nil) and (([csLoading, csDestroying] * Owner.ComponentState) = []) and Assigned(FOnSelChanged) then
    FOnSelChanged(Owner);
end;

procedure TGridModel.DoSelectCell(Col, Row: Integer; var CanSelect: Boolean);
begin
  if (Owner <> nil) and (([csLoading, csDestroying] * Owner.ComponentState) = []) and Assigned(FOnSelectCell) then
    FOnSelectCell(Owner, Col, Row, CanSelect);
end;

function TGridModel.TrySelectCell(const ACol, ARow: Integer; const AObservable: Boolean): Boolean;
var
  OldCol, OldRow: Integer;
begin
  Result := True;
  DoSelectCell(ACol, ARow, Result);
  if Result then
  begin
    EditorMode := False;
    OldCol := FCol;
    OldRow := FRow;
    try
      if AObservable and (Owner is TPresentedControl) and (OldRow <> ARow) then
        TLinkObservers.PositionLinkPosChanging(TPresentedControl(Owner).Observers);
      try
        FCol := ACol;
        FRow := ARow;
        if not IsUpdating then
          SelectionChanged;
      finally
        if AObservable and (Owner is TPresentedControl) and (OldRow <> ARow) then
          TLinkObservers.PositionLinkPosChanged(TPresentedControl(Owner).Observers);
      end;
    except
      FCol := OldCol;
      FRow := OldRow;
      raise;
    end;
    if not IsUpdating then
      DoSelChanged;
  end;
end;

procedure TGridModel.SelectCell(const ACol, ARow: Integer);
begin
  if (Col <> ACol) or (Row <> ARow) then
    TrySelectCell(ACol, ARow, True);
end;

procedure TGridModel.SetCol(const Value: Integer);
begin
  if Col <> Value then
  begin
    if not TrySelectCell(Value, Row, False) then
      TrySelectCell(Value, -1, True);
  end;
end;

procedure TGridModel.SetRow(const Value: Integer);
begin
  if Row <> Value then
  begin
    if not TrySelectCell(Col, Value, False) then
      TrySelectCell(-1, Value, True);
  end;
end;

procedure TGridModel.SetSelected(const Value: Integer);
begin
  if Row <> Value then
  begin
    if not TrySelectCell(Col, Value, False) then
      TrySelectCell(-1, Value, False);
  end;
end;

procedure TGridModel.SelectionChanged;
begin
  SendMessage(MM_SEL_CHANGED);
end;

procedure TGridModel.SetDataStored(const Value: Boolean);
begin
  if FDataStored <> Value then
  begin
    FDataStored := Value;
    if FDataStored and (FCache = nil) then
      FCache := CreateCache;
  end;
end;

procedure TGridModel.SetDefaultDrawing(const Value: Boolean);
begin
  if FDefaultDrawing <> Value then
  begin
    FDefaultDrawing := Value;
    ContentChanged;
  end;
end;

procedure TGridModel.SetDefaultTextSettings(const Value: TTextSettings);
begin
  GetDefaultTextSettings.Assign(Value);
end;

function TGridModel.GetEditorMode: Boolean;
begin
  SendMessageWithResult<Boolean>(MM_EDITOR_MODE, Result);
end;

function TGridModel.GetEditorValue: TValue;
begin
  if EditorMode then
    SendMessageWithResult<TValue>(MM_GET_EDITOR_VALUE, Result)
  else
    Result := TValue.Empty;
end;

procedure TGridModel.SetEditorMode(const Value: Boolean);
begin
  if GetEditorMode <> Value then
  begin
    if Value then
      ShowEditor
    else
      HideEditor;
  end;
end;

procedure TGridModel.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    if not Value then
      HideEditor(False);
    FEnabled := Value;
    SendMessage(MM_SEL_CHANGED);
  end;
end;

procedure TGridModel.SetIsUsedInBinding(const Value: Boolean);
begin
  if FIsUsedInBinding <> Value then
  begin
    if Value or (not Value and not DataStored) then
      ClearCache;
    FIsUsedInBinding := Value;
  end;
end;

procedure TGridModel.SetOptions(const Value: TGridOptions);
const
  SelectionOptions = [TGridOption.Editing, TGridOption.AlwaysShowSelection, TGridOption.RowSelect];
  HeaderOptions = [TGridOption.Header, TGridOption.ColLines];
var
  OldSelectionOptions, OldHeaderOptions: TGridOptions;
begin
  if FOptions <> Value then
  begin
    if EditorMode and not (TGridOption.Editing in Value) then
      HideEditor;
    OldSelectionOptions := SelectionOptions * FOptions;
    OldHeaderOptions := HeaderOptions * FOptions;
    FOptions := Value;
    BeginUpdate;
    try
      if OldHeaderOptions <> (HeaderOptions * FOptions) then
        InvalidateContentSize;
      ContentChanged;
    finally
      EndUpdate;
    end;
    if OldSelectionOptions <> (SelectionOptions * FOptions) then
      SelectionChanged;
  end;
end;

procedure TGridModel.SetRowCount(const Value: Integer);
var
  OldValue: Integer;
begin
  if (Value >= 0) and (FRowCount <> Value) then
  begin
    BeginUpdate;
    try
      OldValue := FRowCount;
      FRowCount := Value;
      ReduceCache;
      DoRowCountChanged(OldValue, FRowCount);
      ContentChanged;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TGridModel.SetRowHeight(const Value: Single);
var
  LValue: Single;
begin
  if Value <= TEpsilon.FontSize then
    LValue := 0
  else
    LValue := Value;
  if not SameValue(LValue, FRowHeight, TEpsilon.FontSize) then
  begin
    FRowHeight := LValue;
    ContentChanged;
  end;
end;

function TGridModel.GetEffectiveRowHeight: Integer;
begin
  SendMessageWithResult<Integer>(MM_GET_ROW_HEIGHT, Result);
end;

function TGridModel.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TGridTextSettings;
end;

procedure TGridModel.DoTextSettingsChanged;
var
  ColumnTextSettings: ITextSettings;
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to ColumnCount - 1 do
      if Supports(Columns[I], ITextSettings, ColumnTextSettings) then
        ColumnTextSettings.DefaultTextSettings.Assign(GetResultingTextSettings);
    if (RowHeight = 0) and GetResultingTextSettings.IsAdjustChanged then
    begin
      InvalidateContentSize;
      ContentChanged;
    end
    else if Owner is TControl then
    begin
      TControl(Owner).InvalidateRect(TControl(Owner).LocalRect);
      if EditorMode then
        SelectionChanged;
    end;
  finally
    EndUpdate;
  end;
end;

function TGridModel.StyledSettingsStored: Boolean;
begin
  Result := FTextSettingsInfo.StyledSettings <> DefaultStyledSettings;
end;

function TGridModel.GetDefaultTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.DefaultTextSettings;
end;

function TGridModel.GetTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.TextSettings;
end;

procedure TGridModel.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettingsInfo.TextSettings.Assign(Value);
end;

function TGridModel.GetResultingTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.ResultingTextSettings;
end;

function TGridModel.GetStyledSettings: TStyledSettings;
begin
  Result := FTextSettingsInfo.StyledSettings;
end;

procedure TGridModel.SetStyledSettings(const Value: TStyledSettings);
begin
  FTextSettingsInfo.StyledSettings := Value;
end;

function TGridModel.GetDesign: Boolean;
begin
  Result := FTextSettingsInfo.Design;
end;

procedure TGridModel.SetDesign(const Value: Boolean);
begin
  FTextSettingsInfo.Design := Value;
end;

{$REGION 'TGridValues'}

constructor TGridValues.Create(const AOwner: TGridModel);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TGridValues.Destroy;
begin
  Clear;
  inherited;
end;

procedure TGridValues.Changed(const ACoord: TGridModel.TCoord);
begin

end;

procedure TGridValues.Clear;
var
  V: TValue;
  Obj: TObject;
begin
  for V in Values.ToArray do
    if V.TryAsType<TObject>(Obj) then
      Obj.DisposeOf;
  inherited Clear;
end;

procedure TGridValues.Reduce(const AExcepRect: TGridModel.TRectCoord);
var
  K: TGridModel.TCoord;
begin
  for K in Keys.ToArray do
    if (K.Row < AExcepRect.TopLeft.Row) or (K.Row > AExcepRect.BottomRight.Row) or
      (K.Col < AExcepRect.TopLeft.Col) or (K.Col > AExcepRect.BottomRight.Col) then
    begin
      if Items[K].IsObject then
        Items[K].AsObject.DisposeOf;
      Remove(K);
    end;
end;

procedure TGridValues.RemoveCell(const ACoord: TGridModel.TCoord);
var
  Value: TValue;
begin
  if TryGetValue(ACoord, Value) then
  begin
    if Value.IsObject then
      Value.AsObject.DisposeOf;
    Remove(ACoord);
  end;
end;

procedure TGridValues.MoveCells(const OldIndex, NewIndex: Integer; const ByRow: Boolean);
var
  LKeys: TArray<TGridModel.TCoord>;
  K: TGridModel.TCoord;
  CellRec: TCellRec;
  LByRow: Integer;
  MovingCells, OtherCells: TList<TCellRec>;
begin
  if OldIndex <> NewIndex then
  begin
    MovingCells := nil;
    OtherCells := nil;
    LKeys := Keys.ToArray;
    try
      LByRow := Integer(ByRow);
      MovingCells := TList<TCellRec>.Create;
      OtherCells := TList<TCellRec>.Create;
      for K in LKeys do
        if K.AsArray[LByRow] = OldIndex then
        begin
          CellRec := ExtractPair(K);
          CellRec.Key.AsArray[LByRow] := NewIndex;
          MovingCells.Add(CellRec);
        end
        else if (NewIndex > OldIndex) and (K.AsArray[LByRow] > OldIndex) and (K.AsArray[LByRow] <= NewIndex) then
        begin
          CellRec := ExtractPair(K);
          Dec(CellRec.Key.AsArray[LByRow]);
          OtherCells.Add(CellRec);
        end
        else if (OldIndex > NewIndex) and (K.AsArray[LByRow] >= NewIndex) and (K.AsArray[LByRow] < OldIndex) then
        begin
          CellRec := ExtractPair(K);
          Inc(CellRec.Key.AsArray[LByRow]);
          OtherCells.Add(CellRec);
        end;
      for CellRec in MovingCells do
        Add(CellRec.Key, CellRec.Value);
      for CellRec in OtherCells do
        Add(CellRec.Key, CellRec.Value);
    finally
      OtherCells.Free;
      MovingCells.Free;
    end;
  end;
end;

procedure TGridValues.RemoveCells(const Index: Integer; const ByRow, OnlyClear: Boolean);
var
  LKeys: TArray<TGridModel.TCoord>;
  K: TGridModel.TCoord;
  CellRec: TCellRec;
  LByRow: Integer;
  MovingCells: TList<TCellRec>;
begin
  LKeys := Keys.ToArray;
  LByRow := Integer(ByRow);
  for K in LKeys do
    if K.AsArray[LByRow] = Index then
    begin
      if Items[K].IsObject then
        Items[K].AsObject.DisposeOf;
      Remove(K);
    end;
  if not OnlyClear then
  begin
    MovingCells := TList<TCellRec>.Create;
    try
      for K in LKeys do
        if K.AsArray[LByRow] > Index then
        begin
          CellRec := ExtractPair(K);
          Dec(CellRec.Key.AsArray[LByRow]);
          MovingCells.Add(CellRec);
        end;
      for CellRec in MovingCells do
        Add(CellRec.Key, CellRec.Value);
    finally
      MovingCells.Free;
    end;
  end;
end;

procedure TGridValues.InsertCells(const Index: Integer; const ByRow: Boolean);
var
  LKeys: TArray<TGridModel.TCoord>;
  K: TGridModel.TCoord;
  CellRec: TCellRec;
  LByRow: Integer;
  MovingCells: TList<TCellRec>;
begin
  MovingCells := nil;
  LKeys := Keys.ToArray;
  try
    LByRow := Integer(ByRow);
    MovingCells := TList<TCellRec>.Create;
    for K in LKeys do
      if K.AsArray[LByRow] >= Index then
      begin
        CellRec := ExtractPair(K);
        Inc(CellRec.Key.AsArray[LByRow]);
        MovingCells.Add(CellRec);
      end;
    for CellRec in MovingCells do
      Add(CellRec.Key, CellRec.Value);
  finally
    MovingCells.Free;
  end;
end;

procedure TGridValues.RemoveColumn(const ACol: Integer; const OnlyClear: Boolean);
begin
  if ACol < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ACol']);
  RemoveCells(ACol, False, OnlyClear);
end;

procedure TGridValues.RemoveRow(const ARow: Integer; const OnlyClear: Boolean);
begin
  if ARow < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ARow']);
  RemoveCells(ARow, True, OnlyClear);
end;

procedure TGridValues.MoveColumn(const OldCol, NewCol: Integer);
begin
  if OldCol < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['OldCol']);
  if NewCol < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['NewCol']);
  MoveCells(OldCol, NewCol, False);
end;

procedure TGridValues.MoveRow(const OldRow, NewRow: Integer);
begin
  if OldRow < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['OldRow']);
  if NewRow < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['NewRow']);
  MoveCells(OldRow, NewRow, True);
end;

procedure TGridValues.InsertColumn(const ACol: Integer);
begin
  if ACol < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ACol']);
  InsertCells(ACol, False);
end;

procedure TGridValues.InsertRow(const ARow: Integer);
begin
  if ARow < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ARow']);
  InsertCells(ARow, True);
end;

procedure TGridValues.SetCells(const ACol, ARow: Integer; const Value: TValue);
var
  Coord: TGridModel.TCoord;
  OldValue: TValue;
begin
  if ACol < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ACol'])at ReturnAddress;
  if ARow < 0 then
    raise EArgumentOutOfRangeException.CreateFMT(sArgumentOutOfRange_NeedNonNegValue, ['ARow'])at ReturnAddress;
  Coord.Col := ACol;
  Coord.Row := ARow;
  if TColumn.ValueIsEmpty(Value) then
  begin
    if TryGetValue(Coord, OldValue) then
    begin
      if OldValue.IsObject then
        OldValue.AsObject.DisposeOf;
      Remove(Coord);
      Changed(Coord);
    end;
  end
  else
  begin
    if TryGetValue(Coord, OldValue) then
    begin
      if not IsEqual(OldValue, Value) then
      begin
        if OldValue.IsObject then
          OldValue.AsObject.DisposeOf;
        Items[Coord] := Value;
        Changed(Coord);
      end;
    end
    else
    begin
      Add(Coord, Value);
      Changed(Coord);
    end;
  end;
end;

function TGridValues.GetCells(const ACol, ARow: Integer): TValue;
var
  Coord: TGridModel.TCoord;
begin
  Coord.Col := ACol;
  Coord.Row := ARow;
  if not TryGetValue(Coord, Result) then
    Result := TValue.Empty;
end;

function TGridValues.IsEqual(const OldValue, NewValue: TValue): Boolean;
begin
  Result := OldValue.Kind = NewValue.Kind;
  if Result then
  case NewValue.Kind of
    tkInteger, tkInt64, tkChar, tkWChar, tkEnumeration, tkSet:
      Result := OldValue.AsOrdinal = NewValue.AsOrdinal;
    tkFloat:
      Result := OldValue.asType<Extended> = NewValue.asType<Extended>;
    tkString, tkLString, tkWString, tkUString:
      Result := OldValue.ToString = NewValue.ToString;
    tkClass:
      Result := OldValue.AsObject = NewValue.AsObject;
  end
  else
    Result := False;
end;
{$ENDREGION}

type
  TGridScrollContent = class(TScrollContent)
  protected
    procedure PaintChildren; override;
  end;

{ TGridScrollContent }

procedure TGridScrollContent.PaintChildren;
begin
  if csDesigning in ComponentState then
    inherited;
end;

{ TCustomGrid }

constructor TCustomGrid.Create(AOwner: TComponent);
begin
  inherited;
  FImageLink := TGlyphImageLink.Create(Self);
  FImageLink.IgnoreIndex := True;
  ControlType := FMX.Controls.TControlType.Styled;
  RowCount := 100;
  CanFocus := True;
  SetAcceptsControls(False);
  Model.Enabled := True;
  FVKMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TVKStateChangeMessage, VKDisplacementHandler);
end;

destructor TCustomGrid.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TVKStateChangeMessage, FVKMessageId);
  ClearColumns;
  FImageLink.DisposeOf;
  inherited;
end;

procedure TCustomGrid.BeforeDestruction;
begin
  try
    Model.HideEditor(False);
  except
    // Ignore errors in custom methods
  end;
  inherited;
end;

procedure TCustomGrid.UnloadPresentation;
var
  I: Integer;
begin
  inherited;
  for I := 0 to ColumnCount - 1 do
    Columns[I].Init;
end;

procedure TCustomGrid.VKDisplacementHandler(const Sender: TObject; const Msg: System.Messaging.TMessage);
var
  R: TRectF;
  H: Single;
  Info: TGridModel.TVKInfo;
begin
  if Model <> nil then
  begin
    if TVKStateChangeMessage(Msg).KeyboardVisible and (TGridOption.AutoDisplacement in Options) then
    begin
      Info.Shown := True;
      R.TopLeft := ScreenToLocal(TPointF.Create(TVKStateChangeMessage(Msg).KeyboardBounds.TopLeft));
      R.BottomRight := ScreenToLocal(TPointF.Create(TVKStateChangeMessage(Msg).KeyboardBounds.BottomRight));
      if R.IntersectsWith(LocalRect) and (TRectF.Intersect(R, LocalRect) <> LocalRect) then
      begin
        H := R.Top - LocalRect.Top;
        if H > 0 then
        begin
          R.Bottom := R.Top;
          R.Top := LocalRect.Top;
          R.Left := LocalRect.Left;
          R.Right := LocalRect.Right;
          Info.AbsoluteRect.TopLeft := LocalToAbsolute(R.TopLeft);
          Info.AbsoluteRect.BottomRight := LocalToAbsolute(R.BottomRight);
          Model.SendMessageWithResult<TGridModel.TVKInfo>(PM_VKDISPLACEMENT, Info);
          FVKDisplacement := True;
        end;
      end;
    end
    else if FVKDisplacement then
    begin
      Info.Shown := False;
      Info.AbsoluteRect := TRectF.Empty;
      Model.SendMessageWithResult<TGridModel.TVKInfo>(PM_VKDISPLACEMENT, Info);
      FVKDisplacement := False;
    end;
  end;
end;

procedure TCustomGrid.ClearColumns;
var
  I: Integer;
  LColumn: TColumn;
begin
  BeginUpdate;
  try
    if Model <> nil then
    begin
      Model.HideEditor(False);
      for I := ColumnCount - 1 downto 0 do
      begin
        LColumn := Columns[I];
        Model.RemoveColumn(I);
        LColumn.DisposeOf;
      end;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TCustomGrid.AfterPaint;
var
  LLayout: TTextLayout;
  TextRect: TRectF;
begin
  inherited;
  if not HasPresentationProxy then
  begin
      LLayout := TTextLayoutManager.DefaultTextLayout.Create(Canvas);
      try
        TextRect := Padding.PaddingRect(LocalRect);
        LLayout.BeginUpdate;
        try
          LLayout.TopLeft := TPointF.Zero;
          LLayout.Text := Format(SProxyIsNotRegisteredWarning, [ClassName, 'FMX.Grid.Style']);
          LLayout.MaxSize := TSizeF.Create(TextRect.Width, TextRect.Height);
          LLayout.HorizontalAlign := TTextAlign.Center;
          LLayout.VerticalAlign := TTextAlign.Center;
          LLayout.Font.Assign((Self as ITextSettings).ResultingTextSettings.Font);
          LLayout.Font.Size := 11;
          LLayout.Trimming := TTextTrimming.None;
          LLayout.TopLeft := TextRect.TopLeft;
          LLayout.Opacity := DisabledOpacity;
          LLayout.WordWrap := True;
        finally
          LLayout.EndUpdate;
        end;
        LLayout.RenderLayout(Canvas);
      finally
        LLayout.Free;
      end;
  end;
end;

procedure TCustomGrid.ApplyStyle;
const
  StyleNames: array [0..5] of string = ('content', 'header', 'vscrollbar', 'hscrollbar', 'vsmallscrollbar',
    'hsmallscrollbar');
var
  LContent: TControl;
  I: Integer;
begin
  Model.Design := False;
  try
    inherited;
    if not HasPresentationProxy then
    begin
      for I := Low(StyleNames) to High(StyleNames) do
        if FindStyleResource<TControl>(StyleNames[I], LContent) then
          LContent.Visible := False;
    end;
  finally
    Model.Design := csDesigning in ComponentState;
  end;
end;

procedure TCustomGrid.FreeStyle;
begin
  Model.Design := False;
  try
    inherited;
  finally
    Model.Design := csDesigning in ComponentState;
  end;
end;

procedure TCustomGrid.Loaded;
begin
  // We disable notification from grid model on this time. Because in base TPresentedControl.Loaded method we finally
  // load presentation and in this case we don't need allow send notification from model, because presentation cannot be
  // fully loaded by this time. So do it after full loading.
  Model.BeginUpdate;
  try
    inherited;
  finally
    Model.EndUpdate;
  end;
  Model.UpdateColumnsIndex(True);
  Model.Design := csDesigning in ComponentState;
end;

procedure TCustomGrid.ContentAddObject(const AObject: TFmxObject);
begin
  if AObject is TColumn then
  begin
    Model.InternalInsertColumn(Model.ColumnCount, TColumn(AObject));
    inherited;
  end
  else
    inherited;
end;

procedure TCustomGrid.ContentInsertObject(Index: Integer; const AObject: TFmxObject);
begin
  if AObject is TColumn then
  begin
    Model.InternalInsertColumn(Index, TColumn(AObject));
    inherited;
  end
  else
    inherited;
end;

procedure TCustomGrid.ContentBeforeRemoveObject(AObject: TFmxObject);
var
  I: Integer;
begin
  if AObject is TColumn then
  begin
    inherited;
    I := Model.IndexOfColumn(TColumn(AObject));
    if I >= 0 then
      Model.RemoveColumn(I);
  end
  else
    inherited;
end;

{$REGION 'Trivial getters and setters that refer to Model'}

function TCustomGrid.GetIsUsedInBinding: Boolean;
begin
  Result := Model.IsUsedInBinding
end;

procedure TCustomGrid.SetIsUsedInBinding(const Value: Boolean);
begin
  Model.IsUsedInBinding := Value;
end;

function TCustomGrid.GetRowHeight: Single;
begin
  Result := Model.RowHeight;
end;

procedure TCustomGrid.SetRowHeight(const Value: Single);
begin
  Model.RowHeight := Value;
end;

function TCustomGrid.GetRowCount: Integer;
begin
  Result := Model.RowCount;
end;

procedure TCustomGrid.SetRowCount(const Value: Integer);
begin
  Model.RowCount := Value;
end;

function TCustomGrid.GetOptions: TGridOptions;
begin
  Result := Model.Options;
end;

procedure TCustomGrid.SetOptions(const Value: TGridOptions);
begin
  Model.Options := Value;
end;

function TCustomGrid.OptionsStored: Boolean;
begin
  Result := Model.IsOptionsStored;
end;

function TCustomGrid.GetDefaultDrawing: Boolean;
begin
  Result := Model.DefaultDrawing;
end;

function TCustomGrid.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(200, 100);
end;

procedure TCustomGrid.SetDefaultDrawing(const Value: Boolean);
begin
  Model.DefaultDrawing := Value;
end;

procedure TCustomGrid.SetEnabled(const Value: Boolean);
begin
  if Value <> inherited Enabled then
  begin
    Model.Enabled := Value;
    inherited SetEnabled(Model.Enabled);
  end;
end;

function TCustomGrid.GetCol: Integer;
begin
  Result := Model.Col;
end;

procedure TCustomGrid.SetCol(const Value: Integer);
begin
  Model.Col := Value;
end;

function TCustomGrid.GetRow: Integer;
begin
  Result := Model.Row;
end;

procedure TCustomGrid.SetRow(const Value: Integer);
begin
  if Model.Row <> Value then
  begin
    Model.Row := Value;
    if (Model.Row >= 0) and (Model.Row < Model.RowCount) then
      ScrollToSelectedCell;
  end;
end;

function TCustomGrid.GetOnHeaderClick: THeaderClick;
begin
  Result := Model.OnHeaderClick;
end;

procedure TCustomGrid.SetOnHeaderClick(const Value: THeaderClick);
begin
  Model.OnHeaderClick := Value;
end;

function TCustomGrid.GetOnCellClick: TCellClick;
begin
  Result := Model.OnCellClick;
end;

procedure TCustomGrid.SetOnCellClick(const Value: TCellClick);
begin
  Model.OnCellClick := Value;
end;

function TCustomGrid.GetOnCellDblClick: TCellClick;
begin
  Result := Model.OnCellDblClick;
end;

procedure TCustomGrid.SetOnCellDblClick(const Value: TCellClick);
begin
  Model.OnCellDblClick := Value;
end;

function TCustomGrid.GetOnColumnMoved: TColumnMovedEvent;
begin
  Result := Model.OnColumnMoved;
end;

procedure TCustomGrid.SetOnColumnMoved(const Value: TColumnMovedEvent);
begin
  Model.OnColumnMoved := Value;
end;

function TCustomGrid.GetOnDrawColumnHeader: TDrawColumnHeaderEvent;
begin
  Result := Model.OnDrawColumnHeader;
end;

procedure TCustomGrid.SetOnDrawColumnHeader(const Value: TDrawColumnHeaderEvent);
begin
  Model.OnDrawColumnHeader := Value;
end;

function TCustomGrid.GetOnSelectCell: TSelectCell;
begin
  Result := Model.OnSelectCell;
end;

procedure TCustomGrid.SetOnSelectCell(const Value: TSelectCell);
begin
  Model.OnSelectCell := Value;
end;

function TCustomGrid.GetOnSelChanged: TNotifyEvent;
begin
  Result := Model.OnSelChanged;
end;

procedure TCustomGrid.SetOnSelChanged(const Value: TNotifyEvent);
begin
  Model.OnSelChanged := Value;
end;

function TCustomGrid.GetOnDrawColumnBackground: TDrawColumnCellEvent;
begin
  Result := Model.OnDrawColumnBackground;
end;

procedure TCustomGrid.SetOnDrawColumnBackground(const Value: TDrawColumnCellEvent);
begin
  Model.OnDrawColumnBackground := Value;
end;

function TCustomGrid.GetOnDrawColumnCell: TDrawColumnCellEvent;
begin
  Result := Model.OnDrawColumnCell;
end;

procedure TCustomGrid.SetOnDrawColumnCell(const Value: TDrawColumnCellEvent);
begin
  Model.OnDrawColumnCell := Value;
end;

function TCustomGrid.GetOnCallbackGetValue: TOnCallbackGetValue;
begin
  Result := Model.OnCallbackGetValue;
end;

function TCustomGrid.GetOnGetValue: TOnGetValue;
begin
  Result := Model.OnGetValue;
end;

procedure TCustomGrid.SetOnGetValue(const Value: TOnGetValue);
begin
  Model.OnGetValue := Value;
end;

procedure TCustomGrid.SetOnSetValue(const Value: TOnSetValue);
begin
  if IsUsedInBinding then
    raise EComponentError.Create(SCannotChangeInLiveBinding);
  if not (csDestroying in ComponentState) then
    Model.OnSetValue := Value;
end;

function TCustomGrid.GetOnCreateCustomEditor: TCreateCustomEditorEvent;
begin
  Result := Model.OnCreateCustomEditor;
end;

procedure TCustomGrid.SetOnCreateCustomEditor(const Value: TCreateCustomEditorEvent);
begin
  Model.OnCreateCustomEditor := Value;
end;

function TCustomGrid.GetOnEditingDone: TOnEditingDone;
begin
  Result := Model.OnEditingDone;
end;

procedure TCustomGrid.SetOnEditingDone(const Value: TOnEditingDone);
begin
  Model.OnEditingDone := Value;
end;

{$ENDREGION}

function TCustomGrid.GetModel: TGridModel;
begin
  Result := GetModel<TGridModel>;
end;

function TCustomGrid.ColumnByIndex(const Idx: Integer): TColumn;
begin
  if (Idx >= 0) and (Idx < Model.ColumnCount) then
    Result := Model.Columns[Idx]
  else
    Result := nil;
end;

function TCustomGrid.ColumnByPoint(const X, Y: Single): TColumn;
var
  LCol, LRow: Integer;
begin
  CellByPoint(X, Y, LCol, LRow);
  Result := ColumnByIndex(LCol);
end;

function TCustomGrid.RowByPoint(const X, Y: Single): Integer;
var
  LCol, LRow: Integer;
begin
  CellByPoint(X, Y, LCol, LRow);
  Result := LRow;
end;

function TCustomGrid.CanEdit: Boolean;
begin
  Model.SendMessageWithResult<Boolean>(PM_CAN_EDIT, Result);
end;

function TCustomGrid.CanObserve(const ID: Integer): Boolean;
begin
  Result := inherited CanObserve(ID);
  if ID = TObserverMapping.EditGridLinkID then
    Result := True
  else if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

procedure TCustomGrid.ObserverAdded(const ID: Integer; const Observer: IObserver);
var
  LGridLinkObserver: IEditGridLinkObserver;
begin
  if ID = TObserverMapping.EditGridLinkID then
    Observer.OnObserverToggle := ObserverToggle;
  if Supports(Observer, IEditGridLinkObserver, LGridLinkObserver) then
    LGridLinkObserver.OnObserverCurrent := ObserverCurrent;
end;

function TCustomGrid.ObserverCurrent: TVarRec;
begin
  Result.VType := vtInteger;
  Result.VInteger := Col;
end;

procedure TCustomGrid.ObserverToggle(const AObserver: IObserver; const Value: Boolean);
begin
  // Code to use observers removed.  Observers
  // do not affect ReadOnly property of a grid.
end;

function TCustomGrid.CellByPoint(const X, Y: Single; var ACol, ARow: Integer): Boolean;
var
  Info: TGridModel.TPointInfo;
begin
  Info.Point := LocalToAbsolute(TPointF.Create(X, Y));
  Info.Coord.Clear;
  Model.SendMessageWithResult<TGridModel.TPointInfo>(PM_CELL_BY_POINT, Info);
  Result := not Info.Coord.IsEmpty;
  ACol := Info.Coord.Col;
  ARow := Info.Coord.Row;
end;

function TCustomGrid.CellRect(const ACol, ARow: Integer): TRect;
var
  CellInfo: TGridModel.TCellInfo;
begin
  CellInfo.Coord.Col := ACol;
  CellInfo.Coord.Row := ARow;
  CellInfo.Rect := TRect.Create(-1, -1, -1, -1);
  Model.SendMessageWithResult<TGridModel.TCellInfo>(MM_CELL_RECT, CellInfo);
  Result := CellInfo.Rect;
end;

function TCustomGrid.DisplayCells(var TopLeft, BottomRight: TGridModel.TCoord): Boolean;
var
  RectCoord: TGridModel.TRectCoord;
begin
  RectCoord.TopLeft.Clear;
  RectCoord.BottomRight.Clear;
  Model.SendMessageWithResult<TGridModel.TRectCoord>(PM_GET_DISPLAY_CELLS, RectCoord);
  Result := not (RectCoord.TopLeft.IsEmpty or RectCoord.BottomRight.IsEmpty);
  TopLeft := RectCoord.TopLeft;
  BottomRight := RectCoord.BottomRight;
end;

procedure TCustomGrid.DoBeginUpdate;
begin
  if Model <> nil then
    Model.BeginUpdate;
  inherited;
end;

procedure TCustomGrid.DoEndUpdate;
begin
  inherited;
  if Model <> nil then
    Model.EndUpdate;
end;

function TCustomGrid.CreateScrollContent: TScrollContent;
begin
  Result := TGridScrollContent.Create(Self);
end;

function TCustomGrid.DefineModelClass: TDataModelClass;
begin
  Result := TGridModel;
end;

procedure TCustomGrid.SetOnCallbackGetValue(const Value: TOnCallbackGetValue);
begin
  if IsUsedInBinding then
    raise EComponentError.Create(SCannotChangeInLiveBinding);
  if not (csDestroying in ComponentState) then
    Model.OnCallbackGetValue := Value;
end;

function TCustomGrid.GetOnSetValue: TOnSetValue;
begin
  Result := Model.OnSetValue;
end;

function TCustomGrid.GetColumns(Index: Integer): TColumn;
begin
  Result := Model.Columns[Index];
end;

function TCustomGrid.GetColumnCount: Integer;
begin
  Result := Model.ColumnCount;
end;

function TCustomGrid.GetVisibleColumnCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Model.ColumnCount - 1 do
    if Model.Columns[I].Visible then
      Inc(Result);
end;

function TCustomGrid.GetTopRow: Integer;
var
  TopLeft, BottomRight: TGridModel.TCoord;
begin
  DisplayCells(TopLeft, BottomRight);
  Result := TopLeft.Row;
end;

procedure TCustomGrid.SetTopLeft(const ACol, ARow: Integer);
var
  LCoord: TGridModel.TCoord;
begin
  if (ACol >= 0) and (ACol < ColumnCount) then
    LCoord.Col := ACol
  else
    LCoord.Col := -1;
  if (ARow >= 0) and (ARow < RowCount) then
    LCoord.Row := ARow
  else
    LCoord.Row := -1;
  if (LCoord.Col <> Col) or (LCoord.Row <> Row) then
    Model.SendMessageWithResult<TGridModel.TCoord>(PM_SET_TOP_LEFT, LCoord);
end;

procedure TCustomGrid.SetTopRow(const Value: Integer);
begin
  SetTopLeft(-1, Value);
end;

function TCustomGrid.GetBottomRow: Integer;
var
  TopLeft, BottomRight: TGridModel.TCoord;
begin
  DisplayCells(TopLeft, BottomRight);
  Result := BottomRight.Row;
end;

function TCustomGrid.GetLeftColumn: Integer;
var
  TopLeft, BottomRight: TGridModel.TCoord;
begin
  DisplayCells(TopLeft, BottomRight);
  Result := TopLeft.Col;
end;

procedure TCustomGrid.SetLeftColumn(const Value: Integer);
begin
  SetTopLeft(Value, -1);
end;

function TCustomGrid.GetRightColumn: Integer;
var
  TopLeft, BottomRight: TGridModel.TCoord;
begin
  DisplayCells(TopLeft, BottomRight);
  Result := BottomRight.Col;
end;

function TCustomGrid.GetVisibleRows: Integer;
var
  TopLeft, BottomRight: TGridModel.TCoord;
begin
  DisplayCells(TopLeft, BottomRight);
  if (TopLeft.Row >= 0) and (BottomRight.Row >= 0) then
    Result := Max(0, BottomRight.Row - TopLeft.Row + 1)
  else
    Result := 0;
end;

function TCustomGrid.GetEditorMode: Boolean;
begin
  Result := Model.GetEditorMode;
end;

procedure TCustomGrid.SetEditorMode(const Value: Boolean);
begin
  Model.SetEditorMode(Value);
end;

procedure TCustomGrid.ScrollToSelectedCell;
begin
  Model.SendMessage(PM_SCROLL_TO_SELECT);
end;

procedure TCustomGrid.SelectCell(Col, Row: Integer);
begin
  Model.SelectCell(Col, Row);
end;

procedure TCustomGrid.SelectColumn(const Value: Integer);
begin
  Model.SelectCell(Value, Model.Row);
end;

procedure TCustomGrid.SelectRow(const Value: Integer);
begin
  Model.SelectCell(Model.Col, Value);
end;

function TCustomGrid.GetDefaultTextSettings: TTextSettings;
begin
  Result := Model.GetDefaultTextSettings;
end;

function TCustomGrid.GetTextSettings: TTextSettings;
begin
  Result := Model.GetTextSettings;
end;

procedure TCustomGrid.SetTextSettings(const Value: TTextSettings);
begin
  Model.SetTextSettings(Value);
end;

function TCustomGrid.GetResultingTextSettings: TTextSettings;
begin
  Result := Model.GetResultingTextSettings;
end;

function TCustomGrid.GetStyledSettings: TStyledSettings;
begin
  Result := Model.GetStyledSettings;
end;

procedure TCustomGrid.SetSelected(const Value: Integer);
begin
  if Selected <> Value then
  begin
    Model.SetSelected(Value);
    if (Model.Row >= 0) and (Model.Row < Model.RowCount) then
      ScrollToSelectedCell;
  end;
end;

procedure TCustomGrid.SetStyledSettings(const Value: TStyledSettings);
begin
  Model.SetStyledSettings(Value);
end;

function TCustomGrid.StyledSettingsStored: Boolean;
begin
  Result := Model.StyledSettingsStored;
end;

function TCustomGrid.GetImageIndex: TImageIndex;
begin
  Result := -1;
end;

procedure TCustomGrid.SetImageIndex(const Value: TImageIndex);
begin
  { none }
end;

function TCustomGrid.GetImageList: TBaseImageList;
begin
  Result := FImageLink.Images;
end;

procedure TCustomGrid.SetImageList(const Value: TBaseImageList);
begin
  ValidateInheritance(Value, TCustomImageList, True);
  FImageLink.Images := Value;
end;

procedure TCustomGrid.SetImages(const Value: TCustomImageList);
begin
  FImageLink.Images := Value;
end;

function TCustomGrid.GetImages: TCustomImageList;
begin
  Result := TCustomImageList(FImageLink.Images);
end;

procedure TCustomGrid.ImagesChanged;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to ColumnCount - 1 do
      Columns[I].Changed;
  finally
    EndUpdate;
  end;
end;

function TCustomGrid.GetItemsCount: Integer;
begin
  Result := ColumnCount;
end;

function TCustomGrid.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Columns[AIndex];
end;

function TCustomGrid.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TCustomGrid.GetReadOnly: Boolean;
begin
  Result := not (TGridOption.Editing in Options);
end;

procedure TCustomGrid.SetReadOnly(const Value: Boolean);
begin
  if Value then
    Options := Options - [TGridOption.Editing]
  else
    Options := Options + [TGridOption.Editing];
end;

{ TGrid }

procedure TGrid.DoEndUpdate;
begin
  Model.ClearCache;
  inherited;
end;

function TGrid.GetDefaultStyleLookupName: string;
begin
  Result := 'gridstyle';
end;

{ TStringGridModel }

type
  TStringGridValues = class(TGridValues)
  private
    FStringModel: TStringGridModel;
  protected
    procedure Changed(const ACoord: TGridModel.TCoord); override;
  public
    constructor Create(const AOwner: TGridModel); override;
  end;

  { TStringGridValues }

constructor TStringGridValues.Create(const AOwner: TGridModel);
begin
  ValidateInheritance(AOwner, TStringGridModel, False);
  inherited;
  FStringModel := TStringGridModel(AOwner);
end;

procedure TStringGridValues.Changed(const ACoord: TGridModel.TCoord);
begin
  inherited;
  if not FStringModel.IsUpdating and (FStringModel.Owner <> nil) and
    not (csDestroying in FStringModel.Owner.ComponentState) then
    FStringModel.ValueChanged(ACoord);
end;

constructor TStringGridModel.Create(const AOwner: TComponent);
begin
  inherited;
  DataStored := True;
end;

function TStringGridModel.CreateCache: TGridValues;
begin
  Result := TStringGridValues.Create(Self);
end;

function TStringGridModel.DoGetValue(Col, Row: Integer): TValue;
begin
  if not IsUsedInBinding then
  begin
    Result := Cells[Col, Row];
    if Result.AsString.IsEmpty then
      Result := TValue.Empty;
  end
  else
    Result := TValue.Empty;
end;

procedure TStringGridModel.DoSetValue(Col, Row: Integer; const Value: TValue);
begin
  if not FCellsChanging then
  begin
    FCellsChanging := True;
    try
      if not IsUsedInBinding then
        Cells[Col, Row] := Columns[Col].ValueToString(Value);
      inherited;
    finally
      FCellsChanging := False;
    end;
  end;
end;

function TStringGridModel.GetCells(const ACol, ARow: Integer): string;
begin
  if (ACol < 0) or (ACol >= ColumnCount) or (ARow < 0) or (ARow >= RowCount) then
    Result := string.Empty
  else
    Result := Cache.Cells[ACol, ARow].AsString;
end;

procedure TStringGridModel.SetCells(const ACol, ARow: Integer; const Value: string);
begin
  if (ACol < 0) or (ACol >= ColumnCount) then
    raise EArgumentOutOfRangeException.CreateResFmt(@SInvalidColumnIndex, [ACol]);
  if (ARow < 0) or (ARow >= RowCount) then
    raise EArgumentOutOfRangeException.CreateResFmt(@SInvalidRowIndex, [ARow]);
  Cache.Cells[ACol, ARow] := Value;
end;

procedure TStringGridModel.ValueChanged(const ACoord: TGridModel.TCoord);
var
  NeedUpdateEditor: Boolean;
begin
  if not FCellsChanging and (ACoord.Col >= 0) and (ACoord.Col < ColumnCount) and (ACoord.Row >= 0) and
    (ACoord.Row < RowCount) and (Columns[ACoord.Col].EffectiveVisible) then
  begin
    NeedUpdateEditor := EditorMode and (Col = ACoord.Col) and (Row = ACoord.Row);
    if NeedUpdateEditor then
      HideEditor(False);
    if Columns[ACoord.Col].Width > 0 then
      SendMessage<TCoord>(MM_INVALIDATE_CELL, ACoord);
    if NeedUpdateEditor then
      ShowEditor;
  end;
end;

{ TStringGrid }

function TStringGrid.GetModel: TStringGridModel;
begin
  Result := GetModel<TStringGridModel>;
end;

function TStringGrid.DefineModelClass: TDataModelClass;
begin
  Result := TStringGridModel;
end;

function TStringGrid.GetCells(const ACol, ARow: Integer): string;
begin
  Result := Model.GetCells(ACol, ARow);
end;

procedure TStringGrid.SetCells(const ACol, ARow: Integer; const Value: string);
begin
  Model.SetCells(ACol, ARow, Value);
end;

function TStringGrid.GetDefaultStyleLookupName: string;
begin
  Result := 'gridstyle';
end;

{ TColumnClasses }

class function TColumnClasses.IsRegistered(const AClass: TComponentClass): Boolean;
begin
  Result := False;
  if (AClass <> nil) and (FRegisteredColumns <> nil) and (AClass.InheritsFrom(TColumn)) then
    Result := FRegisteredColumns.Contains(TColumnClass(AClass));
end;

class procedure TColumnClasses.Register(const RegColumns: array of TColumnClass);
var
  I: Integer;
begin
  if (Length(RegColumns) > 0) and not FUninitialized then
  begin
    if FRegisteredColumns = nil then
      FRegisteredColumns := TList<TColumnClass>.Create;
    for I := Low(RegColumns) to High(RegColumns) do
      if not FRegisteredColumns.Contains(RegColumns[I]) then
      begin
        RegisterFmxClasses([RegColumns[I]]);
        FRegisteredColumns.Add(RegColumns[I]);
      end;
  end;
end;

class procedure TColumnClasses.Unregister(const RegColumns: array of TColumnClass);
var
  I: Integer;
begin
  if FRegisteredColumns <> nil then
  begin
    for I := High(RegColumns) downto Low(RegColumns) do
      if FRegisteredColumns.Contains(RegColumns[I]) then
      begin
        UnRegisterClass(RegColumns[I]);
        FRegisteredColumns.Remove(RegColumns[I]);
      end;
    if FRegisteredColumns.Count = 0 then
      FreeAndNil(FRegisteredColumns);
  end;
end;

class function TColumnClasses.RegisteredColumns: TArray<TColumnClass>;
begin
  if FRegisteredColumns <> nil then
    Result := FRegisteredColumns.ToArray
  else
    Result := [];
end;

class procedure TColumnClasses.Uninitialize;
begin
  if not FUninitialized then
  begin
    FreeAndNil(FRegisteredColumns);
    FUninitialized := True;
  end;
end;

initialization

RegisterFmxClasses([TGrid, TStringGrid]);

TColumnClasses.Register([TColumn, TStringColumn, TProgressColumn, TCheckColumn, TDateColumn, TTimeColumn, TPopupColumn,
  TImageColumn, TCurrencyColumn, TFloatColumn, TIntegerColumn, TGlyphColumn]);

finalization

TColumnClasses.Uninitialize;

end.
