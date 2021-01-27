program RSA_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFmxRSAMain in 'UnitFmxRSAMain.pas' {Form1},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  uTPLb_Asymetric in '..\..\Source\LockBox3-master\run\RSA\uTPLb_Asymetric.pas',
  uTPLb_RSA_Engine in '..\..\Source\LockBox3-master\run\RSA\uTPLb_RSA_Engine.pas',
  uTPLb_RSA_Primitives in '..\..\Source\LockBox3-master\run\RSA\uTPLb_RSA_Primitives.pas',
  uTPLb_BlockCipher in '..\..\Source\LockBox3-master\run\cryptography\uTPLb_BlockCipher.pas',
  uTPLb_HashDsc in '..\..\Source\LockBox3-master\run\cryptography\uTPLb_HashDsc.pas',
  uTPLb_StreamCipher in '..\..\Source\LockBox3-master\run\cryptography\uTPLb_StreamCipher.pas',
  uTPLb_StreamToBlock in '..\..\Source\LockBox3-master\run\cryptography\uTPLb_StreamToBlock.pas',
  FlyUtils.LcokBox3.Common in '..\..\Source\FlyUtils.LcokBox3.Common.pas',
  DCPtwofish_LB3Modified in '..\..\Source\LockBox3-master\run\ciphers\DCPtwofish_LB3Modified.pas',
  uTPLb_3DES in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_3DES.pas',
  uTPLb_AES in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_AES.pas',
  uTPLb_Base64 in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_Base64.pas',
  uTPLb_BlowFish in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_BlowFish.pas',
  uTPLb_CBC in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_CBC.pas',
  uTPLb_CFB_8Bit in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_CFB_8Bit.pas',
  uTPLb_CFB_Block in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_CFB_Block.pas',
  uTPLb_CTR in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_CTR.pas',
  uTPLb_DES in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_DES.pas',
  uTPLb_ECB in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_ECB.pas',
  uTPLb_OFB in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_OFB.pas',
  uTPLb_PCBC in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_PCBC.pas',
  uTPLb_TwoFish in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_TwoFish.pas',
  uTPLb_XXTEA in '..\..\Source\LockBox3-master\run\ciphers\uTPLb_XXTEA.pas',
  uTPLb_MD5 in '..\..\Source\LockBox3-master\run\hashes\uTPLb_MD5.pas',
  uTPLb_SHA1 in '..\..\Source\LockBox3-master\run\hashes\uTPLb_SHA1.pas',
  uTPLb_SHA2 in '..\..\Source\LockBox3-master\run\hashes\uTPLb_SHA2.pas',
  uTPLb_BaseNonVisualComponent in '..\..\Source\LockBox3-master\run\utilities\uTPLb_BaseNonVisualComponent.pas',
  uTPLb_BinaryUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_BinaryUtils.pas',
  uTPLb_CipherUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_CipherUtils.pas',
  uTPLb_D7Compatibility in '..\..\Source\LockBox3-master\run\utilities\uTPLb_D7Compatibility.pas',
  uTPLb_Decorators in '..\..\Source\LockBox3-master\run\utilities\uTPLb_Decorators.pas',
  uTPLb_HugeCardinal in '..\..\Source\LockBox3-master\run\utilities\uTPLb_HugeCardinal.pas',
  uTPLb_HugeCardinalUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_HugeCardinalUtils.pas',
  uTPLb_I18n in '..\..\Source\LockBox3-master\run\utilities\uTPLb_I18n.pas',
  uTPLb_IntegerUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_IntegerUtils.pas',
  uTPLb_MemoryStreamPool in '..\..\Source\LockBox3-master\run\utilities\uTPLb_MemoryStreamPool.pas',
  uTPLb_PointerArithmetic in '..\..\Source\LockBox3-master\run\utilities\uTPLb_PointerArithmetic.pas',
  uTPLb_Random in '..\..\Source\LockBox3-master\run\utilities\uTPLb_Random.pas',
  uTPLb_StreamUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_StreamUtils.pas',
  uTPLb_StrUtils in '..\..\Source\LockBox3-master\run\utilities\uTPLb_StrUtils.pas',
  uTPLb_SVN_Keywords in '..\..\Source\LockBox3-master\run\utilities\uTPLb_SVN_Keywords.pas',
  uTPLb_Codec in '..\..\Source\LockBox3-master\run\library surface\uTPLb_Codec.pas',
  uTPLb_CodecIntf in '..\..\Source\LockBox3-master\run\library surface\uTPLb_CodecIntf.pas',
  uTPLb_Constants in '..\..\Source\LockBox3-master\run\library surface\uTPLb_Constants.pas',
  uTPLb_CryptographicLibrary in '..\..\Source\LockBox3-master\run\library surface\uTPLb_CryptographicLibrary.pas',
  uTPLb_Hash in '..\..\Source\LockBox3-master\run\library surface\uTPLb_Hash.pas',
  uTPLb_Signatory in '..\..\Source\LockBox3-master\run\library surface\uTPLb_Signatory.pas',
  uTPLb_SimpleBlockCipher in '..\..\Source\LockBox3-master\run\library surface\uTPLb_SimpleBlockCipher.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
