unit FlyUtils.Blowfish;
(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2016-02-29　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

//来源：史子荣 http://www.pefing.com
// Add CBC By 爱吃猪头肉。
// Add ZeroPadding By Flyign Wang.

 //目前 CBC 模式 需要测试。

{$define UNLIMITED}          // WASSENAAR_LIMITED, UNLIMITED
//{$define WASSENAAR_LIMITED}

interface

uses
  SysUtils,Classes, FlyUtils.CnXXX.Common;

//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。
// 如果您不喜欢 HEX 格式，您可以 返回 BASE64 格式。
// 在 XE7 上，可以 uses System.NetEncoding
// 调用 System.NetEncoding.Base64.Encode(使用 Tbytes 版本的参数);

 //所有的 Encoding 不赋值，默认就是 UTF8。

const
     {general constants}
     BLOCKSIZE = 8;          // Blowfish has an 8 byte block
     BUFFERSIZE = 4096;      // the buffer for file encryption

type SingleBytes = Record
     byte3: Byte; {LSB}
     byte2: BYTE;
     byte1: BYTE;
     byte0: BYTE; {MSB}
end;{SingleBytes}

type EKeyError = class(Exception);

type EFileError = class(Exception);

type EInputError = class(Exception);

type DoublWord = record
  case Integer Of
   0: (LWord: Int32);
   1: (w: singleBytes);
   2: (fByte: Array[0..3] of Byte);
 end;{DoublWord}

type PDoublWord = ^DoublWord;
type TBlock = array[0..(BLOCKSIZE - 1)] of Byte;
type PBlock  = ^TBlock;
PArray = array[0..17] of Int32;
SArray = array[0..255] of Int32;


type Tblf_Core_ctx = record
     P :            PArray;   //P数组
     S1:            SArray;   //第1个S盒
     S2:            SArray;   //第2个S盒
     S3:            SArray;   //第3个S盒
     S4:            SArray;   //第4个S盒
     case Integer of          // Encryption/decryption block buffer
          0: (ByteBuffer: TBlock);
          1: (LongBuffer: array[0..1] of Int32);
          2: (Int16Buffer: array[0..3] of UInt16);
end; {Tblf_ctx}

type Tblf_ctx = record
     KeyInit:       Boolean;  // Shows if the password has been initialised
     IVInit:        Boolean;  // Shows if the IV has been initialised
     IV:            TBlock;   // The Initialisation Vector
     ct:            TBlock;   // temporary buffer used in CBC, CFB and OFB modes
     CFB_OFB_n: Integer;
     LastIV: TBlock;
      case Integer of
          0: (CurrIV: TBlock);
          1: (CurrIVLB: array[0..1] of Int32);
          2: (CurrIVInt16: array[0..3] of UInt16);
     end; {Tblf_ctx}

type TBlowCore = class(TObject)
     ctx:          Tblf_Core_ctx;
     FPtrL:        PDoublWord;   //指向低32位数据
     FPtrR:        PDoublWord;   //指向高32位数据
public
     procedure     Blowfish_Core_Block_Encrypt;
     procedure     Blowfish_Core_Block_Decrypt;
end; {TBLowCore}

type TBlowfish = class(TObject)
  private
     FPaddingMode: TPaddingMode;
     FOnProcessProc: TOnProcessProc;
     FProcessProc: TProcessProc;
     FStringEncoding: TEncoding;
     FStringCRLFMode: TCRLFMode;
     FBlowCore:    TBlowCore;
     ctx:          Tblf_ctx;
     FBuffer:      array[0..BUFFERSIZE+BLOCKSIZE] of BYTE; {Local Copy of Data}
     PtrBuffer:    PBlock;
     FCipherMode:  TCipherMode;
     FStringMode:  TStringMode;
     procedure     Blowfish_Core_Key_Setup(KeyArray: array of Byte; const KeyLength: integer);
     procedure     EncryptBlockMode;
     procedure     DecryptBlockMode;
     procedure     InitArray;
     procedure     EndianEncBlock;
     procedure     EndianDecBlock;
//     function      EncodeBase64Bytes(InputBytes: Tbytes): string;
//     function      DecodeBase64Bytes(InputString: string): Tbytes;
     procedure     CheckKeys;
     procedure     SetStringEncoding(Value: TEncoding);
  public
     constructor   Create;
     destructor    Destroy; override;
     procedure     InitialiseString(const Key: string;
       AEncoding: TEncoding = nil);
     procedure     LoadIVString(const IVString: string;
       AEncoding: TEncoding = nil);
     procedure     ProcessIV(EncryptMode: Boolean; BeforeBlock: Boolean;
        ResetIV: Boolean = False);
     procedure     EncBlock (const Input: TBlock; var Output: TBlock);
     procedure     DecBlock (const Input: TBlock; var Output: TBlock);
     procedure     EncBuffer(const Len: integer);
     procedure     DecBuffer(const Len: integer);
     procedure     EncString(const Input: string; var Output: string);
     procedure     DecString(const Input: string; var Output: string);
     procedure     Burn;
     function      GetVersion: string;
     procedure     SetCipherMode(const Value: TCipherMode);
     function      GetCipherMode: TCipherMode;
     procedure     SetStringMode(const Value: TStringMode);
     function      GetStringMode: TStringMode;

     property StringEncoding: TEncoding read FStringEncoding write SetStringEncoding;
     property StringCRLFMode: TCRLFMode read FStringCRLFMode write FStringCRLFMode default rlCRLF;
     property StringMode: TStringMode read GetStringMode write SetStringMode;
     property CipherMode: TCipherMode read GetCipherMode write SetCipherMode;
     property PaddingMode: TPaddingMode read FPaddingMode write FPaddingMode default pmZeroPadding;
     property ProcessProc: TProcessProc read FProcessProc write FProcessProc;
  published
     property OnProcessProc: TOnProcessProc read FOnProcessProc write FOnProcessProc;
end;



implementation

const
     TempS1: SArray = (
     $d1310ba6, $98dfb5ac, $2ffd72db, $d01adfb7,
     $b8e1afed, $6a267e96, $ba7c9045, $f12c7f99,
     $24a19947, $b3916cf7, $0801f2e2, $858efc16,
     $636920d8, $71574e69, $a458fea3, $f4933d7e,

     $0d95748f, $728eb658, $718bcd58, $82154aee,
     $7b54a41d, $c25a59b5, $9c30d539, $2af26013,
     $c5d1b023, $286085f0, $ca417918, $b8db38ef,
     $8e79dcb0, $603a180e, $6c9e0e8b, $b01e8a3e,

     $d71577c1, $bd314b27, $78af2fda, $55605c60,
     $e65525f3, $aa55ab94, $57489862, $63e81440,
     $55ca396a, $2aab10b6, $b4cc5c34, $1141e8ce,
     $a15486af, $7c72e993, $b3ee1411, $636fbc2a,

     $2ba9c55d, $741831f6, $ce5c3e16, $9b87931e,
     $afd6ba33, $6c24cf5c, $7a325381, $28958677,
     $3b8f4898, $6b4bb9af, $c4bfe81b, $66282193,
     $61d809cc, $fb21a991, $487cac60, $5dec8032,

     $ef845d5d, $e98575b1, $dc262302, $eb651b88,
     $23893e81, $d396acc5, $0f6d6ff3, $83f44239,
     $2e0b4482, $a4842004, $69c8f04a, $9e1f9b5e,
     $21c66842, $f6e96c9a, $670c9c61, $abd388f0,

     $6a51a0d2, $d8542f68, $960fa728, $ab5133a3,
     $6eef0b6c, $137a3be4, $ba3bf050, $7efb2a98,
     $a1f1651d, $39af0176, $66ca593e, $82430e88,
     $8cee8619, $456f9fb4, $7d84a5c3, $3b8b5ebe,

     $e06f75d8, $85c12073, $401a449f, $56c16aa6,
     $4ed3aa62, $363f7706, $1bfedf72, $429b023d,
     $37d0d724, $d00a1248, $db0fead3, $49f1c09b,
     $075372c9, $80991b7b, $25d479d8, $f6e8def7,

     $e3fe501a, $b6794c3b, $976ce0bd, $04c006ba,
     $c1a94fb6, $409f60c4, $5e5c9ec2, $196a2463,
     $68fb6faf, $3e6c53b5, $1339b2eb, $3b52ec6f,
     $6dfc511f, $9b30952c, $cc814544, $af5ebd09,

     $bee3d004, $de334afd, $660f2807, $192e4bb3,
     $c0cba857, $45c8740f, $d20b5f39, $b9d3fbdb,
     $5579c0bd, $1a60320a, $d6a100c6, $402c7279,
     $679f25fe, $fb1fa3cc, $8ea5e9f8, $db3222f8,

     $3c7516df, $fd616b15, $2f501ec8, $ad0552ab,
     $323db5fa, $fd238760, $53317b48, $3e00df82,
     $9e5c57bb, $ca6f8ca0, $1a87562e, $df1769db,
     $d542a8f6, $287effc3, $ac6732c6, $8c4f5573,

     $695b27b0, $bbca58c8, $e1ffa35d, $b8f011a0,
     $10fa3d98, $fd2183b8, $4afcb56c, $2dd1d35b,
     $9a53e479, $b6f84565, $d28e49bc, $4bfb9790,
     $e1ddf2da, $a4cb7e33, $62fb1341, $cee4c6e8,

     $ef20cada, $36774c01, $d07e9efe, $2bf11fb4,
     $95dbda4d, $ae909198, $eaad8e71, $6b93d5a0,
     $d08ed1d0, $afc725e0, $8e3c5b2f, $8e7594b7,
     $8ff6e2fb, $f2122b64, $8888b812, $900df01c,

     $4fad5ea0, $688fc31c, $d1cff191, $b3a8c1ad,
     $2f2f2218, $be0e1777, $ea752dfe, $8b021fa1,
     $e5a0cc0f, $b56f74e8, $18acf3d6, $ce89e299,
     $b4a84fe0, $fd13e0b7, $7cc43b81, $d2ada8d9,

     $165fa266, $80957705, $93cc7314, $211a1477,
     $e6ad2065, $77b5fa86, $c75442f5, $fb9d35cf,
     $ebcdaf0c, $7b3e89a0, $d6411bd3, $ae1e7e49,
     $00250e2d, $2071b35e, $226800bb, $57b8e0af,

     $2464369b, $f009b91e, $5563911d, $59dfa6aa,
     $78c14389, $d95a537f, $207d5ba2, $02e5b9c5,
     $83260376, $6295cfa9, $11c81968, $4e734a41,
     $b3472dca, $7b14a94a, $1b510052, $9a532915,

     $d60f573f, $bc9bc6e4, $2b60a476, $81e67400,
     $08ba6fb5, $571be91f, $f296ec6b, $2a0dd915,
     $b6636521, $e7b9f9b6, $ff34052e, $c5855664,
     $53b02d5d, $a99f8fa1, $08ba4799, $6e85076a);
     //second 256
     TempS2: SArray = (
     $4b7a70e9, $b5b32944, $db75092e, $c4192623,
     $ad6ea6b0, $49a7df7d, $9cee60b8, $8fedb266,
     $ecaa8c71, $699a17ff, $5664526c, $c2b19ee1,
     $193602a5, $75094c29, $a0591340, $e4183a3e,

     $3f54989a, $5b429d65, $6b8fe4d6, $99f73fd6,
     $a1d29c07, $efe830f5, $4d2d38e6, $f0255dc1,
     $4cdd2086, $8470eb26, $6382e9c6, $021ecc5e,
     $09686b3f, $3ebaefc9, $3c971814, $6b6a70a1,

     $687f3584, $52a0e286, $b79c5305, $aa500737,
     $3e07841c, $7fdeae5c, $8e7d44ec, $5716f2b8,
     $b03ada37, $f0500c0d, $f01c1f04, $0200b3ff,
     $ae0cf51a, $3cb574b2, $25837a58, $dc0921bd,

     $d19113f9, $7ca92ff6, $94324773, $22f54701,
     $3ae5e581, $37c2dadc, $c8b57634, $9af3dda7,
     $a9446146, $0fd0030e, $ecc8c73e, $a4751e41,
     $e238cd99, $3bea0e2f, $3280bba1, $183eb331,

     $4e548b38, $4f6db908, $6f420d03, $f60a04bf,
     $2cb81290, $24977c79, $5679b072, $bcaf89af,
     $de9a771f, $d9930810, $b38bae12, $dccf3f2e,
     $5512721f, $2e6b7124, $501adde6, $9f84cd87,

     $7a584718, $7408da17, $bc9f9abc, $e94b7d8c,
     $ec7aec3a, $db851dfa, $63094366, $c464c3d2,
     $ef1c1847, $3215d908, $dd433b37, $24c2ba16,
     $12a14d43, $2a65c451, $50940002, $133ae4dd,

     $71dff89e, $10314e55, $81ac77d6, $5f11199b,
     $043556f1, $d7a3c76b, $3c11183b, $5924a509,
     $f28fe6ed, $97f1fbfa, $9ebabf2c, $1e153c6e,
     $86e34570, $eae96fb1, $860e5e0a, $5a3e2ab3,

     $771fe71c, $4e3d06fa, $2965dcb9, $99e71d0f,
     $803e89d6, $5266c825, $2e4cc978, $9c10b36a,
     $c6150eba, $94e2ea78, $a5fc3c53, $1e0a2df4,
     $f2f74ea7, $361d2b3d, $1939260f, $19c27960,

     $5223a708, $f71312b6, $ebadfe6e, $eac31f66,
     $e3bc4595, $a67bc883, $b17f37d1, $018cff28,
     $c332ddef, $be6c5aa5, $65582185, $68ab9802,
     $eecea50f, $db2f953b, $2aef7dad, $5b6e2f84,

     $1521b628, $29076170, $ecdd4775, $619f1510,
     $13cca830, $eb61bd96, $0334fe1e, $aa0363cf,
     $b5735c90, $4c70a239, $d59e9e0b, $cbaade14,
     $eecc86bc, $60622ca7, $9cab5cab, $b2f3846e,

     $648b1eaf, $19bdf0ca, $a02369b9, $655abb50,
     $40685a32, $3c2ab4b3, $319ee9d5, $c021b8f7,
     $9b540b19, $875fa099, $95f7997e, $623d7da8,
     $f837889a, $97e32d77, $11ed935f, $16681281,

     $0e358829, $c7e61fd6, $96dedfa1, $7858ba99,
     $57f584a5, $1b227263, $9b83c3ff, $1ac24696,
     $cdb30aeb, $532e3054, $8fd948e4, $6dbc3128,
     $58ebf2ef, $34c6ffea, $fe28ed61, $ee7c3c73,

     $5d4a14d9, $e864b7e3, $42105d14, $203e13e0,
     $45eee2b6, $a3aaabea, $db6c4f15, $facb4fd0,
     $c742f442, $ef6abbb5, $654f3b1d, $41cd2105,
     $d81e799e, $86854dc7, $e44b476a, $3d816250,

     $cf62a1f2, $5b8d2646, $fc8883a0, $c1c7b6a3,
     $7f1524c3, $69cb7492, $47848a0b, $5692b285,
     $095bbf00, $ad19489d, $1462b174, $23820e00,
     $58428d2a, $0c55f5ea, $1dadf43e, $233f7061,

     $3372f092, $8d937e41, $d65fecf1, $6c223bdb,
     $7cde3759, $cbee7460, $4085f2a7, $ce77326e,
     $a6078084, $19f8509e, $e8efd855, $61d99735,
     $a969a7aa, $c50c06c2, $5a04abfc, $800bcadc,

     $9e447a2e, $c3453484, $fdd56705, $0e1e9ec9,
     $db73dbd3, $105588cd, $675fda79, $e3674340,
     $c5c43465, $713e38d8, $3d28f89e, $f16dff20,
     $153e21e7, $8fb03d4a, $e6e39f2b, $db83adf7);
     //Third 256
     TempS3: SArray = (
     $e93d5a68, $948140f7, $f64c261c, $94692934,
     $411520f7, $7602d4f7, $bcf46b2e, $d4a20068,
     $d4082471, $3320f46a, $43b7d4b7, $500061af,
     $1e39f62e, $97244546, $14214f74, $bf8b8840,

     $4d95fc1d, $96b591af, $70f4ddd3, $66a02f45,
     $bfbc09ec, $03bd9785, $7fac6dd0, $31cb8504,
     $96eb27b3, $55fd3941, $da2547e6, $abca0a9a,
     $28507825, $530429f4, $0a2c86da, $e9b66dfb,

     $68dc1462, $d7486900, $680ec0a4, $27a18dee,
     $4f3ffea2, $e887ad8c, $b58ce006, $7af4d6b6,
     $aace1e7c, $d3375fec, $ce78a399, $406b2a42,
     $20fe9e35, $d9f385b9, $ee39d7ab, $3b124e8b,

     $1dc9faf7, $4b6d1856, $26a36631, $eae397b2,
     $3a6efa74, $dd5b4332, $6841e7f7, $ca7820fb,
     $fb0af54e, $d8feb397, $454056ac, $ba489527,
     $55533a3a, $20838d87, $fe6ba9b7, $d096954b,

     $55a867bc, $a1159a58, $cca92963, $99e1db33,
     $a62a4a56, $3f3125f9, $5ef47e1c, $9029317c,
     $fdf8e802, $04272f70, $80bb155c, $05282ce3,
     $95c11548, $e4c66d22, $48c1133f, $c70f86dc,

     $07f9c9ee, $41041f0f, $404779a4, $5d886e17,
     $325f51eb, $d59bc0d1, $f2bcc18f, $41113564,
     $257b7834, $602a9c60, $dff8e8a3, $1f636c1b,
     $0e12b4c2, $02e1329e, $af664fd1, $cad18115,

     $6b2395e0, $333e92e1, $3b240b62, $eebeb922,
     $85b2a20e, $e6ba0d99, $de720c8c, $2da2f728,
     $d0127845, $95b794fd, $647d0862, $e7ccf5f0,
     $5449a36f, $877d48fa, $c39dfd27, $f33e8d1e,

     $0a476341, $992eff74, $3a6f6eab, $f4f8fd37,
     $a812dc60, $a1ebddf8, $991be14c, $db6e6b0d,
     $c67b5510, $6d672c37, $2765d43b, $dcd0e804,
     $f1290dc7, $cc00ffa3, $b5390f92, $690fed0b,

     $667b9ffb, $cedb7d9c, $a091cf0b, $d9155ea3,
     $bb132f88, $515bad24, $7b9479bf, $763bd6eb,
     $37392eb3, $cc115979, $8026e297, $f42e312d,
     $6842ada7, $c66a2b3b, $12754ccc, $782ef11c,

     $6a124237, $b79251e7, $06a1bbe6, $4bfb6350,
     $1a6b1018, $11caedfa, $3d25bdd8, $e2e1c3c9,
     $44421659, $0a121386, $d90cec6e, $d5abea2a,
     $64af674e, $da86a85f, $bebfe988, $64e4c3fe,

     $9dbc8057, $f0f7c086, $60787bf8, $6003604d,
     $d1fd8346, $f6381fb0, $7745ae04, $d736fccc,
     $83426b33, $f01eab71, $b0804187, $3c005e5f,
     $77a057be, $bde8ae24, $55464299, $bf582e61,

     $4e58f48f, $f2ddfda2, $f474ef38, $8789bdc2,
     $5366f9c3, $c8b38e74, $b475f255, $46fcd9b9,
     $7aeb2661, $8b1ddf84, $846a0e79, $915f95e2,
     $466e598e, $20b45770, $8cd55591, $c902de4c,

     $b90bace1, $bb8205d0, $11a86248, $7574a99e,
     $b77f19b6, $e0a9dc09, $662d09a1, $c4324633,
     $e85a1f02, $09f0be8c, $4a99a025, $1d6efe10,
     $1ab93d1d, $0ba5a4df, $a186f20f, $2868f169,

     $dcb7da83, $573906fe, $a1e2ce9b, $4fcd7f52,
     $50115e01, $a70683fa, $a002b5c4, $0de6d027,
     $9af88c27, $773f8641, $c3604c06, $61a806b5,
     $f0177a28, $c0f586e0, $006058aa, $30dc7d62,

     $11e69ed7, $2338ea63, $53c2dd94, $c2c21634,
     $bbcbee56, $90bcb6de, $ebfc7da1, $ce591d76,
     $6f05e409, $4b7c0188, $39720a3d, $7c927c24,
     $86e3725f, $724d9db9, $1ac15bb4, $d39eb8fc,

     $ed545578, $08fca5b5, $d83d7cd3, $4dad0fc4,
     $1e50ef5e, $b161e6f8, $a28514d9, $6c51133c,
     $6fd5c7e7, $56e14ec4, $362abfce, $ddc6c837,
     $d79a3234, $92638212, $670efa8e, $406000e0);
     //Fourth 256
     TempS4: SArray = (
     $3a39ce37, $d3faf5cf, $abc27737, $5ac52d1b,
     $5cb0679e, $4fa33742, $d3822740, $99bc9bbe,
     $d5118e9d, $bf0f7315, $d62d1c7e, $c700c47b,
     $b78c1b6b, $21a19045, $b26eb1be, $6a366eb4,

     $5748ab2f, $bc946e79, $c6a376d2, $6549c2c8,
     $530ff8ee, $468dde7d, $d5730a1d, $4cd04dc6,
     $2939bbdb, $a9ba4650, $ac9526e8, $be5ee304,
     $a1fad5f0, $6a2d519a, $63ef8ce2, $9a86ee22,

     $c089c2b8, $43242ef6, $a51e03aa, $9cf2d0a4,
     $83c061ba, $9be96a4d, $8fe51550, $ba645bd6,
     $2826a2f9, $a73a3ae1, $4ba99586, $ef5562e9,
     $c72fefd3, $f752f7da, $3f046f69, $77fa0a59,

     $80e4a915, $87b08601, $9b09e6ad, $3b3ee593,
     $e990fd5a, $9e34d797, $2cf0b7d9, $022b8b51,
     $96d5ac3a, $017da67d, $d1cf3ed6, $7c7d2d28,
     $1f9f25cf, $adf2b89b, $5ad6b472, $5a88f54c,

     $e029ac71, $e019a5e6, $47b0acfd, $ed93fa9b,
     $e8d3c48d, $283b57cc, $f8d56629, $79132e28,
     $785f0191, $ed756055, $f7960e44, $e3d35e8c,
     $15056dd4, $88f46dba, $03a16125, $0564f0bd,

     $c3eb9e15, $3c9057a2, $97271aec, $a93a072a,
     $1b3f6d9b, $1e6321f5, $f59c66fb, $26dcf319,
     $7533d928, $b155fdf5, $03563482, $8aba3cbb,
     $28517711, $c20ad9f8, $abcc5167, $ccad925f,

     $4de81751, $3830dc8e, $379d5862, $9320f991,
     $ea7a90c2, $fb3e7bce, $5121ce64, $774fbe32,
     $a8b6e37e, $c3293d46, $48de5369, $6413e680,
     $a2ae0810, $dd6db224, $69852dfd, $09072166,

     $b39a460a, $6445c0dd, $586cdecf, $1c20c8ae,
     $5bbef7dd, $1b588d40, $ccd2017f, $6bb4e3bb,
     $dda26a7e, $3a59ff45, $3e350a44, $bcb4cdd5,
     $72eacea8, $fa6484bb, $8d6612ae, $bf3c6f47,

     $d29be463, $542f5d9e, $aec2771b, $f64e6370,
     $740e0d8d, $e75b1357, $f8721671, $af537d5d,
     $4040cb08, $4eb4e2cc, $34d2466a, $0115af84,
     $e1b00428, $95983a1d, $06b89fb4, $ce6ea048,

     $6f3f3b82, $3520ab82, $011a1d4b, $277227f8,
     $611560b1, $e7933fdc, $bb3a792b, $344525bd,
     $a08839e1, $51ce794b, $2f32c9b7, $a01fbac9,
     $e01cc87e, $bcc7d1f6, $cf0111c3, $a1e8aac7,

     $1a908749, $d44fbd9a, $d0dadecb, $d50ada38,
     $0339c32a, $c6913667, $8df9317c, $e0b12b4f,
     $f79e59b7, $43f5bb3a, $f2d519ff, $27d9459c,
     $bf97222c, $15e6fc2a, $0f91fc71, $9b941525,

     $fae59361, $ceb69ceb, $c2a86459, $12baa8d1,
     $b6c1075e, $e3056a0c, $10d25065, $cb03a442,
     $e0ec6e0e, $1698db3b, $4c98a0be, $3278e964,
     $9f1f9532, $e0d392df, $d3a0342b, $8971f21e,

     $1b0a7441, $4ba3348c, $c5be7120, $c37632d8,
     $df359f8d, $9b992f2e, $e60b6f47, $0fe3f11d,
     $e54cda54, $1edad891, $ce6279cf, $cd3e7e6f,
     $1618b166, $fd2c1d05, $848fd2c5, $f6fb2299,

     $f523f357, $a6327623, $93a83531, $56cccd02,
     $acf08162, $5a75ebb5, $6e163697, $88d273cc,
     $de966292, $81b949d0, $4c50901b, $71c65614,
     $e6c6c7bd, $327a140a, $45e1d006, $c3f27b9a,

     $c9aa53fd, $62a80f00, $bb25bfe2, $35bdd2f6,
     $71126905, $b2040222, $b6cbcf7c, $cd769c2b,
     $53113ec0, $1640e3d3, $38abbd60, $2547adf0,
     $ba38209c, $f746ce76, $77afa1c5, $20756060,

     $85cbfe4e, $8ae88dd8, $7aaaf9b0, $4cf9aa7e,
     $1948c25c, $02fb8a8c, $01c36ae4, $d6ebe1f9,
     $90d4f869, $a65cdea0, $3f09252d, $c208e69f,
     $b74e6132, $ce77e25b, $578fdfe3, $3ac372e6);

const
     TempP: PArray = (
     $243f6a88, $85a308d3, $13198a2e, $03707344,
     $a4093822, $299f31d0, $082efa98, $ec4e6c89,
     $452821e6, $38d01377, $be5466cf, $34e90c6c,
     $c0ac29b7, $c97c50dd, $3f84d5b5, $b5470917,
     $9216d5d9, $8979fb1b);

//const
//     BinToAsc : Array [0..63] of Char =
//          ('+', '-','0','1','2','3','4','5','6','7',
//           '8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
//           'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d',
//           'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
//           't','u','v','w','x','y','z');

const
     MAXBYTES = 56;          // max number of bytes in the key
     N = 16;                 // Blowfish rounds (default 16)
     RELVER = '1.15';        // Version number
     LIT_COMPNAME            = 'Blowfish_Fmx';
     LIT_KEY_NOT_SET         = LIT_COMPNAME + ': Key not set';
     LIT_IV_NOT_SET          = LIT_COMPNAME + ': IV not set';
     LIT_KEY_LENGTH          = LIT_COMPNAME + ': Key must be between 1 and 56 bytes';
     LIT_INFILE_NOT_FOUND    = LIT_COMPNAME + ': Input file not found';
     LIT_CBC_NOT_SET         = LIT_COMPNAME + ': Mode must be CBC for CBCMAC';
     LIT_OUTFILE_OPEN_ERROR  = LIT_COMPNAME + ': Could not open output file';
     LIT_OUTFILE_WRITE_ERROR = LIT_COMPNAME + ': Error writing output file';
     LIT_INPUT_LENGTH        = LIT_COMPNAME + ': Input not valid - too short';

//function TBlowfish.EncodeBase64Bytes(InputBytes: TBytes): string;
//var
//  Counter:integer;
//  ReturnString:string;
//  b:Byte;
//  i:integer;
//  last:byte;
//  Flush:Boolean;
//  LengthInput:integer;
//begin
//  Counter := 0;
//  ReturnString := '';
//  Flush := False;
//  last := 0;
//  if (Length(InputBytes) mod 3) <> 0 then
//    begin
//      InputBytes := InputBytes + [0];
//      Flush := True;
//    end;
//  LengthInput := Length(InputBytes);
//  i := 1;
//  while (i <= LengthInput) do
//    begin
//      if i <= LengthInput then
//        b := InputBytes[i - 1]
//      else
//        b := 0;
//      case Counter of
//        0:
//          begin
//            ReturnString := ReturnString + BinToAsc[(b shr 2)];
//            last := b;
//          end;
//        1:
//          begin
//            ReturnString := ReturnString + BinToAsc[((last and $3) shl 4) or ((b and $F0) shr 4) ];
//            last := b;
//          end;
//        2:
//          begin
//            ReturnString := ReturnString + BinToAsc[((last and $F) shl 2) or ((b and $C0) shr 6)];
//            if not (Flush and (i = LengthInput)) then
//              ReturnString := ReturnString + BinToAsc[(b and $3F)];
//            last := 0;
//          end;
//      end; {case}
//
//      Inc(Counter);
//      if Counter = 3 then
//        Counter := 0;
//      Inc(i);
//  end; {while}
//  Result := ReturnString;
//end; {EncodeBase64Bytes}
//
//function TBlowfish.DecodeBase64Bytes(InputString: string): Tbytes;
//     function  DecodeBase64(b: byte): byte;
//     begin
//          if (b >= Ord('0')) and (b <= Ord('9')) then
//          begin
//               Result := b - Ord('0') + 2;
//               Exit;
//          end;
//          if (b >= Ord('A')) and (b <= Ord('Z')) then
//          begin
//               Result := b - Ord('A') + 12;
//               Exit;
//          end;
//          if (b >= Ord('a')) and (b <= Ord('z')) then
//          begin
//               Result := b - Ord('a') + 38;
//               Exit;
//          end;
//          if b = Ord('+') then
//          begin
//               Result := 0;
//               Exit;
//          end;
//          if b = Ord('-') then
//          begin
//               Result := 1;
//               Exit;
//          end;
//          raise EConvertError.Create(LIT_BASE64CNV);
//     end; {DecodeBase64}
//var
//     Counter:      integer;
//     c:            Char;
//     last:         byte;
//     this:         byte;
//     ResultIndex,
//     i:            integer;
//begin
//     Counter := 0;
//     last := 0;
//     ResultIndex := 0;
//     SetLength(Result, Length(InputString));
//     FillChar(Result[0], Length(Result), 0);
//     for i := 1 to Length(InputString) do
//     begin
//          c := InputString[Low(InputString) + i - 1];
//          case Counter of
//          0:
//               begin
//                    last := DecodeBase64(Ord(c)) shl 2;
//               end;
//          1:
//               begin
//                    this := DecodeBase64(Ord(c));
//                    Result[ResultIndex] := (last or (this shr 4)) and $ff;
//                    inc(ResultIndex);
//                    last := this shl 4;
//               end;
//          2:
//               begin
//                    this := DecodeBase64(Ord(c));
//                    Result[ResultIndex] := (last or (this shr 2)) and $ff;
//                    inc(ResultIndex);
//                    last := this shl 6;
//               end;
//          3:
//               begin
//                    this := DecodeBase64(Ord(c));
//                    Result[ResultIndex] := (last or this) and $ff;
//                    inc(ResultIndex);
//                    last := 0;
//               end;
//          end; {case}
//
//          Inc(Counter);
//          if Counter = 4 then
//          begin
//               Counter := 0;
//          end; {if}
//     end; {for}
//  SetLength(Result, ResultIndex);
//end; {DecodeBase64Bytes}

function TBlowfish.GetVersion;
begin
     // return the version string
     Result := LIT_COMPNAME + ' ' + RELVER;
end; {GetVersion}

procedure TBlowfish.InitialiseString(const Key: string;
       AEncoding: TEncoding = nil);
var
  KeyArray: array[0..255] of Byte;
  KeyBytes: TBytes;
begin
  if (Length(Key) < 1) or (Length(Key) > MAXBYTES) then
    begin
      raise EKeyError.Create(LIT_KEY_LENGTH);
      Exit;
    end;

  if AEncoding = nil then
    AEncoding := TEncoding.UTF8;
  KeyBytes := AEncoding.GetBytes(Key);

  FillChar(ctx.ct, Sizeof(ctx.ct), #0);
  FillChar(FBlowCore.ctx.ByteBuffer, Sizeof(FBlowCore.ctx.ByteBuffer), #0);
  FillChar(FBlowCore.ctx.S1, Sizeof(FBlowCore.ctx.S1), #0);
  FillChar(FBlowCore.ctx.S2, Sizeof(FBlowCore.ctx.S2), #0);
  FillChar(FBlowCore.ctx.S3, Sizeof(FBlowCore.ctx.S3), #0);
  FillChar(FBlowCore.ctx.S3, Sizeof(FBlowCore.ctx.S4), #0);
  FillChar(FBlowCore.ctx.P, Sizeof(FBlowCore.ctx.P), #0);
  FillChar(KeyArray, Sizeof(KeyArray), #0);

  {$ifdef WASSENAAR_LIMITED}
  for i := 1 to Length(KeyBytes) do
    KeyArray[(i-1) mod 8] := KeyBytes[i - 1];
  {$else}
//  for i := 1 to Length(KeyBytes) do
//    KeyArray[i-1] := KeyBytes[i - 1];
    Move(KeyBytes[0], KeyArray[0], Length(KeyBytes));
  {$endif}
  Blowfish_Core_Key_Setup(KeyArray, Length(KeyBytes));
  ctx.KeyInit := True;
end;

procedure TBlowfish.LoadIVString(Const IVString: string;
       AEncoding: TEncoding = nil);
var
  i:integer;
  IvBytes: TBytes;
begin
  FillChar(ctx.IV, BLOCKSIZE, #0);
  FillChar(ctx.CurrIV, BLOCKSIZE, #0);
  FillChar(ctx.LastIV, BLOCKSIZE, #0);
  if AEncoding = nil then
    AEncoding := TEncoding.UTF8;
  IvBytes := AEncoding.GetBytes(IVString);
  for i := 1 to Length(IvBytes) do
    ctx.IV[(i-1) and (BLOCKSIZE - 1)] := ctx.IV[(i-1) and (BLOCKSIZE - 1)] xor Ord(IvBytes[i - 1]);
  Move(ctx.IV, ctx.CurrIV, BLOCKSIZE);
  ctx.CFB_OFB_n := 0;
  ctx.IVInit := True;
end;

procedure TBlowfish.EncBlock(const Input: TBlock; var Output: TBlock);
begin
  CheckKeys;
  FBlowCore.ctx.ByteBuffer := Input;
  EncryptBlockMode;
  Output := FBlowCore.ctx.ByteBuffer;
end;

procedure TBlowfish.DecBlock(const Input: TBlock; var Output: TBlock);
begin
  CheckKeys;
  FBlowCore.ctx.ByteBuffer := Input;
  DecryptBlockMode;
  Output := FBlowCore.ctx.ByteBuffer;
end;

//add by 爱吃猪头肉。参考自 AES。
procedure TBlowfish.ProcessIV(EncryptMode: Boolean; BeforeBlock: Boolean;
        ResetIV: Boolean = False);
begin
  if FCipherMode = ECB then exit;
  CheckKeys;
  if ResetIV then
  begin
    Move(ctx.IV, ctx.CurrIV, BLOCKSIZE);
    FillChar(ctx.LastIV, BLOCKSIZE, #0);
    exit;
  end;
  if (EncryptMode and BeforeBlock) or
    ((not EncryptMode) and (not BeforeBlock)) then
  begin
    FBlowCore.ctx.Int16Buffer[0] := FBlowCore.ctx.Int16Buffer[0] xor ctx.CurrIVInt16[0];
    FBlowCore.ctx.Int16Buffer[1] := FBlowCore.ctx.Int16Buffer[1] xor ctx.CurrIVInt16[1];
    FBlowCore.ctx.Int16Buffer[2] := FBlowCore.ctx.Int16Buffer[2] xor ctx.CurrIVInt16[2];
    FBlowCore.ctx.Int16Buffer[3] := FBlowCore.ctx.Int16Buffer[3] xor ctx.CurrIVInt16[3];
    if ((not EncryptMode) and (not BeforeBlock)) then
      Move(ctx.LastIV, ctx.CurrIV, BLOCKSIZE);
  end
  else if (EncryptMode and (not BeforeBlock)) then
  begin
    Move(FBlowCore.ctx.ByteBuffer, ctx.CurrIV, BLOCKSIZE);
  end
  else if ((not EncryptMode) and BeforeBlock) then
  begin
    Move(FBlowCore.ctx.ByteBuffer, ctx.LastIV, BLOCKSIZE);
  end;
end;

procedure TBlowfish.EncBuffer(const Len: integer);
var
     Index: integer;
begin
     // check that we have a keys and IV
     CheckKeys;

     // index is the pointer to the current position in the buffer
     Index := 0;

     // PtrBuffer points to the address of the buffer
     PtrBuffer := @FBuffer;
     ProcessIV(True, True, True);

     // for every block in the buffer
     repeat
          // move one block from the buffer contents into the context
          Move(FBuffer[Index], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

          // encrypt the context
          EncryptBlockMode;

          // move the block back
          Move(FBlowCore.ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);

          // increment the pointer
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end; {EncBuffer}

procedure TBlowfish.DecBuffer(const Len: integer);
var
     Index: integer;
begin
     CheckKeys;
     Index := 0;
     PtrBuffer := @FBuffer;
     ProcessIV(False, True, True);
     repeat
          Move(FBuffer[Index], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);
          DecryptBlockMode;
          Move(FBlowCore.ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end;

procedure TBlowfish.EncString(const Input: string; var Output: string);
var
  Lens,
  i:Int32;
  j:Int32;
  OutBytes,
  InBytes,
  s: TBytes;
  InputStr: string;
  CancelCalc: Boolean;
  TotalBytes: Int64;
begin
  CheckKeys;
  if Length(Input) = 0 then
    Exit;

  CancelCalc := False;
     // load the input into the buffer
  InputStr := Input;
  if StringCRLFMode <> rlNoChange then
  begin
    InputStr := ChangCRLFType(InputStr, StringCRLFMode);
  end;
    InBytes := StringEncoding.GetBytes(InputStr);

    ProcessIV(True, True, True);

    // Pad the input string to a multiple of BLOCKSIZE bytes.
    Lens := Length(InBytes);
    j := Lens + 1;
    i := BLOCKSIZE - (Lens mod BLOCKSIZE);
    if (FPaddingMode = pmZeroPadding) and (i = BLOCKSIZE) then
      i := 0;

    SetLength(s, Lens + i);
    FillChar(s[0], Lens + i, 0);
    Move(InBytes[0], s[0], Lens);

    SetLength(OutBytes, Lens + i);
    FillChar(OutBytes[0], Lens + i, 0);
    Lens := Length(s);

    // add the pad bytes to the end of the string
    if (FPaddingMode = TPaddingMode.pmZeroPadding) then
    begin
     FillChar(s[j - 1], Lens - j + 1, 0);
    end
    else if (FPaddingMode = TPaddingMode.pmANSIX923) then
    begin
      if Lens > 1 then
        FillChar(s[j - 1], Lens - j, 0);
      s[Lens - 1] := i;
    end
    else if (FPaddingMode = TPaddingMode.pmISO10126) then
    begin
      for i := j - 1 to Lens - 2 do
      begin
        s[i] := Random(255);
      end;
      s[Lens - 1] := i;
    end
    else
    begin
      FillChar(s[j - 1], Lens - j + 1, i);
      if (FPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding) and
        ((Lens - j + 1) >= 3) then
      begin
        s[j + Random(Lens - j - 1)] := Random(255);
      end;
    end;

    // initialise the counters
    j := 1;
    i := 1;

    TotalBytes := Lens;
    // and step through the string
    while i < Lens do
    begin
      // copy the next bytes into the context block buffer
      Move(s[i - 1], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);
      Inc(i, BLOCKSIZE);

      // perform the encryption of the context
      EncryptBlockMode;

      // copy the block into the output string
      Move(FBlowCore.ctx.ByteBuffer, OutBytes[j - 1], BLOCKSIZE);
      Inc(j, BLOCKSIZE);
      if Assigned(OnProcessProc) then
        OnProcessProc(Self, 0, TotalBytes, i, CancelCalc);
      if Assigned(ProcessProc) then
        ProcessProc(0, TotalBytes, i, CancelCalc);
      if CancelCalc then Exit;
    end; {while j}

    // encode the string if required
    if FStringMode = smEncode then
    begin
      Output := EncodeBase64Bytes(OutBytes);
    end
    else if FStringMode = smHex then
    begin
      Output := StrToHex(OutBytes);
    end
    else
    begin
      Output := TEncoding.ANSI.GetString(OutBytes);
    end;
  if Assigned(OnProcessProc) then
    OnProcessProc(Self, 0, TotalBytes, TotalBytes, CancelCalc);
  if Assigned(ProcessProc) then
    ProcessProc(0, TotalBytes, TotalBytes, CancelCalc);
end; {EncString}

procedure TBlowfish.DecString(const Input: string; var Output: string);
var
     Lens,
     i: Int32;
     j: Int32;
     OutBytes,
     s: TBytes;
     InputTemp: TBytes;
     CancelCalc: Boolean;
     TotalBytes: Int64;
begin
     // check that we have a keys and IV
     CheckKeys;
     CancelCalc := False;

     ProcessIV(False, True, True);

     // initialise the output string
     Output := '';

     // check for zero length strings
     if Length(Input) = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // decode the string if required
     if FStringMode = smEncode then
     begin
       InputTemp := DecodeBase64Bytes(Input);
     end
     else if FStringMode = smHex then
     begin
       InputTemp := HexToStr(Input);
     end
     else
     begin
       InputTemp := TEncoding.ANSI.GetBytes(Input);
     end;

     // check that the input is long enough
     if Length(InputTemp) < BLOCKSIZE then
     begin
          raise EInputError.Create(LIT_INPUT_LENGTH);
     end; {if Length}

     // initialise the working string
     // preset the length of the 磜orking string
     SetLength(s, Length(InputTemp));
     FillChar(s[0], Length(s), 0);

     // initialise the counters
     i := 1;
     j := 1;
     Lens := (Length(InputTemp));
     TotalBytes := Lens;
     // and step through the string
     while i < Lens do
     begin
          // copy the next bytes into the context block buffer
          Move(InputTemp[j - 1], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);
          Inc(j, BLOCKSIZE);

          // perform the decryption of the context
          DecryptBlockMode;

          // copy the block into the output string
          Move(FBlowCore.ctx.ByteBuffer, s[i - 1], BLOCKSIZE);
          Inc(i, BLOCKSIZE);
          if Assigned(OnProcessProc) then
            OnProcessProc(Self, 0, TotalBytes, i, CancelCalc);
          if Assigned(ProcessProc) then
            ProcessProc(0, TotalBytes, i, CancelCalc);
          if CancelCalc then Exit;
     end; {while i}

     // Unpad Plain Text string
     // Last byte is number of pad bytes
     Lens := Length(s);
     if (FPaddingMode = pmZeroPadding) then
     begin
       i := 0;
       for j := 1 to BLOCKSIZE - 1 do
       begin
         if s[Lens - j] <> 0 then
         begin
           i := j - 1;
           break;
         end;
       end;
     end
     else
     begin
       i := s[Lens - 1];
     end;
     if (i > 0) and (i <= BLOCKSIZE) then
     begin
       SetLength(OutBytes, Lens - i);
       Move(s[0], OutBytes[0], Lens - i);
     end
     else
     begin
       SetLength(OutBytes, Lens);
       Move(s[0], OutBytes[0], Lens);
     end; {if (i>0) and}
  Output := StringEncoding.GetString(OutBytes);
  if StringCRLFMode <> rlNoChange then
  begin
    Output := ChangCRLFType(Output, StringCRLFMode);
  end;
  if Assigned(OnProcessProc) then
    OnProcessProc(Self, 0, TotalBytes, TotalBytes, CancelCalc);
  if Assigned(ProcessProc) then
    ProcessProc(0, TotalBytes, TotalBytes, CancelCalc);
end; {DecString}

procedure TBlowfish.SetCipherMode(const Value: TCipherMode);
begin
     FCipherMode := Value;
end; {TBlowfish.SetCipherMode}

procedure TBlowfish.SetStringMode(const Value: TStringMode);
begin
     FStringMode := Value;
end; {TBlowfish.SetStringMode}

function TBlowfish.GetCipherMode: TCipherMode;
begin
     Result := FCipherMode;
end; {TBlowfish.GetCipherMode}

function TBlowfish.GetStringMode: TStringMode;
begin
     Result := FStringMode;
end; {TBlowfish.GetStringMode}


procedure TBlowfish.Burn;
begin
  FillChar(FBlowCore.ctx, SizeOf(FBlowCore.ctx), #0);
  ctx.KeyInit := False;
  ctx.IVInit := False;
end;

procedure TBlowfish.EncryptBlockMode;
begin
  FBlowCore.FPtrL := @FBlowCore.ctx.Longbuffer[0];
  FBlowCore.FPtrR := @FBlowCore.ctx.Longbuffer[1];
  case FCipherMode of
    ECB: EndianEncBlock;
    CBC: EndianEncBlock;
  end;
end;

procedure TBlowfish.DecryptBlockMode;
var
  i:integer;
begin
  FBlowCore.FPtrL := @FBlowCore.ctx.Longbuffer[0];
  FBlowCore.FPtrR := @FBlowCore.ctx.Longbuffer[1];
  case FCipherMode of
    ECB: EndianDecBlock;
    CBC: EndianDecBlock;
  end;
end;

procedure TBlowfish.CheckKeys;
begin
  if not ctx.KeyInit then
    begin
      raise EKeyError.Create(LIT_KEY_NOT_SET);
      Exit;
    end;

  if FCipherMode <> ECB then
    begin
      if not ctx.IVInit then
        begin
          raise EKeyError.Create(LIT_IV_NOT_SET);
          Exit;
        end;
    end;
end;

procedure TBlowfish.InitArray;
begin
  FBlowCore.ctx.P := TempP;
  FBlowCore.ctx.S1 := TempS1;
  FBlowCore.ctx.S2 := TempS2;
  FBlowCore.ctx.S3 := TempS3;
  FBlowCore.ctx.S4 := TempS4;
end;

procedure TBlowfish.EndianEncBlock;
var
     TempLong: DoublWord;
begin
  ProcessIV(True, True);
     // flip the oder of the bytes
     // we only need to do this because of the endianness of Intel
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;
     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;

     // perform the encryption
     FBlowCore.Blowfish_Core_Block_Encrypt;

     // flip the order of the bytes back
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;

     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;
  ProcessIV(True, False);
end;{EndianEncBlock}

procedure TBlowfish.EndianDecBlock;
var
     TempLong: DoublWord;
begin
  ProcessIV(False, True);
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;
     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;
     FBlowCore.Blowfish_Core_Block_Decrypt;
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;
     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;
  ProcessIV(False, False);
end;{EndianDecBlock}

procedure TBlowCore.Blowfish_Core_Block_Encrypt;
var
  Xl:DoublWord;
  Xr:DoublWord;
begin
  Xl := FPtrL^;
  Xr := FPtrR^;
  Xl.LWord := Xl.LWord xor ctx.P[0];
  {第1轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[1];
  {第2轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[2];
  {第3轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[3];
  {第4轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[4];
  {第5轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[5];
  {第6轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[6];
  {第7轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[7];
  {第8轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[8];
  {第9轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[9];
  {第10轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[10];
  {第11轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[11];
  {第12轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[12];
  {第13轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[13];
  {第14轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[14];
  {第15轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[15];
  {第16轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[16];
  Xr.LWord := Xr.LWord xor ctx.P[17];
  FPtrL^ := Xr;
  FPtrR^ := Xl;
end;

procedure TBlowCore.Blowfish_Core_Block_Decrypt;
var
  Xl: DoublWord;
  Xr: DoublWord;
begin
  Xl := FPtrL^;
  Xr := FPtrR^;
  Xl.Lword := Xl.Lword xor ctx.P[17];
  {第16轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[16];
  {第15轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[15];
  {第14轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[14];
  {第13轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[13];
  {第12轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[12];
  {第11轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[11];
  {第10轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[10];
  {第9轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[9];
  {第8轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[8];
  {第7轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[7];
  {第6轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[6];
  {第5轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[5];
  {第4轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[4];
  {第3轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[3];
  {第2轮}
  Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
              ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[2];
  {第1轮}
  Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
              ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[1];
  Xr.Lword := Xr.Lword xor ctx.P[0];
  FPtrL^ := Xr;
  FPtrR^ := Xl;
end;

procedure TBlowfish.Blowfish_Core_Key_Setup(KeyArray: array of Byte; const KeyLength: integer);
var
  i,j:integer;
  data: Int32;
  datal:Int32;
  datar:Int32;
begin
  InitArray;
  j := 0;
  //18个32位子密钥
  for i:= 0 to 17 do
    begin
      Data := KeyArray[(j+3) mod KeyLength];
      Data:= Data + (KeyArray[(j+2) mod KeyLength] shl 8);
      Data:= Data + (KeyArray[(j+1) mod KeyLength] shl 16);
      Data:= Data + (KeyArray[j]                   shl 24);
      FBlowCore.ctx.P[i] := FBlowCore.ctx.P[i] xor data;
      j:= (j+4) mod KeyLength;
    end;{for i}

  datal := 0;
  FBlowCore.FPtrL := @datal;
  datar := 0;
  FBlowCore.FPtrR := @datar;
  i:= 0;
  while (i < (16 + 2)) do
    begin
      FBlowCore.Blowfish_Core_Block_Encrypt;
      FBlowCore.ctx.P[i] := datal;
      FBlowCore.ctx.P[i + 1] := datar;
      Inc(i, 2);
    end; {while i}

  j:=0;
  //第一个32位的S盒
  while (j < 256) do
    begin
      FBlowCore.Blowfish_Core_Block_Encrypt;
      FBlowCore.ctx.S1[j] := datal;
      FBlowCore.ctx.S1[j + 1] := datar;
      Inc(j, 2);
    end;{while j}
  j := 0;

  //第二个32位的S盒
  while (j < 256) do
    begin
      FBlowCore.Blowfish_Core_Block_Encrypt;
      FBlowCore.ctx.S2[j] := datal;
      FBlowCore.ctx.S2[j + 1] := datar;
      Inc(j, 2);
    end;{while j}
  j := 0;

  //第三个32位的S盒
  while (j < 256) do
    begin
      FBlowCore.Blowfish_Core_Block_Encrypt;
      FBlowCore.ctx.S3[j] := datal;
      FBlowCore.ctx.S3[j + 1] := datar;
      Inc(j, 2);
    end;{while j}
  j := 0;

  //第四个32位的S盒
  while (j < 256) do
    begin
      FBlowCore.Blowfish_Core_Block_Encrypt;
      FBlowCore.ctx.S4[j] := datal;
      FBlowCore.ctx.S4[j + 1] := datar;
      Inc(j, 2);
  end;
end;

procedure TBlowfish.SetStringEncoding(Value: TEncoding);
begin
  if Value = nil then
  begin
    FStringEncoding := TEncoding.UTF8;
  end
  else
  begin
    FStringEncoding := Value;
  end;
end;

constructor TBlowfish.Create;
begin
  FBlowCore := TBlowCore.Create;
  FStringMode := smHex;
  FStringCRLFMode := rlCRLF;
  FStringEncoding := TEncoding.UTF8;
  FCipherMode := ECB;
  PaddingMode := pmZeroPadding;
end;

destructor TBlowfish.Destroy;
begin
  FBLowCore.Free;
  inherited Destroy;
end;


end.
