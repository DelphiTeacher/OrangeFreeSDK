//[上海]风舞轻扬(81924320) 2016-9-28 11:19:29
//苹果自带的输入法
//没办法输入小数点，可以修改
//UIKeyboardTypeNumberPad 修改为 UIKeyboardTypeDecimalPad即可
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2015-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Grid.iOS;

interface

{$SCOPEDENUMS ON}

{$HPPEMIT LINKUNIT}

uses
  System.TypInfo, System.UITypes, System.SysConst, System.SysUtils, System.Math, System.Messaging, System.Types,
  System.Classes, System.Rtti, System.Generics.Defaults, System.Generics.Collections, Macapi.ObjectiveC, Macapi.Helpers,
  iOSapi.CocoaTypes, iOSapi.Foundation, iOSapi.CoreGraphics, iOSapi.UIKit, iOSapi.CoreImage, FMX.Presentation.iOS,
  FMX.ScrollBox.iOS, FMX.Controls.Model, FMX.Controls.Presentation, FMX.Presentation.Messages, FMX.Controls, FMX.Edit,
  FMX.Graphics, FMX.Types, FMX.ActnList, FMX.Pickers, FMX.ScrollBox, FMX.MediaLibrary, FMX.Grid;

type
  TiOSGrid = class;
  TColumnItem = class;
  TiOSCellControlClass = class of TiOSCellControl;

  TImageKind = (Empty, False, True);

  IiOSLineView = interface(UIView)
    ['{2DD824DE-1D0E-42A3-9F9F-B6A2A840EB0C}']
  end;

  /// <summary> This graphics object is used for drawing separator lines (cell borders) </summary>
  TiOSLineView = class(TOCLocal)
  strict private
    [Weak] FParentView: UIView;
    [Weak] FFromView: UIView;
    FThickness: CGFloat;
    FHorizontal: Boolean;
    FLeading: Boolean;
    FInitialized: Boolean;
  private
    FOffset: NSPoint;
    procedure SetThickness(const Value: CGFloat);
    procedure SetHorizontal(const Value: Boolean);
    procedure SetLeading(const Value: Boolean);
    function GetVisible: Boolean; inline;
    procedure SetVisible(const Value: Boolean); inline;
    function GetView: UIView; inline;
    procedure SetOffset(const Value: NSPoint);
  protected
    function GetObjectiveCClass: PTypeInfo; override;
  public
    /// <summary> Create a new separator line </summary>
    /// <param name="AiOSGrid"> Grid that owns this object </param>
    /// <param name="AParent"> The view on which this object is placed </param>
    /// <param name="AHorizontal"> If <c>true</c> this is horizontal line otherwise this is vertical line </param>
    /// <param name="ALeading"> If <c>true</c> this line is placed on the left or on the top otherwise on the right
    /// or on the bottom from <c>AFromView</c></param>
    /// <param name="AFromView"> The view to which this line is applied. Its coordinates are used to set the coordinates
    /// of <b>TiOSLineView</b> view boundary. For example: <see cref="FMX.Grid.iOS|TiOSHeaderItem">TiOSHeaderItem</see>.
    /// If <c>nil</c> (by default) then <c>AParent</c> will be used </param>
    constructor Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AHorizontal, ALeading: Boolean;
      const AFromView: UIView = nil);
    destructor Destroy; override;
    procedure Update;
    property Horizontal: Boolean read FHorizontal write SetHorizontal;
    property Leading: Boolean read FLeading write SetLeading;
    property Thickness: CGFloat read FThickness write SetThickness;
    property Visible: Boolean read GetVisible write SetVisible;
    /// <summary> The offset relative to the default location of the line, which is determined by the
    /// <see cref="FMX.Grid.iOS|TiOSLineView.Create">constructor</see> parameters (<c>AHorizontal</c>, <c>ALeading</c>,
    /// <c>AFromView</c>) </summary>
    property Offset: NSPoint read FOffset write SetOffset;
    property View: UIView read GetView;
  end;

  /// <summary> The base class of cell controls. It is used for painting and editing cells.
  /// See <see cref="FMX.Grid.iOS|TiOSGrid.GetCellClass">TiOSGrid.GetCellClass</see>,
  /// <see cref="FMX.Grid.iOS|TColumnItem.CreateInternalCell">TColumnItem.CreateInternalCell</see>
  /// </summary>
  /// <remarks> Cell interior without the separator lines around. It that placed in the
  /// <see cref="FMX.Grid.iOS|TColumnItem">TColumnItem</see> instance </remarks>
  TiOSCellControl = class(TOCLocal)
  public type
    /// <summary> Cell states used to select an action in asynchronous calls
    /// <para>Normal - neutral state (default) </para>
    /// <para>Touching - the user touched the screen somewhere in the table</para>
    /// <para>Cancel - the drop-down list has been cancelled </para>
    /// <para>Done - a new value must be entered </para>
    /// </summary>
    TState = (Normal, Touching, Cancel, Done);
  strict private
    [Weak] FOwner: TColumnItem;
  private
    function GetColumn: TColumn; inline;
    function GetView: UIView; inline;
    function GetAbsoluteRect: TRectF;
  protected
    function GetData: TValue; virtual; abstract;
    procedure SetData(const Value: TValue); virtual; abstract;
    /// <summary> The heirs should override this method to update the appearance of control on the basis of the new
    /// property values. This method is called from the <see cref="FMX.Grid.iOS|TiOSCellControl.Update">Update</see>
    /// </summary>
    procedure DoUpdate; virtual; abstract;
    /// <summary> Returns the preferable bounds of the control in
    /// <see cref="FMX.Grid.iOS|TiOSCellControl.Owner">Owner</see>'s coordinates </summary>
    function GetFrame: NSRect; virtual;
    /// <summary> This method is called asynchronously to initialize the cell editor </summary>
    procedure Activate; virtual;
    /// <summary> This method is called to display editor as inactive </summary>
    procedure Deactivate; virtual;
  public
    constructor Create(const AOwner: TColumnItem); virtual;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    /// <summary> Call <see cref="FMX.Grid.iOS|TiOSCellControl.DoUpdate">DoUpdate</see> if either width or height of the
    /// view is larger than <c>1</c> (no very small) </summary>
    procedure Update;
    /// <summary> This method is called asynchronously when the editor is touched </summary>
    procedure EditorClick; virtual;
    /// <summary> Setup up <see cref="FMX.Grid.iOS|TiOSTable.State">iOSTable.State</see> property, performs the
    /// <c>Proc</c> procedure (if defined) and executes the
    /// <see cref="FMX.Grid.iOS|TiOSQueue.RestoreFocus">TiOSQueue.RestoreFocus</see> method asynchronously </summary>
    function RestoreFocus(const State: TState; const Proc: TProc = nil): Boolean;
    /// <summary> The column to which the cell belongs </summary>
    property Column: TColumn read GetColumn;
    /// <summary> The container which houses this object </summary>
    property Owner: TColumnItem read FOwner;
    /// <summary> Data displayed in the cell </summary>
    property Data: TValue read GetData write SetData;
    property View: UIView read GetView;
    /// <summary> Cell coordinates relative to the form </summary>
    property AbsoluteRect: TRectF read GetAbsoluteRect;
  end;

  IiOSCellLabel = interface(UILabel)
    ['{28363B27-5F26-4731-8A1F-D190BBA47F5D}']
  end;

  /// <summary> The plain text cell. This class used by default if
  /// <see cref="FMX.Grid.iOS|TiOSGrid.GetCellClass">GetCellClass</see> returns <c>nil</c> </summary>
  TiOSCellLabel = class(TiOSCellControl)
  strict private
    FText: string;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    function GetFrame: NSRect; override;
    procedure DoUpdate; override;
  end;

  IiOSCellHeader = interface(UILabel)
    ['{2836337A-F1D1-4184-8B64-0E500FF65546}']
  end;

  /// <summary> The plain text header of column. This class used by default in
  /// <see cref="FMX.Grid.iOS|TiOSHeaderItem.CreateInternalCell">TiOSHeaderItem.CreateInternalCell</see></summary>
  TiOSCellHeader = class(TiOSCellControl)
  strict private
    FText: string;
    FEnabled: Boolean;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
  public
    constructor Create(const AOwner: TColumnItem); override;
  end;

  IiOSCellDefaultEditor = interface(UITextField)
    ['{28363F82-B7C8-479C-A1A0-9417B944488A}']
    procedure ControlEventEditingChanged; cdecl;
  end;

  /// <summary> The plain cell editor. This class used by default if
  /// <see cref="FMX.Grid.iOS|TiOSGrid.GetEditorClass">GetEditorClass</see> returns <c>nil</c> </summary>
  TiOSCellDefaultEditor = class(TiOSCellControl)
  private
    FTextUpdating: Boolean;
    FStoredText: string;
    FNewText: string;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetText(const Text: string);
    procedure SetData(const Value: TValue); override;
    function GetFrame: NSRect; override;
    procedure DoUpdate; override;
    /// <summary> The deleting from text all invalid symbols. It called from
    /// <see cref="FMX.Grid.iOS|TiOSCellDefaultEditor.ControlEventEditingChanged">ControlEventEditingChanged</see>
    /// method
    /// <para> See also <see cref="FMX.Grid|TColumn.ValidChar">TColumn.ValidChar</see></para> </summary>
    procedure DoUpdateChangedText(var Text: string); virtual;
  public
    constructor Create(const AOwner: TColumnItem); override;
    destructor Destroy; override;
    procedure ControlEventEditingChanged; cdecl;
  end;

  IiOSCurrencyLabel = interface(UILabel)
    ['{28363387-55A6-4CC7-88C3-1FD3B102F007}']
  end;

  /// <summary> The usual text of numeric (currency, float, integer) values </summary>
  TiOSCurrencyLabel = class(TiOSCellLabel)
  protected
    function GetObjectiveCClass: PTypeInfo; override;
  end;

  IiOSCurrencyEditor = interface(UITextField)
    ['{2836389D-CE65-446E-AD40-382199969377}']
    procedure ControlEventEditingChanged; cdecl;
  end;

  /// <summary> Default currency editor </summary>
  TiOSCurrencyEditor = class(TiOSCellDefaultEditor)
  strict private
    FValue: CGFloat;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
  end;

  IiOSNumberEditor = interface(UITextField)
    ['{1DB01CB5-CE65-4AB0-ACAD-DB4EDC7B208C}']
    procedure ControlEventEditingChanged; cdecl;
  end;

  /// <summary> The default editor of float and integer values </summary>
  TiOSNumberEditor = class(TiOSCurrencyEditor)
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure SetData(const Value: TValue); override;
  end;

  IiOSCellProgressBar = interface(UIView)
    ['{2DD82E1E-116D-411F-BD54-DC78612B6012}']
  end;

  /// <summary> The usual cell to display progress bars </summary>
  TiOSCellProgressBar = class(TiOSCellControl)
  private
    FValue: CGFloat;
    FForeground: UIView;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
    function GetFrame: NSRect; override;
  public
    procedure AfterConstruction; override;
  end;

  IiOSCellDatePicker = interface(UIView)
    ['{283634C8-F120-4304-92A1-E0CEBC5DFD00}']
  end;

  /// <summary> The usual cell editor for date and time
  /// (defined by <see cref="FMX.Grid.iOS|TiOSCellDatePicker.GetPickerShowMode">GetPickerShowMode</see>) </summary>
  TiOSCellDatePicker = class(TiOSCellControl)
  strict private
    FDateTime: TDateTime;
    FInitialized: Boolean;
    FTextIsPreferred: Boolean;
    FPicker: TCustomDateTimePicker;
    procedure DoPopup(Sender: TObject);
    procedure DoClosePopup(Sender: TObject);
    procedure DoApply(Sender: TObject; const ADateTime: TDateTime);
    procedure SetDateTime(const DateTime: TDateTime);
  private
    FTextField: UITextField;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    function GetFrame: NSRect; override;
    procedure DoUpdate; override;
    procedure DoUpdateField(const AField: UITextField; const ADateTime: TDateTime); virtual;
    /// <summary> Used to determine if we are editing time or date </summary>
    function GetPickerShowMode: TDatePickerShowMode; virtual;
    function ValueToDateTime(const Value: TValue): TDateTime; virtual;
    procedure Activate; override;
    procedure Deactivate; override;
  public
    constructor Create(const AOwner: TColumnItem); override;
    destructor Destroy; override;

    procedure BeforeDestruction; override;
    procedure UpdateField;
    property DateTime: TDateTime read FDateTime write SetDateTime;
  end;

  IiOSCellTimePicker = interface(UIView)
    ['{28363A6E-AFA3-4992-94EB-E2B800F97E3C}']
  end;

  /// <summary> The usual cell editor for time </summary>
  TiOSCellTimePicker = class(TiOSCellDatePicker)
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure DoUpdateField(const AField: UITextField; const ADateTime: TDateTime); override;
    function GetPickerShowMode: TDatePickerShowMode; override;
    function ValueToDateTime(const Value: TValue): TDateTime; override;
  end;

  IiOSCellPopupLabel = interface(UILabel)
    ['{28363849-100C-4675-8502-EB36DCA7CBF7}']
  end;

  /// <summary> The plain text for cell with list of values. It can use the integer index to display text </summary>
  TiOSCellPopupLabel = class(TiOSCellLabel)
  strict private
    FValue: TValue;
    FUsingIndex: Boolean;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    property UsingIndex: Boolean read FUsingIndex;
  end;

  IiOSCellPopupPicker = interface(UILabel)
    ['{283637AB-6EA6-4515-8C77-98729DBF649B}']
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
  end;

  /// <summary> The editor for cell with list of values </summary>
  TiOSCellPopupPicker = class(TiOSCellPopupLabel)
  strict private
    FPicker: TCustomListPicker;
  private
    procedure DoApply(Sender: TObject; const AValueIndex: Integer);
    procedure DoClosePopup(Sender: TObject);
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure Activate; override;
    procedure Deactivate; override;
  public
    destructor Destroy; override;
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
  end;

  IiOSCellGlyph = interface(UIImageView)
    ['{2836336D-9724-4BC7-8F74-1ACCD612AF76}']
  end;

  /// <summary> The cell that displays the picture from the <see cref="FMX.ImgList|TCustomImageList">ImageList</see>
  /// </summary>
  TiOSCellGlyph = class(TiOSCellControl)
  strict private
    FImageIndex: TImageIndex;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
  public
    constructor Create(const AOwner: TColumnItem); override;
  end;

  IiOSCellImage = interface(UIImageView)
    ['{28363839-4327-48EC-8E8E-A1CA4FA3CA27}']
  end;

  /// <summary> The cell that displays the picture from the <see cref="FMX.Graphics|TBitmap">Bitmap</see> </summary>
  TiOSCellImage = class(TiOSCellControl)
  strict private
    FImage: UIImage;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    function GetFrame: NSRect; override;
    procedure DoUpdate; override;
  end;

  IiOSCellImageEditor = interface(UIView)
    ['{283635BC-685C-4619-B6B9-2C0F355CB48D}']
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
  end;

  /// <summary> The editor that can select the <see cref="FMX.Graphics|TBitmap">Bitmap</see> </summary>
  TiOSCellImageEditor = class(TiOSCellControl)
  private
    FBitmap: TBitmap;
    FBitmapLoaded: Boolean;
    FImageControl: TiOSCellImage;
    FTakenImageService: IFMXTakenImageService;
    procedure DidReceiveBitmap(const Sender: TObject; const M: TMessage);
  protected
    procedure DoApply(AImage: TBitmap); virtual;
    procedure DoClosePopup;
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
  public
    constructor Create(const AOwner: TColumnItem); override;
    destructor Destroy; override;
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure EditorClick; override;
  end;

  IiOSCellCheck = interface(UIImageView)
    ['{2836383A-0872-4626-ABC1-4734E7CEB3A0}']
  end;

  /// <summary> Cell that displays a picture of a check box. This picture is taken from the default style for the
  /// current platform </summary>
  TiOSCellCheck = class(TiOSCellControl)
  strict private
    FValue: TImageKind;
    FInitialized: Boolean;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
    function GetFrame: NSRect; override;
  end;

  IiOSCellCheckEditor = interface(UIView)
    ['{283634F2-8791-49EB-9EEA-2C3E5B41366C}']
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
  end;

  /// <summary> Cell editor that can edit status of a checkbox
  /// <para> See also <see cref="FMX.Grid.iOS|TiOSCellCheck">TiOSCellCheck</see></para> </summary>
  TiOSCellCheckEditor = class(TiOSCellControl)
  private
    FCheckControl: TiOSCellCheck;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoUpdate; override;
  public
    constructor Create(const AOwner: TColumnItem); override;
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure EditorClick; override;
  end;

  IFMXColumnItem = interface(UIView)
    ['{283638CF-3A80-4238-A5C1-311CFB381D79}']
  end;

  /// <summary> A container which contains a cell
  /// (<see cref="FMX.Grid.iOS|TColumnItem.InternalCell">InternalCell</see>) and a link to a
  /// <see cref="FMX.Grid.iOS|TColumnItem.Column">column</see> (<see cref="FMX.Grid.iOS|TColumnItem.ColumnLink">ColumnLink</see>)
  /// </summary>
  TColumnItem = class(TOCLocal)
  public type
    TColumnLink = class(TInterfacedObject, IFreeNotification, ICellControl)
    private
      [Weak] FColumn: TColumn;
      [Weak] FOwner: TColumnItem;
      FChanged: Boolean;
      FClassChanged: Boolean;
      procedure FreeNotification(AObject: TObject);
      function GetColumn: TColumn;
      procedure SetColumn(const Value: TColumn);
    public
      constructor Create(const AOwner: TColumnItem); reintroduce; virtual;
      destructor Destroy; override;
      property Column: TColumn read FColumn write SetColumn;
      property Changed: Boolean read FChanged write FChanged;
      property Owner: TColumnItem read FOwner;
      property ClassChanged: Boolean read FClassChanged write FClassChanged;
    end;
    TColumnLinkClass = class of TColumnLink;
  strict private
    [Weak] FiOSGrid: TiOSGrid;
    [Weak] FModel: TGridModel;
    FColumnLink: TColumnLink;
    FInternalCell: TiOSCellControl;
  private
    FDefaultThickness: CGFloat;
    FFrame: NSRect;
    FHiddenFound: Boolean;
    FSizeChanged: Boolean;
    FPosChanged: Boolean;
    FColLines: Boolean;
    procedure SetFrame(const Value: NSRect); inline;
    procedure SetHiddenFound(const Value: Boolean);
    procedure SetColLines(const Value: Boolean);
    function GetColumn: TColumn; inline;
    procedure SetColumn(const Value: TColumn); inline;
    function GetView: UIView; inline;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    /// <summary> This method must create <see cref="FMX.Grid.iOS|TColumnItem.InternalCell">InternalCell</see> instance
    /// </summary>
    function CreateInternalCell: TiOSCellControl; virtual; abstract;
    procedure DoUpdate; virtual; abstract;
    /// <summary> Returns the class of <see cref="FMX.Grid.iOS|TColumnItem.ColumnLink">ColumnLink</see>. If <c>nil</c>,
    /// <see cref="FMX.Grid.iOS|TColumnItem.TColumnLink">TColumnItem.TColumnLink</see> will be used </summary>
    function GetColumnLinkClass(const AColumn: TColumn): TColumnLinkClass; virtual;
  public
    constructor Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn); virtual;
    destructor Destroy; override;
    procedure Update;
    function ClientRect: NSRect;
    /// <summary> Returns the value of the <c>Frame</c> parameter that was adjusted according to a vertical alignment
    /// and <see cref="FMX.Grid.iOS|TiOSGrid.DefaultLabelHeight">DefaultLabelHeight</see></summary>
    function RectPlaceIntoBounds(const Frame: NSRect): NSRect;
    /// <summary> This object is used for communication between <see cref="FMX.Grid.iOS|TColumnItem.Column">Column</see> and
    /// <see cref="FMX.Grid.iOS|TColumnItem.InternalCell">InternalCell</see>. This object is also used as an
    /// <c>InplaceEdit</c> parameter in the <see cref="FMX.Grid|TColumn.PostEditorValue">TColumn.PostEditorValue</see>
    /// and other methods </summary>
    /// <remarks> Its class is defined with the function
    /// <see cref="FMX.Grid.iOS|TColumnItem.GetColumnLinkClass">GetColumnLinkClass</see> </remarks>
    property ColumnLink: TColumnLink read FColumnLink;
    property iOSGrid: TiOSGrid read FiOSGrid;
    property Model: TGridModel read FModel;
    /// <summary> Column is associated with this object </summary>
    property Column: TColumn read GetColumn write SetColumn;
    property View: UIView read GetView;
    /// <summary> The inner part of the cell that represents the values </summary>
    property InternalCell: TiOSCellControl read FInternalCell;
    property Frame: NSRect read FFrame write SetFrame;
    /// <summary> Indicates whether the column separator lines (vertical lines) exist </summary>
    property ColLines: Boolean read FColLines write SetColLines;
    /// <summary> Indicates whether exist any hidden columns before the column. Used to drawing of the thick left column
    /// separator line </summary>
    property HiddenFound: Boolean read FHiddenFound write SetHiddenFound;
  end;

  TBaseColumnItemList = class(TList<TColumnItem>);

  /// <summary> The list of <see cref="FMX.Grid.iOS|TColumnItem">TColumnItem</see>. It can be sorted by
  /// <see cref="FMX.Grid|TColumn.Index">Column.Index</see> </summary>
  TColumnItemList = class(TBaseColumnItemList)
  private type
    TComparer = class(TInterfacedObject, IComparer<TColumnItem>)
    public
      function Compare(const Left, Right: TColumnItem): Integer;
    end;
  private
    class var FComparer: TComparer;
  public
    constructor Create; reintroduce;
    /// <summary> Returns index of list element with the specified column or <c>-1</c> </summary>
    function Find(const Column: TColumn): Integer;
    /// <summary> This method tries to find the list item by the column, or the last element without visible column
    /// </summary>
    /// <param name="Column"> For this object we are trying to find a suitable
    /// <see cref="FMX.Grid.iOS|TColumnItem">item</see> </param>
    /// <param name="Item"> If there is an element with the specified column, return it. If there is no such element,
    /// return the last element of the list with the <c>nil</c> column or invisible column. If there is no
    /// such element, return <c>nil</c> </param>
    /// <returns> <c>True</c> if element of the column was found, otherwise <c>False</c> </returns>
    /// <remarks> If this function returns <c>False</c> and not null <c>Item</c> then it is possible to change the column
    /// property of this element </remarks>
    function TryGetValue(const Column: TColumn; var Item: TColumnItem): Boolean;
    /// <summary> Copies the values of some properties of all list elements </summary>
    procedure Assign(const Source: TColumnItemList; const Top, Height: CGFloat);
    /// <summary> Remove elements with invisible or <c>nil</c> columns </summary>
    /// <param name="ExceptTiny"> If <c>False</c> the items with columns which have width of less than <c>1</c> will be
    /// deleted too </param>
    /// <returns> <c>True</c> if at least one of the elements was removed </returns>
    function RemoveUselessItems(const ExceptTiny: Boolean = True): Boolean;
  end;

  /// <summary> The <see cref="FMX.Grid.iOS|TColumnItem">TColumnItem</see> derived clsas which is used for the
  /// <see cref="FMX.Grid.iOS|TiOSHeader">header</see> cells. It contains the vertical lines of the title borders
  /// (in header), and the vertical lines of the columns (in table) </summary>
  TiOSHeaderItem = class(TColumnItem)
  strict private
    FFirstBorder: TiOSLineView;
    FLeftBorder: TiOSLineView;
    FRightBorder: TiOSLineView;
    FLeftColumnLine: TiOSLineView;
    FRightColumnLine: TiOSLineView;
  private
    FFirst: Boolean;
    procedure UpdateVerticalBorders;
    procedure SetFirst(const Value: Boolean);
  protected
    /// <returns> By default <see cref="FMX.Grid.iOS|TiOSCellHeader">TiOSCellHeader</see> </returns>
    function CreateInternalCell: TiOSCellControl; override;
    procedure DoUpdate; override;
  public
    constructor Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn); override;
    destructor Destroy; override;
    /// <summary> If <c>True</c>, the title bar contains an additional border line on the left </summary>
    property First: Boolean read FFirst write SetFirst;
  end;

  IiOSHeader = interface(UIView)
    ['{2DD8288D-F976-4FE2-89B2-F7C469EAC5BF}']
    procedure HandlePan(gestureRecognizer: UIPanGestureRecognizer); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
  end;

  /// <summary> The header row. It is always placed on top of the grid </summary>
  TiOSHeader = class(TOCLocal)
  strict private
    [Weak] FiOSGrid: TiOSGrid;
    [Weak] FModel: TGridModel;
    FHeaderItems: TColumnItemList;
  private
    FLineHeader: TiOSLineView;
    FWidth: CGFloat;
    FHeight: CGFloat;
    FIndexResizeHeader: Integer;
    FIndexMoveHeader: Integer;
    FCapturePoint: CGPoint;
    FResizeColumnBorder: TOCLocal;
    FMoveColumnItem: TOCLocal;
    FPanRecognizer: UIPanGestureRecognizer;
    FIndexChangedColumn: Integer;
    FFromIndex: Integer;
    FToIndex: Integer;
    FNewColumnWidth: Single;
    function GetView: UIView; inline;
    function FindItemIndex(const TouchPoint: CGPoint; var Index: Integer): Boolean; overload;
    function FindItemIndex(const touches: NSSet; var Index: Integer): Boolean; overload;
    procedure StartMoveOrResize(const P: CGPoint);
    procedure MoveOrResize(const P: CGPoint);
    procedure EndMoveOrResize(const P: CGPoint);
    procedure DoColumnResize;
    procedure DoColumnIndexChange;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
  public
    constructor Create(const AiOSGrid: TiOSGrid); virtual;
    destructor Destroy; override;
    procedure HandlePan(gestureRecognizer: UIPanGestureRecognizer); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    /// <summary> Update all column headers, their coordinates and positions of column separator lines. </summary>
    /// <remarks> See also <see cref="FMX.Grid.iOS|TiOSHeader.HeaderItems">HeaderItems</see></remarks>
    procedure Update; virtual;
    property iOSGrid: TiOSGrid read FiOSGrid;
    property Model: TGridModel read FModel;
    /// <summary> The list contains instances of <see cref="FMX.Grid.iOS|TiOSHeaderItem">TiOSHeaderItem</see>.
    /// This list sorted by the column indexes </summary>
    property HeaderItems: TColumnItemList read FHeaderItems;
    property Width: CGFloat read FWidth;
    property Height: CGFloat read FHeight;
    property View: UIView read GetView;
  end;

  IiOSInplaceEditor = interface(UIView)
    ['{2DD823A5-A4FA-490E-A4EA-76DEE3C2F0D3}']
  end;

  /// <summary> The <see cref="FMX.Grid.iOS|TColumnItem">TColumnItem</see> derived clsas which is used for the cell in
  /// editor mode (the current editable cell) </summary>
  TiOSInplaceEditor = class(TColumnItem)
  public type
    TEditorColumnLink = class(TColumnLink, IReadOnly)
    private
      FReadOnly: Boolean;
      { IReadOnly }
      function GetReadOnly: Boolean;
      procedure SetReadOnly(const Value: Boolean);
    public
      property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    end;
  public const
    BorderWidth = 1;
  private
    FBackground: UIView;
    FInitialized: Boolean;
    FActive: Boolean;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure DoUpdate; override;
    function CreateInternalCell: TiOSCellControl; override;
    function GetColumnLinkClass(const AColumn: TColumn): TColumnItem.TColumnLinkClass; override;
  public
    constructor Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn); override;
    destructor Destroy; override;
    procedure Activate;
    procedure Deactivate;
    procedure EditorClick;
  end;

  IiOSCell = interface(IFMXColumnItem)
    ['{28363863-9876-470C-A415-E4DABD9D1DED}']
  end;

  /// <summary> The <see cref="FMX.Grid.iOS|TColumnItem">TColumnItem</see> derived clsas which is used for the usual
  /// cells of table </summary>
  TiOSCell = class(TColumnItem)
  private
    FRow: Integer;
    procedure SetRow(const Value: Integer);
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure DoUpdate; override;
    procedure DoUpdateValue(const ACell: TiOSCellControl); virtual;
    function CreateInternalCell: TiOSCellControl; override;
  public
    constructor Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn); override;
    procedure UpdateValue;
    procedure UpdateBackground;
    property Row: Integer read FRow write SetRow;
  end;

  IiOSRow = interface(UIView)
    ['{6DB65D8D-E8B3-4953-8A4F-DA7BFB87BAD8}']
  end;

  /// <summary> Default <see cref="FMX.Grid.iOS|TiOSTable">table</see> row. Contains the list of
  /// <see cref="FMX.Grid.iOS|TiOSRow.Cells">cells</see> that are visible at the moment </summary>
  TiOSRow = class(TOCLocal)
  private
    [Weak] FiOSGrid: TiOSGrid;
    [Weak] FModel: TGridModel;
    FLineDown: TiOSLineView;
    FCells: TColumnItemList;
    function GetIndex: Integer; inline;
    procedure InitView;
    function GetView: UIView; inline;
    function GetCells(const Index: Integer): TiOSCell;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    procedure PrepareForReuse;
  public
    constructor Create(const AiOSGrid: TiOSGrid);
    destructor Destroy; override;
    /// <summary> Update appearance of the row and all of its <see cref="FMX.Grid.iOS|TiOSRow.Cells">cells</see>
    /// </summary>
    procedure Update;
    property Index: Integer read GetIndex;
    /// <summary> The array of the currently visible cells. The index corresponds to the column number. If some cell is
    /// invisible then this element of array is <c>nil</c> </summary>
    property Cells[const Index: Integer]: TiOSCell read GetCells;
    property iOSGrid: TiOSGrid read FiOSGrid;
    property Model: TGridModel read FModel;
    property View: UIView read GetView;
  end;

  IiOSTable = interface(UIScrollView)
    ['{0403CF5C-1E87-4F57-ACCA-969E36310372}']
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesMoved(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesCancelled(touches: NSSet; withEvent: UIEvent); cdecl;
    function becomeFirstResponder: Boolean; cdecl;
  end;

  /// <summary> This is the main content of the <see cref="FMX.Grid.iOS|TiOSGrid">grid</see> except the
  /// <see cref="FMX.Grid.iOS|TiOSHeader">header</see>. It contains a list of
  /// <see cref="FMX.Grid.iOS|TiOSTable.Rows">rows</see> that are visible at the moment </summary>
  TiOSTable = class(TOCLocal)
  strict private
    FLeftLine: TiOSLineView;
    FTopLine: TiOSLineView;
    [Weak] FiOSGrid: TiOSGrid;
    [Weak] FModel: TGridModel;
    FVKOffset: CGFloat;
    FTableOffset: CGFloat;
    FDisappearedRows: TStack<TiOSRow>;
    FRows: TDictionary<Integer, TiOSRow>;
    FRowHeight: CGFloat;
    FRowCount: Integer;
    FState: TiOSCellControl.TState;
  private type
    TRowComparer = class(TInterfacedObject, IComparer<TiOSRow>)
    public
      function Compare(const Left, Right: TiOSRow): Integer;
    end;
  private
    class var FComparer: TRowComparer;
    function GetView: UIScrollView; inline;
    function GetTouchCoord(const touches: NSSet; var x, y: single; var TapCount: Integer;
      const AView: UIView = nil): Boolean;
    procedure SetVKOffset(const Value: CGFloat);
    procedure UpdateFrame;
    function GetRows(const Index: Integer): TiOSRow;
    procedure RowsAppeared(const MinRow, MaxRow: Integer);
    procedure RowsDisappeared(const MinRow, MaxRow: Integer);
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    /// <summary> The virtual keyboard (screen keyboard) offset. The contents will be shifted by this value in order
    /// for the active cell to become visible after the keyboard appears. If the keyboard is not visible, should be
    /// <c>0</c>. <para> See also
    /// <see cref="FMX.Grid.iOS|TiOSGrid.VirtualKeayboardOffset">TiOSGrid.VirtualKeayboardOffset</see> </para></summary>
    property VKOffset: CGFloat read FVKOffset write SetVKOffset;
    /// <summary> Change the <see cref="FMX.Grid.iOS|TiOSTable.State">State</see> property from
    /// TiOSCellControl.TState.<b>Normal</b> to <b>AState</b>. See also
    /// <see cref="FMX.Grid.iOS|TiOSTable.ResetState">ResetState</see> </summary>
    /// <returns> <c>False</c> if the state did not change</returns>
    function EnterState(const AState: TiOSCellControl.TState): Boolean;
    /// <summary> Restores the <see cref="FMX.Grid.iOS|TiOSTable.State">State</see> to
    /// TState.<b>Normal</b>. See also <see cref="FMX.Grid.iOS|TiOSTable.EnterState">EnterState</see>
    /// </summary>
    procedure ResetState;
  public
    constructor Create(const AiOSGrid: TiOSGrid); virtual;
    destructor Destroy; override;
    procedure Update; virtual;
    property iOSGrid: TiOSGrid read FiOSGrid;
    property Model: TGridModel read FModel;
    property View: UIScrollView read GetView;
    /// <summary> The current state of the table. Use <see cref="FMX.Grid.iOS|TiOSTable.EnterState">EnterState</see> and
    /// <see cref="FMX.Grid.iOS|TiOSTable.ResetState">ResetState</see> methods to change this value
    /// </summary>
    property State: TiOSCellControl.TState read FState;
    /// <summary> The array of the currently visible rows. If some row is
    /// invisible then this element of array is <c>nil</c> </summary>
    /// <param name="Index"> The index corresponds to the row number (from <c>0</c> to
    /// <see cref="FMX.Grid.iOS|TiOSTable.RowCount">RowCount</see><c>-1</c>).
    /// </param>
    property Rows[const Index: Integer]: TiOSRow read GetRows;
    /// <summary> Refreshes of the <see cref="FMX.Grid.iOS|TiOSTable.Rows">rows</see> after the content was
    /// scrolled </summary>
    procedure DidScroll(const ScrollView: UIScrollView); virtual;
    /// <summary> Update background of the currently selected cell </summary>
    procedure UpdateFocused;
    /// <summary> Update the appearance of the <see cref="FMX.Grid.iOS|TiOSTable.Rows">rows</see> </summary>
    procedure UpdateVisibleRows;
    /// <summary> The real row height.
    /// If <see cref="FMX.Grid|TGridModel.RowHeight">TGridModel.RowHeight</see>
    /// <c>&#160;&lt;= 0&#160;</c>then <see cref="FMX.Grid.iOS|TiOSGrid.DefaultRowHeight">DefaultRowHeight</see>
    /// </summary>
    /// <remarks> It is used in <see cref="FMX.Grid|TGridModel.EffectiveRowHeight">TGridModel.EffectiveRowHeight</see>
    /// </remarks>
    property RowHeight: CGFloat read FRowHeight;
    /// <summary> Same as <see cref="FMX.Grid|TGridModel.RowCount">TGridModel.RowCount</see> </summary>
    property RowCount: Integer read FRowCount;
    /// <summary> Moves the contents in such a way that active cell becomes visible, if necessary. </summary>
    /// <param name="Animated"> If <c>True</c>, scroll smoothly</param>
    procedure ScrollToSelectedCell(const Animated: Boolean = True);
    procedure touchesBegan(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesMoved(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesEnded(touches: NSSet; withEvent: UIEvent); cdecl;
    procedure touchesCancelled(touches: NSSet; withEvent: UIEvent); cdecl;
    function becomeFirstResponder: Boolean; cdecl;
  end;

  /// <summary> This is the native <b>iOS</b> presentation for grid. It consists of two main parts:
  /// <see cref="FMX.Grid.iOS|TiOSGrid.iOSHeader">iOSHeader</see> and
  /// <see cref="FMX.Grid.iOS|TiOSGrid.iOSTable">iOSTable</see>
  /// </summary>
  TiOSGrid = class(TiOSScrollBox)
  public type
    TEditorResult = (Success, Error, Cancel);
    TContentState = (Changed, Updating, Updated);
  strict private
    FDefaultThickness: CGFloat;
    FDefaultHeaderHeight: CGFloat;
    FDefaultRowHeight: CGFloat;
    FDefaultLabelHeight: CGFloat;
    FiOSHeader: TiOSHeader;
    FiOSTable: TiOSTable;
    FiOSTableDelegate: TOCLocal;
    FiOSQueue: TOCLocal;
    FImages: array [TImageKind] of UIImage;
    FVirtualKeayboardOffset: CGFloat;
  private
    FiOSEditDelegate: TOCLocal;
    FInplaceEditor: TiOSInplaceEditor;
    FContentState: TContentState;
    FTintColor: UIColor;
    FOddColor: UIColor;
    FBkColor: UIColor;
    FHighlightColor: UIColor;
    FFocusColor: UIColor;
    FUnfocusColor: UIColor;
    FOldCoord: TGridModel.TCoord;
    FEditorMode: Boolean;
    FEditorModeChanging: Boolean;
    FForceUpdateRows: Boolean;
    FEditorResult: TEditorResult;
    FImagesCreated: Boolean;
    FVKOffsetChanging: Boolean;
    FFocused: Boolean;
    FTextSettings: TTextSettings;
    function GetModel: TGridModel;
    procedure MMContentChanged(var Message: TDispatchMessage); message MM_CONTENT_CHANGED;
    procedure MMColumnChanged(var Message: TDispatchMessageWithValue<Integer>); message MM_COLUMN_CHANGED;
    procedure MMInvalidateCell(var Message: TDispatchMessageWithValue<TGridModel.TCoord>); message MM_INVALIDATE_CELL;
    procedure MMColumnMoved(var Message: TDispatchMessageWithValue<TGridModel.TColumnIndexes>); message MM_COLUMN_MOVED;
    procedure MMSelChanged(var Message: TDispatchMessage); message MM_SEL_CHANGED;
    procedure PMCellByPoint(var Message: TDispatchMessageWithValue<TGridModel.TPointInfo>); message PM_CELL_BY_POINT;
    procedure PMGetDisplay_Cells(var Message: TDispatchMessageWithValue<TGridModel.TRectCoord>);
      message PM_GET_DISPLAY_CELLS;
    procedure MMGetRowHeight(var Message: TDispatchMessageWithValue<Integer>); message MM_GET_ROW_HEIGHT;
    procedure MMInvalidateContentSize(var Message: TDispatchMessage); message MM_INVALIDATE_CONTENT_SIZE;
    procedure PMCanEdit(var Message: TDispatchMessageWithValue<Boolean>); message PM_CAN_EDIT;
    procedure PMSetTopLeft(var Message: TDispatchMessageWithValue<TGridModel.TCoord>); message PM_SET_TOP_LEFT;
    procedure PMScrollToSelect(var Message: TDispatchMessage); message PM_SCROLL_TO_SELECT;
    procedure MMCellRect(var Message: TDispatchMessageWithValue<TGridModel.TCellInfo>); message MM_CELL_RECT;
    procedure MMShowEditor(var Message: TDispatchMessage); message MM_SHOW_EDITOR;
    procedure MMHideEditor(var Message: TDispatchMessageWithValue<Boolean>); message MM_HIDE_EDITOR;
    procedure MMPostEditorValue(var Message: TDispatchMessage); message MM_POST_EDITOR_VALUE;
    procedure MMRefreshEditorValue(var Message: TDispatchMessage); message MM_REFRESH_EDITOR_VALUE;
    procedure MMEditorMode(var Message: TDispatchMessageWithValue<Boolean>); message MM_EDITOR_MODE;
    procedure MMGetEditorValue(var Message: TDispatchMessageWithValue<TValue>); message MM_GET_EDITOR_VALUE;
    procedure PMVKDisplacement(var Message: TDispatchMessageWithValue<TGridModel.TVKInfo>); message PM_VKDISPLACEMENT;

    procedure MMGetViewportPosition(var Message: TDispatchMessageWithValue<TPointF>); message MM_GET_VIEWPORT_POSITION;
    procedure MMSetViewportPosition(var Message: TDispatchMessageWithValue<TPointF>); message MM_SET_VIEWPORT_POSITION;
    procedure MMGetViewportSize(var Message: TDispatchMessageWithValue<TSizeF>); message MM_GET_VIEWPORT_SIZE;

    function GetRowThickness: CGFloat;
    function GetColumnThickness: CGFloat;

    function EditingDone(const Accept: Boolean): Boolean;
    function PostEditorValue: Boolean;
    function RefreshEditor(const RefreshAppearance, RefreshValue: Boolean): Boolean;
    function GetImages(const Index: TImageKind): UIImage;
    procedure CreateImages;
    procedure FreeImages;
    procedure SetVirtualKeayboardOffset(const Value: CGFloat);
    procedure ForceScroll;
    function HeaderItemByX(const X: CGFloat; const FromLeftToRight: Boolean): TiOSHeaderItem;
    procedure ShowEditorIfNeed;
    procedure UpdateDefaultRowHeight;
  protected
    function DefineModelClass: TDataModelClass; override;
    procedure SetSize(const ASize: TSizeF); override;
    /// <summary> Update entire content </summary>
    procedure UpdateContent;
    /// <summary>This method is called after cell selection has changed.</summary>
    procedure UpdateSelection;
    /// <summary> Define the class of cell by the column </summary>
    /// <returns> If <c>nil</c> then the default class will be used </returns>
    /// <remarks> You can override this method to use your owns derived classes. You should not call this method
    /// manually </remarks>
    function GetCellClass(const Column: TColumn): TiOSCellControlClass; virtual;
    /// <summary> Define the class of cell editor by the column </summary>
    /// <returns> If <c>nil</c> then exception will be raised </returns>
    /// <remarks> You can override this method to use your owns derived classes. You should not call this method
    /// manually </remarks>
    function GetEditorClass(const Column: TColumn): TiOSCellControlClass; virtual;
    /// <summary> Creates the header of table. You can override this method in case you want to use your class of header
    /// </summary>
    function CreateHeader: TiOSHeader; virtual;
    /// <summary> Creates the main part of table. You can override this method in case you want to use your class of
    /// table </summary>
    function CreateTable: TiOSTable;
    /// <summary> Calls the event handler
    /// <see cref="FMX.Grid|TGridModel.OnCellClick">Model.OnCellClick</see> </summary>
    procedure CellClick(const Column: TColumn; const Row: Integer); virtual;
    /// <summary> Calls the event handler
    /// <see cref="FMX.Grid|TGridModel.OnCellDblClick">Model.OnCellDblClick</see> </summary>
    procedure CellDblClick(const Column: TColumn; const Row: Integer); virtual;
    /// <summary> Determine whether possible the transfer to edit mode. This is the same as
    /// <see cref="FMX.Grid|TCustomGrid.CanEdit">TCustomGrid.CanEdit</see> </summary>
    function CanEdit: Boolean; virtual;
    /// <summary> The coordinates of the cell editor bounds. By default this is the same as
    /// <see cref="FMX.Grid|TCustomGrid.CellRect">TCustomGrid.CellRect</see> </summary>
    function GetEditorRect: NSRect; virtual;
    /// <summary> This virtual method is called from <see cref="FMX.Grid.iOS|TiOSGrid.ShowEditor">ShowEditor</see>
    /// method. You can override this method, but you should not call it yourself </summary>
    function CreateInplaceEditor: TiOSInplaceEditor; virtual;
    /// <summary> Scroll the content to the active cell and activate the editor if it exists</summary>
    procedure InplaceEditorActivate; virtual;
    /// <summary> Finish editing and advance to the next cell (depends on
    /// <see cref="FMX.Grid|TGridModel.CellReturnAction">Model.CellReturnAction</see>) </summary>
    procedure EditorReturnDown; virtual;
    /// <summary> This virtual method is invoked in the process of scrolling the table </summary>
    procedure TableScrolled(const ViewPortPosition: CGPoint); virtual;
    /// <summary> The special object that is designed to execute some methods asynchronously </summary>
    property iOSQueue: TOCLocal read FiOSQueue;
    /// <summary> Asynchronously invoke a selector from <see cref="FMX.Grid.iOS|TiOSGrid.iOSQueue">iOSQueue</see> by
    /// name </summary>
    function PerformSelector(const Name: string; const Delay: CGFloat = 0): Boolean;
    /// <summary> The virtual keyboard (screen keyboard) offset. This is the same as the
    /// <see cref="FMX.Grid.iOS|TiOSTable.VKOffset">iOSTable.VKOffset</see> property, but it is changed
    /// asynchronously </summary>
    property VirtualKeayboardOffset: CGFloat read FVirtualKeayboardOffset write SetVirtualKeayboardOffset;
  public
    constructor Create(const AModel: TDataModel; const AControl: TControl); overload; override;
    destructor Destroy; override;
    /// <summary> Returns the data model which was cast to the type</summary>
    property Model: TGridModel read GetModel;
    procedure SetFocus; override;
    procedure ResetFocus; override;
    /// <summary> The coordinates of some cell bounds. This is the same as
    /// <see cref="FMX.Grid|TCustomGrid.CellRect">TCustomGrid.CellRect</see> </summary>
    function CellRect(const ACol, ARow: Integer): NSRect;
    /// <summary> Applies padding to the original rectangle </summary>
    /// <param name="ARect"> The original rectangle </param>
    /// <param name="Column"> It contains the padding values </param>
    /// <returns> rectangle calculated by adding the Left and Top values and subtracting the Right and Bottom values of
    /// the <i>Column.Padding</i> </returns>
    function PaddingRect(const ARect: NSRect; const Column: TColumn): NSRect;
    /// <summary> Default thickness of the separator lines </summary>
    property DefaultThickness: CGFloat read FDefaultThickness;
    /// <summary> The row height by default. It depends on the grid font size and
    /// <see cref="FMX.Grid|TColumn.HorzTextMargin">TColumn.HorzTextMargin</see> value </summary>
    property DefaultRowHeight: CGFloat read FDefaultRowHeight;
    /// <summary> The text string height by default. It depends on the font size </summary>
    property DefaultLabelHeight: CGFloat read FDefaultLabelHeight;
    /// <summary> The header height by default. It depends on the default font size and
    /// <see cref="FMX.Grid|TColumn.HorzTextMargin">TColumn.HorzTextMargin</see> value </summary>
    property DefaultHeaderHeight: CGFloat read FDefaultHeaderHeight;
    /// <summary> Thickness of the row separator line </summary>
    property RowThickness: CGFloat read GetRowThickness;
    /// <summary> Thickness of the column separator line </summary>
    property ColumnThickness: CGFloat read GetColumnThickness;
    /// <summary> The top part of the grid that contains the column titles </summary>
    property iOSHeader: TiOSHeader read FiOSHeader;
    /// <summary> The main part of the grid that contains the cells with data </summary>
    property iOSTable: TiOSTable read FiOSTable;
    /// <summary> If <c>True</c> the cell editor is shown. This is the same as
    /// <see cref="FMX.Grid|TGridModel.EditorMode">TGridModel.EditorMode</see> </summary>
    property EditorMode: Boolean read FEditorMode;
    /// <summary> Show cell editor. This is the same as
    /// <see cref="FMX.Grid|TGridModel.ShowEditor">TGridModel.ShowEditor</see> </summary>
    procedure ShowEditor;
    /// <summary> The cell editor state after closing. If the editor is shown then <b>Success</b> </summary>
    property EditorResult: TEditorResult read FEditorResult;
    /// <summary> Close cell editor and set <see cref="FMX.Grid.iOS|TiOSGrid.EditorMode">EditorMode</see> to
    /// <c>False</c>. </summary>
    /// <param name="Accept"> If <c>True</c>, the value from cell editor will be used in
    /// <see cref="FMX.Grid|TCustomGrid">Grid</see>, otherwise the old value will remain in grid </param>
    procedure HideEditor(const Accept: Boolean);
    /// <summary> The pictures of check boxes that were loaded from default style </summary>
    property Images[const Index: TImageKind]: UIImage read GetImages;
  end;

implementation

uses
  System.RTLConsts, System.Math.Vectors, Macapi.ObjCRuntime, Macapi.CoreFoundation, FMX.Helpers.iOS, FMX.DialogService,
  FMX.Consts, FMX.Forms, FMX.Text, FMX.Presentation.Factory, FMX.Utils, FMX.Platform, FMX.MediaLibrary.Actions,
  FMX.ImgList;

{$REGION 'Utilites'}

function UpdateViewText(const View: UIView; const Model: TGridModel; const Column: TColumn): Boolean;
const
  DefaultGridFontSize = 18;
var
  LLabel: UILabel;
  LTextView: UITextView;
  LTextField: UITextField;
  Alignment: UITextAlignment;
  FontColor: UIColor;
  TmpFont: TFont;
  Font: UIFont;
begin
  Result := False;
  if Model <> nil then
  begin
    if Column is TCustomNumberColumn then
      Alignment := UITextAlignmentRight
    else if TStyledSetting.Other in Model.StyledSettings then
      Alignment := UITextAlignmentLeft
    else
      case Model.TextSettings.HorzAlign of
        TTextAlign.Center:
          Alignment := UITextAlignmentCenter;
        TTextAlign.Leading:
          Alignment := UITextAlignmentLeft;
        TTextAlign.Trailing:
          Alignment := UITextAlignmentRight;
      end;
    if TStyledSetting.FontColor in Model.StyledSettings then
      FontColor := TUIColor.Wrap(TUIColor.OCClass.blackColor)
    else
      FontColor := AlphaColorToUIColor(Model.TextSettings.FontColor);

    TmpFont := FMX.Graphics.TFont.Create;
    try
      if TStyledSetting.Size in Model.StyledSettings then
        TmpFont.Size := DefaultGridFontSize
      else
        TmpFont.Size := Model.TextSettings.Font.Size;

      if TStyledSetting.Style in Model.StyledSettings then
        TmpFont.Style := []
      else
        TmpFont.Style := Model.TextSettings.Font.Style;

      if TStyledSetting.Family in Model.StyledSettings then
        TmpFont.Family := NSStrToStr(TUIFont.Wrap(TUIFont.OCClass.systemFontOfSize(DefaultGridFontSize)).fontName)
      else
        TmpFont.Family := Model.TextSettings.Font.Family;
      Font := FontToUIFont(TmpFont);
    finally
      TmpFont.Free;
    end;
    if Alignment >= 0 then
    begin
      if Supports(View, UILabel, LLabel) then
      begin
        LLabel.setTextAlignment(Alignment);
        LLabel.setTextColor(FontColor);
        LLabel.setFont(Font);
        Result := True;
      end
      else if Supports(View, UITextView, LTextView) then
      begin
        LTextView.setTextAlignment(Alignment);
        LTextView.setTextColor(FontColor);
        LTextView.setFont(Font);
        Result := True;
      end
      else if Supports(View, UITextField, LTextField) then
      begin
        LTextField.setTextAlignment(Alignment);
        LTextField.setTextColor(FontColor);
        LTextField.setFont(Font);
        Result := True;
      end;
    end;
  end;
end;

procedure SelectAll(Field: UITextField);
var
  I1, I2: UITextPosition;
  Range: UITextRange;
begin
  Field.setSelected(True);
  Field.becomeFirstResponder;
  I1 := Field.beginningOfDocument;
  I2 := Field.endOfDocument;
  Range := Field.textRangeFromPosition(I1, I2);
  Field.setSelectedTextRange(Range);
end;

function ValueToFloat(const Value: TValue): Double;
var
  S: string;
begin
  Result := NAN;
  if not Value.IsEmpty and not Value.IsObject then
  begin
    if Value.IsOrdinal then
      Result := Value.AsOrdinal
    else if not Value.TryAsType<Double>(Result) and (Value.TryAsType<string>(S) and
      TCustomNumberColumn.TryValueToString(Value, TNumValueType.Float, S)) then
    begin
      if not TryStrToFloat(S, Result) then
        Result := NAN
    end;
  end;
end;

{$ENDREGION}
{$REGION 'Hidden types'}

type
  UITextFieldDelegate = interface(IObjectiveC)
    ['{B76C7D96-EFBB-482C-9E5C-0C8D083052FC}']
    function textFieldShouldReturn(textField: UITextField): Boolean; cdecl;
    function textField(textField: UITextField; shouldChangeCharactersInRange: NSRange;
      replacementString: NSString): Boolean; cdecl;
  end;

  TiOSEditDelegate = class(TOCLocal, UITextFieldDelegate)
  strict private
    [Weak] FiOSGrid: TiOSGrid;
  public
    constructor Create(const AiOSGrid: TiOSGrid);
    property iOSGrid: TiOSGrid read FiOSGrid;
    function textFieldShouldReturn(textField: UITextField): Boolean; cdecl;
    function textField(textField: UITextField; shouldChangeCharactersInRange: NSRange;
      replacementString: NSString): Boolean; cdecl;
  end;

  IiOSQueue = interface(NSObject)
    ['{D5FBE51E-0E69-4219-B035-1497B6008644}']
    procedure InplaceEditorActivate; cdecl;
    procedure UpdateContent; cdecl;
    procedure EditorClick; cdecl;
    procedure EditorDone; cdecl;
    procedure VKOffsetChanged; cdecl;
    procedure ColumnWidthChange; cdecl;
    procedure ColumnIndexChange; cdecl;
    procedure RestoreFocus; cdecl;
    procedure ReplaceText; cdecl;
  end;

  TiOSQueue = class(TOCLocal)
  strict private
    [Weak] FiOSGrid: TiOSGrid;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
  public
    constructor Create(const AiOSGrid: TiOSGrid);
    property iOSGrid: TiOSGrid read FiOSGrid;
    procedure InplaceEditorActivate; cdecl;
    procedure UpdateContent; cdecl;
    procedure EditorClick; cdecl;
    procedure EditorDone; cdecl;
    procedure VKOffsetChanged; cdecl;
    procedure ColumnWidthChange; cdecl;
    procedure ColumnIndexChange; cdecl;
    procedure RestoreFocus; cdecl;
    procedure ReplaceText; cdecl;
  end;

  IBorderView = interface(UIView)
    ['{2DD82DAB-9FB9-4394-A11B-150F0E8570F4}']
  end;

  TBorderView = class(TOCLocal)
  private
    [Weak] FHeader: TiOSHeader;
    function GetView: UIView;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetFrame(const OriginX: CGFloat): CGRect;
  public const
    Thickness: CGFloat = 2;
  public
    constructor Create(const AHeader: TiOSHeader; const X: CGFloat);
    destructor Destroy; override;
    property View: UIView read GetView;
  end;

  IFakeColumnView = interface(UIView)
    ['{2DD8275A-AF7A-4F54-A072-4AE3BEBA30B4}']
  end;

  TFakeColumnView = class(TOCLocal)
  public const
    DefaultOpacity = 0.25;
  private
    [Weak] FHeader: TiOSHeader;
    FWidth: CGFloat;
    FInternalOffset: CGFloat;
    function GetView: UIView;
  protected
    function GetObjectiveCClass: PTypeInfo; override;
    function GetFrame(const X: CGFloat): CGRect;
  public
    constructor Create(const AHeader: TiOSHeader; const X: CGFloat; const Source: TColumnItem);
    destructor Destroy; override;
    property View: UIView read GetView;
  end;

{$ENDREGION}
{$REGION 'TiOSLineView'}

constructor TiOSLineView.Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AHorizontal, ALeading: Boolean;
  const AFromView: UIView = nil);
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) or (AParent = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FThickness := AiOSGrid.DefaultThickness;
  FParentView := AParent;
  FHorizontal := AHorizontal;
  FLeading := ALeading;
  FFromView := AFromView;
  Update;
  View.setBackgroundColor(TUIColor.Wrap(TUIColor.OCClass.underPageBackgroundColor));
  FParentView.addSubview(View);
end;

destructor TiOSLineView.Destroy;
begin
  View.removeFromSuperview;
  inherited;
end;

procedure TiOSLineView.Update;
var
  R: NSRect;
  V: Pointer;
  Size: NSSize;
  ScrollView: UIScrollView;
begin
  if FFromView <> nil then
    R := FFromView.Frame
  else
    R := FParentView.Frame;
  if Supports(FParentView, UIScrollView, ScrollView) then
  begin
    Size := ScrollView.contentSize;
    if Horizontal then
      R.Size.Width := Size.Width + FThickness
    else
      R.Size.Height := Size.Height;
  end;
  if Horizontal then
  begin
    R.origin.x := Offset.x;
    R.Size.Width := R.Size.Width - Offset.x;
    if Leading then
    begin
      R.origin.y := Offset.y;
      R.Size.Height := FThickness;
    end
    else
    begin
      R.origin.y := Offset.y + R.Size.Height - FThickness;
      R.Size.Height := FThickness;
    end;
  end
  else
  begin
    R.origin.y := Offset.y;
    R.Size.Height := R.Size.Height - Offset.y;
    if Leading then
    begin
      R.origin.x := Offset.x;
      R.Size.Width := FThickness;
    end
    else
    begin
      R.origin.x := Offset.x + R.Size.Width - FThickness;
      R.Size.Width := FThickness;
    end;
  end;

  if FFromView <> nil then
    R := TUIView.Wrap(FFromView.superview).convertRect(R, FFromView);

  if FInitialized then
    View.SetFrame(R)
  else
  begin
    FInitialized := True;
    V := View.initWithFrame(R);
    if GetObjectID <> V then
      UpdateObjectID(V);
  end;
end;

function TiOSLineView.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSLineView);
end;

procedure TiOSLineView.SetHorizontal(const Value: Boolean);
begin
  if FHorizontal <> Value then
  begin
    FHorizontal := Value;
    Update;
  end;
end;

procedure TiOSLineView.SetLeading(const Value: Boolean);
begin
  if FLeading <> Value then
  begin
    FLeading := Value;
    Update;
  end;
end;

procedure TiOSLineView.SetOffset(const Value: NSPoint);
begin
  if not SameValue(FOffset.x, Value.x, TEpsilon.FontSize) or not SameValue(FOffset.y, Value.y, TEpsilon.FontSize) then
  begin
    FOffset := Value;
    Update;
  end;
end;

procedure TiOSLineView.SetThickness(const Value: CGFloat);
begin
  if not SameValue(FThickness, Value, TEpsilon.FontSize) then
  begin
    FThickness := Value;
    Update;
  end;
end;

function TiOSLineView.GetView: UIView;
begin
  Result := UIView(Super);
end;

function TiOSLineView.GetVisible: Boolean;
begin
  Result := not View.isHidden;
end;

procedure TiOSLineView.SetVisible(const Value: Boolean);
begin
  View.setHidden(not Value);
end;

{$ENDREGION}
{$REGION 'TiOSCellControl'}

constructor TiOSCellControl.Create(const AOwner: TColumnItem);
var
  V: Pointer;
begin
  if AOwner = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FOwner := AOwner;
  V := View.init;
  if GetObjectID <> V then
    UpdateObjectID(V);
  View.SetTag(NSInteger(FOwner));
end;

procedure TiOSCellControl.AfterConstruction;
begin
  inherited;
  Owner.View.addSubview(View);
end;

destructor TiOSCellControl.Destroy;
var
  TextField: UITextField;
begin
  View.SetTag(0);
  if Supports(View, UITextField, TextField) then
    TextField.setDelegate(nil);
  View.removeFromSuperview;
  inherited;
end;

procedure TiOSCellControl.Activate;
var
  TextField: UITextField;
begin
  if Supports(View, UITextField, TextField) then
    SelectAll(TextField);
end;

procedure TiOSCellControl.Deactivate;
begin

end;

procedure TiOSCellControl.EditorClick;
begin

end;

function TiOSCellControl.GetView: UIView;
begin
  Result := UIView(Super);
end;

function TiOSCellControl.RestoreFocus(const State: TState; const Proc: TProc = nil): Boolean;
begin
  Result := False;
  if (Owner.iOSGrid <> nil) and (Owner.iOSGrid.iOSTable <> nil) and Owner.iOSGrid.iOSTable.EnterState(State) then
  begin
    try
      if Assigned(Proc) then
        Proc;
      if (State = TState.Done) and (Column <> nil) then
        Column.EditorModified;
      Result := True;
    except
      Application.HandleException(Owner.iOSGrid);
    end;
    Owner.iOSGrid.PerformSelector('RestoreFocus');
  end;
end;

function TiOSCellControl.GetAbsoluteRect: TRectF;
begin
  Result := Owner.iOSGrid.View.convertRect(Owner.View.bounds, Owner.View).ToRectF;
  Result.Location := Owner.iOSGrid.Control.LocalToAbsolute(Result.TopLeft);
end;

function TiOSCellControl.GetColumn: TColumn;
begin
  Result := FOwner.Column;
end;

function TiOSCellControl.GetFrame: NSRect;
begin
  Result := Owner.ClientRect;
end;

procedure TiOSCellControl.Update;
var
  R: NSRect;
begin
  R := GetFrame;
  if (R.Size.Width <= 1) or (R.Size.Height <= 1) then
    View.setHidden(True)
  else
  begin
    View.SetFrame(R);
    DoUpdate;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSCellLabel'}

function TiOSCellLabel.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellLabel);
end;

