unit uAliyunOssFileSystem;

interface


//ALIOSS如果WriteFile报错，那么整体也就报错了
//ALIOSS如果没加try except ，那么也会报错,可能会导致解析异常

uses
  Classes,
  ALIOSS,

  IdURI,
  IdGlobal,
  IdGlobalProtocols,

  StrUtils,
  SysUtils,
  DateUtils,
  ALIOSSUTIL,
//  uALIOSSLog,
  uBaseFileSystem;


type
  TAliyunOSSFileSystem=class(TBaseFileSystem)
  private
    function GetWWW:String;
    function HttpProtocal:String;
  public
    FWWW:String;
    FHostName:String;
//    permission: TAliOssVolumnPermission;
    FRootDir:String;
    FAliOssFileSystem:TAliOssFileSystem;


    constructor Create;overload;override;
    constructor Create(const access_id,
                        access_key,
                        //OSS域名
                        hostname,
                        //存储空间
                        bucket,
                        //公司
                        rootdir,
                        www:string;
                        //是否测试
                        debug: boolean;
                        is_use_ssl:boolean;
                        readwritehostname:String);overload;
    destructor Destroy;override;
  public
    //读取文件
    function ReadFile(const AFileName: string;var AContent:TStream): Boolean; overload;override;
    //写入文件
    function WriteFile(const AFileName: string;const AContent: TStream): Boolean; overload; override;
    function GetRelatedFilePath(const AFilePath: string): String;override;
    //文件是否存在
    function FileExists(const AFileName: string): Boolean; override;
    //删除文件
    function DeleteFile(const AFileName: string): Boolean;override;
    //内置文件是否存在
    function RelatedFileExists(const AFileName: string): Boolean;override;
    //取出文件名
    function ExtractFileName(const AFileName: string): string;override;
    function ExtractFilePath(const AFilePath: string): string; override;
    //复制文件
    function CopyRelatedFile(const ASrcFileName:String;const ADestFileName:String;bFailIfExists:Boolean):Boolean;override;



    //获取文件签名
    function GetFilePathSignature(const ADir,AFileName:String):String;




    //获取Html中引用该文件的URL
    //oss.console.aliyun.com
    function GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    function GetFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    //获取邮件正文文件
    //www.fmxui.cn
    function GetBodyFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;



    //创建文件接收流
    function CreateRecvFileStream(const AFileName: string): TStream; overload;override;
    //保存文件接收流
    function SaveRecvFileStream(const AFileName: string;var AStream:TStream): Boolean; override;
  public
    //从OSS读取文件到本地
    function ReadFile(const AFileName: string;const ALocalFilePath: String):Boolean;overload;
    //将本地文件写入到OSS
    function WriteFile(const AFileName: string;const ALocalFilePath: String): Boolean;overload;
  end;


function StandardStrToDateTime(Const Str:String):TDateTime;


implementation

var
  GlobalStandardFmtSettings: TFormatSettings;


function StandardStrToDateTime(Const Str:String):TDateTime;
begin
  if Str='' then
  begin
    Result:=0;
  end
  else
  begin
    Result:=StrToDateTime(Str,GlobalStandardFmtSettings);
  end;
end;


{ TAliyunOSSFileSystem }

function TAliyunOSSFileSystem.CopyRelatedFile(const ASrcFileName,ADestFileName: String; bFailIfExists: Boolean): Boolean;
begin
  Result:=True;
end;

constructor TAliyunOSSFileSystem.Create(const access_id,
                        access_key,
                        hostname,
                        bucket,
                        rootdir,
                        www: string;
                        debug: boolean;
                        is_use_ssl:boolean;
                        readwritehostname:String);
begin
//  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create',
//                                   ' access_id '+access_id
//                                  +' access_key '+access_key
//                                  +' hostname '+hostname
//                                  +' bucket '+bucket
//                                  +' rootdir '+rootdir
//                                  +' www '+www
//                                  +' readwritehostname '+readwritehostname
//                                  );
//
  Create;

//  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create','1');

  FWWW:=www;
  FHostName:=hostname;

  if readwritehostname='' then
  begin
    readwritehostname:=hostname;
  end;

  FRootDir:=rootdir;

