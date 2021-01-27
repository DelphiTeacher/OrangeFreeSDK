//https://forums.embarcadero.com/thread.jspa?threadID=230057
//https://quality.embarcadero.com/browse/RSP-16670
//http://www.cnblogs.com/onechen/p/6226933.html
//Fix By [龟山]Aone(1467948783)
//fix or add by flyign wang.
//采用新的修改办法。
(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2016-12-27　　　 *)
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

unit FMX.DialogHelper;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.UITypes, FMX.Dialogs;

type

  ///<summary>Dialog creator used as helper for Dialogs and InputQuery's. All methods can be called synchronous or not
  ///depending on de AModalAndSync parameter.</summary>
  TDialogHelper = class
  public
    /// <summary>Create a ShowMessage dialog. The callback is called upon dialog closing.</summary>
    class procedure ShowMessage(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc;
      AModalAndSync: Boolean); overload;
    /// <summary>Create a ShowMessage dialog. The callback is called upon dialog closing.</summary>
    class procedure ShowMessage(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject; AModalAndSync: Boolean); overload;

    /// <summary>Create a MessageDialog. The callback is called upon dialog closing.</summary>
    class procedure MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
      const AButtons: TMsgDlgButtons; const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
      const ACloseDialogProc: TInputCloseDialogProc; AModalAndSync: Boolean); overload;
    /// <summary>Create a MessageDialog. The callback is called upon dialog closing.</summary>
    class procedure MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
      const AButtons: TMsgDlgButtons; const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
      const ACloseDialogEvent: TInputCloseDialogEvent; const AContext: TObject;
      AModalAndSync: Boolean); overload;

    /// <summary>Create a InputQuery dialog. The callback is called upon dialog closing.</summary>
    class procedure InputQuery(const ACaption: string; const APrompts: array of string;
      const ADefaultValues: array of string; ACloseQueryProc: TInputCloseQueryProc;
      AModalAndSync: Boolean); overload;
    /// <summary>Create a InputQuery dialog. The callback is called upon dialog closing.</summary>
    class procedure InputQuery(const ACaption: string; const APrompts: array of string;
      const ADefaultValues: array of string; const ACloseDialogEvent: TInputCloseQueryWithResultEvent;
      const AContext: TObject; AModalAndSync: Boolean); overload;
  end;

implementation

uses
  System.Math, System.Generics.Collections, System.Types, System.SysUtils, System.Character,
  FMX.Graphics, FMX.Types, FMX.Layouts, FMX.StdCtrls, FMX.Forms, FMX.Edit, FMX.TextLayout, FMX.Consts, FMX.Text;

const
  MsgCaptions: array [TMsgDlgType] of string = (SMsgDlgWarning, SMsgDlgError, SMsgDlgInformation, SMsgDlgConfirm, '');

type

  TDialogForm = class(TForm)
  protected
    procedure ButtonOnClick(ASender: TObject);
    procedure DoClose(var CloseAction: TCloseAction); override;
  public
    FValues: array of String;
    FEdits: TArray<TCustomEdit>;
    FCloseQueryProc: TProc;
    FCanCancel: Boolean;
    function CloseQuery: Boolean; override;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
  end;

  TDialogBuilder = class
  strict private
    class function GetWorkArea: TRect;
    class function GetPromptCaption(const ACaption: string): string;
    class function GetMaxTextWidth(const APrompts: array of String; ADialogUnits: TPoint; Canvas: TCanvas): Integer;
    class function GetAveCharSize(Canvas: TCanvas): TPoint;
    class function GetPasswordChar(const ACaption: string): WideChar;
    class function CreateLayout(const AOwner: TComponent; const ABorderSize: TPoint; AButtonHeight:Integer;
      const AAlign: TAlignLayout; AParent: TFmxObject): TLayout;

    class function CreateButton(const AOwner: TComponent; const ABorderSize: TPoint; const AWorkArea: TRect;
      const ALayout: TLayout; ADlgButton: TMsgDlgBtn; AOnClick: TNotifyEvent = nil): TButton; overload;
    class function CreateButton(const AOwner: TComponent; const ABorderSize: TPoint; const AWorkArea: TRect;
      const ALayout: TLayout; const AText: string; AModalResult: TModalResult;
      AOnClick: TNotifyEvent = nil): TButton; overload;

    class function GetMaxWidth(AWorkArea: TRect): Integer;
    class function GetMaxHeight(AWorkArea: TRect): Integer;

  public
    class function MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
      const ACloseDialogProc: TInputCloseDialogProc; ForceCanCancel: Boolean): TDialogForm;

    class function InputQuery(const ACaption: string; const APrompts: array of string;
      const ADefaultValues: array of string; ACloseQueryProc: TInputCloseQueryProc): TDialogForm;
  end;