procedure TiOSCellLabel.DoUpdate;
begin
  UpdateViewText(View, Owner.iOSGrid.Model, Column);
  View.setHidden(False);
end;

function TiOSCellLabel.GetData: TValue;
begin
  Result := FText;
end;

function TiOSCellLabel.GetFrame: NSRect;
begin
  Result := Owner.RectPlaceIntoBounds(inherited GetFrame);
end;

procedure TiOSCellLabel.SetData(const Value: TValue);
var
  NewText: string;
begin
  if Column <> nil then
    NewText := Column.ValueToString(Value)
  else
    NewText := string.Empty;
  if FText <> NewText then
  begin
    FText := NewText;
    if FText.IsEmpty then
      UILabel(View).setText(nil)
    else
      UILabel(View).setText(StrToNSStr(FText));
  end;
end;

{$ENDREGION}
{$REGION 'TiOSCellHeader'}

constructor TiOSCellHeader.Create(const AOwner: TColumnItem);
begin
  inherited;
  FEnabled := True;
end;

function TiOSCellHeader.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellHeader);
end;

procedure TiOSCellHeader.DoUpdate;
var
  LLabel: UILabel;
  NewText: string;
begin
  if Supports(View, UILabel, LLabel) then
  begin
    LLabel.setTextAlignment(UITextAlignmentCenter);
    if Column <> nil then
    begin
      if FEnabled <> Column.Enabled then
      begin
        FEnabled := Column.Enabled;
        if FEnabled then
          View.setAlpha(1)
        else
          View.setAlpha(TControl.DefaultDisabledOpacity);
        if (Column.Width > 0) and (Owner <> nil) then
          Owner.iOSGrid.FForceUpdateRows := True;
      end;
      NewText := Column.Header
    end
    else
      NewText := string.Empty;

    if FText <> NewText then
    begin
      FText := NewText;
      if FText.IsEmpty then
        LLabel.setText(nil)
      else
        LLabel.setText(StrToNSStr(FText));
    end;
    View.setHidden(False);
  end
  else
    View.setHidden(True);
