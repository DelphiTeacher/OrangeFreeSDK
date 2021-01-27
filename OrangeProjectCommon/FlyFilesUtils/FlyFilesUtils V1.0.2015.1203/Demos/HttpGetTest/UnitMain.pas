unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FMX.Layouts, FMX.Memo, IdZLibCompressorBase, IdCompressorZLib,
  FMX.Edit, FMX.ScrollBox, FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    ButtonHttpGet: TButton;
    Memo1: TMemo;
    LabelURL: TLabel;
    EditURL: TEdit;
    procedure ButtonHttpGetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses IdURI, IdGlobal, FlyStrUtils;

{$R *.fmx}

//下述代码 VCL FMX 都可以使用。
procedure TFormMain.ButtonHttpGetClick(Sender: TObject);
var
  aIdCompressorZLib: TIdCompressorZLib;
  GStream,
  MStream: TMemoryStream;
  idHttpObj: TIdHTTP;
  url: string;
  aByte: Byte;
  aBytes: TBytes;
begin
  //url := 'http://www.5173.com';     //Ansi
  //url := 'http://sc.5173.com/?question/detail/4981765/0.html'; // UTF8
  //url := 'http://www.aidian123.com/ajax/get/rate/?username=tb5150803';
  //url := 'http://wthrcdn.etouch.cn/weather_mini?city=北京';
  url := EditURL.Text;
  if url.IndexOf('//') < 0 then
  begin
    url := 'http://' + url;
  end;
  url := TIdURI.URLEncode(url); //不编码，中文无法识别。
  MStream := TMemoryStream.Create;
  try
     idHttpObj := TIdHTTP.Create(nil);
      try
        Memo1.Lines.Clear;
        Memo1.Lines.add(url);
        Memo1.Lines.add('正在读取请稍后...');
        Memo1.Lines.add('');
        idHttpObj.AllowCookies := True; //增加兼容性。
        idHttpObj.HandleRedirects := True; //增加兼容性。
        idHttpObj.Request.UserAgent := 'Mozilla/3.0 (compatible)'; //有些网站不喜欢看到 Indy 客户端。
        aIdCompressorZLib := TIdCompressorZLib.Create(nil);
        try
          {$IFDEF IOS}
          //Fix By 爱吃猪头肉。
          //IOS 下 indy 的所有 Zlib 都存在错误。
          //感谢 龟山阿卍 和 [鞍山]古飞 的 测试。
          idHttpObj.Compressor := nil;
          {$ELSE}
          idHttpObj.Compressor := aIdCompressorZLib;
          {$ENDIF}
          //idHttpObj.HTTPOptions := idHttpObj.HTTPOptions + [hoForceEncodeParams];
          //idHttpObj.HandleRedirects := True;
          //idHttpObj.Request.UserAgent := 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Maxthon/4.0 Chrome/30.0.1599.101 Safari/537.36';

          idHttpObj.Get(url, mstream);

          idHttpObj.Compressor := nil;
        finally
          FreeAndNil(aIdCompressorZLib);
        end;
        MStream.Position := 0;
        Memo1.Lines.Clear;
        SetLength(aBytes, MStream.Size);
        MStream.Read(aBytes, MStream.Size);
        //该函数，新增对 GZip 的自动解压。
        Memo1.Lines.Text := BytesAutoToString(aBytes);
        //Memo1.Lines.Text := StreamAutoToString(MStream);
      finally
        FreeAndNil(idHttpObj);
      end;
  finally
    FreeAndNil(MStream);
  end;
end;

end.
