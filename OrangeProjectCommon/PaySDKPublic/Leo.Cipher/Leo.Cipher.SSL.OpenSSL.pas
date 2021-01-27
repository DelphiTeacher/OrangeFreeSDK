unit Leo.Cipher.SSL.OpenSSL;
(* ****************************************************************************)
(*　　　　　　　　　　　　　　　　　　　　　　　　　                          *)
(*　　Copyright 2016 Leo 万鹏 authors　　                                     *)
(*　　QQ: 13498714                      　　　　　　                          *)
(*　　　    　　　　　　  　　　                                              *)
(*　　单元说明：  　　　　　　　　　　　　　　　　　                          *)
(*　　支付宝算法接口OPenSSL实现单元                                           *)
(* ****************************************************************************)

interface

{$IF DEFINED(MSWINDOWS) OR DEFINED(VCL)}
//仅在Windows下使用

uses
  SysUtils,
  Classes,
  Leo.IdOpenSSLHeaders,
  Leo.Cipher.RSAMethod;


const
  //换行符
  LineBreak=#10;


type
  TLEOOpenSSLCipher = class
  private
    class procedure LoadLib();
    class function GetEVPMD(AMethod: TLeoRSAWithMethod): PEVP_MD;
  protected
    class function RSASign(APEVP_MD: PEVP_MD; const AContent: string; ACotentEncoding: TEncoding; ARSA: PRSA): string; overload;
    class function RSASign(APEVP_MD: PEVP_MD; const AContent: string; ACotentEncoding: TEncoding; const APrivateKey: string): string; overload;

    class function RSAVerify(APEVP_MD: PEVP_MD; const AContent: string; ACotentEncoding: TEncoding;  const ASignedData: string;  AEVP_PKEY: PEVP_PKEY): Boolean; overload;
    class function RSAVerify(APEVP_MD: PEVP_MD; const AContent: string; ACotentEncoding: TEncoding;  const ASignedData: string;  const APublicKey: string): Boolean; overload;
    class function GetPrivateRSAKey(APBIO: PBIO): PRSA;
    class function GetPublicRSAKey(APBIO: PBIO): PEVP_PKEY;
//    class function FixedUpSignedData(const ASignedData: string): string;

    class function Sha1WithRSAVerify(const AContent: string; ACotentEncoding: TEncoding; const ASignedData: string; const APublicKey: string): Boolean;
    class function Sha1WithRSASign(const AContent: string; ACotentEncoding: TEncoding; const APrivateKey: string): string;
    class function Md5WithRSASign(const AContent: string; ACotentEncoding: TEncoding; const APrivateKey: string): string;
    class function Sha1WithRSASignByKeyFile(const AContent: string; ACotentEncoding: TEncoding; const APrivateKeyFile: string): string;
  public
    class function RSASignWith(AMethod: TLeoRSAWithMethod; const AContent: string; ACotentEncoding: TEncoding; const APrivateKey: string): string; overload;
    class function RSAVerifyWith(AMethod: TLeoRSAWithMethod; const AContent: string; ACotentEncoding: TEncoding; const ASignedData: string; const APublicKey: string): Boolean;
  end;


//DLL导出函数
function LEO_RSASign_Windows_By_File:Boolean;
function LEO_RSASign2_Windows_By_File:Boolean;


implementation

uses
  IdCTypes,
  IdGlobal,
  System.NetEncoding;

const
  XRSA_KEY_BITS = 1024;


function LEO_RSASign_Windows_By_File:Boolean;
var
  ARSAPrivateKey:String;
  APayOrderInfo:String;
  ARSAResult:String;

  ARSAPrivateKeyStream:TStringStream;
  APayOrderInfoStream:TStringStream;
  ARSAResultStream:TStringStream;

  AApplicationDir:String;
