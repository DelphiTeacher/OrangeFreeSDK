unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Net.URLClient,
  WinSock2,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TForm3 = class(TForm)
    memServices: TMemo;
    Button1: TButton;
    memResult: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

function PingIP(AIP: string): Integer;
type
      PIPOptionInformation =  ^TIPOptionInformation;
      TIPOptionInformation = packed   record
                                                TTL:Byte;
                                                TOS:Byte;
                                                Flags:Byte;
                                                OptionsSize:Byte;
                                                OptionsData:PChar;
                                                end;
          PIcmpEchoReply= ^TIcmpEchoReply;
          TIcmpEchoReply = packed   record
                                        Address: DWORD;
                                        Status:DWORD;
                                        RTT:DWORD;
                                        DataSize:Word;
                                        Reserved:Word;
                                        Data:Pointer;
                                        Options:TIPOptionInformation;
                                        end;
          TIcmpCreateFile = function:THandle;stdcall;
          TIcmpCloseHandle= function(IcmpHandle:THandle):Boolean;stdcall;
          TIcmpSendEcho=function(IcmpHandle:THandle;
                                      DestinationAddress:   DWORD;
                                      RequestData:   Pointer;
                                      RequestSize:   Word;
                                      RequestOptions:   PIPOptionInformation;
                                      ReplyBuffer:   Pointer;
                                      ReplySize:   DWord;
                                      Timeout:   DWord
                                      ):DWord;stdcall;
var
        hICMP:THandle;
        hICMPdll:THandle;
        IcmpCreateFile:TIcmpCreateFile;
        IcmpCloseHandle:TIcmpCloseHandle;
        IcmpSendEcho:TIcmpSendEcho;
        pIPE:PIcmpEchoReply;//   ICMP   Echo   reply   buffer
        FIPAddress:DWORD;
        FSize:DWORD;
        FTimeOut:DWORD;
        BufferSize:DWORD;
        pReqData,pRevData:PChar;
        MyString:string;
        AResult:Cardinal;
begin
        Result:=MaxInt;
        hICMPdll:=LoadLibrary('icmp.dll');
        if hICMPdll=0 then   exit;
        @ICMPCreateFile:=GetProcAddress(hICMPdll,'IcmpCreateFile');
        @IcmpCloseHandle:=GetProcAddress(hICMPdll,'IcmpCloseHandle');
        @IcmpSendEcho:=GetProcAddress(hICMPdll, 'IcmpSendEcho');
        hICMP   :=   IcmpCreateFile;
        if (hICMP=INVALID_HANDLE_VALUE) then  exit;
        FIPAddress:=inet_addr(PansiChar(AnsiString(AIP)));//��Ҫ��һ�����
        MyString := 'Hello,World';                                 //send   data   buffer
        pReqData:=PChar(MyString);
        FSize:=40;                                                 //receive   data   buffer
        BufferSize:=SizeOf(TICMPEchoReply)+FSize;
        GetMem(pIPE,BufferSize);
        FillChar(pIPE^,SizeOf(pIPE^), 0);
        GetMem(pRevData,FSize);
        pIPE^.Data:=pRevData;
        FTimeOut:=4000;
        try

          AResult:=IcmpSendEcho(hICMP, FIPAddress,pReqData,
              Length(MyString),nil,pIPE,BufferSize,FTimeOut);
          if AResult>0 then
          begin
            Result:=pIPE.RTT;
          end;
        finally
            IcmpCloseHandle(hICMP);
            FreeLibrary(hICMPdll);
            FreeMem(pRevData);
            FreeMem(pIPE);
        end;
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  I: Integer;
  AServer:String;
  ABeginTicket:Integer;
  ACostTicket:Integer;
  AFastServer:String;
  AFastTicket:Integer;
begin
  memResult.Lines.Clear;


  AFastTicket:=MaxInt;
  AFastServer:='';


  //�������������ٶ�
  for I := 0 to Self.memServices.Lines.Count-1 do
  begin
    AServer:=Self.memServices.Lines[I];
    if AServer<>'' then
    begin

//      //�Ȳ�������
//      try
//        Self.NetHTTPClient1.Get(AServer);
//      finally
//      end;


      //����ʽ����
      ACostTicket:=0;
//      ABeginTicket:=TThread.GetTickCount;
      try
        //Self.NetHTTPClient1.Get(AServer);
        ACostTicket:=PingIP(AServer);
      finally
//        ACostTicket:=TThread.GetTickCount-ABeginTicket;
      end;

      if ACostTicket<AFastTicket then
      begin
        AFastTicket:=ACostTicket;
        AFastServer:=AServer;
      end;
      


      memResult.Lines.Add(AServer+' ��ʱ:'+IntToStr(ACostTicket)+'����');

    end;

  end;


  memResult.Lines.Add('���Խ���,������:'+AFastServer);
  memResult.Lines.Add('');
  memResult.Lines.Add('');


end;

end.
