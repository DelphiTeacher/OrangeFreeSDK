unit FlyUtils.ShowMessageWait;
//本单元已经废弃。请不要再使用了。
(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-02-08　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses System.SysUtils, System.UITypes;

/// <summary>
///   Show a bocking message box
/// </summary>
procedure ShowMessageWait(const AMessage: string);

procedure ShowMessageFmtWait(const AMessage: string; const AParams: array of const);

procedure ShowMessagePosWait(const AMessage: string; const AX, AY: Integer);


implementation

uses
{$IFDEF ANDROID}
  FMX.VirtualKeyboard.Android,
  FMX.Platform.Android,
{$ENDIF ANDROID}
  FMX.Dialogs;

//Add By Flying Wang.
procedure ShowMessagePosWait(const AMessage: string; const AX, AY: Integer);
begin
{$IFDEF ANDROID}
  MessageDlgPosHelp(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOK], 0, AX, AY, '',
    //故意设置这个错误的默认值
    System.UITypes.TMsgDlgBtn.mbHelp);
{$ELSE}
  MessageDlgPos(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOK], 0, AX, AY);
{$ENDIF ANDROID}
end;


//Fix or Add By Flying Wang
{$IFDEF ANDROID}
procedure ShowMessageWait(const AMessage: string);
var
  RetVal: Integer;
begin
  RetVal := MessageDlg(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOK], 0,
    //故意设置这个错误的默认值
    System.UITypes.TMsgDlgBtn.mbHelp);
end;
{$ELSE}
procedure ShowMessageWait(const AMessage: string);
begin
  ShowMessagePosWait(AMessage, -1, -1);
end;
{$ENDIF ANDROID}

//Add By Flying Wang.
procedure ShowMessageFmtWait(const AMessage: string; const AParams: array of const);
begin
  ShowMessageWait(Format(AMessage, AParams));
end;

end.
