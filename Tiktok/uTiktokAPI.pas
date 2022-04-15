unit uTiktokAPI;

interface


uses
  SysUtils,
  Classes,
  DateUtils,

  Forms,
  XSuperObject,
  uPayAPIParam,
  uPayPublic,
//  TiktokAuthLoginForm,
  uSimpleFMXBrowser,
  uBaseThirdPartyAccountAuthLogin,


  System.Hash ,
  System.Net.Mime,
  System.NetEncoding,
  System.Net.URLClient,
  System.Net.HttpClientComponent;



type
  TTiktokAPI=class(TInterfacedPersistent,IBaseThirdPartyAccountAuthLoginAPI)
  public
    FClientKey:String;
    FClientSecret:String;
    FCallbackUrl:String;

//    FAccessToken:String;
//    FAuthLoginUserInfo:ISuperObject;
//    FOpenID:String;
    FAuthLoginUserInfo:TAuthLoginUserInfo;
    FOnAuthLoginEnd:TAuthLoginEndEvent;
    function GetAuthUrl:String;
    procedure DoAuthLogin(AAuthUrl:String);
    procedure SetOnAuthLoginEnd(AOnAuthLoginEnd:TAuthLoginEndEvent);
    function GetAuthLoginUserInfo:TAuthLoginUserInfo;
    procedure AuthLogin;
    //从回调地址中获取授权Code
    //https://orangeui.cn/?code=UcDFvwgCCBDwRzsXq2FmGPHDFc4IMtq5FvwbLY5yu7IVBpWm5ZoijS_vh5VJaJA6aIMLTAOuPfxWhxwHAMa5QQhN6-BTk4LvMfCXApsRBIa9H9qAqX0vzT76L_PALiQG%2A0%216430&scopes=user.info.basic%2Cvideo.list%2Cvideo.upload%2Cshare.sound.create&state=20220408085759794
    function GetAuthCodeFromCallBackUrl(AAuthCallbackUrl:String):String;
    procedure DoWebBrowserLoadEndEvent(Sender:TObject;AUrl:String);
  public
    constructor Create;
    destructor Destroy;override;
    //用Code换取AcessToken
    function GetAccessToken(ACode:String):Boolean;
    //获取用户信息
    function GetUserInfo:ISuperObject;
    //获取视频列表
    function GetVideoList:ISuperObject;
    //上传视频
    function UploadVideo(AVideoFilePath:String):ISuperObject;

    //获取二维码
    function GetAuthQRCode:ISuperObject;
  end;



function CreateTiktokAPI:IBaseThirdPartyAccountAuthLoginAPI;


implementation


function CreateTiktokAPI:IBaseThirdPartyAccountAuthLoginAPI;
begin
  Result:=TTiktokAPI.Create;
end;

{ TTiktokAPI }

procedure TTiktokAPI.AuthLogin;
var
  AAuthUrl:String;
begin
  AAuthUrl:=GetAuthUrl;
  Self.DoAuthLogin(AAuthUrl);
end;

constructor TTiktokAPI.Create;
begin
  FAuthLoginUserInfo:=TAuthLoginUserInfo.Create;

end;

destructor TTiktokAPI.Destroy;
begin
  FreeAndNil(FAuthLoginUserInfo);
  inherited;
end;

procedure TTiktokAPI.DoAuthLogin(AAuthUrl:String);
begin
  //打开浏览器,进行授权验证,理论上可以用Python去实现，但是Android调用不了Python.
  SimpleFMXBrowserFrm:=TSimpleFMXBrowserFrm.Create(Application);
  SimpleFMXBrowserFrm.AddressEdt.Text:=AAuthUrl;
  SimpleFMXBrowserFrm.FOnWebBrowserLoadEnd:=DoWebBrowserLoadEndEvent;
  SimpleFMXBrowserFrm.Show;

end;

procedure TTiktokAPI.DoWebBrowserLoadEndEvent(Sender: TObject; AUrl: String);
var
  ACode:String;
