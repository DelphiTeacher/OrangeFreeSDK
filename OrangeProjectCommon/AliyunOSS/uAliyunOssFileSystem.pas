unit uAliyunOssFileSystem;

interface


//ALIOSS���WriteFile������ô����Ҳ�ͱ�����
//ALIOSS���û��try except ����ôҲ�ᱨ��,���ܻᵼ�½����쳣

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
                        //OSS����
                        hostname,
                        //�洢�ռ�
                        bucket,
                        //��˾
                        rootdir,
                        www:string;
                        //�Ƿ����
                        debug: boolean;
                        is_use_ssl:boolean;
                        readwritehostname:String);overload;
    destructor Destroy;override;
  public
    //��ȡ�ļ�
    function ReadFile(const AFileName: string;var AContent:TStream): Boolean; overload;override;
    //д���ļ�
    function WriteFile(const AFileName: string;const AContent: TStream): Boolean; overload; override;
    function GetRelatedFilePath(const AFilePath: string): String;override;
    //�ļ��Ƿ����
    function FileExists(const AFileName: string): Boolean; override;
    //ɾ���ļ�
    function DeleteFile(const AFileName: string): Boolean;override;
    //�����ļ��Ƿ����
    function RelatedFileExists(const AFileName: string): Boolean;override;
    //ȡ���ļ���
    function ExtractFileName(const AFileName: string): string;override;
    function ExtractFilePath(const AFilePath: string): string; override;
    //�����ļ�
    function CopyRelatedFile(const ASrcFileName:String;const ADestFileName:String;bFailIfExists:Boolean):Boolean;override;



    //��ȡ�ļ�ǩ��
    function GetFilePathSignature(const ADir,AFileName:String):String;




    //��ȡHtml�����ø��ļ���URL
    //oss.console.aliyun.com
    function GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    function GetFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    //��ȡ�ʼ������ļ�
    //www.fmxui.cn
    function GetBodyFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;



    //�����ļ�������
    function CreateRecvFileStream(const AFileName: string): TStream; overload;override;
    //�����ļ�������
    function SaveRecvFileStream(const AFileName: string;var AStream:TStream): Boolean; override;
  public
    //��OSS��ȡ�ļ�������
    function ReadFile(const AFileName: string;const ALocalFilePath: String):Boolean;overload;
    //�������ļ�д�뵽OSS
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
    //�����ﱨ��

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
  //��ת������


  //�Ƚض��ʺ�
  Result:=PathDecode(AFileName);
  if Pos('?',Result)>0 then
  begin
    Result:=Copy(Result,1,Pos('?',Result)-1);
  end;
  //�ҵ����һ��/
  //Ȼ��ȡ����
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
  //����/MailBox/InBox/2015-12-15/1123
  //ȡ�����һ��
  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png?Expires=1449156030'



  //�Ƚض��ʺ�
  Result:=AFilePath;

  //�ҵ����һ��/
  //Ȼ��ȡ����
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
      //'/fumamails/fuma/����.eml'

      //  GET
      //  \n
      //  \n
      //  \n
      //  1141889120
      //  \n
      //  /oss-example/oss-api.pdf


      //  'PUT'#$A#$A'text/html'#$A'Thu, 03 Dec 2015 15:23:15 GMT'#$A'/testmails/fuma/MailParse/1/Fuma_MimePart_3.html'




      //1000908851
      //��1970��1��1�� 0��0��0������������
      FTimeStamp:=DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now);



      //����,��������,����1970������
      //       1449414883
      Expires:=FTimeStamp+60*60*24*30*12*10;//һ����
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
  //�Ƚض��ʺ�
  Result:=PathDecode(AFilePath);
  if Pos('?',Result)>0 then
  begin
    Result:=Copy(Result,1,Pos('?',Result)-1);
  end;

  //'http://fumamails.oss-cn-hangzhou.aliyuncs.com/fuma/mailparse/testparse/fuma_mimepart_11.png'
  //�����ֽ�URL
  //���ͬ��OSS�ڵ��ʼ�,��ô�ʼ�����

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
  //�����ֽ�URL
  //���ͬ��OSS�ڵ��ʼ�,��ô�ʼ�����
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

    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.ReadFile','�����ڻ��ȡʧ��'+FRootDir+AFileName);

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
    //HandleException(nil, 'MailMessage', 'uAliyunOSSFileSystem', 'TAliyunOSSFileSystem.WriteFile','д��ʧ��'+AFileName);
  end;


end;


initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';



end.