end;

function TiOSCellHeader.GetData: TValue;
begin
  Result := TValue.Empty;
end;

procedure TiOSCellHeader.SetData(const Value: TValue);
begin
  // none
end;

{$ENDREGION}
{$REGION 'TiOSCellDefaultEditor'}

constructor TiOSCellDefaultEditor.Create(const AOwner: TColumnItem);
var
  LControl: UIControl;
begin
  inherited;
  if Supports(View, UIControl, LControl) then
    LControl.addTarget(GetObjectID, sel_getUid(MarshaledAString(TMarshal.AsAnsi('ControlEventEditingChanged'))),
      UIControlEventEditingChanged);
end;

destructor TiOSCellDefaultEditor.Destroy;
var
  LControl: UIControl;
begin
  if Supports(View, UIControl, LControl) then
    LControl.removeTarget(GetObjectID, sel_getUid(MarshaledAString(TMarshal.AsAnsi('ControlEventEditingChanged'))),
      UIControlEventEditingChanged);
  inherited;
end;

procedure TiOSCellDefaultEditor.DoUpdateChangedText(var Text: string);
var
  NewText: string;
  I: Integer;
begin
  NewText := string.Empty;
  for I := 0 to Text.Length - 1 do
    if Owner.Column.ValidChar(Text.Chars[I]) then
      NewText := NewText + Text.Chars[I];
  Text := NewText;
end;

procedure TiOSCellDefaultEditor.ControlEventEditingChanged;
var
  LNewText, LOldText: string;
  LField: UITextField;
  ReadOnly: IReadOnly;
begin
  if not FTextUpdating and Supports(View, UITextField, LField) and (Owner.Column <> nil) then
  try
    FTextUpdating := True;
    LOldText := NSStrToStr(TNSString.Wrap(LField.text));
    if not (Supports(Owner.ColumnLink, IReadOnly, ReadOnly) and ReadOnly.ReadOnly) then
    begin
      LNewText := LOldText;
      DoUpdateChangedText(LNewText);
    end
    else
      LNewText := FStoredText;
    if LNewText <> LOldText then
    begin
      FNewText := LNewText;
      if Owner.iOSGrid <> nil then
        Owner.iOSGrid.PerformSelector('ReplaceText');
    end
    else
    begin
      FTextUpdating := False;
      FNewText := string.Empty;
    end;
  except
    FTextUpdating := False;
    Application.HandleException(Owner);
  end;
end;

function TiOSCellDefaultEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellDefaultEditor);
end;

procedure TiOSCellDefaultEditor.DoUpdate;
begin
  if (Owner.iOSGrid <> nil) and (Owner.iOSGrid.Model <> nil) then
  begin
    if (Owner.iOSGrid.Model.CellReturnAction = TCellReturnAction.None) then
      UITextField(View).setReturnKeyType(UIReturnKeyDefault)
    else
      UITextField(View).setReturnKeyType(UIReturnKeyNext);
    UpdateViewText(View, Owner.iOSGrid.Model, Column);
    View.setHidden(False);
  end;
end;

function TiOSCellDefaultEditor.GetData: TValue;
begin
  Result := NSStrToStr(TNSString.Wrap(UITextField(View).text));
end;

function TiOSCellDefaultEditor.GetFrame: NSRect;
begin
  Result := Owner.RectPlaceIntoBounds(inherited GetFrame);
end;

procedure TiOSCellDefaultEditor.SetText(const Text: string);
begin
  FStoredText := Text;
  if FStoredText.IsEmpty then
    UITextField(View).setText(nil)
  else
    UITextField(View).setText(StrToNSStr(FStoredText));
end;

procedure TiOSCellDefaultEditor.SetData(const Value: TValue);
var
  LText: string;
begin
  if Column <> nil then
    LText := Column.ValueToString(Value)
  else
    LText := string.Empty;
  SetText(LText);
end;

{$ENDREGION}
{$REGION 'TiOSCurrencyLabel'}

function TiOSCurrencyLabel.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCurrencyLabel);
end;

{$ENDREGION}
{$REGION 'TiOSCurrencyEditor'}

function TiOSCurrencyEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCurrencyEditor);
end;

procedure TiOSCurrencyEditor.DoUpdate;
begin
  inherited;
  UITextField(View).setEnablesReturnKeyAutomatically(False);
//  UITextField(View).setKeyboardType(UIKeyboardTypeNumberPad);
//fix or add by flying wang.
  UITextField(View).setKeyboardType(UIKeyboardTypeDecimalPad);
end;

function TiOSCurrencyEditor.GetData: TValue;
var
  LValue: Double;
  S: string;
begin
  S := Trim(UpperCase(NSStrToStr(TNSString.Wrap(UITextField(View).text))));
  if S.IsEmpty or (string.Compare(S, Nan.ToString, [TCompareOption.coIgnoreCase]) = 0) then
    Result := TValue.Empty
  else
  begin
    LValue := ValueToFloat(S);
    if LValue.IsNan then
      raise EConvertError.CreateFmt(SInvalidFloat, [S]);
    Result := LValue;
  end;
end;

procedure TiOSCurrencyEditor.SetData(const Value: TValue);
var
  LText: string;
begin
  FValue := ValueToFloat(Value);
  if (Column <> nil) and not IsNan(FValue) then
  begin
    if (not (Column is TCurrencyColumn)) and (Value.Kind = TTypeKind.tkUString) then
      LText := Value.AsString
    else
      LText := Column.ValueToString(Value);
  end
  else
    LText := string.Empty;
  SetText(LText);
end;

{$ENDREGION}
{$REGION 'TiOSNumberEditor'}
{ TiOSNumberEditor }

function TiOSNumberEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSNumberEditor);
end;

procedure TiOSNumberEditor.SetData(const Value: TValue);
var
  LText: string;
begin
  if Value.Kind = TTypeKind.tkUString then
  begin
    LText := Value.asString;
    SetText(LText);
  end
  else
    inherited;
end;

{$ENDREGION}
{$REGION 'TiOSCellProgressBar'}

function TiOSCellProgressBar.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellProgressBar);
end;

procedure TiOSCellProgressBar.AfterConstruction;
var
  LColor: UIColor;
begin
  inherited;
  LColor := TUIColor.Wrap(TUIColor.OCClass.underPageBackgroundColor);
  LColor := LColor.colorWithAlphaComponent(0.5);
  View.setBackgroundColor(LColor);
  FForeground := TUIView.Wrap(TUIView.Alloc.initWithFrame(View.bounds));
  FForeground.setBackgroundColor(Owner.iOSGrid.FTintColor);
  View.addSubview(FForeground);
end;

procedure TiOSCellProgressBar.DoUpdate;
var
  R: NSRect;
  ClampValue: CGFloat;
  LColumn: TProgressColumn;
