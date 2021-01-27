{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Java.Security_D10_1;

interface

{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
// ===== Forward declarations =====

  JAlgorithmParameters = interface;//java.security.AlgorithmParameters
  JCodeSigner = interface;//java.security.CodeSigner
  JCodeSource = interface;//java.security.CodeSource
  JKey = interface;//java.security.Key
  JKeyFactory = interface;//java.security.KeyFactory
  JKeyStore = interface;//java.security.KeyStore
  JKeyStore_Entry = interface;//java.security.KeyStore$Entry
  JKeyStore_LoadStoreParameter = interface;//java.security.KeyStore$LoadStoreParameter
  JKeyStore_ProtectionParameter = interface;//java.security.KeyStore$ProtectionParameter
  JPermission = interface;//java.security.Permission
  JPermissionCollection = interface;//java.security.PermissionCollection
  JPrincipal = interface;//java.security.Principal
  JPrivateKey = interface;//java.security.PrivateKey
  JProtectionDomain = interface;//java.security.ProtectionDomain
  JProvider = interface;//java.security.Provider
  JProvider_Service = interface;//java.security.Provider$Service
  JPublicKey = interface;//java.security.PublicKey
  JSecureRandom = interface;//java.security.SecureRandom
  JSignatureSpi = interface;//java.security.SignatureSpi
  Jsecurity_Signature = interface;//java.security.Signature
  Jsecurity_Timestamp = interface;//java.security.Timestamp
  JCertPath = interface;//java.security.cert.CertPath
  JCertificate = interface;//java.security.cert.Certificate
  JX509Certificate = interface;//java.security.cert.X509Certificate
  JAlgorithmParameterSpec = interface;//java.security.spec.AlgorithmParameterSpec
  JEncodedKeySpec = interface;//java.security.spec.EncodedKeySpec
  JKeySpec = interface;//java.security.spec.KeySpec
  JX509EncodedKeySpec = interface;//java.security.spec.X509EncodedKeySpec
  JPKCS8EncodedKeySpec = interface;//java.security.spec.PKCS8EncodedKeySpec
  JX500Principal = interface;//javax.security.auth.x500.X500Principal
  Jcert_Certificate = interface;//javax.security.cert.Certificate
  Jcert_X509Certificate = interface;//javax.security.cert.X509Certificate

// ===== Interface declarations =====

  JAlgorithmParametersClass = interface(JObjectClass)
    ['{BBC37ABF-868E-428B-97BF-28A1BC1983BF}']
    {class} function getInstance(algorithm: JString): JAlgorithmParameters; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JString): JAlgorithmParameters; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JProvider): JAlgorithmParameters; cdecl; overload;
  end;

  [JavaSignature('java/security/AlgorithmParameters')]
  JAlgorithmParameters = interface(JObject)
    ['{2D31A652-8669-46D3-9B62-B34AA3ABE792}']
    function getAlgorithm: JString; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl; overload;
    function getEncoded(format: JString): TJavaArray<Byte>; cdecl; overload;
    function getParameterSpec(paramSpec: Jlang_Class): JAlgorithmParameterSpec; cdecl;
    function getProvider: JProvider; cdecl;
    procedure init(paramSpec: JAlgorithmParameterSpec); cdecl; overload;
    procedure init(params: TJavaArray<Byte>); cdecl; overload;
    procedure init(params: TJavaArray<Byte>; format: JString); cdecl; overload;
    function toString: JString; cdecl;
  end;
  TJAlgorithmParameters = class(TJavaGenericImport<JAlgorithmParametersClass, JAlgorithmParameters>) end;

  JCodeSignerClass = interface(JObjectClass)
    ['{CE9054DF-D7D0-4E15-BAB2-6B64592E3526}']
    {class} function init(signerCertPath: JCertPath; timestamp: Jsecurity_Timestamp): JCodeSigner; cdecl;
  end;

  [JavaSignature('java/security/CodeSigner')]
  JCodeSigner = interface(JObject)
    ['{555EF758-C808-4552-B7EE-732DFAA328B1}']
    function equals(obj: JObject): Boolean; cdecl;
    function getSignerCertPath: JCertPath; cdecl;
    function getTimestamp: Jsecurity_Timestamp; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJCodeSigner = class(TJavaGenericImport<JCodeSignerClass, JCodeSigner>) end;

  JCodeSourceClass = interface(JObjectClass)
    ['{BA8D2033-E144-422A-B782-C6B1EDAD7E4D}']
    {class} //function init(location: JURL; certs: TJavaObjectArray<JCertificate>): JCodeSource; cdecl; overload;
    {class} //function init(location: JURL; signers: TJavaObjectArray<JCodeSigner>): JCodeSource; cdecl; overload;
  end;

  [JavaSignature('java/security/CodeSource')]
  JCodeSource = interface(JObject)
    ['{C0827AF8-2048-42AC-BAA9-15CD4E58881C}']
    function getCertificates: TJavaObjectArray<JCertificate>; cdecl;
    function getCodeSigners: TJavaObjectArray<JCodeSigner>; cdecl;
    //function getLocation: JURL; cdecl;
    function implies(cs: JCodeSource): Boolean; cdecl;
  end;
  TJCodeSource = class(TJavaGenericImport<JCodeSourceClass, JCodeSource>) end;

  JKeyClass = interface(JSerializableClass)
    ['{491F05AC-16D5-4F25-86E2-733A1F12F47B}']
    {class} function _GetserialVersionUID: Int64; cdecl;
    {class} property serialVersionUID: Int64 read _GetserialVersionUID;
  end;

  [JavaSignature('java/security/Key')]
  JKey = interface(JSerializable)
    ['{E67DA438-8A01-40BC-835C-9C6831871FA4}']
    function getAlgorithm: JString; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getFormat: JString; cdecl;
  end;
  TJKey = class(TJavaGenericImport<JKeyClass, JKey>) end;

  JKeyFactoryClass = interface(JObjectClass)
    ['{E4C4DD12-7853-4847-AFED-2F433C2282A5}']
    {class} function getInstance(algorithm: JString): JKeyFactory; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JString): JKeyFactory; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JProvider): JKeyFactory; cdecl; overload;
  end;

  [JavaSignature('java/security/KeyFactory')]
  JKeyFactory = interface(JObject)
    ['{3E81ED71-EB30-4E30-9C32-1D1AAF83D5CA}']
    function generatePrivate(keySpec: JKeySpec): JPrivateKey; cdecl;
    function generatePublic(keySpec: JKeySpec): JPublicKey; cdecl;
    function getAlgorithm: JString; cdecl;
    function getKeySpec(key: JKey; keySpec: Jlang_Class): JKeySpec; cdecl;
    function getProvider: JProvider; cdecl;
    function translateKey(key: JKey): JKey; cdecl;
  end;
  TJKeyFactory = class(TJavaGenericImport<JKeyFactoryClass, JKeyFactory>) end;

  JKeyStoreClass = interface(JObjectClass)
    ['{860AE0E4-27E4-4653-BC93-06597E335EA0}']
    {class} function getDefaultType: JString; cdecl;
    {class} function getInstance(type_: JString): JKeyStore; cdecl; overload;
    {class} function getInstance(type_: JString; provider: JString): JKeyStore; cdecl; overload;
    {class} function getInstance(type_: JString; provider: JProvider): JKeyStore; cdecl; overload;
  end;

  [JavaSignature('java/security/KeyStore')]
  JKeyStore = interface(JObject)
    ['{91AF6375-8346-4A49-9E14-2187466DF78B}']
    function aliases: JEnumeration; cdecl;
    function containsAlias(alias: JString): Boolean; cdecl;
    procedure deleteEntry(alias: JString); cdecl;
    function entryInstanceOf(alias: JString; entryClass: Jlang_Class): Boolean; cdecl;
    function getCertificate(alias: JString): JCertificate; cdecl;
    function getCertificateAlias(cert: JCertificate): JString; cdecl;
    function getCertificateChain(alias: JString): TJavaObjectArray<JCertificate>; cdecl;
    function getCreationDate(alias: JString): JDate; cdecl;
    function getEntry(alias: JString; param: JKeyStore_ProtectionParameter): JKeyStore_Entry; cdecl;
    function getKey(alias: JString; password: TJavaArray<Char>): JKey; cdecl;
    function getProvider: JProvider; cdecl;
    function getType: JString; cdecl;
    function isCertificateEntry(alias: JString): Boolean; cdecl;
    function isKeyEntry(alias: JString): Boolean; cdecl;
    procedure load(stream: JInputStream; password: TJavaArray<Char>); cdecl; overload;
    procedure load(param: JKeyStore_LoadStoreParameter); cdecl; overload;
    procedure setCertificateEntry(alias: JString; cert: JCertificate); cdecl;
    procedure setEntry(alias: JString; entry: JKeyStore_Entry; param: JKeyStore_ProtectionParameter); cdecl;
    procedure setKeyEntry(alias: JString; key: JKey; password: TJavaArray<Char>; chain: TJavaObjectArray<JCertificate>); cdecl; overload;
    procedure setKeyEntry(alias: JString; key: TJavaArray<Byte>; chain: TJavaObjectArray<JCertificate>); cdecl; overload;
    function size: Integer; cdecl;
    procedure store(stream: JOutputStream; password: TJavaArray<Char>); cdecl; overload;
    procedure store(param: JKeyStore_LoadStoreParameter); cdecl; overload;
  end;
  TJKeyStore = class(TJavaGenericImport<JKeyStoreClass, JKeyStore>) end;

  JKeyStore_EntryClass = interface(IJavaClass)
    ['{D9DC0531-F6F5-44C4-B87A-E697051F84E1}']
  end;

  [JavaSignature('java/security/KeyStore$Entry')]
  JKeyStore_Entry = interface(IJavaInstance)
    ['{381C3374-EBCF-4615-BB46-A093799A663C}']
  end;
  TJKeyStore_Entry = class(TJavaGenericImport<JKeyStore_EntryClass, JKeyStore_Entry>) end;

  JKeyStore_LoadStoreParameterClass = interface(IJavaClass)
    ['{EBBAB120-9F3C-4BB0-8B62-5A2AE68ABEAB}']
  end;

  [JavaSignature('java/security/KeyStore$LoadStoreParameter')]
  JKeyStore_LoadStoreParameter = interface(IJavaInstance)
    ['{AC2E608B-1E28-4243-86E9-461E4861A1DB}']
    function getProtectionParameter: JKeyStore_ProtectionParameter; cdecl;
  end;
  TJKeyStore_LoadStoreParameter = class(TJavaGenericImport<JKeyStore_LoadStoreParameterClass, JKeyStore_LoadStoreParameter>) end;

  JKeyStore_ProtectionParameterClass = interface(IJavaClass)
    ['{B5DE790A-39E5-4B4B-869A-C4A22A8324D8}']
  end;

  [JavaSignature('java/security/KeyStore$ProtectionParameter')]
  JKeyStore_ProtectionParameter = interface(IJavaInstance)
    ['{C00F4FD8-2E76-4977-B5CE-5EBEBA0D66F2}']
  end;
  TJKeyStore_ProtectionParameter = class(TJavaGenericImport<JKeyStore_ProtectionParameterClass, JKeyStore_ProtectionParameter>) end;

  JPermissionClass = interface(JObjectClass)
    ['{3FD5AFA7-D8F7-48CE-B36A-60FD727FA7AA}']
    {class} function init(name: JString): JPermission; cdecl;
  end;

  [JavaSignature('java/security/Permission')]
  JPermission = interface(JObject)
    ['{8E0B18CE-4263-4D2B-9C14-07141CF507EE}']
    procedure checkGuard(obj: JObject); cdecl;
    function getActions: JString; cdecl;
    function getName: JString; cdecl;
    function implies(permission: JPermission): Boolean; cdecl;
    function newPermissionCollection: JPermissionCollection; cdecl;
  end;
  TJPermission = class(TJavaGenericImport<JPermissionClass, JPermission>) end;

  JPermissionCollectionClass = interface(JObjectClass)
    ['{755E07B9-32C3-4B44-851F-1F6BDC7E90E9}']
    {class} function init: JPermissionCollection; cdecl;
  end;

  [JavaSignature('java/security/PermissionCollection')]
  JPermissionCollection = interface(JObject)
    ['{3CA5945E-E020-4DB4-A0D8-7CC9C2F160B4}']
    procedure add(permission: JPermission); cdecl;
    function elements: JEnumeration; cdecl;
    function implies(permission: JPermission): Boolean; cdecl;
    function isReadOnly: Boolean; cdecl;
    procedure setReadOnly; cdecl;
  end;
  TJPermissionCollection = class(TJavaGenericImport<JPermissionCollectionClass, JPermissionCollection>) end;

  JPrincipalClass = interface(IJavaClass)
    ['{A67F2BC8-86FF-4476-B578-5D1DF0C37CA2}']
  end;

  [JavaSignature('java/security/Principal')]
  JPrincipal = interface(IJavaInstance)
    ['{1383D32C-3B79-440E-89DC-D959BFFB0B70}']
    function equals(obj: JObject): Boolean; cdecl;
    function getName: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJPrincipal = class(TJavaGenericImport<JPrincipalClass, JPrincipal>) end;

  JPrivateKeyClass = interface(JKeyClass)
    ['{54E2F105-A801-4795-A042-9CC691D10613}']
    {class} function _GetserialVersionUID: Int64; cdecl;
    {class} //serialVersionUID is defined in parent interface
  end;

  [JavaSignature('java/security/PrivateKey')]
  JPrivateKey = interface(JKey)
    ['{81138458-5C17-498A-966F-8EAADC2639AF}']
  end;
  TJPrivateKey = class(TJavaGenericImport<JPrivateKeyClass, JPrivateKey>) end;

  JProtectionDomainClass = interface(JObjectClass)
    ['{762DD343-844A-4634-8E15-19EF5AA75337}']
    {class} function init(cs: JCodeSource; permissions: JPermissionCollection): JProtectionDomain; cdecl; overload;
    {class} function init(cs: JCodeSource; permissions: JPermissionCollection; cl: JClassLoader; principals: TJavaObjectArray<JPrincipal>): JProtectionDomain; cdecl; overload;
  end;

  [JavaSignature('java/security/ProtectionDomain')]
  JProtectionDomain = interface(JObject)
    ['{3EBCC3D7-3270-4F98-BD56-F630C010F196}']
    function getClassLoader: JClassLoader; cdecl;
    function getCodeSource: JCodeSource; cdecl;
    function getPermissions: JPermissionCollection; cdecl;
    function getPrincipals: TJavaObjectArray<JPrincipal>; cdecl;
    function implies(permission: JPermission): Boolean; cdecl;
  end;
  TJProtectionDomain = class(TJavaGenericImport<JProtectionDomainClass, JProtectionDomain>) end;

  JProviderClass = interface(JPropertiesClass)
    ['{6DD82934-27C0-46A3-AD92-3BD15CFBC0CE}']
  end;

  [JavaSignature('java/security/Provider')]
  JProvider = interface(JProperties)
    ['{220B8B88-4972-4C07-85EE-73F075553D28}']
    procedure clear; cdecl;
    function entrySet: JSet; cdecl;
    function getInfo: JString; cdecl;
    function getName: JString; cdecl;
    function getService(type_: JString; algorithm: JString): JProvider_Service; cdecl;
    function getServices: JSet; cdecl;
    function getVersion: Double; cdecl;
    function keySet: JSet; cdecl;
    procedure load(inStream: JInputStream); cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    procedure putAll(t: JMap); cdecl;
    function remove(key: JObject): JObject; cdecl;
    function toString: JString; cdecl;
    function values: JCollection; cdecl;
  end;
  TJProvider = class(TJavaGenericImport<JProviderClass, JProvider>) end;

  JProvider_ServiceClass = interface(JObjectClass)
    ['{60D0CFBE-6223-45EE-A1C6-19C1BE45262C}']
    {class} function init(provider: JProvider; type_: JString; algorithm: JString; className: JString; aliases: JList; attributes: JMap): JProvider_Service; cdecl;
  end;

  [JavaSignature('java/security/Provider$Service')]
  JProvider_Service = interface(JObject)
    ['{3786F557-5DA3-4519-8F9A-F323D3AFD1A0}']
    function getAlgorithm: JString; cdecl;
    function getAttribute(name: JString): JString; cdecl;
    function getClassName: JString; cdecl;
    function getProvider: JProvider; cdecl;
    function getType: JString; cdecl;
    function newInstance(constructorParameter: JObject): JObject; cdecl;
    function supportsParameter(parameter: JObject): Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJProvider_Service = class(TJavaGenericImport<JProvider_ServiceClass, JProvider_Service>) end;

  JPublicKeyClass = interface(JKeyClass)
    ['{3244BB28-6902-4F6B-A18B-26DF9BD16FCB}']
    {class} function _GetserialVersionUID: Int64; cdecl;
    {class} //serialVersionUID is defined in parent interface
  end;

  [JavaSignature('java/security/PublicKey')]
  JPublicKey = interface(JKey)
    ['{91479605-52EC-496F-9D87-0A5E9C08EB1A}']
  end;
  TJPublicKey = class(TJavaGenericImport<JPublicKeyClass, JPublicKey>) end;

  JSecureRandomClass = interface(JRandomClass)
    ['{A0D12CF6-8C79-4375-8277-F43ED6787BEF}']
    {class} function init: JSecureRandom; cdecl; overload;
    {class} function init(seed: TJavaArray<Byte>): JSecureRandom; cdecl; overload;
    {class} function getInstance(algorithm: JString): JSecureRandom; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JString): JSecureRandom; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JProvider): JSecureRandom; cdecl; overload;
    {class} function getSeed(numBytes: Integer): TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('java/security/SecureRandom')]
  JSecureRandom = interface(JRandom)
    ['{0C20F88C-F43D-431F-8FB8-AEC14972B409}']
    function generateSeed(numBytes: Integer): TJavaArray<Byte>; cdecl;
    function getAlgorithm: JString; cdecl;
    function getProvider: JProvider; cdecl;
    procedure nextBytes(bytes: TJavaArray<Byte>); cdecl;
    procedure setSeed(seed: TJavaArray<Byte>); cdecl; overload;
    procedure setSeed(seed: Int64); cdecl; overload;
  end;
  TJSecureRandom = class(TJavaGenericImport<JSecureRandomClass, JSecureRandom>) end;

  JSignatureSpiClass = interface(JObjectClass)
    ['{8659FCEF-4BAE-441B-A85C-9AE573E412D6}']
    {class} function init: JSignatureSpi; cdecl;
  end;

  [JavaSignature('java/security/SignatureSpi')]
  JSignatureSpi = interface(JObject)
    ['{981583C5-B572-4475-9CAD-EE052D79006F}']
    function clone: JObject; cdecl;
  end;
  TJSignatureSpi = class(TJavaGenericImport<JSignatureSpiClass, JSignatureSpi>) end;

  Jsecurity_SignatureClass = interface(JSignatureSpiClass)
    ['{5FF7336D-1662-4C66-826B-E77B18CBD1E0}']
    {class} function getInstance(algorithm: JString): Jsecurity_Signature; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JString): Jsecurity_Signature; cdecl; overload;
    {class} function getInstance(algorithm: JString; provider: JProvider): Jsecurity_Signature; cdecl; overload;
  end;

  [JavaSignature('java/security/Signature')]
  Jsecurity_Signature = interface(JSignatureSpi)
    ['{93B36141-58DE-4F18-A501-E5976796DCCA}']
    function clone: JObject; cdecl;
    function getAlgorithm: JString; cdecl;
    function getParameter(param: JString): JObject; cdecl;//Deprecated
    function getParameters: JAlgorithmParameters; cdecl;
    function getProvider: JProvider; cdecl;
    procedure initSign(privateKey: JPrivateKey); cdecl; overload;
    procedure initSign(privateKey: JPrivateKey; random: JSecureRandom); cdecl; overload;
    procedure initVerify(publicKey: JPublicKey); cdecl; overload;
    procedure initVerify(certificate: JCertificate); cdecl; overload;
    procedure setParameter(param: JString; value: JObject); cdecl; overload;//Deprecated
    procedure setParameter(params: JAlgorithmParameterSpec); cdecl; overload;
    function sign: TJavaArray<Byte>; cdecl; overload;
    function sign(outbuf: TJavaArray<Byte>; offset: Integer; len: Integer): Integer; cdecl; overload;
    function toString: JString; cdecl;
    procedure update(b: Byte); cdecl; overload;
    procedure update(data: TJavaArray<Byte>); cdecl; overload;
    procedure update(data: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
    procedure update(data: JByteBuffer); cdecl; overload;
    function verify(signature: TJavaArray<Byte>): Boolean; cdecl; overload;
    function verify(signature: TJavaArray<Byte>; offset: Integer; length: Integer): Boolean; cdecl; overload;
  end;
  TJsecurity_Signature = class(TJavaGenericImport<Jsecurity_SignatureClass, Jsecurity_Signature>) end;

  Jsecurity_TimestampClass = interface(JObjectClass)
    ['{A1F5600A-4C01-494C-A777-8A40EBFDEC37}']
    {class} function init(timestamp: JDate; signerCertPath: JCertPath): Jsecurity_Timestamp; cdecl;
  end;

  [JavaSignature('java/security/Timestamp')]
  Jsecurity_Timestamp = interface(JObject)
    ['{7BE32359-A497-422D-87C8-430BD16497CF}']
    function equals(obj: JObject): Boolean; cdecl;
    function getSignerCertPath: JCertPath; cdecl;
    function getTimestamp: JDate; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJsecurity_Timestamp = class(TJavaGenericImport<Jsecurity_TimestampClass, Jsecurity_Timestamp>) end;

  JCertPathClass = interface(JObjectClass)
    ['{9EFC5D56-AEA3-44AB-AB62-0492035788A2}']
  end;

  [JavaSignature('java/security/cert/CertPath')]
  JCertPath = interface(JObject)
    ['{23870029-166A-4971-B997-4EFC5A54E53E}']
    function equals(other: JObject): Boolean; cdecl;
    function getCertificates: JList; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl; overload;
    function getEncoded(encoding: JString): TJavaArray<Byte>; cdecl; overload;
    function getEncodings: JIterator; cdecl;
    function getType: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJCertPath = class(TJavaGenericImport<JCertPathClass, JCertPath>) end;

  JCertificateClass = interface(JObjectClass)
    ['{9F047EC3-8E3A-4F1A-8BBA-75B3CD1A052C}']
  end;

  [JavaSignature('java/security/cert/Certificate')]
  JCertificate = interface(JObject)
    ['{62678A95-4C13-4871-A120-F1CFBAD8D515}']
    function equals(other: JObject): Boolean; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getPublicKey: JPublicKey; cdecl;
    function getType: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure verify(key: JPublicKey); cdecl; overload;
    procedure verify(key: JPublicKey; sigProvider: JString); cdecl; overload;
  end;
  TJCertificate = class(TJavaGenericImport<JCertificateClass, JCertificate>) end;

  JX509CertificateClass = interface(JCertificateClass)
    ['{013AF678-30E7-423F-B6AB-A007F2A584C9}']
  end;

  [JavaSignature('java/security/cert/X509Certificate')]
  JX509Certificate = interface(JCertificate)
    ['{F19BCBC5-8869-46CC-9D29-AA524F7EC8BF}']
    procedure checkValidity; cdecl; overload;
    procedure checkValidity(date: JDate); cdecl; overload;
    function getBasicConstraints: Integer; cdecl;
    function getExtendedKeyUsage: JList; cdecl;
    function getIssuerAlternativeNames: JCollection; cdecl;
    function getIssuerDN: JPrincipal; cdecl;
    function getIssuerUniqueID: TJavaArray<Boolean>; cdecl;
    function getIssuerX500Principal: JX500Principal; cdecl;
    function getKeyUsage: TJavaArray<Boolean>; cdecl;
    function getNotAfter: JDate; cdecl;
    function getNotBefore: JDate; cdecl;
    function getSerialNumber: JBigInteger; cdecl;
    function getSigAlgName: JString; cdecl;
    function getSigAlgOID: JString; cdecl;
    function getSigAlgParams: TJavaArray<Byte>; cdecl;
    function getSignature: TJavaArray<Byte>; cdecl;
    function getSubjectAlternativeNames: JCollection; cdecl;
    function getSubjectDN: JPrincipal; cdecl;
    function getSubjectUniqueID: TJavaArray<Boolean>; cdecl;
    function getSubjectX500Principal: JX500Principal; cdecl;
    function getTBSCertificate: TJavaArray<Byte>; cdecl;
    function getVersion: Integer; cdecl;
  end;
  TJX509Certificate = class(TJavaGenericImport<JX509CertificateClass, JX509Certificate>) end;

  JAlgorithmParameterSpecClass = interface(IJavaClass)
    ['{C0A2D836-9B61-4EC0-8754-FA610EEDEAC1}']
  end;

  [JavaSignature('java/security/spec/AlgorithmParameterSpec')]
  JAlgorithmParameterSpec = interface(IJavaInstance)
    ['{99215A4C-6A62-4AA2-8C7D-C47E1E58EFC0}']
  end;
  TJAlgorithmParameterSpec = class(TJavaGenericImport<JAlgorithmParameterSpecClass, JAlgorithmParameterSpec>) end;

  JEncodedKeySpecClass = interface(JObjectClass)
    ['{405B8A8F-6680-44D6-8F59-5FD695F344B4}']
    {class} function init(encodedKey: TJavaArray<Byte>): JEncodedKeySpec; cdecl;
  end;

  [JavaSignature('java/security/spec/EncodedKeySpec')]
  JEncodedKeySpec = interface(JObject)
    ['{41402C06-B4C7-4942-BDA3-B45AA654F13C}']
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getFormat: JString; cdecl;
  end;
  TJEncodedKeySpec = class(TJavaGenericImport<JEncodedKeySpecClass, JEncodedKeySpec>) end;

  JKeySpecClass = interface(IJavaClass)
    ['{81BDBA7B-C47C-40CA-9A2C-39656C7DAFAA}']
  end;

  [JavaSignature('java/security/spec/KeySpec')]
  JKeySpec = interface(IJavaInstance)
    ['{51675423-3F6D-47D6-8BD7-8F48A902696B}']
  end;
  TJKeySpec = class(TJavaGenericImport<JKeySpecClass, JKeySpec>) end;

  JX509EncodedKeySpecClass = interface(JEncodedKeySpecClass)
    ['{64F67B14-7A21-4CB6-A5E8-D40738B5E990}']
    {class} function init(encodedKey: TJavaArray<Byte>): JX509EncodedKeySpec; cdecl;
  end;

  [JavaSignature('java/security/spec/X509EncodedKeySpec')]
  JX509EncodedKeySpec = interface(JEncodedKeySpec)
    ['{74A62AE3-152B-407D-B779-EA89AAF04D3B}']
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getFormat: JString; cdecl;
  end;
  TJX509EncodedKeySpec = class(TJavaGenericImport<JX509EncodedKeySpecClass, JX509EncodedKeySpec>) end;



  JPKCS8EncodedKeySpecClass = interface(JKeySpecClass)
    ['{FD0AA318-9646-49F1-8721-6138A5D99D04}']
    {class} function init(encodedKey: TJavaArray<Byte>): JPKCS8EncodedKeySpec; cdecl;
  end;

  [JavaSignature('java/security/spec/PKCS8EncodedKeySpec')]
  JPKCS8EncodedKeySpec = interface(JKeySpec)
    ['{68143C33-4B80-4796-8508-B99DEFA882FB}']
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getFormat: JString; cdecl;
  end;
  TJPKCS8EncodedKeySpec = class(TJavaGenericImport<JPKCS8EncodedKeySpecClass, JPKCS8EncodedKeySpec>) end;




  JX500PrincipalClass = interface(JObjectClass)
    ['{E0B6B839-5334-490B-BBC3-6D38CFB3AED0}']
    {class} function _GetCANONICAL: JString; cdecl;
    {class} function _GetRFC1779: JString; cdecl;
    {class} function _GetRFC2253: JString; cdecl;
    {class} function init(name: TJavaArray<Byte>): JX500Principal; cdecl; overload;
    {class} function init(in_: JInputStream): JX500Principal; cdecl; overload;
    {class} function init(name: JString): JX500Principal; cdecl; overload;
    {class} function init(name: JString; keywordMap: JMap): JX500Principal; cdecl; overload;
    {class} property CANONICAL: JString read _GetCANONICAL;
    {class} property RFC1779: JString read _GetRFC1779;
    {class} property RFC2253: JString read _GetRFC2253;
  end;

  [JavaSignature('javax/security/auth/x500/X500Principal')]
  JX500Principal = interface(JObject)
    ['{1C39966D-9B56-4BD7-916C-EF8E184C8104}']
    function equals(o: JObject): Boolean; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getName: JString; cdecl; overload;
    function getName(format: JString): JString; cdecl; overload;
    function getName(format: JString; oidMap: JMap): JString; cdecl; overload;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJX500Principal = class(TJavaGenericImport<JX500PrincipalClass, JX500Principal>) end;

  Jcert_CertificateClass = interface(JObjectClass)
    ['{2292F501-8B55-4C79-BCE4-FB595F1681D5}']
    {class} function init: Jcert_Certificate; cdecl;
  end;

  [JavaSignature('javax/security/cert/Certificate')]
  Jcert_Certificate = interface(JObject)
    ['{92E4B953-E47C-4C1C-813F-1B66CFF2219A}']
    function equals(obj: JObject): Boolean; cdecl;
    function getEncoded: TJavaArray<Byte>; cdecl;
    function getPublicKey: JPublicKey; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure verify(key: JPublicKey); cdecl; overload;
    procedure verify(key: JPublicKey; sigProvider: JString); cdecl; overload;
  end;
  TJcert_Certificate = class(TJavaGenericImport<Jcert_CertificateClass, Jcert_Certificate>) end;

  Jcert_X509CertificateClass = interface(Jcert_CertificateClass)
    ['{F4178D3A-27D4-4E49-8CE2-004126C293E0}']
    {class} function init: Jcert_X509Certificate; cdecl;
    {class} function getInstance(inStream: JInputStream): Jcert_X509Certificate; cdecl; overload;
    {class} function getInstance(certData: TJavaArray<Byte>): Jcert_X509Certificate; cdecl; overload;
  end;

  [JavaSignature('javax/security/cert/X509Certificate')]
  Jcert_X509Certificate = interface(Jcert_Certificate)
    ['{D7A9AC9B-D9AA-4CD0-99F6-93C3799E994F}']
    procedure checkValidity; cdecl; overload;
    procedure checkValidity(date: JDate); cdecl; overload;
    function getIssuerDN: JPrincipal; cdecl;
    function getNotAfter: JDate; cdecl;
    function getNotBefore: JDate; cdecl;
    function getSerialNumber: JBigInteger; cdecl;
    function getSigAlgName: JString; cdecl;
    function getSigAlgOID: JString; cdecl;
    function getSigAlgParams: TJavaArray<Byte>; cdecl;
    function getSubjectDN: JPrincipal; cdecl;
    function getVersion: Integer; cdecl;
  end;
  TJcert_X509Certificate = class(TJavaGenericImport<Jcert_X509CertificateClass, Jcert_X509Certificate>) end;

{$ENDIF}


implementation



//{$IFDEF ANDROID}
//
//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JAlgorithmParameters', TypeInfo(Androidapi.JNI.Java.Security.JAlgorithmParameters));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JCodeSigner', TypeInfo(Androidapi.JNI.Java.Security.JCodeSigner));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JCodeSource', TypeInfo(Androidapi.JNI.Java.Security.JCodeSource));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKey', TypeInfo(Androidapi.JNI.Java.Security.JKey));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeyFactory', TypeInfo(Androidapi.JNI.Java.Security.JKeyFactory));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeyStore', TypeInfo(Androidapi.JNI.Java.Security.JKeyStore));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeyStore_Entry', TypeInfo(Androidapi.JNI.Java.Security.JKeyStore_Entry));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeyStore_LoadStoreParameter', TypeInfo(Androidapi.JNI.Java.Security.JKeyStore_LoadStoreParameter));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeyStore_ProtectionParameter', TypeInfo(Androidapi.JNI.Java.Security.JKeyStore_ProtectionParameter));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPermission', TypeInfo(Androidapi.JNI.Java.Security.JPermission));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPermissionCollection', TypeInfo(Androidapi.JNI.Java.Security.JPermissionCollection));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPrincipal', TypeInfo(Androidapi.JNI.Java.Security.JPrincipal));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPrivateKey', TypeInfo(Androidapi.JNI.Java.Security.JPrivateKey));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JProtectionDomain', TypeInfo(Androidapi.JNI.Java.Security.JProtectionDomain));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JProvider', TypeInfo(Androidapi.JNI.Java.Security.JProvider));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JProvider_Service', TypeInfo(Androidapi.JNI.Java.Security.JProvider_Service));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPublicKey', TypeInfo(Androidapi.JNI.Java.Security.JPublicKey));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JSecureRandom', TypeInfo(Androidapi.JNI.Java.Security.JSecureRandom));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JSignatureSpi', TypeInfo(Androidapi.JNI.Java.Security.JSignatureSpi));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.Jsecurity_Signature', TypeInfo(Androidapi.JNI.Java.Security.Jsecurity_Signature));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.Jsecurity_Timestamp', TypeInfo(Androidapi.JNI.Java.Security.Jsecurity_Timestamp));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JCertPath', TypeInfo(Androidapi.JNI.Java.Security.JCertPath));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JCertificate', TypeInfo(Androidapi.JNI.Java.Security.JCertificate));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JX509Certificate', TypeInfo(Androidapi.JNI.Java.Security.JX509Certificate));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JAlgorithmParameterSpec', TypeInfo(Androidapi.JNI.Java.Security.JAlgorithmParameterSpec));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JEncodedKeySpec', TypeInfo(Androidapi.JNI.Java.Security.JEncodedKeySpec));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JKeySpec', TypeInfo(Androidapi.JNI.Java.Security.JKeySpec));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JX509EncodedKeySpec', TypeInfo(Androidapi.JNI.Java.Security.JX509EncodedKeySpec));
//
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JPKCS8EncodedKeySpec', TypeInfo(Androidapi.JNI.Java.Security.JPKCS8EncodedKeySpec));
//
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.JX500Principal', TypeInfo(Androidapi.JNI.Java.Security.JX500Principal));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.Jcert_Certificate', TypeInfo(Androidapi.JNI.Java.Security.Jcert_Certificate));
//  TRegTypes.RegisterType('Androidapi.JNI.Java.Security.Jcert_X509Certificate', TypeInfo(Androidapi.JNI.Java.Security.Jcert_X509Certificate));
//end;
//
//initialization
//  RegisterTypes;
//
//{$ENDIF}


end.