//  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create','2');

  try
    //在这里报错

    FAliOssFileSystem:=TAliOssFileSystem.Create(access_id,
                                                access_key,
                                                readwritehostname,
                                                debug,
                                                is_use_ssl
                                                );


//    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create','3');

    FAliOssFileSystem.ChangeVolumn(bucket);

//    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create','4');

//    FAliOssFileSystem.GetVolumnPermission(bucket,permission);
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.Create','GetVolumnPermission');
    end;
  end;


end;

constructor TAliyunOSSFileSystem.Create;
begin
  inherited;
  PathDelim:='/';
end;

function TAliyunOSSFileSystem.CreateRecvFileStream(const AFileName: string): TStream;
begin
  Result:=TMemoryStream.Create;
end;

function TAliyunOSSFileSystem.DeleteFile(const AFileName: string): Boolean;
begin
  Result:=FAliOssFileSystem.RemoveFile(FRootDir+AFileName)
end;

destructor TAliyunOSSFileSystem.Destroy;
begin
  FAliOssFileSystem.Free;
  inherited;
end;

function HexToInt (str:string) : word;
var
   i , value : word;
   pos : word;

begin
   value:=0;
   pos:=length(str);
   for i:=1 to pos  do
   begin
      case str[i] of
      'f','F':
              value := value*16+15;
      'e','E':
              value := value*16+14;
      'd','D':
              value := value*16+13;
      'c','C':
              value := value*16+12;
      'b','B':
              value := value*16+11;
      'a','A':
              value := value*16+10;
      '0'..'9':
              value := value*16+ord(str[i])-ord('0');
      else
         result:=value;
         exit;
      end;
   result:=value;
  end;

end;

function PathDecode(const ASrc: string): string;
const
  UnsafeChars = '*#%<>+ []';  {do not localize}
var
  I: Integer;
//  {$IFDEF UNICODESTRING}
//  J, Len: Integer;
  U: UTF8String;
//  {$ENDIF}
begin
  //%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7.png
  Result := '';    {Do not Localize}
  I := 1;
  while I <= Length(ASrc) do
  begin
    if ASrc[I]='%' then
    begin
      if (Copy(ASrc,I+3,1)='%')
         and (Copy(ASrc,I+6,1)='%')
         and (HexToInt(Copy(ASrc,I+1,2))>128) then
      begin
        U:=AnsiChar(HexToInt(Copy(ASrc,I+1,2)))+AnsiChar(HexToInt(Copy(ASrc,I+4,2)))+AnsiChar(HexToInt(Copy(ASrc,I+7,2)));
        Inc(I,9);
      end
      else
      begin
        U:=AnsiChar(HexToInt(Copy(ASrc,I+1,2)));
        Inc(I,3);
      end;
      Result := Result + U;

    end
    else
    begin
      Result := Result + ASrc[I];
      Inc(I);
    end;
  end;
end;

function TAliyunOSSFileSystem.ExtractFileName(const AFileName: string): string;
var
  AIndex:Integer;
  BIndex:Integer;
begin
  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png?Expires=1449156030'
  //http://amail.oss-cn-hangzhou.aliyuncs.com/ding1ee57ad69b33fe6d/MailParse/TestWrite/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7.png?Expires=1789553760&OSSAccessKeyId=yv0oRxSWNH4PLKGA&Signature=hx4jl8Gi4DGzSg1ljwkF0NqKjLo%3D
  //先转成中文


  //先截断问号
  Result:=PathDecode(AFileName);
  if Pos('?',Result)>0 then
  begin
    Result:=Copy(Result,1,Pos('?',Result)-1);
  end;
  //找到最后一个/
  //然后取出来
  AIndex:=Pos('/',Result);
  BIndex:=AIndex;
  while BIndex>0 do
  begin
    BIndex:=PosEx('/',Result,BIndex+1);
    if BIndex>0 then
    begin
      AIndex:=BIndex;
    end;
  end;
  if AIndex<=0 then
  begin
    AIndex:=1;
  end;
  Result:=Copy(Result,AIndex+1,MaxInt);
end;

function TAliyunOSSFileSystem.ExtractFilePath(const AFilePath: string): string;
var
  AIndex:Integer;
  BIndex:Integer;
