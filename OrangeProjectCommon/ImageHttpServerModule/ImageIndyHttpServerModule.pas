//convert pas to utf8 by ¥
unit ImageIndyHttpServerModule;

interface

uses
  System.SysUtils, System.Classes,

  Forms,
  Windows,
  StrUtils,

  uGenerateThumb,
  uFuncCommon,
//  uThumbCommon,
  uDataSetToJson,

  XSuperObject,
  XSuperJson,

  IdContext, IdCustomHTTPServer,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer, IdHeaderList;




type
  TFriendStrings=class(TStrings)

  end;

  TdmImageIndyHttpServer = class(TDataModule)
    IdImageHTTPServer: TIdHTTPServer;
    procedure IdImageHTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IdImageHTTPServerDoneWithPostStream(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; var VCanFree: Boolean);
  private
    { Private declarations }
  public
    WWWRootDir:String;
    WWWRootDirs:TStringList;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;




var
  dmImageIndyHttpServer: TdmImageIndyHttpServer;


//临时图片移动到正式目录
function MoveTempPicTo(ADestDir:String;ATempFileName:String):Boolean;


implementation

//把朋友圈的临时图片移动到正式目录
function MoveTempPicTo(ADestDir:String;ATempFileName:String):Boolean;
begin
  Result:=True;
  if ATempFileName<>'' then
  begin
    //创建文件夹
    System.SysUtils.ForceDirectories(ADestDir);

    //移动原图
    Result:=MoveFile(PWideChar(dmImageIndyHttpServer.WWWRootDir+'Temp\'+ATempFileName),
                    PWideChar(ADestDir+ATempFileName));

    //移动缩略图
    if FileExists(dmImageIndyHttpServer.WWWRootDir+'Temp\'+const_ThumbPrefix+ATempFileName) then
    begin
      Result:=MoveFile(PWideChar(dmImageIndyHttpServer.WWWRootDir+'Temp\'+const_ThumbPrefix+ATempFileName),
                      PWideChar(ADestDir+const_ThumbPrefix+ATempFileName));
    end;
  end;
end;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TdmImageIndyHttpServer.Create(AOwner: TComponent);
begin
  inherited;

  WWWRootDir:=ExtractFilePath(Application.ExeName);
  WWWRootDirs:=TStringList.Create;

end;



destructor TdmImageIndyHttpServer.Destroy;
begin
  FreeAndNil(WWWRootDirs);

  inherited;
end;

procedure TdmImageIndyHttpServer.IdImageHTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LFilename: string;
  LPathname: string;

  ADataJson:ISuperObject;
  ATempFileDir:String;
  ATempFileName:String;
  APostStream:TMemoryStream;
begin
  //浏览器请求http://127.0.0.1:8008/index.html?a=1&b=2
  //ARequestInfo.Document  返回    /index.html
  //ARequestInfo.QueryParams 返回  a=1b=2
  //ARequestInfo.Params.Values['name']   接收get,post过来的数据
  ////webserver发文件
  ///
  ///
//  ARequestInfo.CharSet:='utf-8';
//  ARequestInfo.
  LFilename := ARequestInfo.Document;
//  TFriendStrings(ARequestInfo.Params).SetEncoding(TEncoding.UTF8);

  //允许跨域访问
//  AResponseInfo.CustomHeaders.Add('Access-Control-Allow-Origin:*');
//  AResponseInfo.CustomHeaders.Add('Access-Control-Allow-Headers:*');
//  AResponseInfo.CustomHeaders.Add('Access-Control-Allow-Method:*');


  //浏览器请求http://127.0.0.1:8008/Upload?FileName=aaa.jpg&FileDir=Temp
  if SameText(LFilename,'/Upload') then
  begin

      //需要验证用户,不然会受攻击



      //上传文件
      //将数据流保存成临时文件


      //FileName参数表示保存的文件名
      ATempFileName:=ARequestInfo.Params.Values['FileName'];


      //FileDir参数表示上传到哪个文件夹
      //一般是Temp,上传的文件都保存到临时目录,
      //上传结束,保存数据的时候再移动到对应的目录中
      ATempFileDir:=WWWRootDir+ARequestInfo.Params.Values['FileDir']+'\';


      //创建目录
      System.SysUtils.ForceDirectories(ATempFileDir);



      APostStream:=TMemoryStream.Create;
      try

          if ARequestInfo.PostStream<>nil then
          begin
            //保存到文件
            ARequestInfo.PostStream.Position:=0;
            APostStream.CopyFrom(ARequestInfo.PostStream,ARequestInfo.PostStream.Size);
            APostStream.Position:=0;
            APostStream.SaveToFile(ATempFileDir+ATempFileName);

            //如果是图片文件
            if SameText(ExtractFileExt(ATempFileName),'.jpg')
              or SameText(ExtractFileExt(ATempFileName),'.jpeg')
//              or SameText(ExtractFileExt(ATempFileName),'.png')
//              or SameText(ExtractFileExt(ATempFileName),'.bmp')
//              or SameText(ExtractFileExt(ATempFileName),'.gif')
              then
            begin
              //生成JPG缩略图
              APostStream.Position:=0;
              GenerateThumbJpegFile(APostStream,ATempFileDir+Const_ThumbPrefix+ATempFileName);
            end;


          end
          else
          begin

          end;


      finally
        APostStream.Free;
        //返回
        ADataJson:=TSuperObject.Create;
        ADataJson.S['FileName']:=ATempFileName;
        AResponseInfo.ContentText:=ReturnJson(SUCC,'保存成功',ADataJson).AsJSON;
      end;


  end
  else
  begin

      //下载图片

      //请求文件
      if LFilename = '/' then
      begin
        LFilename := 'index.html';
      end;
      LFilename:=ReplaceStr(LFilename,'/','\');

      if LFilename[1]='\' then
      begin
        LFilename:=Copy(LFilename,2,MaxInt);
      end;

      LPathname := WWWRootDir + LFilename;
      if FileExists(LPathname) then
      begin
        AResponseInfo.ContentStream := TFileStream.Create(LPathname, fmOpenRead + fmShareDenyWrite);//发文件



        if (LowerCase(ExtractFileExt(LFilename))='.jpg') then
        begin
          AResponseInfo.ContentType:='image/jpeg';
        end
        else if (LowerCase(ExtractFileExt(LFilename))='.png') then
        begin
          AResponseInfo.ContentType:='image/png';
        end;


      end
      else
      begin
        AResponseInfo.ResponseNo := 404;
        AResponseInfo.ContentText := '找不到' + ARequestInfo.Document;
      end;

  end;

end;

procedure TdmImageIndyHttpServer.IdImageHTTPServerDoneWithPostStream(
  AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
  var VCanFree: Boolean);
begin
  VCanFree:=False;
end;

end.
