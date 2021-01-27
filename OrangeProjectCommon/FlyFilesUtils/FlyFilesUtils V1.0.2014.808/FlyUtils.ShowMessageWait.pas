unit FlyUtils.ShowMessageWait;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　俐個�紺�郭幎遊扉 & Flying Wang 2015-02-08　　 *)
(*　　　　　　貧中議井幡蕗苧萩音勣卞茅。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　鋤峭窟下欺廓宥利徒。　　　  　　　*)
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
    //絞吭譜崔宸倖危列議潮範峙
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