begin
  inherited;
  if IsNan(FValue) or not (Column is TProgressColumn) then
    View.setHidden(True)
  else
  begin
    LColumn := TProgressColumn(Column);
    if LColumn.Max > LColumn.Min then
    begin
      ClampValue := EnsureRange(FValue, LColumn.Min, LColumn.Max);
      R := View.bounds;
      R.Size.Width := ((ClampValue - LColumn.Min) / (LColumn.Max - LColumn.Min)) * R.Size.Width;
      FForeground.SetFrame(R);
      View.setHidden(False)
    end
    else
      View.setHidden(True);
  end;
end;

function TiOSCellProgressBar.GetFrame: NSRect;
var
  Source, Bounds: TRectF;
begin
  Result := inherited GetFrame;
  if Column <> nil then
  begin
    Bounds := Result.ToRectF;
    Source := Bounds;
    Source.Height := Max(TColumn.VertTextMargin, Round(Source.Height / 2));
    Result := NSRect.Create(Column.RectPlaceIntoBounds(Source, Bounds));
  end;
end;

function TiOSCellProgressBar.GetData: TValue;
begin
  if IsNan(FValue) then
    Result := TValue.Empty
  else
    Result := FValue;
end;

procedure TiOSCellProgressBar.SetData(const Value: TValue);
var
  LValue: Double;
begin
  LValue := ValueToFloat(Value);
  if (IsNan(LValue) <> IsNan(FValue)) or (FValue <> LValue) then
  begin
    FValue := LValue;
    Update;
  end;
end;
{$ENDREGION}
{$REGION 'TiOSCellDatePicker'}

constructor TiOSCellDatePicker.Create(const AOwner: TColumnItem);
begin
  if AOwner <> nil then
    FTextIsPreferred := AOwner.iOSGrid.iOSTable.State = TState.Cancel;
  inherited;
end;

destructor TiOSCellDatePicker.Destroy;
begin
  FPicker.Free;
  FTextField := nil;
  inherited;
end;

procedure TiOSCellDatePicker.Activate;
var
  PickerService: IFMXPickerService;
  ReadOnly: IReadOnly;
begin
  FreeAndNil(FPicker);
  if FTextIsPreferred then
  begin
    if FTextField <> nil then
      if (Column is TDateColumn) and not TDateColumn(Column).ShowClearButton then
        SelectAll(FTextField)
      else
        FTextField.becomeFirstResponder;
  end
  else if not (Supports(Owner.ColumnLink, IReadOnly, ReadOnly) and ReadOnly.ReadOnly) then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXPickerService, PickerService) then
    begin
      ValidateInheritance(Owner.Model.Owner, TControl, False);
      FPicker := PickerService.CreateDateTimePicker;
      FPicker.ShowMode := GetPickerShowMode;
      FPicker.Parent := TControl(Owner.Model.Owner);
      FPicker.AbsoluteTargetRect := AbsoluteRect;
      FPicker.OnHide := DoClosePopup;
      FPicker.OnShow := DoPopup;
      FPicker.OnDateChanged := DoApply;
    end
    else
      raise EUnsupportedPlatformService.CreateFmt(SUnsupportedPlatformService, ['IFMXPickerService']);
    if IsNan(FDateTime) then
      FPicker.Date := Now
    else
      FPicker.Date := FDateTime;
    FPicker.Show;
  end;
end;

procedure TiOSCellDatePicker.Deactivate;
begin
  if FTextField <> nil then
    FTextField.resignFirstResponder;
  if FPicker <> nil then
  begin
    FPicker.Hide;
    FreeAndNil(FPicker);
  end;
end;

procedure TiOSCellDatePicker.DoUpdate;
begin
  View.setHidden(False);
  if FInitialized then
  begin
    if FTextField = nil then
    begin
      FTextField := TUITextField.Wrap(TUITextField.Alloc.initWithFrame(View.bounds));
      if (Column is TDateColumn) and TDateColumn(Column).ShowClearButton then
        FTextField.setClearButtonMode(UITextFieldViewModeWhileEditing)
      else
        FTextField.setClearButtonMode(UITextFieldViewModeNever);
      FTextField.setEnablesReturnKeyAutomatically(False);
//      FTextField.setKeyboardType(UIKeyboardTypeNumberPad);
//fix or add by flying wang.
      FTextField.setKeyboardType(UIKeyboardTypeDecimalPad);
      FTextField.SetTag(NSInteger(Owner));
      FTextField.setEnabled(FTextIsPreferred);
      FTextField.setDelegate(TiOSEditDelegate(Owner.iOSGrid.FiOSEditDelegate).GetObjectID);
      View.addSubview(FTextField);
      UpdateViewText(FTextField, Owner.Model, Owner.Column);
    end;
    UpdateField;
  end;
end;

function TiOSCellDatePicker.GetData: TValue;
var
  S, ErrorMessage: string;
  LDateTime: TDateTime;
begin
  if (IsNan(FDateTime) or FTextIsPreferred) and (FTextField <> nil) then
  begin
    S := Trim(NSStrToStr(TNSString.Wrap(FTextField.text)));
    if S.IsEmpty then
      Exit(TValue.Empty)
    else
      LDateTime := ValueToDateTime(S);
    if not IsNan(LDateTime) then
      FDateTime := LDateTime;
  end
  else
    LDateTime := FDateTime;

  if not IsNan(LDateTime) then
  begin
    case GetPickerShowMode of
      TDatePickerShowMode.Date:
        Result := TValue.From<TDate>(Trunc(LDateTime));
      TDatePickerShowMode.Time:
        Result := TValue.From<TTime>(Frac(LDateTime));
      TDatePickerShowMode.DateTime:
        Result := TValue.From<TDateTime>(LDateTime);
    else
      Result := TValue.From<TDate>(LDateTime);
    end;
  end
  else
  begin
    case GetPickerShowMode of
      TDatePickerShowMode.Date:
        ErrorMessage := System.SysConst.SInvalidDate;
      TDatePickerShowMode.Time:
        ErrorMessage := System.SysConst.SInvalidTime;
      TDatePickerShowMode.DateTime:
        ErrorMessage := System.SysConst.SInvalidDateTime
    end;
    raise EConvertError.CreateFmt(ErrorMessage, [S]);
  end;
end;

function TiOSCellDatePicker.GetFrame: NSRect;
begin
  Result := Owner.RectPlaceIntoBounds(inherited GetFrame);
end;

procedure TiOSCellDatePicker.SetData(const Value: TValue);
var
  LDate: TDateTime;
begin
  LDate := ValueToDateTime(Value);
  if not FInitialized or (IsNan(LDate) <> IsNan(FDateTime)) or (FDateTime <> LDate) then
  begin
    SetDateTime(LDate);
    Update;
  end;
end;

function TiOSCellDatePicker.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellDatePicker);
end;

function TiOSCellDatePicker.ValueToDateTime(const Value: TValue): TDateTime;
var
  S: string;
  Settings: TFormatSettings;
begin
  Result := NAN;
  if not Value.IsEmpty and not Value.IsObject and not Value.TryAsType<TDateTime>(Result) and Value.TryAsType<string>(S)
  then
  begin
    Settings := FormatSettings;
    if (Column is TDateColumn) and not TDateColumn(Column).Format.IsEmpty then
      Settings.ShortDateFormat := TDateColumn(Column).Format;
    if not TryStrToDate(S, Result, Settings) and not TryStrToDateTime(S, Result, Settings) then
      Result := NAN;
  end;
end;

procedure TiOSCellDatePicker.BeforeDestruction;
begin
  if FPicker <> nil then
    FPicker.Hide;
  inherited;
end;

procedure TiOSCellDatePicker.DoApply(Sender: TObject; const ADateTime: TDateTime);
begin
  RestoreFocus(TState.Done, procedure
  begin
    SetDateTime(ADateTime);
  end);
end;

procedure TiOSCellDatePicker.DoClosePopup(Sender: TObject);
begin
  RestoreFocus(TState.Cancel);
end;

procedure TiOSCellDatePicker.DoPopup(Sender: TObject);
begin
  Owner.iOSGrid.iOSTable.View.scrollRectToVisible(Owner.View.Frame, False);
end;

procedure TiOSCellDatePicker.DoUpdateField(const AField: UITextField; const ADateTime: TDateTime);
begin
  if IsNan(ADateTime) then
    AField.setText(nil)
  else
  begin
    if Column is TDateColumn then
      AField.setText(StrToNSStr(TDateColumn(Column).ValueToString(ADateTime)))
    else
      AField.setText(StrToNSStr(DateToStr(ADateTime)));
  end;
end;

procedure TiOSCellDatePicker.UpdateField;
begin
  if FTextField <> nil then
    DoUpdateField(FTextField, FDateTime);
end;

function TiOSCellDatePicker.GetPickerShowMode: TDatePickerShowMode;
begin
  Result := TDatePickerShowMode.Date;
end;

procedure TiOSCellDatePicker.SetDateTime(const DateTime: TDateTime);
begin
  FDateTime := DateTime;
  FInitialized := True;
  UpdateField;
end;

{$ENDREGION}
{$REGION 'TiOSCellGlyph'}

constructor TiOSCellGlyph.Create(const AOwner: TColumnItem);
begin
  inherited;
  FImageIndex := -1;
end;

function TiOSCellGlyph.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellGlyph);
end;

procedure TiOSCellGlyph.DoUpdate;
var
  LBitmap: TBitmap;
  ImgRect: TRectF;
  Bounds: NSRect;
  Scale: CGFloat;
  Size: TSizeF;
  Images: TCustomImageList;
  LImage: UIImage;
begin
  LImage := nil;
  LBitmap := nil;
  FillChar(ImgRect, SizeOf(ImgRect), 0);

  Scale := MainScreen.Scale;
  if (Column is TGlyphColumn) and (FImageIndex >= 0) then
  begin
    Bounds := Owner.iOSGrid.PaddingRect(TUIView.Wrap(View.superview).bounds, Owner.Column);
    ImgRect := Bounds.ToRectF;
    ImgRect := TGlyphColumn(Column).GlyphPlaceIntoBounds(FImageIndex, ImgRect, Scale);
    if (ImgRect.Width > 0) and (ImgRect.Height > 0) then
    begin
      Images := TCustomImageList(TGlyphColumn(Column).GlyphInterface.Images);
      Size := TSizeF.Create(ImgRect.Width * Scale, ImgRect.Height * Scale);
      LBitmap := Images.Bitmap(Size, FImageIndex);
      if LBitmap <> nil then
        LImage := BitmapToUIImage(LBitmap);
    end;
  end;
  UIImageView(View).setImage(LImage);
  if (LImage <> nil) and (ImgRect.Size.Width > 1) and (ImgRect.Size.Height > 1)
  then
  begin
    UIImageView(View).setHidden(False);
    Bounds.origin.x := Round(ImgRect.Left * Scale) / Scale;
    Bounds.origin.y := Round(ImgRect.Top * Scale) / Scale;
    Bounds.Size.Width := ImgRect.Width;
    Bounds.Size.Height := ImgRect.Height;
    UIImageView(View).SetFrame(Bounds);
  end
  else
    UIImageView(View).setHidden(True);
end;

function TiOSCellGlyph.GetData: TValue;
begin
  Result := FImageIndex;
end;

procedure TiOSCellGlyph.SetData(const Value: TValue);
var
  LImageIndex: TImageIndex;
begin
  if Owner.Column is TGlyphColumn then
    LImageIndex := TGlyphColumn(Owner.Column).GetImageIndex(Value)
  else
    LImageIndex := -1;
  if FImageIndex <> LImageIndex then
  begin
    FImageIndex := LImageIndex;
    Update;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSCellImage'}

function TiOSCellImage.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellImage);
end;

function TiOSCellImage.GetFrame: NSRect;
var
  ImgRect: TRectF;
  Scale: CGFloat;
begin
  Result := inherited GetFrame;
  if (Column is TImageColumn) and (FImage <> nil) then
  begin
    Scale := MainScreen.Scale;
    ImgRect := TRectF.Create(TPointF.Zero, FImage.Size.ToSizeF).PlaceInto(Result.ToRectF).SnapToPixel(Scale, False);
    Result := NSRect.Create(ImgRect);
  end;
end;

procedure TiOSCellImage.DoUpdate;
var
  Bounds: CGRect;
begin
  if (Column is TImageColumn) and (FImage <> nil) then
  begin
    Bounds := Owner.iOSGrid.PaddingRect(TUIView.Wrap(View.superview).bounds, Owner.Column);
    if (Bounds.Size.Width > 1) and (Bounds.Size.Height >= 1) then
    begin
      UIImageView(View).setHidden(False);
      UIImageView(View).setImage(FImage);
    end
    else
      UIImageView(View).setImage(nil);
  end
  else
    UIImageView(View).setHidden(True);
end;

function TiOSCellImage.GetData: TValue;
begin
  if FImage = nil then
    Result := TValue.Empty
  else
    Result := UIImageToBitmap(FImage, 0, FImage.Size.ToSizeF.Round);
end;

procedure TiOSCellImage.SetData(const Value: TValue);
begin
  if not Value.IsEmpty and (Value.IsObject) and (Value.AsObject is TBitmap) and not TBitmap(Value.AsObject).IsEmpty then
  begin
    FImage := BitmapToUIImage(TBitmap(Value.AsObject));
    Update;
  end
  else if FImage <> nil then
  begin
    FImage := nil;
    Update;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSCellImageEditor'}

constructor TiOSCellImageEditor.Create(const AOwner: TColumnItem);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXTakenImageService, FTakenImageService);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
  FImageControl := TiOSCellImage.Create(AOwner);
  UIImageView(FImageControl.View).setUserInteractionEnabled(False);
end;

destructor TiOSCellImageEditor.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
  FTakenImageService := nil;
  FImageControl := nil;
  FreeAndNil(FBitmap);
  inherited;
end;

function TiOSCellImageEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellImageEditor);
end;

procedure TiOSCellImageEditor.DoUpdate;
begin
  Owner.View.bringSubviewToFront(FImageControl.View);
  View.setHidden(False);
  View.setUserInteractionEnabled(True);
  View.resignFirstResponder;
  FImageControl.Update;
end;

procedure TiOSCellImageEditor.DoApply(AImage: TBitmap);
begin
  RestoreFocus(TState.Done, procedure
  begin
    if AImage <> nil then
    begin
      if FBitmap = nil then
        FBitmap := TBitmap.Create;
      FBitmap.Assign(AImage);
      FImageControl.Data := FBitmap;
    end
    else
    begin
      FreeAndNil(FBitmap);
      FImageControl.Data := TValue.Empty;
    end;
    FBitmapLoaded := True;
  end);
end;

procedure TiOSCellImageEditor.DoClosePopup;
begin
  RestoreFocus(TState.Touching);
end;

procedure TiOSCellImageEditor.DidReceiveBitmap(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromLibrary then
    DoApply(TMessageDidFinishTakingImageFromLibrary(M).Value);
end;

procedure TiOSCellImageEditor.EditorClick;
var
  Params: TParamsPhotoQuery;
  ReadOnly: IReadOnly;
begin
  if (FTakenImageService <> nil) and not (Supports(Owner.ColumnLink, IReadOnly, ReadOnly) and ReadOnly.ReadOnly) then
  begin
    FillChar(Params, SizeOf(Params), 0);
    Params.RequiredResolution := TSize.Create(TCustomTakePhotoAction.DefaultMaxWidth,
      TCustomTakePhotoAction.DefaultMaxHeight);
    Params.Editable := TCustomTakePhotoAction.DefaultEditable;
    Params.NeedSaveToAlbum := TCustomTakePhotoAction.DefaultNeedSaveToAlbum;
    Params.OnDidFinishTaking := DoApply;
    Params.OnDidCancelTaking := DoClosePopup;
    FTakenImageService.TakeImageFromLibrary(Owner.Column, Params);
  end;
end;

function TiOSCellImageEditor.GetData: TValue;
begin
  if (FBitmap <> nil) and not FBitmap.IsEmpty then
    Result := FBitmap
  else
    Result := TValue.Empty;
end;

procedure TiOSCellImageEditor.SetData(const Value: TValue);
begin
  FBitmapLoaded := False;
  if (not Value.IsEmpty) and (Value.IsObject) and (Value.AsObject is TBitmap) and not TBitmap(Value.AsObject).IsEmpty
  then
  begin
    if FBitmap = nil then
      FBitmap := TBitmap.Create;
    FBitmap.Assign(TBitmap(Value.AsObject));
    FImageControl.Data := FBitmap;
  end
  else
  begin
    FreeAndNil(FBitmap);
    FImageControl.Data := TValue.Empty;
  end;
end;

procedure TiOSCellImageEditor.touchesBegan(touches: NSSet; withEvent: UIEvent);
begin

end;

procedure TiOSCellImageEditor.touchesEnded(touches: NSSet; withEvent: UIEvent);
begin
  EditorClick;
end;
{$ENDREGION}
{$REGION 'TiOSCellCheck'}

function TiOSCellCheck.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellCheck);
end;

procedure TiOSCellCheck.DoUpdate;
begin
  inherited;
  if not FInitialized then
  begin
    UIImageView(View).initWithImage(Owner.iOSGrid.Images[TImageKind.False], Owner.iOSGrid.Images[TImageKind.True]);
    FInitialized := True;
  end;
  View.setHidden(Owner.iOSGrid.Images[FValue] = nil);
  UIImageView(View).setHighlighted(FValue = TImageKind.True);
end;

function TiOSCellCheck.GetData: TValue;
begin
  case FValue of
    TImageKind.Empty:
      Result := TValue.Empty;
    TImageKind.False:
      Result := False;
    TImageKind.True:
      Result := True;
  end;
end;

function TiOSCellCheck.GetFrame: NSRect;
var
  R, DesignatedArea: TRectF;
begin
  Result := inherited GetFrame;
  if (Owner.iOSGrid.Images[TImageKind.True] <> nil) and (Owner.Column <> nil) then
  begin
    R := TRectF.Create(0, 0, Owner.iOSGrid.Images[TImageKind.True].Size.Width,
      Owner.iOSGrid.Images[TImageKind.True].Size.Height);
    DesignatedArea := Result.ToRectF;
    if TStyledSetting.Other in Owner.Column.Model.StyledSettings then
      R := R.PlaceInto(DesignatedArea)
    else
      R := R.PlaceInto(DesignatedArea, Owner.Column.DefaultTextSettings.HorzAlign.AsHorzRectAlign);
    Result := NSRect.Create(R);
  end;
end;

procedure TiOSCellCheck.SetData(const Value: TValue);
var
  B: Boolean;
begin
  if not (Owner.Column is TCheckColumn) or not TCheckColumn(Owner.Column).TryGetAsBoolean(Value, B) then
    FValue := TImageKind.Empty
  else if B then
    FValue := TImageKind.True
  else
    FValue := TImageKind.False;
  Update;
end;

{$ENDREGION}
{$REGION 'TiOSCellCheckEditor'}

constructor TiOSCellCheckEditor.Create(const AOwner: TColumnItem);
begin
  inherited;
  FCheckControl := TiOSCellCheck.Create(AOwner);
  UIImageView(FCheckControl.View).setUserInteractionEnabled(False);
end;

function TiOSCellCheckEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellCheckEditor);
end;

procedure TiOSCellCheckEditor.DoUpdate;
begin
  inherited;
  Owner.View.bringSubviewToFront(FCheckControl.View);
  View.setHidden(False);
  View.setUserInteractionEnabled(True);
  View.resignFirstResponder;
  FCheckControl.Update;
end;

function TiOSCellCheckEditor.GetData: TValue;
begin
  Result := FCheckControl.Data;
end;

procedure TiOSCellCheckEditor.SetData(const Value: TValue);
begin
  FCheckControl.Data := Value;
end;

procedure TiOSCellCheckEditor.EditorClick;
begin
  inherited;
  try
    SetData(not GetData.AsBoolean);
    Column.EditorModified;
    Owner.iOSGrid.PerformSelector('EditorDone');
  except
    Application.HandleException(Owner.iOSGrid);
  end;
end;

procedure TiOSCellCheckEditor.touchesBegan(touches: NSSet; withEvent: UIEvent);
begin

end;

procedure TiOSCellCheckEditor.touchesEnded(touches: NSSet; withEvent: UIEvent);
begin
  EditorClick;
end;
{$ENDREGION}
{$REGION 'TiOSCellTimePicker'}

procedure TiOSCellTimePicker.DoUpdateField(const AField: UITextField; const ADateTime: TDateTime);
begin
  if IsNan(ADateTime) then
    AField.setText(nil)
  else
  begin
    if Column is TTimeColumn then
      AField.setText(StrToNSStr(TTimeColumn(Column).ValueToString(ADateTime)))
    else
      AField.setText(StrToNSStr(TimeToStr(ADateTime)));
  end;
end;

function TiOSCellTimePicker.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellTimePicker);
end;

function TiOSCellTimePicker.GetPickerShowMode: TDatePickerShowMode;
begin
  Result := TDatePickerShowMode.Time;
end;

function TiOSCellTimePicker.ValueToDateTime(const Value: TValue): TDateTime;
var
  S: string;
  Settings: TFormatSettings;
begin
  Result := NAN;
  if not Value.IsEmpty and not Value.IsObject and not Value.TryAsType<TDateTime>(Result) and Value.TryAsType<string>(S)
  then
  begin
    Settings := FormatSettings;
    if (Column is TTimeColumn) and not TTimeColumn(Column).Format.IsEmpty then
      Settings.ShortTimeFormat := TTimeColumn(Column).Format;
    if not TryStrToTime(S, Result, Settings) and not TryStrToDateTime(S, Result, Settings) then
      Result := NAN;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSCellPopupLabel'}

function TiOSCellPopupLabel.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellPopupLabel);
end;

function TiOSCellPopupLabel.GetData: TValue;
begin
  if FUsingIndex then
    if FValue.IsEmpty then
      Result := -1
    else
      Result := FValue.AsInteger
  else
    Result := FValue.AsString;
end;

procedure TiOSCellPopupLabel.SetData(const Value: TValue);
var
  S: string;
  I: Integer;
begin
  S := string.Empty;
  FUsingIndex := Value.IsOrdinal and not Value.IsEmpty;
  if FUsingIndex then
    if Value.IsEmpty then
      FValue := TValue.Empty
    else
    begin
      I := Value.AsInteger;
      FValue := I;
      if (Column is TPopupColumn) and (I >= 0) and (I < TPopupColumn(Column).Items.Count) then
        S := TPopupColumn(Column).Items[I];
    end
  else if Value.TryAsType<string>(S) then
    FValue := S
  else
    FValue := TValue.Empty;
  inherited SetData(S);
end;
{$ENDREGION}
{$REGION 'TiOSCellPopupPicker'}

destructor TiOSCellPopupPicker.Destroy;
begin
  FreeAndNil(FPicker);
  inherited;
end;

function TiOSCellPopupPicker.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCellPopupPicker);
end;

procedure TiOSCellPopupPicker.touchesBegan(touches: NSSet; withEvent: UIEvent);
begin

end;

procedure TiOSCellPopupPicker.touchesEnded(touches: NSSet; withEvent: UIEvent);
begin
  EditorClick;
end;

procedure TiOSCellPopupPicker.Activate;
var
  PickerService: IFMXPickerService;
  S: string;
  I: Integer;
  ReadOnly: IReadOnly;