{$REGION 'TDialogForm'}

procedure TDialogForm.DoClose(var CloseAction: TCloseAction);
begin
  CloseAction := TCloseAction.caFree;
end;

procedure TDialogForm.ButtonOnClick(ASender: TObject);
begin
  ModalResult := TButton(ASender).ModalResult;
  Close;
end;

function TDialogForm.CloseQuery: Boolean;
var
  I: Integer;
begin
  if (ModalResult = mrCancel) and not FCanCancel then
    Exit(False);
  if ModalResult = mrOk then
    for I := Low(FValues) to High(FValues) do
      FValues[I] := FEdits[I].Text;
  Result := ModalResult <> mrNone;
  if Result and Assigned(FCloseQueryProc) then
    FCloseQueryProc;
end;

procedure TDialogForm.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
begin
  if FCanCancel and (Key = vkEscape) and (TBorderIcon.biSystemMenu in BorderIcons) then
  begin
    ModalResult := mrCancel;
    Close;
  end;
end;

{$ENDREGION 'TDialogForm'}

{$REGION 'Helper methods'}

class function TDialogBuilder.GetAveCharSize(Canvas: TCanvas): TPoint;
const
  TestStr = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  Result := TPoint.Create(Round(Canvas.TextWidth(TestStr)), Round(Canvas.TextHeight(TestStr)));
  Result.X := Round(Result.X / TestStr.Length);
end;