begin
  ACode:=Self.GetAuthCodeFromCallBackUrl(AUrl);
  if ACode<>'' then
  begin
    SimpleFMXBrowserFrm.Close;


    //授权成功，获取到Code，再用Code换取AccessToken

    TThread.CreateAnonymousThread(procedure
    begin
      Self.GetAccessToken(ACode);

      TThread.Synchronize(nil,procedure
      begin
        if Assigned(FOnAuthLoginEnd) then
        begin
          FOnAuthLoginEnd(Self,True,'',Self.FAuthLoginUserInfo);
        end;
      end);
    end).Start;


  end;

end;

function TTiktokAPI.GetAccessToken(ACode: String): Boolean;
var
  ANetHttpClient:TNetHttpClient;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
begin
  Result:=False;

  ANetHttpClient:=TNetHttpClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);

  try

      ARequestStream.Position:=0;
      ANetHttpClient.Post('https://open-api.tiktok.com/oauth/access_token'
                          +'?client_key='+Self.FClientKey
                          +'&client_secret='+Self.FClientSecret
                          +'&code='+ACode
                          +'&grant_type=authorization_code'
                          ,
                          ARequestStream,AResponseStream);
      //'{"data":{"captcha":"","desc_url":"","description":"Authorization code expired","error_code":10007},"message":"error"}'
      //'{"data":{"access_token":"act.69d080157109c46872f8438275a1d4b55ZH85DkNXIOe5OHBWEQeU1eZTMqN!6385","captcha":"","desc_url":"","description":"","error_code":0,"expires_in":86400,"log_id":"202204080205560102440130071B8C1034","open_id":"ab4ef122-d7b0-45bc-9083-7f132e32c345","refresh_expires_in":31536000,"refresh_token":"rft.a8f98a299b778b0f8814532bd2438a2bFGjt73Xnj9UfWR5dryQyWl40PV1y!6388","scope":"user.info.basic,video.upload,share.sound.create,video.list"},"message":"success"}'
      ASuperObject:=SO(AResponseStream.DataString);

      //{
      //	"data": {
      //		"access_token": "act.69d080157109c46872f8438275a1d4b55ZH85DkNXIOe5OHBWEQeU1eZTMqN!6385",
      //		"captcha": "",
      //		"desc_url": "",
      //		"description": "",
      //		"error_code": 0,
      //		"expires_in": 86400,
      //		"log_id": "202204080205560102440130071B8C1034",
      //		"open_id": "ab4ef122-d7b0-45bc-9083-7f132e32c345",
      //		"refresh_expires_in": 31536000,
      //		"refresh_token": "rft.a8f98a299b778b0f8814532bd2438a2bFGjt73Xnj9UfWR5dryQyWl40PV1y!6388",
      //		"scope": "user.info.basic,video.upload,share.sound.create,video.list"
      //	},
      //	"message": "success"
      //}
      if ASuperObject.S['message']<>'success' then
      begin
        Exit;
      end;

      FAuthLoginUserInfo.FAccessTokenJson:=ASuperObject.O['Data'];
      FAuthLoginUserInfo.FAccessToken:=ASuperObject.O['Data'].S['access_token'];
      FAuthLoginUserInfo.FOpenID:=ASuperObject.O['Data'].S['open_id'];
      Result:=True;

  finally
      FreeAndNil(ANetHttpClient);
      FreeAndNil(AResponseStream);
      FreeAndNil(ARequestStream);
  end;

end;

function TTiktokAPI.GetAuthLoginUserInfo: TAuthLoginUserInfo;
begin
  Result:=FAuthLoginUserInfo;
end;

function TTiktokAPI.GetAuthCodeFromCallBackUrl(AAuthCallbackUrl: String): String;
begin
  Result:='';
  if Pos(FCallbackUrl,AAuthCallbackUrl)>0 then
  begin
    Result:=GetUrlQueryParameterValue(AAuthCallbackUrl,True,'code');
  end;
end;

function TTiktokAPI.GetAuthQRCode: ISuperObject;
var
  AState:String;
var
  ANetHttpClient:TNetHttpClient;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