begin
  FreeAndNil(FPicker);
  if not (Supports(Owner.ColumnLink, IReadOnly, ReadOnly) and ReadOnly.ReadOnly) then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXPickerService, PickerService) then
    begin
      ValidateInheritance(Owner.Model.Owner, TControl, False);
      FPicker := PickerService.CreateListPicker;
      FPicker.Parent := TControl(Owner.Model.Owner);
      FPicker.AbsoluteTargetRect := AbsoluteRect;
      FPicker.OnValueChanged := DoApply;
      FPicker.OnHide := DoClosePopup;
      if Column is TPopupColumn then
      begin
        FPicker.Values := TPopupColumn(Column).Items;
        if UsingIndex then
          FPicker.ItemIndex := GetData.AsInteger
        else
        begin
          S := GetData.AsString;
          for I := 0 to TPopupColumn(Column).Items.Count - 1 do
            if S = TPopupColumn(Column).Items[I] then
            begin
              FPicker.ItemIndex := I;
              Break;
            end;
        end;
      end;
      FPicker.Show;
    end
    else
      raise EUnsupportedPlatformService.CreateFmt(SUnsupportedPlatformService, ['IFMXPickerService']);
  end;
end;

procedure TiOSCellPopupPicker.Deactivate;
begin
  if FPicker <> nil then
  begin
    FPicker.Hide;
    FreeAndNil(FPicker);
  end;
end;

procedure TiOSCellPopupPicker.DoApply(Sender: TObject; const AValueIndex: Integer);
var
  S: string;
begin
  RestoreFocus(TState.Done, procedure
  begin
    if UsingIndex then
      Data := AValueIndex
    else if Column is TPopupColumn then
    begin
      S := TPopupColumn(Column).Items[AValueIndex];
      Data := S;
    end;
  end);
end;

procedure TiOSCellPopupPicker.DoClosePopup(Sender: TObject);
begin
  RestoreFocus(TState.Touching);
end;

{$ENDREGION}
{$REGION 'TColumnItemList'}

function TColumnItemList.TComparer.Compare(const Left, Right: TColumnItem): Integer;
var
  IntLeft, IntRight: Integer;
begin
  if Left <> nil then
    if (Left.Column <> nil) and Left.Column.Visible then
      IntLeft := Left.Column.Index
    else
      IntLeft := MaxInt - 1
  else
    IntLeft := MaxInt;
  if Right <> nil then
    if (Right.Column <> nil) and Right.Column.Visible then
      IntRight := Right.Column.Index
    else
      IntRight := MaxInt - 1
  else
    IntRight := MaxInt;
  Result := CompareValue(IntLeft, IntRight);
end;

procedure TColumnItemList.Assign(const Source: TColumnItemList; const Top, Height: CGFloat);
var
  I: Integer;
  Src, Dst: TColumnItem;
  CellFrame: CGRect;
begin
  for I := 0 to Count - 1 do
  begin
    Dst := Items[I];
    Src := Source.Items[I];
    if Dst.Column <> Src.Column then
      if not Source.TryGetValue(Dst.Column, Src) then
        raise EArgumentNilException.Create(sArgumentInvalid);
    CellFrame := Src.Frame;
    CellFrame.origin.y := Top;
    CellFrame.Size.Height := Height;
    Dst.Frame := CellFrame;
    Dst.HiddenFound := Src.HiddenFound;
    Dst.ColLines := Src.ColLines;
    Dst.Update;
  end;
end;

constructor TColumnItemList.Create;
begin
  if FComparer = nil then
    FComparer := TComparer.Create;
  inherited Create(FComparer);
end;

function TColumnItemList.Find(const Column: TColumn): Integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if (Items[I] <> nil) and (Items[I].Column = Column) then
      Exit(I);
  Result := -1;
end;

function TColumnItemList.RemoveUselessItems(const ExceptTiny: Boolean = True): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Count - 1 downto 0 do
    if (Items[I] = nil) or (Items[I].Column = nil) or not Items[I].Column.Visible or
      (not ExceptTiny and (Items[I].Column.Width < 1)) then
    begin
      if Items[I] <> nil then
        Items[I].Column := nil;
      Delete(I);
      Result := True;
    end;
end;

function TColumnItemList.TryGetValue(const Column: TColumn; var Item: TColumnItem): Boolean;
var
  I: Integer;
begin
  Item := nil;
  I := Find(Column);
  Result := I >= 0;
  if Result then
    Item := Items[I]
  else
    for I := Count - 1 downto 0 do
      if (Items[I] <> nil) and ((Items[I].Column = nil) or not Items[I].Column.Visible) then
      begin
        Item := Items[I];
        Exit;
      end;
end;

{$ENDREGION}
{$REGION 'TColumnItem'}

constructor TColumnItem.TColumnLink.Create(const AOwner: TColumnItem);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TColumnItem.TColumnLink.Destroy;
begin
  Column := nil;
  inherited;
end;

procedure TColumnItem.TColumnLink.FreeNotification(AObject: TObject);
begin
  if AObject = FColumn then
  begin
    FColumn := nil;
    FChanged := True;
    FClassChanged := True;
  end;
end;

function TColumnItem.TColumnLink.GetColumn: TColumn;
begin
  Result := FColumn;
end;

procedure TColumnItem.TColumnLink.SetColumn(const Value: TColumn);
var
  OldClass, NewClass: TColumnClass;
begin
  if FColumn <> Value then
  begin
    if FColumn <> nil then
    begin
      FColumn.RemoveFreeNotify(Self);
      OldClass := TColumnClass(FColumn.ClassType);
    end
    else
      OldClass := nil;
    FColumn := Value;
    FChanged := True;
    if FColumn <> nil then
    begin
      FColumn.AddFreeNotify(Self);
      NewClass := TColumnClass(FColumn.ClassType);
    end
    else
      NewClass := nil;
    FClassChanged := OldClass <> NewClass;
  end;
end;

constructor TColumnItem.Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn);
var
  V: Pointer;
  LinkClass: TColumnLinkClass;
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) or (AParent = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
  FModel := AiOSGrid.Model;
  LinkClass := GetColumnLinkClass(AColumn);
  if LinkClass = nil then
    LinkClass := TColumnLink;
  FColumnLink := LinkClass.Create(Self);
  Column := AColumn;

  V := View.initWithFrame(RectToNSRect(TRect.Create(0, 0, Round(AColumn.Width), Round(FiOSGrid.DefaultRowHeight))));
  if GetObjectID <> V then
    UpdateObjectID(V);
  View.setHidden(True);

  AParent.addSubview(View);
  FDefaultThickness := AiOSGrid.DefaultThickness;
end;

destructor TColumnItem.Destroy;
begin
  FInternalCell := nil;
  View.removeFromSuperview;
  FColumnLink.DisposeOf;
  inherited;
end;

function TColumnItem.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IFMXColumnItem);
end;

function TColumnItem.GetView: UIView;
begin
  Result := UIView(Super);
end;

function TColumnItem.RectPlaceIntoBounds(const Frame: NSRect): NSRect;
var
  Source, Bounds: TRectF;
begin
  Result := Frame;
  if Column <> nil then
  begin
    Bounds := Result.ToRectF;
    Source := Bounds;
    Source.Height := iOSGrid.DefaultLabelHeight;
    Result := NSRect.Create(Column.RectPlaceIntoBounds(Source, Bounds));
  end;
end;

procedure TColumnItem.SetColLines(const Value: Boolean);
begin
  if FColLines <> Value then
  begin
    FColLines := Value;
    FSizeChanged := True;
  end;
end;

function TColumnItem.GetColumn: TColumn;
begin
  Result := FColumnLink.Column;
end;

function TColumnItem.GetColumnLinkClass(const AColumn: TColumn): TColumnLinkClass;
begin
  Result := nil;
end;

procedure TColumnItem.SetColumn(const Value: TColumn);
begin
  FColumnLink.Column := Value;
end;

procedure TColumnItem.SetFrame(const Value: NSRect);
begin
  if not SameValue(FFrame.origin.x, Value.origin.x, TEpsilon.FontSize) or
    not SameValue(FFrame.origin.y, Value.origin.y, TEpsilon.FontSize) then
    FPosChanged := True;

  if not SameValue(FFrame.Size.Width, Value.Size.Width, TEpsilon.FontSize) or
    not SameValue(FFrame.Size.Height, Value.Size.Height, TEpsilon.FontSize) then
    FSizeChanged := True;

  if FSizeChanged or FPosChanged then
    FFrame := Value;
end;

procedure TColumnItem.SetHiddenFound(const Value: Boolean);
begin
  if FHiddenFound <> Value then
  begin
    FHiddenFound := Value;
    FSizeChanged := True;
  end;
end;

function TColumnItem.ClientRect: NSRect;
begin
  Result := View.bounds;
  Result := iOSGrid.PaddingRect(Result, Column);
end;

procedure TColumnItem.Update;
var
  LatestItem: TColumnItem;
begin
  try
    LatestItem := iOSGrid.iOSHeader.HeaderItems[iOSGrid.iOSHeader.HeaderItems.Count - 1];
    if FSizeChanged or FPosChanged then
      View.SetFrame(FFrame);
    View.setHidden((Column <> nil) and (not Column.Visible or ((Column.Width < 1) and (Self <> LatestItem))));
    if not View.isHidden then
    begin
      if FColumnLink.ClassChanged then
      begin
        FInternalCell := nil;
        FInternalCell := CreateInternalCell;
        FSizeChanged := True;
        FColumnLink.ClassChanged := False;
      end;
    end;
    DoUpdate;
    if not View.isHidden and (FInternalCell <> nil) then
      FInternalCell.Update;
    FSizeChanged := False;
    FPosChanged := False;
  except
    Application.HandleException(iOSGrid);
  end;
end;

{$ENDREGION}
{$REGION 'TiOSHeaderItem'}

constructor TiOSHeaderItem.Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn);
begin
  inherited;
  FRightBorder := TiOSLineView.Create(iOSGrid, View, False, False);
end;

destructor TiOSHeaderItem.Destroy;
begin
  FRightBorder := nil;
  if FRightColumnLine <> nil then
  begin
    UIView(FRightColumnLine.Super).removeFromSuperview;
    FRightColumnLine := nil;
  end;
  if FLeftColumnLine <> nil then
  begin
    UIView(FLeftColumnLine.Super).removeFromSuperview;
    FLeftColumnLine := nil;
  end;
  inherited;
end;

procedure TiOSHeaderItem.DoUpdate;
var
  RightHidden: Boolean;
begin
  inherited;
  UpdateVerticalBorders;
  if FFirstBorder <> nil then
    FFirstBorder.Update;
  FRightBorder.Update;
  if HiddenFound then
    if FLeftBorder = nil then
      FLeftBorder := TiOSLineView.Create(iOSGrid, View, False, True)
    else
      FLeftBorder.Update
  else
    FLeftBorder := nil;
  if FLeftColumnLine <> nil then
    FLeftColumnLine.Visible := not View.isHidden;
  if FRightColumnLine <> nil then
    FRightColumnLine.Visible := not View.isHidden;
  RightHidden := (Column = nil) or (Column.Width < 1) or not Column.Visible;
  if FRightBorder <> nil then
    FRightBorder.View.setHidden(RightHidden);
  if FLeftColumnLine <> nil then
    FLeftColumnLine.View.setHidden(View.isHidden);
  if FRightColumnLine <> nil then
    FRightColumnLine.View.setHidden(View.isHidden or RightHidden);
end;

function TiOSHeaderItem.CreateInternalCell: TiOSCellControl;
begin
  Result := TiOSCellHeader.Create(Self);
end;

procedure TiOSHeaderItem.SetFirst(const Value: Boolean);
var
  LOffset: NSPoint;
begin
  if FFirst <> Value then
  begin
    FFirst := Value;
    if FFirst then
    begin
      if FFirstBorder = nil then
      begin
        FFirstBorder := TiOSLineView.Create(iOSGrid, View, False, True);
        LOffset.y := -iOSGrid.DefaultThickness;
        LOffset.x := -iOSGrid.DefaultThickness;
        FFirstBorder.Offset := LOffset;
      end;
    end
    else
    begin
      if FFirstBorder <> nil then
      begin
        FFirstBorder.View.removeFromSuperview;
        FFirstBorder := nil;
      end;
    end;
  end;
end;

procedure TiOSHeaderItem.UpdateVerticalBorders;
begin
  if FColLines then
  begin
    if FRightColumnLine = nil then
      FRightColumnLine := TiOSLineView.Create(iOSGrid, iOSGrid.iOSTable.View, False, False, View)
  end
  else
  begin
    if FRightColumnLine <> nil then
    begin
      FRightColumnLine.DisposeOf;
      FRightColumnLine := nil;
    end;
    if FLeftColumnLine <> nil then
    begin
      FLeftColumnLine.DisposeOf;
      FLeftColumnLine := nil;
    end;
  end;
  if FRightColumnLine <> nil then
  begin
    if FHiddenFound then
    begin
      if FLeftColumnLine = nil then
        FLeftColumnLine := TiOSLineView.Create(iOSGrid, iOSGrid.iOSTable.View, False, True, View);
    end
    else
    begin
      if FLeftColumnLine <> nil then
      begin
        FLeftColumnLine.DisposeOf;
        FLeftColumnLine := nil;
      end;
    end;
    if FLeftColumnLine <> nil then
      FLeftColumnLine.Update;
    FRightColumnLine.Update;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSInplaceEditor'}

{ TiOSInplaceEditor.TEditorColumnLink }

function TiOSInplaceEditor.TEditorColumnLink.GetReadOnly: Boolean;
begin
  Result := FReadOnly;
end;

procedure TiOSInplaceEditor.TEditorColumnLink.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
end;

constructor TiOSInplaceEditor.Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn);
begin
  inherited;
  Update;
  iOSGrid.iOSTable.View.addSubview(View);
end;

destructor TiOSInplaceEditor.Destroy;
begin
  if FBackground <> nil then
  begin
    FBackground.removeFromSuperview;
    FBackground := nil;
  end;
  View.removeFromSuperview;
  inherited;
end;

procedure TiOSInplaceEditor.Activate;
begin
  if not FActive then
  begin
    FActive := True;
    View.setBackgroundColor(iOSGrid.FTintColor);
    FBackground.setBackgroundColor(iOSGrid.FBkColor);
    if InternalCell <> nil then
      InternalCell.Activate;
  end;
end;

procedure TiOSInplaceEditor.Deactivate;
begin
  if FActive then
  begin
    FActive := False;
    View.setBackgroundColor(iOSGrid.FHighlightColor);
    if InternalCell <> nil then
      InternalCell.Deactivate;
  end;
end;

function TiOSInplaceEditor.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSInplaceEditor);
end;

procedure TiOSInplaceEditor.DoUpdate;
var
  R: NSRect;
begin
  R := iOSGrid.GetEditorRect;
  if not FInitialized then
  begin
    View.initWithFrame(R);
    FInitialized := True;
  end
  else
    View.SetFrame(R);
  R := View.bounds;
  R.origin.x := BorderWidth;
  R.origin.y := BorderWidth;
  R.Size.Width := R.Size.Width - 2 * BorderWidth;
  R.Size.Height := R.Size.Height - 2 * BorderWidth;
  if FBackground = nil then
  begin
    FBackground := TUIView.Wrap(TUIView.Alloc.initWithFrame(R));
    View.addSubview(FBackground);
    View.sendSubviewToBack(FBackground);
  end
  else
    FBackground.SetFrame(R);
end;

procedure TiOSInplaceEditor.EditorClick;
begin
  if InternalCell <> nil then
    InternalCell.EditorClick;
end;

function TiOSInplaceEditor.GetColumnLinkClass(const AColumn: TColumn): TColumnItem.TColumnLinkClass;
var
  CellType: TiOSCellControlClass;
begin
  CellType := iOSGrid.GetEditorClass(AColumn);
  if (CellType = nil) or CellType.InheritsFrom(TiOSCellDefaultEditor) then
    Result := TEditorColumnLink
  else
    Result := inherited;
end;

function TiOSInplaceEditor.CreateInternalCell: TiOSCellControl;
var
  CellType: TiOSCellControlClass;
  textField: UITextField;
begin
  if Column = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  CellType := iOSGrid.GetEditorClass(Column);
  if CellType = nil then
    CellType := TiOSCellDefaultEditor;
  Result := CellType.Create(Self);
  if Supports(Result.View, UITextField, textField) then
    textField.setDelegate(TiOSEditDelegate(iOSGrid.FiOSEditDelegate).GetObjectID);
end;

{$ENDREGION}
{$REGION 'TiOSHeader'}

constructor TiOSHeader.Create(const AiOSGrid: TiOSGrid);
var
  LOffset: NSPoint;
  V: Pointer;
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FIndexChangedColumn := -1;
  FIndexResizeHeader := -1;
  FIndexMoveHeader := -1;
  FiOSGrid := AiOSGrid;
  FModel := AiOSGrid.Model;
  FHeight := Round(iOSGrid.DefaultHeaderHeight);
  FWidth := FHeight;
  V := View.initWithFrame(RectToNSRect(TRect.Create(0, 0, Round(FWidth), Round(FHeight))));
  if GetObjectID <> V then
    UpdateObjectID(V);

  FPanRecognizer := TUIPanGestureRecognizer.Alloc;
  FPanRecognizer.initWithTarget(GetObjectID, sel_getUid('HandlePan:'));
  FPanRecognizer.setDelaysTouchesBegan(False);
  FPanRecognizer.setCancelsTouchesInView(True);
  View.addGestureRecognizer(FPanRecognizer);
  View.setExclusiveTouch(True);

  View.setBackgroundColor(TUIColor.Wrap(TUIColor.OCClass.groupTableViewBackgroundColor));
  FLineHeader := TiOSLineView.Create(iOSGrid, View, True, False);
  LOffset.x := -iOSGrid.DefaultThickness;
  LOffset.y := 0;
  FLineHeader.Offset := LOffset;
  FHeaderItems := TColumnItemList.Create;
  iOSGrid.View.addSubview(View);
end;

destructor TiOSHeader.Destroy;
begin
  FHeaderItems.Clear;
  FHeaderItems := nil;
  inherited;
end;

procedure TiOSHeader.DoColumnResize;
begin
  if (iOSGrid <> nil) and (iOSGrid.Model <> nil) and iOSGrid.Model.Enabled and
    (TGridOption.ColumnResize in iOSGrid.Model.Options) and
    InRange(FIndexChangedColumn, 0, iOSGrid.Model.ColumnCount - 1) then
  begin
    iOSGrid.Model.Columns[FIndexChangedColumn].Width := FNewColumnWidth;
    FIndexChangedColumn := -1;
  end;
end;

procedure TiOSHeader.DoColumnIndexChange;
begin
  if (iOSGrid <> nil) and (iOSGrid.Model <> nil) and iOSGrid.Model.Enabled and
    (TGridOption.ColumnMove in iOSGrid.Model.Options) and InRange(FFromIndex, 0, iOSGrid.Model.ColumnCount - 1) and
    InRange(FToIndex, 0, iOSGrid.Model.ColumnCount - 1) then
  begin
    iOSGrid.Model.Columns[FFromIndex].Index := FToIndex;
    FFromIndex := -1;
    FToIndex := -1;
  end;
end;

function TiOSHeader.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSHeader);
end;

function TiOSHeader.GetView: UIView;
begin
  Result := UIView(Super);
end;

function TiOSHeader.FindItemIndex(const TouchPoint: CGPoint; var Index: Integer): Boolean;
var
  I: Integer;
  LFrame: NSRect;
begin
  for I := 0 to HeaderItems.Count - 1 do
  begin
    LFrame := HeaderItems[I].Frame;
    if InRange(TouchPoint.X, LFrame.origin.x, LFrame.origin.x + LFrame.Size.Width) and (HeaderItems[I].Column <> nil)
    then
    begin
      Index := I;
      Exit(True);
    end;
  end;
  Result := False;
end;

function TiOSHeader.FindItemIndex(const touches: NSSet; var Index: Integer): Boolean;
var
  Touch: UITouch;
  P: CGPoint;
begin
  Result := (HeaderItems.Count > 0) and (touches <> nil) and (touches.Count > 0);
  if Result then
  begin
    Touch := TUITouch.Wrap(touches.anyObject);
    P := Touch.locationInView(View);
    Result := FindItemIndex(P, Index);
  end;
end;

procedure TiOSHeader.HandlePan(gestureRecognizer: UIPanGestureRecognizer);
var
  TouchPoint: CGPoint;
  I: Integer;
  R: TRectF;
  DistanceToVertLine, ResizeAreaWidth: CGFloat;
begin
  try
    TouchPoint := gestureRecognizer.locationInView(View);
    case gestureRecognizer.state of
      UIGestureRecognizerStateBegan:
      begin
        FIndexChangedColumn := -1;
        FIndexResizeHeader := -1;
        FIndexMoveHeader := -1;
        if Model.Enabled and ([TGridOption.ColumnMove, TGridOption.ColumnResize] * Model.Options <> []) and
          FindItemIndex(TouchPoint, I) then
        begin
          R := HeaderItems[I].View.Frame.ToRectF;
          DistanceToVertLine := Min(Abs(R.Left - TouchPoint.X), Abs(R.Right - TouchPoint.X));
          if TGridOption.ColumnMove in Model.Options then
            ResizeAreaWidth := Min(R.Width / 4, R.Height)
          else
            ResizeAreaWidth := Min(R.Width / 2, R.Height);
          if (TGridOption.ColumnResize in Model.Options) and (DistanceToVertLine < ResizeAreaWidth) then
          begin
            FIndexResizeHeader := I;
            if TouchPoint.X < (R.Left + R.Width / 2) then
              Dec(FIndexResizeHeader);
          end;
          if (FIndexResizeHeader = -1) and (TGridOption.ColumnMove in Model.Options) then
            FIndexMoveHeader := I;
          if (FIndexResizeHeader >= 0) or (FIndexMoveHeader >= 0) then
          begin
            FCapturePoint := TouchPoint;
            StartMoveOrResize(TouchPoint);
          end;
        end;
      end;
      UIGestureRecognizerStateChanged:
        if Model.Enabled and ([TGridOption.ColumnMove, TGridOption.ColumnResize] * Model.Options <> []) then
          MoveOrResize(TouchPoint);
    else
      EndMoveOrResize(TouchPoint);
    end;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSHeader.touchesEnded(touches: NSSet; withEvent: UIEvent);
var
  I: Integer;
begin
  if (FIndexResizeHeader = -1) and (FIndexMoveHeader = -1) then
  try
    if Model.Enabled and (TGridOption.HeaderClick in Model.Options) and Assigned(Model.OnHeaderClick) and
      FindItemIndex(touches, I) then
      Model.OnHeaderClick(HeaderItems[I].Column);
  except
    Application.HandleException(iOSGrid);
  end;
  FIndexResizeHeader := -1;
  FIndexMoveHeader := -1;
end;

procedure TiOSHeader.EndMoveOrResize(const P: CGPoint);
var
  X: CGFloat;
  R: TRectF;