class function TDialogBuilder.GetPromptCaption(const ACaption: string): string;
begin
  if (ACaption.Length > 1) and (ACaption.Chars[0] < #32) then
    Result := ACaption.Substring(1)
  else
    Result := ACaption;
end;

class function TDialogBuilder.GetMaxTextWidth(const APrompts: array of String; ADialogUnits: TPoint;
  Canvas: TCanvas): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Length(APrompts) - 1 do
    Result := Ceil(Max(Result, Canvas.TextWidth(GetPromptCaption(APrompts[I])) + ADialogUnits.X));
end;

class function TDialogBuilder.GetPasswordChar(const ACaption: string): WideChar;
begin
  if (ACaption.Length > 1) and (ACaption.Chars[0] < #32) then
    Result := '*'
  else
    Result := #0;
end;

class function TDialogBuilder.CreateLayout(const AOwner: TComponent; const ABorderSize: TPoint;
  AButtonHeight:Integer; const AAlign: TAlignLayout; AParent: TFmxObject): TLayout;
begin
  Result := TLayout.Create(AOwner);
  Result.Margins.Rect := TRectF.Create(ABorderSize);
  Result.Align := AAlign;
  Result.Height := AButtonHeight;
  Result.Position.Y := TTextLayout.MaxLayoutSize.Y;
  Result.Parent := AParent;
end;

class function TDialogBuilder.CreateButton(const AOwner: TComponent; const ABorderSize: TPoint;
  const AWorkArea: TRect; const ALayout: TLayout; ADlgButton: TMsgDlgBtn; AOnClick: TNotifyEvent): TButton;
begin
  Result := CreateButton(AOwner, ABorderSize, AWorkArea, ALayout, ButtonCaptions[ADlgButton],
    ModalResults[ADlgButton], AOnClick);
end;

class function TDialogBuilder.CreateButton(const AOwner: TComponent; const ABorderSize: TPoint;
  const AWorkArea: TRect; const ALayout: TLayout; const AText: string; AModalResult: TModalResult;
  AOnClick: TNotifyEvent): TButton;
begin
  Result := TButton.Create(AOwner);
  Result.Margins.Left := ABorderSize.X;
  Result.Align := TAlignLayout.Right;
  Result.Parent := ALayout;
  Result.Position.X := AWorkArea.Width;
  Result.Text := AText;
  Result.ModalResult := AModalResult;
  Result.OnClick := AOnClick;
end;

class function TDialogBuilder.GetMaxWidth(AWorkArea: TRect): Integer;
const
  WorkAreaWidthRatio = 3/4;
begin
  Result := Ceil(AWorkArea.Width * WorkAreaWidthRatio);
end;

class function TDialogBuilder.GetMaxHeight(AWorkArea: TRect): Integer;
const
  WorkAreaHeightRatio = 5/6;
begin
  Result := Ceil(AWorkArea.Height * WorkAreaHeightRatio);
end;

class function TDialogBuilder.GetWorkArea: TRect;
begin
  if Screen.ActiveForm <> nil then
    Result := Screen.DisplayFromForm(Screen.ActiveForm).WorkArea
  else if Application.MainForm <> nil then
    Result := Screen.DisplayFromForm(Application.MainForm).WorkArea
  else
    Result := Screen.WorkAreaRect;
end;

{$ENDREGION 'Helper methods'}

{$REGION 'MessageDialog methods'}

class function TDialogBuilder.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
  const ACloseDialogProc: TInputCloseDialogProc; ForceCanCancel: Boolean): TDialogForm;
var
  MaxTextWidth: Integer;
  LForm: TDialogForm;
  Button: TButton;
  Layout: TLayout;
  Box: TScrollBox;
  DialogUnits, BorderSize: TPoint;
  WorkArea: TRect;
  TextMargins: TRect;
  Prompt: TLabel;
  DlgBtn: TMsgDlgBtn;
  TextWidth:Integer;
  TextHeight:Integer;
  LinesNeeded: Integer;
  ButtonsTotalWidth: Integer;
  ButtonHeight: Integer;
begin
  WorkArea := GetWorkArea;
  LForm := TDialogForm.CreateNew(Application);
  try
    LForm.FormStyle := TFormStyle.StayOnTop;
    LForm.OnKeyDown := LForm.FormKeyDown;
    LForm.FCloseQueryProc := procedure
      begin
        if Assigned(ACloseDialogProc) then
          ACloseDialogProc(LForm.ModalResult);
      end;

    DialogUnits := GetAveCharSize(LForm.Canvas);
    BorderSize.X := DialogUnits.Y;
    BorderSize.Y := DialogUnits.Y;

    TextMargins.Width := DialogUnits.X * 2;
    TextMargins.Height := DialogUnits.Y * 2;

    //Add AButtons
    Button := TButton.Create(nil);
    try
      ButtonHeight := Ceil(Button.Height);
    finally
      Button.Free;
    end;
    Layout := CreateLayout(LForm, BorderSize, ButtonHeight, TAlignLayout.Bottom, LForm);

    ButtonsTotalWidth := BorderSize.X;
    for DlgBtn in AButtons do
    begin
      Button := CreateButton(LForm, BorderSize, WorkArea, Layout, DlgBtn, LForm.ButtonOnClick);
      ButtonsTotalWidth := ButtonsTotalWidth + Ceil(Button.Width) + BorderSize.X;
      if DlgBtn = DefaultButton then
        Button.Default := True;
//fix or add by flyign wang.
      if DlgBtn = TMsgDlgBtn.mbCancel then
        Button.Cancel := True;
    end;


    MaxTextWidth := GetMaxWidth(WorkArea) - 2*BorderSize.X;
    LinesNeeded := TTextWordWrapping.ComputeLineCount(AMessage, LForm.Canvas, MaxTextWidth, TextWidth);

    TextWidth := Min(MaxTextWidth, TextWidth + BorderSize.X);
    TextHeight := DialogUnits.Y * LinesNeeded;

    LForm.BorderStyle := TFmxFormBorderStyle.Single;
    LForm.BorderIcons := [];
    if ForceCanCancel or (TMsgDlgBtn.mbCancel in AButtons) then
    begin
      LForm.BorderIcons := [TBorderIcon.biSystemMenu];
      LForm.FCanCancel := True;
    end;


    if ADialogType <> TMsgDlgType.mtCustom then
      LForm.Caption := MsgCaptions[ADialogType]
    else
      LForm.Caption := Application.Title;
    LForm.ClientWidth := Max(ButtonsTotalWidth,
      Min(MaxTextWidth, TextWidth + 2 * BorderSize.X + 2 * TextMargins.Width));
    LForm.Position := TFormPosition.ScreenCenter;
    Box := TScrollBox.Create(LForm);
    Box.BeginUpdate;
    try
      Box.Align := TAlignLayout.Client;
      Box.Parent := LForm;

      Prompt := TLabel.Create(LForm);
      Prompt.Margins.Left := TextMargins.Width;
      Prompt.Margins.Right := TextMargins.Width;
      Prompt.Margins.Top := TextMargins.Height;
      Prompt.Text := AMessage;
      Prompt.TextAlign := TTextAlign.Leading;
      Prompt.VertTextAlign := TTextAlign.Leading;
      Prompt.Align := TAlignLayout.Top;
      Prompt.TextSettings.Trimming := TTextTrimming.Character;
      Prompt.WordWrap := True;
      Prompt.Parent := Box;
      Prompt.Height := TextHeight;
      Prompt.AutoSize := True;
    finally
      Box.EndUpdate;
    end;

    LForm.ClientHeight := Min( GetMaxHeight(WorkArea),
      Trunc(Prompt.Margins.MarginRect(Prompt.BoundsRect).Height + Layout.Margins.MarginRect(Layout.BoundsRect).Height));
    LForm.Left := WorkArea.Left + (WorkArea.Width - LForm.ClientWidth) div 2;
    LForm.Top := WorkArea.Top + (WorkArea.Height - LForm.ClientHeight) div 2;
    Result := LForm;
  except
    LForm.DisposeOf;
    Result := nil;
  end;
end;

{$ENDREGION 'MessageDialog methods'}

{$REGION 'InputQuery methods'}

class function TDialogBuilder.InputQuery(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; ACloseQueryProc: TInputCloseQueryProc): TDialogForm;
var
  I: Integer;
  LForm: TDialogForm;
  Prompt: TLabel;
  Edit: TEdit;
  EditWidth: Integer;
  Button: TButton;
  Layout: TLayout;
  Box: TScrollBox;
  DialogUnits, BorderSize: TPoint;
  PromptCount, MaxPromptWidth, TotalHeight: Integer;
  WorkArea: TRect;
  TmpLabel: TLabel;
  ButtonHeight: Integer;
begin
  if Length(ADefaultValues) < Length(APrompts) then
    raise EInvalidOperation.Create(SPromptArrayTooShort);

  PromptCount := Length(APrompts);
  if PromptCount < 1 then
    raise EInvalidOperation.Create(SPromptArrayEmpty);
  WorkArea := GetWorkArea;
  LForm := TDialogForm.CreateNew(Application);
  try
    SetLength(LForm.FValues, PromptCount);
    TArray.Copy<String>(ADefaultValues, LForm.FValues, PromptCount);
    LForm.FormStyle := TFormStyle.StayOnTop;
    LForm.OnKeyDown := LForm.FormKeyDown;
    LForm.FCloseQueryProc := procedure
      begin
        if Assigned(ACloseQueryProc) then
          ACloseQueryProc(LForm.ModalResult, LForm.FValues);
      end;

    DialogUnits := GetAveCharSize(LForm.Canvas);
    BorderSize.X := DialogUnits.Y;
    BorderSize.Y := DialogUnits.Y;

    TmpLabel := TLabel.Create(nil);
    try
      TmpLabel.Parent := LForm;
      TmpLabel.ApplyStyleLookup;
      if LForm.Canvas.BeginScene then
        try
          LForm.Canvas.Font.Assign(TmpLabel.ResultingTextSettings.Font);
          MaxPromptWidth := GetMaxTextWidth(APrompts, DialogUnits, LForm.Canvas);
        finally
          LForm.Canvas.EndScene;
        end
      else
        MaxPromptWidth := GetMaxTextWidth(APrompts, DialogUnits, LForm.Canvas);
    finally
      TmpLabel.Free;
    end;
    LForm.BorderStyle := TFmxFormBorderStyle.Single;
    LForm.BorderIcons := [TBorderIcon.biSystemMenu];
    LForm.Caption := ACaption;

    LForm.Position := TFormPosition.Designed;
    Box := TScrollBox.Create(LForm);
    Box.Align := TAlignLayout.Client;
    Box.Parent := LForm;
    Box.BeginUpdate;
    EditWidth := 0;
    try
      TotalHeight := 0;

      Button := TButton.Create(nil);
      try
        ButtonHeight := Ceil(Button.Height);
      finally
        Button.Free;
      end;

      for I := 0 to PromptCount - 1 do
      begin
        Layout := CreateLayout(LForm, BorderSize, ButtonHeight, TAlignLayout.Top, Box);
        if I = 0 then
          Layout.Margins.Top := BorderSize.Y
        else
          Layout.Margins.Top := 0;
        Edit := TEdit.Create(LForm);
        EditWidth := Ceil(Edit.Width);
        Edit.Parent := Layout;
        Edit.Password := GetPasswordChar(APrompts[I]) <> #0;
        Edit.ApplyStyleLookup;
        Edit.VertTextAlign := TTextAlign.Leading;
        Edit.Text := ADefaultValues[I];
        Edit.SelectAll;
        SetLength(LForm.FEdits, Length(LForm.FEdits) + 1);
        LForm.FEdits[Length(LForm.FEdits) - 1] := Edit;

        Layout.Height := Edit.Height;
        Edit.Align := TAlignLayout.Right;
        Prompt := TLabel.Create(LForm);
        Prompt.Margins.Top := Edit.TextContentRect.Top;
        Prompt.Text := GetPromptCaption(APrompts[I]);
        Prompt.TextAlign := TTextAlign.Leading;
        Prompt.VertTextAlign := TTextAlign.Leading;
        Prompt.Align := TAlignLayout.Client;
        Prompt.VertTextAlign := TTextAlign.Leading;
        Prompt.TextSettings.Trimming := TTextTrimming.Character;
        Prompt.WordWrap := False;
        Prompt.Parent := Layout;
        if I = 0 then
          LForm.ActiveControl := Edit;
        Inc(TotalHeight, Round(Layout.Margins.MarginRect(Layout.BoundsRect).Height));
      end;
    finally
      Box.EndUpdate;
    end;
    Layout := CreateLayout(LForm, BorderSize, ButtonHeight, TAlignLayout.Bottom, LForm);
    Layout.Margins.Bottom := BorderSize.Y;
    Button := CreateButton(LForm, BorderSize, WorkArea, Layout, SMsgDlgOK, mrOk, LForm.ButtonOnClick);
    Button.Default := True;
    Button := CreateButton(LForm, BorderSize, WorkArea, Layout, SMsgDlgCancel, mrCancel, LForm.ButtonOnClick);
//fix or add by flyign wang.
    Button.Cancel := True;
    LForm.FCanCancel := True;

    LForm.ClientWidth := Max(Ceil(Button.Width + BorderSize.X) * 2, Min(GetMaxWidth(WorkArea),
      MaxPromptWidth + Ceil(EditWidth) + 2 * BorderSize.X));

    LForm.ClientHeight := Min(GetMaxHeight(WorkArea),
      Trunc(TotalHeight + Layout.Margins.MarginRect(Layout.BoundsRect).Height));
    LForm.Left := WorkArea.Left + (WorkArea.Width - LForm.ClientWidth) div 2;
    LForm.Top := WorkArea.Top + (WorkArea.Height - LForm.ClientHeight) div 2;
    Result := LForm;
  except
    if LForm <> nil then
      LForm.DisposeOf;
    Result := nil;
  end;
end;

{$ENDREGION 'InputQuery methods'}

{$REGION 'TDialogHelper'}

class procedure TDialogHelper.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
  const ACloseDialogProc: TInputCloseDialogProc; AModalAndSync: Boolean);