begin
  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  if FileExists(AApplicationDir+'ARSAPrivateKey.txt')
    and FileExists(AApplicationDir+'APayOrderInfo.txt') then
  begin
      ARSAPrivateKeyStream:=TStringStream.Create('',TEncoding.UTF8);
      APayOrderInfoStream:=TStringStream.Create('',TEncoding.UTF8);
      ARSAResultStream:=TStringStream.Create('',TEncoding.UTF8);
      try
          //参数从文件加载
          ARSAPrivateKeyStream.LoadFromFile(AApplicationDir+'ARSAPrivateKey.txt');
          APayOrderInfoStream.LoadFromFile(AApplicationDir+'APayOrderInfo.txt');


          ARSAPrivateKeyStream.Position:=0;
          APayOrderInfoStream.Position:=0;

          ARSAPrivateKey:=ARSAPrivateKeyStream.DataString;
          APayOrderInfo:=APayOrderInfoStream.DataString;


          ARSAResult:=TLEOOpenSSLCipher.RSASignWith(rwmSha1,
                                APayOrderInfo,
                                TEncoding.UTF8,
                                  '-----BEGIN PRIVATE KEY-----'+LineBreak
                                  +ARSAPrivateKey
                                  +LineBreak
                                  +'-----END PRIVATE KEY-----'
                                );


          //结果保存到文件
          ARSAResultStream.WriteString(ARSAResult);
          ARSAResultStream.Position:=0;
          ARSAResultStream.SaveToFile(AApplicationDir+'ARSAResult.txt');

          if ARSAResult<>'' then
          begin
            Result:=True;
          end;

      finally
        FreeAndNil(ARSAPrivateKeyStream);
        FreeAndNil(APayOrderInfoStream);
        FreeAndNil(ARSAResultStream);
      end;
  end;
end;

function LEO_RSASign2_Windows_By_File:Boolean;
var
  ARSAPrivateKey:String;
  APayOrderInfo:String;
  ARSAResult:String;
  ARSAPrivateKeyStream:TStringStream;
  APayOrderInfoStream:TStringStream;
  ARSAResultStream:TStringStream;
  AApplicationDir:String;
begin
  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  if FileExists(AApplicationDir+'ARSAPrivateKey.txt')
    and FileExists(AApplicationDir+'APayOrderInfo.txt') then
  begin
      ARSAPrivateKeyStream:=TStringStream.Create('',TEncoding.UTF8);
      APayOrderInfoStream:=TStringStream.Create('',TEncoding.UTF8);
      ARSAResultStream:=TStringStream.Create('',TEncoding.UTF8);
      try
          //参数从文件加载
          ARSAPrivateKeyStream.LoadFromFile(AApplicationDir+'ARSAPrivateKey.txt');
          APayOrderInfoStream.LoadFromFile(AApplicationDir+'APayOrderInfo.txt');



          ARSAPrivateKeyStream.Position:=0;
          APayOrderInfoStream.Position:=0;

          ARSAPrivateKey:=ARSAPrivateKeyStream.DataString;
          APayOrderInfo:=APayOrderInfoStream.DataString;

          ARSAResult:=TLEOOpenSSLCipher.RSASignWith(rwmSha256,
                                APayOrderInfo,
                                TEncoding.UTF8,
                                  '-----BEGIN PRIVATE KEY-----'+LineBreak
                                  +ARSAPrivateKey
                                  +LineBreak
                                  +'-----END PRIVATE KEY-----'
                                );



          //把结果保存到文件
          ARSAResultStream.WriteString(ARSAResult);
          ARSAResultStream.Position:=0;
          ARSAResultStream.SaveToFile(AApplicationDir+'ARSAResult.txt');

          if ARSAResult<>'' then
          begin
            Result:=True;
          end;

      finally
        FreeAndNil(ARSAPrivateKeyStream);
        FreeAndNil(APayOrderInfoStream);
        FreeAndNil(ARSAResultStream);
      end;
  end;
end;


{ TLEOSSLCipher }

{$IF CompilerVersion < 24}
function Low(AValue: string): Integer;
begin
  Result := 1;
end;
{$IFEND}

//class function TLEOOpenSSLCipher.FixedUpSignedData(
//  const ASignedData: string): string;
//const
//  _StandLineLen = 76;
//var
//  vRemainStr: string;
//  vRemainLen: Integer;
//begin
//  if Pos(#13, ASignedData) > 0 then
//  begin
//    Result := ASignedData;
//    Exit;
//  end;
//
//  Result := '';
//  vRemainStr := ASignedData;
//  vRemainLen := Length(vRemainStr);
//  while vRemainLen > 0 do
//  begin
//    if vRemainLen > _StandLineLen then
//    begin
//      Result := Result + Copy(vRemainStr, Low(vRemainStr), _StandLineLen) + #13#10;
//      vRemainLen := vRemainLen - _StandLineLen;
//      vRemainStr := Copy(vRemainStr, _StandLineLen + Low(vRemainStr), vRemainLen);
//    end
//    else
//    begin
//      Result := Result + vRemainStr;
//      vRemainLen := 0;
//    end;
//  end;
//end;