begin
  if (FIndexResizeHeader >= 0) and (FResizeColumnBorder <> nil) then
  begin
    R := FHeaderItems[FIndexResizeHeader].View.Frame.toRectF;
    X := Max(P.X - FCapturePoint.x + R.Right, R.Left);
    FIndexChangedColumn := FHeaderItems[FIndexResizeHeader].Column.Index;
    FNewColumnWidth := RoundTo(X - R.Left, -1);
    iOSGrid.PerformSelector('ColumnWidthChange', 0.1);
  end
  else if (FIndexMoveHeader >= 0) and (FMoveColumnItem <> nil) and (FFromIndex >= 0) and (FToIndex >= 0) then
  begin
    iOSGrid.PerformSelector('ColumnIndexChange', 0.1);
  end;
  FResizeColumnBorder := nil;
  FMoveColumnItem := nil;
end;

procedure TiOSHeader.MoveOrResize(const P: CGPoint);
var
  R: TRectF;
  LFrame: CGRect;
  TouchPoint: CGPoint;
  I, SelectedIndex: Integer;
begin
  TouchPoint.y := 0;
  TouchPoint.x := 0;
  SelectedIndex := -1;
  if (FIndexResizeHeader >= 0) and (FResizeColumnBorder <> nil) then
  begin
    R := FHeaderItems[FIndexResizeHeader].View.Frame.toRectF;
    TouchPoint.x := Max(P.X - FCapturePoint.x + R.Right, R.Left);
    LFrame := TBorderView(FResizeColumnBorder).GetFrame(TouchPoint.x);
    TBorderView(FResizeColumnBorder).View.setFrame(LFrame);
  end
  else if (FIndexMoveHeader >= 0) and (FMoveColumnItem <> nil) then
  begin
    LFrame := TFakeColumnView(FMoveColumnItem).GetFrame(P.X);
    TouchPoint.x := LFrame.origin.x + LFrame.size.Width / 2;
    TFakeColumnView(FMoveColumnItem).View.setFrame(LFrame);
    if FindItemIndex(TouchPoint, I) then
    begin
      LFrame := FHeaderItems[I].View.Frame;
      if TouchPoint.x > (LFrame.origin.x + LFrame.size.width / 2)  then
        Inc(I);
      if not InRange(I, FIndexMoveHeader, FIndexMoveHeader + 1) then
        if I < FHeaderItems.Count then
          SelectedIndex := FHeaderItems[I].Column.Index
        else
          SelectedIndex := FHeaderItems[FHeaderItems.Count - 1].Column.Index + 1;
    end;
    if (SelectedIndex >= 0) then
    begin
      R := FHeaderItems[Min(I, FHeaderItems.Count - 1)].View.Frame.toRectF;
      if I = FHeaderItems.Count then
        TouchPoint.x := R.Right
      else
        TouchPoint.x := R.Left;
      if FResizeColumnBorder = nil then
        FResizeColumnBorder := TBorderView.Create(Self, TouchPoint.x)
      else
        TBorderView(FResizeColumnBorder).View.setFrame(TBorderView(FResizeColumnBorder).GetFrame(TouchPoint.x));
      FFromIndex := FHeaderItems[FIndexMoveHeader].Column.Index;
      FToIndex := SelectedIndex;
      if FToIndex > FFromIndex then
        Dec(FToIndex);
    end
    else
    begin
      FResizeColumnBorder := nil;
      FFromIndex := -1;
      FToIndex := -1;
    end;
  end;
end;

procedure TiOSHeader.StartMoveOrResize(const P: CGPoint);
var
  R: TRectF;
begin
  if FIndexResizeHeader >= 0 then
  begin
    R := FHeaderItems[FIndexResizeHeader].View.Frame.toRectF;
    FResizeColumnBorder := TBorderView.Create(Self, R.Right);
  end
  else if FIndexMoveHeader >= 0 then
    FMoveColumnItem := TFakeColumnView.Create(Self, P.x, FHeaderItems[FIndexMoveHeader]);
end;

procedure TiOSHeader.Update;
var
  LSorted, LHiddenFound, LFirst: Boolean;
  I: Integer;
  LItem: TiOSHeaderItem;
  X: CGFloat;
  R, ParentRect: NSRect;
begin
  { Recreate header items }
  FHeaderItems.Sort;
  LSorted := True;
  for I := 0 to Model.ColumnCount - 1 do
    if Model.Columns[I].Visible then
    begin
      if not FHeaderItems.TryGetValue(Model.Columns[I], TColumnItem(LItem)) then
      begin
        LSorted := False;
        if LItem = nil then
        begin
          LItem := TiOSHeaderItem.Create(iOSGrid, View, Model.Columns[I]);
          LItem.ColLines := TGridOption.ColLines in iOSGrid.Model.Options;
          FHeaderItems.Add(LItem);
        end
        else
          LItem.Column := Model.Columns[I];
      end;
    end;
  { Remove unused items }
  if FHeaderItems.RemoveUselessItems then
    LSorted := False;
  if not LSorted then
    FHeaderItems.Sort;
  { Update of every coordinates }
  LHiddenFound := False;
  LFirst := True;
  X := 0;
  R.origin.y := 0;
  R.Size.Height := View.Frame.Size.Height - iOSGrid.DefaultThickness;
  for I := 0 to FHeaderItems.Count - 1 do
    if FHeaderItems[I].Column.Visible then
    begin
      LItem := TiOSHeaderItem(FHeaderItems[I]);
      R.origin.x := X;
      R.Size.Width := 0;
      if LItem.Column.Width < 1 then
      begin
        LHiddenFound := True;
        R.Size.Width := 0;
        LItem.First := False;
      end
      else
      begin
        LItem.HiddenFound := LHiddenFound;
        LItem.First := LFirst;
        LFirst := False;
        if LHiddenFound then
        begin
          R.Size.Width := LItem.Column.Width + iOSGrid.DefaultThickness + iOSGrid.ColumnThickness;
          LHiddenFound := False;
        end
        else
          R.Size.Width := LItem.Column.Width + iOSGrid.ColumnThickness;
        X := X + R.Size.Width;
      end;
      LItem.Frame := R;
    end;
  { The last dummy column }
  if LHiddenFound then
  begin
    R.origin.x := X;
    R.Size.Width := R.Size.Height;
    LItem.Frame := R;
    LItem.HiddenFound := LHiddenFound;
    X := X + iOSGrid.DefaultThickness;
  end;
  { Updating of other properties }
  FWidth := X - iOSGrid.ColumnThickness;
  if TGridOption.Header in Model.Options then
  begin
    View.setHidden(False);
    ParentRect := iOSGrid.View.Frame;
    R.origin.x := -iOSGrid.iOSTable.View.contentOffset.x;
    R.origin.y := 0;
    R.Size.Width := Max(FWidth, ParentRect.Size.Width);
    R.Size.Height := FHeight;
    View.SetFrame(R);
  end
  else
    View.setHidden(True);
  for I := 0 to FHeaderItems.Count - 1 do
  begin
    LItem := TiOSHeaderItem(FHeaderItems[I]);
    LItem.ColLines := TGridOption.ColLines in Model.Options;
    LItem.Update;
  end;
  FLineHeader.Update;
end;

{$ENDREGION}
{$REGION 'TiOSCell'}

constructor TiOSCell.Create(const AiOSGrid: TiOSGrid; const AParent: UIView; const AColumn: TColumn);
begin
  inherited;
end;

function TiOSCell.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSCell);
end;

procedure TiOSCell.SetRow(const Value: Integer);
begin
  if FRow <> Value then
  begin
    if (Row < 0) and (Value >= 0) then
    begin
      FRow := Value;
      UpdateBackground;
    end
    else
      FRow := Value;
    if (FRow < 0) and (InternalCell <> nil) then
      InternalCell.Data := TValue.Empty;
  end;
end;

function TiOSCell.CreateInternalCell: TiOSCellControl;
var
  CellType: TiOSCellControlClass;
begin
  Result := nil;
  if Column <> nil then
  begin
    CellType := iOSGrid.GetCellClass(Column);
    if CellType = nil then
      CellType := TiOSCellLabel;
    Result := CellType.Create(Self);
  end
end;

procedure TiOSCell.DoUpdate;
begin
  if Column <> nil then
  begin
    View.setUserInteractionEnabled(Column.Enabled);
    if Column.Enabled then
      View.setAlpha(Column.Opacity)
    else
      View.setAlpha(Column.Opacity * TControl.DefaultDisabledOpacity);
    UpdateBackground;
  end;
end;

procedure TiOSCell.DoUpdateValue(const ACell: TiOSCellControl);
begin
  if (ACell <> nil) then
  begin
    if (Column <> nil) and (Row >= 0) and (Row < Model.RowCount) then
      ACell.Data := Model.GetValue(Column.Index, Row, True)
    else
      ACell.Data := TValue.Empty
  end;
end;

procedure TiOSCell.UpdateValue;
begin
  try
    if not View.isHidden and (InternalCell <> nil) and Column.Visible and (Column.Width >= 1) then
      DoUpdateValue(InternalCell);
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSCell.UpdateBackground;
begin
  if (Row >= 0) and (Model.Row = Row) and (Model.Col = Column.Index) and (iOSGrid.FFocused or
    (TGridOption.AlwaysShowSelection in Model.Options)) then
    if iOSGrid.FFocused then
      View.setBackgroundColor(iOSGrid.FFocusColor)
    else
      View.setBackgroundColor(iOSGrid.FUnfocusColor)
  else
    View.setBackgroundColor(nil);
end;

{$ENDREGION}
{$REGION 'TiOSRow'}

constructor TiOSRow.Create(const AiOSGrid: TiOSGrid);
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
  FModel := AiOSGrid.Model;
  InitView;
  FLineDown := TiOSLineView.Create(FiOSGrid, View, True, False);
  FCells := TColumnItemList.Create;
  FiOSGrid.iOSTable.View.addSubview(View);
end;

destructor TiOSRow.Destroy;
begin
  FCells.Clear;
  FCells.Free;
  FLineDown := nil;
  inherited;
end;

procedure TiOSRow.InitView;
var
  V: Pointer;
begin
  V := View.init;
  if GetObjectID <> V then
    UpdateObjectID(V);
end;

function TiOSRow.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSRow);
end;

function TiOSRow.GetCells(const Index: Integer): TiOSCell;
var
  Item: TColumnItem;
begin
  if (FCells <> nil) and (Index >= 0) and (Index < FModel.ColumnCount) and
    FCells.TryGetValue(FModel.Columns[Index], Item) then
    Result := TiOSCell(Item)
  else
    Result := nil;
end;

function TiOSRow.GetIndex: Integer;
begin
  Result := View.tag;
end;

function TiOSRow.GetView: UIView;
begin
  Result := IiOSRow(Super);
end;

procedure TiOSRow.PrepareForReuse;
var
  I: Integer;
begin
  if not Model.DataStored or Model.IsUsedInBinding then
    FModel.ClearRowInCache(GetIndex);
  for I := 0 to FCells.Count - 1 do
    TiOSCell(FCells[I]).Row := -1;
  View.SetTag(-1);
end;

procedure TiOSRow.Update;
var
  LHeader, LCell: TColumnItem;
  R, OldFrame: NSRect;
  I: Integer;
begin
  IiOSLineView(FLineDown.Super).setHidden(not (TGridOption.RowLines in iOSGrid.Model.Options));
  if (iOSGrid <> nil) and (iOSGrid.iOSHeader.HeaderItems <> nil) and
    (iOSGrid.FContentState <> TiOSGrid.TContentState.Changed) then
  begin
    for I := 0 to iOSGrid.iOSHeader.HeaderItems.Count - 1 do
    begin
      LHeader := iOSGrid.iOSHeader.HeaderItems[I];
      if not FCells.TryGetValue(LHeader.Column, LCell) and
        (LHeader.Column.Width >= 1) then
      begin
        if LCell = nil then
        begin
          LCell := TiOSCell.Create(iOSGrid, View, LHeader.Column);
          FCells.Add(LCell);
        end
        else
          LCell.Column := LHeader.Column;
      end;
    end;
    FCells.RemoveUselessItems(False);
    FCells.Sort;
    if FLineDown <> nil then
    begin
      FLineDown.Visible := TGridOption.RowLines in iOSGrid.Model.Options;
      R.origin.x := 0;
      R.origin.y := iOSGrid.iOSTable.RowHeight * Index;
      R.Size.Width := iOSGrid.iOSHeader.Width;
      R.Size.Height := iOSGrid.iOSTable.RowHeight;
      OldFrame := View.Frame;
      View.SetFrame(R);
      if iOSGrid.FForceUpdateRows or (not (SameValue(OldFrame.Size.Width, R.Size.Width, TEpsilon.FontSize) and
        SameValue(OldFrame.Size.Height, R.Size.Height, TEpsilon.FontSize))) then
      begin
        FCells.Assign(FiOSGrid.iOSHeader.HeaderItems, 0, R.Size.Height - iOSGrid.RowThickness);
        if (FLineDown <> nil) and FLineDown.Visible then
          FLineDown.Update;
      end;
    end;
    for I := 0 to FCells.Count - 1 do
    begin
      TiOSCell(FCells[I]).Row := Index;
      TiOSCell(FCells[I]).UpdateValue;
    end;
    if (Model.Row = Index) and (TGridOption.RowSelect in Model.Options) then
      View.setBackgroundColor(iOSGrid.FHighlightColor)
    else if Odd(Index) and (TGridOption.AlternatingRowBackground in Model.Options) then
      View.setBackgroundColor(iOSGrid.FOddColor)
    else
      View.setBackgroundColor(nil);
  end;
end;

{$ENDREGION}
{$REGION 'TiOSTable'}
{ TiOSTable.TRowComparer }

function TiOSTable.TRowComparer.Compare(const Left, Right: TiOSRow): Integer;
begin
  Result := CompareValue(Left.Index, Right.Index);
end;

constructor TiOSTable.Create(const AiOSGrid: TiOSGrid);
var
  V: Pointer;
  LOffset: NSPoint;
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
  FModel := AiOSGrid.Model;

  V := View.initWithFrame(FiOSGrid.GetViewFrame);
  if GetObjectID <> V then
    UpdateObjectID(V);

  LOffset.x := -iOSGrid.DefaultThickness;
  LOffset.y := -iOSGrid.DefaultThickness;
  FTopLine := TiOSLineView.Create(iOSGrid, View, True, True);
  FTopLine.Offset := LOffset;
  FLeftLine := TiOSLineView.Create(iOSGrid, View, False, True);
  FLeftLine.Offset := LOffset;

  View.setAlwaysBounceHorizontal(False);
  View.setAlwaysBounceVertical(False);
  View.setAutoresizesSubviews(False);
  View.setClipsToBounds(False);
  iOSGrid.View.addSubview(View);
end;

destructor TiOSTable.Destroy;
begin
  if FDisappearedRows <> nil then
  begin
    FDisappearedRows.Clear;
    FDisappearedRows.Free;
  end;
  if FRows <> nil then
  begin
    FRows.Clear;
    FRows.Free;
  end;
  FLeftLine := nil;
  FTopLine := nil;
  inherited;
end;

function TiOSTable.EnterState(const AState: TiOSCellControl.TState): Boolean;
begin
  Result := (FState = TiOSCellControl.TState.Normal) and (AState <> FState);
  if Result then
    FState := AState;
end;

procedure TiOSTable.ResetState;
begin
  FState := TiOSCellControl.TState.Normal;
end;

function TiOSTable.becomeFirstResponder: Boolean;
begin
  try
    Result := (iOSGrid <> nil) and Model.Enabled and (iOSGrid.Control <> nil) and iOSGrid.Control.CanFocus;
    if Result then
    begin
      if State = TiOSCellControl.TState.Normal then
        iOSGrid.Control.SetFocus;
      View.becomeFirstResponder;
    end;
  except
    Result := False;
    Application.HandleException(iOSGrid);
  end;
end;

function TiOSTable.GetView: UIScrollView;
begin
  Result := UIScrollView(Super);
end;

function TiOSTable.GetRows(const Index: Integer): TiOSRow;
begin
  if not ((FRows <> nil) and FRows.TryGetValue(Index, Result)) then
    Result := nil;
end;

procedure TiOSTable.RowsAppeared(const MinRow, MaxRow: Integer);
var
  LRow: TiOSRow;
  I: Integer;
begin
  for I := Max(0, MinRow) to Min(RowCount - 1, MaxRow) do
    if (FRows = nil) or not FRows.ContainsKey(I) then
    begin
      if (FDisappearedRows <> nil) and (FDisappearedRows.Count > 0) then
        LRow := FDisappearedRows.Pop
      else
        LRow := TiOSRow.Create(iOSGrid);
      try
        if FRows = nil then
          FRows := TDictionary<Integer, TiOSRow>.Create;
        FRows.Add(I, LRow);
        try
          LRow.View.SetTag(I);
          LRow.Update;
        except
          FRows.Remove(I);
          raise;
        end;
      finally
        LRow := nil;
      end;
    end;
end;

procedure TiOSTable.RowsDisappeared(const MinRow, MaxRow: Integer);
var
  I: Integer;
  RowIndexes: TArray<Integer>;
  LRow: TiOSRow;
begin
  if FRows <> nil then
  begin
    RowIndexes := FRows.Keys.ToArray;
    for I in RowIndexes do
      if (I < MinRow) or (I > MaxRow) then
      begin
        LRow := FRows[I];
        if FDisappearedRows = nil then
          FDisappearedRows := TStack<TiOSRow>.Create;
        FDisappearedRows.Push(LRow);
        FRows.Remove(I);
        LRow.PrepareForReuse;
      end;
  end;
end;

procedure TiOSTable.UpdateFocused;
var
  Row: TiOSRow;
  Cell: TiOSCell;
begin
  if (Model.Row >= 0) and (Model.Col >= 0) then
  for Row in FRows.Values do
    if Row.Index = Model.Row then
    begin
      Cell := Row.Cells[Model.Col];
      if Cell <> nil then
        Cell.UpdateBackground;
    end;
end;

procedure TiOSTable.UpdateVisibleRows;
var
  I: Integer;
  List: TList<TiOSRow>;
begin
  if (FRows <> nil) and (FRows.Count > 0) and not Model.IsUpdating then
  begin
    List := TList<TiOSRow>.Create;
    try
      List.AddRange(FRows.Values);
      if List.Count > 0 then
      begin
        if FComparer = nil then
          FComparer := TRowComparer.Create;
        List.Sort(FComparer);
        Model.ReduceCache(0, List[0].Index, Model.ColumnCount - 1, List[List.Count - 1].Index);
        for I := 0 to List.Count - 1 do
          List[I].Update;
      end;
      if iOSGrid.FForceUpdateRows and (FDisappearedRows <> nil) then
        FDisappearedRows.Clear;
    finally
      List.Free;
    end;
  end;
end;

procedure TiOSTable.DidScroll(const ScrollView: UIScrollView);
var
  LBounds: NSRect;
  LOffset: CGFloat;
  TopRow, BottomRow: Integer;
begin
  LOffset := ScrollView.contentOffset.y;
  if RowHeight > 0 then
  begin
    LBounds := View.bounds;
    TopRow := Trunc(LOffset / RowHeight);
    BottomRow := Min(RowCount - 1, Ceil((LOffset + LBounds.Size.Height) / RowHeight));
    RowsDisappeared(TopRow, BottomRow);
    RowsAppeared(TopRow, BottomRow);
  end;
end;

function TiOSTable.GetTouchCoord(const touches: NSSet; var x, y: single; var TapCount: Integer;
  const AView: UIView = nil): Boolean;
var
  Touch: UITouch;
  P: CGPoint;
begin
  Result := (touches <> nil) and (touches.Count > 0);
  if Result then
  begin
    Touch := TUITouch.Wrap(touches.anyObject);
    TapCount := Touch.tapCount;
    if AView = nil then
      P := Touch.locationInView(View)
    else
      P := Touch.locationInView(AView);
    x := P.x;
    y := P.y;
  end;
end;

procedure TiOSTable.ScrollToSelectedCell(const Animated: Boolean = True);
var
  Rect: NSRect;
begin
  if (Model.Col >= 0) and (Model.Row >= 0) then
  begin
    Rect := iOSGrid.CellRect(Model.Col, Model.Row);
    Rect.origin.x := Rect.origin.x - iOSGrid.ColumnThickness;
    Rect.origin.y := Rect.origin.y - iOSGrid.RowThickness;
    Rect.Size.Width := Min(View.Frame.Size.Width, Rect.Size.Width + 5 * iOSGrid.ColumnThickness);
    Rect.Size.Height := Rect.Size.Height + 5 * iOSGrid.RowThickness;
    View.scrollRectToVisible(Rect, Animated);
  end;
end;

procedure TiOSTable.SetVKOffset(const Value: CGFloat);
begin
  FVKOffset := Value;
  if FVKOffset > 0 then
    ScrollToSelectedCell(False);
  UpdateFrame;
  if FVKOffset > 0 then
    ScrollToSelectedCell(True);
end;

procedure TiOSTable.touchesBegan(touches: NSSet; withEvent: UIEvent);
begin
  { none }
end;

procedure TiOSTable.touchesCancelled(touches: NSSet; withEvent: UIEvent);
begin
  View.touchesCancelled(touches, withEvent);
end;

procedure TiOSTable.touchesEnded(touches: NSSet; withEvent: UIEvent);
  procedure PerformClick(const ACoord: TGridModel.TCoord; const ATapCount: Integer);
  begin
    case ATapCount of
      1: iOSGrid.CellClick(Model.Columns[ACoord.Col], ACoord.Row);
      2: iOSGrid.CellDblClick(Model.Columns[ACoord.Col], ACoord.Row);
    end;
  end;
var
  I, TapCount: Integer;
  X, Y: Single;
  LFrame: CGRect;
  LCoord: TGridModel.TCoord;
  TapPoint: TPointF;
  LNeedFocus: Boolean;
  GestureControl: IGestureControl;
begin
  try
    LNeedFocus := False;
    if EnterState(TiOSCellControl.TState.Touching) then
    try
      if Model.Enabled and GetTouchCoord(touches, X, Y, TapCount) then
      begin
        LCoord.Row := -1;
        LCoord.Col := -1;
        if (iOSGrid.Control <> nil) and iOSGrid.Control.GetInterface(IGestureControl, GestureControl) and
          GetTouchCoord(touches, TapPoint.X, TapPoint.Y, TapCount, iOSGrid.View) then
        begin
          TapPoint := iOSGrid.Control.LocalToAbsolute(TapPoint);
          GestureControl.Tap(TapPoint);
        end;
        if iOSGrid.FFocused or BecomeFirstResponder then
        begin
          LNeedFocus := True;
          if (Y >= 0) and (Y < RowHeight * RowCount) then
            LCoord.Row := Trunc(Y / RowHeight);
          for I := 0 to iOSGrid.iOSHeader.HeaderItems.Count - 1 do
          begin
            LFrame := iOSGrid.iOSHeader.HeaderItems[I].Frame;
            if (X >= LFrame.origin.x) and (X <= LFrame.origin.x + LFrame.Size.Width) then
            begin
              LCoord.Col := iOSGrid.iOSHeader.HeaderItems[I].Column.Index;
              Break;
            end;
          end;
          if (LCoord.Row >= 0) and (LCoord.Col >= 0) and (LCoord.Col < Model.ColumnCount) and
            (Model.Columns[LCoord.Col].Visible) then
          begin
            if (Model.Columns[LCoord.Col].Enabled) then
            begin
              if (Model.Col = LCoord.Col) and (Model.Row = LCoord.Row) then
              begin
                PerformClick(LCoord, TapCount);
                Model.ShowEditor;
              end
              else
              begin
                Model.SelectCell(LCoord.Col, LCoord.Row);
                PerformClick(LCoord, TapCount);
                if (TapCount = 2) and (Model.Col = LCoord.Col) and (Model.Row = LCoord.Row) then
                  Model.ShowEditor;
              end;
              iOSGrid.PerformSelector('EditorClick', 0.1);
            end
            else
              PerformClick(LCoord, TapCount);
          end;
        end;
      end;
    finally
      ResetState;
      if LNeedFocus and iOSGrid.Control.CanFocus then
        iOSGrid.Control.SetFocus;
    end;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSTable.touchesMoved(touches: NSSet; withEvent: UIEvent);
