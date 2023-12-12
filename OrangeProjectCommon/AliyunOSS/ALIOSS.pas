unit ALIOSS;
{
  OSS (Open Storage Services) Delphi SDK v1.0.0 - Library
  The MIT License (MIT)
  Copyright (c) 2012 Guangzhou Cloudstrust Software Development Co., Ltd
  http://cloudstrust.com/
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:
  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}
interface

//{$DEFINE USEINDY}
//{$DEFINE USEICS}
{$DEFINE USE_SYS_HTTP}


uses ALIOSSEXP, ALIOSSOPT, SysUtils, IniFiles, Classes,
  {$IFDEF USEINDY}
  IdHTTP, IdHeaderList,
  {$ENDIF}
  {$IFDEF USEICS}
  OverbyteIcsHttpProt,
  {$ENDIF}
  {$IFDEF USE_SYS_HTTP}
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  {$ENDIF}
  uBaseLog,
  uBaseHttpControl,

//  IdIOHandlerSocket,
//  IdIOHandlerStack,
//  IdSSLOpenSSL,
//  IdSSL,
//  uMailMessageLog,

//  uALIOSSLog,
  DateUtils;
//*************************************************************************************
//Consts
//Delphi SDK Consts
const OSS_NAME = 'oss-sdk-delphi';
const OSS_VERSION = '1.0.0';
const OSS_BUILD = '201209230045';
const OSS_AUTHOR = 'menway@gmail.com';
//OSS Server Address
const DEFAULT_OSS_HOST = 'oss.aliyuncs.com';
// OSS Consts
const OSS_BUCKET = 'bucket';
const OSS_OBJECT = 'object';
const OSS_HEADERS = 'headers';
const OSS_METHOD = 'method';
const OSS_QUERY = 'query';
const OSS_BASENAME = 'basename';
const OSS_MAX_KEYS = 'max-keys';
const OSS_UPLOAD_ID = 'uploadId';
const OSS_PART_NUMBER = 'partNumber';
const OSS_MAX_KEYS_VALUE = 1000;
const OSS_MAX_OBJECT_GROUP_VALUE = 1000;
const OSS_FILE_SLICE_SIZE = 8192;
const OSS_PREFIX = 'prefix';
const OSS_DELIMITER = 'delimiter';
const OSS_MARKER = 'marker';
const OSS_CONTENT_MD5 = 'Content-Md5';
const OSS_CONTENT_TYPE = 'Content-Type';
const OSS_CONTENT_TYPE_DEFAULT = 'application/x-www-form-urlencoded'; //new
const OSS_CONTENT_LENGTH = 'Content-Length';
const OSS_IF_MODIFIED_SINCE = 'If-Modified-Since';
const OSS_IF_UNMODIFIED_SINCE = 'If-Unmodified-Since';
const OSS_IF_MATCH = 'If-Match';
const OSS_IF_NONE_MATCH = 'If-None-Match';
const OSS_CACHE_CONTROL = 'Cache-Control';
const OSS_EXPIRES = 'Expires';
const OSS_PREAUTH = 'preauth';
const OSS_CONTENT_COING = 'Content-Coding';
const OSS_CONTENT_DISPOSTION = 'Content-Disposition';
const OSS_RANGE = 'Range';
const OS_CONTENT_RANGE = 'Content-Range';
const OSS_CONTENT = 'content';
const OSS_BODY = 'body';
const OSS_LENGTH = 'length';
const OSS_HOST = 'Host';
const OSS_DATE = 'Date';
const OSS_AUTHORIZATION = 'Authorization';
const OSS_FILE_DOWNLOAD = 'fileDownload';
const OSS_FILE_UPLOAD = 'fileUpload';
const OSS_STREAM_UPLOAD = 'streamUpload';
const OSS_PART_SIZE = 'partSize';
const OSS_SEEK_TO = 'seekTo';
const OSS_SIZE = 'size';
const OSS_QUERY_STRING = 'query_string';
const OSS_SUB_RESOURCE = 'sub_resource';
const OSS_DEFAULT_PREFIX = 'x-oss-';
// URL Consts
const OSS_URL_ACCESS_KEY_ID = 'OSSAccessKeyId';
const OSS_URL_EXPIRES = 'Expires';
const OSS_URL_SIGNATURE = 'Signature';
// HTTP Method Consts
const OSS_HTTP_GET = 'GET';
const OSS_HTTP_PUT = 'PUT';
const OSS_HTTP_HEAD = 'HEAD';
const OSS_HTTP_POST = 'POST';
const OSS_HTTP_DELETE = 'DELETE';
//x-oss
const OSS_ACL = 'x-oss-acl';
//OBJECT GROUP
const OSS_OBJECT_GROUP = 'x-oss-file-group';
//Multi Part
const OSS_MULTI_PART = 'uploads';
//Multi Delete
const OSS_MULTI_DELETE = 'delete';
//OBJECT COPY SOURCE
const OSS_OBJECT_COPY_SOURCE = 'x-oss-copy-source';
//private,only owner
const OSS_ACL_TYPE_PRIVATE = 'private';
//public reand
const OSS_ACL_TYPE_PUBLIC_READ = 'public-read';
//public read write
const OSS_ACL_TYPE_PUBLIC_READ_WRITE = 'public-read-write';
//OSS ACL Definition
const OSS_ACL_TYPES: array[1..3] of string = (
  OSS_ACL_TYPE_PRIVATE,
  OSS_ACL_TYPE_PUBLIC_READ,
  OSS_ACL_TYPE_PUBLIC_READ_WRITE
);

type
  TAliOssReturnType = record
    status: integer;
//    header: TIdHeaderList;
    body: TStringStream;
  end;
  // class: TAliOss
  // converted from php sdk
  TAliOss = class(TObject)
  public
    //Internal attributes
    debug_mode: boolean;            //debug mode?
//    //最大尝试次数
//    max_retries: Integer;           //maximum retry count
//    //当前尝试次数
//    redirects: Integer;             //current retry count
    vhost: string;                  //virtual address
    enable_domain_style: boolean;   //if true, 3-level subdomain is enabled, ie, bucket.oss.aliyuncs.com
    access_id: string;              //OSS API ACCESS ID
    access_key: string;             //OSS API ACCESS KEY
    hostname: string;               //hostname
    port: Integer;
    //Internal methods