begin
  Result:=nil;
  AState:=FormatDateTime('YYYYMMDDHHMMSSZZZ',Now);

  ANetHttpClient:=TNetHttpClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);

  try

      ANetHttpClient.Get('https://open-api.tiktok.com/v0/oauth/get_qrcode'
                          +'?client_key='+Self.FClientKey
                          +'&scope=user.info.basic,share.sound.create,video.list,video.upload'
                          +'&next='+'https://orangeui.cn'
                          +'&state='+AState
                          ,
                          AResponseStream);

      ASuperObject:=SO(AResponseStream.DataString);

      //{
      //	"data": {
      //		"error_code": 0,
      //		"qrcode": "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEAAQMAAABmvDolAAAABlBMVEX///8AAABVwtN+AAAF70lEQVR42uyZP47zrBrFj0VBFzaAhm24GIkt2V2qQKrp4i0hpWAbRGwAdxTI54r8+e4C7BndK31+q0i/V0rgOc85x4N/n/+
//      nR5IJghptYJFLHSIjPT3mTJZjACDZJNskPBz9yJoszqKwCI/pGMDUHLRMk77Ya3AR0kTjBQGxtD8EqqF2SQUXvWXcRjgosR0MVPrmyMhYJAmpJ63yYQCQo0ab9CRu41AVk8TZlOfZHwSQOepzXvR8v41zPI2P98f/TtROAICg+DGlfwdMckOS2QuK
//      Nf0z+TsBaZgsf/ro8xrXupJssrm8ZLY/ArBJEVhN4RLmOtQTTDA1s50M7+UQQDKwitpP477Jax04hObMkpc0feMQAKaLqJINolhvNzCKmpweeBPlEEB+2SbzD9AUr0FFjBgzTcHJ3IQ/BMAm9ZhrXsTK2zhXxU2aPvCK61NZ+wEJ28Z21q7BLkFVP
//      k9Sq1zM+rqs3wcwVFONT067exmnvqOkqMJjSJM9CEhjru1sirjer88dteHpMBfz1vZ+YAgimKpVcve1Og6RND5Nekin10TtBxJyNV4sUE3Ro9ihamd8m0x5DcxuQKbRxOy5CIYhqAqLMUmzpAmXgwCwJtmkRpowYYhlfERR4fRJD69N+wcAgNH4hm63
//      QdWBhoKZTaXLNw4B5BBybBJoJ+vlGktfgz5TLHwf9W4Aj6gtCdeGBri60tSXsnB52uIBgCFjk6I0x210FSMpfhKg+LbF/UAaBSEx5SIYTj2JSX3mApdOH+ntBbr/wGmX5vs1FltknwfD5PJn2+8FpKkiGk/PIpYwc6hJQpolX9Ppkyd/HdgsA5xWPYl
//      xkyfJPpNeLCT9IQDI/qOh2sUuXMJmHzFXLnposMcA8qs7VmXJxW6jI8MG403BnFSYDgGwPe8zF7G0ITJ0KybFIgrmd4bZDSQwmB9BDG2SPbR+jV28vOkh4BCgX36lFz4Xew1zxMhoqgZUep/k7wPY0Gz3XXrLCqj6JfU5lzQniHIMQPYcph2m7yG4Os
//      SBfWX1hvG6zf3AENgDpG8zb6OjqtvYQ7JZWXAQYCps/klTgl0D7Fo3dGV18dpyCCCH3r8qJlHEZnulfdbJ0j3vezoEgKkiZJ+7WnspX+MjkFDmZraXJf0+IBkbksTUVHPhNGJ8vIJZMZ8yuBfAF2CbE0Xc7DYOYYhfvasRgHt51n6gh5R2FqUj4wmsj
//      6phmKDn16bdDUiMWhpmmrUN9SJVZBUUxRT9ypMHAJslE0xJjkVeudYuteQy+b6s/QCriA292ok1THKz6Vlh9JzUu7n/PvA1dvcn9XxnvGHlIz775jUv9McA/TskqdHF19tmTbIvXrN8zH03gAdZzY9ZBLkExZcV54KZ20GA7EnM+Fy4NhUXqvroVjVp
//      ldfXSe4HhtrGhJ6zxRJO48rN9sgqVvJVaXcDYOwyapO5iSV6nEZAVCjBvIaDgEdIT22hryBVVz4d3+U1Te9s//vAZvu3yl5fxE1eA6yJPf63i7i+Q85uIPUxhFbkvSdzxVcZzGt7z+RuQEL2CpOU8NZjDiu/kNB7c9fBIQCGSjZnip7DzM2qamKuyWEy
//      5ZWCdgMSEJGVXs/3MmLc7FCbhMPFLGE6BjA1R1PNYhbyucwfVfg26amvjL8B8AjiGZPy9b7Ga4U0ofXb5Ccm7QbkF3LoP1zPTcW1V/MgftKE+RNy9gP9X4KeeLPXMISBJtCbvmnfL3L3A4/nfIjSZm7yWZSl8GnSrr36xX4AQ4XFWSuzBhWXALvhaUkb
//      Pql4LyAxMuApXq5BPV/+dV2J66dv/j6ArouGpPQkvL3hZJNMMiGvSd2PASSZrKnCm/XeWzPjI+oeaYa83MsxAJCZANcjSmSETP3/OMNPRNkPdPFqNNVjSpjGfqL63Kbm+H5vfxDgWPrNyNuo6hCFF17czPrP35L2AwFnQ1O+LyOwjRv6R1ww/xnQXas5w
//      bx9T3BxCJs0Fe6fMngAQOZI35we7l4uYevd+Zy9KWYT5RDg3+d/5flPAAAA//8uo4zaCp2fJAAAAABJRU5ErkJggg==",
      //		"scan_qrcode_url": "aweme://authorize?authType=1\u0026client_key=aw6noplqmphvn7sp\u0026client_ticket=tobefilled\u0026next_url=https%3A%2F%2F127.0.0.1%3A9440%2Foauth%2Fscan_qrcode%2F%3Fclient_ticket%3Dtobefilled\u0026qr_source_aid=0\u0026scope=user.info.basic%2Cshare.sound.create%2Cvideo.list%2Cvideo.upload\u0026token=W939oKoNwMiRZR7qZ8XrJLPYkGQfyFrV4waYGI9OP-GdEV806LchXvyYjxRsXe2M_sg1",
      //		"token": "W939oKoNwMiRZR7qZ8XrJLPYkGQfyFrV4waYGI9OP-GdEV806LchXvyYjxRsXe2M_sg1"
      //	},
      //	"extra": {
      //		"error_detail": "",
      //		"logid": "2022040822280001018601821625002F12"
      //	},
      //	"message": "success"
      //}

      if ASuperObject.S['message']<>'success' then
      begin
        Exit;
      end;

      Result:=ASuperObject.O['data'];

  finally
      FreeAndNil(ANetHttpClient);
      FreeAndNil(AResponseStream);
  end;



