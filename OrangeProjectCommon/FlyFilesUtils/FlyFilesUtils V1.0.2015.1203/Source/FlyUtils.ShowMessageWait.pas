unit FlyUtils.ShowMessageWait;

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


//Add By Flying Wang.
procedure ShowMessageWait(const AMessage: string);
begin
  ShowMessagePosWait(AMessage, -1, -1);
end;

//Add By Flying Wang.
procedure ShowMessageFmtWait(const AMessage: string; const AParams: array of const);
begin
  ShowMessageWait(Format(AMessage, AParams));
end;

end.