class function TLEOOpenSSLCipher.GetEVPMD(AMethod: TLeoRSAWithMethod): PEVP_MD;
begin
  if AMethod = rwmSha1 then
    Result := EVP_sha1()
  else if AMethod = rwmSha256 then
    Result := EVP_sha256()
  else if AMethod = rwmMd5 then
    Result := EVP_md5()
  else
    raise Exception.Create('RSA算法不支持当前Method，請聯系開發人員檢查!');
end;

class function TLEOOpenSSLCipher.GetPrivateRSAKey(APBIO: PBIO): PRSA;
begin
  Result := PEM_read_bio_RSAPrivateKey(APBIO, nil, nil, nil);
  if Result = nil then
    raise Exception.Create('生成RSA密钥对象失败');
end;

class function TLEOOpenSSLCipher.GetPublicRSAKey(APBIO: PBIO): PEVP_PKEY;
var
  vTemp: PEVP_PKEY;
begin
  Result := PEM_read_bio_PUBKEY(APBIO, vTemp, nil, nil);
  if Result = nil then
    raise Exception.Create('生成RSA密钥对象失败');
end;

class procedure TLEOOpenSSLCipher.LoadLib;
begin
  if not Load() then
      raise Exception.CreateFmt('加载ssl库时出错，请检查ssl库文件是否存在或正确,路经:%s!', [GetSSLPath()]);
end;

class function TLEOOpenSSLCipher.Md5WithRSASign(const AContent: string;
  ACotentEncoding: TEncoding; const APrivateKey: string): string;
begin
  LoadLib();
  Result := RSASign(EVP_md5(), AContent, ACotentEncoding, APrivateKey);
end;

class function TLEOOpenSSLCipher.RSASign(APEVP_MD: PEVP_MD; const AContent: string; ACotentEncoding: TEncoding;
  ARSA: PRSA): string;
var
  vCtx : EVP_MD_CTX;
  //vBuf_In:Pointer
  vStringStream: TStringStream;
  vHashedDataLen, vSignedDataLen :cardinal;
  vHashedData, vSignedData:array [0..10240] of byte;
begin
  if ARSA  = nil then raise Exception.Create('RSA签名前出错:RSA密钥为空');

  if ACotentEncoding = nil then ACotentEncoding := TEncoding.UTF8;

  vStringStream := TStringStream.Create(AContent, ACotentEncoding);
  try
    EVP_MD_CTX_init(@vCtx);            //初始化
    EVP_SignInit(@vCtx,       APEVP_MD);    //将需要使用的摘要算法存入ctxl中
    EVP_SignUpdate(@vCtx,     @vStringStream.Bytes[0],  vStringStream.Size);//存入编码值
    EVP_DigestFinal_ex(@vCtx, PIdAnsiChar(@vHashedData[0]), vHashedDataLen);    //求取编码的长度为m_len摘要值存入m中

    RSA_sign(APEVP_MD._type,
            PIdAnsiChar(@vHashedData[0]),
            vHashedDataLen,
            PIdAnsiChar(@vSignedData[0]),
            @vSignedDataLen,
            ARSA); //64为SHA1的NID
    EVP_MD_CTX_cleanup(@vCtx);

    Result := TNetEncoding.Base64.EncodeBytesToString(@vSignedData[0], vSignedDataLen);
  finally
    vStringStream.Free;
  end;
end;

class function TLEOOpenSSLCipher.RSASign(APEVP_MD: PEVP_MD;
  const AContent: string; ACotentEncoding: TEncoding;
  const APrivateKey: string): string;
var
  vP_BioKey: PBIO;
  vP_Rsa: PRSA;
  vPrivateKeyStream: TStringStream;
begin
  LoadLib();
  vPrivateKeyStream := TStringStream.Create(APrivateKey, TEncoding.ASCII);
  try
    vP_BioKey := BIO_new_mem_buf(vPrivateKeyStream.Memory, vPrivateKeyStream.Size);
    vP_Rsa    := GetPrivateRSAKey(vP_BioKey);
    Result:= RSASign(APEVP_MD, AContent, ACotentEncoding, vP_Rsa);
    BIO_free(vP_BioKey);
  finally
    vPrivateKeyStream.Free;
  end;
end;

class function TLEOOpenSSLCipher.RSASignWith(AMethod: TLeoRSAWithMethod;
  const AContent: string; ACotentEncoding: TEncoding;
  const APrivateKey: string): string;
begin
  LoadLib();
  Result := RSASign(GetEVPMD(AMethod), AContent, ACotentEncoding, APrivateKey);
end;