//    function ValidateBucket(const bucket: string): boolean;
//    function ValidateObject(const obj: string): boolean;
    function ValidateOptions(const options: TAliOssOption): boolean;
    function ValidateContent(const options: TAliOssOption): boolean;
    function ValidateContentLength(const options: TAliOssOption): boolean;
    function ValidateAndAuth(const opt1, opt2: TAliOssOption): TAliOssReturnType;
    //分段上传
    function GetMultipartCounts(filesize: Int64; part_size: Int64 = 5242880): TAliOssOption;
    function InitiateMultipartUpload(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function UploadPart(const bucket, obj, path, seek_to, len, upload_id, part_number: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function CompleteMultipartUpload(const bucket, obj, upload_id: string; const ETags: TStringList; const options: TAliOssOption = nil): TAliOssReturnType;
    function MakeObjectGroupXml(const bucket: string; const object_array: TStringList): string;
  public
    //*************************************************************************************
    //Getters and Setters
    procedure SetDebugMode(const debug_mode: boolean);
//    procedure SetMaxRetries(const max_retries: Integer = 3);
//    function GetMaxRetries: Integer;
    procedure SetHostname(const hostname: string; const port: Integer = -1);
    procedure SetVHost(const vhost: string);
    procedure SetEnableDomainStyle(const enable_domain_style: boolean = true);

    //*************************************************************************************
    //Requests
    function Auth(const options: TAliOssOption): TAliOssReturnType;
    //*************************************************************************************
    //Service Operations
    function ListBucket(const options: TAliOssOption = nil): TAliOssReturnType;
    //*************************************************************************************
    //Bucket Operations
    function CreateBucket(const bucket: string; const acl: string = OSS_ACL_TYPE_PRIVATE; const options: TAliOssOption = nil): TAliOssReturnType;
    function DeleteBucket(const bucket: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function GetBucketACL(const bucket: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function SetBucketACL(const bucket: string; const acl: string = OSS_ACL_TYPE_PRIVATE; const options: TAliOssOption = nil): TAliOssReturnType;
    //*************************************************************************************
    //Object Operations
    function ListObject(const bucket: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function CreateObjectDir(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function UploadFileByContent(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function UploadFileByFile(const bucket, obj, path: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function UploadFileByStream(const bucket, obj: string;stream:TStream; const options: TAliOssOption = nil): TAliOssReturnType;
    function CopyObject(const from_bucket, from_obj, to_bucket, to_obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function GetObjectMeta(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function DeleteObject(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function DeleteObjects(const bucket: string; const objs: TStringList; const options: TAliOssOption = nil): TAliOssReturnType;
    function GetObject(const bucket, obj: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function ObjectExists(const bucket, obj: string; const options: TAliOssOption = nil): Boolean;
    //*************************************************************************************
    //Multi Part Operations
    function UploadFileByMultipart(const bucket, obj, path: string; part_size: Int64 = 5242880): TAliOssReturnType; overload;
    function ListMultipartUploads(const bucket: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function AbortMultipartUpload(const bucket, obj, upload_id: string; const options: TAliOssOption = nil): TAliOssReturnType;
    function UploadDirByMultipart(const bucket, dir: string; const recursive: boolean = false; const exclude: string = '.|..|.svn'; const options: TAliOssOption = nil): TAliOssReturnType;
    //*************************************************************************************
    //Object Group Operations
    function CreateObjectGroup(const bucket, object_group: string; const object_array: TStringList; const options: TAliOssOption = nil): TAliOssReturnType;
    //*************************************************************************************
    //Constructor
    constructor Create(const access_id, access_key: string; const hostname: string = '';is_use_ssl:Boolean=False;security_token:String='');
    //*************************************************************************************
    //Destructor
    destructor Destroy; override;
  public
    use_ssl: boolean; //use SSL?
    security_token:String;
  end;
  TAliOssVolumnPermission = (vPrivate, vPublicRead, vPublicReadWrite);
  TAliOssVolumnInfo = record
    name: string;
    created: TDateTime;
  end;
  TAliOssVolumnInfoList = array of TAliOssVolumnInfo;
  PAliOssVolumnInfoList = ^TAliOssVolumnInfoList;
  TAliOssFileInfo = record
    name: string;
    modified: TDateTime;
    size: Int64;
    isDir: boolean;
    isFile: boolean;
  end;
  TAliOssFileInfoList = array of TAliOssFileInfo;
  // class: TAliOssFileSystem
  // based on TAliOss
  // provides file-system-like APIs and hides XML details
  TAliOssFileSystem = class(TObject)
  public
    current_volumn: string;
    oss: TAliOss;
  public
    //*************************************************************************************
    //Constructor
    constructor Create(const access_id, access_key: string; const hostname: string = ''; const debug: boolean = false;const is_use_ssl:boolean=false;security_token:String='');
    //*************************************************************************************
    //Destructor
    destructor Destroy; override;
    //*************************************************************************************
    //Account Validation
    function Validate: boolean;
    //*************************************************************************************
    //Volumn Operations (i.e., bucket in AliOss)
    function ListVolumns(var volumns: TAliOssVolumnInfoList): boolean;
    function CreateVolumn(const volumn: string; const permission: TAliOssVolumnPermission = vPrivate): boolean;
    function GetVolumnPermission(const volumn: string; var permission: TAliOssVolumnPermission): boolean;
    function SetVolumnPermission(const volumn: string; const permission: TAliOssVolumnPermission): boolean;
    function RemoveVolumn(const volumn: string; const force: boolean = false): boolean;
    function ChangeVolumn(const volumn: string): boolean;
    //*************************************************************************************
    //Directory Operations
    function CreateDirectory(const directory: string): boolean;
    function ListDirectory(const directory: string; var files: TAliOssFileInfoList; const dirNames: boolean = true): boolean;
    function RemoveDirectory(const directory: string): boolean;
    //*************************************************************************************
    //File Operations
    function ReadFile(const filename: string; var content: string): boolean; overload;
    function ReadFile(const filename: string; var content: TStream): boolean; overload;
    function WriteFile(const filename: string; const content: TStream; const append: boolean = false): boolean; overload;
    function WriteFile(const filename, content: string; const append: boolean = false): boolean; overload;
    function RenameFile(const src, dest: string): boolean;
    function RemoveFile(const filename: string): boolean;
    function UploadFile(const localfile, filename: string): boolean;
    function DownloadFile(const filename, localfile: string): boolean;
    function FileExists(const filename: string): boolean;
  end;

function StandardStrToDateTime(Const Str:String):TDateTime;
implementation
uses ALIOSSUTIL, ALIOSSMIME, IdGlobalProtocols, IdURI,
  Math, XMLIntf, XMLDoc,
  {$IFDEF MSWINDOWS}ActiveX,{$ENDIF}
  HTTPApp//,PerlRegEx
  ;   //RegularExpressions
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

function _IntToHex(Value: Integer; Digits: Integer): AnsiString;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function UrlEncodeSpecialChar(const Url : String) : String;
var
  I : Integer;
  Ch : Char;
begin
  Result := '';
  for I := 1 to Length(Url) do
  begin
    Ch := Url[I];
    if (Word(Ch)>127) or
       ((Ch >= '0') and (Ch <= '9')) or
       ((Ch >= 'a') and (Ch <= 'z')) or
       ((Ch >= 'A') and (Ch <= 'Z')) or
       (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')
        then
    begin
        Result := Result + Ch;
    end
    else
    begin
        Result := Result + '%' + _IntToHex(Ord(Word(Ch)), 2);
    end;
  end;
end;


{$IFDEF USEICS}
type
  TMyHttpCli=class(THttpCli)
    CustomHeaders:TStringList;
    procedure DoHttpBeforeHeaderSend(Sender:TObject;const Method:String;Headers:TStrings);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  end;
{ TMyHttpCli }

constructor TMyHttpCli.Create(AOwner: TComponent);
begin
  inherited;

  Self.OnBeforeHeaderSend:=Self.DoHttpBeforeHeaderSend;
  CustomHeaders:=TStringList.Create;

end;

destructor TMyHttpCli.Destroy;
begin
  CustomHeaders.Free;
  inherited;
end;

procedure TMyHttpCli.DoHttpBeforeHeaderSend(Sender:TObject;const Method:String;Headers:TStrings);
begin
  Headers.AddStrings(Self.CustomHeaders);

//  Headers.SaveToFile('E:\IcsHttpHeaders.txt');
end;
{$ENDIF}


{$IFDEF USEINDY}
type
  TMyIdHttp=class(TIdHttp)
    CustomHeaders:TStringList;
    procedure DoIdHTTPHeadersAvailable(Sender: TObject;AHeaders: TIdHeaderList; var VContinue: Boolean);
  public
    constructor Create;
    destructor Destroy;override;
  end;
{ TMyIdHttp }

constructor TMyIdHttp.Create;
begin
  inherited Create();

  Self.OnHeadersAvailable:=Self.DoIdHTTPHeadersAvailable;

end;

destructor TMyIdHttp.Destroy;
begin
  inherited;
end;

procedure TMyIdHttp.DoIdHTTPHeadersAvailable(Sender: TObject;AHeaders: TIdHeaderList; var VContinue: Boolean);
begin
  Self.Request.RawHeaders.SaveToFile('C:\IdHttpHeaders.txt');
end;
{$ENDIF}


{ TAliOss }
constructor TAliOss.Create(const access_id, access_key, hostname: string;is_use_ssl:Boolean;security_token:String);
begin
  inherited Create;
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Create','1');
  //initialize default values
  self.use_ssl := is_use_ssl;
  self.security_token := security_token;
  self.debug_mode := false;

//  self.max_retries := 3;
//  self.redirects := 0;

  self.enable_domain_style := false;
  self.vhost := '';
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Create','2');

  //validate access_id and access_key
  if access_id = '' then
    raise EAliOssException.Create(EAliOssException.NOT_SET_OSS_ACCESS_ID);
  if access_key = '' then
    raise EAliOssException.Create(EAliOssException.NOT_SET_OSS_ACCESS_KEY);

  self.access_id := access_id;
  self.access_key := access_key;

//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Create','3');
  //validate hostname
  if hostname = '' then
    self.hostname := DEFAULT_OSS_HOST
  else
    self.hostname := hostname;
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Create','4');
end;
procedure TAliOss.SetDebugMode(const debug_mode: boolean);
begin
  self.debug_mode := debug_mode;
end;
procedure TAliOss.SetEnableDomainStyle(const enable_domain_style: boolean);
begin
  self.enable_domain_style := enable_domain_style;
end;
//procedure TAliOss.SetMaxRetries(const max_retries: Integer);
//begin
//  self.max_retries := max_retries;
//end;
procedure TAliOss.SetVHost(const vhost: string);
begin
  self.vhost := vhost;
end;
//function TAliOss.ValidateBucket(const bucket: string): boolean;
//var
//  pattern: string;
//  reg: TPerlRegEx;
//begin
//{
//  bucket naming rules:
//  1. can contain only lowercase letters, numbers, underline(_) and dash(-)
//  2. first character must be a lowercase letter or number
//  3. length must be between 3 to 255
//}
//  pattern := '^[a-z0-9][a-z0-9_\\-]{2,254}$';
//  reg := TPerlRegEx.Create;
//  reg.Subject := bucket;
//  reg.RegEx   := pattern;
//  result :=  reg.Match;
//  reg.Free;
//
//  //result := TRegEx.Match(bucket, pattern).Success;
//
//
//end;
function TAliOss.ValidateContent(const options: TAliOssOption): boolean;
begin
  if (options <> nil) and (options.IndexOfName(OSS_CONTENT) <> -1) then
  begin
    if options.Values[OSS_CONTENT] = '' then
      raise EAliOssException.Create(EAliOssException.OSS_INVALID_HTTP_BODY_CONTENT);
  end
  else
    raise EAliOssException.Create(EAliOssException.OSS_NOT_SET_HTTP_CONTENT);
  result := true;
end;
function TAliOss.ValidateContentLength(const options: TAliOssOption): boolean;
var
  i, errorPos: Integer;
begin
  if (options <> nil) and (options.IndexOfName(OSS_LENGTH) <> -1) then
  begin
    val(options.Values[OSS_LENGTH], i, errorPos);
    if errorPos <> 0 then
      raise EAliOssException.Create(EAliOssException.OSS_INVALID_CONTENT_LENGTH);
    if not(i > 0) then
      raise EAliOssException.Create(EAliOssException.OSS_CONTENT_LENGTH_MUST_MORE_THAN_ZERO);
  end
  else
    raise EAliOssException.Create(EAliOssException.OSS_INVALID_CONTENT_LENGTH);
  result := true;
end;
//function TAliOss.ValidateObject(const obj: string): boolean;
//var
//  pattern: string;
//  reg: TPerlRegEx;
//begin
//{
//  object naming rules:
//  1. length must be between 1 to 1023
//  2. must use UTF-8 encoding
//}
//  pattern := '^.{1,1023}$';
//    reg := TPerlRegEx.Create;
//  reg.Subject := obj;
//  reg.RegEx   := pattern;
//  result :=  (obj <> '') and reg.Match;
//  reg.Free;
//
//  //result := (obj <> '') and (TRegEx.Match(obj, pattern).Success);
//end;
function TAliOss.ValidateOptions(const options: TAliOssOption): boolean;
begin
  result := true;
end;
//function TAliOss.GetMaxRetries: Integer;
//begin
//  result := self.max_retries;
//end;
procedure TAliOss.SetHostname(const hostname: string; const port: Integer);
begin
  if port = -1 then
  begin
    self.hostname := hostname;
  end
  else
  begin
    self.hostname := hostname + ':' + IntToStr(port);
    self.port := port;
  end;
end;

function TAliOss.Auth(const options: TAliOssOption): TAliOssReturnType;
var
  temp: string;
  list_bucket: boolean;
  found: boolean;
  i: integer;
  scheme: string;
  hostname: string;
  resource: string;
  sub_resource: string;
  signable_resource: string;
  signable_resource1: string;
  string_to_sign: AnsiString;
  string_to_sign1: AnsiString;
  headers: TAliOssOption;
  query_string: string;
  signable_query_string: string;
  conjunction: string;
  non_signable_resource: string;
  header_key: string;
  header_value: string;
  signature: string;
  signature1: string;
  fullstream:TStream;
  fullfile: TStringStream;
  request: TStringStream;
  {$IFDEF USEINDY}
  http: TMyIdHttp; //HTTP engine
  {$ENDIF}
  {$IFDEF USEICS}
  http: TMyHttpCli;
  {$ENDIF}
  {$IFDEF USE_SYS_HTTP}
  http: TNetHttpClient;
  {$ENDIF}
//  url:String;

  Expires:Int64;
  FTimeStamp:Int64;


  ARequestMethod:String;
  request_url: string;            //requested URL
  ACustomHeaderPairs:TStringList;
  AHTTPResponse:IHTTPResponse;
//  APosition:Double;
begin



  //create request and response streams
  request := TStringStream.Create('', TEncoding.UTF8);
  result.body := TStringStream.Create('', TEncoding.UTF8);


//  //判断Bucket名称是否是合法的
//  //validate Bucket (except list_bucket)
//  list_bucket := ('/' = options.Values[OSS_OBJECT])
//              and ('' = options.Values[OSS_BUCKET])
//              and (OSS_HTTP_GET = options.Values[OSS_METHOD]);
//  if (not list_bucket) //and (not self.ValidateBucket(options.Values[OSS_BUCKET]))
//    then
//    raise EAliOssException.Create('"'+options.Values[OSS_BUCKET]+'"'+EAliOssException.OSS_BUCKET_NAME_INVALID);
//
//
//
//
//  //判断访问的对象名称是否合法
//  //validate Object
//  if (options.IndexOfName(OSS_OBJECT) <> -1)
////    and (not self.ValidateObject(options.Values[OSS_OBJECT]))
//    then
//      raise EAliOssException.Create('"'+options.Values[OSS_OBJECT]+'"'+EAliOssException.OSS_OBJECT_NAME_INVALID);


  //访问控制
  //validate ACL
//  if options.Lists[OSS_HEADERS].Values[OSS_ACL] <> '' then
//  begin
//    temp := lowercase(options.Lists[OSS_HEADERS].Values[OSS_ACL]);
//    found := false;
//    for I := Low(OSS_ACL_TYPES) to High(OSS_ACL_TYPES) do
//      if temp = OSS_ACL_TYPES[i] then
//      begin
//        found := true;
//        break;
//      end;
//    if not found then
//      raise EAliOssException.Create(options.Values[OSS_HEADERS+':'+OSS_ACL]+':'+EAliOssException.OSS_ACL_INVALID);
//  end;



  //define scheme
  if self.use_ssl then
    scheme := 'https://'
  else
    scheme := 'http://';


  //判断域名
  if self.enable_domain_style or (options.Values[OSS_METHOD]=OSS_HTTP_HEAD) then
  begin
    if self.vhost <> '' then
      hostname := self.vhost
    else
    begin
      if options.Values[OSS_BUCKET] <> '' then
        hostname := options.Values[OSS_BUCKET] + '.' + self.hostname
      else
        hostname := self.hostname;
    end;
  end
  else
  begin
    if options.Values[OSS_BUCKET] <> '' then
      hostname := self.hostname + '/' + options.Values[OSS_BUCKET]
    else
      hostname := self.hostname;
  end;


  //request parameters
  resource := '';
  sub_resource := '';
  signable_resource := '';
  string_to_sign := '';
  string_to_sign1 := '';
  query_string := '';

  //initialize headers
  //用于签名
  headers := TAliOssOption.Create;
  headers.Values[OSS_CONTENT_MD5] := '';
  //资源类型
  if options.IndexOfName(OSS_CONTENT_TYPE) <> -1 then
    headers.Values[OSS_CONTENT_TYPE] := options.Values[OSS_CONTENT_TYPE]
  else
    headers.Values[OSS_CONTENT_TYPE] := OSS_CONTENT_TYPE_DEFAULT;

  //时间
  //Sun, 22 Nov 2015 08:16:38 GMT
  if options.IndexOfName(OSS_DATE) <> -1 then
    headers.Values[OSS_DATE] := options.Values[OSS_DATE]
  else
    headers.Values[OSS_DATE] := gmdate('D, d M Y H:i:s \G\M\T');

  uBaseLog.HandleException(nil,'TAliOss.Auth OSS_DATE:'+headers.Values[OSS_DATE]);

  //域名
  if enable_domain_style then
    headers.Values[OSS_HOST] := hostname
  else
    headers.Values[OSS_HOST] := self.hostname;

  //需要签名的串
  if (options.IndexOfName(OSS_OBJECT) <> -1) and (options.Values[OSS_OBJECT] <> '/') then
  begin
    signable_resource := '/' +
      StringReplace(
        StringReplace(TIdURI.PathEncode(options.Values[OSS_OBJECT]), '%2F', '/', [rfReplaceAll]),
          '&', '%26', [rfReplaceAll]);
    signable_resource1 := '/' +options.Values[OSS_OBJECT];
  end;


//  if options.Lists[OSS_QUERY_STRING]<>nil then
//  begin
//    query_string := options.Lists[OSS_QUERY_STRING].MergeQueries;
//  end;


  signable_query_string := '';
  if options.IndexOfName(OSS_PART_NUMBER) <> -1 then
  begin
    signable_query_string := OSS_PART_NUMBER + '=' + options.Values[OSS_PART_NUMBER];
  end;

  //加上传ID(分段上传)
  if options.IndexOfName(OSS_UPLOAD_ID) <> -1 then
  begin
    if signable_query_string <> '' then
      signable_query_string := signable_query_string + '&';
    signable_query_string := signable_query_string + OSS_UPLOAD_ID + '=' + options.Values[OSS_UPLOAD_ID];
  end;


  //combine HTTP headers
//  if options.Lists[OSS_HEADERS].Count <> 0 then
//  begin
//    headers.Merge(options.Lists[OSS_HEADERS]);
//  end;


  //generate request URL
  conjunction := '?';
  non_signable_resource := '';
  //连接资源
  if options.IndexOfName(OSS_SUB_RESOURCE) <> -1 then
  begin
    signable_resource := signable_resource + conjunction + options.Values[OSS_SUB_RESOURCE];
    signable_resource1 := signable_resource1 + conjunction + options.Values[OSS_SUB_RESOURCE];
    conjunction := '&';
  end;
  if signable_query_string <> '' then
  begin
    signable_query_string := conjunction + signable_query_string;
    conjunction := '&';
  end;
  if query_string <> '' then
  begin
    non_signable_resource := non_signable_resource + conjunction + query_string;
    conjunction := '&';
  end;

  //要访问的url
  request_url := scheme                     //'http://'
                + hostname                  //'oss-cn-hangzhou.aliyuncs.com/amail'
                + signable_resource         //'/ding1ee57ad69b33fe6d/MailBox/InBox/2016-10-17/107'
                + signable_query_string
                + non_signable_resource;






  //create request
  {$IFDEF USEINDY}
  http := TMyIdHttp.Create;
  http.ProtocolVersion := pv1_1;
  {$ENDIF}
  {$IFDEF USEICS}
  http := TMyHttpCli.Create(nil);
  {$ENDIF}
  {$IFDEF USE_SYS_HTTP}
  http:=TNetHttpClient.Create(nil);
  {$ENDIF}
//  APosition:=0;
  ACustomHeaderPairs:=TStringList.Create;

  try
      try
          //在headers中包含签名
          //https://help.aliyun.com/document_detail/31951.html?spm=a2c4g.375247.0.0.74f73a28GSlBq4#concept-aml-vv2-xdb

          //initialize http engine
          {$IFDEF USEINDY}
          http.Request.UserAgent := 'Mozilla/3.0';
          {$ENDIF}
          {$IFDEF USEICS}
          http.Agent:='Mozilla/3.0';
          {$ENDIF}


        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//1


          if (options.Values[OSS_METHOD]=OSS_HTTP_HEAD) then
          begin
            //因为如果文件不存在的时候,Head会卡住
            {$IFDEF USEINDY}
            http.ReadTimeOut:=2000;
            {$ENDIF}
            {$IFDEF USEICS}
            http.TimeOut:=2000;
            {$ENDIF}
          end;


        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//2

          //文件分段上传
          //streaming uploads
          if options.IndexOfName(OSS_FILE_UPLOAD) <> -1 then
          begin
            if options.IndexOfName(OSS_SEEK_TO) <> -1 then
            begin
              //multipart upload
              fullfile := TStringStream.Create;
              fullfile.LoadFromFile(options.Values[OSS_FILE_UPLOAD]);
              fullfile.Seek(StrToInt64(options.Values[OSS_SEEK_TO]), soFromBeginning);
              request.CopyFrom(fullfile, StrToInt64(options.Values[OSS_LENGTH]));
              fullfile.Free;
            end
            else
            begin
              //direct upload
              request.LoadFromFile(options.Values[OSS_FILE_UPLOAD]);
            end;
            if options.Values[OSS_CONTENT_TYPE] = 'application/x-www-form-urlencoded' then
              options.Values[OSS_CONTENT_TYPE] := 'application/octet-stream';
            options.Values[OSS_CONTENT_MD5] := '';
          end;

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//3

          //数据流分段上传
          //streaming uploads
          if options.IndexOfName(OSS_STREAM_UPLOAD) <> -1 then
          begin
            fullstream := TStream(options.Objects[options.IndexOfName(OSS_STREAM_UPLOAD)]);
            if options.IndexOfName(OSS_SEEK_TO) <> -1 then
            begin
              //multipart upload
              fullstream.Seek(StrToInt64(options.Values[OSS_SEEK_TO]), soFromBeginning);
              request.CopyFrom(fullstream, StrToInt64(options.Values[OSS_LENGTH]));
            end
            else
            begin
              //direct upload
              request.LoadFromStream(fullstream);
            end;
            if options.Values[OSS_CONTENT_TYPE] = 'application/x-www-form-urlencoded' then
              options.Values[OSS_CONTENT_TYPE] := 'application/octet-stream';
            //可选,但是必须
            options.Values[OSS_CONTENT_MD5] := '';
          end;

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//4

          //HTTP方法
          if options.IndexOfName(OSS_METHOD) <> -1 then
          begin
            ARequestMethod:=options.Values[OSS_METHOD];
            {$IFDEF USEINDY}
            http.Request.Method := options.Values[OSS_METHOD];
            {$ENDIF}
            {$IFDEF USEICS}
            {$ENDIF}
            string_to_sign := string_to_sign + options.Values[OSS_METHOD] + #10;
            string_to_sign1 := string_to_sign1 + options.Values[OSS_METHOD] + #10;
          end;
        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//5

          if options.IndexOfName(OSS_CONTENT) <> -1 then
          begin
            request.WriteString(options.Values[OSS_CONTENT]);
            {$IFDEF USEINDY}
            http.Request.ContentLength := Length(options.Values[OSS_CONTENT]);
            {$ENDIF}
            {$IFDEF USEICS}
            {$ENDIF}
            headers.Values[OSS_CONTENT_MD5] := HexBase64Encode(MD5(options.Values[OSS_CONTENT]));
          end;
          //在header里面有两个重要的字段，Authorization = "OSS " + AK.Id + ":" + sign，x-oss-security-token则是security token。
          if security_token<>'' then
          begin
            headers.Values['x-oss-security-token']:=security_token;
          end;

          headers.Sort;




        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//6

          {$IFDEF USEINDY}
          http.Request.CustomHeaders.FoldLines:=False;
          {$ENDIF}
          {$IFDEF USEICS}
          http.Request.CustomHeaders.FoldLines:=False;
          {$ENDIF}
          for I := 0 to headers.Count - 1 do
          begin
            header_key := headers.Names[I];
            header_value := headers.ValueFromIndex[I];
            if header_value = #0 then
              header_value := '';


            {$IFDEF USEINDY}
            if header_value <> '' then
              http.Request.CustomHeaders.AddValue(header_key, header_value);
            {$ENDIF}
            {$IFDEF USEICS}
            if (header_value <> '') and (header_key<>OSS_HOST) then
            begin
              //OSS_HOST不需要添加,ICS会自动添加
              http.CustomHeaders.Add(header_key+': '+header_value);
            end;
            {$ENDIF}
            {$IFDEF USE_SYS_HTTP}
            if header_value <> '' then
              ACustomHeaderPairs.AddPair(header_key, header_value);
            {$ENDIF}


            if (lowercase(header_key) = 'content-md5') or
               (lowercase(header_key) = 'content-type') or
               (lowercase(header_key) = 'date') or
               (options.IndexOfName(OSS_PREAUTH) <> -1) then
            begin
                string_to_sign := string_to_sign + header_value + #10;

                if (lowercase(header_key) <> 'content-type') then
                begin
//                  if (lowercase(header_key) = 'date') then
//                  begin
//                    FTimeStamp:=DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now);

//
//                    //过期,就是日期,距离1970的秒数
//                    //       1449414883
//                    Expires:=FTimeStamp+60*60*24*30;//一个月
//                    string_to_sign1 := string_to_sign1 + IntToStr(Expires) + #10;
//                  end
//                  else
//                  begin
                    string_to_sign1 := string_to_sign1 + header_value + #10;
//                  end;
                end
                else
                begin
                    //'content-type'
                    string_to_sign1 := string_to_sign1 + '' + #10;
                end;

            end
            else if copy(lowercase(header_key), 1, 6) = OSS_DEFAULT_PREFIX then
            begin
              //'x-oss-'
              string_to_sign := string_to_sign + lowercase(header_key) + ':' + header_value + #10;
              string_to_sign1 := string_to_sign1 + lowercase(header_key) + ':' + header_value + #10;
            end;
          end;

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//7

          //'GET'#$A#$A'application/x-www-form-urlencoded'#$A'Tue, 22 Nov 2016 08:16:25 GMT'#$A
          if options.Values[OSS_BUCKET]<>'' then
          begin
            string_to_sign := string_to_sign + '/' + options.Values[OSS_BUCKET];
            string_to_sign1 := string_to_sign1 + '/' + options.Values[OSS_BUCKET];
          end;
          if (self.enable_domain_style)
            and (options.Values[OSS_BUCKET]<>'')
            and (options.Values[OSS_OBJECT] = '/') then
          begin
            string_to_sign := string_to_sign + '/';
            string_to_sign1 := string_to_sign1 + '/';
          end;
        //  string_to_sign := string_to_sign + '/' + 'whatsappchats1';
        //  string_to_sign1 := string_to_sign1 + '/' + 'whatsappchats1';

          //'GET'#$A#$A'application/x-www-form-urlencoded'#$A'Tue, 22 Nov 2016 08:16:25 GMT'#$A'/amail/ding1ee57ad69b33fe6d/MailBox/InBox/2016-10-17/107'
          string_to_sign := string_to_sign +
              signable_resource1
             + TIdURI.URLDecode(signable_query_string);

          string_to_sign1 := string_to_sign1 +
              signable_resource1
             + TIdURI.URLDecode(signable_query_string);

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//8

          //'PUT'#$A#$A'text/plain'#$A'Tue, 27 Jul 2021 14:11:42 GMT'#$A'/whatsappchats1/a.txt'
          //PUT'#$A#$A'text/plain'#$A'Tue, 27 Jul 2021 14:41:08 GMT'#$A'/whatsappchats1/whatsappchats1/a.txt
          //convert encoding to UTF-8
          string_to_sign := UTF8Encode(string_to_sign);
          string_to_sign1 := UTF8Encode(string_to_sign1);

          //'gB1wl7zA4M32cswYQXAAF8SBpMs='
          signature := Base64Encode(EncryptHMACSha1(string_to_sign, self.access_key));

          signature1 := Base64Encode(EncryptHMACSha1(string_to_sign1, self.access_key));

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//9

          {$IFDEF USEINDY}
          http.Request.CustomHeaders.AddValue('Authorization', 'OSS ' + self.access_id + ':' + signature);
          {$ENDIF}
          {$IFDEF USEICS}
          http.CustomHeaders.Add('Authorization' +': '+ 'OSS ' + self.access_id + ':' + signature);
          {$ENDIF}
          {$IFDEF USE_SYS_HTTP}
          ACustomHeaderPairs.AddPair('Authorization','OSS ' + self.access_id + ':' + signature);
          {$ENDIF}

        //  //在header里面有两个重要的字段，Authorization = "OSS " + AK.Id + ":" + sign，x-oss-security-token则是security token。
        //  if security_token<>'' then
        //  begin
        //    {$IFDEF USEINDY}
        //    http.Request.CustomHeaders.AddValue('x-oss-security-token', security_token);
        //    {$ELSE}
        //    //OSS_HOST不需要添加,ICS会自动添加
        //    http.CustomHeaders.Add('x-oss-security-token'+': '+security_token);
        //    {$ENDIF}

        //
        //  end;


          if options.Values[OSS_PREAUTH] > '0' then
          begin
            result.body := TStringStream.Create(request_url + conjunction
                                                + OSS_URL_ACCESS_KEY_ID + '=' + self.access_id
                                                + '&' + OSS_URL_EXPIRES + '=' + options.Values[OSS_PREAUTH]
                                                + '&' + OSS_URL_SIGNATURE + signature
                                                );
            exit;
          end
          else if options.Values[OSS_PREAUTH] <> '' then
          begin
            result.body := TStringStream.Create(request_url);
            exit;
          end
          else
          begin
          end;
        //
        //  if security_token<>'' then
        //  begin
        //    result.body := TStringStream.Create('x-oss-security-token='+Self.security_token);
        //  end;
        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//10

          //'http://oss-cn-hangzhou.aliyuncs.com/amail/ding1ee57ad69b33fe6d/MailBox/InBox/2016-10-17/107?Expires=1482424226&OSSAccessKeyId=yv0oRxSWNH4PLKGA&Signature=Fksmwh%2Fyi%2FjtXMcPkqElErwzVDQ%3D'
        //  url:=request_url+'?'+'Expires='+IntToStr(Expires)
        //          +'&'+'OSSAccessKeyId='+Self.access_id
        //          +'&'+'x-oss-security-token='+Self.security_token
        ////          +'&'+'Signature='+
        ////          UrlEncodeSpecialChar(
        ////                  signature1
        ////                  )
        //                  ;

        //  APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//11

            if //http.Request.Method
              ARequestMethod= OSS_HTTP_GET then
            begin
                {$IFDEF USEINDY}
                http.Get(request_url, result.body);
                {$ENDIF}
                {$IFDEF USEICS}
                http.URL:=request_url;
                http.RcvdStream:=result.body;
                http.Get;//(request_url, result.body);
                {$ENDIF}
            end
            else if //http.Request.Method
              ARequestMethod= OSS_HTTP_PUT then
            begin
                {$IFDEF USEINDY}
                http.Put(request_url,request, result.body);
        //        http.Put(url, request, result.body);
                {$ENDIF}
                {$IFDEF USEICS}
                http.URL:=request_url;
        //        http.Options
                request.Position:=0;
                http.SendStream:=request;
                http.RcvdStream:=result.body;
                http.Put;//(request_url, request, result.body);
                {$ENDIF}
                {$IFDEF USE_SYS_HTTP}
                AHTTPResponse:=http.Put(request_url,request,result.body,GetCustomHeader(ACustomHeaderPairs))
                {$ENDIF}
            end
            else if //http.Request.Method
              ARequestMethod= OSS_HTTP_HEAD then
            begin
                {$IFDEF USEINDY}
                http.Head(request_url);
                {$ENDIF}
                {$IFDEF USEICS}
                http.URL:=request_url;
                http.Head;//(request_url);
                {$ENDIF}
            end
            else if //http.Request.Method
              ARequestMethod= OSS_HTTP_POST then
            begin
                {$IFDEF USEINDY}
                http.Post(request_url, request, result.body);
                {$ENDIF}
                {$IFDEF USEICS}
                http.URL:=request_url;
                request.Position:=0;
                http.SendStream:=request;
                http.RcvdStream:=result.body;
                http.Post;//(request_url, request, result.body);
                {$ENDIF}
            end
            else if //http.Request.Method
              ARequestMethod= OSS_HTTP_DELETE then
            begin
                {$IFDEF USEINDY}
                http.Delete(request_url);
                {$ENDIF}
                {$IFDEF USEICS}
                http.URL:=request_url;
                http.Del;
                {$ENDIF}
            end
            ;

          //APosition:=APosition+1;//HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',FloatToStr(APosition));//12



        //  self.redirects := 0;
          {$IFDEF USEINDY}
          result.status := http.ResponseCode;
          {$ENDIF}
          {$IFDEF USEICS}
          result.status:=http.StatusCode;
          {$ENDIF}
          {$IFDEF USE_SYS_HTTP}
          result.status:=AHTTPResponse.StatusCode;
          {$ENDIF}


        //  result.header := TIdHeaderList.Create;
        //  result.header.Assign(http.Response.RawHeaders);


          //wn 会死循环
        //  if (http.ResponseCode = 400 {Bad Request}) or
        //     (http.ResponseCode = 500 {Internal Error}) or
        //     (http.ResponseCode = 503 {Service Unavailable}) then
        //  begin
        //    if self.redirects <= self.max_retries then
        //    begin
        //
        //      //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',ALogID+' 14 '+FloatToStr(APos));APos:=APos+1;;
        //
        //      Sleep(Trunc(100 * Power(4, self.redirects)));
        //      inc(self.redirects);
        //      result := self.Auth(options);
        //
        //      //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOss.Auth',ALogID+' 15 '+FloatToStr(APos));APos:=APos+1;;
        //
        //    end;
        //
        //  end;

      except
        on E:Exception do
        begin
          HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOss.Auth');
        end;
      end;
  //release resources
  finally
    http.Free;
    result.body.Free;
    request.Free;
    headers.Free;
    ACustomHeaderPairs.Free;
  end;
end;
function TAliOss.ValidateAndAuth(const opt1, opt2: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  //options
  self.ValidateOptions(opt1);
  if opt2 = nil then
    opt := TAliOssOption.Create
  else
    opt := opt2;
  opt.Merge(opt1);
  result := self.Auth(opt);
  if opt2 = nil then
    opt.Free;
end;
function TAliOss.MakeObjectGroupXml(const bucket: string;
  const object_array: TStringList): string;
var
  xml: string;
  index: integer;
  I: Integer;
  object_meta: TAliOssReturnType;
begin
  xml := '<CreateFileGroup>';
  if object_array.Count > OSS_MAX_OBJECT_GROUP_VALUE then
    raise EAliOssException.Create(EAliOssException.OSS_OBJECT_GROUP_TOO_MANY_OBJECT);
//  index := 1;
//  for I := 0 to object_array.Count - 1 do
//  begin
//    object_meta := self.GetObjectMeta(bucket, object_array[I]);
//    if (object_meta.status = 200) and (object_meta.header.Values['etag'] <> '') then
//    begin
//      xml := xml + '<Part>';
//      xml := xml + '<PartNumber>'+IntToStr(index)+'</PartNumber>';
//      xml := xml + '<PartName>'+object_array[I]+'</PartName>';
//      xml := xml + '<ETag>'+object_meta.header.Values['etag']+'</ETag>';
//      xml := xml + '</Part>';
//
//      inc(index);
//    end;
//  end;
  xml := xml + '</CreateFileGroup>';
  result := xml;
end;
function TAliOss.ListBucket(const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := '';
  opt.Values[OSS_METHOD] := OSS_HTTP_GET;
  opt.Values[OSS_OBJECT] := '/';
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.CreateBucket(const bucket: string;
  const acl: string = OSS_ACL_TYPE_PRIVATE ; const options: TAliOssOption = nil): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := '/';
  opt.Lists[OSS_HEADERS].Values[OSS_ACL] := acl;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.DeleteBucket(const bucket: string;
  const options: TAliOssOption = nil): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_DELETE;
  opt.Values[OSS_OBJECT] := '/';
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.GetBucketACL(const bucket: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_GET;
  opt.Values[OSS_OBJECT] := '/';
  opt.Values[OSS_SUB_RESOURCE] := 'acl';
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.SetBucketACL(const bucket: string; const acl: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := '/';
  opt.Lists[OSS_HEADERS].Values[OSS_ACL] := acl;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.ListObject(const bucket: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_GET;
  opt.Values[OSS_OBJECT] := '/';
  if options <> nil then
  begin
    if options.IndexOfName(OSS_DELIMITER) <> -1 then
      opt.Lists[OSS_HEADERS].Values[OSS_DELIMITER] := options.Values[OSS_DELIMITER]
    else
      opt.Lists[OSS_HEADERS].Values[OSS_DELIMITER] := '/';
    if options.IndexOfName(OSS_PREFIX) <> -1 then
      opt.Lists[OSS_HEADERS].Values[OSS_PREFIX] := options.Values[OSS_PREFIX]
    else
      opt.Lists[OSS_HEADERS].Values[OSS_PREFIX] := '';
    if options.IndexOfName(OSS_MAX_KEYS) <> -1 then
      opt.Lists[OSS_HEADERS].Values[OSS_MAX_KEYS] := options.Values[OSS_MAX_KEYS]
    else
      opt.Lists[OSS_HEADERS].Values[OSS_MAX_KEYS] := IntToStr(OSS_MAX_KEYS_VALUE);
    if options.IndexOfName(OSS_MARKER) <> -1 then
      opt.Lists[OSS_HEADERS].Values[OSS_MARKER] := options.Values[OSS_MARKER]
    else
      opt.Lists[OSS_HEADERS].Values[OSS_MARKER] := '';
  end;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.CreateObjectDir(const bucket, obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := obj + '/';
  opt.Lists[OSS_CONTENT_LENGTH].Values[OSS_CONTENT_LENGTH] := IntToStr(0);
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.UploadFileByContent(const bucket, obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
  p: Integer;
  basename: string;
  extension: string;
  content_type: string;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  self.ValidateContent(options);
  p := LastPos('/', obj);
  basename := copy(obj, p+1, MaxInt);
  p := LastPos('.', basename);
  extension := copy(basename, p+1, MaxInt);
  content_type := GetMimeType(LowerCase(extension));
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := obj;
  if options <> nil then
  begin
    if options.Values[OSS_LENGTH] <> '' then
      opt.Values[OSS_CONTENT_LENGTH] := IntToStr(Length(options.Values[OSS_CONTENT]))
    else
      opt.Values[OSS_CONTENT_LENGTH] := options.Values[OSS_CONTENT_LENGTH];
    if (options.Values[OSS_CONTENT_TYPE] = '') and (content_type <> '') then
      opt.Values[OSS_CONTENT_TYPE] := content_type;
  end;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.UploadFileByStream(const bucket, obj: string;stream:TStream; const options: TAliOssOption = nil): TAliOssReturnType;
var
  opt: TAliOssOption;
  filesize: Int64;
  p: Integer;
  extension: string;
  content_type: string;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
//  IsEmpty(path, EAliOssException.OSS_FILE_PATH_IS_NOT_ALLOWED_EMPTY);
//  if not FileExists(path) then
//    raise EAliOssException.Create(EAliOssException.OSS_FILE_NOT_EXIST);
  filesize := stream.size;//FileSizeByName(path);
  p := LastPos('.', obj);
  extension := copy(obj, p+1, MaxInt);
  content_type := GetMimeType(LowerCase(extension));
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_STREAM_UPLOAD] := '';
  opt.Objects[options.IndexOfName(OSS_STREAM_UPLOAD)]:=stream;
  opt.Values[OSS_CONTENT_TYPE] := content_type;
  opt.Values[OSS_CONTENT_LENGTH] := IntToStr(filesize);
  if options <> nil then
  begin
    if options.Values[OSS_LENGTH] <> '' then
      opt.Values[OSS_CONTENT_LENGTH] := IntToStr(Length(options.Values[OSS_CONTENT]))
    else
      opt.Values[OSS_CONTENT_LENGTH] := options.Values[OSS_CONTENT_LENGTH];
    if (options.Values[OSS_CONTENT_TYPE] = '') and (content_type <> '') then
      opt.Values[OSS_CONTENT_TYPE] := content_type;
  end;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;

function TAliOss.UploadFileByFile(const bucket, obj, path: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
  filesize: Int64;
  p: Integer;
  extension: string;
  content_type: string;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(path, EAliOssException.OSS_FILE_PATH_IS_NOT_ALLOWED_EMPTY);
  if not FileExists(path) then
    raise EAliOssException.Create(EAliOssException.OSS_FILE_NOT_EXIST);
  filesize := FileSizeByName(path);
  p := LastPos('.', path);
  extension := copy(path, p+1, MaxInt);
  content_type := GetMimeType(LowerCase(extension));
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_FILE_UPLOAD] := path;
  opt.Values[OSS_CONTENT_TYPE] := content_type;
  opt.Values[OSS_CONTENT_LENGTH] := IntToStr(filesize);
  if options <> nil then
  begin
    if options.Values[OSS_LENGTH] <> '' then
      opt.Values[OSS_CONTENT_LENGTH] := IntToStr(Length(options.Values[OSS_CONTENT]))
    else
      opt.Values[OSS_CONTENT_LENGTH] := options.Values[OSS_CONTENT_LENGTH];
    if (options.Values[OSS_CONTENT_TYPE] = '') and (content_type <> '') then
      opt.Values[OSS_CONTENT_TYPE] := content_type;
  end;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.CopyObject(const from_bucket, from_obj, to_bucket,
  to_obj: string; const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(from_bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(to_bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(from_obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(to_obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := to_bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := to_obj;
  opt.Lists[OSS_HEADERS].Values[OSS_OBJECT_COPY_SOURCE] := '/'+from_bucket+'/'+from_obj;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.GetObjectMeta(const bucket, obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_HEAD;
  opt.Values[OSS_OBJECT] := obj;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.DeleteObject(const bucket, obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_DELETE;
  opt.Values[OSS_OBJECT] := obj;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.DeleteObjects(const bucket: string; const objs: TStringList;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
  xml: IXMLDocument;
  del: IXMLNode;
  node: IXMLNode;
  quiet: string;
  I: integer;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_POST;
  opt.Values[OSS_OBJECT] := '/';
  opt.Values[OSS_SUB_RESOURCE] := 'delete';
  opt.Values[OSS_CONTENT_TYPE] := 'application/xml';
  {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
  begin
    xml := NewXMLDocument;
    xml.LoadFromXML('<?xml version="1.0" encoding="utf-8"?><Delete></Delete>');
    //Quiet mode?
    if options <> nil then
    begin
      if options.Values['quiet'] <> '' then
      begin
        if options.Values['quiet'] = 'true' then
          quiet := 'true'
        else
          quiet := 'false';
        xml.AddChild('Quiet', quiet);
      end;
    end;
    del := xml.ChildNodes.FindNode('Delete');
    // Add the objects
    for I := 0 to objs.Count - 1 do
    begin
      node := del.AddChild('Object');
      node := node.AddChild('Key');
      node.Text := HTMLEscape(objs[i]);
    end;
    opt.Values[OSS_CONTENT] := FormatXml(xml);
  end;
  {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.GetObject(const bucket, obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);

  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_GET;
  opt.Values[OSS_OBJECT] := obj;

  if options <> nil then
  begin
    if options.Values['lastmodified'] <> '' then
    begin
      opt.Lists[OSS_HEADERS].Values[OSS_IF_MODIFIED_SINCE] := options.Values['lastmodified'];
      options.Values['lastmodified'] := '';
    end;
    if options.Values['etag'] <> '' then
    begin
      opt.Lists[OSS_HEADERS].Values[OSS_IF_NONE_MATCH] := options.Values['etag'];
      options.Values['etag'] := '';
    end;
    if options.Values['range'] <> '' then
    begin
      opt.Lists[OSS_HEADERS].Values[OSS_RANGE] := 'bytes=' + options.Values['range'];
      options.Values['range'] := '';
    end;
  end;


  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.ObjectExists(const bucket, obj: string;
  const options: TAliOssOption): Boolean;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_HEAD;
  opt.Values[OSS_OBJECT] := obj;
  result := self.GetObjectMeta(bucket, obj ,opt).status = 200;
  opt.Free;
end;
function TAliOss.UploadFileByMultipart(const bucket, obj, path: string;
  part_size: Int64): TAliOssReturnType;
var
  response: TAliOssReturnType;
  xml: IXMLDocument;
  UploadId: string;
  parts: TAliOssOption;
  I: Integer;
  ETags: TStringList;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  if not FileExists(path) then
    raise EAliOssException.Create(EAliOssException.OSS_FILE_NOT_EXIST);
  if FileSizeByName(path) < 5242880 then //<5M, use direct upload
  begin
    result := self.UploadFileByFile(bucket, obj, path, nil);
  end
  else
  begin
    //initiate multipart upload
    response := self.InitiateMultipartUpload(bucket, obj, nil);
    if response.status = 200 then
    begin
      {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
      begin
        xml := NewXMLDocument;
        xml.LoadFromXML(response.body.DataString);
        //get upload id
        UploadId := xml.ChildNodes.FindNode('InitiateMultipartUploadResult').ChildNodes.FindNode('UploadId').Text;
      end;
      {$IFDEF MSWINDOWS}CoUninitialize{$ENDIF};
      //calculate part size
      parts := self.GetMultipartCounts(FileSizeByName(path), part_size);
      //part upload
      ETags := TStringList.Create;
      //TODO: multi-thread
      for I := 0 to parts.Count - 1 do //for each part
      begin
        response := UploadPart(bucket, obj, path,
          parts.Lists[IntToStr(i)].Values[OSS_SEEK_TO],
          parts.Lists[IntToStr(i)].Values[OSS_LENGTH], UploadId, IntToStr(i+1));
//        ETags.Add(response.header.Values['ETag']);
      end;
      //complete multipart upload
      self.CompleteMultipartUpload(bucket, obj, UploadId, ETags);
    end;
  end;
end;
function TAliOss.GetMultipartCounts(filesize, part_size: Int64): TAliOssOption;
var
  i: integer;
  sizecount: Int64;
begin
  result := TAliOssOption.Create;
  i := 0;
  sizecount := filesize;
  if part_size <= 5242880 then
    part_size := 5242880        //5M
  else if part_size > 524288000 then
    part_size := 524288000      //500M
  else
    part_size := 52428800;      //50M
  while sizecount > 0 do
  begin
    sizecount := sizecount - part_size;
    result.Lists[IntToStr(i)].Values[OSS_SEEK_TO] := IntToStr(part_size * i);
    if sizecount > 0 then
      result.Lists[IntToStr(i)].Values[OSS_LENGTH] := IntToStr(part_size)
    else
      result.Lists[IntToStr(i)].Values[OSS_LENGTH] := IntToStr(sizecount + part_size);
    inc(i);
  end;
end;
function TAliOss.InitiateMultipartUpload(const bucket: string;
  const obj: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_POST;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_SUB_RESOURCE] := 'uploads';
  opt.Values[OSS_CONTENT] := '';
  opt.Lists[OSS_HEADERS].Values[OSS_CONTENT_TYPE] := 'application/octet-stream';
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.UploadPart(const bucket, obj, path, seek_to, len, upload_id, part_number: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_PUT;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_UPLOAD_ID] := upload_id;
  opt.Values[OSS_PART_NUMBER] := part_number;
  opt.Values[OSS_FILE_UPLOAD] := path;
  opt.Values[OSS_SEEK_TO] := seek_to;
  opt.Values[OSS_LENGTH] := len;
  if options <> nil then
  begin
    if options.Values[OSS_LENGTH]<>'' then
      opt.Values[OSS_CONTENT_LENGTH] := options.Values[OSS_LENGTH];
  end;
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.CompleteMultipartUpload(const bucket, obj, upload_id: string;
  const ETags: TStringList;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
  xml: IXMLDocument;
  root, node: IXMLNode;
  I: Integer;
begin
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_POST;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_UPLOAD_ID] := upload_id;
  opt.Values[OSS_CONTENT_TYPE] := 'application/xml';
  {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
  begin
    xml := NewXMLDocument;
    xml.LoadFromXML('<?xml version="1.0" encoding="utf-8"?><CompleteMultipartUpload></CompleteMultipartUpload>');
    root := xml.ChildNodes.FindNode('CompleteMultipartUpload');
    for I := 0 to ETags.Count-1 do
    begin
      node := root.AddChild('Part');
      node.AddChild('PartNumber').Text := IntToStr(i+1);
      node.AddChild('ETag').Text := ETags[i];
    end;
    opt.Values[OSS_CONTENT] := FormatXml(xml);
  end;
  {$IFDEF MSWINDOWS}CoUninitialize{$ENDIF};
  result := ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.ListMultipartUploads(const bucket: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_GET;
  opt.Values[OSS_OBJECT] := '/';
  opt.Values[OSS_SUB_RESOURCE] := 'uploads';
  if options <> nil then
  begin
    if options.Values['key-marker'] <> '' then
    begin
      options.Lists[OSS_QUERY_STRING].Values['key-marker'] := options.Values['key-marker'];
      options.Values['key-marker'] := '';
    end;
    if options.Values['max-uploads'] <> '' then
    begin
      options.Lists[OSS_QUERY_STRING].Values['max-uploads'] := options.Values['max-uploads'];
      options.Values['max-uploads'] := '';
    end;
    if options.Values['upload-id-marker'] <> '' then
    begin
      options.Lists[OSS_QUERY_STRING].Values['upload-id-marker'] := options.Values['upload-id-marker'];
      options.Values['upload-id-marker'] := '';
    end;
  end;
  result := self.ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.AbortMultipartUpload(const bucket, obj, upload_id: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(obj, EAliOssException.OSS_OBJECT_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_DELETE;
  opt.Values[OSS_OBJECT] := obj;
  opt.Values[OSS_UPLOAD_ID] := upload_id;
  result := self.ValidateAndAuth(options, opt);
  opt.Free;
end;
function TAliOss.UploadDirByMultipart(const bucket, dir: string;
  const recursive: boolean; const exclude: string;
  const options: TAliOssOption): TAliOssReturnType;
var
  files: TStringList;
  filename: String;
  I: Integer;
  dir2: string;
begin
  if Copy(dir, length(dir), 1) = '\' then
    dir2 := Copy(dir, 1, length(dir) - 1)
  else
    dir2 := dir;
  //validate dir
  if not DirectoryExists(dir2) then
    raise EAliOssException.Create(EAliOssException.OSS_INVALID_DIRECTORY);
  //get file list
  files := TStringList.Create;
  GetFilesInDirectory(PChar(dir), files, recursive, exclude);
  if files.Count = 0 then
    exit;
  for I := 0 to files.Count-1 do
  begin
    filename := Copy(files[I], length(dir2)+2, MaxInt);
    filename := StringReplace(filename, '\', '/', [rfReplaceAll]);
    self.UploadFileByMultipart(bucket, filename, files[I]);
  end;
  files.Free;
end;
function TAliOss.CreateObjectGroup(const bucket, object_group: string;
  const object_array: TStringList;
  const options: TAliOssOption): TAliOssReturnType;
var
  opt: TAliOssOption;
begin
  IsEmpty(bucket, EAliOssException.OSS_BUCKET_IS_NOT_ALLOWED_EMPTY);
  IsEmpty(object_group, EAliOssException.OSS_OBJECT_GROUP_IS_NOT_ALLOWED_EMPTY);
  opt := TAliOssOption.Create;
  opt.Values[OSS_BUCKET] := bucket;
  opt.Values[OSS_METHOD] := OSS_HTTP_POST;
  opt.Values[OSS_OBJECT] := object_group;
  opt.Values[OSS_CONTENT_TYPE] := 'txt/xml';
  opt.Values[OSS_SUB_RESOURCE] := 'group';
  opt.Values[OSS_CONTENT] := self.MakeObjectGroupXml(bucket, object_array);
  result := self.ValidateAndAuth(options, opt);
  opt.Free;
end;
destructor TAliOss.Destroy;
begin
  //release internal reources
  inherited Destroy;
end;
{ TAliOssFileSystem }
function TAliOssFileSystem.ChangeVolumn(const volumn: string): boolean;
begin
  self.current_volumn := volumn;
  result := true;
end;
constructor TAliOssFileSystem.Create(const access_id, access_key, hostname: string; const debug: boolean;const is_use_ssl:boolean;security_token:String);
begin
  inherited Create;

//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.Create','1');
  self.current_volumn := '';
  self.oss := TAliOss.Create(access_id, access_key,hostname,is_use_ssl,security_token);
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.Create','2');
  if hostname <> '' then
    self.oss.SetHostname(hostname);
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.Create','3');
  self.oss.SetDebugMode(debug);
//  //HandleException(nil, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.Create','4');
end;
function TAliOssFileSystem.CreateDirectory(const directory: string): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    ret := self.oss.CreateObjectDir(self.current_volumn, RemoveRootPrefix(directory));
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.CreateDirectory','');
    end;
  end;
end;
function TAliOssFileSystem.CreateVolumn(const volumn: string;
  const permission: TAliOssVolumnPermission): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    if permission = vPrivate then
      ret := self.oss.CreateBucket(volumn, OSS_ACL_TYPE_PRIVATE)
    else if permission = vPublicRead then
      ret := self.oss.CreateBucket(volumn, OSS_ACL_TYPE_PUBLIC_READ)
    else if permission = vPublicReadWrite then
      ret := self.oss.CreateBucket(volumn, OSS_ACL_TYPE_PUBLIC_READ_WRITE);
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.CreateVolumn','');
    end;
  end;
end;
destructor TAliOssFileSystem.Destroy;
begin
  //release internal reources
  self.oss.Free;
  inherited Destroy;
end;
function TAliOssFileSystem.DownloadFile(const filename,
  localfile: string): boolean;
var
  content: TStringStream;
begin
  result := false;
  try
    if self.ReadFile(filename, TStream(content)) then
    begin
      //create directory
      ForceDirectories(ExtractFilePath(localfile));
      //save file
      content.SaveToFile(localfile);
      content.Free;
      result := true;
    end;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.DownloadFile','');
    end;
  end;
end;
function TAliOssFileSystem.FileExists(const filename: string): boolean;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    result := self.oss.ObjectExists(self.current_volumn,
                RemoveRootPrefix(
                  filename
                )
              );
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.FileExists','');
    end;
  end;
end;
function TAliOssFileSystem.GetVolumnPermission(const volumn: string;
  var permission: TAliOssVolumnPermission): boolean;
var
  ret: TAliOssReturnType;
  xml: IXMLDocument;
  grant: string;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    ret := self.oss.GetBucketACL(self.current_volumn);
    if ret.status = 200 then
    begin
      {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
      begin
        xml := NewXMLDocument;
        xml.LoadFromXML(ret.body.DataString);
        grant :=
          xml.ChildNodes.FindNode('AccessControlPolicy').ChildNodes.FindNode('AccessControlList').ChildNodes.FindNode('Grant').Text;
        if grant = OSS_ACL_TYPE_PRIVATE then
        begin
          permission := vPrivate;
          result := true;
        end
        else if grant = OSS_ACL_TYPE_PUBLIC_READ then
        begin
          permission := vPublicRead;
          result := true;
        end
        else if grant = OSS_ACL_TYPE_PUBLIC_READ_WRITE then
        begin
          permission := vPublicReadWrite;
          result := true;
        end
      end;
      {$IFDEF MSWINDOWS}CoUninitialize{$ENDIF};
    end;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.GetVolumnPermission','');
    end;
  end;
end;
function TAliOssFileSystem.ListDirectory(const directory: string;
  var files: TAliOssFileInfoList; const dirNames: boolean): boolean;
var
  ansi: AnsiString;
  options: TAliOssOption;
  ret: TAliOssReturnType;
  xml: IXMLDocument;
  contents, node: IXMLNode;
  key, size, modified: String;
  I: Integer;
  dir, newdir: String;
  dirs: TStringList;
  p, len: Integer;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    options := TAliOssOption.Create;
    //remove prefix /
    dir := RemoveRootPrefix(directory);
    if copy(dir, length(dir), 1) <> '/' then
      dir := dir + '/';
    //remove non-ASCII characters
    ansi := dir;
    for I := 1 to length(ansi) do
      if Ord(ansi[I]) > 127 then
      begin
        options.Values[OSS_PREFIX] := Copy(dir, 1, I-1);
        break;
      end;
    options.Values[OSS_DELIMITER] := '';
    ret := self.oss.ListObject(self.current_volumn, options);
    options.Free;
    if ret.status = 200 then
    begin
      {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
      begin
        xml := NewXMLDocument;
        xml.LoadFromXML(ret.body.DataString);
        contents := xml.ChildNodes.FindNode('ListBucketResult');
        SetLength(files, contents.ChildNodes.Count);
        len := 0;
        dirs := TStringList.Create;
        for I := 0 to contents.ChildNodes.Count - 1 do
        begin
          node := contents.ChildNodes[I];
          if node.NodeName = 'Contents' then
          begin
            key := node.ChildNodes.FindNode('Key').Text;
            if (dir <> '/') and (Copy(key, 1, length(dir)) <> dir) then
              continue;
            if dir <> '/' then
              Delete(key, 1, length(dir));
            if key = '' then
              continue;
            modified := node.ChildNodes.FindNode('LastModified').Text;
            size := node.ChildNodes.FindNode('Size').Text;
            p := Pos('/', key);
            if (p = 0) or (not dirNames) then
            begin
              //file
              files[len].name := key;
              files[len].isDir := false;
              files[len].isFile := true;
              files[len].modified := FullDateTimeDecode(modified); //2012-02-24T02:53:26.000Z
              files[len].size := StrToInt64(size);
              inc(len);
            end
            else
            begin
              newdir := Copy(key, 1, p-1);
              if dirs.IndexOf(newdir) = -1 then
              begin
                //new dir
                files[len].name := newdir;
                files[len].isDir := true;
                files[len].isFile := false;
                files[len].modified := FullDateTimeDecode('1900-01-01T00:00:00.000Z');
                files[len].size := 0;
                inc(len);
                dirs.Add(newdir);
              end;
            end;
          end;
        end;
        dirs.Free;
        SetLength(files, len);
      end;
      {$IFDEF MSWINDOWS}CoUninitialize{$ENDIF};
      result := true;
    end;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.ListDirectory','');
    end;
  end;
end;
function TAliOssFileSystem.ListVolumns(var volumns: TAliOssVolumnInfoList): boolean;
var
  ret: TAliOssReturnType;
  xml: IXMLDocument;
  buckets: IXMLNode;
  bucket, created: String;
  I: Integer;
begin
  result := false;
  try
    ret := oss.ListBucket;
    if ret.status = 200 then
    begin
      {$IFDEF MSWINDOWS}CoInitialize(nil);{$ENDIF}
      begin
        xml := NewXMLDocument;
        xml.LoadFromXML(ret.body.DataString);
        buckets := xml.ChildNodes.FindNode('ListAllMyBucketsResult').ChildNodes.FindNode('Buckets');
        SetLength(volumns, buckets.ChildNodes.Count);
        for I := 0 to buckets.ChildNodes.Count - 1 do
        begin
          bucket := buckets.ChildNodes[I].ChildNodes.FindNode('Name').Text;
          created := buckets.ChildNodes[I].ChildNodes.FindNode('CreationDate').Text;
          volumns[I].name := bucket;
          volumns[I].created := FullDateTimeDecode(created); //2012-02-24T02:53:26.000Z
        end;
      end;
      {$IFDEF MSWINDOWS}CoUninitialize{$ENDIF};
      result := true;
    end;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.ListVolumns','');
    end;
  end;
end;
function TAliOssFileSystem.RenameFile(const src, dest: string): boolean;
var
  ret: TAliOssReturnType;
  localfile: string;
begin
//  result := false;
//  try
//    //if self.current_volumn = '' then exit;
//    if PureASCIIString(src) then
//    begin
//      //the simple way: copy-delete
//      //copy file to dest
//      ret := self.oss.CopyObject(self.current_volumn, RemoveRootPrefix(src), self.current_volumn, RemoveRootPrefix(dest));
//      if ret.status = 200 then
//      begin
//        //remove src
//        result := self.RemoveFile(src);
//      end;
//    end
//    else
//    begin
//      //the hard way: download-upload-delete
//      localfile := StringReplace(src, '/', '\', [rfReplaceAll]);
//      localfile := GetTempDirectory + ExtractFilename(localfile);
//      if self.DownloadFile(src, localfile) then
//      begin
//        if self.UploadFile(localfile, dest) then
//        begin
//          result := self.RemoveFile(src);
//        end;
//      end;
//    end;
//  except
//    on E:Exception do
//    begin
//      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.RenameFile','');
//    end;
//  end;
end;
function TAliOssFileSystem.ReadFile(const filename: string;
  var content: TStream): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
//  try
    //if self.current_volumn = '' then exit;
    ret := self.oss.GetObject(self.current_volumn, RemoveRootPrefix(filename));
    if ret.status = 200 then
    begin
//      TStringStream(content) :=
      content:=ret.body;
      result := true;
    end;
//  except
//    on E:Exception do
//    begin
//      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.ReadFile','');
//    end;
//
//  end;
end;
function TAliOssFileSystem.ReadFile(const filename: string;
  var content: string): boolean;
var
  Stream: TStringStream;
begin
  result := false;
//  try
    if self.ReadFile(filename, TStream(Stream)) then
    begin
      content := Stream.DataString;
      Stream.Free;
      result := true;
    end;
//  except
//    on E:Exception do
//    begin
//      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.ReadFile','');
//    end;
//  end;
end;
// remove directory and all files in it
function TAliOssFileSystem.RemoveDirectory(const directory: string): boolean;
var
  dir: string;
  ret: TAliOssReturnType;
  files: TAliOssFileInfoList;
  filenames: TStringList;
  I: Integer;
  options: TAliOssOption;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    if Copy(directory, length(directory), 1) <> '/' then
      dir := directory + '/'
    else
      dir := directory;
    //list files
    self.ListDirectory(dir, files);
    if Length(files) <> 0 then
    begin
      options := TAliOssOption.Create;
      options.Values['quiet'] := 'true';
      filenames := TStringList.Create;
      for I := Low(files) to High(files) do
        filenames.Add(files[I].name);
      ret := self.oss.DeleteObjects(self.current_volumn, filenames, options);
      options.Free;
      filenames.Free;
    end;
    //may have a object with the directory name
    self.RemoveFile(dir);
    result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.RemoveDirectory','');
    end;
  end;
end;
function TAliOssFileSystem.RemoveFile(const filename: string): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    ret := self.oss.DeleteObject(self.current_volumn, RemoveRootPrefix(filename));
    if ret.status = 204 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.RemoveFile','');
    end;
  end;
end;
function TAliOssFileSystem.RemoveVolumn(const volumn: string; const force: boolean): boolean;
var
  old_volumn: string;
  ret: TAliOssReturnType;
  files: TAliOssFileInfoList;
  filenames: TStringList;
  I: Integer;
  options: TAliOssOption;
begin
  result := false;
  try
    if volumn = '' then exit;
    old_volumn := self.current_volumn;
    self.ChangeVolumn(volumn);
    //list files
    self.ListDirectory('', files);
    self.ChangeVolumn(old_volumn);
    //delete files
    if Length(files) <> 0 then
    begin
      options := TAliOssOption.Create;
      options.Values['quiet'] := 'true';
      filenames := TStringList.Create;
      for I := Low(files) to High(files) do
        filenames.Add(files[I].name);
      self.oss.DeleteObjects(self.current_volumn, filenames, options);
      options.Free;
      filenames.Free;
    end;
    //delete volumn
    ret := self.oss.DeleteBucket(volumn);
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.RemoveVolumn','');
    end;
  end;
end;
function TAliOssFileSystem.WriteFile(const filename: string;
  const content: TStream; const append: boolean): boolean;
//begin
//  result := self.WriteFile(filename, TStringStream(content).DataString, append);
var
  options: TAliOssOption;
  ret: TAliOssReturnType;
begin
  result := false;
//  try
    //if self.current_volumn = '' then exit;
    options := TAliOssOption.Create;
    options.Values[OSS_STREAM_UPLOAD] := '';//content;
    options.Objects[options.IndexOfName(OSS_STREAM_UPLOAD)]:=content;
    ret := self.oss.UploadFileByStream(self.current_volumn, RemoveRootPrefix(filename),content, options);
    options.Free;
    if ret.status = 200 then
      result := true;
//  except
//    on E:Exception do
//    begin
//      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.WriteFile','');
//    end;
//
//  end;
end;
function TAliOssFileSystem.WriteFile(const filename, content: string;
  const append: boolean): boolean;
var
  options: TAliOssOption;
  ret: TAliOssReturnType;
begin
  result := false;
//  try
    //if self.current_volumn = '' then exit;
    options := TAliOssOption.Create;
    options.Values[OSS_CONTENT] := content;
    ret := self.oss.UploadFileByContent(self.current_volumn, RemoveRootPrefix(filename), options);
    options.Free;
    if ret.status = 200 then
      result := true;
//  except
//    on E:Exception do
//    begin
//      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.WriteFile','');
//    end;
//
//  end;
end;
function TAliOssFileSystem.SetVolumnPermission(const volumn: string;
  const permission: TAliOssVolumnPermission): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    if permission = vPrivate then
      ret := self.oss.SetBucketACL(volumn, OSS_ACL_TYPE_PRIVATE)
    else if permission = vPublicRead then
      ret := self.oss.SetBucketACL(volumn, OSS_ACL_TYPE_PUBLIC_READ)
    else if permission = vPublicReadWrite then
      ret := self.oss.SetBucketACL(volumn, OSS_ACL_TYPE_PUBLIC_READ_WRITE);
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.SetVolumnPermission','');
    end;
  end;
end;
function TAliOssFileSystem.UploadFile(const localfile,
  filename: string): boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    //if self.current_volumn = '' then exit;
    //upload by multipart
    ret := self.oss.UploadFileByMultipart(self.current_volumn, RemoveRootPrefix(filename), localfile);
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.UploadFile','');
    end;
  end;
end;
function TAliOssFileSystem.Validate: boolean;
var
  ret: TAliOssReturnType;
begin
  result := false;
  try
    ret := self.oss.ListBucket;
    if ret.status = 200 then
      result := true;
  except
    on E:Exception do
    begin
      //HandleException(E, 'MailMessage', 'ALIOSS', 'TAliOssFileSystem.Validate','');
    end;
  end;
end;


initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';


end.