end;

function TTiktokAPI.GetAuthUrl: String;
var
  AState:String;
begin
  AState:=FormatDateTime('YYYYMMDDHHMMSSZZZ',Now);

  //接好链接
  Result:='https://www.tiktok.com/auth/authorize?'
              +'client_key='+FClientKey
              +'&response_type=code'
              +'&scope=user.info.basic,share.sound.create,video.list,video.upload'
              +'&redirect_uri=https://orangeui.cn'
              +'&state='+AState;

end;

function TTiktokAPI.GetUserInfo: ISuperObject;
var
  ANetHttpClient:TNetHttpClient;
  ARequestJson:ISuperObject;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
  ANameValuePair:TNameValuePair;
  ANetHTTPRequestHeaders:TNetHeaders;
begin
  Result:=nil;

  ANetHttpClient:=TNetHttpClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);

  ARequestJson:=SO();
  ARequestJson.S['open_id']:=Self.FAuthLoginUserInfo.FOpenID;
  ARequestJson.S['access_token']:=Self.FAuthLoginUserInfo.FAccessToken;
  ARequestJson.A['fields']:=SA();
  ARequestJson.A['fields'].S[0]:='open_id';
  ARequestJson.A['fields'].S[1]:='union_id';
  ARequestJson.A['fields'].S[2]:='avatar_url';
  ARequestJson.A['fields'].S[3]:='avatar_url_100';
  ARequestJson.A['fields'].S[4]:='avatar_url_200';
  ARequestJson.A['fields'].S[5]:='avatar_large_url';
  ARequestJson.A['fields'].S[6]:='display_name';
  ARequestStream:=TStringStream.Create(ARequestJson.AsJson,TEncoding.UTF8);

  try
      //设置headers
      SetLength(ANetHTTPRequestHeaders,1);
      ANameValuePair.Name:= 'Content-type';
      ANameValuePair.Value:= 'application/json';
      ANetHTTPRequestHeaders[0]:=ANameValuePair;

      ARequestStream.Position:=0;
      ANetHttpClient.Post('https://open-api.tiktok.com/user/info/'
//                          +'?open_id='+Self.FOpenID
//                          +'&client_secret='+Self.FClientSecret
//                          +'&fields='+'["open_id", "union_id", "avatar_url", "avatar_url_100", "avatar_url_200", "avatar_large_url", "display_name"]'
                          ,
                          ARequestStream,AResponseStream,ANetHTTPRequestHeaders);
      ASuperObject:=SO(AResponseStream.DataString);
      //{
      //	"data": {
      //		"user": {
      //			"open_id": "ab4ef122-d7b0-45bc-9083-7f132e32c345",
      //			"union_id": "aef2d0bd-be39-4fed-b62d-f4accb0bc724",
      //			"avatar_url": "https://p16-sign.tiktokcdn-us.com/tos-useast5-avt-0068-tx/7075164461534806059~c5_168x168.jpeg?x-expires=1649473200\u0026x-signature=Ct5f2oUxcyuJbCRjqnjRgmU246M%3D",
      //			"avatar_large_url": "https://p16-sign.tiktokcdn-us.com/tos-useast5-avt-0068-tx/7075164461534806059~c5_1080x1080.jpeg?x-expires=1649473200\u0026x-signature=MJsn7m%2BvjsEuQBC7Cmyb2zKDoSA%3D",
      //			"display_name": "wang neng",
      //			"avatar_url_100": "https://p16-sign.tiktokcdn-us.com/tos-useast5-avt-0068-tx/7075164461534806059~c5_100x100.jpeg?x-expires=1649473200\u0026x-signature=GB%2BmJkiSzJndqiUfIMfmUbQLKBA%3D"
      //		}
      //	},
      //	"error": {
      //		"code": 0,
      //		"message": ""
      //	}
      //}

      if ASuperObject.O['error'].I['code']<>0 then
      begin
        Exit;
      end;

      Result:=ASuperObject.O['data'].O['user'];

  finally
      FreeAndNil(ANetHttpClient);
      FreeAndNil(AResponseStream);
      FreeAndNil(ARequestStream);
  end;