begin
  View.touchesMoved(touches, withEvent);
end;

function TiOSTable.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSTable);
end;

procedure TiOSTable.UpdateFrame;
var
  R, RowRect: NSRect;
  LSize, LOldSize: NSSize;
  LOffset: CGPoint;
  LVKOffset, LContentOffset: CGFloat;
  ContentSizeChanged: Boolean;
  Row: TiOSRow;
begin
  FRowCount := Model.RowCount;
  if Model.RowHeight <= 0 then
    FRowHeight := iOSGrid.RowThickness + iOSGrid.DefaultRowHeight
  else
    FRowHeight := Model.RowHeight;
  LSize.Height := Max(0, RowHeight) * Max(0, RowCount);
  LSize.Width := iOSGrid.iOSHeader.Width;

  R := iOSGrid.View.bounds;
  if not iOSGrid.iOSHeader.View.isHidden then
  begin
    R.origin.y := iOSGrid.iOSHeader.Height;
    R.Size.Height := R.Size.Height - iOSGrid.iOSHeader.Height;
  end;
  LOffset := View.contentOffset;
  if (FVKOffset > iOSGrid.ColumnThickness) and (FVKOffset < R.Size.Height) then
  begin
    Row := Rows[Model.Row];
    if Row <> nil then
    begin
      RowRect := iOSGrid.View.convertRect(Row.View.bounds, Row.View);
      RowRect.origin.y := RowRect.origin.y + FTableOffset;
      FTableOffset := 0;
      LVKOffset := (RowRect.origin.y + RowRect.Size.Height) - (R.origin.y + R.Size.Height - FVKOffset);
      if LVKOffset > 0 then
      begin
        LContentOffset := LSize.Height - (LOffset.y + R.Size.Height);
        if LContentOffset >= LVKOffset then
        begin
          LOffset.y := LOffset.y + LVKOffset;
          View.setContentOffset(LOffset);
        end
        else
        begin
          LOffset.y := LOffset.y + LSize.Height - R.Size.Height - LOffset.y;
          View.setContentOffset(LOffset);
          RowRect := Row.View.Frame;
          LVKOffset := LSize.Height - (RowRect.origin.y + RowRect.Size.Height);
          FTableOffset := FVKOffset - LVKOffset;
          R.origin.y := R.origin.y - Max(0, FTableOffset);
        end;
      end;
    end
    else
      FTableOffset := 0;
  end
  else
    FTableOffset := 0;
  View.SetFrame(R);
  LOldSize := View.contentSize;
  ContentSizeChanged := not SameValue(LOldSize.Width, LSize.Width, TEpsilon.FontSize) or
    not SameValue(LOldSize.Height, LSize.Height, TEpsilon.FontSize);
  if ContentSizeChanged then
    View.setContentSize(LSize);
  View.setScrollEnabled(True);
  LOffset.y := View.contentOffset.y;
  View.setContentOffset(LOffset);
  if ContentSizeChanged then
    DidScroll(View);
end;

procedure TiOSTable.Update;
begin
  UpdateFrame;
  if (iOSGrid.iOSHeader.HeaderItems.Count > 0) and (Model.RowCount > 0) then
  begin
    FTopLine.Visible := TGridOption.RowLines in Model.Options;
    if FTopLine.Visible then
      FTopLine.Update;
    FLeftLine.Visible := TGridOption.ColLines in Model.Options;
    if FLeftLine.Visible then
      FLeftLine.Update;
  end
  else
  begin
    FTopLine.Visible := False;
    FLeftLine.Visible := False;
  end;
end;

{$ENDREGION}
{$REGION 'TiOSTableDelegate'}

type
  UIScrollViewDelegate = interface(IObjectiveC)
    ['{8C118307-D2EF-4D90-8B3D-149A0D6AEC12}']
    procedure scrollViewDidScroll(ScrollView: UIScrollView); cdecl;
  end;

  TiOSTableDelegate = class(TOCLocal, UIScrollViewDelegate)
  strict private
    [Weak] FiOSGrid: TiOSGrid;
  public
    constructor Create(const AiOSGrid: TiOSGrid);
    property iOSGrid: TiOSGrid read FiOSGrid;
    procedure scrollViewDidScroll(ScrollView: UIScrollView); cdecl;
  end;

constructor TiOSTableDelegate.Create(const AiOSGrid: TiOSGrid);
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
end;

procedure TiOSTableDelegate.scrollViewDidScroll(ScrollView: UIScrollView);
var
  LFrame: NSRect;
  ViewPortPosition: CGPoint;
begin
  ViewPortPosition := ScrollView.contentOffset;
  iOSGrid.iOSTable.DidScroll(ScrollView);
  if (iOSGrid.iOSHeader <> nil) and not iOSGrid.iOSHeader.View.isHidden then
  begin
    LFrame := iOSGrid.iOSHeader.View.Frame;
    LFrame.origin.x := -ViewPortPosition.x;
    iOSGrid.iOSHeader.View.SetFrame(LFrame);
  end;
  iOSGrid.TableScrolled(ViewPortPosition);
end;

{$ENDREGION}
{$REGION 'TiOSEditorDelegate'}

constructor TiOSEditDelegate.Create(const AiOSGrid: TiOSGrid);
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
end;

function TiOSEditDelegate.textField(textField: UITextField;
  shouldChangeCharactersInRange: NSRange; replacementString: NSString): Boolean;
var
  LColumn: TColumn;
begin
  Result := True;
  try
    if (textField.tag <> 0) and (TObject(Pointer(textField.tag)) is TColumnItem)
    then
    begin
      LColumn := TColumnItem(Pointer(textField.tag)).Column;
      if (LColumn <> nil) and (not LColumn.Released) then
        LColumn.EditorModified
      else
        Result := False;
    end;
  except
    Application.HandleException(FiOSGrid);
  end;
end;

function TiOSEditDelegate.textFieldShouldReturn(textField: UITextField): Boolean;
begin
  if (textField.tag <> 0) and (TObject(Pointer(textField.tag)) is TColumnItem) and
    iOSGrid.iOSTable.EnterState(TiOSCellControl.TState.Done) then
    Result := not iOSGrid.PerformSelector('RestoreFocus')
  else
    Result := False;
end;

{$ENDREGION}
{$REGION 'TiOSQueue'}

constructor TiOSQueue.Create(const AiOSGrid: TiOSGrid);
begin
  if (AiOSGrid = nil) or (AiOSGrid.Model = nil) then
    raise EArgumentNilException.Create(SArgumentNil);
  inherited Create;
  FiOSGrid := AiOSGrid;
end;

function TiOSQueue.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IiOSQueue);
end;

procedure TiOSQueue.InplaceEditorActivate;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.Control <> nil) and iOSGrid.Control.CanFocus then
    begin
      iOSGrid.Control.SetFocus;
      iOSGrid.InplaceEditorActivate;
    end;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.ReplaceText;
var
  Editor: TiOSCellDefaultEditor;
  LField: UITextField;
begin
  if (iOSGrid <> nil) and (iOSGrid.iOSTable <> nil) and (iOSGrid.FInplaceEditor <> nil) and
    (iOSGrid.FInplaceEditor.InternalCell is TiOSCellDefaultEditor) then
  try
    Editor := TiOSCellDefaultEditor(iOSGrid.FInplaceEditor.InternalCell);
    if Editor.FTextUpdating and Supports(Editor.View, UITextField, LField) then
    begin
      Editor.FTextUpdating := False;
      if Editor.FNewText.IsEmpty then
        LField.setText(nil)
      else
        LField.setText(StrToNSStr(Editor.FNewText));
      Editor.FNewText := string.Empty;
    end;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.RestoreFocus;
begin
  if (iOSGrid <> nil) and (iOSGrid.iOSTable <> nil) then
  try
    if iOSGrid.iOSTable.State <> TiOSCellControl.TState.Normal then
    try
      case iOSGrid.iOSTable.State of
        TiOSCellControl.TState.Touching:
        begin
          iOSGrid.HideEditor(False);
          if (iOSGrid.Control <> nil) and iOSGrid.Control.CanFocus then
            iOSGrid.Control.SetFocus;
        end;
        TiOSCellControl.TState.Cancel:
        begin
          iOSGrid.HideEditor(False);
          iOSGrid.ShowEditor;
          if (iOSGrid.Control <> nil) and iOSGrid.Control.CanFocus then
            iOSGrid.Control.SetFocus;
        end;
        TiOSCellControl.TState.Done:
          iOSGrid.EditorReturnDown;
      end;
    finally
      iOSGrid.iOSTable.ResetState;
    end
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.UpdateContent;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.FContentState = TiOSGrid.TContentState.Changed) then
      iOSGrid.UpdateContent;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.VKOffsetChanged;
begin
  if iOSGrid <> nil then
  begin
    iOSGrid.FVKOffsetChanging := False;
    iOSGrid.iOSTable.VKOffset := iOSGrid.VirtualKeayboardOffset
  end;
end;

procedure TiOSQueue.EditorClick;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.FInplaceEditor <> nil) then
      iOSGrid.FInplaceEditor.EditorClick;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.EditorDone;
var
  WasDone: Boolean;
  C, R, I: Integer;
  LRow: TiOSRow;
  LCell: TiOSCell;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.Model <> nil) then
    begin
      R := iOSGrid.Model.Row;
      C := iOSGrid.Model.Col;
      LRow := iOSGrid.iOSTable.Rows[R];
      if LRow <> nil then
        LCell := LRow.Cells[C];
      WasDone := iOSGrid.EditingDone(True);
      iOSGrid.RefreshEditor(True, True);
      if (LRow <> nil) and WasDone then
        for I := 0 to iOSGrid.Model.ColumnCount -1 do
          if (LRow.Cells[I] <> nil) and (LRow.Cells[I] <> LCell) then
            LRow.Cells[I].UpdateValue;
    end;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.ColumnWidthChange;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.iOSHeader <> nil) then
      iOSGrid.iOSHeader.DoColumnResize;
  except
    Application.HandleException(iOSGrid);
  end;
end;

procedure TiOSQueue.ColumnIndexChange;
begin
  try
    if (iOSGrid <> nil) and (iOSGrid.iOSHeader <> nil) then
      iOSGrid.iOSHeader.DoColumnIndexChange;
  except
    Application.HandleException(iOSGrid);
  end;
end;

{$ENDREGION}

{$REGION 'TBorderView'}
constructor TBorderView.Create(const AHeader: TiOSHeader; const X: CGFloat);
var
  V: Pointer;
  R: CGRect;
begin
  inherited Create;
  FHeader := AHeader;
  R := GetFrame(X);
  V := View.initWithFrame(R);
  if GetObjectID <> V then
    UpdateObjectID(V);

  View.setBackgroundColor(FHeader.iOSGrid.FTintColor);
  FHeader.View.addSubview(View);
end;

destructor TBorderView.Destroy;
begin
  View.removeFromSuperview;
  inherited;
end;

function TBorderView.GetFrame(const OriginX: CGFloat): CGRect;
begin
  Result.origin.x := OriginX - Thickness / 2;
  if Result.origin.x < 0 then
    Result.origin.x := Result.origin.x + Thickness / 2;
  if Result.origin.x > FHeader.iOSGrid.View.Frame.size.Width then
    Result.origin.x := Result.origin.x - Thickness / 2;
  Result.origin.y := 0;
  Result.size.width := Thickness;
  Result.size.height := FHeader.iOSGrid.View.Frame.size.Height;
end;

function TBorderView.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IBorderView);
end;

function TBorderView.GetView: UIView;
begin
  Result := UIView(Super);
end;
{$ENDREGION}

{$REGION 'TFakeColumnView'}
constructor TFakeColumnView.Create(const AHeader: TiOSHeader; const X: CGFloat; const Source: TColumnItem);
var
  V: Pointer;
  R: NSRect;
begin
  inherited Create;
  FHeader := AHeader;
  R := Source.View.Frame;
  FWidth := R.size.Width;
  FInternalOffset := X - R.origin.x;
  V := View.initWithFrame(R);
  if GetObjectID <> V then
    UpdateObjectID(V);
  View.setBackgroundColor(FHeader.iOSGrid.FTintColor);
  View.setAlpha(DefaultOpacity);
  FHeader.View.addSubview(View);
end;

destructor TFakeColumnView.Destroy;
begin
  View.removeFromSuperview;
  inherited;
end;

function TFakeColumnView.GetObjectiveCClass: PTypeInfo;
begin
  Result := TypeInfo(IFakeColumnView);
end;

function TFakeColumnView.GetFrame(const X: CGFloat): CGRect;
begin
  Result.origin.x := X - FInternalOffset;
  Result.origin.y := 0;
  Result.size.Width := FWidth;
  Result.size.Height := FHeader.iOSGrid.View.Frame.size.Height;
end;

function TFakeColumnView.GetView: UIView;
begin
  Result := UIView(Super);
end;
{$ENDREGION}

{$REGION 'TiOSGrid'}

constructor TiOSGrid.Create(const AModel: TDataModel; const AControl: TControl);
var
  Scale: CGFloat;
  TmpTable: UITableView;
begin
  ValidateInheritance(AModel, TGridModel, False);
  inherited Create(AModel, AControl);
  FOldCoord.Clear;
  Scale := MainScreen.Scale;
  if Scale > 0 then
    FDefaultThickness := 1 / Scale
  else
    FDefaultThickness := 1;
  FTextSettings := TTextSettings.Create(nil);
  UpdateDefaultRowHeight;
  FiOSTable := CreateTable;
  FiOSHeader := CreateHeader;

  FiOSEditDelegate := TiOSEditDelegate.Create(Self);
  FiOSQueue := TiOSQueue.Create(Self);
  FiOSTableDelegate := TiOSTableDelegate.Create(Self);
  FiOSTable.View.setDelegate(TiOSTableDelegate(FiOSTableDelegate).GetObjectID);
  View.bringSubviewToFront(FiOSHeader.View);

  TmpTable := TUITableView.Wrap(TUITableView.Create.initWithFrame(View.Frame, UITableViewStylePlain));
  try
    FTintColor := TUIColor.Wrap(TUIColor.OCClass.colorWithCGColor(TmpTable.tintColor.CGColor));
    FTintColor.retain;
    FBkColor := TUIColor.Wrap(TUIColor.OCClass.colorWithCGColor(TmpTable.backgroundColor.CGColor));
    FBkColor.retain;
    FOddColor := TUIColor.Wrap(TUIColor.OCClass.groupTableViewBackgroundColor);
    FOddColor := FOddColor.colorWithAlphaComponent(0.5);
    FOddColor.retain;
    FHighlightColor := TUIColor.Wrap(TUIColor.OCClass.underPageBackgroundColor);
    FHighlightColor := FHighlightColor.colorWithAlphaComponent(0.25);
    FHighlightColor.retain;
    FFocusColor := TUIColor.Wrap(TUIColor.OCClass.colorWithCGColor(TmpTable.tintColor.CGColor));
    FFocusColor := FFocusColor.colorWithAlphaComponent(0.25);
    FFocusColor.retain;
    FUnfocusColor := TUIColor.Wrap(TUIColor.OCClass.underPageBackgroundColor);
    FUnfocusColor := FUnfocusColor.colorWithAlphaComponent(0.5);
    FUnfocusColor.retain;
  finally
    UIView(Super).setBackgroundColor(FBkColor);
    TmpTable := nil;
  end;
  PerformSelector('UpdateContent');
end;

destructor TiOSGrid.Destroy;
begin
  FInplaceEditor := nil;
  if FTintColor <> nil then
    FTintColor.release;
  if FBkColor <> nil then
    FBkColor.release;
  if FOddColor <> nil then
    FOddColor.release;
  if FHighlightColor <> nil then
    FHighlightColor.release;
  if FFocusColor <> nil then
    FFocusColor.release;
  if FUnfocusColor <> nil then
    FUnfocusColor.release;
  FiOSTable.View.setDelegate(nil);
  FiOSQueue := nil;
  FiOSEditDelegate := nil;
  FiOSTableDelegate := nil;
  FiOSTable := nil;
  FiOSHeader := nil;
  FreeImages;
  FTextSettings.Free;
  inherited;
end;

function TiOSGrid.CreateHeader: TiOSHeader;
begin
  Result := TiOSHeader.Create(Self)
end;

function TiOSGrid.DefineModelClass: TDataModelClass;
begin
  Result := TGridModel;
end;

procedure TiOSGrid.ForceScroll;
var
  Ofs: NSPoint;
  R: NSRect;
begin
  iOSTable.Update;
  if (not iOSTable.View.isTracking) and (not iOSTable.View.isDecelerating) then
  begin
    R.origin.x := Max(0, iOSTable.View.contentSize.Width - iOSTable.View.bounds.Size.Width);
    R.origin.y := Max(0, iOSTable.View.contentSize.Height - iOSTable.View.bounds.Size.Height);
    R.Size.Width := 1;
    R.Size.Height := 1;
    Ofs := iOSTable.View.contentOffset;
    if (R.origin.x < Ofs.x) or (R.origin.y < Ofs.y) then
    begin
      R.origin.x := Min(R.origin.x, Ofs.x);
      R.origin.y := Min(R.origin.y, Ofs.y);
      iOSTable.View.scrollRectToVisible(R, True);
    end
    else
      iOSTable.DidScroll(iOSTable.View);
  end;
end;

procedure TiOSGrid.SetFocus;
begin
  if not FEditorModeChanging and not FFocused and (iOSTable.State = TiOSCellControl.TState.Normal) then
  begin
    FFocused := True;
    iOSTable.UpdateFocused;
    ShowEditorIfNeed;
  end;
  inherited;
end;

procedure TiOSGrid.ResetFocus;
begin
  if not FEditorModeChanging and FFocused and (iOSTable.State = TiOSCellControl.TState.Normal) then
  begin
    FFocused := False;
    iOSTable.UpdateFocused;
    Model.HideEditor;
  end;
  inherited;
end;

procedure TiOSGrid.SetSize(const ASize: TSizeF);
var
  OldSize: TSizeF;
begin
  OldSize := Size;
  inherited;
  if ((FContentState <> TContentState.Updated) or (OldSize <> Size)) and (iOSTable <> nil) and (Control <> nil) and
    (([csLoading, csDestroying] * Control.ComponentState) = []) then
    ForceScroll;
end;

function TiOSGrid.GetModel: TGridModel;
begin
  Result := inherited GetModel<TGridModel>;
end;

function TiOSGrid.CreateTable: TiOSTable;
begin
  Result := TiOSTable.Create(Self);
end;

function TiOSGrid.GetRowThickness: CGFloat;
begin
  if TGridOption.RowLines in Model.Options then
    Result := FDefaultThickness
  else
    Result := 0;
end;

function TiOSGrid.GetCellClass(const Column: TColumn): TiOSCellControlClass;
begin
  Result := nil;
  if Column is TProgressColumn then
    Result := TiOSCellProgressBar
  else if Column is TCustomNumberColumn then
    Result := TiOSCurrencyLabel
  else if Column is TGlyphColumn then
    Result := TiOSCellGlyph
  else if Column is TCheckColumn then
    Result := TiOSCellCheck
  else if Column is TPopupColumn then
    Result := TiOSCellPopupLabel
  else if Column is TImageColumn then
    Result := TiOSCellImage;
end;

function TiOSGrid.GetEditorClass(const Column: TColumn): TiOSCellControlClass;
begin
  Result := nil;
  if Column is TTimeColumn then
    Result := TiOSCellTimePicker
  else if Column is TDateColumn then
    Result := TiOSCellDatePicker
  else if (Column is TCurrencyColumn) or (Column is TProgressColumn) then
    Result := TiOSCurrencyEditor
  else if Column is TCustomNumberColumn then
    Result := TiOSNumberEditor
  else if Column is TCheckColumn then
    Result := TiOSCellCheckEditor
  else if Column is TPopupColumn then
    Result := TiOSCellPopupPicker
  else if Column is TImageColumn then
    Result := TiOSCellImageEditor;
end;

procedure TiOSGrid.CreateImages;
var
  I: TImageKind;
  Bitmap: TBitmap;
begin
  inherited;
  for I := Low(TImageKind) to High(TImageKind) do
    if (FImages[I] = nil) and (I <> TImageKind.Empty) then
    begin
      Bitmap := TCheckColumn.CreateBitmap(Model, I = TImageKind.True, False);
      try
        if Bitmap <> nil then
          FImages[I] := BitmapToUIImage(Bitmap);
      finally
        Bitmap.Free;
      end;
    end;
  FImagesCreated := True;
end;

procedure TiOSGrid.FreeImages;
var
  I: TImageKind;
begin
  for I := Low(TImageKind) to High(TImageKind) do
    if FImages[I] <> nil then
      FImages[I] := nil;
  FImagesCreated := False;
end;

function TiOSGrid.GetImages(const Index: TImageKind): UIImage;
begin
  if not FImagesCreated then
    CreateImages;
  Result := FImages[Index];
end;

function TiOSGrid.GetColumnThickness: CGFloat;
begin
  if TGridOption.ColLines in Model.Options then
    Result := FDefaultThickness
  else
    Result := 0;
end;

function TiOSGrid.CellRect(const ACol, ARow: Integer): NSRect;
var
  LCol: Integer;
  LHeight: CGFloat;
  Item: TColumnItem;
begin
  if (ACol < 0) or (ACol > Model.ColumnCount) then
    raise EArgumentOutOfRangeException.CreateResFmt(@SInvalidColumnIndex, [ACol]);
  if (ARow < 0) or (ARow > Model.RowCount) then
    raise EArgumentOutOfRangeException.CreateResFmt(@SInvalidRowIndex, [ARow]);
  LCol := ACol;
  while (LCol >= 0) and not iOSHeader.HeaderItems.TryGetValue(Model.Columns[LCol], Item) do
    Dec(LCol);
  if LCol >= 0 then
  begin
    Result := Item.Frame;
    if LCol < ACol then
    begin
      Result.origin.x := Result.origin.x + Result.Size.Width;
      Result.Size.Width := 0;
    end
    else
    begin
      if TGridOption.ColLines in Model.Options then
      begin
        Result.Size.Width := Result.Size.Width - DefaultThickness;
        if Item.HiddenFound then
        begin
          Result.Size.Width := Result.Size.Width - DefaultThickness;
          Result.origin.x := Result.origin.x + DefaultThickness;
        end;
      end;
      Result.Size.Width := Max(Result.Size.Width, 0);
    end;
  end
  else
  begin
    Result.Size.Width := 0;
    Result.origin.x := 0;
  end;
  LHeight := iOSTable.RowHeight;
  Result.origin.y := ARow * LHeight;
  Result.Size.Height := Max(0, LHeight - RowThickness);
end;