class function TLEOOpenSSLCipher.RSAVerify(APEVP_MD: PEVP_MD;
  const AContent: string; ACotentEncoding: TEncoding;  const ASignedData: string; AEVP_PKEY: PEVP_PKEY): Boolean;
var
  vCtx : EVP_MD_CTX;
  //vBuf_In:Pointer
  vContentStream: TStringStream;
  vMemoStream: TMemoryStream;
  vHashedDataLen:cardinal;
  vHashedData:array [0..19] of byte;
  vVerifiedData: TBytes;
  vRet: Integer;
begin
  if AEVP_PKEY  = nil then raise Exception.Create('RSA签名前出错:RSA密钥为空');

  if ACotentEncoding = nil then ACotentEncoding := TEncoding.UTF8;

  vContentStream := TStringStream.Create(AContent, ACotentEncoding);
  vMemoStream   := TMemoryStream.Create;
  try
    EVP_MD_CTX_init(@vCtx);            //初始化
    EVP_SignInit(@vCtx, APEVP_MD);    //将需要使用的摘要算法存入ctxl中
    EVP_SignUpdate(@vCtx,   @vContentStream.Bytes[0],  vContentStream.Size);    //存入编码值
    EVP_DigestFinal_ex(@vCtx, PIdAnsiChar(@vHashedData[0]), vHashedDataLen);    //求取编码的长度为m_len摘要值存入m中

    vVerifiedData := TNetEncoding.Base64.DecodeStringToBytes(ASignedData);

    vRet := RSA_Verify(  APEVP_MD._type,
                          PIdAnsiChar(@vHashedData[0]),
                          vHashedDataLen,
                          PIdAnsiChar(@vVerifiedData[0]),
                          Length(vVerifiedData),
                          AEVP_PKEY.pkey.rsa);
    EVP_MD_CTX_cleanup(@vCtx);
    Result := (vRet = 1);
  finally
    vContentStream.Free;
    vMemoStream.Free;
  end;
end;

class function TLEOOpenSSLCipher.RSAVerify(APEVP_MD: PEVP_MD;
  const AContent: string; ACotentEncoding: TEncoding;  const ASignedData: string;
  const APublicKey: string): Boolean;
var
  vP_BioKey: PBIO;
  vP_Rsa: PEVP_PKEY;
  vPublicKeyStream: TStringStream;
begin
  LoadLib();
  vPublicKeyStream := TStringStream.Create(APublicKey, TEncoding.ASCII);
  try
    vP_BioKey := BIO_new_mem_buf(vPublicKeyStream.Memory, vPublicKeyStream.Size);
    vP_Rsa    := GetPublicRSAKey(vP_BioKey);
    Result:= RSAVerify(APEVP_MD, AContent, ACotentEncoding, ASignedData, vP_Rsa);
    BIO_free(vP_BioKey);
  finally
    vPublicKeyStream.Free;
  end;
end;

class function TLEOOpenSSLCipher.RSAVerifyWith(AMethod: TLeoRSAWithMethod;
  const AContent: string; ACotentEncoding: TEncoding; const ASignedData,
  APublicKey: string): Boolean;
begin
  LoadLib();
  Result := RSAVerify(GetEVPMD(AMethod), AContent, ACotentEncoding, ASignedData, APublicKey);
end;

class function TLEOOpenSSLCipher.Sha1WithRSASignByKeyFile(const AContent: string; ACotentEncoding: TEncoding;
  const APrivateKeyFile: string): string;
var
  vP_BioKey: PBIO;
  vP_Rsa: PRSA;
begin
  LoadLib();
  vP_BioKey := BIO_new(BIO_s_file());
  BIO_read_filename(vP_BioKey, PIdAnsiChar(APrivateKeyFile));
  vP_Rsa    := GetPrivateRSAKey(vP_BioKey);
  Result:= RSASign(EVP_sha1(), AContent, ACotentEncoding, vP_Rsa);
end;

class function TLEOOpenSSLCipher.Sha1WithRSAVerify(const AContent: string;
  ACotentEncoding: TEncoding;const ASignedData: string; const APublicKey: string): Boolean;
begin
  LoadLib();
  Result := RSAVerify(EVP_sha1(), AContent, ACotentEncoding, ASignedData, APublicKey)
end;

class function TLEOOpenSSLCipher.Sha1WithRSASign(const AContent: string; ACotentEncoding: TEncoding; const APrivateKey: string): string;
begin
  LoadLib();
  Result := RSASign(EVP_sha1(), AContent, ACotentEncoding, APrivateKey);
end;


{$ELSE}
implementation
{$ENDIF}


end.
