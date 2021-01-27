unit FlyUtils.ShowMessageWait;

(* ************************************************ *)
(*��������������������������������������������������*)
(*�����޸ģ�������ͷ�� & Flying Wang 2015-02-08���� *)
(*����������������İ�Ȩ�����벻Ҫ�Ƴ���������������*)
(*��������������������������������������������������*)
(*������    ��������ֹ��������ͨ���̡�������  ������*)
(*��������������������������������������������������*)
(*��������������������������������������������������*)
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
    //����������������Ĭ��ֵ
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