end;

function TTiktokAPI.GetVideoList: ISuperObject;
var
  ANetHttpClient:TNetHttpClient;
  ARequestJson:ISuperObject;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
  ANameValuePair:TNameValuePair;
  ANetHTTPRequestHeaders:TNetHeaders;
begin
  Result:=nil;

  ANetHttpClient:=TNetHttpClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);

  ARequestJson:=SO();
  ARequestJson.S['open_id']:=Self.FAuthLoginUserInfo.FOpenID;
  ARequestJson.S['access_token']:=Self.FAuthLoginUserInfo.FAccessToken;
  ARequestJson.I['cursor']:=0;
  ARequestJson.I['max_count']:=10;
  ARequestJson.A['fields']:=SA();
  ARequestJson.A['fields'].S[0]:='create_time';
  ARequestJson.A['fields'].S[1]:='cover_image_url';
  ARequestJson.A['fields'].S[2]:='share_url';
  ARequestJson.A['fields'].S[3]:='video_description';
  ARequestJson.A['fields'].S[4]:='duration';
  ARequestJson.A['fields'].S[5]:='height';
  ARequestJson.A['fields'].S[6]:='width';
  ARequestJson.A['fields'].S[7]:='id';
  ARequestJson.A['fields'].S[8]:='title';
  ARequestJson.A['fields'].S[9]:='embed_html';
  ARequestJson.A['fields'].S[10]:='embed_link';
  ARequestJson.A['fields'].S[11]:='like_count';
  ARequestJson.A['fields'].S[12]:='comment_count';
  ARequestJson.A['fields'].S[13]:='share_count';
  ARequestJson.A['fields'].S[14]:='view_count';
  ARequestStream:=TStringStream.Create(ARequestJson.AsJson,TEncoding.UTF8);

  try
      //设置headers
      SetLength(ANetHTTPRequestHeaders,1);
      ANameValuePair.Name:= 'Content-type';
      ANameValuePair.Value:= 'application/json';
      ANetHTTPRequestHeaders[0]:=ANameValuePair;

      ARequestStream.Position:=0;
      ANetHttpClient.Post('https://open-api.tiktok.com/video/list/'
                          ,
                          ARequestStream,AResponseStream,ANetHTTPRequestHeaders);
      //'{"data":{"cursor":0,"has_more":false},"error":{"code":6007063,"message":"Server Internal Error","log_id":"20220408065054010244000216089673F7"}}'
      ASuperObject:=SO(AResponseStream.DataString);
      //{
      //	"data": {
      //		"videos": [{
      //			"embed_html": "\u003cblockquote class=\"tiktok-embed\" cite=\"https://www.tiktok.com/@wangneng12/video/7084117582483279150?utm_campaign=tt4d_open_api\u0026utm_source=aw6noplqmphvn7sp\" data-video-id=\"7084117582483279150\" style=\"max-width: 605px;min-width: 325px;\" \u003e \u003csection\u003e \u003ca target=\"_blank\" title=\"@wangneng12\" href=\"https://www.tiktok.com/@wangneng12\"\u003e@wangneng12\u003c/a\u003e \u003cp\u003eWhen cat hear birds sing\u003c/p\u003e \u003ca target=\"_blank\" title=\"♬ original sound - wangneng12 - wang neng\" href=\"https://www.tiktok.com/music/7084117495656762155-original+sound+-+wangneng12\"\u003e♬ original sound - wangneng12 - wang neng\u003c/a\u003e \u003c/section\u003e \u003c/blockquote\u003e \u003cscript async src=\"https://www.tiktok.com/embed.js\"\u003e\u003c/script\u003e"
      //		}],
      //		"cursor": 1649399659000,
      //		"has_more": false
      //	},
      //	"error": {
      //		"code": 0,
      //		"message": ""
      //	}
      //}


      //{
      //	"data": {
      //		"videos": [{
      //			"create_time": 1649399659,
      //			"cover_image_url": "https://p16-sign-va.tiktokcdn.com/tos-maliva-p-0068c799-us/92e44fff2e7b46c8984d7d1e13488d14_1649399660~tplv-noop.image?x-expires=1649422733\u0026x-signature=HLMTXSVSzr3k8qxcbqBTsczdBEk%3D",
      //			"share_url": "https://www.tiktok.com/@wangneng12/video/7084117582483279150?utm_campaign=tt4d_open_api\u0026utm_source=aw6noplqmphvn7sp",
      //			"video_description": "When cat hear birds sing",
      //			"duration": 6,
      //			"height": 576,
      //			"width": 1024,
      //			"id": "7084117582483279150",
      //			"title": "When cat hear birds sing",
      //			"embed_html": "\u003cblockquote class=\"tiktok-embed\" cite=\"https://www.tiktok.com/@wangneng12/video/7084117582483279150?utm_campaign=tt4d_open_api\u0026utm_source=aw6noplqmphvn7sp\" data-video-id=\"7084117582483279150\" style=\"max-width: 605px;min-width: 325px;\" \u003e \u003csection\u003e \u003ca target=\"_blank\" title=\"@wangneng12\" href=\"https://www.tiktok.com/@wangneng12\"\u003e@wangneng12\u003c/a\u003e \u003cp\u003eWhen cat hear birds sing\u003c/p\u003e \u003ca target=\"_blank\" title=\"♬ original sound - wangneng12 - wang neng\" href=\"https://www.tiktok.com/music/7084117495656762155-original+sound+-+wangneng12\"\u003e♬ original sound - wangneng12 - wang neng\u003c/a\u003e \u003c/section\u003e \u003c/blockquote\u003e \u003cscript async src=\"https://www.tiktok.com/embed.js\"\u003e\u003c/script\u003e",
      //			"embed_link": "https://www.tiktok.com/embed/v2/7084117582483279150",
      //			"like_count": 0,
      //			"comment_count": 0,
      //			"share_count": 0,
      //			"view_count": 0
      //		}],
      //		"cursor": 1649399659000,
      //		"has_more": false
      //	},
      //	"error": {
      //		"code": 0,
      //		"message": ""
      //	}
      //}

      if ASuperObject.O['error'].I['code']<>0 then
      begin
        Exit;
      end;

      Result:=ASuperObject.O['data'];

  finally
      FreeAndNil(ANetHttpClient);
      FreeAndNil(AResponseStream);
      FreeAndNil(ARequestStream);
  end;