var
  LForm: TDialogForm;
begin
  LForm := TDialogBuilder.MessageDialog(AMessage, ADialogType, AButtons, DefaultButton, AHelpCtx,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogProc) then
        ACloseDialogProc(AResult);
    end, False);
  if AModalAndSync then // Only for Win and OSX
    LForm.ShowModal
  else
    LForm.Show;
end;

class procedure TDialogHelper.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const DefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext;
  const ACloseDialogEvent: TInputCloseDialogEvent; const AContext: TObject; AModalAndSync: Boolean);
begin
  MessageDialog(AMessage, ADialogType, AButtons, DefaultButton, AHelpCtx,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogEvent) then
        ACloseDialogEvent(AContext, AResult);
    end, AModalAndSync);
end;

class procedure TDialogHelper.ShowMessage(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc;
  AModalAndSync: Boolean);
var
  LForm: TDialogForm;
begin
  LForm := TDialogBuilder.MessageDialog(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOk], TMsgDlgBtn.mbOk, 0,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogProc) then
        ACloseDialogProc(AResult);
    end, True);
  if AModalAndSync then // Only for Win and OSX
    LForm.ShowModal
  else
    LForm.Show;
end;

class procedure TDialogHelper.ShowMessage(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
  const AContext: TObject; AModalAndSync: Boolean);
begin
  ShowMessage(AMessage,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogEvent) then
        ACloseDialogEvent(AContext, AResult);
    end, AModalAndSync);
end;

class procedure TDialogHelper.InputQuery(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; ACloseQueryProc: TInputCloseQueryProc; AModalAndSync: Boolean);
var
  LForm: TDialogForm;
begin
  LForm := TDialogBuilder.InputQuery(ACaption, APrompts, ADefaultValues,
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if Assigned(ACloseQueryProc) then
        ACloseQueryProc(AResult, Values);
    end);
  if AModalAndSync then // Only for Win and OSX
    LForm.ShowModal
  else
    LForm.Show;
end;

class procedure TDialogHelper.InputQuery(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; const ACloseDialogEvent: TInputCloseQueryWithResultEvent;
  const AContext: TObject; AModalAndSync: Boolean);
begin
  InputQuery(ACaption, APrompts, ADefaultValues,
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if Assigned(ACloseDialogEvent) then
        ACloseDialogEvent(AContext, AResult, Values);
    end, AModalAndSync);
end;

{$ENDREGION TDialogBuilder}

end.
