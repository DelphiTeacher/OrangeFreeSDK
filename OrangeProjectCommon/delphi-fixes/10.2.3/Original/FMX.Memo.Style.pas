{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Memo.Style;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, System.UITypes, System.Generics.Collections, FMX.Platform, FMX.Memo, FMX.Graphics,
  FMX.Types, FMX.Controls, FMX.TextLayout, FMX.Objects, FMX.MagnifierGlass, FMX.SpellChecker, FMX.Menus, FMX.Text,
  FMX.Presentation.Messages, FMX.Presentation.Style, FMX.Controls.Presentation, FMX.ScrollBox.Style, FMX.Memo.Types,
  FMX.Controls.Model;

type
  ///<summary>Record that describes text-editing operation</summary>
  TEditAction = record
    ///<summary>Type of change that was made (text added or removed)</summary>
    ActionType: TActionType;
    ///<summary>Defines that change was made right after the previous and was made in the similar way
    ///(e.g. text editing (delete and insert) via keyabord)</summary>
    PairedWithPrev: Boolean;
    ///<summary>Position in text from which text was deleted or into which text was inserted</summary>
    StartPosition: Integer;
    ///<summary>Fragmen of text that was deleted (for TActionType.Delete only)</summary>
    DeletedFragment: string;
    ///<summary>Length of text that was inserted (for <c>TActionType.Insert</c> only)</summary>
    Length: Integer;
    ///<summary>Was text inserted via typing from keyboard or not</summary>
    Typed: Boolean;
    ///<summary>Was removed text select or not</summary>
    WasSelected: Boolean;
    ///<summary>Was caret moved after text was removed or not</summary>
    CaretMoved: Boolean;
  end;

  TStyledMemo = class;

{ TEditActionStack }

  ///<summary>List of text-editing operations</summary>
  TEditActionStack = class(TStack<TEditAction>)
  private
    [Weak] FOwner: TStyledMemo;
  public
    constructor Create(const AOwner: TStyledMemo);

    ///<summary>New fragment of text was inserted</summary>
    procedure FragmentInserted(const StartPos, FragmentLength: Integer; const PairedWithPrev, Typed: Boolean);
    ///<summary>Some text fragment was removed</summary>
    procedure FragmentDeleted(const StartPos: Integer; const Fragment: string; const Selected, CaretMoved: Boolean);

    ///<summary>Revert last change</summary>
    function RollBackAction: Boolean;
  end;

{ TStyledMemo }

  ///<summary>Styled presentation for <c>TMemo</c></summary>
  TStyledMemo = class(TStyledCustomScrollBox, ITextInput, ITextSpellCheck, ITextSpellCheckActions)
  protected type
    ///<summary>Class that represents single rendering line</summary>
    TLineObject = class
    private
      FSize: TSizeF;
      FLayout: TTextLayout;
      FRect: TRectF;
    public
      ///<summary>Free text layout object if it exists</summary>
      procedure FreeLayout;
      ///<summary>Does layout line has valid size</summary>
      function SizeValid: Boolean;
      ///<summary>Reset current size and line rectangle if line parameters were changed</summary>
      procedure InvalidateSize;
      constructor Create; overload;
      constructor Create(const ALayout: TTextLayout; const ASize: TSizeF); overload;
      destructor Destroy; override;
      //
      property Size: TSizeF read FSize write FSize;
      property Rect: TRectF read FRect write FRect;
      property Layout: TTextLayout read FLayout write FLayout;
    end;
    ///<summary>Providing a bridge between lines of text in TMemo.Model.Lines and the internal representation</summary>
    TLines = class
    private
      [Weak]FMemo: TStyledMemo;
      FLines: TObjectList<TLineObject>;
      FTopLine: Integer;
      FDefaultHeight: Single;
      function CreateLayout(const S: string): TTextLayout;
      function IsWordWrap: Boolean;
      procedure UpdateLayoutParams(Layout: TTextLayout);
      procedure UpdateLayoutsColor;
      procedure CalculateDefaultLineMetrics;
      function GetDefaultLineHeight: Single;
      function GetCount: Integer;
      function GetItem(const Index: Integer): TLineObject;
      procedure UpdateContentBounds(ContentBounds: TRectF);
    public
      constructor Create(Memo: TStyledMemo);
      destructor Destroy; override;

      procedure InsertLine(const Index: Integer; const S: string);
      procedure DeleteLine(const Index: Integer);
      procedure ReplaceLine(const Index: Integer; const S: string);
      procedure ExchangeLines(const OldIndex, NewIndex: Integer);
      //Caret support
      ///<summary>Get line number and position in line by the point coordinates</summary>
      function GetPointPosition(const Pt: TPointF; const RoundToWord: Boolean = False): TCaretPosition;
      ///<summary>Get the coordinates on the region that holds range of text starting from defined line, position in
      ///that line and the defined length.</summary>
      function GetRegionForRange(const ALine, APos, ALength: Integer; const RoundToWord: Boolean = False): TRegion;
      //
      procedure RenderLayouts;
      //
      property Count: Integer read GetCount;
      property Items[const Index: Integer]: TLineObject read GetItem; default;
    end;
    ///<summary>Inforation about a single misspelled word in the text</summary>
    TSpellingWord = class
    private
      FPosition: TCaretPosition;
      FLength: Integer;
      FBounds: TRegion;
    public
      constructor Create(const APosition: TCaretPosition; const ALength: Integer; const ABounds: TRegion);
      function HasBounds: Boolean;
      function PosAtCurrentPos(const APosition: TCaretPosition): Boolean;
      procedure InvalidateBounds;
      property Position: TCaretPosition read FPosition write FPosition;
      property Length: Integer read FLength write FLength;
      property Bounds: TRegion read FBounds write FBounds;
    end;
  private
    FTextService: TTextService;
    FLMouseSelecting: Boolean;
    FIgnoreMouseMove: Boolean;
    FDownMPt: TPointF;
    FOldMPt: TPointF;
    FCaretPosition: TCaretPosition;
    FMemoPopupMenu: TPopupMenu;
    FActionStack: TEditActionStack;
    FLineObjects: TLines;
    FSelStart: TCaretPosition;
    FSelEnd: TCaretPosition;
    FSelected: Boolean;
    FCursorFill: TBrush;
    FContent: TControl;
    FStartAutoScrollTimer: TTimer;
    FAutoVScrollTimer: TTimer;
    FAutoHScrollTimer: TTimer;
    FNeedAutoVScroll: Boolean;
    FNeedAutoHScroll: Boolean;
    FFollowTheMouse: Boolean;
    FCharsBuffer: string;
    FDisableCaretInsideWords: Boolean;
    { Selection }
    FLeftSelPt: TSelectionPoint;
    FRightSelPt: TSelectionPoint;
    { Loupe }
    FLoupeService: ILoupeService;
    { ITextSettings }
    FLineHeight: Single;
    FSetFocusOnUp: Boolean;
    FOldWordWrap: Boolean;
    { Spelling }
    FSpellService: IFMXSpellCheckerService;
    FSpellMenuItems: TList<TMenuItem>;
    FSpellHightlightRect: TRectF;
    FSpellFill: TBrush;
    FSpellUnderlineBrush: TStrokeBrush;
    FSpellingWords: TObjectList<TSpellingWord>;
    function GetModel: TCustomMemoModel;
    { Messages from model }
    procedure MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>); message MM_MEMO_CHARCASE_CHANGED;
    procedure MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_CHECKSPELLING_CHANGED;
    procedure MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_HIDESELECTIONONEXIT_CHANGED;
    procedure MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_READONLY_CHANGED;
    procedure MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>); message MM_MEMO_IMEMODE_CHANGED;
    procedure MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>); message MM_MEMO_SELSTART_CHANGED;
    procedure MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>); message MM_MEMO_SELLENGTH_CHANGED;
    procedure MMTextSettingsChanged(var Message: TDispatchMessage); message MM_MEMO_TEXT_SETTINGS_CHANGED;
    procedure MMLinesInsertLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_INSERT_LINE;
    procedure MMLinesPutLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_PUT_LINE;
    procedure MMLinesDeleteLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_DELETE_LINE;
    procedure MMLinesExchangeLines(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>); message MM_MEMO_LINES_EXCHANGE_LINES;
    procedure MMLinesClear(var Message: TDispatchMessage); message MM_MEMO_LINES_CLEAR;
    procedure MMUpdateStateChanged(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_UPDATE_STATE_CHANGED;
    procedure MMGetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>); message MM_MEMO_GET_CARET_POSITION;
    procedure MMSetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>); message MM_MEMO_SET_CARET_POSITION;
    procedure MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>); message MM_MEMO_CAN_SET_FOCUS;
    procedure MMLinesChanged(var Message: TDispatchMessage); message MM_MEMO_LINES_CHANGED;
    procedure MMMaxLengthChanged(var Message: TDispatchMessage); message MM_MEMO_MAXLENGTH_CHANGED;
    { Messages from presented control }
    procedure PMInit(var Message: TDispatchMessage); message PM_INIT;
    procedure PMGotoLineBegin(var Message: TDispatchMessage); message PM_MEMO_GOTO_LINE_BEGIN;
    procedure PMGotoLineEnd(var Message: TDispatchMessage); message PM_MEMO_GOTO_LINE_END;
    procedure PMGotoTextBegin(var Message: TDispatchMessage); message PM_MEMO_GOTO_TEXT_BEGIN;
    procedure PMGotoTextEnd(var Message: TDispatchMessage); message PM_MEMO_GOTO_TEXT_END;
    procedure PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>); message PM_MEMO_UNDO_MANAGER_INSERT_TEXT;
    procedure PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>); message PM_MEMO_UNDO_MANAGER_DELETE_TEXT;
    procedure PMUndo(var Message: TDispatchMessage); message PM_MEMO_UNDO_MANAGER_UNDO;
    procedure PMSelectText(var Message: TDispatchMessage); message PM_MEMO_SELECT_TEXT;

    procedure FindSpellingErrorsInLine(const LineIndex: Integer);
    procedure RemoveSpellingErrorsForLine(const LineIndex: Integer);
    function GetSelBeg: TCaretPosition;
    function GetSelEnd: TCaretPosition;
    procedure SelectAtPos(const APos: TCaretPosition);
    procedure SetCaretPosition(const Value: TCaretPosition);
    procedure UpdateHScrlBarByCaretPos;
    procedure UpdateVScrlBarByCaretPos;
    function GetNextWordBegin(const StartPosition: TCaretPosition): TCaretPosition;
    function GetPrevWordBegin(const StartPosition: TCaretPosition): TCaretPosition;
    function GetPositionShift(const APos: TCaretPosition; const Delta: Integer): TCaretPosition;
    procedure MoveCaretBy(const Delta: Integer);
    procedure MoveCaretLeft;
    procedure MoveCaretRight;
    procedure MoveCaretVertical(const LineDelta: Integer);
    procedure MoveCaretDown;
    procedure MoveCaretUp;
    procedure MoveCaretPageUp;
    procedure MoveCaretPageDown;
    procedure UpdateCaretPosition(const UpdateScrllBars: Boolean);
    function GetPageSize: Single;
    function GetShowSelection: Boolean;
    procedure UpdateSelectionInModel;
    { ITextInput }
    function GetTextService: TTextService;
    function GetTargetClausePointF: TPointF;
    procedure StartIMEInput;
    procedure EndIMEInput;
    procedure IMEStateUpdated;
    function GetSelection: string;
    function GetSelectionRect: TRectF;
    function GetSelectionBounds: TRect;
    function HasText: Boolean;

    procedure DoScroll(const ADirection: Integer);
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    function GetPositionPoint(const ACaretPos: TCaretPosition): TPointF;
    procedure DoGotoLineBegin;
    procedure DoGotoLineEnd;
    procedure DoGotoTextBegin;
    procedure DoGotoTextEnd;
    procedure DoSelectWord;
    procedure DoSelectAllText;
    procedure DoDeleteSelection;
    procedure DoCopyToClipboard;
    procedure DoCutToClipboard;
    procedure DoPasteFromClipboard;
    { Selections }
    procedure BeginSelection;
    procedure EndSelection;
    procedure GetNormalizedSelectionRange(var ASelStart, ASelEnd: TCaretPosition);
    procedure SetNormalizedSelectionRange(const ASelStart, ASelEnd: TCaretPosition);
    function GetSelectionRegion: TRegion;
    function HaveSelectionPickers: Boolean;
    procedure UpdateSelectionPointPositions;
    procedure DoSelPtMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure DoLeftSelPtChangePosition(Sender: TObject; var X, Y: Single);
    procedure DoLeftSelPtMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure DoRightSelPtChangePosition(Sender: TObject; var X, Y: Single);
    procedure DoRightSelPtMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    { Loupe }
    procedure HideLoupe;
    procedure ShowLoupe;
    procedure SetLoupePosition(const ASelectionPointType: TSelectionPointType); overload;
    procedure SetLoupePosition(const X, Y: Single); overload;
    // Selection Autoscroll
    procedure StartAutoScroll(const X, Y: Single);
    procedure StopAutoScroll;
    procedure StartAutoScrollHandler(Sender: TObject);
    procedure AutoScrollUpHandler(Sender: TObject);
    procedure AutoScrollDownHandler(Sender: TObject);
    procedure AutoScrollLeftHandler(Sender: TObject);
    procedure AutoScrollRightHandler(Sender: TObject);
    procedure PutCaretTo(const X, Y: Single; const Select: Boolean = False; const PositionByWord: Boolean = False);
    { ITextSpellCheck }
    function IsSpellCheckEnabled: Boolean;
    function IsCurrentWordWrong: Boolean;
    function GetListOfPrepositions: TArray<string>;
    procedure HighlightSpell;
    procedure HideHighlightSpell;
    { ITextSpellCheckActions }
    procedure Spell(const AWord: string);
    { Spelling }
    procedure UpdateSpellPopupMenu(const APoint: TPointF);
    procedure SpellFixContextMenuHandler(Sender: TObject);
   protected
    procedure DoEndUpdate; override;
    //Animation mouse events
    procedure AniMouseDown(const Touch: Boolean; const X, Y: Single); override;
    procedure AniMouseMove(const Touch: Boolean; const X, Y: Single); override;
    procedure AniMouseUp(const Touch: Boolean; const X, Y: Single); override;

    ///<summary>Returns default line height according to current text decoration settings</summary>
    function GetLineHeight: Single;
    ///<summary>Creates popup menu items</summary>
    procedure CreatePopupMenu; virtual;
    ///<summary>Updates the current state of popup menu items</summary>
    procedure UpdatePopupMenuItems; virtual;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Resize; override;
    ///<summary>Raises OnChange event</summary>
    procedure DoChange; virtual;
    ///<summary>Revert last text change</summary>
    procedure DoUndo(Sender: TObject);
    ///<summary>Cut selected text to the clipboard</summary>
    procedure DoCut(Sender: TObject);
    ///<summary>Copy selected text to the clipboard</summary>
    procedure DoCopy(Sender: TObject);
    ///<summary>Paste text from clipboard to the current caret position</summary>
    procedure DoPaste(Sender: TObject);
    ///<summary>Delete selected text</summary>
    procedure DoDelete(Sender: TObject);
    ///<summary>Select all text</summary>
    procedure DoSelectAll(Sender: TObject);
    ///<summary>Repainting content in memo</summary>
    procedure RepaintEdit;
    { inherited }
    function ShowContextMenu(const ScreenPosition: TPointF): Boolean; override;
    procedure DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: boolean); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    /// <summary>Defines <c>TMemo</c> model class</summary>
    function DefineModelClass: TDataModelClass; override;
    { ITouchEvents }
    ///<summary>Long tap</summary>
    procedure LongTap(const X, Y: Single);
    ///<summary>Double tap</summary>
    procedure DblTap;
    procedure CMGesture(var EventInfo: TGestureEventInfo); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RecalcOpacity; override;

    ///<summary>Component data model</summary>
    property Model: TCustomMemoModel read GetModel;
    ///<summary>Current caret position in text</summary>
    property CaretPosition: TCaretPosition read FCaretPosition write SetCaretPosition;
  end;