end;

procedure TTiktokAPI.SetOnAuthLoginEnd(AOnAuthLoginEnd: TAuthLoginEndEvent);
begin
  FOnAuthLoginEnd:=AOnAuthLoginEnd;
end;

function TTiktokAPI.UploadVideo(AVideoFilePath: String): ISuperObject;
var
  ANetHttpClient:TNetHttpClient;
  ARequestJson:ISuperObject;
//  ARequestStream:TStringStream;
  ARequestStream:TMultipartFormData;
  AResponseStream:TStringStream;
  ASuperObject:ISuperObject;
  ANameValuePair:TNameValuePair;
  ANetHTTPRequestHeaders:TNetHeaders;
begin
  Result:=nil;

  ANetHttpClient:=TNetHttpClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);

//  ARequestJson:=SO();
//  ARequestJson.S['open_id']:=Self.FOpenID;
//  ARequestJson.S['access_token']:=Self.FAccessToken;//ARequestJson.AsJson
//  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  ARequestStream:=TMultipartFormData.Create;
  ARequestStream.AddFile('video',AVideoFilePath);

  try
//      //设置headers
//      SetLength(ANetHTTPRequestHeaders,1);
//      ANameValuePair.Name:= 'Content-type';
//      ANameValuePair.Value:= 'application/json';
//      ANetHTTPRequestHeaders[0]:=ANameValuePair;

      ANetHttpClient.Post('https://open-api.tiktok.com/share/video/upload/'
                          +'?open_id='+Self.FAuthLoginUserInfo.FOpenID
                          +'&access_token='+Self.FAuthLoginUserInfo.FAccessToken
                          ,
                          ARequestStream,AResponseStream);//,ANetHTTPRequestHeaders);
      ASuperObject:=SO(AResponseStream.DataString);
      //{
      //	"data": {
      //		"err_code": 0,
      //		"error_code": 0,
      //		"share_id": "video.7084120591221000194.qrFui4pG"
      //	},
      //	"extra": {
      //		"error_detail": "",
      //		"logid": "2022040808585001024524214202650782"
      //	}
      //}

      //https://www.tiktok.com/@wangneng12/video/7084120591221000194

      if ASuperObject.O['error'].I['code']<>0 then
      begin
        Exit;
      end;

      Result:=ASuperObject.O['data'];

  finally
      FreeAndNil(ANetHttpClient);
      FreeAndNil(AResponseStream);
      FreeAndNil(ARequestStream);
  end;




end;

var
  ACreateThirdPartyAccountAuthLoginRegItem:TCreateThirdPartyAccountAuthLoginRegItem;

initialization
  ACreateThirdPartyAccountAuthLoginRegItem:=TCreateThirdPartyAccountAuthLoginRegItem.Create;
  ACreateThirdPartyAccountAuthLoginRegItem.Name:='Tiktok';
  ACreateThirdPartyAccountAuthLoginRegItem.Func:=CreateTiktokAPI;
  GlobalCreateThirdPartyAccountAuthLoginRegList.Add(ACreateThirdPartyAccountAuthLoginRegItem);


end.
