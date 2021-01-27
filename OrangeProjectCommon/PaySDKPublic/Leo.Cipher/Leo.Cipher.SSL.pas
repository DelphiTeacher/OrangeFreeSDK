unit Leo.Cipher.SSL;

interface
uses
  {$IF CompilerVersion <= 16}
  Leo.Encoding,
  {$IFEND}
  Leo.Cipher.RSAMethod,
  SysUtils;

type
  TLeoSSLCipher = class
  public
    function RSASign( AMethod: TLeoRSAWithMethod;
                      const AContent: string;
                      ACotentEncoding: TEncoding;
                      const APrivateKey: string): string; virtual; abstract;
    function RSAVerify( AMethod: TLeoRSAWithMethod;
                        const AContent: string;
                        ACotentEncoding: TEncoding;
                        const ASignedData: string;
                        const APublicKey: string): Boolean; virtual; abstract;
  end;

  TLeoSSLCipherClass = class of TLeoSSLCipher;

implementation

{ TLeoSSLCipher }


end.