implementation

uses
  System.SysUtils, System.RTLConsts, System.Variants, FMX.Consts, System.Math, System.UIConsts,
  System.Character, System.TypInfo, System.Math.Vectors, FMX.Presentation.Factory, System.SyncObjs;

const
  LOUPE_OFFSET = 10;
  cnTouchAccuracy = 3;
  IMEWindowGap = 2; // 2 is small space between conrol and IME window

  CutStyleName = 'cut'; //Do not localize
  CopyStyleName = 'copy'; //Do not localize
  PasteStyleName = 'paste'; //Do not localize
  DeleteStyleName = 'delete'; //Do not localize
  SelectAllStyleName = 'selectall'; //Do not localize
  ContentStyleResourceName = 'content'; //Do not localize
  SelectionStyleResourceName = 'selection'; //Do not localize
  ForegroundStyleResourceName = 'foreground'; //Do not localize
  FontStyleResourceName = 'font'; //Do not localize
  CaretColorStyleResouceName = 'caretcolor'; //Do not localize
  LeftSelectionPointStyleResourceName = 'leftselectionpoint'; //Do not localize
  RightSelectionPointStyleResourceName = 'rightselectionpoint'; //Do not localize


{$IFDEF ANDROID}
function LinesToText(const Lines: TStrings): string;
var
  I, TextLength: Integer;
  Header, Body: TStringBuilder;
begin
  if (Lines <> nil) and (Lines.Count > 0) then
  begin
    TextLength := 0;
    for I := 0 to Lines.Count - 1 do
      Inc(TextLength, Lines[I].Length);
    Header := TStringBuilder.Create(Lines.Count * 4);
    try
      Body := TStringBuilder.Create(TextLength);
      try
        for I := 0 to Lines.Count - 1 do
        begin
          if I > 0 then
            Header.Append(',');
          Header.Append(Lines[I].Length);
          Body.Append(Lines[I]);
        end;
        if Header.Length > 0 then
          Result := Format('[%s]%s', [Header.ToString, Body.ToString])
        else
          Result := string.Empty;
      finally
        Body.Free;
      end;
    finally
      Header.Free;
    end;
  end
  else
    Result := string.Empty;
end;

function TextToLines(const Text: string): TStrings;
var
  HeaderBegin, HeaderEnd: Integer;
  LinesLength: TArray<string>;
  I, LineLength, LengthBefore: Integer;
begin
  Result := TStringList.Create;
  HeaderBegin := Text.IndexOf('[');
  HeaderEnd := Text.IndexOf(']');
  if not Text.IsEmpty and (HeaderBegin >= 0) and (HeaderEnd > 0) then
  begin
    LinesLength := Text.Substring(HeaderBegin + 1, HeaderEnd - HeaderBegin - 1).Split([',']);
    LengthBefore := 0;
    for I := 0 to Length(LinesLength) - 1 do
    begin
      LineLength := StrToInt(LinesLength[I]);
      if LineLength > 0 then
        Result.Add(Text.Substring(HeaderEnd + 1 + LengthBefore, LineLength))
      else
        Result.Add(string.Empty);
      Inc(LengthBefore, LineLength);
    end;
  end;
end;
{$ENDIF}

function RectsIntersect(const R1, R2: TRectF): Boolean;
begin
  Result := (R1.Left <= R2.Right) and (R1.Right >= R2.Left) and (R1.Top <= R2.Bottom) and (R1.Bottom >= R2.Top);
end;

{ TStyledMemo }

function TStyledMemo.GetModel: TCustomMemoModel;
begin
  Result := inherited GetModel<TCustomMemoModel>;
end;

constructor TStyledMemo.Create(AOwner: TComponent);
var
  PlatformTextService: IFMXTextService;
  PlatformTextEditingBehaviorService: IFMXTextEditingService;
begin
  inherited;
  EnableExecuteAction := False;

  if TPlatformServices.Current.SupportsPlatformService(IFMXTextService, PlatformTextService) then
    FTextService := PlatformTextService.GetTextServiceClass.Create(Self, True)
  else
    FTextService := nil;

  if not TPlatformServices.Current.SupportsPlatformService(ILoupeService, FLoupeService) then
    FLoupeService := nil;

  FLineObjects := TLines.Create(Self);

  CreatePopupMenu;

  FActionStack := TEditActionStack.Create(Self);

  FLMouseSelecting := False;
  FOldMPt := TPointF.Zero;

  FCaretPosition := TCaretPosition.Zero;

  if FTextService <> nil then
    FTextService.ImeMode := TImeMode.imDontCare;

  FSelStart := TCaretPosition.Zero;
  FSelEnd := TCaretPosition.Zero;
  FSelected := False;

  CanFocus := False;
  AutoCapture := True;

  SetAcceptsControls(False);
  //Timer to start scrolling when selecting text and cursor is out of content
  FStartAutoScrollTimer := TTimer.Create(Self);
  FStartAutoScrollTimer.Enabled := False;
  FStartAutoScrollTimer.Interval := 500;
  FStartAutoScrollTimer.OnTimer := StartAutoScrollHandler;
  FAutoVScrollTimer := TTimer.Create(Self);
  FAutoVScrollTimer.Interval := 100;
  FAutoVScrollTimer.Enabled := False;
  FAutoHScrollTimer := TTimer.Create(Self);
  FAutoHScrollTimer.Interval := 100;
  FAutoHScrollTimer.Enabled := False;
  Touch.InteractiveGestures := Touch.InteractiveGestures + [TInteractiveGesture.DoubleTap, TInteractiveGesture.LongTap];

  FSpellMenuItems := TList<TMenuItem>.Create;
  FSpellFill := TBrush.Create(TBrushKind.Solid, TAlphaColorRec.Red);
  FSpellUnderlineBrush := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColorRec.Red);
  FSpellUnderlineBrush.Dash := TStrokeDash.Dot;
  FSpellUnderlineBrush.Thickness := 1;
  FSpellingWords := TObjectList<TSpellingWord>.Create;

  if TPlatformServices.Current.SupportsPlatformService(IFMXTextEditingService, PlatformTextEditingBehaviorService) then
  begin
    FDisableCaretInsideWords := TCaretBehavior.DisableCaretInsideWords in PlatformTextEditingBehaviorService.GetCaretBehaviors;
    PlatformTextEditingBehaviorService := nil;
  end
  else
    FDisableCaretInsideWords := False;

  Width := 100;
end;

function TStyledMemo.DefineModelClass: TDataModelClass;
begin
  Result := TCustomMemoModel;
end;

destructor TStyledMemo.Destroy;
begin
  FLoupeService := nil;
  FCursorFill.Free;
  FActionStack.Free;
  FMemoPopupMenu.Free;
  FLineObjects.Free;
  FTextService.Free;
  FSpellService := nil;
  FSpellMenuItems.Free;
  FSpellingWords.Free;
  FSpellFill.Free;
  FSpellUnderlineBrush.Free;
  inherited;
end;

procedure TStyledMemo.HideHighlightSpell;
begin
  FSpellHightlightRect := TRectF.Empty;
  Model.Caret.TemporarilyHidden := FSelected and (Model.SelLength > 0) and IsFocused;
  RepaintEdit;
end;

procedure TStyledMemo.DoEndUpdate;
begin
  inherited;
  if (FUpdating = 0) and not (csLoading in PresentedControl.ComponentState) then
  begin
    FLineObjects.RenderLayouts;
    UpdateCaretPosition(True);
    RepaintEdit;
  end;
end;

procedure TStyledMemo.DoEnter;
{$IFDEF MSWINDOWS}
var
  MouseService: IFMXMouseService;
  MousePos: TPointF;
  ContentRect: TRectF;
  LCaretPosition: TCaretPosition;
{$ENDIF}
begin
  inherited;
  if Model.Lines.Count > 0 then
  begin
    FCaretPosition.Line := EnsureRange(FCaretPosition.Line, 0, Model.Lines.Count - 1);
    FCaretPosition.Pos := EnsureRange(FCaretPosition.Pos, 0, Model.Lines[FCaretPosition.Line].Length);
  end
  else
    FCaretPosition := TCaretPosition.Zero;
  {$IFNDEF ANDROID}
  if not FTextService.HasMarkedText then
  begin
    if Model.Lines.Count > 0 then
      FTextService.Text := Model.Lines[FCaretPosition.Line]
    else
      FTextService.Text := string.Empty;
  end;
  {$IFDEF MSWINDOWS}
  if FTextService.HasMarkedText and TPlatformServices.Current.SupportsPlatformService(IFMXMouseService, MouseService) then
  try
    MousePos := ScreenToLocal(MouseService.GetMousePos);
    ContentRect := Model.ContentBounds;
    MousePos.X := EnsureRange(MousePos.X, ContentRect.Left, ContentRect.Right);
    MousePos.Y := EnsureRange(MousePos.Y, ContentRect.Top, ContentRect.Bottom);
    MousePos.Offset(-ContentRect.TopLeft);
    LCaretPosition := FLineObjects.GetPointPosition(MousePos, False);
    FTextService.CaretPosition := TPoint.Create(LCaretPosition.Pos, LCaretPosition.Line);
    IMEStateUpdated;
  finally
    MouseService := nil;
  end;
  {$ENDIF}
  {$ELSE}
  FTextService.Text := LinesToText(Model.Lines);
  {$ENDIF}
  UpdateCaretPosition(False);
  if Model.AutoSelect and not FTextService.HasMarkedText then
    DoSelectAllText;
end;

procedure TStyledMemo.DoExit;
begin
  DoChange;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueUpdate(Observers);
  inherited;
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.DoGotoLineBegin;
var
  Point: TPointF;
begin
  if Model.Lines.Count > 0 then
  begin
    Point := TPointF.Create(-ViewportPosition.X, Model.Caret.Pos.Y - ViewportPosition.Y +
      GetLineHeight / 2);
    CaretPosition := FLineObjects.GetPointPosition(Point);
  end;
end;

procedure TStyledMemo.DoGotoLineEnd;
var
  ContentRect: TRectF;
  Point: TPointF;
begin
  if Model.Lines.Count > 0 then
  begin
    ContentRect := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
    if (CaretPosition.Line >= FLineObjects.Count) or
      not RectsIntersect(ContentRect, FLineObjects[CaretPosition.Line].Rect) then
    begin
      FLineObjects.RenderLayouts;
      UpdateCaretPosition(True);
    end;

    Point := TPointF.Create(FLineObjects[CaretPosition.Line].Rect.Right - 1,
      Model.Caret.Pos.Y - ViewportPosition.Y + GetLineHeight / 2);
    CaretPosition := FLineObjects.GetPointPosition(Point);
  end;
end;

procedure TStyledMemo.DoGotoTextBegin;
begin
  FCaretPosition := TCaretPosition.Zero;
  FSelected := False;
  UpdateSelectionInModel;
  UpdateCaretPosition(True);
end;

procedure TStyledMemo.DoGotoTextEnd;
begin
  if Model.Lines.Count = 0 then
    FCaretPosition := TCaretPosition.Zero
  else
    FCaretPosition := TCaretPosition.Create(Model.Lines.Count - 1, Model.Lines[Model.Lines.Count - 1].Length);
  FSelected := False;
  UpdateSelectionInModel;
  UpdateCaretPosition(True);
end;

function TStyledMemo.GetPositionPoint(const ACaretPos: TCaretPosition): TPointF;
var
  Region: TRegion;
begin
  Region := FLineObjects.GetRegionForRange(ACaretPos.Line, ACaretPos.Pos, 1);
  if Length(Region) > 0 then
  begin
    Result := TPointF.Create(
      EnsureRange(Region[0].Left, FLineObjects[ACaretPos.Line].Rect.Left, FLineObjects[ACaretPos.Line].Rect.Right),
      EnsureRange(Region[0].Top, FLineObjects[ACaretPos.Line].Rect.Top, FLineObjects[ACaretPos.Line].Rect.Bottom));
    Result.Offset(ViewportPosition);
  end
  else
    Result := TPointF.Zero;
end;

procedure TStyledMemo.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  TmpS: string;
  OldCaretPosition, LCaret: TCaretPosition;
  WasSelection, IsCtrlOrCmd: Boolean;
  LTmpOptions: TInsertOptions;
  KeyHandled: Boolean;