begin
  //例如/MailBox/InBox/2015-12-15/1123
  //取出最后一个
  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png?Expires=1449156030'



  //先截断问号
  Result:=AFilePath;

  //找到最后一个/
  //然后取出来
  AIndex:=Pos('/',Result);
  BIndex:=AIndex;
  while BIndex>0 do
  begin
    BIndex:=PosEx('/',Result,BIndex+1);
    if BIndex>0 then
    begin
      AIndex:=BIndex;
    end;
  end;
  if AIndex<=0 then
  begin
    AIndex:=1;
  end;

  Result:=Copy(Result,1,AIndex-1);
end;

function TAliyunOSSFileSystem.FileExists(const AFileName: string): Boolean;
begin
  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.FileExists',FRootDir+AFileName);

  Result:=FAliOssFileSystem.FileExists(FRootDir+AFileName);
end;

function TAliyunOSSFileSystem.GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;
begin
    Result:=TIdURI.PathEncode(
              HttpProtocal
              +FAliOssFileSystem.current_volumn+'.'+FHostName+'/'
            +FRootDir+ADir)
            +UrlEncodeSpecialChar1(TIdURI.PathEncode(AFileName))
            +Self.GetFilePathSignature(ADir,AFileName);
end;

function TAliyunOSSFileSystem.GetBodyFilePath(const ADir, AFileName: String;IsAbsolute: Boolean): String;
begin
  Result:=TIdURI.PathEncode(
            HttpProtocal
            +Self.GetWWW+'/'
            +FRootDir+ADir)
            +UrlEncodeSpecialChar1(TIdURI.PathEncode(AFileName))
          +Self.GetFilePathSignature(ADir,AFileName);
end;

function TAliyunOSSFileSystem.GetFilePath(const ADir, AFileName: String;IsAbsolute: Boolean): String;
begin
  Result:=GetFileUrlPath(ADir,AFileName,IsAbsolute);
end;

function TAliyunOSSFileSystem.GetFilePathSignature(const ADir,AFileName: String): String;
var
  Expires:Int64;
  FTimeStamp:Int64;
  string_to_sign:AnsiString;
begin
  Result:='';
//    if permission=vPrivate then
//    begin


      //http://
      //testmails.oss-cn-hangzhou.aliyuncs.com/
      //fuma/MailParse/1/Fuma_MimePart_3.html
      //?Expires=1449156030
      //&OSSAccessKeyId=5Ix8uZpmUQNYgNPx
      //&Signature=k7gHsIazoBpb/nWv/yhrYbJuJIk%3D

      //Signature = base64(hmac-sha1(AccessKeySecret,
      //          VERB + "\n"
      //          + CONTENT-MD5 + "\n"
      //          + CONTENT-TYPE + "\n"
      //          + EXPIRES + "\n"
      //          + CanonicalizedOSSHeaders
      //          + CanonicalizedResource))

      //'GET'#$A
      //#$A
      //'application/x-www-form-urlencoded'#$A
      //'1454969778'#$A
      //'/fumamails/fuma/中文.eml'

      //  GET
      //  \n
      //  \n
      //  \n
      //  1141889120
      //  \n
      //  /oss-example/oss-api.pdf


      //  'PUT'#$A#$A'text/html'#$A'Thu, 03 Dec 2015 15:23:15 GMT'#$A'/testmails/fuma/MailParse/1/Fuma_MimePart_3.html'




      //1000908851
      //自1970年1月1日 0点0分0秒以来的秒数
      FTimeStamp:=DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now);



      //过期,就是日期,距离1970的秒数
      //       1449414883
      Expires:=FTimeStamp+60*60*24*30*12*10;//一个月
      string_to_sign:=UTF8Encode(
                        'GET'
                        +#$A
                        +#$A
                        //+'application/x-www-form-urlencoded'
                        +#$A
                        +IntToStr(Expires)//+gmdate('D, d M Y H:i:s \G\M\T')
                        +#$A
                        //+TIdURI.URLDecode(
                        +'/'+FAliOssFileSystem.current_volumn+'/'+

//                        TIdURI.PathEncode(
                          FRootDir+ADir+AFileName
//                        )

                      )
                      ;



    //  string_to_sign:='GET'
    //                  +#10
    //                  +#10
    //                  +#10
    //                  +'1449156030'
    //                  +#10
    //                  +'/'+FAliOssFileSystem.current_volumn+PathDelim+FRootDir+AFileName;
      string_to_sign:=Base64Encode(EncryptHMACSha1(string_to_sign, FAliOssFileSystem.oss.access_key));

      Result:='?'+'Expires='+IntToStr(Expires)
              +'&'+'OSSAccessKeyId='+FAliOssFileSystem.oss.access_id
              +'&'+'Signature='+
              UrlEncodeSpecialChar(string_to_sign);




