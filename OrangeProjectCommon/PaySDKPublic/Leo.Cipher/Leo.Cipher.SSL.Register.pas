unit Leo.Cipher.SSL.Register;

interface
uses
  Leo.Cipher.SSL;

type
  TLeoSSLCipherRegiester = class
  public
    class procedure RegisterSSLCipherClass(ASSLClipherClass: TLeoSSLCipherClass);
    class function GetRegistered: TLeoSSLCipherClass;
  end;

implementation
var
  _Registered: TLeoSSLCipherClass;

{ TLeoSSLCipherRegiester }

class function TLeoSSLCipherRegiester.GetRegistered: TLeoSSLCipherClass;
begin
  Result := _Registered;
end;

class procedure TLeoSSLCipherRegiester.RegisterSSLCipherClass(
  ASSLClipherClass: TLeoSSLCipherClass);
begin
  _Registered := ASSLClipherClass;
end;

end.