function TiOSGrid.PaddingRect(const ARect: NSRect; const Column: TColumn): NSRect;
begin
  Result := ARect;
  if Column <> nil then
  begin
    Result.Size.Width := Max(0, Result.Size.Width - Column.Padding.Left - Column.Padding.Right);
    Result.Size.Height := Max(0, Result.Size.Height - Column.Padding.Top - Column.Padding.Bottom);
    Result.origin.x := Result.origin.x + Min(ARect.Size.Width, Column.Padding.Left);
    Result.origin.y := Result.origin.y + Min(ARect.Size.Height, Column.Padding.Top);
  end;
end;

function TiOSGrid.PerformSelector(const Name: string; const Delay: CGFloat): Boolean;
var
  LNSObject: NSObject;
  Chars: packed array [0 .. 255] of Byte;
  I: Integer;
begin
  Result := False;
  if Supports(TiOSQueue(FiOSQueue).Super, NSObject, LNSObject) then
  begin
    FillChar(Chars, SizeOf(Chars), 0);
    for I := 0 to System.Math.Min(Length(Chars) - 1, Length(Name)) do
      Chars[I] := Lo(Word(Name.Chars[I]));
    try
      LNSObject.PerformSelector(sel_getUid(@Chars), GetObjectID, Delay);
      Result := True;
    except
      Application.HandleException(Self);
    end;
  end;
end;

function TiOSGrid.GetEditorRect: NSRect;
begin
  Result := CellRect(Model.Col, Model.Row);
end;

procedure TiOSGrid.MMCellRect(var Message: TDispatchMessageWithValue<TGridModel.TCellInfo>);
begin
  Message.Value.Rect := CellRect(Message.Value.Coord.Col, Message.Value.Coord.Row).ToRectF.Round;
end;

procedure TiOSGrid.MMColumnChanged(var Message: TDispatchMessageWithValue<Integer>);
begin
  if FContentState <> TContentState.Updating then
  begin
    if FContentState = TContentState.Updated then
    begin
      FContentState := TContentState.Changed;
      PerformSelector('UpdateContent');
    end;
    iOSHeader.Update;
    TColumnItem(FiOSHeader.HeaderItems[Message.Value]).Update;
    ForceScroll;
  end;
end;

procedure TiOSGrid.MMColumnMoved(var Message: TDispatchMessageWithValue<TGridModel.TColumnIndexes>);
begin
  if FContentState <> TContentState.Updating then
  begin
    FContentState := TContentState.Changed;
    FForceUpdateRows := True;
    PerformSelector('UpdateContent');
    if (Model <> nil) and Assigned(Model.OnColumnMoved) then
      Model.OnColumnMoved(Message.Value.Column, Message.Value.FromIndex, Message.Value.ToIndex);
  end;
end;

procedure TiOSGrid.MMContentChanged(var Message: TDispatchMessage);
var
  TextSettingsChanged: Boolean;
begin
  if FContentState <> TContentState.Updating then
  begin
    FContentState := TContentState.Changed;
    TextSettingsChanged := (Model.ColumnCount > 0) and not FTextSettings.Equals(Model.Columns[0].DefaultTextSettings);
    UpdateDefaultRowHeight;
    if TextSettingsChanged then
    begin
      FForceUpdateRows := True;
      FTextSettings.Assign(Model.Columns[0].DefaultTextSettings);
    end;
    PerformSelector('UpdateContent');
  end;
end;

procedure TiOSGrid.MMInvalidateCell(var Message: TDispatchMessageWithValue<TGridModel.TCoord>);
var
  LRow: TiOSRow;
  LCell: TiOSCell;
begin
  if (iOSTable <> nil) then
  begin
    LRow := iOSTable.Rows[Message.Value.Row];
    if LRow <> nil then
    begin
      LCell := LRow.Cells[Message.Value.Col];
      if LCell <> nil then
        LCell.UpdateValue;
    end;
  end;
end;

procedure TiOSGrid.MMInvalidateContentSize(var Message: TDispatchMessage);
begin
  if FContentState <> TContentState.Updating then
  begin
    FContentState := TContentState.Changed;
    PerformSelector('UpdateContent');
  end;
end;

procedure TiOSGrid.MMSelChanged(var Message: TDispatchMessage);
begin
  try
    ShowEditorIfNeed;
  finally
    UpdateSelection;
  end;
end;

procedure TiOSGrid.PMVKDisplacement(var Message: TDispatchMessageWithValue<TGridModel.TVKInfo>);
var
  R: NSRect;
begin
  if (iOSTable <> nil) and (Model <> nil) and (Model.Owner is TControl) then
  begin
    if Message.Value.Shown then
    begin
      R := View.bounds;
      VirtualKeayboardOffset := R.origin.y + R.Size.Height - Message.Value.AbsoluteRect.Height;
    end
    else
      VirtualKeayboardOffset := 0;
  end;
end;

procedure TiOSGrid.PMCanEdit(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Message.Value := CanEdit;
end;

function TiOSGrid.HeaderItemByX(const X: CGFloat; const FromLeftToRight: Boolean): TiOSHeaderItem;
var
  I, LIndex: Integer;
  LFrame: NSRect;
begin
  LIndex := -1;
  if FromLeftToRight then
  begin
    for I := 0 to iOSHeader.HeaderItems.Count - 1 do
      if iOSHeader.HeaderItems[I].Column.Visible and (iOSHeader.HeaderItems[I].Column.Width > 0) then
      begin
        LFrame := iOSHeader.HeaderItems[I].View.Frame;
        if LFrame.origin.x + LFrame.size.width > X then
        begin
          if LFrame.origin.x <= X then
            LIndex := I;
          Break;
        end;
        LIndex := I;
      end
  end
  else
    for I := iOSHeader.HeaderItems.Count - 1 downto 0 do
      if iOSHeader.HeaderItems[I].Column.Visible and (iOSHeader.HeaderItems[I].Column.Width > 0) then
      begin
        LFrame := iOSHeader.HeaderItems[I].View.Frame;
        if LFrame.origin.x <= X then
        begin
          if LFrame.origin.x + LFrame.size.width > X then
            LIndex := I;
          Break;
        end;
        LIndex := I;
      end;
  if LIndex >= 0 then
    Result := TiOSHeaderItem(iOSHeader.HeaderItems[LIndex])
  else
    Result := nil;
end;

procedure TiOSGrid.PMCellByPoint(var Message: TDispatchMessageWithValue<TGridModel.TPointInfo>);
var
  LFrame: NSRect;
  Item: TiOSHeaderItem;
  LRow: Integer;
  LPoint: TPointF;
begin
  if (Control <> nil) and (iOSTable <> nil) then
  begin
    LPoint := Control.AbsoluteToLocal(Message.Value.Point);
    LPoint := iOSTable.View.ConvertPoint(CGPoint.Create(LPoint), View).ToPointF;
    Item := HeaderItemByX(LPoint.X, True);
    if Item <> nil then
    begin
      LFrame := CellRect(Item.Column.Index, 0);
      if (LPoint.X >= LFrame.origin.X) and (LPoint.X < LFrame.origin.X + LFrame.size.width)
      then
        Message.Value.Coord.Col := Item.Column.Index;
    end;
    if iOSTable.RowHeight > 0 then
    begin
      LRow := Trunc(LPoint.Y / iOSTable.RowHeight);
      if InRange(LRow, 0, Model.RowCount - 1) then
        Message.Value.Coord.Row := LRow;
    end;
  end;
end;

procedure TiOSGrid.PMGetDisplay_Cells(var Message: TDispatchMessageWithValue<TGridModel.TRectCoord>);
var
  Item: TiOSHeaderItem;
  Offset: CGPoint;
  LRow: Integer;
begin
  Offset := iOSTable.View.contentOffset;
  Item := HeaderItemByX(Offset.x, False);
  if Item <> nil then
    Message.Value.TopLeft.Col := Item.Column.Index;
  Item := HeaderItemByX(Offset.x + iOSTable.View.Frame.size.width, True);
  if Item <> nil then
    Message.Value.BottomRight.Col := Max(Message.Value.TopLeft.Col, Item.Column.Index);
  if iOSTable.RowHeight > 0 then
  begin
    LRow := Max(0, Trunc(Offset.y / iOSTable.RowHeight));
    if LRow < Model.RowCount then
    begin
      Message.Value.TopLeft.Row := LRow;
      LRow := Min(Model.RowCount - 1, Trunc((Offset.y + iOSTable.View.Frame.size.height) / iOSTable.RowHeight));
      if LRow >= 0 then
        Message.Value.BottomRight.Row := Min(LRow, Model.RowCount - 1)
      else
        Message.Value.TopLeft.Row := -1;
    end;
  end;
end;

procedure TiOSGrid.PMScrollToSelect(var Message: TDispatchMessage);
begin
  iOSTable.ScrollToSelectedCell;
end;

procedure TiOSGrid.PMSetTopLeft(var Message: TDispatchMessageWithValue<TGridModel.TCoord>);
var
  Offset: CGPoint;
  R: NSRect;
begin
  Offset := iOSTable.View.contentOffset;
  R := CellRect(Max(Message.Value.Col, 0), Max(Message.Value.Row, 0));
  if Message.Value.Col >= 0 then
    Offset.x := R.origin.x;
  if Message.Value.Row >= 0 then
    Offset.y := R.origin.y;
  iOSTable.View.setcontentOffset(Offset);
end;

procedure TiOSGrid.MMEditorMode(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Message.Value := EditorMode;
end;

procedure TiOSGrid.MMGetEditorValue(var Message: TDispatchMessageWithValue<TValue>);
begin
  if (FInplaceEditor <> nil) and (FInplaceEditor.InternalCell <> nil) then
    Message.Value := FInplaceEditor.InternalCell.Data
  else
    Message.Value := TValue.Empty;
end;

procedure TiOSGrid.MMGetRowHeight(var Message: TDispatchMessageWithValue<Integer>);
begin
  Message.Value := Round(iOSTable.RowHeight);
end;

procedure TiOSGrid.MMShowEditor(var Message: TDispatchMessage);
begin
  ShowEditor;
end;

procedure TiOSGrid.MMHideEditor(var Message: TDispatchMessageWithValue<Boolean>);
begin
  HideEditor(Message.Value);
end;

procedure TiOSGrid.MMPostEditorValue(var Message: TDispatchMessage);
begin
  try
    PostEditorValue;
  except
    Application.HandleException(Self);
  end;
end;

procedure TiOSGrid.MMRefreshEditorValue(var Message: TDispatchMessage);
begin
  try
    RefreshEditor(False, True);
  except
    Application.HandleException(Self);
  end;
end;

procedure TiOSGrid.CellClick(const Column: TColumn; const Row: Integer);
begin
  if (Model <> nil) and Assigned(Model.OnCellClick) then
    Model.OnCellClick(Column, Row);
end;

procedure TiOSGrid.CellDblClick(const Column: TColumn; const Row: Integer);
begin
  if (Model <> nil) and Assigned(Model.OnCellDblClick) then
    Model.OnCellDblClick(Column, Row);
end;

function TiOSGrid.CanEdit: Boolean;
var
  ColVisible, RowVisible: Boolean;
begin
  Result := Visible and Model.Enabled and (TGridOption.Editing in Model.Options);
  if Result then
  begin
    ColVisible := (Model.Col >= 0) and (Model.Col < Model.ColumnCount) and Model.Columns[Model.Col].Visible and
      (Model.Columns[Model.Col].Width > 0);
    RowVisible := (Model.Row >= 0) and (Model.Row < Model.RowCount);
    Result := ColVisible and RowVisible and Model.Columns[Model.Col].Enabled and Model.Columns[Model.Col].CanEdit;
  end;
end;

function TiOSGrid.PostEditorValue: Boolean;
var
  Editing: Boolean;
begin
  Editing := (TGridOption.Editing in Model.Options) and not Model.Columns[Model.Col].ReadOnly;
  if Editing and (FInplaceEditor <> nil) and (FInplaceEditor.InternalCell <> nil) then
    Result := Model.Columns[Model.Col].PostEditorValue(FInplaceEditor.ColumnLink, FInplaceEditor.InternalCell.Data)
  else
    Result := False;
end;

function TiOSGrid.RefreshEditor(const RefreshAppearance, RefreshValue: Boolean): Boolean;
var
  LValue: TValue;
begin
  Result := False;
  if (FInplaceEditor <> nil) and (Model.Row >= 0) and (Model.Row < Model.RowCount) and (Model.Col >= 0) and
    (Model.Col < Model.ColumnCount) then
  begin
    if RefreshAppearance then
    begin
      FInplaceEditor.Update;
      Result := True;
    end;
    if RefreshValue then
    begin
      LValue := Model.GetValue(Model.Col, Model.Row, False);
      FInplaceEditor.InternalCell.Data := LValue;
      Result := Model.Columns[Model.Col].RefreshEditor(FInplaceEditor.ColumnLink, LValue);
    end;
  end;
end;

procedure TiOSGrid.SetVirtualKeayboardOffset(const Value: CGFloat);
begin
  if not SameValue(FVirtualKeayboardOffset, Value, TEpsilon.FontSize) then
  begin
    FVirtualKeayboardOffset := Value;
    if not FVKOffsetChanging then
    begin
      FVKOffsetChanging := True;
      PerformSelector('VKOffsetChanged');
    end;
  end;
end;

function TiOSGrid.CreateInplaceEditor: TiOSInplaceEditor;
begin
  Result := TiOSInplaceEditor.Create(Self, iOSTable.View, Model.Columns[Model.Col]);
end;

procedure TiOSGrid.ShowEditor;
begin
  TNonReentrantHelper.Execute(FEditorModeChanging, procedure
  begin
    if not FEditorMode and (iOSTable <> nil) and (Model <> nil) then
    begin
      if CanEdit and (Model.Owner is TControl) and not TControl(Model.Owner).Released then
        try
          FEditorResult := TEditorResult.Success;
          FInplaceEditor := CreateInplaceEditor;
          if FInplaceEditor = nil then
            raise EArgumentNilException.CreateFMT(SResultCanNotBeNil, ['CreateInplaceEditor']);
          FEditorMode := RefreshEditor(True, True);
          if FEditorMode then
            InplaceEditorActivate
          else
            FInplaceEditor := nil;
        except
          FInplaceEditor := nil;
          FEditorMode := False;
          raise;
        end
      else
        FEditorResult := TEditorResult.Cancel;
    end;
  end);
end;

procedure TiOSGrid.MMGetViewportPosition(var Message: TDispatchMessageWithValue<TPointF>);
begin
  Message.Value := iOSTable.View.contentOffset.ToPointF;
end;

procedure TiOSGrid.MMSetViewportPosition(var Message: TDispatchMessageWithValue<TPointF>);
begin
  iOSTable.View.setContentOffset(NSPoint.Create(Message.Value));
end;

procedure TiOSGrid.MMGetViewportSize(var Message: TDispatchMessageWithValue<TSizeF>);
begin
  Message.Value := TSizeF.Create(iOSTable.View.ContentSize.ToSizeF);
end;

procedure TiOSGrid.TableScrolled(const ViewPortPosition: CGPoint);
begin

end;

function TiOSGrid.EditingDone(const Accept: Boolean): Boolean;
var
  Editing: Boolean;
  LValue: TValue;
  DialogSvc: IFMXDialogService;
  OldMode: TDialogService.TPreferredMode;
begin
  Result := False;
  FEditorResult := TEditorResult.Success;
  LValue := TValue.Empty;
  Editing := (TGridOption.Editing in Model.Options) and not Model.Columns[Model.Col].ReadOnly;
  try
    if Accept and Editing then
      LValue := FInplaceEditor.InternalCell.Data;
  except
    on E: EAbort do
    begin
      Editing := False;
      FEditorResult := TEditorResult.Cancel;
    end;
    on E: Exception do
    begin
      Editing := False;
      FEditorResult := TEditorResult.Error;
      if FEditorResult = TEditorResult.Error then
      begin
        if TPlatformServices.Current.SupportsPlatformService(IFMXDialogService, DialogSvc) then
        begin
          OldMode := TDialogService.PreferredMode;
          try
            TDialogService.PreferredMode := TDialogService.TPreferredMode.Sync;
            TDialogService.MessageDialog(Translate(E.Message), TMsgDlgType.mtError,
              [TMsgDlgBtn.mbOk, TMsgDlgBtn.mbCancel], TMsgDlgBtn.mbOk, 0, procedure(const AResult: TModalResult)
              begin
                if AResult = mrCancel then
                  FEditorResult := TEditorResult.Cancel;
              end);
          finally
            TDialogService.PreferredMode := OldMode;
          end;
        end
        else
          Application.ShowException(E);
      end;
    end;
  end;
  try
    Result := Model.Columns[Model.Col].EditingDone(FInplaceEditor.ColumnLink, LValue, Accept and Editing);
  except
    FEditorResult := TEditorResult.Error;
    Application.HandleException(Self);
  end;
end;

procedure TiOSGrid.EditorReturnDown;
  procedure SelectNextCell(const ACol, ARow: Integer; const AEditorMode: Boolean);
  begin
    Model.SelectCell(ACol, ARow);
    iOSTable.ScrollToSelectedCell(False);
    if AEditorMode then
      ShowEditor;
  end;
  procedure DoShowEditor(var ACol, ARow: Integer; const AEditorMode, APickerDone: Boolean);
  begin
    if (Control <> nil) and Control.CanFocus then
      Control.SetFocus;
    if EditorResult = TEditorResult.Error then
      SelectNextCell(ACol, ARow, AEditorMode)
    else if Model.CellReturnAction = TCellReturnAction.None then
      SelectNextCell(ACol, ARow, not APickerDone and (TGridOption.AlwaysShowEditor in Model.Options))
    else
    begin
      if Model.FindNextCell(False, Model.CellReturnAction = TCellReturnAction.GotoNextRow,
        AEditorMode or (TGridOption.AlwaysShowEditor in Model.Options), ACol, ARow) then
        SelectNextCell(ACol, ARow, AEditorMode);
    end;
  end;
var
  LCol, LRow: Integer;
  LEditorMode: Boolean;
begin
  try
    LCol := Model.Col;
    LRow := Model.Row;
    LEditorMode := EditorMode;
    if iOSTable.EnterState(TiOSCellControl.TState.Touching) then
    try
      if EditorMode then
      begin
        HideEditor(True);
        if EditorMode then
          Exit;
      end;
      DoShowEditor(LCol, LRow, LEditorMode, False);
    finally
      iOSTable.ResetState;
    end
    else if iOSTable.State = TiOSCellControl.TState.Done then
    try
      HideEditor(True);
      DoShowEditor(LCol, LRow, LEditorMode, True);
    finally
      iOSTable.ResetState;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TiOSGrid.HideEditor(const Accept: Boolean);
begin
  TNonReentrantHelper.Execute(FEditorModeChanging, procedure
  var
    LRow: TiOSRow;
    LCell: TiOSCell;
    LFocused, WasDone: Boolean;
    R, C, I: Integer;
  begin
    WasDone := False;
    LCell := nil;
    LRow := nil;
    LFocused := FFocused;
    try
      if FEditorMode and (FInplaceEditor <> nil) then
      begin
        R := Model.Row;
        C := Model.Col;
        FInplaceEditor.Deactivate;
        WasDone := EditingDone(Accept);
        LRow := iOSTable.Rows[R];
        if LRow <> nil then
          LCell := LRow.Cells[C];
      end;
    finally
      if FEditorResult <> TEditorResult.Error then
      begin
        FEditorMode := False;
        if FInplaceEditor <> nil then
        begin
          FInplaceEditor := nil;
          if LFocused and (iOSTable.State = TiOSCellControl.TState.Normal) and (Control <> nil) and Control.CanFocus then
            Control.SetFocus;
        end;
        if LCell <> nil then
          LCell.UpdateValue;
        if (LRow <> nil) and WasDone then
          for I := 0 to Model.ColumnCount -1 do
            if (LRow.Cells[I] <> nil) and (LRow.Cells[I] <> LCell) then
              LRow.Cells[I].UpdateValue;
      end
      else
      begin
        if FInplaceEditor <> nil then
          PerformSelector('InplaceEditorActivate', 0.5);
      end;
    end;
  end);
end;

procedure TiOSGrid.UpdateDefaultRowHeight;
  function LabelToHeight(ALabel: UILabel): CGFloat;
  begin
    ALabel.sizeToFit;
    Result := 2 * TColumn.HorzTextMargin + Ceil(ALabel.Bounds.Size.Height);
  end;
var
  LLabel: UILabel;
  Scale: CGFloat;
begin
  LLabel := TUILabel.Wrap(TUILabel.Alloc.initWithFrame(RectToNSRect(TRect.Create(0, 0, 100, 13))));
  try
    LLabel.setText(StrToNSStr('p|blg'));
    FDefaultHeaderHeight := LabelToHeight(LLabel);
    UpdateViewText(LLabel, Model, nil);
    FDefaultRowHeight := LabelToHeight(LLabel);
    Scale := MainScreen.Scale;
    if Scale > 0 then
      FDefaultLabelHeight := Ceil(LLabel.Bounds.Size.Height * Scale) / Scale
    else
      FDefaultLabelHeight := Ceil(LLabel.Bounds.Size.Height);
  finally
    LLabel.release;
  end;
end;

procedure TiOSGrid.ShowEditorIfNeed;
begin
  if (iOSTable <> nil) and not EditorMode and FFocused and (TGridOption.AlwaysShowEditor in Model.Options) and
    CanEdit then
    ShowEditor;
end;

procedure TiOSGrid.InplaceEditorActivate;
begin
  iOSTable.ScrollToSelectedCell;
  if FInplaceEditor <> nil then
    FInplaceEditor.Activate;
end;

procedure TiOSGrid.UpdateContent;
var
  R: NSRect;
begin
  if FContentState <> TContentState.Updating then
  begin
    FContentState := TContentState.Updating;
    try
      R := View.Frame;
      if (R.Size.Width > 0) and (R.Size.Height > 0) and (iOSTable <> nil) and (iOSHeader <> nil) then
      begin
        iOSHeader.Update;
        iOSTable.Update;
        iOSTable.UpdateVisibleRows;
        UpdateSelection;
      end;
    finally
      FForceUpdateRows := False;
      FContentState := TContentState.Updated;
    end;
    if FEditorMode then
      RefreshEditor(True, False);
  end;
end;

procedure TiOSGrid.UpdateSelection;
  procedure UpdateCell(const Coord: TGridModel.TCoord);
  var
    LRow: TiOSRow;
    LCell: TiOSCell;
  begin
    LRow := iOSTable.Rows[Coord.Row];
    if LRow <> nil then
    begin
      if TGridOption.RowSelect in Model.Options then
        LRow.Update;
      LCell := LRow.Cells[Coord.Col];
      if LCell <> nil then
        LCell.Update;
    end;
  end;

begin
  UpdateCell(FOldCoord);
  FOldCoord.Col := Model.Col;
  FOldCoord.Row := Model.Row;
  UpdateCell(FOldCoord);
end;

{$ENDREGION}

initialization

TPresentationProxyFactory.Current.Register(TCustomGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);
TPresentationProxyFactory.Current.Register(TGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);
TPresentationProxyFactory.Current.Register(TStringGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);

finalization

TPresentationProxyFactory.Current.Unregister(TStringGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);
TPresentationProxyFactory.Current.Unregister(TGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);
TPresentationProxyFactory.Current.Unregister(TCustomGrid, TControlType.Platform, TiOSPresentationProxy<TiOSGrid>);

end.