//    end;
end;

function TAliyunOSSFileSystem.GetRelatedFilePath(const AFilePath: string): String;
var
  AUrl:String;
begin
  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png?Expires=1449156030'
  //先截断问号
  Result:=PathDecode(AFilePath);
  if Pos('?',Result)>0 then
  begin
    Result:=Copy(Result,1,Pos('?',Result)-1);
  end;

  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png'
  //解析分解URL
  //如果同是OSS内的邮件,那么邮件存在

  AUrl:=HttpProtocal+FAliOssFileSystem.current_volumn+'.'
        +FHostName+'/'
        +Self.FRootDir;


  if Pos(AUrl,Result)>0 then
  begin
    Result:=Copy(Result,Length(AUrl)+1,MaxInt);
  end;
end;

function TAliyunOSSFileSystem.GetWWW: String;
begin
  if FWWW='' then
  begin
    Result:=Self.FAliOssFileSystem.current_volumn+'.'+FHostName;
  end
  else
  begin
    Result:=FWWW;
  end;
end;

function TAliyunOSSFileSystem.HttpProtocal: String;
begin
  if Self.FAliOssFileSystem.oss.use_ssl then
  begin
    Result:='https://';
  end
  else
  begin
    Result:='http://';
  end;
end;

function TAliyunOSSFileSystem.ReadFile(const AFileName,ALocalFilePath: String): Boolean;
var
  AStream:TStream;
  AFileStream:TFileStream;
begin
  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.ReadFile',AFileName+','+ALocalFilePath);
  Result:=False;
  if ReadFile(AFileName,AStream) and (AStream<>nil) then
  begin
    AStream.Position:=0;
    AFileStream:=TFileStream.Create(ALocalFilePath,fmCreate or fmOpenWrite);
    try
      AFileStream.CopyFrom(AStream,AStream.Size);
      Result:=True;
    finally
      AFileStream.Free;
      AStream.Free;
    end;
  end;
end;

function TAliyunOSSFileSystem.RelatedFileExists(const AFileName: string): Boolean;
var
  AUrl:String;
begin
  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png'
  //解析分解URL
  //如果同是OSS内的邮件,那么邮件存在
  AUrl:=HttpProtocal+FAliOssFileSystem.current_volumn+'.'+FHostName+'/';
  Result:=SameText(Copy(AFileName,1,Length(AUrl)),AUrl);
end;

function TAliyunOSSFileSystem.SaveRecvFileStream(const AFileName: string;var AStream: TStream): Boolean;
begin
  Result:=Self.WriteFile(AFileName,AStream);
end;

function TAliyunOSSFileSystem.ReadFile(const AFileName: string;var AContent:TStream): Boolean;
begin
  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.ReadFile',AFileName);
  Result:=False;
  AContent:=nil;

  if Not FAliOssFileSystem.ReadFile(FRootDir+AFileName,AContent) then
  begin

    FreeAndNil(AContent);

    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.ReadFile','不存在或读取失败'+FRootDir+AFileName);

  end
  else
  begin
    AContent.Position:=0;
    Result:=True;
  end;

end;

function TAliyunOSSFileSystem.WriteFile(const AFileName,ALocalFilePath: String): Boolean;
var
  AFileStream:TFileStream;
begin
  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.WriteFile',AFileName+','+ALocalFilePath);
  Result:=False;
  AFileStream:=TFileStream.Create(ALocalFilePath,fmOpenRead or fmShareDenyNone);
  try
    Result:=WriteFile(AFileName,AFileStream);
  finally
    AFileStream.Free;
  end;
end;

function TAliyunOSSFileSystem.WriteFile(const AFileName: string;const AContent: TStream): Boolean;
begin
  //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.WriteFile',AFileName);
  AContent.Position:=0;

  Result:=FAliOssFileSystem.WriteFile(FRootDir+AFileName,AContent);

  if not Result then
  begin
    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.WriteFile','写入失败'+AFileName);
  end;


end;


initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';



end.