begin
  KeyHandled := False;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    if (Key = vkReturn) or (Key = vkBack) or (Key = vkDelete) or ((Key = vkInsert) and (ssShift in Shift)) then
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
      begin
        TLinkObservers.EditLinkReset(Observers);
        Exit;
      end;

    if (KeyChar >= #32) and not TLinkObservers.EditLinkIsValidChar(Observers, KeyChar) then
    begin
      KeyChar := #0;
      Exit;
    end;
    case KeyChar of
      ^H, ^V, ^X, #32 .. High(Char):
        if not TLinkObservers.EditLinkEdit(Observers) then
        begin
          KeyChar := #0;
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end
        else
          TLinkObservers.EditLinkModified(Observers);
      #27:
        begin
          TLinkObservers.EditLinkReset(Observers);
          DoSelectAllText;
          KeyChar := #0;
          Exit;
        end;
    end;
  end;

  if Observers.IsObserving(TObserverMapping.ControlValueID) and (KeyChar <> #0) then
    TLinkObservers.ControlValueModified(Observers);

  inherited KeyDown(Key, KeyChar, Shift);
  OldCaretPosition := CaretPosition;
  if (Key = vkReturn) and not(ssCommand in Shift) and not Model.ReadOnly then
  begin
    WasSelection := Model.SelLength > 0;
    if WasSelection then
      Model.DeleteFrom(GetSelBeg, Model.SelLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo,
        TDeleteOption.Selected]);
    if WasSelection then
      LTmpOptions := [TInsertOption.UndoPairedWithPrev]
    else
      LTmpOptions := [];
    TmpS := Model.Lines.LineBreak;
    Model.InsertAfter(CaretPosition, TmpS, LTmpOptions + [TInsertOption.MoveCaret, TInsertOption.CanUndo]);
    Model.SelLength := 0;
    Key := 0;
    DoChange;
  end;
  IsCtrlOrCmd := Shift * [ssCtrl, ssCommand] <> [];
  case Key of
    vkA:
      if IsCtrlOrCmd then
      begin
        DoSelectAllText;
        KeyHandled := True;
      end;
    vkC:
      if IsCtrlOrCmd then
      begin
        DoCopyToClipboard;
        KeyHandled := True;
      end;
    vkV:
      if IsCtrlOrCmd then
      begin
        DoPasteFromClipboard;
        KeyHandled := True;
      end;
    vkX:
      if IsCtrlOrCmd and not Model.ReadOnly then
      begin
        DoCutToClipboard;
        KeyHandled := True;
      end;
    vkZ:
      if IsCtrlOrCmd then
      begin
        DoUndo(nil);
        KeyHandled := True;
      end;
    vkEnd:
      begin
        if IsCtrlOrCmd then
          DoGotoTextEnd
        else
          DoGotoLineEnd;
        KeyHandled := True;
      end;
    vkHome:
      begin
        if IsCtrlOrCmd then
          DoGotoTextBegin
        else
          DoGotoLineBegin;
        KeyHandled := True;
      end;
    vkLeft:
      begin
        if IsCtrlOrCmd then
          CaretPosition := GetPrevWordBegin(CaretPosition)
        else
          MoveCaretLeft;
        KeyHandled := True;
      end;
    vkRight:
      begin
        if IsCtrlOrCmd then
          CaretPosition := GetNextWordBegin(CaretPosition)
        else
          MoveCaretRight;
        KeyHandled := True;
      end;
    vkUp:
      begin
        if IsCtrlOrCmd then
          DoScroll(-1)
        else
          MoveCaretUp;
        KeyHandled := True;
      end;
    vkDown:
      begin
        if IsCtrlOrCmd then
          DoScroll(1)
        else
          MoveCaretDown;
        KeyHandled := True;
      end;
    vkPrior:
      begin
        MoveCaretPageUp;
        KeyHandled := True;
      end;
    vkNext:
      begin
        MoveCaretPageDown;
        KeyHandled := True;
      end;
    vkDelete:
      begin
        if not Model.ReadOnly then
          if Model.SelLength <> 0 then
          begin
            if ssShift in Shift then
              DoCutToClipboard
            else
              DoDeleteSelection;
          end
          else if IsCtrlOrCmd then
            Model.DeleteFrom(CaretPosition, Min(FMX.Text.GetLexemeEnd(Model.Lines[CaretPosition.Line],
              CaretPosition.Pos), Model.Lines[CaretPosition.Line].Length) - CaretPosition.Pos + 1,
              [TDeleteOption.CanUndo])
          else if Model.Lines.Count > 0 then
          begin
            if (CaretPosition.Pos < Model.Lines[CaretPosition.Line].Length) and
              Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos].IsHighSurrogate then
              Model.DeleteFrom(CaretPosition, 2, [TDeleteOption.CanUndo])
            else
              Model.DeleteFrom(CaretPosition, 1, [TDeleteOption.CanUndo]);
          end;
        KeyHandled := True;
      end;
    vkBack:
      begin
        if not Model.ReadOnly then
          if Model.SelLength <> 0 then
            DoDeleteSelection
          else if IsCtrlOrCmd then
          begin
            // Deleting whole word
            LCaret := GetPrevWordBegin(CaretPosition);
            if LCaret.IsInvalid then
              Exit;
            Model.DeleteFrom(LCaret, Model.PosToTextPos(CaretPosition) - Model.PosToTextPos(LCaret),
              [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
          end
          else
            // Deleting single character
            if Model.PosToTextPos(CaretPosition) > 0 then
            begin
              if (Model.Lines[CaretPosition.Line].Length > 0) and
                Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos - 1].IsLowSurrogate then
                Model.DeleteFrom(GetPositionShift(CaretPosition, -2), 2,
                  [TDeleteOption.MoveCaret, TDeleteOption.CanUndo])
              else
                Model.DeleteFrom(GetPositionShift(CaretPosition, -1), 1,
                  [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
            end;
        KeyHandled := True;
      end;
    vkInsert:
      begin
        if IsCtrlOrCmd then
        begin
          DoCopyToClipboard;
          KeyHandled := True;
        end
        else if [ssShift] * Shift <> [] then
        begin
          DoPasteFromClipboard;
          KeyHandled := True;
        end;
      end;
  end;

  if (KeyChar <> #0) and not Model.ReadOnly then
  begin
    FCharsBuffer := FCharsBuffer + KeyChar;
    if not KeyChar.IsHighSurrogate then
    begin
      WasSelection := Model.SelLength > 0;
      if WasSelection then
        Model.DeleteFrom(GetSelBeg, Model.SelLength, [TDeleteOption.MoveCaret, TDeleteOption.CanUndo]);
      if WasSelection then
        LTmpOptions := [TInsertOption.UndoPairedWithPrev]
      else
        LTmpOptions := [];
      Model.InsertAfter(CaretPosition, FCharsBuffer, LTmpOptions + [TInsertOption.MoveCaret, TInsertOption.CanUndo,
        TInsertOption.Typed]);
      FCharsBuffer := string.Empty;
      Model.SelLength := 0;
    end;
    KeyHandled := True;
  end
  else
  begin
    FCharsBuffer := string.Empty;
    if (Key in [vkEnd, vkHome, vkLeft, vkRight, vkUp, vkDown, vkPrior, vkNext]) then
    begin
      if ssShift in Shift then
      begin
        if not FSelected then
          SelectAtPos(OldCaretPosition);
        SelectAtPos(CaretPosition);
      end
      else if FSelected then
      begin
        FSelected := False;
        UpdateSelectionInModel;
      end;
      RepaintEdit;
      KeyHandled := True;
    end;
  end;
  UpdateSelectionPointPositions;
  if KeyHandled then
  begin
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TStyledMemo.LongTap(const X, Y: Single);
begin
  if not (csDesigning in ComponentState) and not IsFocused then
    SetFocus;

{$IFDEF ANDROID}
  if not FIgnoreMouseMove then
  begin
    FIgnoreMouseMove := True;
{$ENDIF}
    FLMouseSelecting := False;
    FFollowTheMouse := True;
    FSelected := False;
    Model.Caret.Visible := True;
    PutCaretTo(X, Y);
    UpdateSelectionPointPositions;

    if FLoupeService <> nil then
    begin
      FIgnoreMouseMove := False;
      FLoupeService.SetLoupeMode(TLoupeMode.Circle);
      SetLoupePosition(X, Y);
      ShowLoupe;
    end
    else
    begin
      FDownMPt := TPointF.Zero;
      FIgnoreMouseMove := True;
    end;
{$IFDEF ANDROID}
  end;
{$ENDIF}
end;

procedure TStyledMemo.MMCanSetFocus(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Message.Value := not FSetFocusOnUp;
end;

procedure TStyledMemo.MMCharCaseChanged(var Message: TDispatchMessageWithValue<TEditCharCase>);
begin
  if (Model.Lines.Count > 0) and (FTextService <> nil) then
  begin
    {$IFNDEF ANDROID}
    FTextService.Text := Model.Lines[CaretPosition.Line];
    {$ELSE}
    FTextService.Text := LinesToText(Model.Lines);
    {$ENDIF}
    FTextService.CharCase := Model.CharCase;
  end;
  RepaintEdit;
end;

procedure TStyledMemo.MMCheckSpellingChanged(var Message: TDispatchMessageWithValue<Boolean>);
var
  I: Integer;
begin
  if Message.Value then
  begin
    if not TPlatformServices.Current.SupportsPlatformService(IFMXSpellCheckerService, FSpellService) then
      FSpellService := nil;
    for I := 0 to Model.Lines.Count - 1 do
      FindSpellingErrorsInLine(I);
  end
  else
  begin
    for I := 0 to FSpellMenuItems.Count - 1 do
      FSpellMenuItems[I].Parent := nil;
    FSpellMenuItems.Clear;
    FSpellService := nil;
    FSpellingWords.Clear;
  end;
  FSpellHightlightRect := TRectF.Empty;
  RepaintEdit;
end;

procedure TStyledMemo.PMFragmentDeleted(var Message: TDispatchMessageWithValue<TFragmentDeleted>);
begin
  FActionStack.FragmentDeleted(Message.Value.StartPos, Message.Value.Fragment, Message.Value.Selected,
    Message.Value.CaretMoved);
end;

procedure TStyledMemo.PMFragmentInserted(var Message: TDispatchMessageWithValue<TFragmentInserted>);
begin
  FActionStack.FragmentInserted(Message.Value.StartPos, Message.Value.FragmentLength, Message.Value.PairedWithPrev,
    Message.Value.Typed);
end;

procedure TStyledMemo.MMGetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>);
begin
  Message.Value := CaretPosition;
end;

procedure TStyledMemo.PMGotoLineBegin(var Message: TDispatchMessage);
begin
  DoGotoLineBegin;
end;

procedure TStyledMemo.PMGotoLineEnd(var Message: TDispatchMessage);
begin
  DoGotoLineEnd;
end;

procedure TStyledMemo.PMGotoTextBegin(var Message: TDispatchMessage);
begin
  DoGotoTextBegin;
end;

procedure TStyledMemo.PMGotoTextEnd(var Message: TDispatchMessage);
begin
  DoGotoTextEnd;
end;

procedure TStyledMemo.MMHideSelectionOnExitChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  RepaintEdit;
end;

procedure TStyledMemo.MMImeModeChanged(var Message: TDispatchMessageWithValue<TImeMode>);
begin
  if (FTextService <> nil) and (FTextService.ImeMode <> Message.Value) then
    FTextService.ImeMode := Message.Value;
end;

procedure TStyledMemo.MMLinesChanged(var Message: TDispatchMessage);
begin
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.MMLinesClear(var Message: TDispatchMessage);
begin
  FCaretPosition := TCaretPosition.Zero;
  FSelStart := TCaretPosition.Zero;
  FSelEnd := TCaretPosition.Zero;
  FLineObjects.FLines.Clear;
  UpdateCaretPosition(True);
  RepaintEdit;
end;

procedure TStyledMemo.MMLinesDeleteLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FLineObjects.DeleteLine(Message.Value.Index);
  if Model.CheckSpelling then
    RemoveSpellingErrorsForLine(Message.Value.Index);
end;

procedure TStyledMemo.MMLinesExchangeLines(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  if Model.CheckSpelling then
  begin
    RemoveSpellingErrorsForLine(Message.Value.Index);
    RemoveSpellingErrorsForLine(Message.Value.ExtraIndex);
  end;
  FLineObjects.ExchangeLines(Message.Value.Index, Message.Value.ExtraIndex);
  if Model.CheckSpelling then
  begin
    FindSpellingErrorsInLine(Message.Value.Index);
    FindSpellingErrorsInLine(Message.Value.ExtraIndex);
  end;
end;

procedure TStyledMemo.MMLinesInsertLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FLineObjects.InsertLine(Message.Value.Index, Message.Value.Text);
  if Model.CheckSpelling then
    FindSpellingErrorsInLine(Message.Value.Index);
end;

procedure TStyledMemo.MMLinesPutLine(var Message: TDispatchMessageWithValue<TCustomMemoModel.TLineInfo>);
begin
  FLineObjects.ReplaceLine(Message.Value.Index, Message.Value.Text);
  if Model.CheckSpelling then
  begin
    RemoveSpellingErrorsForLine(Message.Value.Index);
    FindSpellingErrorsInLine(Message.Value.Index);
  end;
end;

procedure TStyledMemo.MMMaxLengthChanged(var Message: TDispatchMessage);
begin
  if FTextService <> nil then
    FTextService.MaxLength := Model.MaxLength;
end;

procedure TStyledMemo.MMReadOnlyChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  Model.Caret.ReadOnly := Message.Value;
end;

procedure TStyledMemo.MMSelLengthChanged(var Message: TDispatchMessageWithValue<Integer>);
begin
  FSelected := Message.Value > 0;
  FSelEnd := Model.TextPosToPos(Model.PosToTextPos(FSelStart) + Message.Value);
  UpdateSelectionPointPositions;
  RepaintEdit;
end;

procedure TStyledMemo.MMSetCaretPosition(var Message: TDispatchMessageWithValue<TCaretPosition>);
begin
  FSelected := Model.SelLength > 0;
  CaretPosition := Message.Value;
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.MMSetSelStart(var Message: TDispatchMessageWithValue<Integer>);
begin
  FSelStart := Model.TextPosToPos(Message.Value);
  CaretPosition := FSelStart;
  Model.DisableNotify;
  try
    Model.SelLength := 0;
  finally
    Model.EnableNotify;
  end;
end;

procedure TStyledMemo.MMTextSettingsChanged(var Message: TDispatchMessage);
var
  I: Integer;
begin
  if FCursorFill <> nil then
    FCursorFill.Color := Model.TextSettingsInfo.ResultingTextSettings.FontColor
  else
    FCursorFill := TBrush.Create(TBrushKind.Solid, Model.TextSettingsInfo.ResultingTextSettings.FontColor);
  FLineObjects.FDefaultHeight := InvalidSize.Height;
  for I := 0 to FLineObjects.Count - 1 do
  begin
    FLineObjects[I].FreeLayout;
    FLineObjects[I].InvalidateSize;
  end;
  if Model.TextSettingsInfo.ResultingTextSettings.IsAdjustChanged then
    FLineHeight := 0;
  if not (csLoading in ComponentState) then
  begin
    if (Model.TextSettingsInfo <> nil) and Model.TextSettingsInfo.ResultingTextSettings.IsChanged and
      (FOldWordWrap <> Model.TextSettingsInfo.ResultingTextSettings.WordWrap) then
    begin
      FOldWordWrap := Model.TextSettingsInfo.ResultingTextSettings.WordWrap;
      if FOldWordWrap then
        AniCalculations.TouchTracking := AniCalculations.TouchTracking - [ttHorizontal];
    end;
    UpdateCaretPosition(False);
    RepaintEdit;
  end;
end;

procedure TStyledMemo.PMUndo(var Message: TDispatchMessage);
begin
  DoUndo(nil);
end;

procedure TStyledMemo.MMUpdateStateChanged(var Message: TDispatchMessageWithValue<Boolean>);
begin
  if Message.Value then
    BeginUpdate
  else
    EndUpdate;
end;

procedure TStyledMemo.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  HadMarkedText: Boolean;
begin
  FIgnoreMouseMove := False;
  FSetFocusOnUp := ([ssDouble, ssTouch] * Shift) = [ssTouch];
  HadMarkedText := FTextService.HasMarkedText;
  inherited;
  FDownMPt := TPointF.Create(X, Y);
  FOldMPt := TPointF.Create(X, Y);
  //Not a touch UI
  if ((Shift * [ssTouch]) = []) and (Button = TMouseButton.mbLeft) then
  begin
    if ssDouble in Shift then
    begin
      FLMouseSelecting := False;
      DoSelectWord;
    end
    else if not FTextService.HasMarkedText or HadMarkedText then
    begin
      FLMouseSelecting := True;
      FSelected := ssShift in Shift;
      PutCaretTo(X, Y, FSelected and not FTextService.HasMarkedText);
    end;
  end;
end;

procedure TStyledMemo.DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);

  procedure DrawSelection(const ARegion: TRegion);
  var
    RectLine: TRectF;
    I: Integer;
  begin
    for I := Low(ARegion) to High(ARegion) do
    begin
      RectLine := ARegion[I];
                                                                                                                                                                 
      {$IFDEF IOS}
      if (Length(ARegion) > 1) and (I <> High(ARegion)) then
        RectLine.Right := FContent.Width;
      {$ENDIF}
      Canvas.FillRect(RectLine, 0, 0, [], 1, Model.SelectionFill);
    end;
  end;

  procedure DrawLeftAndRightSelectionSide(const ARegion: TRegion);
  var
    SelectionRect: TRectF;
    HalfCaretWidth: Single;
    SideRect: TRectF;
  begin
    if Length(ARegion) > 0 then
    begin
      HalfCaretWidth := Model.Caret.Flasher.Size.Width / 2;
      FCursorFill.Color := Model.Caret.Flasher.Color;
      // Draw Left selection side
      SelectionRect := ARegion[0];
      SideRect := TRectF.Create(SelectionRect.Left - HalfCaretWidth, SelectionRect.Top,
        SelectionRect.Left + HalfCaretWidth, SelectionRect.Bottom);
      Canvas.FillRect(SideRect, 0, 0, AllCorners, AbsoluteOpacity, FCursorFill);
      // Draw Right selection side
      SelectionRect := ARegion[High(ARegion)];
      SideRect := TRectF.Create(SelectionRect.Right - HalfCaretWidth, SelectionRect.Top,
        SelectionRect.Right + HalfCaretWidth, SelectionRect.Bottom);
      Canvas.FillRect(SideRect, 0, 0, AllCorners, AbsoluteOpacity, FCursorFill);
    end;
  end;

var
  TmpRect: TRectF;
  Rgn: TRegion;
  State: TCanvasSaveState;
  I, J: Integer;
begin
  FLineObjects.RenderLayouts;
  State := Canvas.SaveState;
  try
    Canvas.IntersectClipRect(ARect);

    if Model.Lines.Count > 0 then
      if (FTextService <> nil) and FTextService.HasMarkedText then
      begin
        Canvas.Fill.Color := Model.TextSettingsInfo.ResultingTextSettings.FontColor;
        for I := 0 to FLineObjects.Count - 1 do
          if FLineObjects[I].Layout <> nil then
            if I = FTextService.CaretPosition.Y then
            begin
              TmpRect := TRectF.Create(FLineObjects[I].Layout.TopLeft, FLineObjects[I].Layout.MaxSize);
              FTextService.DrawSingleLine(Canvas, TmpRect, 1, Model.TextSettingsInfo.ResultingTextSettings.Font,
                AbsoluteOpacity, FillTextFlags, Model.TextSettingsInfo.ResultingTextSettings.HorzAlign,
                TTextAlign.Leading, Model.TextSettingsInfo.ResultingTextSettings.WordWrap)
            end
            else
              FLineObjects[I].Layout.RenderLayout(Canvas);
      end
      else
        for I := 0 to FLineObjects.Count - 1 do
          if FLineObjects[I].Layout <> nil then
            FLineObjects[I].Layout.RenderLayout(Canvas);

    if FSelected and GetShowSelection and (Model.SelLength > 0) then
    begin
      Rgn := GetSelectionRegion;
      DrawSelection(Rgn);
      if HaveSelectionPickers then
        DrawLeftAndRightSelectionSide(Rgn);
    end;

    if Model.CheckSpelling and (FSpellingWords.Count > 0) and (FSpellService <> nil) and (Model.Lines.Count > 0) then
    begin
      TmpRect := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
      for I := 0 to FSpellingWords.Count - 1 do
        if RectsIntersect(TmpRect, FLineObjects[FSpellingWords[I].Position.Line].Rect) then
        begin
          if not FSpellingWords[I].HasBounds and (FLineObjects[FSpellingWords[I].Position.Line].Layout <> nil) then
            FSpellingWords[I].Bounds := FLineObjects[FSpellingWords[I].Position.Line].Layout.RegionForRange
              (TTextRange.Create(FSpellingWords[I].Position.Pos, FSpellingWords[I].Length));
          for J := Low(FSpellingWords[I].Bounds) to High(FSpellingWords[I].Bounds) do
          begin
            TmpRect := FSpellingWords[I].Bounds[J];
            Canvas.DrawLine(TPointF.Create(TmpRect.Left, TmpRect.Bottom), TPointF.Create(TmpRect.Right, TmpRect.Bottom),
              AbsoluteOpacity, FSpellUnderlineBrush);
          end;
        end
        else
          FSpellingWords[I].InvalidateBounds;
      if not FSpellHightlightRect.IsEmpty then
        Canvas.FillRect(FSpellHightlightRect, 0, 0, [], 0.2, FSpellFill);
    end;
  finally
    Canvas.RestoreState(State);
  end;
end;

procedure TStyledMemo.DoViewportPositionChange(const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: boolean);
var
  I, J: Integer;
  Point: TPointF;
  Line: TLineObject;
  Content: TRectF;
begin
  inherited;
  if ContentSizeChanged then
  begin
    for I := 0 to FLineObjects.Count - 1 do
    begin
      Line := FLineObjects[I];
      if Line.Layout <> nil then
        FLineObjects.UpdateLayoutParams(Line.Layout);
      Line.InvalidateSize;
    end;
    FLineObjects.RenderLayouts;
  end
  else if not (OldViewportPosition - NewViewportPosition).IsZero then
  begin
    Point := -ViewportPosition;
    for I := 0 to FLineObjects.Count - 1 do
    begin
      Line := FLineObjects[I];
      Line.Rect.Location := Point;
      if Line.Layout <> nil then
        Line.Layout.TopLeft := Point;
      Point.Offset(0, FLineObjects[I].Size.Height);
    end;
    UpdateSelectionPointPositions;
    if not FSpellHightlightRect.IsEmpty then
      FSpellHightlightRect.Offset(OldViewportPosition.X - NewViewportPosition.X, OldViewportPosition.Y - NewViewportPosition.Y);
    if Model.CheckSpelling then
    begin
      Content := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
      for I := 0 to FSpellingWords.Count - 1 do
        if RectsIntersect(Content, FLineObjects[FSpellingWords[I].Position.Line].Rect) and FSpellingWords[I].HasBounds then
          for J := Low(FSpellingWords[I].Bounds) to High(FSpellingWords[I].Bounds) do
            FSpellingWords[I].Bounds[J].Offset(OldViewportPosition.X - NewViewportPosition.X, OldViewportPosition.Y - NewViewportPosition.Y)
        else
          FSpellingWords[I].InvalidateBounds;
    end;
    UpdateCaretPosition(False);
  end;
end;

procedure TStyledMemo.AniMouseDown(const Touch: Boolean; const X, Y: Single);
begin
  if Touch then
    inherited;
end;

procedure TStyledMemo.AniMouseMove(const Touch: Boolean; const X, Y: Single);
begin
  if Touch then
    inherited;
end;

procedure TStyledMemo.AniMouseUp(const Touch: Boolean; const X, Y: Single);
begin
  if Touch then
    inherited;
end;

procedure TStyledMemo.ApplyStyle;
var
  StyleResource: TFmxObject;
  BrushObject: TBrushObject;
  FontObject: IFontObject;
begin
  FCursorFill.Free;
  FCursorFill := TBrush.Create(TBrushKind.Solid, Model.TextSettingsInfo.ResultingTextSettings.FontColor);
  FLineObjects.FDefaultHeight := InvalidSize.Height;
  Model.TextSettingsInfo.TextSettings.BeginUpdate;
  try
    Model.TextSettingsInfo.Design := False;
    inherited;
    if FindStyleResource<TControl>(ContentStyleResourceName, FContent) then
      FContent.OnPaint := DoContentPaint;
    if FindStyleResource<TBrushObject>(SelectionStyleResourceName, BrushObject) then
      Model.SelectionFill := BrushObject.Brush;
    // Default Text settings
    // apply the font fill style only if the user hasn't changed the font fill anteriorly
    if FindStyleResource<TBrushObject>(ForegroundStyleResourceName, BrushObject) then
      Model.TextSettingsInfo.DefaultTextSettings.FontColor := BrushObject.Brush.Color;
    StyleResource := FindStyleResource(FontStyleResourceName);
    if Supports(StyleResource, IFontObject, FontObject) and not Model.TextSettingsInfo.TextSettings.Font.IsSizeStored then
      Model.TextSettingsInfo.DefaultTextSettings.Font := FontObject.Font;
    Model.TextSettingsInfo.DefaultTextSettings.HorzAlign := TTextAlign.Leading;
    // Caret Color
    StyleResource := FindStyleResource(CaretColorStyleResouceName);
    if StyleResource is TColorObject then
      Model.Caret.DefaultColor := TColorObject(StyleResource).Color
    else
      Model.Caret.DefaultColor := TAlphaColorRec.Null;
    // Load selection points
    if FindStyleResource<TSelectionPoint>(LeftSelectionPointStyleResourceName, FLeftSelPt) then
    begin
      FLeftSelPt.OnTrack := DoLeftSelPtChangePosition;
      FLeftSelPt.OnMouseUp := DoSelPtMouseUp;
      FLeftSelPt.OnMouseDown := DoLeftSelPtMouseDown;
      FLeftSelPt.Visible := False;
    end;
    if FindStyleResource<TSelectionPoint>(RightSelectionPointStyleResourceName, FRightSelPt) then
    begin
      FRightSelPt.OnTrack := DoRightSelPtChangePosition;
      FRightSelPt.OnMouseUp := DoSelPtMouseUp;
      FRightSelPt.OnMouseDown := DoRightSelPtMouseDown;
      FRightSelPt.Visible := False;
    end;
    Model.TextSettingsInfo.TextSettings.Change;
  finally
    Model.TextSettingsInfo.TextSettings.EndUpdate;
    Model.TextSettingsInfo.Design := csDesigning in ComponentState;
  end;
end;

procedure TStyledMemo.RepaintEdit;
begin
  if FContent <> nil then
    FContent.Repaint;
end;

procedure TStyledMemo.Resize;
var
  I: Integer;
begin
  inherited;
  if (Model <> nil) and Model.CheckSpelling then
    for I := 0 to FSpellingWords.Count - 1 do
      FSpellingWords[I].InvalidateBounds;
  UpdateCaretPosition(False);
end;

procedure TStyledMemo.UpdateHScrlBarByCaretPos;
var
  LRegion: TRegion;
begin
  LRegion := FLineObjects.GetRegionForRange(CaretPosition.Line, CaretPosition.Pos, 1);
  if Length(LRegion) > 0 then
  begin
    LRegion[0].Offset(Model.Caret.Flasher.Size.Width, 0);
    if LRegion[0].Left > Model.ViewportSize.Width then
      ViewportPosition := TPointF.Create(ViewportPosition.X + (LRegion[0].Left - Model.ViewportSize.Width),
        ViewportPosition.Y)
    else if LRegion[0].Left < 0 then
      ViewportPosition := TPointF.Create(0, ViewportPosition.Y);
  end;
end;

procedure TStyledMemo.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  if not FFollowTheMouse then
    inherited;
  FOldMPt := TPointF.Create(X, Y);
  if not FIgnoreMouseMove and (FLMouseSelecting or FFollowTheMouse) then
  begin
    if FFollowTheMouse then
    begin
      FLMouseSelecting := False;
      FSelected := False;
      if FLoupeService <> nil then
      begin
        FLoupeService.SetLoupeMode(TLoupeMode.Circle);
        SetLoupePosition(X, Y);
        ShowLoupe;
      end;
    end;
    PutCaretTo(X, Y, FLMouseSelecting);
    UpdateSelectionPointPositions;
    StartAutoScroll(X, Y);
  end;
end;

procedure TStyledMemo.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FSetFocusOnUp and not AniCalculations.Moved then
  begin
    FSetFocusOnUp := False;
    if not (csDesigning in PresentedControl.ComponentState) and not PresentedControl.IsFocused then
      PresentedControl.SetFocus;
  end;
  if FFollowTheMouse and (FTextService <> nil) then
    FTextService.EndSelection;
  if (Shift * [ssTouch]) = [] then
  begin
    //Not a touch UI
    FLMouseSelecting := False;
    if Model.SelLength = 0 then
      FSelected := False;
  end
  else
  begin
    //It's a touch UI
    if Abs(FDownMPt.Distance(FOldMPt)) < cnTouchAccuracy then
    begin
      //if position was not changed - acivating caret
      Model.Caret.Visible := True;
      FLMouseSelecting := False;
      if not FFollowTheMouse then
      begin
        FSelected := False;
        PutCaretTo(X, Y, True, FDisableCaretInsideWords);
        FSelected := Model.SelLength > 0;
      end;
    end;
    FFollowTheMouse := False;
  end;
  FIgnoreMouseMove := False;
  StopAutoScroll;
  HideLoupe;
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.CreatePopupMenu;
var
  LMenuItem: TMenuItem;
begin
  FMemoPopupMenu := TPopupMenu.Create(Self);
  FMemoPopupMenu.Stored := False;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SEditCut;
  LMenuItem.StyleName := CutStyleName;
  LMenuItem.OnClick := DoCut;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SEditCopy;
  LMenuItem.StyleName := CopyStyleName;
  LMenuItem.OnClick := DoCopy;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SEditPaste;
  LMenuItem.StyleName := PasteStyleName;
  LMenuItem.OnClick := DoPaste;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SEditDelete;
  LMenuItem.StyleName := DeleteStyleName;
  LMenuItem.OnClick := DoDelete;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SMenuSeparator;

  LMenuItem := TMenuItem.Create(FMemoPopupMenu);
  LMenuItem.Parent := FMemoPopupMenu;
  LMenuItem.Text := SEditSelectAll;
  LMenuItem.StyleName := SelectAllStyleName;
  LMenuItem.OnClick := DoSelectAll;
end;

procedure TStyledMemo.DoCut(Sender: TObject);
begin
  DoCutToClipboard;
end;

procedure TStyledMemo.DoCutToClipboard;
begin
  TCustomMemo(PresentedControl).CutToClipboard;
end;

procedure TStyledMemo.DoCopy(Sender: TObject);
begin
  DoCopyToClipboard;
end;

procedure TStyledMemo.DoCopyToClipboard;
begin
  TCustomMemo(PresentedControl).CopyToClipboard;
end;

procedure TStyledMemo.DoDelete(Sender: TObject);
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if not TLinkObservers.EditLinkEdit(Observers) then
    begin
      TLinkObservers.EditLinkReset(Observers);
      Exit;
    end
    else
      TLinkObservers.EditLinkModified(Observers);

  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueModified(Observers);

  DoDeleteSelection;
end;

procedure TStyledMemo.DoDeleteSelection;
begin
  TCustomMemo(PresentedControl).DeleteSelection;
end;

procedure TStyledMemo.DoPaste(Sender: TObject);
begin
  DoPasteFromClipboard;
end;

procedure TStyledMemo.DoPasteFromClipboard;
begin
  TCustomMemo(PresentedControl).PasteFromClipboard;
end;

procedure TStyledMemo.UpdatePopupMenuItems;
var
  ClipService: IFMXClipboardService;

  procedure SetParam(AParamName : string; AValue : Boolean) ;
  var
    LMI : TMenuItem;
  begin
    LMI := TMenuItem(FMemoPopupMenu.FindStyleResource(AParamName));
    if LMI <> nil then
      LMI.Enabled := AValue;
  end;

begin
  SetParam(CutStyleName, FSelected and not Model.ReadOnly);
  SetParam(CopyStyleName, FSelected);
  SetParam(PasteStyleName, TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipService) and
    (not ClipService.GetClipboard.IsEmpty) and not Model.ReadOnly);
  SetParam(DeleteStyleName, FSelected and not Model.ReadOnly);
  SetParam(SelectAllStyleName, Model.SelLength <> Model.Lines.Text.Length);
end;

procedure TStyledMemo.UpdateSelectionInModel;
begin
  Model.DisableNotify;
  try
    if FSelected then
    begin
      Model.SelStart := Model.PosToTextPos(GetSelBeg);
      Model.SelLength := Model.PosToTextPos(GetSelEnd) - Model.SelStart;
    end
    else
    begin
      Model.SelStart := Model.PosToTextPos(FCaretPosition);
      Model.SelLength := 0;
    end;
  finally
    Model.EnableNotify;
  end;
end;

procedure TStyledMemo.UpdateSelectionPointPositions;

  function GetLeftSelectionPointPos: TPointF;
  var
    Region: TRegion;
  begin
    Region := GetSelectionRegion;
    if Length(Region) > 0 then
      Result := Region[Low(Region)].TopLeft
    else
      Result := GetPositionPoint(CaretPosition);
    Result.Y := Result.Y - 2 * FLeftSelPt.GripSize;
  end;

  function GetRightSelectionPointPos: TPointF;
  var
    Region: TRegion;
  begin
    Region := GetSelectionRegion;
    if Length(Region) > 0 then
      Result := Region[High(Region)].BottomRight
    else
      Result := GetPositionPoint(CaretPosition);

    Result.Y := Result.Y + 2 * FRightSelPt.GripSize;
  end;

  function GetVisibleLeftPoint: Boolean;
  var
    RegionStart: TCaretPosition;
    LPoint: TPointF;
    Region: TRegion;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
  begin
    Region := GetSelectionRegion;
    Result := FSelected and GetShowSelection and (Model.SelLength > 0) and (Length(Region) > 0);
    if Length(Region) > 0 then
    begin
      LPoint := Region[0].TopLeft;
      LPoint.Offset(0, GetLineHeight / 2);
      RegionStart := FLineObjects.GetPointPosition(LPoint);
      GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
      if SelStartTmp < RegionStart then
        Result := False
      else
        Result := Result and (LPoint.Y > Model.ContentBounds.Top) and (0 <= LPoint.X) and (LPoint.X <= Model.ContentSize.Width);
    end;
  end;

  function GetVisibleRightPoint: Boolean;
  var
    RegionEnd: TCaretPosition;
    LPoint: TPointF;
    Region: TRegion;
    SelEndTmp: TCaretPosition;
    SelStartTmp: TCaretPosition;
  begin
    Region := GetSelectionRegion;
    Result := FSelected and GetShowSelection and (Model.SelLength > 0) and (Length(Region) > 0);
    if Length(Region) > 0 then
    begin
      LPoint := Region[High(Region)].BottomRight;
      LPoint.Offset(0, -GetLineHeight / 2);
      RegionEnd := FLineObjects.GetPointPosition(LPoint);
      GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
      if SelEndTmp > RegionEnd then
        Result := False
      else
        Result := Result and (LPoint.Y < Model.ContentSize.Height) and (0 <= LPoint.X) and (LPoint.X <= Model.ContentSize.Width);
    end;
  end;

begin
  Model.Caret.TemporarilyHidden := FSelected and (Model.SelLength > 0) and IsFocused;
  if HaveSelectionPickers then
  begin
    FLeftSelPt.Visible := GetVisibleLeftPoint;
    FRightSelPt.Visible := GetVisibleRightPoint;
    FLeftSelPt.Position.Point := GetLeftSelectionPointPos;
    FRightSelPt.Position.Point := GetRightSelectionPointPos;
  end;
end;

procedure TStyledMemo.UpdateSpellPopupMenu(const APoint: TPointF);
var
  I, J: Integer;
  LPos: TCaretPosition;
  Suggestions: TArray<string>;
  LMenuItem: TMenuItem;
begin
  for I := 0 to FSpellMenuItems.Count - 1 do
    FSpellMenuItems[I].Parent := nil;
  FSpellMenuItems.Clear;

  if FSpellService <> nil then
  begin
    LPos := FLineObjects.GetPointPosition(APoint);
    for I := 0 to FSpellingWords.Count - 1 do
      if FSpellingWords[I].PosAtCurrentPos(LPos) then
      begin
        Suggestions := FSpellService.CheckSpelling(Model.Lines[FSpellingWords[I].Position.Line]
          .Substring(FSpellingWords[I].Position.Pos, FSpellingWords[I].Length));
        if Length(Suggestions) > 0 then
        begin
          for J := Low(Suggestions) to High(Suggestions) do
          begin
            LMenuItem := TMenuItem.Create(FMemoPopupMenu);
            LMenuItem.Text := Suggestions[J];
            LMenuItem.Font.Style := LMenuItem.Font.Style + [TFontStyle.fsBold];
            LMenuItem.Tag := I;
            LMenuItem.OnClick := SpellFixContextMenuHandler;
            FMemoPopupMenu.InsertObject(FSpellMenuItems.Count, LMenuItem);
            FSpellMenuItems.Add(LMenuItem);
          end;
          LMenuItem := TMenuItem.Create(FMemoPopupMenu);
          LMenuItem.Text := SMenuSeparator;
          FMemoPopupMenu.InsertObject(FSpellMenuItems.Count, LMenuItem);
          FSpellMenuItems.Add(LMenuItem);
        end;
        Break;
      end;
  end;
end;

function TStyledMemo.GetNextWordBegin(const StartPosition: TCaretPosition): TCaretPosition;
var
  CurPos: Integer;
  CurLine: Integer;
begin
  CurPos := StartPosition.Pos;
  CurLine := StartPosition.Line;

  if Model.Lines.Count > 0 then
    if StartPosition.Pos < Model.Lines[StartPosition.Line].Length then
      CurPos := FMX.Text.GetNextLexemeBegin(Model.Lines[CurLine], CurPos)
    else if StartPosition.Line < Model.Lines.Count - 1 then
    begin
      Inc(CurLine);
      CurPos := 0;
    end;

  Result := TCaretPosition.Create(CurLine, CurPos);
end;

function TStyledMemo.GetPrevWordBegin(const StartPosition: TCaretPosition): TCaretPosition;
var
  CurPos: Integer;
  CurLine: Integer;
begin
  CurPos := StartPosition.Pos;
  CurLine := StartPosition.Line;

  if Model.Lines.Count > 0 then
    if StartPosition.Pos > 0 then
      CurPos := FMX.Text.GetPrevLexemeBegin(Model.Lines[CurLine], CurPos)
    else if (StartPosition.Line - 1 >= 0) and (StartPosition.Line - 1 <= Model.Lines.Count - 1) then
    begin
      CurLine := CurLine - 1;
      CurPos := Model.Lines[CurLine].Length;
    end;

  Result := TCaretPosition.Create(CurLine, CurPos);
end;

procedure TStyledMemo.DoScroll(const ADirection: Integer);
var
  LLineHeight : Single;
  Position: TPointF;
begin
  if (Model.Lines.Count > 0) and VScrollBar.Visible then
  begin
    LLineHeight := Model.ContentBounds.Height / Model.Lines.Count;
    Position := ViewportPosition;
    Position.Offset(0, ADirection * LLineHeight);
    ViewportPosition := Position;
  end;
end;

procedure TStyledMemo.DoSelectAll(Sender: TObject);
begin
  DoSelectAllText;
end;

procedure TStyledMemo.DoSelectAllText;
begin
  TCustomMemo(PresentedControl).SelectAll;
end;

procedure TStyledMemo.DoSelectWord;
begin
  TCustomMemo(PresentedControl).SelectWord;
end;

procedure TStyledMemo.DoSelPtMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  StopAutoScroll;
  EndSelection;
end;

procedure TStyledMemo.SpellFixContextMenuHandler(Sender: TObject);
var
  SpellingWord: TSpellingWord;
begin
  if Sender is TMenuItem then
  begin
    SpellingWord := FSpellingWords[TMenuItem(Sender).Tag];
    Model.Lines[SpellingWord.Position.Line] := Model.Lines[SpellingWord.Position.Line].Remove(SpellingWord.Position.Pos,
      SpellingWord.Length).Insert(SpellingWord.Position.Pos, TMenuItem(Sender).Text);
    RepaintEdit;
  end;
end;

procedure TStyledMemo.EndIMEInput;
begin
  if (Model.Lines.Count > 0) and (CaretPosition.Line < Model.Lines.Count) then
  begin
    CaretPosition := TCaretPosition.Create(CaretPosition.Line,
      Min(CaretPosition.Pos, Model.Lines[CaretPosition.Line].Length));
  end;
end;

procedure TStyledMemo.EndSelection;
begin
{$IFDEF ANDROID}
  FIgnoreMouseMove := False;
{$ENDIF}
  HideLoupe;
  if FTextService <> nil then
    FTextService.EndSelection;
end;

procedure TStyledMemo.AutoScrollDownHandler(Sender: TObject);
begin
  if CaretPosition.Line >= (Model.Lines.Count - 1) then
  begin
    FAutoVScrollTimer.Enabled := False;
    Exit;
  end;
  CaretPosition := TCaretPosition.Create(CaretPosition.Line + 1, CaretPosition.Pos);
  SelectAtPos(CaretPosition);
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.AutoScrollLeftHandler(Sender: TObject);
begin
  if CaretPosition.Pos >= 0 then
  begin
    FAutoHScrollTimer.Enabled := False;
    Exit;
  end;
  CaretPosition := TCaretPosition.Create(CaretPosition.Line, CaretPosition.Pos - 1);
  SelectAtPos(CaretPosition);
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.AutoScrollRightHandler(Sender: TObject);
begin
  if CaretPosition.Pos >= Model.Lines[CaretPosition.Line].Length then
  begin
    FAutoHScrollTimer.Enabled := False;
    Exit;
  end;
  CaretPosition := TCaretPosition.Create(CaretPosition.Line, CaretPosition.Pos + 1);
  SelectAtPos(CaretPosition);
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.AutoScrollUpHandler(Sender: TObject);
begin
  if CaretPosition.Line <= 0 then
  begin
    FAutoVScrollTimer.Enabled := False;
    Exit;
  end;
  CaretPosition := TCaretPosition.Create(CaretPosition.Line - 1, CaretPosition.Pos);
  SelectAtPos(CaretPosition);
  UpdateSelectionPointPositions;
end;

procedure TStyledMemo.BeginSelection;
begin
{$IFDEF ANDROID}
  FIgnoreMouseMove := True;
{$ENDIF}
  if FLoupeService <> nil then
    FLoupeService.SetLoupeMode(TLoupeMode.Rectangle);
  if FTextService <> nil then
    FTextService.BeginSelection;
end;

procedure TStyledMemo.DoChange;
begin
  if not (csLoading in ComponentState) then
    Model.Change;
end;

procedure TStyledMemo.DoLeftSelPtChangePosition(Sender: TObject; var X, Y: Single);

  procedure CalculateNewSelStart;
  var
    NewSelStart: TCaretPosition;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
  begin
    NewSelStart := FLineObjects.GetPointPosition(PointF(X, Y + FLeftSelPt.GripSize * 2));
    GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
    if NewSelStart < SelEndTmp then
      SelStartTmp := NewSelStart
    else
    begin
      SelStartTmp := SelEndTmp;
      if SelStartTmp.Pos > 0 then
        SelStartTmp.Pos := SelStartTmp.Pos - 1
      else
      begin
        Inc(SelStartTmp.Line, -1);
        SelStartTmp.Pos := Model.Lines[SelStartTmp.Line].Length - 1;
      end;
    end;
    SetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
  end;

  procedure UpdateLeftPointPosition;
  var
    PointTmp: TPointF;
    Region: TRegion;
    SelEndTmp: TCaretPosition;
    SelStartTmp: TCaretPosition;
  begin
    GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
    Region := FLineObjects.GetRegionForRange(SelStartTmp.Line, SelStartTmp.Pos, 1);
    if Length(Region) > 0 then
      PointTmp := Region[0].TopLeft
    else
      PointTmp := TPointF.Zero;
    X := PointTmp.X + Model.ContentBounds.Left;
    Y := PointTmp.Y - 2 * FLeftSelPt.GripSize + Model.ContentBounds.Top;
  end;

begin
  CalculateNewSelStart;
  UpdateLeftPointPosition;
  RepaintEdit;
  StartAutoScroll(X, Y);
  SetLoupePosition(TSelectionPointType.Left);
end;

procedure TStyledMemo.DoLeftSelPtMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  BeginSelection;
  SetLoupePosition(TSelectionPointType.Left);
  ShowLoupe;
end;

procedure TStyledMemo.DoRightSelPtChangePosition(Sender: TObject; var X, Y: Single);

  procedure CalculateNewSelEnd;
  var
    NewSelEnd: TCaretPosition;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
  begin
    NewSelEnd := FLineObjects.GetPointPosition(PointF(X, Y - 2 * FLeftSelPt.GripSize));
    GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
    if NewSelEnd > SelStartTmp then
      SelEndTmp := NewSelEnd;
    if (SelEndTmp.Pos = 0) and (SelEndTmp.Line > 0) then
    begin
      Inc(SelEndTmp.Line, -1);
      SelEndTmp.Pos := Model.Lines[SelEndTmp.Line].Length;
    end;
    SetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
  end;

  procedure UpdateRightPointPosition;
  var
    PointTmp: TPointF;
    Region: TRegion;
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
  begin
    GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);

    Region := FLineObjects.GetRegionForRange(SelEndTmp.Line, SelEndTmp.Pos, 1);
    if Length(Region) > 0 then
      PointTmp := Region[0].TopLeft
    else
      PointTmp := TPointF.Zero;
    X := PointTmp.X + Model.ContentBounds.Left;
    Y := PointTmp.Y + GetLineHeight + 2 * FRightSelPt.GripSize + Model.ContentBounds.Top;
  end;

begin
  CalculateNewSelEnd;
  UpdateRightPointPosition;
  RepaintEdit;
  StartAutoScroll(X, Y);
  SetLoupePosition(TSelectionPointType.Right);
end;

procedure TStyledMemo.DoRightSelPtMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  BeginSelection;
  SetLoupePosition(TSelectionPointType.Right);
  ShowLoupe;
end;

procedure TStyledMemo.CMGesture(var EventInfo: TGestureEventInfo);
var
  LocalPoint: TPointF;
begin
  if EventInfo.GestureID = igiLongTap then
  begin
    LocalPoint := AbsoluteToLocal(EventInfo.Location);
    LongTap(LocalPoint.X, LocalPoint.Y);
  end
  else if EventInfo.GestureID = igiDoubleTap then
    DblTap
  //don't let pan override moving selection points
  else if (EventInfo.GestureID = igiPan) and not FLMouseSelecting and FFollowTheMouse then
    Exit
  else
    inherited;
end;

function TStyledMemo.ShowContextMenu(const ScreenPosition: TPointF): Boolean;
begin
  Result := inherited;
  if not Result and not (csDesigning in ComponentState) then
  begin
    UpdatePopupMenuItems;
    if Model.CheckSpelling and (FSpellService <> nil) and (FSpellingWords.Count > 0) then
      UpdateSpellPopupMenu(ScreenToLocal(ScreenPosition));
    FMemoPopupMenu.PopupComponent := Self;
    if Root <> nil then
      FMemoPopupMenu.Parent := Root.GetObject;
    try
      Result := True;
      FMemoPopupMenu.Popup(Round(ScreenPosition.X), Round(ScreenPosition.Y));
    finally
      FMemoPopupMenu.Parent := nil;
    end;
  end;
end;

procedure TStyledMemo.FindSpellingErrorsInLine(const LineIndex: Integer);
var
  Shift, BegPos, EndPos: Integer;
  Line: string;
begin
  if FSpellService <> nil then
  begin
    Shift := 0;
    Line := Model.Lines[LineIndex];
    while not Line.IsEmpty and FMX.Text.FindWordBound(Line, 0, BegPos, EndPos) do
    begin
      if Length(FSpellService.CheckSpelling(Line.Substring(BegPos, EndPos - BegPos + 1))) > 0 then
        FSpellingWords.Add(TSpellingWord.Create(TCaretPosition.Create(LineIndex, BegPos + Shift), EndPos - BegPos + 1, nil));
      Inc(Shift, EndPos + 1);
      Line := Line.Remove(0, EndPos + 1);
    end;
  end;
end;

procedure TStyledMemo.RemoveSpellingErrorsForLine(const LineIndex: Integer);
var
  I: Integer;
begin
  for I := FSpellingWords.Count - 1 downto 0 do
    if FSpellingWords[I].Position.Line > LineIndex then
      FSpellingWords[I].InvalidateBounds
    else if FSpellingWords[I].Position.Line = LineIndex then
      FSpellingWords.Delete(I);
end;

procedure TStyledMemo.FreeStyle;
begin
  inherited;
  FContent := nil;
  FLeftSelPt := nil;
  FRightSelPt := nil;
end;

procedure TStyledMemo.SetCaretPosition(const Value: TCaretPosition);
begin
  if Value.IsInvalid then
    FCaretPosition := TCaretPosition.Zero
  else
  begin
    FCaretPosition := Value;
    if FCaretPosition.Line > Model.Lines.Count - 1 then
    begin
      FCaretPosition.Line := Max(0, Model.Lines.Count - 1);
      if Model.Lines.Count > 0 then
        FCaretPosition.Pos := Model.Lines[FCaretPosition.Line].Length
      else
        FCaretPosition.Pos := 0;
    end;

    if (Model.Lines.Count > 0) and (FCaretPosition.Pos > Model.Lines[FCaretPosition.Line].Length) then
      FCaretPosition.Pos := Model.Lines[FCaretPosition.Line].Length;
  end;
  if not FSelected then
  begin
    FSelStart := FCaretPosition;
    UpdateSelectionInModel;
  end;

  if FTextService <> nil then
  begin
    {$IFNDEF ANDROID}
    if Model.Lines.Count > 0 then
    begin
      if FTextService.CombinedText <> Model.Lines[FCaretPosition.Line] then
        FTextService.Text := Model.Lines[FCaretPosition.Line];
    end
    else
      FTextService.Text := string.Empty;
    if FTextService.TargetClausePosition <> FCaretPosition then
      FTextService.CaretPosition := FCaretPosition;
    {$ELSE}
    FTextService.Text := LinesToText(Model.Lines);
    FTextService.CaretPosition := TPoint.Create(Model.PosToTextPos(FCaretPosition), FCaretPosition.Line);
    {$ENDIF}
  end;
  if FUpdating = 0 then
  begin
    UpdateCaretPosition(True);
    RepaintEdit;
  end;
end;

procedure TStyledMemo.SetNormalizedSelectionRange(const ASelStart, ASelEnd: TCaretPosition);
begin
  if FSelStart <= FSelEnd then
  begin
    FSelStart := ASelStart;
    FSelEnd := ASelEnd;
  end
  else
  begin
    FSelStart := ASelEnd;
    FSelEnd := ASelStart;
  end;
  UpdateSelectionInModel;
end;

procedure TStyledMemo.RecalcOpacity;
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    FLineObjects.UpdateLayoutsColor;
    UpdateCaretPosition(False);
    RepaintEdit;
  end;
end;

procedure TStyledMemo.GetNormalizedSelectionRange(var ASelStart, ASelEnd: TCaretPosition);
begin
  if FSelStart <= FSelEnd then
  begin
    ASelStart := FSelStart;
    ASelEnd := FSelEnd;
  end
  else
  begin
    ASelStart := FSelEnd;
    ASelEnd := FSelStart;
  end;
end;

procedure TStyledMemo.DblTap;
begin
  Model.Caret.Visible := True;
  FLMouseSelecting := False;
  DoSelectWord;
  UpdateSelectionPointPositions;
end;

function TStyledMemo.GetTextService: TTextService;
begin
  Result := FTextService;
end;

function LinkObserversValueModified(const AObservers: TObservers): Boolean;
begin
  Result := True;
  if AObservers.IsObserving(TObserverMapping.EditLinkID) then
  begin
    Result := TLinkObservers.EditLinkEdit(AObservers);
    if Result then
      TLinkObservers.EditLinkModified(AObservers);
  end;
  if Result and AObservers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueModified(AObservers);
end;

procedure TStyledMemo.IMEStateUpdated;
var
  LCaret: TCaretPosition;
  TextChanged, SelectionChanged: Boolean;
  {$IFDEF ANDROID}
  LLines: TStrings;
  I: Integer;
  {$ENDIF}
begin
  if (FTextService <> nil) and not FIgnoreMouseMove then
  begin
    TextChanged := False;
    LCaret := TCaretPosition.Create(FTextService.TargetClausePosition.Y, FTextService.TargetClausePosition.X);
    if (LCaret.Line < 0) or (LCaret.Line >= Model.Lines.Count) then
      LCaret.Line := 0;
    if Model.Lines.Count = 0 then
    begin
      TextChanged := True;
      Model.Lines.BeginUpdate;
      try
        Model.Lines.Insert(LCaret.Line, FTextService.CombinedText);
      finally
        Model.Lines.EndUpdate;
      end;
      LCaret := TCaretPosition.Create(LCaret.Line, FTextService.CombinedText.Length);
    end
    else
    begin
      {$IFNDEF ANDROID}
      if Model.Lines[LCaret.Line] <> FTextService.CombinedText then
      begin
        TextChanged := True;
        Model.Lines[LCaret.Line] := FTextService.CombinedText;
      end;
      {$ELSE}
      if LinesToText(Model.Lines) <> FTextService.Text then
      begin
        TextChanged := True;
        LLines := TextToLines(FTextService.Text);
        BeginUpdate;
        try
          for I := 0 to LLines.Count - 1 do
          begin
            if I = Model.Lines.Count then
              Model.Lines.Add(LLines[I])
            else
              if Model.Lines[I] <> LLines[I] then
                Model.Lines[I] := LLines[I];
          end;
          for I := Model.Lines.Count - 1 downto LLines.Count do
            Model.Lines.Delete(I);
        finally
          EndUpdate;
        end;
        LCaret := Model.TextPosToPos(FTextService.TargetClausePosition.X);
      end;
      {$ENDIF}
    end;
    SelectionChanged := FSelected or (FSelStart <> LCaret) or (FSelEnd <> LCaret);
    CaretPosition := LCaret;
    FSelStart := LCaret;
    FSelected := False;
    FSelEnd := FSelStart;
    UpdateSelectionInModel;

    if SelectionChanged then
      UpdateSelectionPointPositions;
    if TextChanged then
      LinkObserversValueModified(Self.Observers);
  end;
end;

function TStyledMemo.GetTargetClausePointF: TPointF;
var
  TmpPt: TPointF;
begin
  if FTextService <> nil then
  begin
    TmpPt := GetPositionPoint(TCaretPosition.Create(FTextService.TargetClausePosition.Y,
      FTextService.TargetClausePosition.X));
    TmpPt.Offset(0, GetLineHeight + IMEWindowGap);
    Result := LocalToAbsolute(TmpPt);
  end;
end;

procedure TStyledMemo.UpdateCaretPosition(const UpdateScrllBars: Boolean);
begin
  if UpdateScrllBars and not (csLoading in ComponentState) then
  begin
    UpdateVScrlBarByCaretPos;
    UpdateHScrlBarByCaretPos;
  end;
  Model.Caret.BeginUpdate;
  try
    Model.Caret.TemporarilyHidden := FSelected and (Model.SelLength > 0) and IsFocused;
    Model.Caret.Pos := GetPositionPoint(CaretPosition);
    Model.Caret.Size := TPointF.Create(Model.Caret.Size.cx, GetLineHeight);
  finally
    Model.Caret.EndUpdate;
  end;
end;

function TStyledMemo.IsCurrentWordWrong: Boolean;
var
  I: Integer;
begin
  for I := 0 to FSpellingWords.Count - 1 do
    if FSpellingWords[I].PosAtCurrentPos(CaretPosition) then
      Exit(True);
  Result := False;
end;

function TStyledMemo.IsSpellCheckEnabled: Boolean;
begin
  Result := Model.CheckSpelling;
end;

procedure TStyledMemo.DoUndo(Sender: TObject);
begin
  if not Model.ReadOnly then
    FActionStack.RollBackAction;
end;

procedure TStyledMemo.SetLoupePosition(const ASelectionPointType: TSelectionPointType);

  function GetSelectionRect: TRectF;
  var
    SelStartTmp: TCaretPosition;
    SelEndTmp: TCaretPosition;
    Region: TRegion;
  begin
    GetNormalizedSelectionRange(SelStartTmp, SelEndTmp);
    case ASelectionPointType of
      TSelectionPointType.Left:
        begin
          Region := FLineObjects.GetRegionForRange(SelStartTmp.Line, SelStartTmp.Pos, 1);
          if Length(Region) > 0 then
            Result := TRectF.Create(Region[0].TopLeft, Region[0].Width, Region[0].Height)
          else
            Result := TRectF.Empty;
        end;
      TSelectionPointType.Right:
        begin
          Region := FLineObjects.GetRegionForRange(SelEndTmp.Line, SelEndTmp.Pos, 1);
          if Length(Region) > 0 then
            Result := TRectF.Create(Region[0].TopLeft, Region[0].Width, Region[0].Height)
          else
            Result := TRectF.Empty;
        end;
    end;
  end;

var
  ZoomCenter: TPointF;
  LoupePos: TPointF;
  SelRect: TRectF;
begin
  Model.Caret.TemporarilyHidden := FSelected and (Model.SelLength > 0) and IsFocused;
  SelRect := GetSelectionRect;
  if FLoupeService <> nil then
  begin
    case ASelectionPointType of
      TSelectionPointType.Left:
        begin
          ZoomCenter := TPointF.Create(SelRect.Left, SelRect.Top + SelRect.Height / 2);
          LoupePos := SelRect.TopLeft + TPointF.Create(-FLoupeService.GetWidth / 2, -FLoupeService.GetHeight) +
            TPointF.Create(0, -LOUPE_OFFSET);
        end;
      TSelectionPointType.Right:
        begin
          ZoomCenter := TPointF.Create(SelRect.Right, SelRect.Top + SelRect.Height / 2);
          LoupePos := TPointF.Create(SelRect.Right, SelRect.Top) + TPointF.Create(-FLoupeService.GetWidth / 2,
            -FLoupeService.GetHeight) + TPointF.Create(0, -LOUPE_OFFSET);
        end;
    end;
    ZoomCenter := LocalToAbsolute(ZoomCenter);
    LoupePos := LocalToAbsolute(LoupePos);

    FLoupeService.SetZoomRegionCenter(ZoomCenter);
    FLoupeService.SetPosition(LoupePos);
  end;
end;

procedure TStyledMemo.SetLoupePosition(const X, Y: Single);
var
  LoupePos: TPointF;
  ZoomPos: TPointF;
begin
  if FLoupeService <> nil then
  begin
    LoupePos := TPointF.Create(X - FLoupeService.GetWidth / 2, Y - FLoupeService.GetHeight);
    LoupePos := LocalToAbsolute(LoupePos);
    ZoomPos := LocalToAbsolute(PointF(X, Y));
    FLoupeService.SetZoomRegionCenter(ZoomPos);
    FLoupeService.SetPosition(LoupePos);
    ShowLoupe;
  end;
end;

procedure TStyledMemo.MoveCaretLeft;
begin
  if (Model.Lines.Count > 0) then
    if (Model.Lines[CaretPosition.Line].Length > 1) and (CaretPosition.Pos > 0)
      and Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos - 1].IsLowSurrogate then
      MoveCaretBy(-2)
    else
      MoveCaretBy(-1);
end;

procedure TStyledMemo.MoveCaretRight;
begin
  if (Model.Lines.Count > 0) then
    if (Model.Lines[CaretPosition.Line].Length > CaretPosition.Pos) and
      Model.Lines[CaretPosition.Line].Chars[CaretPosition.Pos].IsHighSurrogate then
      MoveCaretBy(2)
    else
      MoveCaretBy(1);
end;

procedure TStyledMemo.MoveCaretBy(const Delta: Integer);
begin
  CaretPosition := GetPositionShift(CaretPosition, Delta);
end;

function TStyledMemo.GetLineHeight: Single;
begin
  if FLineHeight <= 0 then
  begin
    TCanvasManager.MeasureCanvas.Font.Assign(Model.TextSettingsInfo.ResultingTextSettings.Font);
    FLineHeight := Round(TCanvasManager.MeasureCanvas.TextHeight('Ply|'));
  end;
  Result := FLineHeight;
end;

function TStyledMemo.GetListOfPrepositions: TArray<string>;
var
  BP, EP: Integer;
begin
  Result := nil;
  if (FSpellService <> nil) and (Model.Lines.Count > 0) and (CaretPosition.Line >= 0) and (CaretPosition.Pos >= 0) and
    FMX.Text.FindWordBound(Model.Lines[CaretPosition.Line], CaretPosition.Pos, BP, EP) then
    Result := FSpellService.CheckSpelling(Model.Lines[CaretPosition.Line].Substring(BP, EP - BP + 1));
end;

procedure TStyledMemo.UpdateVScrlBarByCaretPos;
var
  CaretRegion: TRegion;
  Point: TPointF;
begin
  if (Model.Lines.Count > 0) and (FLineObjects.Count > 0) and (CaretPosition.Line < FLineObjects.Count) and
    (FContent <> nil) then
  begin
    CaretRegion := FLineObjects.GetRegionForRange(CaretPosition.Line, CaretPosition.Pos, 1);
    if Length(CaretRegion) > 0 then
    begin
      Point := ViewportPosition;
      if CaretRegion[0].Bottom > FContent.Height then
        Point.Offset(0, CaretRegion[0].Bottom - Model.ViewportSize.Height)
      else if CaretRegion[0].Top < 0 then
        Point.Offset(0, - Abs(CaretRegion[0].Top));
      ViewportPosition := Point;
    end;
  end
  else
    ViewportPosition := TPointF.Create(ViewportPosition.X, 0);
end;

procedure TStyledMemo.ShowLoupe;
begin
  if FLoupeService <> nil then
  begin
    FLoupeService.SetLoupeScale(TCustomMagnifierGlass.DefaultLoupeScale);
    FLoupeService.ShowFor(Self);
  end;
end;

procedure TStyledMemo.Spell(const AWord: string);
var
  I, J: Integer;
begin
  for I := 0 to FSpellingWords.Count - 1 do
    if FSpellingWords[I].PosAtCurrentPos(CaretPosition) then
    begin
      Model.Lines[CaretPosition.Line] := Model.Lines[CaretPosition.Line].Remove(FSpellingWords[I].Position.Pos,
        FSpellingWords[I].Length).Insert(FSpellingWords[I].Position.Pos, AWord);
      HideHighlightSpell;
      for J := I + 1 to FSpellingWords.Count - 1 do
        FSpellingWords[J].InvalidateBounds;
      CaretPosition := TCaretPosition.Create(CaretPosition.Line, FSpellingWords[I].Position.Pos + AWord.Length);
      FSpellingWords.Delete(I);
      Break;
    end;
end;

procedure TStyledMemo.StartAutoScroll(const X, Y: Single);
var
  Rect: TRectF;
begin
  FStartAutoScrollTimer.Enabled := False;
  FAutoVScrollTimer.Enabled := False;
  FAutoHScrollTimer.Enabled := False;
  FNeedAutoVScroll := False;
  FNeedAutoHScroll := False;
  if Model.Lines.Count > 0 then
  begin
    if FContent <> nil then
      Rect := FContent.BoundsRect
    else
      Rect := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
    if (Y < Rect.Top) or (Y > Rect.Bottom) then
    begin
      FNeedAutoVScroll := True;
      if Y < Model.ContentBounds.Top then
        FAutoVScrollTimer.OnTimer := AutoScrollUpHandler
      else
        FAutoVScrollTimer.OnTimer := AutoScrollDownHandler;
    end;
    if (X < Rect.Left) or (X > Rect.Right) then
    begin
      FNeedAutoHScroll := True;
      if X < Rect.Left then
        FAutoHScrollTimer.OnTimer := AutoScrollLeftHandler
      else
        FAutoHScrollTimer.OnTimer := AutoScrollRightHandler;
    end;
    FStartAutoScrollTimer.Enabled := FNeedAutoVScroll or FNeedAutoHScroll;
  end;
end;

procedure TStyledMemo.StartAutoScrollHandler(Sender: TObject);
begin
  FStartAutoScrollTimer.Enabled := False;
  FAutoVScrollTimer.Enabled := FNeedAutoVScroll;
  FAutoHScrollTimer.Enabled := FNeedAutoHScroll;
end;

procedure TStyledMemo.StartIMEInput;
begin
  if FTextService <> nil then
  begin
    if Model.Lines.Count > 0 then
      FTextService.Text := Model.Lines[CaretPosition.Line];
    FTextService.CaretPosition := Point(CaretPosition.Pos, CaretPosition.Line);
  end;
end;

procedure TStyledMemo.StopAutoScroll;
begin
  FStartAutoScrollTimer.Enabled := False;
  FAutoVScrollTimer.Enabled := False;
  FAutoHScrollTimer.Enabled := False;
end;

function TStyledMemo.GetPageSize: Single;
begin
  Result := Model.ViewportSize.Height / GetLineHeight;
end;

procedure TStyledMemo.PMInit(var Message: TDispatchMessage);
var
  I: Integer;
begin
  inherited;
  if FTextService <> nil then
    FTextService.MaxLength := Model.MaxLength;
  if Model.Lines.Count > 0 then
  begin
    BeginUpdate;
    try
      for I := 0 to Model.Lines.Count - 1 do
        FLineObjects.InsertLine(I, Model.Lines[I]);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TStyledMemo.PMSelectText(var Message: TDispatchMessage);
begin
  FSelStart := Model.TextPosToPos(Model.SelStart);
  FSelEnd := Model.TextPosToPos(Model.SelStart + Model.SelLength);
  FSelected := True;
  UpdateSelectionPointPositions;
  RepaintEdit;
end;

procedure TStyledMemo.PutCaretTo(const X, Y: Single; const Select: Boolean; const PositionByWord: Boolean);
var
  ContentRect: TRectF;
  Point: TPointF;
begin
  if FContent <> nil then
    ContentRect := FContent.BoundsRect
  else
    ContentRect := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
  Point := TPointF.Create(EnsureRange(X, ContentRect.Left, ContentRect.Right) - ContentRect.Left,
    EnsureRange(Y, ContentRect.Top, ContentRect.Bottom) - ContentRect.Top);
  CaretPosition := FLineObjects.GetPointPosition(Point, PositionByWord);
  if Select then
    SelectAtPos(CaretPosition);
end;

function TStyledMemo.HasText: Boolean;
begin
  Result := Model.Lines.Count > 0;
end;

function TStyledMemo.HaveSelectionPickers: Boolean;
begin
  Result := (FLeftSelPt <> nil) and (FRightSelPt <> nil);
end;

procedure TStyledMemo.HideLoupe;
begin
  if FLoupeService <> nil then
    FLoupeService.Hide;
end;

procedure TStyledMemo.HighlightSpell;
var
  StartPos, EndPos: Integer;
  Region: TRegion;
begin
  if (Model.Lines.Count > 0) and (CaretPosition.Line >= 0) and (CaretPosition.Pos >= 0) and
    FMX.Text.FindWordBound(Model.Lines[CaretPosition.Line], CaretPosition.Pos, StartPos, EndPos) then
  begin
    Region := FLineObjects.GetRegionForRange(CaretPosition.Line, StartPos, EndPos - StartPos + 1);
    if Length(Region) > 0 then
      FSpellHightlightRect := Region[0]
    else
      FSpellHightlightRect := TRectF.Empty;
  end;
  Model.Caret.TemporarilyHidden := True;
  RepaintEdit;
end;

function TStyledMemo.GetSelBeg: TCaretPosition;
begin
  if FSelStart < FSelEnd then
    Result := FSelStart
  else
    Result := FSelEnd;
end;

function TStyledMemo.GetSelection: string;
begin
  Result := Model.SelectedText;
end;

function TStyledMemo.GetSelectionBounds: TRect;
begin
  if FSelected then
    Result := TRect.Create(FSelStart, FSelEnd)
  else
    Result := TRect.Create(FCaretPosition, FCaretPosition);
end;

function TStyledMemo.GetSelectionRect: TRectF;
var
  TmpRect, SelRect: TRectF;
  Region: TRegion;
  I: Integer;
  TmpPt: TPointF;
begin
  Region := FLineObjects.GetRegionForRange(CaretPosition.Line, CaretPosition.Pos, 1);
  if Length(Region) > 0 then
    TmpPt := Region[0].TopLeft
  else
    TmpPt := TPointF.Zero;
  Result := TRectF.Create(TmpPt, 1, GetLineHeight);
  if FSelected and GetShowSelection and (Model.SelLength > 0) then
  begin
    Region := GetSelectionRegion;
    if Length(Region) > 0 then
      Result := Region[0];
    SelRect := TRectF.Create(0, 0, Model.ViewportSize.Width, Model.ViewportSize.Height);
    for I := Low(Region) to High(Region) do
    begin
      IntersectRect(TmpRect, Region[I], SelRect);
      Result := TRectF.Union(Result, TmpRect);
    end;
  end;
  if FContent <> nil then
    Result.TopLeft := AbsoluteToLocal(FContent.LocalToAbsolute(Result.TopLeft))
end;

function TStyledMemo.GetSelectionRegion: TRegion;
var
  LCaret: TCaretPosition;
begin
  LCaret := GetSelBeg;
{$IFNDEF ANDROID}
  if (FTextService <> nil) and FTextService.HasMarkedText and
    ((FTextService.CaretPosition.Y <> LCaret.Line) or (FTextService.CaretPosition.X <= LCaret.Pos)) then
    LCaret := Model.TextPosToPos(Model.PosToTextPos(LCaret) + (FTextService.CombinedText.Length -
      FTextService.Text.Length));
{$ENDIF}
  Result := FLineObjects.GetRegionForRange(LCaret.Line, LCaret.Pos, Model.SelLength);
end;

function TStyledMemo.GetSelEnd: TCaretPosition;
begin
  if FSelStart > FSelEnd then
    Result := FSelStart
  else
    Result := FSelEnd;
end;

procedure TStyledMemo.SelectAtPos(const APos: TCaretPosition);
begin
  if not FSelected then
  begin
    FSelStart := APos;
    FSelEnd := APos;
    FSelected := True;
  end
  else
    FSelEnd := APos;
  UpdateSelectionInModel;
end;

function TStyledMemo.GetPositionShift(const APos: TCaretPosition; const Delta: Integer): TCaretPosition;
begin
  Result := APos;
  Inc(Result.Pos, Delta);
  if Model.Lines.Count > 0 then
    if Result.Pos < 0 then
      while Result.Pos < 0 do
      begin
        Inc(Result.Pos, Model.Lines[Result.Line].Length + 1);
        Dec(Result.Line);
        if Result.Line < 0 then
          Result := TCaretPosition.Zero
        else
          Result.Pos := Model.Lines[Result.Line].Length;
      end
    else
      while Result.Pos > Model.Lines[Result.Line].Length do
      begin
        Result.IncrementLine;
        if Result.Line >= Model.Lines.Count then
          Result := TCaretPosition.Create(Model.Lines.Count - 1, Model.Lines[Model.Lines.Count - 1].Length)
        else
          Dec(Result.Pos, Model.Lines[Result.Line - 1].Length + 1);
      end;
end;

procedure TStyledMemo.MoveCaretVertical(const LineDelta: Integer);
var
  Pt: TPointF;
  LCaret: TCaretPosition;
begin
  Pt := Model.Caret.Pos;
  Pt.Offset(0, GetLineHeight / 2);
  Pt.Offset(-ViewportPosition.X, -ViewportPosition.Y);
  Pt.Offset(0, LineDelta * GetLineHeight);
  LCaret := FLineObjects.GetPointPosition(Pt);
  if not LCaret.IsInvalid then
  begin
    FCaretPosition := LCaret;
    UpdateCaretPosition(True);
  end;
end;

procedure TStyledMemo.MoveCaretDown;
begin
  MoveCaretVertical(1);
end;

procedure TStyledMemo.MoveCaretUp;
begin
  MoveCaretVertical(-1);
end;

procedure TStyledMemo.MoveCaretPageDown;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Trunc(GetPageSize);
  if ScrollLineNumber < 1 then
    ScrollLineNumber := 1;
  MoveCaretVertical(ScrollLineNumber);
end;

procedure TStyledMemo.MoveCaretPageUp;
var
  ScrollLineNumber: Integer;
begin
  ScrollLineNumber := Trunc(GetPageSize);
  if ScrollLineNumber < 1 then
    ScrollLineNumber := 1;
  MoveCaretVertical(-ScrollLineNumber);
end;

function TStyledMemo.GetShowSelection: Boolean;
begin
  Result := IsFocused or not Model.HideSelectionOnExit;
end;

{ TEditActionStack }

constructor TEditActionStack.Create(const AOwner: TStyledMemo);
begin
  inherited Create;
  FOwner := AOwner;
end;

procedure TEditActionStack.FragmentDeleted(const StartPos: Integer; const Fragment: string;
  const Selected, CaretMoved: Boolean);
var
  TmpItem: TEditAction;
begin
  if not Fragment.IsEmpty then
    if (Count = 0) or (Peek.ActionType <> TActionType.Delete) or (Peek.StartPosition - StartPos - Fragment.Length > 1)
      or (Peek.StartPosition - StartPos <= 0) or Selected then
    begin
      TmpItem.ActionType := TActionType.Delete;
      TmpItem.StartPosition := StartPos;
      TmpItem.DeletedFragment := Fragment;
      TmpItem.PairedWithPrev := False;
      TmpItem.WasSelected := Selected;
      TmpItem.CaretMoved := CaretMoved;
      Push(TmpItem);
    end
    else if StartPos >= 0 then
    begin
      TmpItem := Pop;
      if StartPos < TmpItem.StartPosition then
        TmpItem.DeletedFragment := Fragment + TmpItem.DeletedFragment
      else
        TmpItem.DeletedFragment := TmpItem.DeletedFragment + Fragment;
      TmpItem.StartPosition := StartPos;
      Push(TmpItem);
    end;
end;

procedure TEditActionStack.FragmentInserted(const StartPos, FragmentLength: Integer;
  const PairedWithPrev, Typed: Boolean);
var
  TmpItem: TEditAction;
begin
  if FragmentLength > 0 then
    if (Count = 0) or (Peek.ActionType <> TActionType.Insert) or ((Peek.StartPosition + Peek.Length) <> StartPos) or
      not Typed or (Peek.Typed <> Typed) then
    begin
      TmpItem.ActionType := TActionType.Insert;
      TmpItem.StartPosition := StartPos;
      TmpItem.Length := FragmentLength;
      TmpItem.PairedWithPrev := PairedWithPrev;
      TmpItem.Typed := Typed;
      Push(TmpItem);
    end
    else
    begin
      TmpItem := Pop;
      TmpItem.Length := TmpItem.Length + FragmentLength;
      Push(TmpItem);
    end;
end;

function TEditActionStack.RollBackAction: Boolean;
var
  TmpItem: TEditAction;
  WasPaired: Boolean;
  LTmpOptions: TInsertOptions;
begin
  Result := (Count > 0);

  if Result and (FOwner <> nil) then
  repeat
    TmpItem := Pop;

    if TmpItem.WasSelected then
      LTmpOptions := [TInsertOption.Selected]
    else
      LTmpOptions := [];
    if TmpItem.CaretMoved then
      LTmpOptions := LTmpOptions + [TInsertOption.MoveCaret];

    FOwner.Model.DisableNotify;
    try
      FOwner.Model.SelLength := 0;
    finally
      FOwner.Model.EnableNotify;
    end;

    case TmpItem.ActionType of
      TActionType.Delete:
        FOwner.Model.InsertAfter(FOwner.Model.TextPosToPos(TmpItem.StartPosition), TmpItem.DeletedFragment,
          LTmpOptions);
      TActionType.Insert:
        FOwner.Model.DeleteFrom(FOwner.Model.TextPosToPos(TmpItem.StartPosition), TmpItem.Length, [TDeleteOption.MoveCaret]);
    end;

    WasPaired := TmpItem.PairedWithPrev;
  until (Count = 0) or (not WasPaired);
end;

procedure RegisterAliases;
begin
  AddEnumElementAliases(TypeInfo(TInsertOption), ['ioSelected', 'ioMoveCaret', 'ioCanUndo', 'ioUndoPairedWithPrev']);
  AddEnumElementAliases(TypeInfo(TDeleteOption), ['doMoveCaret', 'doCanUndo']);
  AddEnumElementAliases(TypeInfo(TActionType), ['atDelete', 'atInsert']);
  AddEnumElementAliases(TypeInfo(TSelectionPointType), ['sptLeft', 'sptRight']);
end;

procedure UnregisterAliases;
begin
  RemoveEnumElementAliases(TypeInfo(TInsertOption));
  RemoveEnumElementAliases(TypeInfo(TDeleteOption));
  RemoveEnumElementAliases(TypeInfo(TActionType));
  RemoveEnumElementAliases(TypeInfo(TSelectionPointType));
end;

{ TStyledMemo.TSpellingWord }

constructor TStyledMemo.TSpellingWord.Create(const APosition: TCaretPosition; const ALength: Integer;
  const ABounds: TRegion);
begin
  FPosition := APosition;
  FLength := ALength;
  FBounds := ABounds;
end;

function TStyledMemo.TSpellingWord.HasBounds: Boolean;
begin
  Result := System.Length(Bounds) > 0;
end;

procedure TStyledMemo.TSpellingWord.InvalidateBounds;
begin
  Bounds := nil;
end;

function TStyledMemo.TSpellingWord.PosAtCurrentPos(const APosition: TCaretPosition): Boolean;
begin
  Result := (FPosition.Line = APosition.Line) and (APosition.Pos >= FPosition.Pos) and (APosition.Pos <= (FPosition.Pos + FLength));
end;

{ TStyledMemo.TLineObject }

constructor TStyledMemo.TLineObject.Create(const ALayout: TTextLayout; const ASize: TSizeF);
begin
  FLayout := ALayout;
  FSize := ASize;
end;

constructor TStyledMemo.TLineObject.Create;
begin
  FLayout := nil;
  FSize := InvalidSize;
  FRect := TRectF.Empty;
end;

destructor TStyledMemo.TLineObject.Destroy;
begin
  FreeLayout;
  inherited;
end;

procedure TStyledMemo.TLineObject.FreeLayout;
begin
  FreeAndNil(FLayout);
end;

procedure TStyledMemo.TLineObject.InvalidateSize;
begin
  FSize := InvalidSize;
  FRect := TRectF.Empty;
end;

function TStyledMemo.TLineObject.SizeValid: Boolean;
begin
  Result := (Size.Width >= 0) and (Size.Height >= 0);
end;

{ TStyledMemo.TLines }

procedure TStyledMemo.TLines.CalculateDefaultLineMetrics;
var
  Layout: TTextLayout;
begin
  if FDefaultHeight = InvalidSize.Height then
  begin
    Layout := CreateLayout('Sample Text');
    try
      FDefaultHeight := Layout.Height;
    finally
      Layout.Free;
    end;
  end;
end;

constructor TStyledMemo.TLines.Create(Memo: TStyledMemo);
begin
  inherited Create;
  FTopLine := -1;
  FLines := TObjectList<TLineObject>.Create;
  FMemo := Memo;
  FDefaultHeight := InvalidSize.Height;
end;

function TStyledMemo.TLines.CreateLayout(const S: string): TTextLayout;
begin
  Result := TTextLayoutManager.DefaultTextLayout.Create;
  Result.BeginUpdate;
  try
    UpdateLayoutParams(Result);
    if S.IsEmpty then
      //Setting some string if text is empty to recreate layout,
      //if other properties have default values
      Result.Text := ' ';
    Result.Text := S;
  finally
    Result.EndUpdate;
  end;
end;

function TStyledMemo.TLines.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TStyledMemo.TLines.GetDefaultLineHeight: Single;
begin
  CalculateDefaultLineMetrics;
  Result := FDefaultHeight;
end;

function TStyledMemo.TLines.GetItem(const Index: Integer): TLineObject;
begin
  Result := FLines[Index];
end;

function TStyledMemo.TLines.GetPointPosition(const Pt: TPointF; const RoundToWord: Boolean): TCaretPosition;
var
  Point: TPointF;
  I: Integer;
  LPos: Integer;
  Rgn: TRegion;
  Layout: TTextLayout;
  LLine: TLineObject;
begin
  Result := TCaretPosition.Invalid;
  for I := 0 to FLines.Count - 1 do
    if ((Pt.Y > FLines[I].Rect.Top) or SameValue(Pt.Y, FLines[I].Rect.Top, TEpsilon.Position)) and
      ((Pt.Y < FLines[I].Rect.Bottom) or SameValue(Pt.Y, FLines[I].Rect.Bottom, TEpsilon.Position)) then
    begin
      Layout := FLines[I].Layout;
      if Layout = nil then
      begin
        Layout := CreateLayout(FMemo.Model.Lines[I]);
        Layout.TopLeft := FLines[I].Rect.TopLeft;
      end;
      try
        Point := TPointF.Create(EnsureRange(Pt.X, Layout.TextRect.Left, Layout.TextRect.Right), Pt.Y);
        LPos := Layout.PositionAtPoint(Point, RoundToWord);
        if LPos < 0 then
        begin
          LPos := Layout.PositionAtPoint(TPointF.Create(Pt.X, Layout.TextRect.Bottom - FMemo.GetLineHeight / 2), RoundToWord);
          if LPos < 0 then
            raise ETextLayoutException.Create(SPointInTextLayoutError);
        end;
        if LPos >= 0 then
        begin
          if LPos > 0 then
          begin
            Rgn := Layout.RegionForRange(TTextRange.Create(LPos, 1), RoundToWord);
            if (Length(Rgn) > 0) and (Rgn[0].Top > Pt.Y) then
              Dec(LPos);
          end;
          Result := TCaretPosition.Create(I, LPos);
          Break;
        end;
      finally
        if FLines[I].Layout = nil then
          Layout.Free;
      end;
    end;
  if Result.IsInvalid and (FLines.Count > 0) then
  begin
    if Pt.Y > FLines.Last.Rect.Bottom then
    begin
      // Below
      Result.Line := FLines.Count - 1;
      if FLines.Last.Layout <> nil then
        Result.Pos := FLines.Last.Layout.PositionAtPoint
          (TPointF.Create(Pt.X, FLines.Last.Rect.Bottom - FMemo.GetLineHeight / 2), RoundToWord)
      else
      begin
        Layout := CreateLayout(FMemo.Model.Lines[FMemo.Model.Lines.Count - 1]);
        try
          Result.Pos := Layout.PositionAtPoint(TPointF.Create(Pt.X, FLines.Last.Rect.Bottom - FMemo.GetLineHeight / 2),
            RoundToWord);
        finally
          Layout.Free;
        end;
      end;
    end
    else
    begin
      // Above
      Result.Line := 0;
      if FLines.First.Layout <> nil then
        Result.Pos := FLines.First.Layout.PositionAtPoint
          (TPointF.Create(Pt.X, FLines.First.Rect.Top + FMemo.GetLineHeight / 2), RoundToWord)
      else
      begin
        Layout := CreateLayout(FMemo.Model.Lines[0]);
        try
          Result.Pos := Layout.PositionAtPoint(TPointF.Create(Pt.X, FMemo.GetLineHeight / 2), RoundToWord);
        finally
          Layout.Free;
        end;
      end;
    end;
  end;
end;

function TStyledMemo.TLines.GetRegionForRange(const ALine, APos, ALength: Integer; const RoundToWord: Boolean): TRegion;
var
  I, J: Integer;
  LPos, RemainLength, LLength, LineLength: Integer;
  Layout: TTextLayout;
  LRegion: TRegion;
begin
  SetLength(Result, 0);
  if ALine < FLines.Count then
  begin
    LPos := APos;
    RemainLength := ALength;
    for I := ALine to FLines.Count - 1 do
    begin
      Layout := FLines[I].Layout;
      // Checking layout for contains a part of requested range
      if RemainLength > 0 then
      begin
        LineLength := FMemo.Model.Lines[I].Length;
        LLength := Min(RemainLength, LineLength - LPos);

        if Layout = nil then
        begin
          Layout := CreateLayout(FMemo.Model.Lines[I]);
          Layout.TopLeft := FLines[I].Rect.TopLeft;
        end;

        if Layout <> nil then
        begin
          LRegion := Layout.RegionForRange(TTextRange.Create(LPos, LLength), RoundToWord);
          for J := 0 to High(LRegion) do
          begin
            SetLength(Result, Length(Result) + 1);
            Result[High(Result)] := LRegion[J];
            Result[High(Result)].Top := Max(FLines[I].Rect.Top, LRegion[J].Top);
            Result[High(Result)].Bottom := Min(FLines[I].Rect.Bottom, LRegion[J].Bottom);
          end;

          if FLines[I].Layout = nil then
            Layout.Free;
        end;
        Inc(LPos, LLength);
        if LPos >= LineLength then
        begin
          LPos := 0;
          Dec(RemainLength);
        end;
        Dec(RemainLength, LLength + FMemo.Model.Lines.LineBreak.Length - 1);
        if RemainLength <= 0 then
          Break;
      end
      else
        Break;
    end;
  end;

  for I := Low(Result) to High(Result) do
    Result[I].Right := Min(Result[I].Right, TTextLayout.MaxLayoutSize.X);
end;

procedure TStyledMemo.TLines.DeleteLine(const Index: Integer);
var
  I: Integer;
  Content: TRectF;
  Size: TSizeF;
  Line: TLineObject;
begin
  if FLines[Index].SizeValid then
    Size := FLines[Index].Size
  else
    Size := TPointF.Zero;
  FLines.Delete(Index);
  Content := TRectF.Create(TPointF.Zero, FMemo.Model.ViewportSize);
  if not Size.IsZero then
    for I := Index to FLines.Count - 1 do
    begin
      Line := FLines[I];
      Line.Rect.Offset(0, -Size.Height);
      if Line.Layout <> nil then
        Line.Layout.TopLeft.Offset(0, -Size.Height);
      if not RectsIntersect(Content, Line.Rect) then
        Line.FreeLayout;
    end
  else
    for I := Index to FLines.Count - 1 do
      FLines[I].FreeLayout;
  if not FMemo.IsUpdating and not Size.IsZero then
  begin
    Content := FMemo.Model.ContentBounds;
    Content.Height := Content.Height - Size.Height;
    Content.Width := Max(Content.Width, Size.Width);
    UpdateContentBounds(Content);
  end;
end;

destructor TStyledMemo.TLines.Destroy;
begin
  FLines.Free;
  inherited;
end;

procedure TStyledMemo.TLines.ExchangeLines(const OldIndex, NewIndex: Integer);
var
  TopLeft: TPointF;
  OldLine, NewLine: TLineObject;
begin
  OldLine := FLines[OldIndex];
  NewLine := FLines[NewIndex];
  FLines.Exchange(OldIndex, NewIndex);
  TopLeft := OldLine.Rect.Location;
  OldLine.Rect.Location := NewLine.Rect.TopLeft;
  if (OldLine.Layout <> nil) and (NewLine.Layout <> nil) then
  begin
    OldLine.Layout.TopLeft := NewLine.Rect.Location;
    NewLine.Layout.TopLeft := TopLeft;
  end
  else
  begin
    OldLine.FreeLayout;
    NewLine.FreeLayout;
  end;
  NewLine.Rect.Location := TopLeft;

  if not FMemo.IsUpdating then
    FMemo.RepaintEdit;
end;

procedure TStyledMemo.TLines.InsertLine(const Index: Integer; const S: string);
var
  Line: TLineObject;
  I: Integer;
  Content: TRectF;
begin
  Line := TLineObject.Create;
  if not IsWordWrap then
    Line.Size := TSizeF.Create(-1, GetDefaultLineHeight);
  FLines.Insert(Index, Line);
  if not FMemo.IsUpdating then
  begin
    Line.Layout := CreateLayout(S);
    Line.Size := TSizeF.Create(Line.Layout.Width, Line.Layout.Height);
  end;
  Line.Rect := TRectF.Create(-FMemo.ViewportPosition.X, 0, Max(0, Line.Size.Width), Line.Size.Height);
  if (Index > 0) then
    Line.Rect.Offset(0, FLines[Index - 1].Rect.Bottom)
  else
    Line.Rect.Offset(0, -FMemo.ViewportPosition.Y);
  if not FMemo.IsUpdating then
  begin
    Content := TRectF.Create(TPointF.Zero, FMemo.Model.ViewportSize);
    if not RectsIntersect(Content, Line.Rect) then
      Line.FreeLayout;
  end;
  if Line.Layout <> nil then
    Line.Layout.TopLeft := Line.Rect.TopLeft;
  if IsWordWrap then
    for I := Index + 1 to FLines.Count - 1 do
    begin
      FLines[I].InvalidateSize;
      FLines[I].FreeLayout;
    end
  else
  begin
    Content := TRectF.Create(TPointF.Zero, FMemo.Model.ViewportSize);
    for I := Index + 1 to FLines.Count - 1 do
    begin
      FLines[I].Rect.Location := TPointF.Create(FLines[I - 1].Rect.Left, FLines[I - 1].Rect.Bottom);
      if FLines[I].Layout <> nil then
        FLines[I].Layout.TopLeft := FLines[I].Rect.TopLeft;
      if not RectsIntersect(Content, FLines[I].Rect) then
        FLines[I].FreeLayout;
    end
  end;
  if not FMemo.IsUpdating then
  begin
    Content := FMemo.Model.ContentBounds;
    Content.Height := Content.Height + Line.Size.Height;
    Content.Width := Max(Content.Width, Line.Size.Width);
    UpdateContentBounds(Content);
  end;
end;

function TStyledMemo.TLines.IsWordWrap: Boolean;
begin
  Result := FMemo.Model.TextSettingsInfo.ResultingTextSettings.WordWrap or
    (FMemo.Model.TextSettingsInfo.ResultingTextSettings.HorzAlign <> TTextAlign.Leading);
end;

procedure TStyledMemo.TLines.RenderLayouts;
var
  Content: TRectF;
  I, J: Integer;
  Layout: TTextLayout;
  Line: TLineObject;
  ContentBoundsUpdated: Boolean;
  ViewPosition: TPointF;
  Size: TSizeF;
  HeightChanged: Boolean;
  RecalNextLines: Boolean;
begin
  if FMemo.Model.Lines.Count <> FLines.Count then
    raise Exception.Create('RenderLayouts(): Text lines are not matching rendering lines');

  ContentBoundsUpdated := (FLines.Count = 0) and not FMemo.Model.ContentSize.Size.IsZero;
  Content := TRectF.Create(TPointF.Zero, FMemo.Model.ViewportSize);
  if not Content.IsEmpty then
  begin
    ViewPosition := FMemo.ViewportPosition;
    RecalNextLines := False;
    for I := 0 to FLines.Count - 1 do
    begin
      Line := FLines[I];
      RecalNextLines := RecalNextLines or not Line.SizeValid;
      if RecalNextLines then
      begin
        ContentBoundsUpdated := True;
        if Line.Layout = nil then
          Line.Layout := CreateLayout(FMemo.Model.Lines[I]);
        Layout := Line.Layout;
        Line.Size := TSizeF.Create(Max(1, Layout.Width), Layout.Height);
        Line.Rect := TRectF.Create(-ViewPosition.X, 0, -ViewPosition.X + Line.Size.Width, Line.Size.Height);
        if I > 0 then
          Line.Rect.Offset(0, FLines[I - 1].Rect.Bottom)
        else
          Line.Rect.Offset(0, -ViewPosition.Y);
        if RectsIntersect(Content, FLines[I].Rect) then
          Layout.TopLeft := Line.Rect.TopLeft
        else
          Line.FreeLayout;
        if IsWordWrap then
          for J := I + 1 to FLines.Count - 1 do
            if FLines[J].SizeValid then
            begin
              FLines[J].Rect.Offset(0, FLines[I].Size.Height - GetDefaultLineHeight);
              if FLines[J].Layout <> nil then
                FLines[J].Layout.TopLeft.Offset(0, FLines[I].Size.Height - GetDefaultLineHeight);
            end;
      end;
      if RectsIntersect(Content, Line.Rect) then
      begin
        if Line.Layout = nil then
        begin
          Layout := CreateLayout(FMemo.Model.Lines[I]);
          Size := TSizeF.Create(Max(1, Layout.Width), Layout.Height);
          HeightChanged := not SameValue(Line.Size.Height, Size.Height, TEpsilon.Position);
          ContentBoundsUpdated := ContentBoundsUpdated or (Line.Size <> Size);
          Line.Size := Size;
          Line.Rect := TRectF.Create(-ViewPosition.X, 0, -ViewPosition.X + Line.Size.Width, Line.Size.Height);
          if I > 0 then
            Line.Rect.Offset(0, FLines[I - 1].Rect.Bottom)
          else
            Line.Rect.Offset(0, -ViewPosition.Y);
          Layout.TopLeft := Line.Rect.TopLeft;
          Line.Layout := Layout;
          if HeightChanged then
          begin
            for J := I + 1 to FLines.Count - 1 do
            begin
              FLines[J].Rect.SetLocation(FLines[J].Rect.Left, FLines[J - 1].Rect.Bottom);
              if FLines[J].Layout <> nil then
                FLines[J].Layout.TopLeft := FLines[J].Rect.TopLeft;
            end;
          end;
        end
      end
      else
        Line.FreeLayout;
    end;
  end;
  if ContentBoundsUpdated then
  begin
    Content := TRectF.Empty;
    for I := 0 to FLines.Count - 1 do
      Content.Union(FLines[I].Rect);
    Content.Location := TPointF.Zero;
    UpdateContentBounds(Content);
  end;
end;

procedure TStyledMemo.TLines.ReplaceLine(const Index: Integer; const S: string);
var
  Line: TLineObject;
  I: Integer;
  Content: TRectF;
  OldSize: TSizeF;
begin
  Line := FLines[Index];
  Content := FMemo.Model.ContentBounds;
  if Line.SizeValid then
    OldSize := Line.Size
  else
    OldSize := TPointF.Zero;
  if not FMemo.IsUpdating then
  begin
    Content.Height := Content.Height - Line.Size.Height;
    if SameValue(Content.Width, Line.Size.Width, TEpsilon.Position) then
      Content.Width := 0;
  end;

  if not IsWordWrap then
    Line.Size := TSizeF.Create(-1, GetDefaultLineHeight);

  if not FMemo.IsUpdating then
  begin
    if Line.Layout <> nil then
      Line.Layout.Text := S
    else
      Line.Layout := CreateLayout(S);
    Line.Size := TSizeF.Create(Line.Layout.Width, Line.Layout.Height);
  end
  else
    Line.FreeLayout;
  Line.Rect := TRectF.Create(-FMemo.ViewportPosition.X, 0, Max(0, Line.Size.Width),
    Line.Size.Height);
  if Index > 0 then
    Line.Rect.Offset(0, FLines[Index - 1].Rect.Bottom)
  else
    Line.Rect.Offset(0, -FMemo.ViewportPosition.Y);
  if Line.Layout <> nil then
    Line.Layout.TopLeft := Line.Rect.TopLeft;

  if not FMemo.IsUpdating then
  begin
    if not RectsIntersect(TRectF.Create(TPointF.Zero, FMemo.Model.ViewportSize), Line.Rect) then
      Line.FreeLayout;
  end;

  if not FMemo.IsUpdating and Line.SizeValid and not OldSize.IsZero then
  begin
    for I := Index + 1 to FLines.Count - 1 do
    begin
      FLines[I].Rect.Offset(0, Line.Size.Height - OldSize.Height);
      if FLines[I].Layout <> nil then
        FLines[I].Layout.TopLeft := FLines[I].Rect.TopLeft;
    end;
  end;

  if not FMemo.IsUpdating then
  begin
    Content := FMemo.Model.ContentBounds;
    Content.Height := Content.Height + Line.Size.Height;
    Content.Width := Max(Content.Width, Line.Size.Width);
    UpdateContentBounds(Content);
  end;
end;

procedure TStyledMemo.TLines.UpdateContentBounds(ContentBounds: TRectF);
var
  FlasherWidth: Single;
begin
  if (FMemo.Model.Caret <> nil) and (FMemo.Model.Caret.Flasher <> nil) then
    FlasherWidth := FMemo.Model.Caret.Flasher.Size.Width
  else
    FlasherWidth := 0;
  ContentBounds.Width := ContentBounds.Width + Max(1, FlasherWidth);
  FMemo.Model.ContentBounds := ContentBounds;
end;

procedure TStyledMemo.TLines.UpdateLayoutParams(Layout: TTextLayout);
begin
  Layout.HorizontalAlign := FMemo.Model.TextSettingsInfo.ResultingTextSettings.HorzAlign;
  Layout.Font := FMemo.Model.TextSettingsInfo.ResultingTextSettings.Font;
  Layout.Color := FMemo.Model.TextSettingsInfo.ResultingTextSettings.FontColor;
  Layout.WordWrap := IsWordWrap;
  if Layout.WordWrap or (Layout.HorizontalAlign in [TTextAlign.Center, TTextAlign.Trailing]) then
  begin
    if FMemo.FContent <> nil then
      Layout.MaxSize := TPointF.Create(FMemo.FContent.Width, TTextLayout.MaxLayoutSize.Y)
    else
      Layout.MaxSize := TPointF.Create(FMemo.Model.ViewportSize.Width, TTextLayout.MaxLayoutSize.Y);
  end
  else
    Layout.MaxSize := TTextLayout.MaxLayoutSize;
  Layout.Opacity := FMemo.AbsoluteOpacity;
end;

procedure TStyledMemo.TLines.UpdateLayoutsColor;
var
  I: Integer;
begin
  for I := 0 to FLines.Count - 1 do
    if FLines[I].Layout <> nil then
    begin
      FLines[I].Layout.Color := FMemo.Model.TextSettingsInfo.ResultingTextSettings.FontColor;
      FLines[I].Layout.Opacity := FMemo.AbsoluteOpacity;
    end;
end;

initialization
  TPresentationProxyFactory.Current.Register(TMemo, TControlType.Styled, TStyledPresentationProxy<TStyledMemo>);
finalization
  TPresentationProxyFactory.Current.Unregister(TMemo, TControlType.Styled, TStyledPresentationProxy<TStyledMemo>);
end.
