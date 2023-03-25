//Code Fix By [金华]DelphiTeacher(452330643)

//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2022-12-02 11:28:28
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.SDKLib;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.GraphicsContentViewText, 
  Androidapi.JNI.Hardware, 
  Androidapi.JNI.os, 
  Androidapi.JNI.Bluetooth;


type

// ===== Forward declarations =====

//  JPrinterDevices_1 = interface; //com.gprinter.bean.PrinterDevices$1
  JPrinterDevices_Build = interface; //com.gprinter.bean.PrinterDevices$Build
  JPrinterDevices = interface; //com.gprinter.bean.PrinterDevices
//  JCpclCommand_1 = interface; //com.gprinter.command.CpclCommand$1
  JCpclCommand_ALIGNMENT = interface; //com.gprinter.command.CpclCommand$ALIGNMENT
  JCpclCommand_BARCODERATIO = interface; //com.gprinter.command.CpclCommand$BARCODERATIO
  JCpclCommand_BOLD = interface; //com.gprinter.command.CpclCommand$BOLD
  JCpclCommand_COMMAND = interface; //com.gprinter.command.CpclCommand$COMMAND
  JCpclCommand_COUNTRY = interface; //com.gprinter.command.CpclCommand$COUNTRY
  JCpclCommand_CPCLBARCODETYPE = interface; //com.gprinter.command.CpclCommand$CPCLBARCODETYPE
  JCpclCommand_CPCLSPEED = interface; //com.gprinter.command.CpclCommand$CPCLSPEED
  JCpclCommand_TEXTFONT = interface; //com.gprinter.command.CpclCommand$TEXTFONT
  JCpclCommand_TEXT_FONT = interface; //com.gprinter.command.CpclCommand$TEXT_FONT
  JCpclCommand = interface; //com.gprinter.command.CpclCommand
  JEscCommand_CHARACTER_SET = interface; //com.gprinter.command.EscCommand$CHARACTER_SET
  JEscCommand_CODEPAGE = interface; //com.gprinter.command.EscCommand$CODEPAGE
  JEscCommand_ENABLE = interface; //com.gprinter.command.EscCommand$ENABLE
  JEscCommand_FONT = interface; //com.gprinter.command.EscCommand$FONT
  JEscCommand_HEIGHT_ZOOM = interface; //com.gprinter.command.EscCommand$HEIGHT_ZOOM
  JEscCommand_HRI_POSITION = interface; //com.gprinter.command.EscCommand$HRI_POSITION
  JEscCommand_JUSTIFICATION = interface; //com.gprinter.command.EscCommand$JUSTIFICATION
  JEscCommand_STATUS = interface; //com.gprinter.command.EscCommand$STATUS
  JEscCommand_UNDERLINE_MODE = interface; //com.gprinter.command.EscCommand$UNDERLINE_MODE
  JEscCommand_WIDTH_ZOOM = interface; //com.gprinter.command.EscCommand$WIDTH_ZOOM
  JEscCommand = interface; //com.gprinter.command.EscCommand
  JGsCommand = interface; //com.gprinter.command.GsCommand
  JLabelCommand_BARCODETYPE = interface; //com.gprinter.command.LabelCommand$BARCODETYPE
  JLabelCommand_BITMAP_MODE = interface; //com.gprinter.command.LabelCommand$BITMAP_MODE
  JLabelCommand_CODEPAGE = interface; //com.gprinter.command.LabelCommand$CODEPAGE
  JLabelCommand_DENSITY = interface; //com.gprinter.command.LabelCommand$DENSITY
  JLabelCommand_DIRECTION = interface; //com.gprinter.command.LabelCommand$DIRECTION
  JLabelCommand_EEC = interface; //com.gprinter.command.LabelCommand$EEC
  JLabelCommand_ENABLE = interface; //com.gprinter.command.LabelCommand$ENABLE
  JLabelCommand_FONTMUL = interface; //com.gprinter.command.LabelCommand$FONTMUL
  JLabelCommand_FONTTYPE = interface; //com.gprinter.command.LabelCommand$FONTTYPE
  JLabelCommand_FOOT = interface; //com.gprinter.command.LabelCommand$FOOT
  JLabelCommand_MIRROR = interface; //com.gprinter.command.LabelCommand$MIRROR
  JLabelCommand_READABEL = interface; //com.gprinter.command.LabelCommand$READABEL
  JLabelCommand_RESPONSE_MODE = interface; //com.gprinter.command.LabelCommand$RESPONSE_MODE
  JLabelCommand_ROTATION = interface; //com.gprinter.command.LabelCommand$ROTATION
  JLabelCommand_Shape = interface; //com.gprinter.command.LabelCommand$Shape
  JLabelCommand_SPEED = interface; //com.gprinter.command.LabelCommand$SPEED
  JLabelCommand = interface; //com.gprinter.command.LabelCommand
  JZPLCommand_Code128Mode = interface; //com.gprinter.command.ZPLCommand$Code128Mode
  JZPLCommand_CodeMark = interface; //com.gprinter.command.ZPLCommand$CodeMark
  JZPLCommand_EC = interface; //com.gprinter.command.ZPLCommand$EC
  JZPLCommand_Font = interface; //com.gprinter.command.ZPLCommand$Font
  JZPLCommand_Identifier = interface; //com.gprinter.command.ZPLCommand$Identifier
  JZPLCommand_Mode = interface; //com.gprinter.command.ZPLCommand$Mode
  JZPLCommand_Rotation = interface; //com.gprinter.command.ZPLCommand$Rotation
  JZPLCommand_Scale = interface; //com.gprinter.command.ZPLCommand$Scale
  JZPLCommand_StartCharacter = interface; //com.gprinter.command.ZPLCommand$StartCharacter
  JZPLCommand = interface; //com.gprinter.command.ZPLCommand
//  JBleBlueToothPort_1 = interface; //com.gprinter.io.BleBlueToothPort$1
//  JBleBlueToothPort_2 = interface; //com.gprinter.io.BleBlueToothPort$2
//  JBleBlueToothPort_3 = interface; //com.gprinter.io.BleBlueToothPort$3
//  JBleBlueToothPort_4 = interface; //com.gprinter.io.BleBlueToothPort$4
//  JBleBlueToothPort_5 = interface; //com.gprinter.io.BleBlueToothPort$5
//  JBleBlueToothPort_6 = interface; //com.gprinter.io.BleBlueToothPort$6
//  JBleBlueToothPort_7 = interface; //com.gprinter.io.BleBlueToothPort$7
//  JBleBlueToothPort_BleGattCallback_1 = interface; //com.gprinter.io.BleBlueToothPort$BleGattCallback$1
//  JBleBlueToothPort_BleGattCallback_2_1 = interface; //com.gprinter.io.BleBlueToothPort$BleGattCallback$2$1
//  JBleBlueToothPort_BleGattCallback_2 = interface; //com.gprinter.io.BleBlueToothPort$BleGattCallback$2
//  JBleBlueToothPort_BleGattCallback_3 = interface; //com.gprinter.io.BleBlueToothPort$BleGattCallback$3
  JBleBlueToothPort_BleGattCallback = interface; //com.gprinter.io.BleBlueToothPort$BleGattCallback
  JBleBlueToothPort = interface; //com.gprinter.io.BleBlueToothPort
//  JBluetoothPort_1 = interface; //com.gprinter.io.BluetoothPort$1
//  JBluetoothPort_2 = interface; //com.gprinter.io.BluetoothPort$2
//  JBluetoothPort_3 = interface; //com.gprinter.io.BluetoothPort$3
//  JBluetoothPort_4 = interface; //com.gprinter.io.BluetoothPort$4
//  JBluetoothPort_5 = interface; //com.gprinter.io.BluetoothPort$5
//  JBluetoothPort_6 = interface; //com.gprinter.io.BluetoothPort$6
//  JBluetoothPort_7 = interface; //com.gprinter.io.BluetoothPort$7
//  JBluetoothPort_IoReader_1 = interface; //com.gprinter.io.BluetoothPort$IoReader$1
//  JBluetoothPort_IoReader_2 = interface; //com.gprinter.io.BluetoothPort$IoReader$2
  JBluetoothPort_IoReader = interface; //com.gprinter.io.BluetoothPort$IoReader
  JBluetoothPort = interface; //com.gprinter.io.BluetoothPort
//  JEthernetPort_1 = interface; //com.gprinter.io.EthernetPort$1
//  JEthernetPort_2 = interface; //com.gprinter.io.EthernetPort$2
//  JEthernetPort_3 = interface; //com.gprinter.io.EthernetPort$3
//  JEthernetPort_4 = interface; //com.gprinter.io.EthernetPort$4
//  JEthernetPort_5 = interface; //com.gprinter.io.EthernetPort$5
//  JEthernetPort_6 = interface; //com.gprinter.io.EthernetPort$6
//  JEthernetPort_7 = interface; //com.gprinter.io.EthernetPort$7
//  JEthernetPort_8 = interface; //com.gprinter.io.EthernetPort$8
//  JEthernetPort_IoReader_1 = interface; //com.gprinter.io.EthernetPort$IoReader$1
//  JEthernetPort_IoReader_2 = interface; //com.gprinter.io.EthernetPort$IoReader$2
  JEthernetPort_IoReader = interface; //com.gprinter.io.EthernetPort$IoReader
//  JEthernetPort_PingReader_1 = interface; //com.gprinter.io.EthernetPort$PingReader$1
  JEthernetPort_PingReader = interface; //com.gprinter.io.EthernetPort$PingReader
  JEthernetPort = interface; //com.gprinter.io.EthernetPort
  JPortManager = interface; //com.gprinter.io.PortManager
//  JSerialPort_1 = interface; //com.gprinter.io.SerialPort$1
//  JSerialPort_2 = interface; //com.gprinter.io.SerialPort$2
//  JSerialPort_3 = interface; //com.gprinter.io.SerialPort$3
//  JSerialPort_4 = interface; //com.gprinter.io.SerialPort$4
//  JSerialPort_5 = interface; //com.gprinter.io.SerialPort$5
//  JSerialPort_IoReader_1 = interface; //com.gprinter.io.SerialPort$IoReader$1
//  JSerialPort_IoReader_2 = interface; //com.gprinter.io.SerialPort$IoReader$2
  JSerialPort_IoReader = interface; //com.gprinter.io.SerialPort$IoReader
  JSerialPort = interface; //com.gprinter.io.SerialPort
//  JUsbPort_1_1 = interface; //com.gprinter.io.UsbPort$1$1
//  JUsbPort_1_2 = interface; //com.gprinter.io.UsbPort$1$2
//  JUsbPort_1 = interface; //com.gprinter.io.UsbPort$1
//  JUsbPort_2 = interface; //com.gprinter.io.UsbPort$2
//  JUsbPort_3 = interface; //com.gprinter.io.UsbPort$3
//  JUsbPort_4 = interface; //com.gprinter.io.UsbPort$4
//  JUsbPort_5 = interface; //com.gprinter.io.UsbPort$5
//  JUsbPort_6 = interface; //com.gprinter.io.UsbPort$6
//  JUsbPort_IoReader_1 = interface; //com.gprinter.io.UsbPort$IoReader$1
//  JUsbPort_IoReader_2 = interface; //com.gprinter.io.UsbPort$IoReader$2
  JUsbPort_IoReader = interface; //com.gprinter.io.UsbPort$IoReader
  JUsbPort = interface; //com.gprinter.io.UsbPort
  JBuildConfig = interface; //com.gprinter.sdklib.BuildConfig
  JBitmapUtils = interface; //com.gprinter.utils.BitmapUtils
  JBMPConverter_RGBTriple = interface; //com.gprinter.utils.BMPConverter$RGBTriple
  JBMPConverter = interface; //com.gprinter.utils.BMPConverter
  JBMPConverterUtil_RGBTriple = interface; //com.gprinter.utils.BMPConverterUtil$RGBTriple
  JBMPConverterUtil = interface; //com.gprinter.utils.BMPConverterUtil
  JCallbackListener = interface; //com.gprinter.utils.CallbackListener
  JCommand = interface; //com.gprinter.utils.Command
  JConnMethod = interface; //com.gprinter.utils.ConnMethod
  JGpUtils = interface; //com.gprinter.utils.GpUtils
  JHexUtils = interface; //com.gprinter.utils.HexUtils
  JLogUtils = interface; //com.gprinter.utils.LogUtils
  JMenu58Utils = interface; //com.gprinter.utils.Menu58Utils
  JMenu80Utils = interface; //com.gprinter.utils.Menu80Utils
  JPDFUtils = interface; //com.gprinter.utils.PDFUtils
  JPicFromPrintUtils = interface; //com.gprinter.utils.PicFromPrintUtils
  JSDKUtils = interface; //com.gprinter.utils.SDKUtils
  JSerialPortControl = interface; //com.gprinter.utils.SerialPortControl
  JSerialPortFinder_Driver = interface; //com.gprinter.utils.SerialPortFinder$Driver
  JSerialPortFinder = interface; //com.gprinter.utils.SerialPortFinder
  JUIThreadManager = interface; //com.gprinter.utils.UIThreadManager
  JWordUtils = interface; //com.gprinter.utils.WordUtils
  JZLibUtils = interface; //com.gprinter.utils.ZLibUtils
//  JBase64_InputStream = interface; //com.gprinter.zb.Base64$InputStream
  JBase64_OutputStream = interface; //com.gprinter.zb.Base64$OutputStream
  JBase64 = interface; //com.gprinter.zb.Base64
  JCompressedBitmapOutputStreamA = interface; //com.gprinter.zb.CompressedBitmapOutputStreamA
  JCompressedBitmapOutputStreamZpl = interface; //com.gprinter.zb.CompressedBitmapOutputStreamZpl
//  JCustomGZIPInputStream = interface; //com.gprinter.zb.CustomGZIPInputStream
  JDitheredImageProvider = interface; //com.gprinter.zb.DitheredImageProvider
  JDitherer = interface; //com.gprinter.zb.Ditherer
  JNaughtyBitOutputStream = interface; //com.gprinter.zb.NaughtyBitOutputStream
  JReflectionUtil = interface; //com.gprinter.zb.ReflectionUtil
  JZBUtil = interface; //com.gprinter.zb.ZBUtil
  JZebraImageAndroid = interface; //com.gprinter.zb.ZebraImageAndroid
  JZebraImageI = interface; //com.gprinter.zb.ZebraImageI
  JZebraImageInternal = interface; //com.gprinter.zb.ZebraImageInternal
  JZPLUtilities_FileObjectDetails = interface; //com.gprinter.zb.ZPLUtilities$FileObjectDetails
  JZPLUtilities_InternalCharacterFilteringOutputStream = interface; //com.gprinter.zb.ZPLUtilities$InternalCharacterFilteringOutputStream
  JZPLUtilities = interface; //com.gprinter.zb.ZPLUtilities
  JAdler32 = interface; //com.jcraft.jzlib.Adler32
  JChecksum = interface; //com.jcraft.jzlib.Checksum
  JCRC32 = interface; //com.jcraft.jzlib.CRC32
  JDeflate_Config = interface; //com.jcraft.jzlib.Deflate$Config
  JDeflate = interface; //com.jcraft.jzlib.Deflate
//  JDeflater = interface; //com.jcraft.jzlib.Deflater
  JDeflaterOutputStream = interface; //com.jcraft.jzlib.DeflaterOutputStream
  JGZIPException = interface; //com.jcraft.jzlib.GZIPException
  JGZIPHeader = interface; //com.jcraft.jzlib.GZIPHeader
//  JGZIPInputStream = interface; //com.jcraft.jzlib.GZIPInputStream
  JGZIPOutputStream = interface; //com.jcraft.jzlib.GZIPOutputStream
  JInfBlocks = interface; //com.jcraft.jzlib.InfBlocks
  JInfCodes = interface; //com.jcraft.jzlib.InfCodes
  JInflate_Return = interface; //com.jcraft.jzlib.Inflate$Return
  JInflate = interface; //com.jcraft.jzlib.Inflate
//  JInflater = interface; //com.jcraft.jzlib.Inflater
//  JInflaterInputStream = interface; //com.jcraft.jzlib.InflaterInputStream
  JInfTree = interface; //com.jcraft.jzlib.InfTree
  JJZlib_WrapperType = interface; //com.jcraft.jzlib.JZlib$WrapperType
  JJZlib = interface; //com.jcraft.jzlib.JZlib
  JStaticTree = interface; //com.jcraft.jzlib.StaticTree
  JTree = interface; //com.jcraft.jzlib.Tree
//  JZInputStream = interface; //com.jcraft.jzlib.ZInputStream
  JZOutputStream = interface; //com.jcraft.jzlib.ZOutputStream
  JZStream = interface; //com.jcraft.jzlib.ZStream
  JZStreamException = interface; //com.jcraft.jzlib.ZStreamException

// ===== Forward SuperClasses declarations =====

  JPortManagerClass = interface; //com.gprinter.io.PortManager
  JCompressedBitmapOutputStreamAClass = interface; //com.gprinter.zb.CompressedBitmapOutputStreamA
  JZStreamClass = interface; //com.jcraft.jzlib.ZStream
//  JInflaterInputStreamClass = interface; //com.jcraft.jzlib.InflaterInputStream
  JDeflaterOutputStreamClass = interface; //com.jcraft.jzlib.DeflaterOutputStream

// ===== Interface declarations =====

//  JPrinterDevices_1Class = interface(JObjectClass)
//  ['{AD7BF43B-3B87-4E4C-B205-1B9FDE14D0F7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/bean/PrinterDevices$1')]
//  JPrinterDevices_1 = interface(JObject)
//  ['{79CE01C9-5422-433F-B95F-9ED04E5BDE8A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJPrinterDevices_1 = class(TJavaGenericImport<JPrinterDevices_1Class, JPrinterDevices_1>) end;

  JPrinterDevices_BuildClass = interface(JObjectClass)
  ['{8637551F-7AFE-4B9F-9A5A-F2C7B6CE786A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterDevices_Build; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/bean/PrinterDevices$Build')]
  JPrinterDevices_Build = interface(JObject)
  ['{BBD99B17-0D1D-4419-AA8A-FD2ECCB1557E}']
    { Property Methods }

    { methods }
    function setContext(context: JContext): JPrinterDevices_Build; cdecl; //(Landroid/content/Context;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setId(id: Integer): JPrinterDevices_Build; cdecl; //(I)Lcom/gprinter/bean/PrinterDevices$Build;
    function setConnMethod(connMethod: JConnMethod): JPrinterDevices_Build; cdecl; //(Lcom/gprinter/utils/ConnMethod;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setMacAddress(macAddress: JString): JPrinterDevices_Build; cdecl; //(Ljava/lang/String;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setBlueName(blueName: JString): JPrinterDevices_Build; cdecl; //(Ljava/lang/String;)Lcom/gprinter/bean/PrinterDevices$Build;
//    function setUsbDevice(usbDevice: JUsbDevice): JPrinterDevices_Build; cdecl; //(Landroid/hardware/usb/UsbDevice;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setIp(ip: JString): JPrinterDevices_Build; cdecl; //(Ljava/lang/String;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setPort(port: Integer): JPrinterDevices_Build; cdecl; //(I)Lcom/gprinter/bean/PrinterDevices$Build;
    function setSerialPort(serialPortPath: JString): JPrinterDevices_Build; cdecl; //(Ljava/lang/String;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setBaudrate(baudrate: Integer): JPrinterDevices_Build; cdecl; //(I)Lcom/gprinter/bean/PrinterDevices$Build;
    function setHandler(handler: JHandler): JPrinterDevices_Build; cdecl; //(Landroid/os/Handler;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setCommand(command: JCommand): JPrinterDevices_Build; cdecl; //(Lcom/gprinter/utils/Command;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setBle(ble: Integer): JPrinterDevices_Build; cdecl; //(I)Lcom/gprinter/bean/PrinterDevices$Build;
    function setCallbackListener(callbackListener: JCallbackListener): JPrinterDevices_Build; cdecl; //(Lcom/gprinter/utils/CallbackListener;)Lcom/gprinter/bean/PrinterDevices$Build;
    function setSafety(isSafety: Boolean): JPrinterDevices_Build; cdecl; //(Z)Lcom/gprinter/bean/PrinterDevices$Build;
    function build: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;

    { Property }
  end;

  TJPrinterDevices_Build = class(TJavaGenericImport<JPrinterDevices_BuildClass, JPrinterDevices_Build>) end;

  JPrinterDevicesClass = interface(JObjectClass)
  ['{64723D05-5E72-46AC-9087-827E9B7A1EB8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gprinter/bean/PrinterDevices')]
  JPrinterDevices = interface(JObject)
  ['{FF7C5864-DE66-4194-BE2C-97B92203A408}']
    { Property Methods }

    { methods }
    function getContext: JContext; cdecl; //()Landroid/content/Context;
    procedure setContext(context: JContext); cdecl; //(Landroid/content/Context;)V
    function getId: Integer; cdecl; //()I
    procedure setId(id: Integer); cdecl; //(I)V
    function getConnMethod: JConnMethod; cdecl; //()Lcom/gprinter/utils/ConnMethod;
    procedure setConnMethod(connMethod: JConnMethod); cdecl; //(Lcom/gprinter/utils/ConnMethod;)V
    function getMacAddress: JString; cdecl; //()Ljava/lang/String;
    procedure setMacAddress(macAddress: JString); cdecl; //(Ljava/lang/String;)V
    function getBlueName: JString; cdecl; //()Ljava/lang/String;
    procedure setBlueName(blueName: JString); cdecl; //(Ljava/lang/String;)V
//    function getUsbDevice: JUsbDevice; cdecl; //()Landroid/hardware/usb/UsbDevice;
//    procedure setUsbDevice(usbDevice: JUsbDevice); cdecl; //(Landroid/hardware/usb/UsbDevice;)V
    function getIp: JString; cdecl; //()Ljava/lang/String;
    procedure setIp(ip: JString); cdecl; //(Ljava/lang/String;)V
    function getPort: Integer; cdecl; //()I
    procedure setPort(port: Integer); cdecl; //(I)V
    function getSerialPortPath: JString; cdecl; //()Ljava/lang/String;
    procedure setSerialPortPath(serialPortPath: JString); cdecl; //(Ljava/lang/String;)V
    function getBaudRate: Integer; cdecl; //()I
    procedure setBaudRate(baudRate: Integer); cdecl; //(I)V
    function getHandler: JHandler; cdecl; //()Landroid/os/Handler;
    procedure setHandler(handler: JHandler); cdecl; //(Landroid/os/Handler;)V
    function getBle: Integer; cdecl; //()I
    procedure setBle(ble: Integer); cdecl; //(I)V
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function isSafety: Boolean; cdecl; //()Z
    procedure setSafety(safety: Boolean); cdecl; //(Z)V
    function getCallbackListener: JCallbackListener; cdecl; //()Lcom/gprinter/utils/CallbackListener;
    procedure setCallbackListener(callbackListener: JCallbackListener); cdecl; //(Lcom/gprinter/utils/CallbackListener;)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJPrinterDevices = class(TJavaGenericImport<JPrinterDevicesClass, JPrinterDevices>) end;

//  JCpclCommand_1Class = interface(JObjectClass)
//  ['{32C607C9-4232-4AA4-A03E-727D09786FCA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/command/CpclCommand$1')]
//  JCpclCommand_1 = interface(JObject)
//  ['{B892ECBE-BCC3-44E2-9C1E-868172EC27B5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJCpclCommand_1 = class(TJavaGenericImport<JCpclCommand_1Class, JCpclCommand_1>) end;

  JCpclCommand_ALIGNMENTClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{235D4721-5720-4A78-B6EA-241E1857A1E2}']
    { static Property Methods }
    {class} function _GetCENTER: JCpclCommand_ALIGNMENT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$ALIGNMENT;
    {class} function _GetLEFT: JCpclCommand_ALIGNMENT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$ALIGNMENT;
    {class} function _GetRIGHT: JCpclCommand_ALIGNMENT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$ALIGNMENT;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_ALIGNMENT>; cdecl; //()[Lcom/gprinter/command/CpclCommand$ALIGNMENT;
    {class} function valueOf(name: JString): JCpclCommand_ALIGNMENT; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$ALIGNMENT;

    { static Property }
    {class} property CENTER: JCpclCommand_ALIGNMENT read _GetCENTER;
    {class} property LEFT: JCpclCommand_ALIGNMENT read _GetLEFT;
    {class} property RIGHT: JCpclCommand_ALIGNMENT read _GetRIGHT;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$ALIGNMENT')]
  JCpclCommand_ALIGNMENT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{4767831C-0162-479D-A577-56A63E620A65}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_ALIGNMENT = class(TJavaGenericImport<JCpclCommand_ALIGNMENTClass, JCpclCommand_ALIGNMENT>) end;

  JCpclCommand_BARCODERATIOClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{077516C4-B47D-4B86-A05F-79F4B99FD3DB}']
    { static Property Methods }
    {class} function _GetPoint0: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint1: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint2: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint3: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint4: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint20: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint21: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint22: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint23: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint24: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint25: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint26: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint27: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint28: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint29: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function _GetPoint30: JCpclCommand_BARCODERATIO;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BARCODERATIO;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_BARCODERATIO>; cdecl; //()[Lcom/gprinter/command/CpclCommand$BARCODERATIO;
    {class} function valueOf(name: JString): JCpclCommand_BARCODERATIO; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$BARCODERATIO;

    { static Property }
    {class} property Point0: JCpclCommand_BARCODERATIO read _GetPoint0;
    {class} property Point1: JCpclCommand_BARCODERATIO read _GetPoint1;
    {class} property Point2: JCpclCommand_BARCODERATIO read _GetPoint2;
    {class} property Point3: JCpclCommand_BARCODERATIO read _GetPoint3;
    {class} property Point4: JCpclCommand_BARCODERATIO read _GetPoint4;
    {class} property Point20: JCpclCommand_BARCODERATIO read _GetPoint20;
    {class} property Point21: JCpclCommand_BARCODERATIO read _GetPoint21;
    {class} property Point22: JCpclCommand_BARCODERATIO read _GetPoint22;
    {class} property Point23: JCpclCommand_BARCODERATIO read _GetPoint23;
    {class} property Point24: JCpclCommand_BARCODERATIO read _GetPoint24;
    {class} property Point25: JCpclCommand_BARCODERATIO read _GetPoint25;
    {class} property Point26: JCpclCommand_BARCODERATIO read _GetPoint26;
    {class} property Point27: JCpclCommand_BARCODERATIO read _GetPoint27;
    {class} property Point28: JCpclCommand_BARCODERATIO read _GetPoint28;
    {class} property Point29: JCpclCommand_BARCODERATIO read _GetPoint29;
    {class} property Point30: JCpclCommand_BARCODERATIO read _GetPoint30;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$BARCODERATIO')]
  JCpclCommand_BARCODERATIO = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{AD3BEBD0-93AE-4F6E-848B-C9AC072D3B85}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_BARCODERATIO = class(TJavaGenericImport<JCpclCommand_BARCODERATIOClass, JCpclCommand_BARCODERATIO>) end;

  JCpclCommand_BOLDClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4DC78C34-FBAB-428B-985E-ACB31D5F8B8A}']
    { static Property Methods }
    {class} function _GetON: JCpclCommand_BOLD;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BOLD;
    {class} function _GetOFF: JCpclCommand_BOLD;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$BOLD;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_BOLD>; cdecl; //()[Lcom/gprinter/command/CpclCommand$BOLD;
    {class} function valueOf(name: JString): JCpclCommand_BOLD; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$BOLD;

    { static Property }
    {class} property ON: JCpclCommand_BOLD read _GetON;
    {class} property OFF: JCpclCommand_BOLD read _GetOFF;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$BOLD')]
  JCpclCommand_BOLD = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{F08301E9-4850-4FD3-8AC4-B98EA05CF3FC}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_BOLD = class(TJavaGenericImport<JCpclCommand_BOLDClass, JCpclCommand_BOLD>) end;

  JCpclCommand_COMMANDClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{B8031208-FC04-499A-BE9B-7A57158B19D4}']
    { static Property Methods }
    {class} function _GetBARCODE: JCpclCommand_COMMAND;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COMMAND;
    {class} function _GetVBARCODE: JCpclCommand_COMMAND;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COMMAND;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_COMMAND>; cdecl; //()[Lcom/gprinter/command/CpclCommand$COMMAND;
    {class} function valueOf(name: JString): JCpclCommand_COMMAND; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$COMMAND;

    { static Property }
    {class} property BARCODE: JCpclCommand_COMMAND read _GetBARCODE;
    {class} property VBARCODE: JCpclCommand_COMMAND read _GetVBARCODE;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$COMMAND')]
  JCpclCommand_COMMAND = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{14EAE645-0661-43BD-A644-2E737A6D8B93}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_COMMAND = class(TJavaGenericImport<JCpclCommand_COMMANDClass, JCpclCommand_COMMAND>) end;

  JCpclCommand_COUNTRYClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{BB2EA433-4A35-4655-8D83-385CB2455C59}']
    { static Property Methods }
    {class} function _GetPC850: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC852: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC860: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetFRANCE: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC865: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC866: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC858: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC747: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC864: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPC1001: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetPT1251: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetWPC1253: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetWPC1254: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetWPC1257: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetKATAKANA: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetWEST_EUROPE: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetGREEK: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetHEBREW: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetEAST_EUROPE: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetIRAN: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetIRANII: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetLATVIAN: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetARABIC: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetUYGUR: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetTHAI: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function _GetUSA: JCpclCommand_COUNTRY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$COUNTRY;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_COUNTRY>; cdecl; //()[Lcom/gprinter/command/CpclCommand$COUNTRY;
    {class} function valueOf(name: JString): JCpclCommand_COUNTRY; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$COUNTRY;

    { static Property }
    {class} property PC850: JCpclCommand_COUNTRY read _GetPC850;
    {class} property PC852: JCpclCommand_COUNTRY read _GetPC852;
    {class} property PC860: JCpclCommand_COUNTRY read _GetPC860;
    {class} property FRANCE: JCpclCommand_COUNTRY read _GetFRANCE;
    {class} property PC865: JCpclCommand_COUNTRY read _GetPC865;
    {class} property PC866: JCpclCommand_COUNTRY read _GetPC866;
    {class} property PC858: JCpclCommand_COUNTRY read _GetPC858;
    {class} property PC747: JCpclCommand_COUNTRY read _GetPC747;
    {class} property PC864: JCpclCommand_COUNTRY read _GetPC864;
    {class} property PC1001: JCpclCommand_COUNTRY read _GetPC1001;
    {class} property PT1251: JCpclCommand_COUNTRY read _GetPT1251;
    {class} property WPC1253: JCpclCommand_COUNTRY read _GetWPC1253;
    {class} property WPC1254: JCpclCommand_COUNTRY read _GetWPC1254;
    {class} property WPC1257: JCpclCommand_COUNTRY read _GetWPC1257;
    {class} property KATAKANA: JCpclCommand_COUNTRY read _GetKATAKANA;
    {class} property WEST_EUROPE: JCpclCommand_COUNTRY read _GetWEST_EUROPE;
    {class} property GREEK: JCpclCommand_COUNTRY read _GetGREEK;
    {class} property HEBREW: JCpclCommand_COUNTRY read _GetHEBREW;
    {class} property EAST_EUROPE: JCpclCommand_COUNTRY read _GetEAST_EUROPE;
    {class} property IRAN: JCpclCommand_COUNTRY read _GetIRAN;
    {class} property IRANII: JCpclCommand_COUNTRY read _GetIRANII;
    {class} property LATVIAN: JCpclCommand_COUNTRY read _GetLATVIAN;
    {class} property ARABIC: JCpclCommand_COUNTRY read _GetARABIC;
    {class} property UYGUR: JCpclCommand_COUNTRY read _GetUYGUR;
    {class} property THAI: JCpclCommand_COUNTRY read _GetTHAI;
    {class} property USA: JCpclCommand_COUNTRY read _GetUSA;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$COUNTRY')]
  JCpclCommand_COUNTRY = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{F61F2D3E-C1BA-44F0-8140-6FB1F1BCDB06}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_COUNTRY = class(TJavaGenericImport<JCpclCommand_COUNTRYClass, JCpclCommand_COUNTRY>) end;

  JCpclCommand_CPCLBARCODETYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{8C0EAECE-00E6-40E6-995A-145A82D3F04B}']
    { static Property Methods }
    {class} function _GetCODE128: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetUPC_A: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetUPC_E: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetEAN_13: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetEAN_8: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetCODE39: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetCODE93: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function _GetCODABAR: JCpclCommand_CPCLBARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_CPCLBARCODETYPE>; cdecl; //()[Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;
    {class} function valueOf(name: JString): JCpclCommand_CPCLBARCODETYPE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;

    { static Property }
    {class} property CODE128: JCpclCommand_CPCLBARCODETYPE read _GetCODE128;
    {class} property UPC_A: JCpclCommand_CPCLBARCODETYPE read _GetUPC_A;
    {class} property UPC_E: JCpclCommand_CPCLBARCODETYPE read _GetUPC_E;
    {class} property EAN_13: JCpclCommand_CPCLBARCODETYPE read _GetEAN_13;
    {class} property EAN_8: JCpclCommand_CPCLBARCODETYPE read _GetEAN_8;
    {class} property CODE39: JCpclCommand_CPCLBARCODETYPE read _GetCODE39;
    {class} property CODE93: JCpclCommand_CPCLBARCODETYPE read _GetCODE93;
    {class} property CODABAR: JCpclCommand_CPCLBARCODETYPE read _GetCODABAR;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$CPCLBARCODETYPE')]
  JCpclCommand_CPCLBARCODETYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{06F54E45-60D1-48BF-AC91-736E41626187}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_CPCLBARCODETYPE = class(TJavaGenericImport<JCpclCommand_CPCLBARCODETYPEClass, JCpclCommand_CPCLBARCODETYPE>) end;

  JCpclCommand_CPCLSPEEDClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{3F091760-4FDC-40C3-83DC-24AA2EFD5925}']
    { static Property Methods }
    {class} function _GetSPEED0: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function _GetSPEED1: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function _GetSPEED2: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function _GetSPEED3: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function _GetSPEED4: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function _GetSPEED5: JCpclCommand_CPCLSPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$CPCLSPEED;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_CPCLSPEED>; cdecl; //()[Lcom/gprinter/command/CpclCommand$CPCLSPEED;
    {class} function valueOf(name: JString): JCpclCommand_CPCLSPEED; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$CPCLSPEED;

    { static Property }
    {class} property SPEED0: JCpclCommand_CPCLSPEED read _GetSPEED0;
    {class} property SPEED1: JCpclCommand_CPCLSPEED read _GetSPEED1;
    {class} property SPEED2: JCpclCommand_CPCLSPEED read _GetSPEED2;
    {class} property SPEED3: JCpclCommand_CPCLSPEED read _GetSPEED3;
    {class} property SPEED4: JCpclCommand_CPCLSPEED read _GetSPEED4;
    {class} property SPEED5: JCpclCommand_CPCLSPEED read _GetSPEED5;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$CPCLSPEED')]
  JCpclCommand_CPCLSPEED = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{539C36C0-4C9D-4C63-AF29-A9A01105A56A}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_CPCLSPEED = class(TJavaGenericImport<JCpclCommand_CPCLSPEEDClass, JCpclCommand_CPCLSPEED>) end;

  JCpclCommand_TEXTFONTClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{45C60D8E-4FC3-4B2D-BCE1-38C99280120B}']
    { static Property Methods }
    {class} function _GetFONT_18: JCpclCommand_TEXTFONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXTFONT;
    {class} function _GetFONT_24: JCpclCommand_TEXTFONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXTFONT;
    {class} function _GetFONT_32: JCpclCommand_TEXTFONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXTFONT;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_TEXTFONT>; cdecl; //()[Lcom/gprinter/command/CpclCommand$TEXTFONT;
    {class} function valueOf(name: JString): JCpclCommand_TEXTFONT; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$TEXTFONT;

    { static Property }
    {class} property FONT_18: JCpclCommand_TEXTFONT read _GetFONT_18;
    {class} property FONT_24: JCpclCommand_TEXTFONT read _GetFONT_24;
    {class} property FONT_32: JCpclCommand_TEXTFONT read _GetFONT_32;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$TEXTFONT')]
  JCpclCommand_TEXTFONT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{83DFDE93-9F14-4FB7-9AD2-F2ED60AA4F92}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_TEXTFONT = class(TJavaGenericImport<JCpclCommand_TEXTFONTClass, JCpclCommand_TEXTFONT>) end;

  JCpclCommand_TEXT_FONTClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{341DC19B-B1DB-4D1D-8320-08AC4264405B}']
    { static Property Methods }
    {class} function _GetFONT_0: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_1: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_2: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_3: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_4: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_5: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_6: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_7: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_8: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_10: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_11: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_13: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_20: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_24: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_41: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_42: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_43: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_44: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_45: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_46: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_47: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_48: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_49: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function _GetFONT_55: JCpclCommand_TEXT_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/CpclCommand$TEXT_FONT;

    { static Methods }
    {class} function values: TJavaObjectArray<JCpclCommand_TEXT_FONT>; cdecl; //()[Lcom/gprinter/command/CpclCommand$TEXT_FONT;
    {class} function valueOf(name: JString): JCpclCommand_TEXT_FONT; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/CpclCommand$TEXT_FONT;

    { static Property }
    {class} property FONT_0: JCpclCommand_TEXT_FONT read _GetFONT_0;
    {class} property FONT_1: JCpclCommand_TEXT_FONT read _GetFONT_1;
    {class} property FONT_2: JCpclCommand_TEXT_FONT read _GetFONT_2;
    {class} property FONT_3: JCpclCommand_TEXT_FONT read _GetFONT_3;
    {class} property FONT_4: JCpclCommand_TEXT_FONT read _GetFONT_4;
    {class} property FONT_5: JCpclCommand_TEXT_FONT read _GetFONT_5;
    {class} property FONT_6: JCpclCommand_TEXT_FONT read _GetFONT_6;
    {class} property FONT_7: JCpclCommand_TEXT_FONT read _GetFONT_7;
    {class} property FONT_8: JCpclCommand_TEXT_FONT read _GetFONT_8;
    {class} property FONT_10: JCpclCommand_TEXT_FONT read _GetFONT_10;
    {class} property FONT_11: JCpclCommand_TEXT_FONT read _GetFONT_11;
    {class} property FONT_13: JCpclCommand_TEXT_FONT read _GetFONT_13;
    {class} property FONT_20: JCpclCommand_TEXT_FONT read _GetFONT_20;
    {class} property FONT_24: JCpclCommand_TEXT_FONT read _GetFONT_24;
    {class} property FONT_41: JCpclCommand_TEXT_FONT read _GetFONT_41;
    {class} property FONT_42: JCpclCommand_TEXT_FONT read _GetFONT_42;
    {class} property FONT_43: JCpclCommand_TEXT_FONT read _GetFONT_43;
    {class} property FONT_44: JCpclCommand_TEXT_FONT read _GetFONT_44;
    {class} property FONT_45: JCpclCommand_TEXT_FONT read _GetFONT_45;
    {class} property FONT_46: JCpclCommand_TEXT_FONT read _GetFONT_46;
    {class} property FONT_47: JCpclCommand_TEXT_FONT read _GetFONT_47;
    {class} property FONT_48: JCpclCommand_TEXT_FONT read _GetFONT_48;
    {class} property FONT_49: JCpclCommand_TEXT_FONT read _GetFONT_49;
    {class} property FONT_55: JCpclCommand_TEXT_FONT read _GetFONT_55;
  end;

  [JavaSignature('com/gprinter/command/CpclCommand$TEXT_FONT')]
  JCpclCommand_TEXT_FONT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{203035AB-52FC-4A0A-8A8A-C820F60D0138}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCpclCommand_TEXT_FONT = class(TJavaGenericImport<JCpclCommand_TEXT_FONTClass, JCpclCommand_TEXT_FONT>) end;

  JCpclCommandClass = interface(JObjectClass)
  ['{9937EB93-CE74-4A22-B496-FAD31AD08626}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCpclCommand; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/command/CpclCommand')]
  JCpclCommand = interface(JObject)
  ['{4858D8E8-980D-4337-94A4-AF2A0F096162}']
    { Property Methods }

    { methods }
    procedure clrCommand; cdecl; //()V
    procedure addInitializePrinter; cdecl; overload; //()V
    procedure addInitializePrinter(qty: Integer); cdecl; overload; //(I)V
    procedure addInitializePrinter(height: Integer; qty: Integer); cdecl; overload; //(II)V
    procedure addInitializePrinter(offset: Integer; height: Integer; qty: Integer); cdecl; overload; //(III)V
    procedure addPrint; cdecl; //()V
    procedure addText(font: JCpclCommand_TEXT_FONT; x: Integer; y: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$TEXT_FONT;IILjava/lang/String;)V
    procedure addText(font: JCpclCommand_TEXT_FONT; size: Integer; x: Integer; y: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$TEXT_FONT;IIILjava/lang/String;)V
    procedure addText90(font: JCpclCommand_TEXT_FONT; x: Integer; y: Integer; text: JString); cdecl; //(Lcom/gprinter/command/CpclCommand$TEXT_FONT;IILjava/lang/String;)V
    procedure addText180(font: JCpclCommand_TEXT_FONT; x: Integer; y: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$TEXT_FONT;IILjava/lang/String;)V
    procedure addText270(font: JCpclCommand_TEXT_FONT; x: Integer; y: Integer; text: JString); cdecl; //(Lcom/gprinter/command/CpclCommand$TEXT_FONT;IILjava/lang/String;)V
    procedure addText(font: JCpclCommand_TEXTFONT; x: Integer; y: Integer; text: JString; align: JCpclCommand_ALIGNMENT; P6: Integer); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$TEXTFONT;IILjava/lang/String;Lcom/gprinter/command/CpclCommand$ALIGNMENT;I)V
    procedure addText180(font: JCpclCommand_TEXTFONT; x: Integer; y: Integer; text: JString; n: Integer); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$TEXTFONT;IILjava/lang/String;I)V
    procedure addTextConcat(x: Integer; y: Integer; avar: TJavaObjectArray<JString>); cdecl; //(II[Ljava/lang/String;)V
    procedure addCount(value: JString); cdecl; //(Ljava/lang/String;)V
    procedure addSetmag(w: Integer; h: Integer); cdecl; //(II)V
    procedure addBarcode(command: JCpclCommand_COMMAND; atype: JCpclCommand_CPCLBARCODETYPE; height: Integer; x: Integer; y: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;IIILjava/lang/String;)V
    procedure addBarcode(command: JCpclCommand_COMMAND; atype: JCpclCommand_CPCLBARCODETYPE; height: Integer; x: Integer; y: Integer; number: Integer; offset: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;IIIIILjava/lang/String;)V
    procedure addBarcode(command: JCpclCommand_COMMAND; atype: JCpclCommand_CPCLBARCODETYPE; width: Integer; ratio: JCpclCommand_BARCODERATIO; height: Integer; x: Integer; y: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;ILcom/gprinter/command/CpclCommand$BARCODERATIO;IIILjava/lang/String;)V
    procedure addBarcode(command: JCpclCommand_COMMAND; atype: JCpclCommand_CPCLBARCODETYPE; width: Integer; ratio: JCpclCommand_BARCODERATIO; height: Integer; x: Integer; y: Integer; number: Integer; offset: Integer; text: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;Lcom/gprinter/command/CpclCommand$CPCLBARCODETYPE;ILcom/gprinter/command/CpclCommand$BARCODERATIO;IIIIILjava/lang/String;)V
    procedure addPdf417(command: JCpclCommand_COMMAND; x: Integer; y: Integer; data: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;IILjava/lang/String;)V
    procedure addPdf417(command: JCpclCommand_COMMAND; x: Integer; y: Integer; xd: Integer; yd: Integer; c: Integer; s: Integer; data: JString); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$COMMAND;IIIIIILjava/lang/String;)V
    procedure addBarcodeText(font: Integer; offset: Integer); cdecl; //(II)V
    procedure addBarcodeTextOff; cdecl; //()V
    procedure addBQrcode(x: Integer; y: Integer; n: Integer; u: Integer; text: JString); cdecl; overload; //(IIIILjava/lang/String;)V
    procedure addBQrcode(x: Integer; y: Integer; text: JString); cdecl; overload; //(IILjava/lang/String;)V
    procedure addVBQrcode(x: Integer; y: Integer; n: Integer; u: Integer; text: JString); cdecl; overload; //(IIIILjava/lang/String;)V
    procedure addVBQrcode(x: Integer; y: Integer; text: JString); cdecl; overload; //(IILjava/lang/String;)V
    procedure addBox(x: Integer; y: Integer; xend: Integer; yend: Integer; thickness: Integer); cdecl; //(IIIII)V
    procedure addLine(x: Integer; y: Integer; xend: Integer; yend: Integer; width: Integer); cdecl; //(IIIII)V
    procedure addInverseLine(x: Integer; y: Integer; xend: Integer; yend: Integer; width: Integer); cdecl; //(IIIII)V
    procedure addEGraphics(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addJPG(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addJPG2(x: Integer; y: Integer; nwidth: Integer; nbitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addCGraphics(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addCGJPG(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    function toHexString1(b: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    function toHexString2(b: Byte): JString; cdecl; //(B)Ljava/lang/String;
    procedure addJustification(align: JCpclCommand_ALIGNMENT); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$ALIGNMENT;)V
    procedure addJustification(align: JCpclCommand_ALIGNMENT; aend: Integer); cdecl; overload; //(Lcom/gprinter/command/CpclCommand$ALIGNMENT;I)V
    procedure addPagewidth(width: Integer); cdecl; //(I)V
    procedure addSpeed(level: JCpclCommand_CPCLSPEED); cdecl; //(Lcom/gprinter/command/CpclCommand$CPCLSPEED;)V
    procedure addCountry(name: JCpclCommand_COUNTRY); cdecl; //(Lcom/gprinter/command/CpclCommand$COUNTRY;)V
    procedure addBeep(beep_length: Integer); cdecl; //(I)V
    procedure addQueryPrinterStatus; cdecl; //()V
    procedure addForm; cdecl; //()V
    procedure addNote(text: JString); cdecl; //(Ljava/lang/String;)V
    procedure addEnd; cdecl; //()V
    procedure addSetsp(spacing: Integer); cdecl; //(I)V
    procedure addSetbold(value: JCpclCommand_BOLD); cdecl; //(Lcom/gprinter/command/CpclCommand$BOLD;)V
    procedure addSetlf(height: Integer); cdecl; //(I)V
    procedure addSetlp(font: Integer; size: Integer; spacing: Integer); cdecl; //(III)V
    procedure addPREtension(length: Integer); cdecl; //(I)V
    procedure addPOSTtension(length: Integer); cdecl; //(I)V
    procedure addWait(time: Integer); cdecl; //(I)V
    procedure addUserCommand(command: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure addUserCommand(astring: JString); cdecl; overload; //(Ljava/lang/String;)V
    function getCommand: TObject; cdecl; //()Ljava/util/Vector;

    { Property }
  end;

  TJCpclCommand = class(TJavaGenericImport<JCpclCommandClass, JCpclCommand>) end;

  JEscCommand_CHARACTER_SETClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{E8253266-5831-49CF-B537-166EEAF70EB8}']
    { static Property Methods }
    {class} function _GetUSA: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetFRANCE: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetGERMANY: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetUK: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetDENMARK_I: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetSWEDEN: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetITALY: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetSPAIN_I: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetJAPAN: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetNORWAY: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetDENMARK_II: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetSPAIN_II: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetLATIN_AMERCIA: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetKOREAN: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetSLOVENIA: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function _GetCHINA: JEscCommand_CHARACTER_SET;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CHARACTER_SET;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_CHARACTER_SET>; cdecl; //()[Lcom/gprinter/command/EscCommand$CHARACTER_SET;
    {class} function valueOf(name: JString): JEscCommand_CHARACTER_SET; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$CHARACTER_SET;

    { static Property }
    {class} property USA: JEscCommand_CHARACTER_SET read _GetUSA;
    {class} property FRANCE: JEscCommand_CHARACTER_SET read _GetFRANCE;
    {class} property GERMANY: JEscCommand_CHARACTER_SET read _GetGERMANY;
    {class} property UK: JEscCommand_CHARACTER_SET read _GetUK;
    {class} property DENMARK_I: JEscCommand_CHARACTER_SET read _GetDENMARK_I;
    {class} property SWEDEN: JEscCommand_CHARACTER_SET read _GetSWEDEN;
    {class} property ITALY: JEscCommand_CHARACTER_SET read _GetITALY;
    {class} property SPAIN_I: JEscCommand_CHARACTER_SET read _GetSPAIN_I;
    {class} property JAPAN: JEscCommand_CHARACTER_SET read _GetJAPAN;
    {class} property NORWAY: JEscCommand_CHARACTER_SET read _GetNORWAY;
    {class} property DENMARK_II: JEscCommand_CHARACTER_SET read _GetDENMARK_II;
    {class} property SPAIN_II: JEscCommand_CHARACTER_SET read _GetSPAIN_II;
    {class} property LATIN_AMERCIA: JEscCommand_CHARACTER_SET read _GetLATIN_AMERCIA;
    {class} property KOREAN: JEscCommand_CHARACTER_SET read _GetKOREAN;
    {class} property SLOVENIA: JEscCommand_CHARACTER_SET read _GetSLOVENIA;
    {class} property CHINA: JEscCommand_CHARACTER_SET read _GetCHINA;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$CHARACTER_SET')]
  JEscCommand_CHARACTER_SET = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C0953BE8-9802-4CC0-A145-6D0EB4647CD5}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_CHARACTER_SET = class(TJavaGenericImport<JEscCommand_CHARACTER_SETClass, JEscCommand_CHARACTER_SET>) end;

  JEscCommand_CODEPAGEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{210A5E36-C041-45F2-9D01-FD9BE8F38A80}']
    { static Property Methods }
    {class} function _GetPC437: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetKATAKANA: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC850: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC860: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC863: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC865: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetWEST_EUROPE: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetGREEK: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetHEBREW: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetEAST_EUROPE: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetIRAN: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetWPC1252: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC866: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC852: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC858: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetIRANII: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetLATVIAN: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetARABIC: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPT151: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC747: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetWPC1257: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetVIETNAM: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC864: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetPC1001: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetUYGUR: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function _GetTHAI: JEscCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$CODEPAGE;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_CODEPAGE>; cdecl; //()[Lcom/gprinter/command/EscCommand$CODEPAGE;
    {class} function valueOf(name: JString): JEscCommand_CODEPAGE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$CODEPAGE;

    { static Property }
    {class} property PC437: JEscCommand_CODEPAGE read _GetPC437;
    {class} property KATAKANA: JEscCommand_CODEPAGE read _GetKATAKANA;
    {class} property PC850: JEscCommand_CODEPAGE read _GetPC850;
    {class} property PC860: JEscCommand_CODEPAGE read _GetPC860;
    {class} property PC863: JEscCommand_CODEPAGE read _GetPC863;
    {class} property PC865: JEscCommand_CODEPAGE read _GetPC865;
    {class} property WEST_EUROPE: JEscCommand_CODEPAGE read _GetWEST_EUROPE;
    {class} property GREEK: JEscCommand_CODEPAGE read _GetGREEK;
    {class} property HEBREW: JEscCommand_CODEPAGE read _GetHEBREW;
    {class} property EAST_EUROPE: JEscCommand_CODEPAGE read _GetEAST_EUROPE;
    {class} property IRAN: JEscCommand_CODEPAGE read _GetIRAN;
    {class} property WPC1252: JEscCommand_CODEPAGE read _GetWPC1252;
    {class} property PC866: JEscCommand_CODEPAGE read _GetPC866;
    {class} property PC852: JEscCommand_CODEPAGE read _GetPC852;
    {class} property PC858: JEscCommand_CODEPAGE read _GetPC858;
    {class} property IRANII: JEscCommand_CODEPAGE read _GetIRANII;
    {class} property LATVIAN: JEscCommand_CODEPAGE read _GetLATVIAN;
    {class} property ARABIC: JEscCommand_CODEPAGE read _GetARABIC;
    {class} property PT151: JEscCommand_CODEPAGE read _GetPT151;
    {class} property PC747: JEscCommand_CODEPAGE read _GetPC747;
    {class} property WPC1257: JEscCommand_CODEPAGE read _GetWPC1257;
    {class} property VIETNAM: JEscCommand_CODEPAGE read _GetVIETNAM;
    {class} property PC864: JEscCommand_CODEPAGE read _GetPC864;
    {class} property PC1001: JEscCommand_CODEPAGE read _GetPC1001;
    {class} property UYGUR: JEscCommand_CODEPAGE read _GetUYGUR;
    {class} property THAI: JEscCommand_CODEPAGE read _GetTHAI;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$CODEPAGE')]
  JEscCommand_CODEPAGE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2C4EEF49-74B6-4D9F-B18B-23A24D114AD4}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_CODEPAGE = class(TJavaGenericImport<JEscCommand_CODEPAGEClass, JEscCommand_CODEPAGE>) end;

  JEscCommand_ENABLEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{5B4FF03C-D02B-4201-80F3-53B264904AB4}']
    { static Property Methods }
    {class} function _GetOFF: JEscCommand_ENABLE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$ENABLE;
    {class} function _GetON: JEscCommand_ENABLE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$ENABLE;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_ENABLE>; cdecl; //()[Lcom/gprinter/command/EscCommand$ENABLE;
    {class} function valueOf(name: JString): JEscCommand_ENABLE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$ENABLE;

    { static Property }
    {class} property OFF: JEscCommand_ENABLE read _GetOFF;
    {class} property ON: JEscCommand_ENABLE read _GetON;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$ENABLE')]
  JEscCommand_ENABLE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{AA308932-4319-4F4F-8416-DA700BB676FF}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_ENABLE = class(TJavaGenericImport<JEscCommand_ENABLEClass, JEscCommand_ENABLE>) end;

  JEscCommand_FONTClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9E3B62D6-1DA9-4406-AE68-37C0C8616558}']
    { static Property Methods }
    {class} function _GetFONTA: JEscCommand_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$FONT;
    {class} function _GetFONTB: JEscCommand_FONT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$FONT;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_FONT>; cdecl; //()[Lcom/gprinter/command/EscCommand$FONT;
    {class} function valueOf(name: JString): JEscCommand_FONT; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$FONT;

    { static Property }
    {class} property FONTA: JEscCommand_FONT read _GetFONTA;
    {class} property FONTB: JEscCommand_FONT read _GetFONTB;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$FONT')]
  JEscCommand_FONT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{B61631AB-0C81-4E9A-9D2E-4C9A296FD570}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_FONT = class(TJavaGenericImport<JEscCommand_FONTClass, JEscCommand_FONT>) end;

  JEscCommand_HEIGHT_ZOOMClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{811EB058-1F79-4153-A620-8FC717642D00}']
    { static Property Methods }
    {class} function _GetMUL_1: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_2: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_3: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_4: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_5: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_6: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_7: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function _GetMUL_8: JEscCommand_HEIGHT_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_HEIGHT_ZOOM>; cdecl; //()[Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;
    {class} function valueOf(name: JString): JEscCommand_HEIGHT_ZOOM; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;

    { static Property }
    {class} property MUL_1: JEscCommand_HEIGHT_ZOOM read _GetMUL_1;
    {class} property MUL_2: JEscCommand_HEIGHT_ZOOM read _GetMUL_2;
    {class} property MUL_3: JEscCommand_HEIGHT_ZOOM read _GetMUL_3;
    {class} property MUL_4: JEscCommand_HEIGHT_ZOOM read _GetMUL_4;
    {class} property MUL_5: JEscCommand_HEIGHT_ZOOM read _GetMUL_5;
    {class} property MUL_6: JEscCommand_HEIGHT_ZOOM read _GetMUL_6;
    {class} property MUL_7: JEscCommand_HEIGHT_ZOOM read _GetMUL_7;
    {class} property MUL_8: JEscCommand_HEIGHT_ZOOM read _GetMUL_8;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$HEIGHT_ZOOM')]
  JEscCommand_HEIGHT_ZOOM = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{F7532BC9-D788-4CDC-83E2-C16E7E998B4C}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_HEIGHT_ZOOM = class(TJavaGenericImport<JEscCommand_HEIGHT_ZOOMClass, JEscCommand_HEIGHT_ZOOM>) end;

  JEscCommand_HRI_POSITIONClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9BE9E10C-EF97-4EB7-9112-59ECC115BD33}']
    { static Property Methods }
    {class} function _GetNO_PRINT: JEscCommand_HRI_POSITION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HRI_POSITION;
    {class} function _GetABOVE: JEscCommand_HRI_POSITION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HRI_POSITION;
    {class} function _GetBELOW: JEscCommand_HRI_POSITION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HRI_POSITION;
    {class} function _GetABOVE_AND_BELOW: JEscCommand_HRI_POSITION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$HRI_POSITION;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_HRI_POSITION>; cdecl; //()[Lcom/gprinter/command/EscCommand$HRI_POSITION;
    {class} function valueOf(name: JString): JEscCommand_HRI_POSITION; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$HRI_POSITION;

    { static Property }
    {class} property NO_PRINT: JEscCommand_HRI_POSITION read _GetNO_PRINT;
    {class} property ABOVE: JEscCommand_HRI_POSITION read _GetABOVE;
    {class} property BELOW: JEscCommand_HRI_POSITION read _GetBELOW;
    {class} property ABOVE_AND_BELOW: JEscCommand_HRI_POSITION read _GetABOVE_AND_BELOW;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$HRI_POSITION')]
  JEscCommand_HRI_POSITION = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3D6323DB-6FD5-427C-9B66-1F29122CE426}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_HRI_POSITION = class(TJavaGenericImport<JEscCommand_HRI_POSITIONClass, JEscCommand_HRI_POSITION>) end;

  JEscCommand_JUSTIFICATIONClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{03C3BB16-F73D-46A3-B01A-4503D384D668}']
    { static Property Methods }
    {class} function _GetLEFT: JEscCommand_JUSTIFICATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$JUSTIFICATION;
    {class} function _GetCENTER: JEscCommand_JUSTIFICATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$JUSTIFICATION;
    {class} function _GetRIGHT: JEscCommand_JUSTIFICATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$JUSTIFICATION;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_JUSTIFICATION>; cdecl; //()[Lcom/gprinter/command/EscCommand$JUSTIFICATION;
    {class} function valueOf(name: JString): JEscCommand_JUSTIFICATION; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$JUSTIFICATION;

    { static Property }
    {class} property LEFT: JEscCommand_JUSTIFICATION read _GetLEFT;
    {class} property CENTER: JEscCommand_JUSTIFICATION read _GetCENTER;
    {class} property RIGHT: JEscCommand_JUSTIFICATION read _GetRIGHT;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$JUSTIFICATION')]
  JEscCommand_JUSTIFICATION = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2BAA0E5B-1BC1-434B-B0DF-8B7DD007A058}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_JUSTIFICATION = class(TJavaGenericImport<JEscCommand_JUSTIFICATIONClass, JEscCommand_JUSTIFICATION>) end;

  JEscCommand_STATUSClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{080B104D-488A-40A6-A4CA-8E5394684EE3}']
    { static Property Methods }
    {class} function _GetPRINTER_STATUS: JEscCommand_STATUS;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$STATUS;
    {class} function _GetPRINTER_OFFLINE: JEscCommand_STATUS;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$STATUS;
    {class} function _GetPRINTER_ERROR: JEscCommand_STATUS;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$STATUS;
    {class} function _GetPRINTER_PAPER: JEscCommand_STATUS;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$STATUS;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_STATUS>; cdecl; //()[Lcom/gprinter/command/EscCommand$STATUS;
    {class} function valueOf(name: JString): JEscCommand_STATUS; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$STATUS;

    { static Property }
    {class} property PRINTER_STATUS: JEscCommand_STATUS read _GetPRINTER_STATUS;
    {class} property PRINTER_OFFLINE: JEscCommand_STATUS read _GetPRINTER_OFFLINE;
    {class} property PRINTER_ERROR: JEscCommand_STATUS read _GetPRINTER_ERROR;
    {class} property PRINTER_PAPER: JEscCommand_STATUS read _GetPRINTER_PAPER;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$STATUS')]
  JEscCommand_STATUS = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{73E36AA0-948A-40BB-BC82-F59A57E4E511}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_STATUS = class(TJavaGenericImport<JEscCommand_STATUSClass, JEscCommand_STATUS>) end;

  JEscCommand_UNDERLINE_MODEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{75119A29-12DD-419D-8248-41CA5B955192}']
    { static Property Methods }
    {class} function _GetOFF: JEscCommand_UNDERLINE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;
    {class} function _GetUNDERLINE_1DOT: JEscCommand_UNDERLINE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;
    {class} function _GetUNDERLINE_2DOT: JEscCommand_UNDERLINE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_UNDERLINE_MODE>; cdecl; //()[Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;
    {class} function valueOf(name: JString): JEscCommand_UNDERLINE_MODE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;

    { static Property }
    {class} property OFF: JEscCommand_UNDERLINE_MODE read _GetOFF;
    {class} property UNDERLINE_1DOT: JEscCommand_UNDERLINE_MODE read _GetUNDERLINE_1DOT;
    {class} property UNDERLINE_2DOT: JEscCommand_UNDERLINE_MODE read _GetUNDERLINE_2DOT;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$UNDERLINE_MODE')]
  JEscCommand_UNDERLINE_MODE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{80576E08-A08D-46EF-A2E4-36EBAF6DBD2E}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_UNDERLINE_MODE = class(TJavaGenericImport<JEscCommand_UNDERLINE_MODEClass, JEscCommand_UNDERLINE_MODE>) end;

  JEscCommand_WIDTH_ZOOMClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{2F16F8F4-0B4E-4BE8-A623-6F36C0E5C42C}']
    { static Property Methods }
    {class} function _GetMUL_1: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_2: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_3: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_4: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_5: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_6: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_7: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function _GetMUL_8: JEscCommand_WIDTH_ZOOM;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;

    { static Methods }
    {class} function values: TJavaObjectArray<JEscCommand_WIDTH_ZOOM>; cdecl; //()[Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;
    {class} function valueOf(name: JString): JEscCommand_WIDTH_ZOOM; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;

    { static Property }
    {class} property MUL_1: JEscCommand_WIDTH_ZOOM read _GetMUL_1;
    {class} property MUL_2: JEscCommand_WIDTH_ZOOM read _GetMUL_2;
    {class} property MUL_3: JEscCommand_WIDTH_ZOOM read _GetMUL_3;
    {class} property MUL_4: JEscCommand_WIDTH_ZOOM read _GetMUL_4;
    {class} property MUL_5: JEscCommand_WIDTH_ZOOM read _GetMUL_5;
    {class} property MUL_6: JEscCommand_WIDTH_ZOOM read _GetMUL_6;
    {class} property MUL_7: JEscCommand_WIDTH_ZOOM read _GetMUL_7;
    {class} property MUL_8: JEscCommand_WIDTH_ZOOM read _GetMUL_8;
  end;

  [JavaSignature('com/gprinter/command/EscCommand$WIDTH_ZOOM')]
  JEscCommand_WIDTH_ZOOM = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{067C7EA5-182F-4FBE-A784-F2B0977E7190}']
    { Property Methods }

    { methods }
    function getValue: Byte; cdecl; //()B

    { Property }
  end;

  TJEscCommand_WIDTH_ZOOM = class(TJavaGenericImport<JEscCommand_WIDTH_ZOOMClass, JEscCommand_WIDTH_ZOOM>) end;

  JEscCommandClass = interface(JObjectClass)
  ['{59D47112-1C84-430E-8025-7EE5A43D3941}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEscCommand; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/command/EscCommand')]
  JEscCommand = interface(JObject)
  ['{93398CF5-603D-479B-8AFA-0CFE5764FBF3}']
    { Property Methods }

    { methods }
    procedure addHorTab; cdecl; //()V
    procedure addText(text: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure addText(text: JString; charsetName: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    procedure addArabicText(text: JString); cdecl; //(Ljava/lang/String;)V
    procedure addPrintAndLineFeed; cdecl; //()V
    procedure RealtimeStatusTransmission(status: JEscCommand_STATUS); cdecl; //(Lcom/gprinter/command/EscCommand$STATUS;)V
    procedure addGeneratePluseAtRealtime(foot: JLabelCommand_FOOT; P2: Byte); cdecl; //(Lcom/gprinter/command/LabelCommand$FOOT;B)V
    procedure addSound(n: Byte; t: Byte); cdecl; //(BB)V
    procedure addSetRightSideCharacterSpacing(n: Byte); cdecl; //(B)V
//    function getCommand: JVector; cdecl; //()Ljava/util/Vector;
    procedure addSelectPrintModes(font: JEscCommand_FONT; emphasized: JEscCommand_ENABLE; doubleheight: JEscCommand_ENABLE; doublewidth: JEscCommand_ENABLE; underline: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$FONT;Lcom/gprinter/command/EscCommand$ENABLE;Lcom/gprinter/command/EscCommand$ENABLE;Lcom/gprinter/command/EscCommand$ENABLE;Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSetAbsolutePrintPosition(n: Word); cdecl; //(S)V
    procedure addSelectOrCancelUserDefineCharacter(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addTurnUnderlineModeOnOrOff(underline: JEscCommand_UNDERLINE_MODE); cdecl; //(Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;)V
    procedure addSelectDefualtLineSpacing; cdecl; //()V
    procedure addSetLineSpacing(n: Byte); cdecl; //(B)V
    procedure addCancelUserDefinedCharacters(n: Byte); cdecl; //(B)V
    procedure addInitializePrinter; cdecl; //()V
    procedure addTurnEmphasizedModeOnOrOff(enabel: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addTurnDoubleStrikeOnOrOff(enabel: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addPrintAndFeedPaper(n: Byte); cdecl; //(B)V
    procedure addSelectCharacterFont(font: JEscCommand_FONT); cdecl; //(Lcom/gprinter/command/EscCommand$FONT;)V
    procedure addSelectInternationalCharacterSet(aset: JEscCommand_CHARACTER_SET); cdecl; //(Lcom/gprinter/command/EscCommand$CHARACTER_SET;)V
    procedure addTurn90ClockWiseRotatin(enabel: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSetRelativePrintPositon(n: Word); cdecl; //(S)V
    procedure addSelectJustification(just: JEscCommand_JUSTIFICATION); cdecl; //(Lcom/gprinter/command/EscCommand$JUSTIFICATION;)V
    procedure addPrintAndFeedLines(n: Byte); cdecl; //(B)V
    procedure addGeneratePlus(foot: JLabelCommand_FOOT; t1: Byte; t2: Byte); cdecl; //(Lcom/gprinter/command/LabelCommand$FOOT;BB)V
    procedure addSelectCodePage(page: JEscCommand_CODEPAGE); cdecl; //(Lcom/gprinter/command/EscCommand$CODEPAGE;)V
    procedure addTurnUpsideDownModeOnOrOff(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSetCharcterSize(width: JEscCommand_WIDTH_ZOOM; height: JEscCommand_HEIGHT_ZOOM); cdecl; //(Lcom/gprinter/command/EscCommand$WIDTH_ZOOM;Lcom/gprinter/command/EscCommand$HEIGHT_ZOOM;)V
    procedure addTurnReverseModeOnOrOff(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSelectPrintingPositionForHRICharacters(position: JEscCommand_HRI_POSITION); cdecl; //(Lcom/gprinter/command/EscCommand$HRI_POSITION;)V
    procedure addSetLeftMargin(n: Word); cdecl; //(S)V
    procedure addSetHorAndVerMotionUnits(x: Byte; y: Byte); cdecl; //(BB)V
    procedure addCutAndFeedPaper(length: Byte); cdecl; //(B)V
    procedure addCutPaper; cdecl; //()V
    procedure addSetPrintingAreaWidth(width: Word); cdecl; //(S)V
    procedure addSetAutoSatusBack(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSetFontForHRICharacter(font: JEscCommand_FONT); cdecl; //(Lcom/gprinter/command/EscCommand$FONT;)V
    procedure addSetBarcodeHeight(height: Byte); cdecl; //(B)V
    procedure addSetBarcodeWidth(width: Byte); cdecl; //(B)V
    procedure addSetKanjiFontMode(DoubleWidth: JEscCommand_ENABLE; DoubleHeight: JEscCommand_ENABLE; Underline: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;Lcom/gprinter/command/EscCommand$ENABLE;Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addSelectKanjiMode; cdecl; //()V
    procedure addSetKanjiUnderLine(underline: JEscCommand_UNDERLINE_MODE); cdecl; //(Lcom/gprinter/command/EscCommand$UNDERLINE_MODE;)V
    procedure addCancelKanjiMode; cdecl; //()V
    procedure addSetKanjiLefttandRightSpace(left: Byte; right: Byte); cdecl; //(BB)V
    procedure addSetQuadrupleModeForKanji(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addRastBitImage(bitmap: JBitmap; nWidth: Integer; nMode: Integer); cdecl; //(Landroid/graphics/Bitmap;II)V
    procedure drawImage(bitmap: JBitmap); cdecl; overload; //(Landroid/graphics/Bitmap;)V
    procedure drawImage(img: JBitmap; nWidth: Integer); cdecl; overload; //(Landroid/graphics/Bitmap;I)V
    procedure drawJpgImage(img: JBitmap; nWidth: Integer); cdecl; //(Landroid/graphics/Bitmap;I)V
    procedure addOriginRastBitImage(bitmap: JBitmap; nWidth: Integer; nMode: Integer); cdecl; //(Landroid/graphics/Bitmap;II)V
    procedure addRastBitImageWithMethod(bitmap: JBitmap; nWidth: Integer; nMode: Integer; method: Integer); cdecl; //(Landroid/graphics/Bitmap;III)V
    procedure addDownloadNvBitImage(bitmap: TJavaObjectArray<JBitmap>); cdecl; //([Landroid/graphics/Bitmap;)V
    procedure addPrintNvBitmap(n: Byte; mode: Byte); cdecl; //(BB)V
    procedure addUPCA(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addUPCE(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addEAN13(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addEAN8(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addCODE39(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addITF(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addCODABAR(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addCODE93(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addCODE128(content: JString); cdecl; //(Ljava/lang/String;)V
    function genCodeC(content: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function genCodeB(content: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function genCode128(content: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    procedure addSelectSizeOfModuleForQRCode(n: Byte); cdecl; //(B)V
    procedure addSelectErrorCorrectionLevelForQRCode(n: Byte); cdecl; //(B)V
    procedure addStoreQRCodeData(content: JString); cdecl; //(Ljava/lang/String;)V
    procedure addPrintQRCode; cdecl; //()V
    procedure addQueryPrinterStatus; cdecl; //()V
    procedure addUserCommand(command: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure addUserCommand(command: JString); cdecl; overload; //(Ljava/lang/String;)V

    { Property }
  end;

  TJEscCommand = class(TJavaGenericImport<JEscCommandClass, JEscCommand>) end;

  JGsCommandClass = interface(JObjectClass)
  ['{F4B6C129-5A73-4792-B092-66BDC6772E89}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGsCommand; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/command/GsCommand')]
  JGsCommand = interface(JObject)
  ['{D891AFFD-EE92-4FF6-BA9D-C2F9DC373500}']
    { Property Methods }

    { methods }
    procedure clrCommand; cdecl; //()V
    procedure addClrAndCursorReset; cdecl; //()V
    procedure addClr; cdecl; //()V
    procedure addOpenBackLight; cdecl; //()V
    procedure addCloseBackLight; cdecl; //()V
    procedure addOpenCursor; cdecl; //()V
    procedure addCloseCursor; cdecl; //()V
    procedure addCloseBackLightTime(L: Integer; H: Integer); cdecl; //(II)V
    procedure addCursorLoca(x: Integer; y: Integer); cdecl; //(II)V
    procedure addBitmap(bitmap: JBitmap; nWidth: Integer); cdecl; //(Landroid/graphics/Bitmap;I)V
    procedure addContrast(n: Integer); cdecl; //(I)V
    procedure addBrightness(n: Integer); cdecl; //(I)V
    procedure addTextAndCursorReset(str: JString); cdecl; //(Ljava/lang/String;)V
    procedure addText(str: JString); cdecl; //(Ljava/lang/String;)V
    procedure addOpenAutoIndentation(n: Integer); cdecl; //(I)V
    procedure addObtainAutoCloseBackLightTime; cdecl; //()V
    procedure addObtainBackLightState; cdecl; //()V
    procedure addObtainCursorLoca; cdecl; //()V
    procedure addObtainLineAndColumn; cdecl; //()V

    { Property }
  end;

  TJGsCommand = class(TJavaGenericImport<JGsCommandClass, JGsCommand>) end;

  JLabelCommand_BARCODETYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{001F8B9B-178D-4510-A032-F673C7F57925}']
    { static Property Methods }
    {class} function _GetCODE128: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODE128M: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN128: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetITF25: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetITF25C: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODE39: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODE39C: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODE39S: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODE93: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN13: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN13_2: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN13_5: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN8: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN8_2: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN8_5: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCODABAR: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetPOST: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCA: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCA_2: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCA_5: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCE: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCE_2: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetUPCE_5: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetCPOST: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetMSI: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetMSIC: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetPLESSEY: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetITF14: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function _GetEAN14: JLabelCommand_BARCODETYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BARCODETYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_BARCODETYPE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$BARCODETYPE;
    {class} function valueOf(name: JString): JLabelCommand_BARCODETYPE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$BARCODETYPE;

    { static Property }
    {class} property CODE128: JLabelCommand_BARCODETYPE read _GetCODE128;
    {class} property CODE128M: JLabelCommand_BARCODETYPE read _GetCODE128M;
    {class} property EAN128: JLabelCommand_BARCODETYPE read _GetEAN128;
    {class} property ITF25: JLabelCommand_BARCODETYPE read _GetITF25;
    {class} property ITF25C: JLabelCommand_BARCODETYPE read _GetITF25C;
    {class} property CODE39: JLabelCommand_BARCODETYPE read _GetCODE39;
    {class} property CODE39C: JLabelCommand_BARCODETYPE read _GetCODE39C;
    {class} property CODE39S: JLabelCommand_BARCODETYPE read _GetCODE39S;
    {class} property CODE93: JLabelCommand_BARCODETYPE read _GetCODE93;
    {class} property EAN13: JLabelCommand_BARCODETYPE read _GetEAN13;
    {class} property EAN13_2: JLabelCommand_BARCODETYPE read _GetEAN13_2;
    {class} property EAN13_5: JLabelCommand_BARCODETYPE read _GetEAN13_5;
    {class} property EAN8: JLabelCommand_BARCODETYPE read _GetEAN8;
    {class} property EAN8_2: JLabelCommand_BARCODETYPE read _GetEAN8_2;
    {class} property EAN8_5: JLabelCommand_BARCODETYPE read _GetEAN8_5;
    {class} property CODABAR: JLabelCommand_BARCODETYPE read _GetCODABAR;
    {class} property POST: JLabelCommand_BARCODETYPE read _GetPOST;
    {class} property UPCA: JLabelCommand_BARCODETYPE read _GetUPCA;
    {class} property UPCA_2: JLabelCommand_BARCODETYPE read _GetUPCA_2;
    {class} property UPCA_5: JLabelCommand_BARCODETYPE read _GetUPCA_5;
    {class} property UPCE: JLabelCommand_BARCODETYPE read _GetUPCE;
    {class} property UPCE_2: JLabelCommand_BARCODETYPE read _GetUPCE_2;
    {class} property UPCE_5: JLabelCommand_BARCODETYPE read _GetUPCE_5;
    {class} property CPOST: JLabelCommand_BARCODETYPE read _GetCPOST;
    {class} property MSI: JLabelCommand_BARCODETYPE read _GetMSI;
    {class} property MSIC: JLabelCommand_BARCODETYPE read _GetMSIC;
    {class} property PLESSEY: JLabelCommand_BARCODETYPE read _GetPLESSEY;
    {class} property ITF14: JLabelCommand_BARCODETYPE read _GetITF14;
    {class} property EAN14: JLabelCommand_BARCODETYPE read _GetEAN14;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$BARCODETYPE')]
  JLabelCommand_BARCODETYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{D5F0D0DA-C2C0-493B-8A8E-36A7269BF088}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_BARCODETYPE = class(TJavaGenericImport<JLabelCommand_BARCODETYPEClass, JLabelCommand_BARCODETYPE>) end;

  JLabelCommand_BITMAP_MODEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{2454BDE0-D115-4D36-B7A7-9EDA4F7291C9}']
    { static Property Methods }
    {class} function _GetOVERWRITE: JLabelCommand_BITMAP_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BITMAP_MODE;
    {class} function _GetOR: JLabelCommand_BITMAP_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BITMAP_MODE;
    {class} function _GetXOR: JLabelCommand_BITMAP_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$BITMAP_MODE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_BITMAP_MODE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$BITMAP_MODE;
    {class} function valueOf(name: JString): JLabelCommand_BITMAP_MODE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$BITMAP_MODE;

    { static Property }
    {class} property OVERWRITE: JLabelCommand_BITMAP_MODE read _GetOVERWRITE;
    {class} property &OR: JLabelCommand_BITMAP_MODE read _GetOR;
    {class} property &XOR: JLabelCommand_BITMAP_MODE read _GetXOR;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$BITMAP_MODE')]
  JLabelCommand_BITMAP_MODE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{8554C8B0-7C1F-48BA-AFC9-781D7F68169C}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_BITMAP_MODE = class(TJavaGenericImport<JLabelCommand_BITMAP_MODEClass, JLabelCommand_BITMAP_MODE>) end;

  JLabelCommand_CODEPAGEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{A653D7F2-82EE-43AE-B3E6-8E29937F6F46}']
    { static Property Methods }
    {class} function _GetPC437: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetPC850: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetPC852: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetPC860: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetPC863: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetPC865: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetWPC1250: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetWPC1252: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetWPC1253: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function _GetWPC1254: JLabelCommand_CODEPAGE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$CODEPAGE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_CODEPAGE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$CODEPAGE;
    {class} function valueOf(name: JString): JLabelCommand_CODEPAGE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$CODEPAGE;

    { static Property }
    {class} property PC437: JLabelCommand_CODEPAGE read _GetPC437;
    {class} property PC850: JLabelCommand_CODEPAGE read _GetPC850;
    {class} property PC852: JLabelCommand_CODEPAGE read _GetPC852;
    {class} property PC860: JLabelCommand_CODEPAGE read _GetPC860;
    {class} property PC863: JLabelCommand_CODEPAGE read _GetPC863;
    {class} property PC865: JLabelCommand_CODEPAGE read _GetPC865;
    {class} property WPC1250: JLabelCommand_CODEPAGE read _GetWPC1250;
    {class} property WPC1252: JLabelCommand_CODEPAGE read _GetWPC1252;
    {class} property WPC1253: JLabelCommand_CODEPAGE read _GetWPC1253;
    {class} property WPC1254: JLabelCommand_CODEPAGE read _GetWPC1254;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$CODEPAGE')]
  JLabelCommand_CODEPAGE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{524A6521-563E-462B-99AF-AF74423546D3}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_CODEPAGE = class(TJavaGenericImport<JLabelCommand_CODEPAGEClass, JLabelCommand_CODEPAGE>) end;

  JLabelCommand_DENSITYClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{327780EA-3483-4B81-8745-6BB6C2F62D7F}']
    { static Property Methods }
    {class} function _GetDNESITY0: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY1: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY2: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY3: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY4: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY5: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY6: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY7: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY8: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY9: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY10: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY11: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY12: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY13: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY14: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function _GetDNESITY15: JLabelCommand_DENSITY;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DENSITY;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_DENSITY>; cdecl; //()[Lcom/gprinter/command/LabelCommand$DENSITY;
    {class} function valueOf(name: JString): JLabelCommand_DENSITY; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$DENSITY;

    { static Property }
    {class} property DNESITY0: JLabelCommand_DENSITY read _GetDNESITY0;
    {class} property DNESITY1: JLabelCommand_DENSITY read _GetDNESITY1;
    {class} property DNESITY2: JLabelCommand_DENSITY read _GetDNESITY2;
    {class} property DNESITY3: JLabelCommand_DENSITY read _GetDNESITY3;
    {class} property DNESITY4: JLabelCommand_DENSITY read _GetDNESITY4;
    {class} property DNESITY5: JLabelCommand_DENSITY read _GetDNESITY5;
    {class} property DNESITY6: JLabelCommand_DENSITY read _GetDNESITY6;
    {class} property DNESITY7: JLabelCommand_DENSITY read _GetDNESITY7;
    {class} property DNESITY8: JLabelCommand_DENSITY read _GetDNESITY8;
    {class} property DNESITY9: JLabelCommand_DENSITY read _GetDNESITY9;
    {class} property DNESITY10: JLabelCommand_DENSITY read _GetDNESITY10;
    {class} property DNESITY11: JLabelCommand_DENSITY read _GetDNESITY11;
    {class} property DNESITY12: JLabelCommand_DENSITY read _GetDNESITY12;
    {class} property DNESITY13: JLabelCommand_DENSITY read _GetDNESITY13;
    {class} property DNESITY14: JLabelCommand_DENSITY read _GetDNESITY14;
    {class} property DNESITY15: JLabelCommand_DENSITY read _GetDNESITY15;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$DENSITY')]
  JLabelCommand_DENSITY = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{78E98449-DFA3-4D1E-AC72-F42E544AE7BA}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_DENSITY = class(TJavaGenericImport<JLabelCommand_DENSITYClass, JLabelCommand_DENSITY>) end;

  JLabelCommand_DIRECTIONClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{15B0FDC8-ADA2-4748-93F4-FF5337C7680D}']
    { static Property Methods }
    {class} function _GetFORWARD: JLabelCommand_DIRECTION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DIRECTION;
    {class} function _GetBACKWARD: JLabelCommand_DIRECTION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$DIRECTION;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_DIRECTION>; cdecl; //()[Lcom/gprinter/command/LabelCommand$DIRECTION;
    {class} function valueOf(name: JString): JLabelCommand_DIRECTION; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$DIRECTION;

    { static Property }
    {class} property &FORWARD: JLabelCommand_DIRECTION read _GetFORWARD;
    {class} property BACKWARD: JLabelCommand_DIRECTION read _GetBACKWARD;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$DIRECTION')]
  JLabelCommand_DIRECTION = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{A4B78218-C8CA-4F63-8318-3B53DC0682EF}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_DIRECTION = class(TJavaGenericImport<JLabelCommand_DIRECTIONClass, JLabelCommand_DIRECTION>) end;

  JLabelCommand_EECClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{F7ED809C-256C-4956-BFF0-8625BECACBF2}']
    { static Property Methods }
    {class} function _GetLEVEL_L: JLabelCommand_EEC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$EEC;
    {class} function _GetLEVEL_M: JLabelCommand_EEC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$EEC;
    {class} function _GetLEVEL_Q: JLabelCommand_EEC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$EEC;
    {class} function _GetLEVEL_H: JLabelCommand_EEC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$EEC;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_EEC>; cdecl; //()[Lcom/gprinter/command/LabelCommand$EEC;
    {class} function valueOf(name: JString): JLabelCommand_EEC; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$EEC;

    { static Property }
    {class} property LEVEL_L: JLabelCommand_EEC read _GetLEVEL_L;
    {class} property LEVEL_M: JLabelCommand_EEC read _GetLEVEL_M;
    {class} property LEVEL_Q: JLabelCommand_EEC read _GetLEVEL_Q;
    {class} property LEVEL_H: JLabelCommand_EEC read _GetLEVEL_H;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$EEC')]
  JLabelCommand_EEC = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{6DA8A544-E762-4644-9AE8-31E6E784CF3C}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_EEC = class(TJavaGenericImport<JLabelCommand_EECClass, JLabelCommand_EEC>) end;

  JLabelCommand_ENABLEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{496AFC60-7594-43CE-8F5C-93CCD1354A00}']
    { static Property Methods }
    {class} function _GetON: JLabelCommand_ENABLE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ENABLE;
    {class} function _GetOFF: JLabelCommand_ENABLE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ENABLE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_ENABLE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$ENABLE;
    {class} function valueOf(name: JString): JLabelCommand_ENABLE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$ENABLE;

    { static Property }
    {class} property ON: JLabelCommand_ENABLE read _GetON;
    {class} property OFF: JLabelCommand_ENABLE read _GetOFF;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$ENABLE')]
  JLabelCommand_ENABLE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3522218C-4453-4E39-BC1B-83B0BCBED5A6}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_ENABLE = class(TJavaGenericImport<JLabelCommand_ENABLEClass, JLabelCommand_ENABLE>) end;

  JLabelCommand_FONTMULClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{A97000DC-0BB1-416E-AC35-0261C6237D88}']
    { static Property Methods }
    {class} function _GetMUL_1: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_2: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_3: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_4: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_5: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_6: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_7: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_8: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_9: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function _GetMUL_10: JLabelCommand_FONTMUL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTMUL;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_FONTMUL>; cdecl; //()[Lcom/gprinter/command/LabelCommand$FONTMUL;
    {class} function valueOf(name: JString): JLabelCommand_FONTMUL; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$FONTMUL;

    { static Property }
    {class} property MUL_1: JLabelCommand_FONTMUL read _GetMUL_1;
    {class} property MUL_2: JLabelCommand_FONTMUL read _GetMUL_2;
    {class} property MUL_3: JLabelCommand_FONTMUL read _GetMUL_3;
    {class} property MUL_4: JLabelCommand_FONTMUL read _GetMUL_4;
    {class} property MUL_5: JLabelCommand_FONTMUL read _GetMUL_5;
    {class} property MUL_6: JLabelCommand_FONTMUL read _GetMUL_6;
    {class} property MUL_7: JLabelCommand_FONTMUL read _GetMUL_7;
    {class} property MUL_8: JLabelCommand_FONTMUL read _GetMUL_8;
    {class} property MUL_9: JLabelCommand_FONTMUL read _GetMUL_9;
    {class} property MUL_10: JLabelCommand_FONTMUL read _GetMUL_10;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$FONTMUL')]
  JLabelCommand_FONTMUL = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{DC0E534F-FC12-4A43-8D95-8AD039E32183}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_FONTMUL = class(TJavaGenericImport<JLabelCommand_FONTMULClass, JLabelCommand_FONTMUL>) end;

  JLabelCommand_FONTTYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{C92B0837-C259-4044-A6A5-8DCBE31671A8}']
    { static Property Methods }
    {class} function _GetFONT_0: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetBold: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetSongTi: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetThai: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_1: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_2: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_3: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_4: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_5: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_6: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_7: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_8: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_9: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetFONT_10: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetSIMPLIFIED_16_CHINESE: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetSIMPLIFIED_20_CHINESE: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetSIMPLIFIED_24_CHINESE: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetSIMPLIFIED__32_CHINESE: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetTRADITIONAL_CHINESE: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function _GetKOREAN: JLabelCommand_FONTTYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FONTTYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_FONTTYPE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$FONTTYPE;
    {class} function valueOf(name: JString): JLabelCommand_FONTTYPE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$FONTTYPE;

    { static Property }
    {class} property FONT_0: JLabelCommand_FONTTYPE read _GetFONT_0;
    {class} property Bold: JLabelCommand_FONTTYPE read _GetBold;
    {class} property SongTi: JLabelCommand_FONTTYPE read _GetSongTi;
    {class} property Thai: JLabelCommand_FONTTYPE read _GetThai;
    {class} property FONT_1: JLabelCommand_FONTTYPE read _GetFONT_1;
    {class} property FONT_2: JLabelCommand_FONTTYPE read _GetFONT_2;
    {class} property FONT_3: JLabelCommand_FONTTYPE read _GetFONT_3;
    {class} property FONT_4: JLabelCommand_FONTTYPE read _GetFONT_4;
    {class} property FONT_5: JLabelCommand_FONTTYPE read _GetFONT_5;
    {class} property FONT_6: JLabelCommand_FONTTYPE read _GetFONT_6;
    {class} property FONT_7: JLabelCommand_FONTTYPE read _GetFONT_7;
    {class} property FONT_8: JLabelCommand_FONTTYPE read _GetFONT_8;
    {class} property FONT_9: JLabelCommand_FONTTYPE read _GetFONT_9;
    {class} property FONT_10: JLabelCommand_FONTTYPE read _GetFONT_10;
    {class} property SIMPLIFIED_16_CHINESE: JLabelCommand_FONTTYPE read _GetSIMPLIFIED_16_CHINESE;
    {class} property SIMPLIFIED_20_CHINESE: JLabelCommand_FONTTYPE read _GetSIMPLIFIED_20_CHINESE;
    {class} property SIMPLIFIED_24_CHINESE: JLabelCommand_FONTTYPE read _GetSIMPLIFIED_24_CHINESE;
    {class} property SIMPLIFIED__32_CHINESE: JLabelCommand_FONTTYPE read _GetSIMPLIFIED__32_CHINESE;
    {class} property TRADITIONAL_CHINESE: JLabelCommand_FONTTYPE read _GetTRADITIONAL_CHINESE;
    {class} property KOREAN: JLabelCommand_FONTTYPE read _GetKOREAN;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$FONTTYPE')]
  JLabelCommand_FONTTYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{411C7AE0-9E3A-4481-A73C-95E2A9BC0CEA}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_FONTTYPE = class(TJavaGenericImport<JLabelCommand_FONTTYPEClass, JLabelCommand_FONTTYPE>) end;

  JLabelCommand_FOOTClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{67904AB3-3C7E-4DE1-94D5-571B82C3A743}']
    { static Property Methods }
    {class} function _GetF2: JLabelCommand_FOOT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FOOT;
    {class} function _GetF5: JLabelCommand_FOOT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$FOOT;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_FOOT>; cdecl; //()[Lcom/gprinter/command/LabelCommand$FOOT;
    {class} function valueOf(name: JString): JLabelCommand_FOOT; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$FOOT;

    { static Property }
    {class} property F2: JLabelCommand_FOOT read _GetF2;
    {class} property F5: JLabelCommand_FOOT read _GetF5;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$FOOT')]
  JLabelCommand_FOOT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3BD7D206-134F-4718-B848-68B715588906}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_FOOT = class(TJavaGenericImport<JLabelCommand_FOOTClass, JLabelCommand_FOOT>) end;

  JLabelCommand_MIRRORClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{91E77640-01C6-4000-9220-B08C9989E170}']
    { static Property Methods }
    {class} function _GetNORMAL: JLabelCommand_MIRROR;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$MIRROR;
    {class} function _GetMIRROR: JLabelCommand_MIRROR;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$MIRROR;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_MIRROR>; cdecl; //()[Lcom/gprinter/command/LabelCommand$MIRROR;
    {class} function valueOf(name: JString): JLabelCommand_MIRROR; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$MIRROR;

    { static Property }
    {class} property NORMAL: JLabelCommand_MIRROR read _GetNORMAL;
    {class} property MIRROR: JLabelCommand_MIRROR read _GetMIRROR;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$MIRROR')]
  JLabelCommand_MIRROR = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2A43FCBB-A2EF-44D1-B595-C0DB85582005}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_MIRROR = class(TJavaGenericImport<JLabelCommand_MIRRORClass, JLabelCommand_MIRROR>) end;

  JLabelCommand_READABELClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{3890D530-EB3D-4085-9982-3A10A951ED90}']
    { static Property Methods }
    {class} function _GetDISABLE: JLabelCommand_READABEL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$READABEL;
    {class} function _GetEANBEL: JLabelCommand_READABEL;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$READABEL;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_READABEL>; cdecl; //()[Lcom/gprinter/command/LabelCommand$READABEL;
    {class} function valueOf(name: JString): JLabelCommand_READABEL; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$READABEL;

    { static Property }
    {class} property DISABLE: JLabelCommand_READABEL read _GetDISABLE;
    {class} property EANBEL: JLabelCommand_READABEL read _GetEANBEL;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$READABEL')]
  JLabelCommand_READABEL = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{DCD51074-D437-4AAC-A969-3479CD61C415}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_READABEL = class(TJavaGenericImport<JLabelCommand_READABELClass, JLabelCommand_READABEL>) end;

  JLabelCommand_RESPONSE_MODEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{D87F0B36-6FEF-497E-A417-1E718088FB2B}']
    { static Property Methods }
    {class} function _GetON: JLabelCommand_RESPONSE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;
    {class} function _GetOFF: JLabelCommand_RESPONSE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;
    {class} function _GetBATCH: JLabelCommand_RESPONSE_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_RESPONSE_MODE>; cdecl; //()[Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;
    {class} function valueOf(name: JString): JLabelCommand_RESPONSE_MODE; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;

    { static Property }
    {class} property ON: JLabelCommand_RESPONSE_MODE read _GetON;
    {class} property OFF: JLabelCommand_RESPONSE_MODE read _GetOFF;
    {class} property BATCH: JLabelCommand_RESPONSE_MODE read _GetBATCH;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$RESPONSE_MODE')]
  JLabelCommand_RESPONSE_MODE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{5DEF1B55-219B-4332-B6A2-D89B89170C1D}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_RESPONSE_MODE = class(TJavaGenericImport<JLabelCommand_RESPONSE_MODEClass, JLabelCommand_RESPONSE_MODE>) end;

  JLabelCommand_ROTATIONClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{6F3356FE-48B9-460C-8EA3-C9BF5FB24D73}']
    { static Property Methods }
    {class} function _GetROTATION_0: JLabelCommand_ROTATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ROTATION;
    {class} function _GetROTATION_90: JLabelCommand_ROTATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ROTATION;
    {class} function _GetROTATION_180: JLabelCommand_ROTATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ROTATION;
    {class} function _GetROTATION_270: JLabelCommand_ROTATION;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$ROTATION;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_ROTATION>; cdecl; //()[Lcom/gprinter/command/LabelCommand$ROTATION;
    {class} function valueOf(name: JString): JLabelCommand_ROTATION; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$ROTATION;

    { static Property }
    {class} property ROTATION_0: JLabelCommand_ROTATION read _GetROTATION_0;
    {class} property ROTATION_90: JLabelCommand_ROTATION read _GetROTATION_90;
    {class} property ROTATION_180: JLabelCommand_ROTATION read _GetROTATION_180;
    {class} property ROTATION_270: JLabelCommand_ROTATION read _GetROTATION_270;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$ROTATION')]
  JLabelCommand_ROTATION = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9D7166F0-8114-42A8-9751-FDEA39F73762}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJLabelCommand_ROTATION = class(TJavaGenericImport<JLabelCommand_ROTATIONClass, JLabelCommand_ROTATION>) end;

  JLabelCommand_ShapeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{27900AC8-012F-42D2-9BFF-9E52C5C0E65E}']
    { static Property Methods }
    {class} function _GetSquare: JLabelCommand_Shape;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$Shape;
    {class} function _GetRectangle: JLabelCommand_Shape;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$Shape;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_Shape>; cdecl; //()[Lcom/gprinter/command/LabelCommand$Shape;
    {class} function valueOf(name: JString): JLabelCommand_Shape; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$Shape;

    { static Property }
    {class} property Square: JLabelCommand_Shape read _GetSquare;
    {class} property Rectangle: JLabelCommand_Shape read _GetRectangle;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$Shape')]
  JLabelCommand_Shape = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{80F08B85-C5EC-4D84-A093-6C9EC39FF7AA}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLabelCommand_Shape = class(TJavaGenericImport<JLabelCommand_ShapeClass, JLabelCommand_Shape>) end;

  JLabelCommand_SPEEDClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{37207A67-23A5-4272-A3ED-20B5FB88E5D9}']
    { static Property Methods }
    {class} function _GetSPEED1DIV5: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED2: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED3: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED4: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED5: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED6: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED7: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED8: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED9: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED10: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED11: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function _GetSPEED12: JLabelCommand_SPEED;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/LabelCommand$SPEED;

    { static Methods }
    {class} function values: TJavaObjectArray<JLabelCommand_SPEED>; cdecl; //()[Lcom/gprinter/command/LabelCommand$SPEED;
    {class} function valueOf(name: JString): JLabelCommand_SPEED; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/LabelCommand$SPEED;

    { static Property }
    {class} property SPEED1DIV5: JLabelCommand_SPEED read _GetSPEED1DIV5;
    {class} property SPEED2: JLabelCommand_SPEED read _GetSPEED2;
    {class} property SPEED3: JLabelCommand_SPEED read _GetSPEED3;
    {class} property SPEED4: JLabelCommand_SPEED read _GetSPEED4;
    {class} property SPEED5: JLabelCommand_SPEED read _GetSPEED5;
    {class} property SPEED6: JLabelCommand_SPEED read _GetSPEED6;
    {class} property SPEED7: JLabelCommand_SPEED read _GetSPEED7;
    {class} property SPEED8: JLabelCommand_SPEED read _GetSPEED8;
    {class} property SPEED9: JLabelCommand_SPEED read _GetSPEED9;
    {class} property SPEED10: JLabelCommand_SPEED read _GetSPEED10;
    {class} property SPEED11: JLabelCommand_SPEED read _GetSPEED11;
    {class} property SPEED12: JLabelCommand_SPEED read _GetSPEED12;
  end;

  [JavaSignature('com/gprinter/command/LabelCommand$SPEED')]
  JLabelCommand_SPEED = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3310A0B9-F231-48F4-B578-F1F7F323A802}']
    { Property Methods }

    { methods }
    function getValue: Single; cdecl; //()F

    { Property }
  end;

  TJLabelCommand_SPEED = class(TJavaGenericImport<JLabelCommand_SPEEDClass, JLabelCommand_SPEED>) end;

  JVectorClass = interface(JObjectClass)
    ['{0C4348D1-5F9D-4C86-BF34-34EB1772D18E}']
  end;

  [JavaSignature('java/util/Vector')]
  JVector = interface(JObject)
  ['{3B33BF64-46A3-46E1-8CDC-51871E566613}']
  end;
  TJVector = class(TJavaGenericImport<JVectorClass, JVector>) end;


  JLabelCommandClass = interface(JObjectClass)
  ['{2420C376-9DD9-45EB-BB98-EE24F42F2988}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLabelCommand; cdecl; overload; //()V
    {class} function init(width: Integer; height: Integer; gap: Integer): JLabelCommand; cdecl; overload; //(III)V
    {class} function convertToBlackWhite(bmp: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;
    {class} function toPrintData(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B

    { static Property }
  end;

  [JavaSignature('com/gprinter/command/LabelCommand')]
  JLabelCommand = interface(JObject)
  ['{F794ADA1-80E8-4A35-9F7D-A5951C11710C}']
    { Property Methods }

    { methods }
    procedure clrCommand; cdecl; //()V
    procedure addGap(gap: Integer); cdecl; //(I)V
    procedure addBline(bline: Integer); cdecl; //(I)V
    procedure addSize(width: Integer; height: Integer); cdecl; //(II)V
    procedure addCashdrwer(m: JLabelCommand_FOOT; t1: Integer; t2: Integer); cdecl; //(Lcom/gprinter/command/LabelCommand$FOOT;II)V
    procedure addOffset(offset: Integer); cdecl; //(I)V
    procedure addSpeed(speed: JLabelCommand_SPEED); cdecl; //(Lcom/gprinter/command/LabelCommand$SPEED;)V
    procedure addDensity(density: JLabelCommand_DENSITY); cdecl; //(Lcom/gprinter/command/LabelCommand$DENSITY;)V
    procedure addDirection(direction: JLabelCommand_DIRECTION; mirror: JLabelCommand_MIRROR); cdecl; //(Lcom/gprinter/command/LabelCommand$DIRECTION;Lcom/gprinter/command/LabelCommand$MIRROR;)V
    procedure addReference(x: Integer; y: Integer); cdecl; //(II)V
    procedure addShift(shift: Integer); cdecl; //(I)V
    procedure addCls; cdecl; //()V
    procedure addFeed(dot: Integer); cdecl; //(I)V
    procedure addBackFeed(dot: Integer); cdecl; //(I)V
    procedure addFormFeed; cdecl; //()V
    procedure addHome; cdecl; //()V
    procedure addPrint(m: Integer; n: Integer); cdecl; overload; //(II)V
    procedure addPrint(m: Integer); cdecl; overload; //(I)V
    procedure addCodePage(page: JLabelCommand_CODEPAGE); cdecl; //(Lcom/gprinter/command/LabelCommand$CODEPAGE;)V
    procedure addSound(level: Integer; interval: Integer); cdecl; //(II)V
    procedure addLimitFeed(n: Integer); cdecl; //(I)V
    procedure addSelfTest; cdecl; //()V
    procedure addBar(x: Integer; y: Integer; width: Integer; height: Integer); cdecl; //(IIII)V
    procedure addText(x: Integer; y: Integer; font: JLabelCommand_FONTTYPE; rotation: JLabelCommand_ROTATION; Xscal: JLabelCommand_FONTMUL; Yscal: JLabelCommand_FONTMUL; text: JString); cdecl; //(IILcom/gprinter/command/LabelCommand$FONTTYPE;Lcom/gprinter/command/LabelCommand$ROTATION;Lcom/gprinter/command/LabelCommand$FONTMUL;Lcom/gprinter/command/LabelCommand$FONTMUL;Ljava/lang/String;)V
    procedure addUnicodeText(x: Integer; y: Integer; font: JLabelCommand_FONTTYPE; rotation: JLabelCommand_ROTATION; Xscal: JLabelCommand_FONTMUL; Yscal: JLabelCommand_FONTMUL; text: JString; textType: JString); cdecl; //(IILcom/gprinter/command/LabelCommand$FONTTYPE;Lcom/gprinter/command/LabelCommand$ROTATION;Lcom/gprinter/command/LabelCommand$FONTMUL;Lcom/gprinter/command/LabelCommand$FONTMUL;Ljava/lang/String;Ljava/lang/String;)V
    procedure addBlock(x: Integer; y: Integer; width: Integer; height: Integer; font: JLabelCommand_FONTTYPE; rotation: JLabelCommand_ROTATION; Xscal: JLabelCommand_FONTMUL; Yscal: JLabelCommand_FONTMUL; text: JString); cdecl; overload; //(IIIILcom/gprinter/command/LabelCommand$FONTTYPE;Lcom/gprinter/command/LabelCommand$ROTATION;Lcom/gprinter/command/LabelCommand$FONTMUL;Lcom/gprinter/command/LabelCommand$FONTMUL;Ljava/lang/String;)V
    procedure addBlock(x: Integer; y: Integer; width: Integer; height: Integer; font: JLabelCommand_FONTTYPE; rotation: JLabelCommand_ROTATION; Xscal: JLabelCommand_FONTMUL; Yscal: JLabelCommand_FONTMUL; space: Integer; align: Integer; text: JString); cdecl; overload; //(IIIILcom/gprinter/command/LabelCommand$FONTTYPE;Lcom/gprinter/command/LabelCommand$ROTATION;Lcom/gprinter/command/LabelCommand$FONTMUL;Lcom/gprinter/command/LabelCommand$FONTMUL;IILjava/lang/String;)V
    procedure add1DBarcode(x: Integer; y: Integer; atype: JLabelCommand_BARCODETYPE; height: Integer; readable: JLabelCommand_READABEL; rotation: JLabelCommand_ROTATION; content: JString); cdecl; overload; //(IILcom/gprinter/command/LabelCommand$BARCODETYPE;ILcom/gprinter/command/LabelCommand$READABEL;Lcom/gprinter/command/LabelCommand$ROTATION;Ljava/lang/String;)V
    procedure add1DBarcode(x: Integer; y: Integer; atype: JLabelCommand_BARCODETYPE; height: Integer; readable: JLabelCommand_READABEL; rotation: JLabelCommand_ROTATION; narrow: Integer; width: Integer; content: JString); cdecl; overload; //(IILcom/gprinter/command/LabelCommand$BARCODETYPE;ILcom/gprinter/command/LabelCommand$READABEL;Lcom/gprinter/command/LabelCommand$ROTATION;IILjava/lang/String;)V
    procedure addBox(x: Integer; y: Integer; xend: Integer; yend: Integer; thickness: Integer); cdecl; //(IIIII)V
    procedure addBitmap(x: Integer; y: Integer; mode: JLabelCommand_BITMAP_MODE; nWidth: Integer; b: JBitmap); cdecl; overload; //(IILcom/gprinter/command/LabelCommand$BITMAP_MODE;ILandroid/graphics/Bitmap;)V
    procedure drawImage(startX: Integer; startY: Integer; bitmap: JBitmap; width: Integer; height: Integer); cdecl; overload; //(IILandroid/graphics/Bitmap;II)V
    procedure addBitmapByMethod(x: Integer; y: Integer; mode: JLabelCommand_BITMAP_MODE; nWidth: Integer; b: JBitmap); cdecl; //(IILcom/gprinter/command/LabelCommand$BITMAP_MODE;ILandroid/graphics/Bitmap;)V
    procedure addBitmap(x: Integer; y: Integer; nWidth: Integer; bmp: JBitmap); cdecl; overload; //(IIILandroid/graphics/Bitmap;)V
    procedure drawImage(x: Integer; y: Integer; nwidth: Integer; nbitmap: JBitmap); cdecl; overload; //(IIILandroid/graphics/Bitmap;)V
    procedure drawImage2(x: Integer; y: Integer; mWidth: Integer; mBitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure drawXmlImage(x: Integer; y: Integer; mWidth: Integer; nbitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure drawJPGImage(x: Integer; y: Integer; nwidth: Integer; nbitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure drawJPGImage2(nwidth: Integer; nbitmap: JBitmap); cdecl; //(ILandroid/graphics/Bitmap;)V
    procedure getDitheredImage(x: Integer; y: Integer; width: Integer; height: Integer; bitmap: JBitmap); cdecl; //(IIIILandroid/graphics/Bitmap;)V
    function getRow(bitmap: JBitmap; var1: Integer): TJavaArray<Integer>; cdecl; //(Landroid/graphics/Bitmap;I)[I
    procedure putbmp(imageName: JString; x: Integer; y: Integer); cdecl; //(Ljava/lang/String;II)V
    procedure downFlashBitmap(data: TJavaArray<Byte>; nWidth: Integer; imageName: JString); cdecl; //([BILjava/lang/String;)V
    procedure downloadBMP(mbitmap: JBitmap; imageName: JString; nWidth: Integer); cdecl; //(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    function getBitmapByte(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    function getBitmapFromByte(temp: TJavaArray<Byte>): JBitmap; cdecl; //([B)Landroid/graphics/Bitmap;
    procedure addZLibBitmap(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addNewBitmap(x: Integer; y: Integer; nWidth: Integer; b: JBitmap; level: Integer); cdecl; //(IIILandroid/graphics/Bitmap;I)V
    procedure addNewBitmap300(x: Integer; y: Integer; nWidth: Integer; b: JBitmap; level: Integer); cdecl; //(IIILandroid/graphics/Bitmap;I)V
    procedure addZLibBitmap200DPI(x: Integer; y: Integer; bmpWidth: Integer; b: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addZLibCutBitmap200DPI(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap; cut: Boolean); cdecl; //(IIILandroid/graphics/Bitmap;Z)V
    procedure addZLibBitmap300DPI(x: Integer; y: Integer; bmpWidth: Integer; b: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addZLibCutBitmap300DPI(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap; cut: Boolean); cdecl; //(IIILandroid/graphics/Bitmap;Z)V
    procedure addZLibNoTrembleBitmapheight(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addZLibNoTrembleBitmapheight300(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    procedure addZLibNoTrembleBitmap(x: Integer; y: Integer; nWidth: Integer; bitmap: JBitmap); cdecl; //(IIILandroid/graphics/Bitmap;)V
    function getZLibData(w: Integer; nWidth: Integer; bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(IILandroid/graphics/Bitmap;)[B
    procedure addErase(x: Integer; y: Integer; xwidth: Integer; yheight: Integer); cdecl; //(IIII)V
    procedure addReverse(x: Integer; y: Integer; xwidth: Integer; yheight: Integer); cdecl; //(IIII)V
    procedure addQRCode(x: Integer; y: Integer; level: JLabelCommand_EEC; cellwidth: Integer; rotation: JLabelCommand_ROTATION; data: JString); cdecl; //(IILcom/gprinter/command/LabelCommand$EEC;ILcom/gprinter/command/LabelCommand$ROTATION;Ljava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; content: JString); cdecl; overload; //(IIIILjava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; rotation: JLabelCommand_ROTATION; content: JString); cdecl; overload; //(IIIILcom/gprinter/command/LabelCommand$ROTATION;Ljava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; xZoom: Integer; content: JString); cdecl; overload; //(IIIIILjava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; c: Integer; xZoom: Integer; content: JString); cdecl; overload; //(IIIIIILjava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; xZoom: Integer; row: Integer; col: Integer; content: JString); cdecl; overload; //(IIIIIIILjava/lang/String;)V
    procedure addDMATRIX(x: Integer; y: Integer; width: Integer; height: Integer; c: Integer; xZoom: Integer; rotation: JLabelCommand_ROTATION; shape: JLabelCommand_Shape; row: Integer; col: Integer; content: JString); cdecl; overload; //(IIIIIILcom/gprinter/command/LabelCommand$ROTATION;Lcom/gprinter/command/LabelCommand$Shape;IILjava/lang/String;)V
    function getCommand: JVector; cdecl; //()Ljava/util/Vector;
    procedure addQueryPrinterType; cdecl; //()V
    procedure addQueryPrinterStatus; cdecl; overload; //()V
    procedure addResetPrinter; cdecl; //()V
    procedure addQueryPrinterLife; cdecl; //()V
    procedure addQueryPrinterMemory; cdecl; //()V
    procedure addQueryPrinterFile; cdecl; //()V
    procedure addQueryPrinterCodePage; cdecl; //()V
    procedure addPeel(enable: JLabelCommand_RESPONSE_MODE); cdecl; //(Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;)V
    procedure addTear(mode: JLabelCommand_RESPONSE_MODE); cdecl; //(Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;)V
    procedure addCutter(enable: JLabelCommand_RESPONSE_MODE); cdecl; //(Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;)V
    procedure addCutterBatch; cdecl; //()V
    procedure addCutterPieces(number: Word); cdecl; //(S)V
    procedure addReprint(enable: JLabelCommand_RESPONSE_MODE); cdecl; //(Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;)V
    procedure addPrintKey(enable: JEscCommand_ENABLE); cdecl; overload; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addPrintKey(m: Integer); cdecl; overload; //(I)V
    procedure addHead(enable: JLabelCommand_ENABLE); cdecl; //(Lcom/gprinter/command/LabelCommand$ENABLE;)V
    procedure addRibbon(enable: JLabelCommand_ENABLE); cdecl; //(Lcom/gprinter/command/LabelCommand$ENABLE;)V
    procedure addKeyOne(enable: JLabelCommand_ENABLE); cdecl; //(Lcom/gprinter/command/LabelCommand$ENABLE;)V
    procedure addKeyTwo(enable: JLabelCommand_ENABLE); cdecl; //(Lcom/gprinter/command/LabelCommand$ENABLE;)V
    procedure addPartialCutter(enable: JEscCommand_ENABLE); cdecl; //(Lcom/gprinter/command/EscCommand$ENABLE;)V
    procedure addQueryPrinterStatus(mode: JLabelCommand_RESPONSE_MODE); cdecl; overload; //(Lcom/gprinter/command/LabelCommand$RESPONSE_MODE;)V
    procedure addCOUNTER(number: Integer; step: Integer); cdecl; //(II)V
    procedure addUserCommand(command: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure addUserCommand(command: TJavaArray<Byte>); cdecl; overload; //([B)V

    { Property }
  end;

  TJLabelCommand = class(TJavaGenericImport<JLabelCommandClass, JLabelCommand>) end;

  JZPLCommand_Code128ModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{6B3D035E-690A-45E8-B3EF-DD43022BC258}']
    { static Property Methods }
    {class} function _GetN: JZPLCommand_Code128Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Code128Mode;
    {class} function _GetU: JZPLCommand_Code128Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Code128Mode;
    {class} function _GetA: JZPLCommand_Code128Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Code128Mode;
    {class} function _GetD: JZPLCommand_Code128Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Code128Mode;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Code128Mode>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Code128Mode;
    {class} function valueOf(name: JString): JZPLCommand_Code128Mode; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Code128Mode;

    { static Property }
    {class} property N: JZPLCommand_Code128Mode read _GetN;
    {class} property U: JZPLCommand_Code128Mode read _GetU;
    {class} property A: JZPLCommand_Code128Mode read _GetA;
    {class} property D: JZPLCommand_Code128Mode read _GetD;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Code128Mode')]
  JZPLCommand_Code128Mode = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C708EB2C-085A-4805-A90E-6AA7689281BD}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_Code128Mode = class(TJavaGenericImport<JZPLCommand_Code128ModeClass, JZPLCommand_Code128Mode>) end;

  JZPLCommand_CodeMarkClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{53F87907-52FE-4243-AB4E-0F45E66F1D80}']
    { static Property Methods }
    {class} function _GetMark_N: JZPLCommand_CodeMark;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$CodeMark;
    {class} function _GetMark_Y: JZPLCommand_CodeMark;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$CodeMark;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_CodeMark>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$CodeMark;
    {class} function valueOf(name: JString): JZPLCommand_CodeMark; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$CodeMark;

    { static Property }
    {class} property Mark_N: JZPLCommand_CodeMark read _GetMark_N;
    {class} property Mark_Y: JZPLCommand_CodeMark read _GetMark_Y;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$CodeMark')]
  JZPLCommand_CodeMark = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3E0D7EEC-93FF-4918-A80D-9236FAD2EBD2}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_CodeMark = class(TJavaGenericImport<JZPLCommand_CodeMarkClass, JZPLCommand_CodeMark>) end;

  JZPLCommand_ECClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{C163E6AE-15A1-4B79-A806-FBB569B10A7E}']
    { static Property Methods }
    {class} function _GetEC_1: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_3: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_4: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_5: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_6: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_7: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;
    {class} function _GetEC_8: JZPLCommand_EC;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$EC;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_EC>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$EC;
    {class} function valueOf(name: JString): JZPLCommand_EC; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$EC;

    { static Property }
    {class} property EC_1: JZPLCommand_EC read _GetEC_1;
    {class} property EC: JZPLCommand_EC read _GetEC;
    {class} property EC_3: JZPLCommand_EC read _GetEC_3;
    {class} property EC_4: JZPLCommand_EC read _GetEC_4;
    {class} property EC_5: JZPLCommand_EC read _GetEC_5;
    {class} property EC_6: JZPLCommand_EC read _GetEC_6;
    {class} property EC_7: JZPLCommand_EC read _GetEC_7;
    {class} property EC_8: JZPLCommand_EC read _GetEC_8;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$EC')]
  JZPLCommand_EC = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{723EE829-1257-4121-A1E8-9466B744AB0B}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJZPLCommand_EC = class(TJavaGenericImport<JZPLCommand_ECClass, JZPLCommand_EC>) end;

  JZPLCommand_FontClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{3ECE2A4D-2ABD-4568-BDD4-4E1A50E3A807}']
    { static Property Methods }
    {class} function _GetFONT_A: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_B: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_C: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_D: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_E: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_F: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_G: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_H: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_BI: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_J: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_K: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_L: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_M: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_N: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_O: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_P: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_Q: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_R: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_S: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_T: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_U: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_V: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_W: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_X: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_Y: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_Z: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_0: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_1: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_2: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_3: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_4: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_5: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_6: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_7: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_8: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;
    {class} function _GetFONT_9: JZPLCommand_Font;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Font;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Font>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Font;
    {class} function valueOf(name: JString): JZPLCommand_Font; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Font;

    { static Property }
    {class} property FONT_A: JZPLCommand_Font read _GetFONT_A;
    {class} property FONT_B: JZPLCommand_Font read _GetFONT_B;
    {class} property FONT_C: JZPLCommand_Font read _GetFONT_C;
    {class} property FONT_D: JZPLCommand_Font read _GetFONT_D;
    {class} property FONT_E: JZPLCommand_Font read _GetFONT_E;
    {class} property FONT_F: JZPLCommand_Font read _GetFONT_F;
    {class} property FONT_G: JZPLCommand_Font read _GetFONT_G;
    {class} property FONT_H: JZPLCommand_Font read _GetFONT_H;
    {class} property FONT_BI: JZPLCommand_Font read _GetFONT_BI;
    {class} property FONT_J: JZPLCommand_Font read _GetFONT_J;
    {class} property FONT_K: JZPLCommand_Font read _GetFONT_K;
    {class} property FONT_L: JZPLCommand_Font read _GetFONT_L;
    {class} property FONT_M: JZPLCommand_Font read _GetFONT_M;
    {class} property FONT_N: JZPLCommand_Font read _GetFONT_N;
    {class} property FONT_O: JZPLCommand_Font read _GetFONT_O;
    {class} property FONT_P: JZPLCommand_Font read _GetFONT_P;
    {class} property FONT_Q: JZPLCommand_Font read _GetFONT_Q;
    {class} property FONT_R: JZPLCommand_Font read _GetFONT_R;
    {class} property FONT_S: JZPLCommand_Font read _GetFONT_S;
    {class} property FONT_T: JZPLCommand_Font read _GetFONT_T;
    {class} property FONT_U: JZPLCommand_Font read _GetFONT_U;
    {class} property FONT_V: JZPLCommand_Font read _GetFONT_V;
    {class} property FONT_W: JZPLCommand_Font read _GetFONT_W;
    {class} property FONT_X: JZPLCommand_Font read _GetFONT_X;
    {class} property FONT_Y: JZPLCommand_Font read _GetFONT_Y;
    {class} property FONT_Z: JZPLCommand_Font read _GetFONT_Z;
    {class} property FONT_0: JZPLCommand_Font read _GetFONT_0;
    {class} property FONT_1: JZPLCommand_Font read _GetFONT_1;
    {class} property FONT_2: JZPLCommand_Font read _GetFONT_2;
    {class} property FONT_3: JZPLCommand_Font read _GetFONT_3;
    {class} property FONT_4: JZPLCommand_Font read _GetFONT_4;
    {class} property FONT_5: JZPLCommand_Font read _GetFONT_5;
    {class} property FONT_6: JZPLCommand_Font read _GetFONT_6;
    {class} property FONT_7: JZPLCommand_Font read _GetFONT_7;
    {class} property FONT_8: JZPLCommand_Font read _GetFONT_8;
    {class} property FONT_9: JZPLCommand_Font read _GetFONT_9;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Font')]
  JZPLCommand_Font = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{0B99A6B6-E956-4F6F-A736-DC23BD16BE02}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_Font = class(TJavaGenericImport<JZPLCommand_FontClass, JZPLCommand_Font>) end;

  JZPLCommand_IdentifierClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{1635F1F8-8B09-4973-8E2C-CD9F16C0F370}']
    { static Property Methods }
    {class} function _GetN: JZPLCommand_Identifier;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Identifier;
    {class} function _GetA: JZPLCommand_Identifier;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Identifier;
    {class} function _GetB: JZPLCommand_Identifier;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Identifier;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Identifier>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Identifier;
    {class} function valueOf(name: JString): JZPLCommand_Identifier; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Identifier;

    { static Property }
    {class} property N: JZPLCommand_Identifier read _GetN;
    {class} property A: JZPLCommand_Identifier read _GetA;
    {class} property B: JZPLCommand_Identifier read _GetB;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Identifier')]
  JZPLCommand_Identifier = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{85C36716-DBDF-46A2-B168-0B714536AE8B}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_Identifier = class(TJavaGenericImport<JZPLCommand_IdentifierClass, JZPLCommand_Identifier>) end;

  JZPLCommand_ModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{909DCC33-C55C-4BC6-8728-ED5D2D535B12}']
    { static Property Methods }
    {class} function _GetMode_A: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_0: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_1: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_2: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_3: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_4: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function _GetMode_5: JZPLCommand_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Mode;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Mode>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Mode;
    {class} function valueOf(name: JString): JZPLCommand_Mode; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Mode;

    { static Property }
    {class} property Mode_A: JZPLCommand_Mode read _GetMode_A;
    {class} property Mode_0: JZPLCommand_Mode read _GetMode_0;
    {class} property Mode_1: JZPLCommand_Mode read _GetMode_1;
    {class} property Mode_2: JZPLCommand_Mode read _GetMode_2;
    {class} property Mode_3: JZPLCommand_Mode read _GetMode_3;
    {class} property Mode_4: JZPLCommand_Mode read _GetMode_4;
    {class} property Mode_5: JZPLCommand_Mode read _GetMode_5;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Mode')]
  JZPLCommand_Mode = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9DF5A2B6-5BBE-428A-83FA-E1CC3D5766B1}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_Mode = class(TJavaGenericImport<JZPLCommand_ModeClass, JZPLCommand_Mode>) end;

  JZPLCommand_RotationClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{77DC8228-90BD-4F9B-B41C-165E2AC5087F}']
    { static Property Methods }
    {class} function _GetROTATION_0: JZPLCommand_Rotation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Rotation;
    {class} function _GetROTATION_90: JZPLCommand_Rotation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Rotation;
    {class} function _GetROTATION_180: JZPLCommand_Rotation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Rotation;
    {class} function _GetROTATION_270: JZPLCommand_Rotation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Rotation;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Rotation>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Rotation;
    {class} function valueOf(name: JString): JZPLCommand_Rotation; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Rotation;

    { static Property }
    {class} property ROTATION_0: JZPLCommand_Rotation read _GetROTATION_0;
    {class} property ROTATION_90: JZPLCommand_Rotation read _GetROTATION_90;
    {class} property ROTATION_180: JZPLCommand_Rotation read _GetROTATION_180;
    {class} property ROTATION_270: JZPLCommand_Rotation read _GetROTATION_270;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Rotation')]
  JZPLCommand_Rotation = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C9856E73-55B1-4B81-8857-46A4EC4A4324}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_Rotation = class(TJavaGenericImport<JZPLCommand_RotationClass, JZPLCommand_Rotation>) end;

  JZPLCommand_ScaleClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{685C538A-431D-43A2-A95E-A0CB923057F8}']
    { static Property Methods }
    {class} function _GetSCALE_1: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_2: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_3: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_4: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_5: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_6: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_7: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_8: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_9: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function _GetSCALE_10: JZPLCommand_Scale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$Scale;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_Scale>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$Scale;
    {class} function valueOf(name: JString): JZPLCommand_Scale; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$Scale;

    { static Property }
    {class} property SCALE_1: JZPLCommand_Scale read _GetSCALE_1;
    {class} property SCALE_2: JZPLCommand_Scale read _GetSCALE_2;
    {class} property SCALE_3: JZPLCommand_Scale read _GetSCALE_3;
    {class} property SCALE_4: JZPLCommand_Scale read _GetSCALE_4;
    {class} property SCALE_5: JZPLCommand_Scale read _GetSCALE_5;
    {class} property SCALE_6: JZPLCommand_Scale read _GetSCALE_6;
    {class} property SCALE_7: JZPLCommand_Scale read _GetSCALE_7;
    {class} property SCALE_8: JZPLCommand_Scale read _GetSCALE_8;
    {class} property SCALE_9: JZPLCommand_Scale read _GetSCALE_9;
    {class} property SCALE_10: JZPLCommand_Scale read _GetSCALE_10;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$Scale')]
  JZPLCommand_Scale = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{FE80D91C-F576-48C9-A39B-D0515EFB0B15}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJZPLCommand_Scale = class(TJavaGenericImport<JZPLCommand_ScaleClass, JZPLCommand_Scale>) end;

  JZPLCommand_StartCharacterClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{0256D785-F725-4371-ADE3-13F7512D12E0}']
    { static Property Methods }
    {class} function _GetA: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetB: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetC: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetD: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetE: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetN: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetT: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function _GetSTAR: JZPLCommand_StartCharacter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/command/ZPLCommand$StartCharacter;

    { static Methods }
    {class} function values: TJavaObjectArray<JZPLCommand_StartCharacter>; cdecl; //()[Lcom/gprinter/command/ZPLCommand$StartCharacter;
    {class} function valueOf(name: JString): JZPLCommand_StartCharacter; cdecl; //(Ljava/lang/String;)Lcom/gprinter/command/ZPLCommand$StartCharacter;

    { static Property }
    {class} property A: JZPLCommand_StartCharacter read _GetA;
    {class} property B: JZPLCommand_StartCharacter read _GetB;
    {class} property C: JZPLCommand_StartCharacter read _GetC;
    {class} property D: JZPLCommand_StartCharacter read _GetD;
    {class} property E: JZPLCommand_StartCharacter read _GetE;
    {class} property N: JZPLCommand_StartCharacter read _GetN;
    {class} property T: JZPLCommand_StartCharacter read _GetT;
    {class} property STAR: JZPLCommand_StartCharacter read _GetSTAR;
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand$StartCharacter')]
  JZPLCommand_StartCharacter = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{697CE9C3-5AF7-4C39-9E3C-D76C9611AD64}']
    { Property Methods }

    { methods }
    function getValue: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJZPLCommand_StartCharacter = class(TJavaGenericImport<JZPLCommand_StartCharacterClass, JZPLCommand_StartCharacter>) end;

  JZPLCommandClass = interface(JObjectClass)
  ['{2EE902BB-4017-4421-86AF-10220CB79D25}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZPLCommand; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/command/ZPLCommand')]
  JZPLCommand = interface(JObject)
  ['{46F61CD7-D88E-4DD4-96AC-D7CF9A6AD526}']
    { Property Methods }

    { methods }
    procedure addText(font: JString; rotation: JZPLCommand_Rotation; fontWidth: Integer; fontHeight: Integer); cdecl; //(Ljava/lang/String;Lcom/gprinter/command/ZPLCommand$Rotation;II)V
    procedure addAztecCode(a: JZPLCommand_Rotation; b: JZPLCommand_Scale; c: JZPLCommand_CodeMark; d: Integer; e: JZPLCommand_CodeMark; f: Integer; g: Integer); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;Lcom/gprinter/command/ZPLCommand$Scale;Lcom/gprinter/command/ZPLCommand$CodeMark;ILcom/gprinter/command/ZPLCommand$CodeMark;II)V
    procedure addCode11(o: JZPLCommand_Rotation; e: JZPLCommand_CodeMark; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;Lcom/gprinter/command/ZPLCommand$CodeMark;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCrossCode(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark; e: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCode39(o: JZPLCommand_Rotation; e: JZPLCommand_CodeMark; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;Lcom/gprinter/command/ZPLCommand$CodeMark;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCode49(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_Identifier; m: JZPLCommand_Mode); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$Identifier;Lcom/gprinter/command/ZPLCommand$Mode;)V
    procedure addCodePlanet(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addPDF417(o: JZPLCommand_Rotation; h: Integer; s: JZPLCommand_EC; c: Integer; r: Integer; t: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$EC;IILcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addEAN8(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addUPCE(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark; e: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCode93(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark; e: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCode128(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark; e: JZPLCommand_CodeMark; m: JZPLCommand_Code128Mode); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$Code128Mode;)V
    procedure addEAN113(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addMicroPDF417(o: JZPLCommand_Rotation; h: Integer; m: Integer); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;II)V
    procedure addCodeI25(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCodeJ25(o: JZPLCommand_Rotation; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addCodabar(o: JZPLCommand_Rotation; e: JZPLCommand_CodeMark; h: Integer; f: JZPLCommand_CodeMark; g: JZPLCommand_CodeMark; k: JZPLCommand_StartCharacter; I: JZPLCommand_StartCharacter); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;Lcom/gprinter/command/ZPLCommand$CodeMark;ILcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$CodeMark;Lcom/gprinter/command/ZPLCommand$StartCharacter;Lcom/gprinter/command/ZPLCommand$StartCharacter;)V
    procedure addLogMars(o: JZPLCommand_Rotation; h: Integer; g: JZPLCommand_CodeMark); cdecl; //(Lcom/gprinter/command/ZPLCommand$Rotation;ILcom/gprinter/command/ZPLCommand$CodeMark;)V
    procedure addStart; cdecl; //()V
    procedure addEnd; cdecl; //()V
    procedure printImage(var1: JZebraImageI; var2: Integer; var3: Integer; var4: Integer; var5: Integer; var6: Boolean); cdecl; //(Lcom/gprinter/zb/ZebraImageI;IIIIZ)V
    procedure getDitheredImage(Image: JZebraImageInternal); cdecl; //(Lcom/gprinter/zb/ZebraImageInternal;)V
    procedure addUserCommand(bytes: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure addUserCommand(astring: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function getCommand: JVector; cdecl; //()Ljava/util/Vector;
    procedure addUserCommand(astring: JString; charsetName: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V

    { Property }
  end;

  TJZPLCommand = class(TJavaGenericImport<JZPLCommandClass, JZPLCommand>) end;

//  JBleBlueToothPort_1Class = interface(JObjectClass)
//  ['{82CF2F77-68AE-433F-8C5E-CC5DA9DBD744}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$1')]
//  JBleBlueToothPort_1 = interface(JObject)
//  ['{2E109081-CC74-4583-8C9E-E8618BFDB01C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_1 = class(TJavaGenericImport<JBleBlueToothPort_1Class, JBleBlueToothPort_1>) end;

//  JBleBlueToothPort_2Class = interface(JObjectClass)
//  ['{42071C0B-75D2-496F-8CDF-7F37454B709E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$2')]
//  JBleBlueToothPort_2 = interface(JObject)
//  ['{2DAD2494-07CA-466C-8F52-B56747CC25FC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_2 = class(TJavaGenericImport<JBleBlueToothPort_2Class, JBleBlueToothPort_2>) end;

//  JBleBlueToothPort_3Class = interface(JObjectClass)
//  ['{DFCD22CA-7E51-4D03-864B-246706CF1276}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$3')]
//  JBleBlueToothPort_3 = interface(JObject)
//  ['{6FD2C0D9-B082-48A3-AD0C-BB0AA3FAB60B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_3 = class(TJavaGenericImport<JBleBlueToothPort_3Class, JBleBlueToothPort_3>) end;

//  JBleBlueToothPort_4Class = interface(JObjectClass)
//  ['{44DE1AF0-CC92-4096-899A-D6A05D78C952}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$4')]
//  JBleBlueToothPort_4 = interface(JObject)
//  ['{CB702B89-1639-4816-9E92-3445126C3C34}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_4 = class(TJavaGenericImport<JBleBlueToothPort_4Class, JBleBlueToothPort_4>) end;

//  JBleBlueToothPort_5Class = interface(JObjectClass)
//  ['{A706EE25-AF22-4CB9-8845-8286E5DEEFA7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$5')]
//  JBleBlueToothPort_5 = interface(JObject)
//  ['{FA90894A-83BF-42BB-8A24-9D4C8B8A6257}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_5 = class(TJavaGenericImport<JBleBlueToothPort_5Class, JBleBlueToothPort_5>) end;

//  JBleBlueToothPort_6Class = interface(JObjectClass)
//  ['{188DCA9A-6D4E-4F6D-9243-2EC5BAA15275}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$6')]
//  JBleBlueToothPort_6 = interface(JObject)
//  ['{E51C6311-A5D2-4086-A6EF-69D86EE7A908}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_6 = class(TJavaGenericImport<JBleBlueToothPort_6Class, JBleBlueToothPort_6>) end;

//  JBleBlueToothPort_7Class = interface(JObjectClass)
//  ['{7F5080B7-1DA1-4637-ADFA-3E3128F453F8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$7')]
//  JBleBlueToothPort_7 = interface(JObject)
//  ['{27B998DA-A6E3-4DF2-BD75-46564D2179B9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBleBlueToothPort_7 = class(TJavaGenericImport<JBleBlueToothPort_7Class, JBleBlueToothPort_7>) end;

//  JBleBlueToothPort_BleGattCallback_1Class = interface(JObjectClass)
//  ['{A8C8405A-67E1-4E2C-A2E6-9FA0DB13A74F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$BleGattCallback$1')]
//  JBleBlueToothPort_BleGattCallback_1 = interface(JObject)
//  ['{72C973B8-4550-4350-A42F-6458F4B2F0D1}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_BleGattCallback_1 = class(TJavaGenericImport<JBleBlueToothPort_BleGattCallback_1Class, JBleBlueToothPort_BleGattCallback_1>) end;

//  JBleBlueToothPort_BleGattCallback_2_1Class = interface(JObjectClass)
//  ['{451209AC-1E00-4CB8-A7C4-368A87833C70}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$BleGattCallback$2$1')]
//  JBleBlueToothPort_BleGattCallback_2_1 = interface(JObject)
//  ['{5365B324-84C0-49F3-9D12-B7E7F66AD5D6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_BleGattCallback_2_1 = class(TJavaGenericImport<JBleBlueToothPort_BleGattCallback_2_1Class, JBleBlueToothPort_BleGattCallback_2_1>) end;

//  JBleBlueToothPort_BleGattCallback_2Class = interface(JObjectClass)
//  ['{20861186-60EB-4D4A-A279-7C1FA91EA32F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$BleGattCallback$2')]
//  JBleBlueToothPort_BleGattCallback_2 = interface(JObject)
//  ['{BC5C333A-846D-47DF-BAFB-7EDE7FF2DCC4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_BleGattCallback_2 = class(TJavaGenericImport<JBleBlueToothPort_BleGattCallback_2Class, JBleBlueToothPort_BleGattCallback_2>) end;

//  JBleBlueToothPort_BleGattCallback_3Class = interface(JObjectClass)
//  ['{4E7CB110-13E5-4921-ABA9-EDE04E855BE6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BleBlueToothPort$BleGattCallback$3')]
//  JBleBlueToothPort_BleGattCallback_3 = interface(JObject)
//  ['{BB447B0D-76A9-4CE5-BFF0-05EEB8800942}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBlueToothPort_BleGattCallback_3 = class(TJavaGenericImport<JBleBlueToothPort_BleGattCallback_3Class, JBleBlueToothPort_BleGattCallback_3>) end;

  JBleBlueToothPort_BleGattCallbackClass = interface(JBluetoothGattCallbackClass) // or JObjectClass // SuperSignature: android/bluetooth/BluetoothGattCallback
  ['{A4A5BA89-0A5C-4341-9667-79AEB3885A5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/BleBlueToothPort$BleGattCallback')]
  JBleBlueToothPort_BleGattCallback = interface(JBluetoothGattCallback) // or JObject // SuperSignature: android/bluetooth/BluetoothGattCallback
  ['{F7AD3070-EAB6-4925-BCBD-0F5F8D27F880}']
    { Property Methods }

    { methods }
    procedure onConnectionStateChange(gatt: JBluetoothGatt; status: Integer; newState: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;II)V
    procedure onServicesDiscovered(gatt: JBluetoothGatt; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;I)V
    procedure onCharacteristicRead(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    procedure onCharacteristicWrite(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    procedure onCharacteristicChanged(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    procedure onDescriptorRead(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    procedure onDescriptorWrite(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    procedure onMtuChanged(gatt: JBluetoothGatt; mtu: Integer; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;II)V

    { Property }
  end;

  TJBleBlueToothPort_BleGattCallback = class(TJavaGenericImport<JBleBlueToothPort_BleGattCallbackClass, JBleBlueToothPort_BleGattCallback>) end;


  JPortManagerClass = interface(JObjectClass)
  ['{A97319A8-BCC3-4827-93E9-BEABA1499851}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPortManager; cdecl; //()V
    {class} procedure PortManager; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/PortManager')]
  JPortManager = interface(JObject)
  ['{AAA23B9F-76A3-462D-84D6-ADCD0B349091}']
    { Property Methods }

    { methods }
    function openPort: Boolean; cdecl; //()Z
    function getConnectStatus: Boolean; cdecl; //()Z
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
//    function writeDataImmediately(data: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(bitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getPower: Integer; cdecl; //()I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
    function getKey: TJavaArray<Byte>; cdecl; //()[B
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    procedure setBlePack(pack: Integer); cdecl; //(I)V
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z
    function getInputStream: JInputStream; cdecl; //()Ljava/io/InputStream;
    function getOutputStream: JOutputStream; cdecl; //()Ljava/io/OutputStream;

    { Property }
  end;

  TJPortManager = class(TJavaGenericImport<JPortManagerClass, JPortManager>) end;



  JBleBlueToothPortClass = interface(JPortManagerClass) // or JObjectClass // SuperSignature: com/gprinter/io/PortManager
  ['{27AD56B5-1B6A-4E0A-97E0-5E27B9C13FF8}']
    { static Property Methods }

    { static Methods }
    {class} function init(printerDevices: JPrinterDevices): JBleBlueToothPort; cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/BleBlueToothPort')]
  JBleBlueToothPort = interface(JPortManager) // or JObject // SuperSignature: com/gprinter/io/PortManager
  ['{90C6A6C1-EB61-4161-B7A5-20B96E2DDBED}']
    { Property Methods }

    { methods }
    function openPort: Boolean; cdecl; //()Z
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    procedure setBlePack(pack: Integer); cdecl; //(I)V
    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(mBitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getPower: Integer; cdecl; //()I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
//    function writeDataImmediately(sendData: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function getSupportedGattServices: JList; cdecl; //()Ljava/util/List;
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z

    { Property }
  end;

  TJBleBlueToothPort = class(TJavaGenericImport<JBleBlueToothPortClass, JBleBlueToothPort>) end;

//  JBluetoothPort_1Class = interface(JObjectClass)
//  ['{2CB6D40D-30EB-4CCA-A8BD-2A88AB7AF056}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$1')]
//  JBluetoothPort_1 = interface(JObject)
//  ['{79690333-C605-4B3C-8411-825E3320D31B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_1 = class(TJavaGenericImport<JBluetoothPort_1Class, JBluetoothPort_1>) end;

//  JBluetoothPort_2Class = interface(JObjectClass)
//  ['{7DD80271-D043-4AEC-A35C-8913382FDD35}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$2')]
//  JBluetoothPort_2 = interface(JObject)
//  ['{62621A25-7833-4322-B39D-89A5CDF1B8C9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_2 = class(TJavaGenericImport<JBluetoothPort_2Class, JBluetoothPort_2>) end;

//  JBluetoothPort_3Class = interface(JObjectClass)
//  ['{3CDC6B4C-217D-4EE2-9766-E23AEF55E8BD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$3')]
//  JBluetoothPort_3 = interface(JObject)
//  ['{A67F9C66-A8D8-4E57-A3D1-831DEA2BED94}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_3 = class(TJavaGenericImport<JBluetoothPort_3Class, JBluetoothPort_3>) end;

//  JBluetoothPort_4Class = interface(JObjectClass)
//  ['{92E5FA0E-565A-462B-860B-0BFD2423D73D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$4')]
//  JBluetoothPort_4 = interface(JObject)
//  ['{EBF2FC99-4F6B-4218-86F4-E9CAA10A02A2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_4 = class(TJavaGenericImport<JBluetoothPort_4Class, JBluetoothPort_4>) end;

//  JBluetoothPort_5Class = interface(JObjectClass)
//  ['{40BFC390-653C-4A8C-B660-08113C91EBE3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$5')]
//  JBluetoothPort_5 = interface(JObject)
//  ['{742D651A-5BB7-4998-8363-9F69E8E2217B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_5 = class(TJavaGenericImport<JBluetoothPort_5Class, JBluetoothPort_5>) end;

//  JBluetoothPort_6Class = interface(JObjectClass)
//  ['{326878BA-5B60-40FA-94A4-16E9B4A7D371}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$6')]
//  JBluetoothPort_6 = interface(JObject)
//  ['{A4330975-26C4-441A-8738-9EAEB8071A25}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_6 = class(TJavaGenericImport<JBluetoothPort_6Class, JBluetoothPort_6>) end;

//  JBluetoothPort_7Class = interface(JObjectClass)
//  ['{C09C81A8-314E-403C-AB5B-EE16CBA3917F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$7')]
//  JBluetoothPort_7 = interface(JObject)
//  ['{023D77E6-606B-4143-AE71-A0F2A6E67240}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBluetoothPort_7 = class(TJavaGenericImport<JBluetoothPort_7Class, JBluetoothPort_7>) end;

//  JBluetoothPort_IoReader_1Class = interface(JObjectClass)
//  ['{4D45AE40-C1E2-4291-8D79-04BDEEA04994}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$IoReader$1')]
//  JBluetoothPort_IoReader_1 = interface(JObject)
//  ['{EFFF3CE8-FE33-4A85-8DF3-9F7FC2940EF7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_IoReader_1 = class(TJavaGenericImport<JBluetoothPort_IoReader_1Class, JBluetoothPort_IoReader_1>) end;

//  JBluetoothPort_IoReader_2Class = interface(JObjectClass)
//  ['{086E72A2-38F3-43CD-A513-76B665A4A340}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/BluetoothPort$IoReader$2')]
//  JBluetoothPort_IoReader_2 = interface(JObject)
//  ['{D1CCB73E-69EB-434E-B904-EAA4D114CBDF}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothPort_IoReader_2 = class(TJavaGenericImport<JBluetoothPort_IoReader_2Class, JBluetoothPort_IoReader_2>) end;

  JBluetoothPort_IoReaderClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{715362A4-7018-401F-A1CA-50467C9ECA5E}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JBluetoothPort): JBluetoothPort_IoReader; cdecl; //(Lcom/gprinter/io/BluetoothPort;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/BluetoothPort$IoReader')]
  JBluetoothPort_IoReader = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{29AF05B1-F47F-4918-952F-764147932FD2}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJBluetoothPort_IoReader = class(TJavaGenericImport<JBluetoothPort_IoReaderClass, JBluetoothPort_IoReader>) end;




  JBluetoothPortClass = interface(JPortManagerClass) // or JObjectClass // SuperSignature: com/gprinter/io/PortManager
  ['{74316C22-5967-4FE6-B6B5-DECE716CF63F}']
    { static Property Methods }

    { static Methods }
    {class} function init(printerDevices: JPrinterDevices): JBluetoothPort; cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/BluetoothPort')]
  JBluetoothPort = interface(JPortManager) // or JObject // SuperSignature: com/gprinter/io/PortManager
  ['{F005A9D5-2CC1-449E-A13B-3C69BD3BDB35}']
    { Property Methods }

    { methods }
    function getConnectStatus: Boolean; cdecl; //()Z
    procedure addCallBackListener(listener: JCallbackListener); cdecl; //(Lcom/gprinter/utils/CallbackListener;)V
    procedure removeCallBackListener(listener: JCallbackListener); cdecl; //(Lcom/gprinter/utils/CallbackListener;)V
    function openPort: Boolean; cdecl; //()Z
//    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    function writeDataImmediately(data: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getKey: TJavaArray<Byte>; cdecl; //()[B
    function getPower: Integer; cdecl; //()I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(mBitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z

    { Property }
  end;

  TJBluetoothPort = class(TJavaGenericImport<JBluetoothPortClass, JBluetoothPort>) end;

//  JEthernetPort_1Class = interface(JObjectClass)
//  ['{05EDDCF7-59BD-4EEC-9D0E-CD442DBB1394}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$1')]
//  JEthernetPort_1 = interface(JObject)
//  ['{3CED25FD-849C-44A0-A82C-F94F07D29FAA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_1 = class(TJavaGenericImport<JEthernetPort_1Class, JEthernetPort_1>) end;

//  JEthernetPort_2Class = interface(JObjectClass)
//  ['{96A8C8ED-06A3-4C2C-A234-B94EAFB189C3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$2')]
//  JEthernetPort_2 = interface(JObject)
//  ['{370E3CF4-CD25-4BBF-8508-4FE92221B731}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_2 = class(TJavaGenericImport<JEthernetPort_2Class, JEthernetPort_2>) end;

//  JEthernetPort_3Class = interface(JObjectClass)
//  ['{94EE412F-111C-445B-94F1-7F45AA32517B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$3')]
//  JEthernetPort_3 = interface(JObject)
//  ['{0935AD3F-AC43-4E81-A345-E2243185A0A1}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_3 = class(TJavaGenericImport<JEthernetPort_3Class, JEthernetPort_3>) end;

//  JEthernetPort_4Class = interface(JObjectClass)
//  ['{54DF8FA2-1357-493C-AAA9-14A8BE9F1629}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$4')]
//  JEthernetPort_4 = interface(JObject)
//  ['{0578D311-01F1-4A8A-BF3D-47048E99F729}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_4 = class(TJavaGenericImport<JEthernetPort_4Class, JEthernetPort_4>) end;

//  JEthernetPort_5Class = interface(JObjectClass)
//  ['{A1FA722F-E0D3-4A3B-B647-11862A03F195}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$5')]
//  JEthernetPort_5 = interface(JObject)
//  ['{C67ACC0C-502E-473E-8022-CD49E5CAE7D9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_5 = class(TJavaGenericImport<JEthernetPort_5Class, JEthernetPort_5>) end;

//  JEthernetPort_6Class = interface(JObjectClass)
//  ['{FF398CD4-6169-410A-8A58-B48C47C29C94}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$6')]
//  JEthernetPort_6 = interface(JObject)
//  ['{FC9818B0-4BCA-4521-873B-7303FC063B59}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_6 = class(TJavaGenericImport<JEthernetPort_6Class, JEthernetPort_6>) end;

//  JEthernetPort_7Class = interface(JObjectClass)
//  ['{46BB9B40-571B-46A1-AC5E-967EF8603847}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$7')]
//  JEthernetPort_7 = interface(JObject)
//  ['{2F6DAF7D-2FFC-4A81-80B7-222A2D01A267}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_7 = class(TJavaGenericImport<JEthernetPort_7Class, JEthernetPort_7>) end;

//  JEthernetPort_8Class = interface(JObjectClass)
//  ['{56A523BD-BB2D-4653-94F0-4ECD14AA452B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$8')]
//  JEthernetPort_8 = interface(JObject)
//  ['{0709ED47-5037-4B20-A898-19EA41B9B896}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJEthernetPort_8 = class(TJavaGenericImport<JEthernetPort_8Class, JEthernetPort_8>) end;

//  JEthernetPort_IoReader_1Class = interface(JObjectClass)
//  ['{0F7E9638-93EA-4A21-8089-A9DCF0D9EC4D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$IoReader$1')]
//  JEthernetPort_IoReader_1 = interface(JObject)
//  ['{E0ABB1F0-2FF0-482B-A4B1-973EDC65B39A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_IoReader_1 = class(TJavaGenericImport<JEthernetPort_IoReader_1Class, JEthernetPort_IoReader_1>) end;

//  JEthernetPort_IoReader_2Class = interface(JObjectClass)
//  ['{7B833D3B-D036-4419-A7BC-5CD59004D645}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$IoReader$2')]
//  JEthernetPort_IoReader_2 = interface(JObject)
//  ['{369ECB88-A511-40FE-8E81-E305C7062658}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_IoReader_2 = class(TJavaGenericImport<JEthernetPort_IoReader_2Class, JEthernetPort_IoReader_2>) end;

  JEthernetPort_IoReaderClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{B132413E-98A8-424D-BEDC-19F320BB4DE5}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JEthernetPort): JEthernetPort_IoReader; cdecl; //(Lcom/gprinter/io/EthernetPort;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/EthernetPort$IoReader')]
  JEthernetPort_IoReader = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{F27DFAFB-15BD-412F-BFC3-4031D1CC7CE1}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJEthernetPort_IoReader = class(TJavaGenericImport<JEthernetPort_IoReaderClass, JEthernetPort_IoReader>) end;

//  JEthernetPort_PingReader_1Class = interface(JObjectClass)
//  ['{4830CCBF-6848-403E-BF6B-F721937C1EBF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/EthernetPort$PingReader$1')]
//  JEthernetPort_PingReader_1 = interface(JObject)
//  ['{E87BACF4-7BFB-4BA0-9205-F3140D709AA3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJEthernetPort_PingReader_1 = class(TJavaGenericImport<JEthernetPort_PingReader_1Class, JEthernetPort_PingReader_1>) end;

  JEthernetPort_PingReaderClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{41CA48A7-FC21-468A-B549-F9ABFE262721}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JEthernetPort): JEthernetPort_PingReader; cdecl; //(Lcom/gprinter/io/EthernetPort;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/EthernetPort$PingReader')]
  JEthernetPort_PingReader = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{F225562C-9E9D-4D86-B3E3-51BED3943BBB}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJEthernetPort_PingReader = class(TJavaGenericImport<JEthernetPort_PingReaderClass, JEthernetPort_PingReader>) end;

  JEthernetPortClass = interface(JPortManagerClass) // or JObjectClass // SuperSignature: com/gprinter/io/PortManager
  ['{351A67CE-1686-42F2-B2A3-F859ADFBA707}']
    { static Property Methods }

    { static Methods }
    {class} function init(devices: JPrinterDevices): JEthernetPort; cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/EthernetPort')]
  JEthernetPort = interface(JPortManager) // or JObject // SuperSignature: com/gprinter/io/PortManager
  ['{5F821A81-2B6F-4876-A110-6090A7F89932}']
    { Property Methods }

    { methods }
    function openPort: Boolean; cdecl; //()Z
//    function writeDataImmediately(data: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(mBitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getPower: Integer; cdecl; //()I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
    function getKey: TJavaArray<Byte>; cdecl; //()[B
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    function getConnectStatus: Boolean; cdecl; //()Z
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z

    { Property }
  end;

  TJEthernetPort = class(TJavaGenericImport<JEthernetPortClass, JEthernetPort>) end;


//  JSerialPort_1Class = interface(JObjectClass)
//  ['{8F298445-0CBF-4F39-B372-28C8237857A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$1')]
//  JSerialPort_1 = interface(JObject)
//  ['{387A2BB8-D128-4E96-8E6F-48A39E4C82D4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_1 = class(TJavaGenericImport<JSerialPort_1Class, JSerialPort_1>) end;

//  JSerialPort_2Class = interface(JObjectClass)
//  ['{8255EC61-E793-43CD-B7DB-D3E847662849}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$2')]
//  JSerialPort_2 = interface(JObject)
//  ['{850E6808-20F0-4A20-A2FB-EE748D850168}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_2 = class(TJavaGenericImport<JSerialPort_2Class, JSerialPort_2>) end;

//  JSerialPort_3Class = interface(JObjectClass)
//  ['{FFA6B9FB-8494-4995-8232-43CC1E9ED5BE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$3')]
//  JSerialPort_3 = interface(JObject)
//  ['{5718ABB0-7322-4BB4-87DD-30C9DE154D6D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_3 = class(TJavaGenericImport<JSerialPort_3Class, JSerialPort_3>) end;

//  JSerialPort_4Class = interface(JObjectClass)
//  ['{16BE194F-09F5-477B-9DC0-EDC32A03093C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$4')]
//  JSerialPort_4 = interface(JObject)
//  ['{D8F86A0A-458F-43CD-882F-6E341D4B19B3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_4 = class(TJavaGenericImport<JSerialPort_4Class, JSerialPort_4>) end;

//  JSerialPort_5Class = interface(JObjectClass)
//  ['{93E03A78-E7DA-4588-965E-A053734B79A7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$5')]
//  JSerialPort_5 = interface(JObject)
//  ['{1E995646-5ED3-4FA6-B1E6-54D2B1E0DA13}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJSerialPort_5 = class(TJavaGenericImport<JSerialPort_5Class, JSerialPort_5>) end;

//  JSerialPort_IoReader_1Class = interface(JObjectClass)
//  ['{886C3D17-A150-4CD0-815C-F40C11683C58}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$IoReader$1')]
//  JSerialPort_IoReader_1 = interface(JObject)
//  ['{F83F4DDC-630B-4CFF-945D-45336019A5CB}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_IoReader_1 = class(TJavaGenericImport<JSerialPort_IoReader_1Class, JSerialPort_IoReader_1>) end;

//  JSerialPort_IoReader_2Class = interface(JObjectClass)
//  ['{D91002CA-4843-4C5F-A465-2730BC270B10}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/SerialPort$IoReader$2')]
//  JSerialPort_IoReader_2 = interface(JObject)
//  ['{BCF7AC4F-D027-45D7-A1C2-D342F807618E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJSerialPort_IoReader_2 = class(TJavaGenericImport<JSerialPort_IoReader_2Class, JSerialPort_IoReader_2>) end;

  JSerialPort_IoReaderClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{9E3938CF-EAFE-4679-A6DD-69F6CA4B2B8D}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JSerialPort): JSerialPort_IoReader; cdecl; //(Lcom/gprinter/io/SerialPort;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/SerialPort$IoReader')]
  JSerialPort_IoReader = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{14B2FBFE-0894-4CD0-8A65-2BC72692F474}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJSerialPort_IoReader = class(TJavaGenericImport<JSerialPort_IoReaderClass, JSerialPort_IoReader>) end;

  JSerialPortClass = interface(JPortManagerClass) // or JObjectClass // SuperSignature: com/gprinter/io/PortManager
  ['{DF6ADC44-4FA9-4FA3-957F-BE2D320410F2}']
    { static Property Methods }

    { static Methods }
    {class} function init(devices: JPrinterDevices): JSerialPort; cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/SerialPort')]
  JSerialPort = interface(JPortManager) // or JObject // SuperSignature: com/gprinter/io/PortManager
  ['{82174D4D-6357-4881-8212-737C6CE22801}']
    { Property Methods }

    { methods }
    function openPort: Boolean; cdecl; //()Z
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(mBitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
//    function writeDataImmediately(sendData: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
    function getPower: Integer; cdecl; //()I
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

//  JUsbPort_1_1Class = interface(JObjectClass)
//  ['{D61D3502-76B9-4556-9C9C-3049624CFB03}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$1$1')]
//  JUsbPort_1_1 = interface(JObject)
//  ['{B911A479-B8E2-443A-8DF2-539F175A92DC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_1_1 = class(TJavaGenericImport<JUsbPort_1_1Class, JUsbPort_1_1>) end;

//  JUsbPort_1_2Class = interface(JObjectClass)
//  ['{470E3A5F-4798-4EAE-9E43-29175A199A75}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$1$2')]
//  JUsbPort_1_2 = interface(JObject)
//  ['{876CE295-013E-4C47-A0E2-E801F08F62D6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_1_2 = class(TJavaGenericImport<JUsbPort_1_2Class, JUsbPort_1_2>) end;

//  JUsbPort_1Class = interface(JBroadcastReceiverClass) // or JObjectClass // SuperSignature: android/content/BroadcastReceiver
//  ['{DFF41C8D-C9D7-4FC6-AB5A-23A4A7D54E86}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$1')]
//  JUsbPort_1 = interface(JBroadcastReceiver) // or JObject // SuperSignature: android/content/BroadcastReceiver
//  ['{2E280504-73AB-464F-B20E-254160A56C41}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(context: JContext; intent: JIntent); cdecl; //(Landroid/content/Context;Landroid/content/Intent;)V
//
//    { Property }
//  end;

//  TJUsbPort_1 = class(TJavaGenericImport<JUsbPort_1Class, JUsbPort_1>) end;

//  JUsbPort_2Class = interface(JObjectClass)
//  ['{DD0228C1-668B-4CAD-9A1B-A18DCB033423}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$2')]
//  JUsbPort_2 = interface(JObject)
//  ['{42E81649-6A99-4413-9DCD-C60AB6FEB090}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_2 = class(TJavaGenericImport<JUsbPort_2Class, JUsbPort_2>) end;

//  JUsbPort_3Class = interface(JObjectClass)
//  ['{1423B4AE-7F48-4E30-B290-829DD4F83503}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$3')]
//  JUsbPort_3 = interface(JObject)
//  ['{4E6B49B0-4835-45A3-B662-6923B82F8659}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_3 = class(TJavaGenericImport<JUsbPort_3Class, JUsbPort_3>) end;

//  JUsbPort_4Class = interface(JObjectClass)
//  ['{84A92371-A3B6-44CC-B450-2BE5AEFA92DE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$4')]
//  JUsbPort_4 = interface(JObject)
//  ['{EABFFB77-3471-4F1E-AADC-264ABECDBC52}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_4 = class(TJavaGenericImport<JUsbPort_4Class, JUsbPort_4>) end;

//  JUsbPort_5Class = interface(JObjectClass)
//  ['{DA0B500B-CE17-4014-98FD-38932407F9DF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$5')]
//  JUsbPort_5 = interface(JObject)
//  ['{97B8575E-E761-4B6E-BE8A-003E8CE58702}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_5 = class(TJavaGenericImport<JUsbPort_5Class, JUsbPort_5>) end;

//  JUsbPort_6Class = interface(JObjectClass)
//  ['{F8DEFC87-66B1-4949-8DEA-9226CF91E9B1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$6')]
//  JUsbPort_6 = interface(JObject)
//  ['{99E5DE3C-9B00-4DD2-91D8-D74B7DF60FD2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJUsbPort_6 = class(TJavaGenericImport<JUsbPort_6Class, JUsbPort_6>) end;

//  JUsbPort_IoReader_1Class = interface(JObjectClass)
//  ['{6AB48D5E-B599-4669-BFB4-42A2729E2B76}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$IoReader$1')]
//  JUsbPort_IoReader_1 = interface(JObject)
//  ['{A5EFAD1F-ADA5-4DE3-974C-DEF012054096}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_IoReader_1 = class(TJavaGenericImport<JUsbPort_IoReader_1Class, JUsbPort_IoReader_1>) end;

//  JUsbPort_IoReader_2Class = interface(JObjectClass)
//  ['{AE2D404B-4E6D-4E83-BD8A-F67A4070EFE8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/gprinter/io/UsbPort$IoReader$2')]
//  JUsbPort_IoReader_2 = interface(JObject)
//  ['{3FBF28EC-4FF6-47C1-AFEE-E1760D3554E8}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJUsbPort_IoReader_2 = class(TJavaGenericImport<JUsbPort_IoReader_2Class, JUsbPort_IoReader_2>) end;

  JUsbPort_IoReaderClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{82914910-E0D5-40E3-B7D8-4DA194C34021}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JUsbPort): JUsbPort_IoReader; cdecl; //(Lcom/gprinter/io/UsbPort;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/UsbPort$IoReader')]
  JUsbPort_IoReader = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{50E04BEF-643D-4719-8CD3-DAFD8604C7E3}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJUsbPort_IoReader = class(TJavaGenericImport<JUsbPort_IoReaderClass, JUsbPort_IoReader>) end;

  JUsbPortClass = interface(JPortManagerClass) // or JObjectClass // SuperSignature: com/gprinter/io/PortManager
  ['{4E49DDA6-2E1D-4F76-9EFA-7E260A113BD5}']
    { static Property Methods }

    { static Methods }
    {class} function init(devices: JPrinterDevices): JUsbPort; cdecl; overload; //(Lcom/gprinter/bean/PrinterDevices;)V
    {class} function init(context: JContext; pid: Integer; vid: Integer; callbackListener: JCallbackListener; command: JCommand): JUsbPort; cdecl; overload; //(Landroid/content/Context;IILcom/gprinter/utils/CallbackListener;Lcom/gprinter/utils/Command;)V
    {class} function ImageCrop(bitmap: JBitmap; photoheight: Integer): JList; cdecl; //(Landroid/graphics/Bitmap;I)Ljava/util/List;
    {class} function cutBitmap(bitmap: JBitmap; y: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/gprinter/io/UsbPort')]
  JUsbPort = interface(JPortManager) // or JObject // SuperSignature: com/gprinter/io/PortManager
  ['{169CC88D-0E86-4924-B162-3B121D8ECF7F}']
    { Property Methods }

    { methods }
    function openPort: Boolean; cdecl; //()Z
    procedure setCommand(command: JCommand); cdecl; //(Lcom/gprinter/utils/Command;)V
    function getPrinterDevices: JPrinterDevices; cdecl; //()Lcom/gprinter/bean/PrinterDevices;
    function getCommand: JCommand; cdecl; //()Lcom/gprinter/utils/Command;
//    function getmUsbDevice: JUsbDevice; cdecl; //()Landroid/hardware/usb/UsbDevice;
    function writePDFToEsc(afile: JFile; width: Integer): Boolean; cdecl; //(Ljava/io/File;I)Z
    function writePDFToTsc(afile: JFile; printWidth: Integer; gap: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Ljava/io/File;IIZZZI)Z
    function writeBitmapToTsc(mBitmap: JBitmap; printWidth: Integer; cut: Boolean; dpi200: Boolean; compression: Boolean; cutHeight: Integer): Boolean; cdecl; //(Landroid/graphics/Bitmap;IZZZI)Z
//    function writeDataImmediately(sendData: JVector): Boolean; cdecl; overload; //(Ljava/util/Vector;)Z
    function writeDataImmediately(data: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    function getPower: Integer; cdecl; //()I
    function getPrinterModel(command: JCommand): JString; cdecl; //(Lcom/gprinter/utils/Command;)Ljava/lang/String;
    function getKey: TJavaArray<Byte>; cdecl; //()[B
    function getPrinterStatus(command: JCommand): Integer; cdecl; //(Lcom/gprinter/utils/Command;)I
    function getConnectStatus: Boolean; cdecl; //()Z
    function readData(bytes: TJavaArray<Byte>): Integer; cdecl; //([B)I
    function closePort: Boolean; cdecl; //()Z

    { Property }
  end;

  TJUsbPort = class(TJavaGenericImport<JUsbPortClass, JUsbPort>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{8C575D55-14D4-43D0-A910-EA7FE60BDF26}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/gprinter/sdklib/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{7163C6B9-B2DD-43BC-8DE7-CD8CF5942A3B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JBitmapUtilsClass = interface(JObjectClass)
  ['{B91757BF-0F31-4A7E-BE82-867CB39CA429}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapUtils; cdecl; //()V
    {class} function addBytes(data1: TJavaArray<Byte>; data2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //([B[B)[B
    {class} function resizeImage(bitmap: JBitmap; w: Integer; h: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function resizeImageAndRotation(bitmap: JBitmap; w: Integer; h: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function getCompressedBinaryzationBytes(bitmap: JBitmap): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;)[B
    {class} function getCompressedBinaryzationBytes(bitmap: JBitmap; reverse: Boolean): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;Z)[B
    {class} function getCompressedBinaryzationBytes(bitmap: JBitmap; threshold: Integer; reverse: Boolean): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;IZ)[B
    {class} function threshold(img: JBitmap; shake: Boolean): JBitmap; cdecl; //(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    {class} function filter(src: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/BitmapUtils')]
  JBitmapUtils = interface(JObject)
  ['{DF2BC817-70A9-4781-99E6-1B6CF1C15C35}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapUtils = class(TJavaGenericImport<JBitmapUtilsClass, JBitmapUtils>) end;

  JBMPConverter_RGBTripleClass = interface(JObjectClass)
  ['{FE12CC77-E119-4434-B43B-772AAD69B742}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBMPConverter_RGBTriple; cdecl; overload; //()V
    {class} function init(R: Integer; G: Integer; B: Integer): JBMPConverter_RGBTriple; cdecl; overload; //(III)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/BMPConverter$RGBTriple')]
  JBMPConverter_RGBTriple = interface(JObject)
  ['{01794A5E-5CC5-49DE-91CE-ABA6ACB8260F}']
    { Property Methods }
    function _Getchannels: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _Setchannels(achannels: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V

    { methods }

    { Property }
    property channels: TJavaArray<Byte> read _Getchannels write _Setchannels;
  end;

  TJBMPConverter_RGBTriple = class(TJavaGenericImport<JBMPConverter_RGBTripleClass, JBMPConverter_RGBTriple>) end;

  JBMPConverterClass = interface(JObjectClass)
  ['{7434A1C9-BAFC-4325-8ABB-1B0A3670B7BE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBMPConverter; cdecl; //()V
    {class} function getPalette(deviceType: Integer): TJavaObjectArray<JBMPConverter_RGBTriple>; cdecl; //(I)[Lcom/gprinter/utils/BMPConverter$RGBTriple;
    {class} function floydSteinbergDither(image: TJavaObjectArray<JBMPConverter_RGBTriple>; palette: TJavaObjectArray<JBMPConverter_RGBTriple>): TJavaArray<TJavaArray<Byte>>; cdecl; //([[Lcom/gprinter/utils/BMPConverter$RGBTriple;[Lcom/gprinter/utils/BMPConverter$RGBTriple;)[[B

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/BMPConverter')]
  JBMPConverter = interface(JObject)
  ['{4218662E-D0A4-4CBD-AA30-EFA10159698B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBMPConverter = class(TJavaGenericImport<JBMPConverterClass, JBMPConverter>) end;

  JBMPConverterUtil_RGBTripleClass = interface(JObjectClass)
  ['{F66D7CAD-3465-435E-8CDF-15B0B84018B2}']
    { static Property Methods }

    { static Methods }
    {class} function init(R: Integer; G: Integer; B: Integer): JBMPConverterUtil_RGBTriple; cdecl; //(III)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/BMPConverterUtil$RGBTriple')]
  JBMPConverterUtil_RGBTriple = interface(JObject)
  ['{E433D324-2A65-41BB-80E9-1FBF33E36523}']
    { Property Methods }
    function _Getchannels: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _Setchannels(achannels: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V

    { methods }

    { Property }
    property channels: TJavaArray<Byte> read _Getchannels write _Setchannels;
  end;

  TJBMPConverterUtil_RGBTriple = class(TJavaGenericImport<JBMPConverterUtil_RGBTripleClass, JBMPConverterUtil_RGBTriple>) end;

  JBMPConverterUtilClass = interface(JObjectClass)
  ['{10DCAD26-DBCB-4F2C-92E1-9D986094004C}']
    { static Property Methods }
    {class} function _GetPALETTE_BW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPALETTE_BWR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPALETTE_BWY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JBMPConverterUtil; cdecl; //()V
    {class} function getPalette(deviceType: Integer): TJavaObjectArray<JBMPConverterUtil_RGBTriple>; cdecl; //(I)[Lcom/gprinter/utils/BMPConverterUtil$RGBTriple;
    {class} function floydSteinbergDither(image: TJavaObjectArray<JBMPConverterUtil_RGBTriple>; palette: TJavaObjectArray<JBMPConverterUtil_RGBTriple>): TJavaArray<TJavaArray<Byte>>; cdecl; //([[Lcom/gprinter/utils/BMPConverterUtil$RGBTriple;[Lcom/gprinter/utils/BMPConverterUtil$RGBTriple;)[[B
    {class} function floydSteinberg(bufferedImage: JBitmap; deviceType: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    { static Property }
    {class} property PALETTE_BW: Integer read _GetPALETTE_BW;
    {class} property PALETTE_BWR: Integer read _GetPALETTE_BWR;
    {class} property PALETTE_BWY: Integer read _GetPALETTE_BWY;
  end;

  [JavaSignature('com/gprinter/utils/BMPConverterUtil')]
  JBMPConverterUtil = interface(JObject)
  ['{0CF959C7-B7F5-4805-B319-C8D65A34CF9D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBMPConverterUtil = class(TJavaGenericImport<JBMPConverterUtilClass, JBMPConverterUtil>) end;

  JCallbackListenerClass = interface(JObjectClass)
  ['{C9B3EC2D-04AE-4CCB-BDE6-17979B059901}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/CallbackListener')]
  JCallbackListener = interface(IJavaInstance)
  ['{E32282EE-A9B6-451E-B20B-66D4640FEFFB}']
    { Property Methods }

    { methods }
    procedure onConnecting; cdecl; //()V
    procedure onCheckCommand; cdecl; //()V
    procedure onSuccess(P1: JPrinterDevices); cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    procedure onReceive(P1: TJavaArray<Byte>); cdecl; //([B)V
    procedure onFailure; cdecl; //()V
    procedure onDisconnect; cdecl; //()V

    { Property }
  end;

  TJCallbackListener = class(TJavaGenericImport<JCallbackListenerClass, JCallbackListener>) end;

  JCommandClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{270E55FB-1720-4CFD-B9D2-12AEE5FF9EF7}']
    { static Property Methods }
    {class} function _GetESC: JCommand;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/Command;
    {class} function _GetTSC: JCommand;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/Command;
    {class} function _GetCPCL: JCommand;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/Command;

    { static Methods }
    {class} function values: TJavaObjectArray<JCommand>; cdecl; //()[Lcom/gprinter/utils/Command;
    {class} function valueOf(name: JString): JCommand; cdecl; //(Ljava/lang/String;)Lcom/gprinter/utils/Command;

    { static Property }
    {class} property ESC: JCommand read _GetESC;
    {class} property TSC: JCommand read _GetTSC;
    {class} property CPCL: JCommand read _GetCPCL;
  end;

  [JavaSignature('com/gprinter/utils/Command')]
  JCommand = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{189054B6-BDD7-4961-80FE-7DE4E12FA659}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand = class(TJavaGenericImport<JCommandClass, JCommand>) end;

  JConnMethodClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{B6207EFB-4511-462B-B4ED-9F462A473958}']
    { static Property Methods }
    {class} function _GetBLUETOOTH: JConnMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/ConnMethod;
    {class} function _GetBLE_BLUETOOTH: JConnMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/ConnMethod;
    {class} function _GetUSB: JConnMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/ConnMethod;
    {class} function _GetWIFI: JConnMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/ConnMethod;
    {class} function _GetSERIALPORT: JConnMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/gprinter/utils/ConnMethod;

    { static Methods }
    {class} function values: TJavaObjectArray<JConnMethod>; cdecl; //()[Lcom/gprinter/utils/ConnMethod;
    {class} function valueOf(name: JString): JConnMethod; cdecl; //(Ljava/lang/String;)Lcom/gprinter/utils/ConnMethod;

    { static Property }
    {class} property BLUETOOTH: JConnMethod read _GetBLUETOOTH;
    {class} property BLE_BLUETOOTH: JConnMethod read _GetBLE_BLUETOOTH;
    {class} property USB: JConnMethod read _GetUSB;
    {class} property WIFI: JConnMethod read _GetWIFI;
    {class} property SERIALPORT: JConnMethod read _GetSERIALPORT;
  end;

  [JavaSignature('com/gprinter/utils/ConnMethod')]
  JConnMethod = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{EEC6870C-C7EA-46AA-9897-5DF6EBF8B3DC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConnMethod = class(TJavaGenericImport<JConnMethodClass, JConnMethod>) end;

  JGpUtilsClass = interface(JObjectClass)
  ['{73B2BB63-2892-493E-A803-4816D99B2BA3}']
    { static Property Methods }
    {class} function _GetPAPER_58_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPAPER_80_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetALGORITHM_DITHER_16x16: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetALGORITHM_DITHER_8x8: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetALGORITHM_TEXTMODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetALGORITHM_GRAYTEXTMODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCOLOR_PALETTE: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
    {class} function _GetFLOYD_STEINBERG_DITHER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetATKINSON_DITHER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JGpUtils; cdecl; //()V
    {class} function resizeImage(bitmap: JBitmap; w: Integer; h: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} procedure saveMyBitmap(mBitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    {class} function toGrayscale(bmpOriginal: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function pixToEscRastBitImageCmd(src: TJavaArray<Byte>; nWidth: Integer; nMode: Integer): TJavaArray<Byte>; cdecl; overload; //([BII)[B
    {class} function pixToEscRastBitImageCmd(src: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //([B)[B
    {class} function pixToEscNvBitImageCmd(src: TJavaArray<Byte>; width: Integer; height: Integer): TJavaArray<Byte>; cdecl; //([BII)[B
    {class} function pixToLabelCmd(src: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //([B)[B
    {class} function pixToTscCmd(x: Integer; y: Integer; mode: Integer; src: TJavaArray<Byte>; nWidth: Integer): TJavaArray<Byte>; cdecl; //(III[BI)[B
    {class} function bitmapToBWPix(mBitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function bitmapToBWPix2(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function bitmapToBWPix_int(mBitmap: JBitmap; algorithm: Integer): TJavaArray<Integer>; cdecl; //(Landroid/graphics/Bitmap;I)[I
    {class} function toBinaryImage(mBitmap: JBitmap; nWidth: Integer; algorithm: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function clamp(value: Integer): Integer; cdecl; //(I)I
    {class} function filter(nbm: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function printEscDraw(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function printZlibTscDraw(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function printTscDraw(x: Integer; y: Integer; mode: JLabelCommand_BITMAP_MODE; bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(IILcom/gprinter/command/LabelCommand$BITMAP_MODE;Landroid/graphics/Bitmap;)[B
    {class} function splitArabic(input: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function addSpaceAfterArabicString(arabic: JString; number: Integer): JString; cdecl; //(Ljava/lang/String;I)Ljava/lang/String;
    {class} function reverseLetterAndNumber(input: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function string2Cp864(arabicString: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} procedure setPaperWidth(paperWidth: Integer); cdecl; //(I)V
//    {class} function ByteTo_byte(vector: JVector): TJavaArray<Byte>; cdecl; //(Ljava/util/Vector;)[B
    {class} function ZlibpixToLabelCmd(src: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //([B)[B
    {class} procedure setMethod(method: Integer); cdecl; //(I)V

    { static Property }
    {class} property PAPER_58_WIDTH: Integer read _GetPAPER_58_WIDTH;
    {class} property PAPER_80_WIDTH: Integer read _GetPAPER_80_WIDTH;
    {class} property ALGORITHM_DITHER_16x16: Integer read _GetALGORITHM_DITHER_16x16;
    {class} property ALGORITHM_DITHER_8x8: Integer read _GetALGORITHM_DITHER_8x8;
    {class} property ALGORITHM_TEXTMODE: Integer read _GetALGORITHM_TEXTMODE;
    {class} property ALGORITHM_GRAYTEXTMODE: Integer read _GetALGORITHM_GRAYTEXTMODE;
    {class} property COLOR_PALETTE: TJavaArray<TJavaArray<Integer>> read _GetCOLOR_PALETTE;
    {class} property FLOYD_STEINBERG_DITHER: Integer read _GetFLOYD_STEINBERG_DITHER;
    {class} property ATKINSON_DITHER: Integer read _GetATKINSON_DITHER;
  end;

  [JavaSignature('com/gprinter/utils/GpUtils')]
  JGpUtils = interface(JObject)
  ['{74C3C791-53C1-4F22-81B7-E3B8DE0CD10B}']
    { Property Methods }

    { methods }
    function getMethod: Integer; cdecl; //()I

    { Property }
  end;

  TJGpUtils = class(TJavaGenericImport<JGpUtilsClass, JGpUtils>) end;

  JHexUtilsClass = interface(JObjectClass)
  ['{4F9332A7-8A6D-46BE-8700-65B1EE7B8531}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHexUtils; cdecl; //()V
    {class} function str2HexStr(str: JString; charSet: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function hexStr2Str(hexStr: JString; charSet: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function byte2HexStr(b: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    {class} function hexStr2Bytes(src: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} function hexStringToByte(hex: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} function strToUnicode(strText: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function unicodeToString(hex: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function encodeHex(data: TJavaArray<Byte>): TJavaArray<Char>; cdecl; overload; //([B)[C
    {class} function encodeHex(data: TJavaArray<Byte>; toLowerCase: Boolean): TJavaArray<Char>; cdecl; overload; //([BZ)[C
    {class} function encodeHexStr(data: TJavaArray<Byte>): JString; cdecl; overload; //([B)Ljava/lang/String;
    {class} function encodeHexStr(data: TJavaArray<Byte>; toLowerCase: Boolean): JString; cdecl; overload; //([BZ)Ljava/lang/String;
    {class} function decodeHex(data: TJavaArray<Char>): TJavaArray<Byte>; cdecl; //([C)[B

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/HexUtils')]
  JHexUtils = interface(JObject)
  ['{9E304D98-CD3A-4B80-8A33-1F771A12949B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHexUtils = class(TJavaGenericImport<JHexUtilsClass, JHexUtils>) end;

  JLogUtilsClass = interface(JObjectClass)
  ['{9DAC208D-20FF-4848-BFD1-FB86AD79E4F1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLogUtils; cdecl; overload; //()V
    {class} procedure init(isShowLog: Boolean); cdecl; overload; //(Z)V
    {class} procedure v; cdecl; overload; //()V
    {class} procedure v(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure v(tag: JString; msg: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure d; cdecl; overload; //()V
    {class} procedure d(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure d(tag: JString; msg: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure i; cdecl; overload; //()V
    {class} procedure i(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure i(tag: JString; msg: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure w; cdecl; overload; //()V
    {class} procedure w(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure w(tag: JString; msg: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure e; cdecl; overload; //()V
    {class} procedure e(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure e(tag: JString; msg: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure a; cdecl; overload; //()V
    {class} procedure a(msg: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    {class} procedure a(tag: JString; msg: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure json(jsonFormat: JString); cdecl; overload; //(Ljava/lang/String;)V
    {class} procedure json(tag: JString; jsonFormat: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/LogUtils')]
  JLogUtils = interface(JObject)
  ['{A2F8B660-1E6D-48B1-895A-F5475DC9D3AE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogUtils = class(TJavaGenericImport<JLogUtilsClass, JLogUtils>) end;

  JMenu58UtilsClass = interface(JObjectClass)
  ['{5DA1CCA7-8792-4C8B-A359-E9F7E30FC448}']
    { static Property Methods }
    {class} function _GetTAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JMenu58Utils; cdecl; //()V
    {class} function printTwoData(leftText: JString; rightText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function printThreeData(leftText: JString; middleText: JString; rightText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function printFourData(oneText: JString; twoText: JString; threeText: JString; fourText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function getStrList(inputString: JString; length: Integer): JList; cdecl; overload; //(Ljava/lang/String;I)Ljava/util/List;
    {class} function getStrList(inputString: JString; length: Integer; size: Integer): JList; cdecl; overload; //(Ljava/lang/String;II)Ljava/util/List;
    {class} function substring(str: JString; f: Integer; t: Integer): JString; cdecl; //(Ljava/lang/String;II)Ljava/lang/String;

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/gprinter/utils/Menu58Utils')]
  JMenu58Utils = interface(JObject)
  ['{1151C6A1-62E8-478B-9482-97424528A8F9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMenu58Utils = class(TJavaGenericImport<JMenu58UtilsClass, JMenu58Utils>) end;

  JMenu80UtilsClass = interface(JObjectClass)
  ['{95D77B17-6CB9-40D1-A465-1C2A027BE145}']
    { static Property Methods }
    {class} function _GetTAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JMenu80Utils; cdecl; //()V
    {class} function printTwoData(leftText: JString; rightText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function printThreeData(leftText: JString; middleText: JString; rightText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function printFourData(oneText: JString; twoText: JString; threeText: JString; fourText: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function getStrList(inputString: JString; length: Integer): JList; cdecl; overload; //(Ljava/lang/String;I)Ljava/util/List;
    {class} function getStrList(inputString: JString; length: Integer; size: Integer): JList; cdecl; overload; //(Ljava/lang/String;II)Ljava/util/List;
    {class} function substring(str: JString; f: Integer; t: Integer): JString; cdecl; //(Ljava/lang/String;II)Ljava/lang/String;

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/gprinter/utils/Menu80Utils')]
  JMenu80Utils = interface(JObject)
  ['{B19F01D6-9519-4C60-9FCE-30D793C687D6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMenu80Utils = class(TJavaGenericImport<JMenu80UtilsClass, JMenu80Utils>) end;

  JPDFUtilsClass = interface(JObjectClass)
  ['{2637278D-273C-427A-B940-B1B0F31E6683}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDFUtils; cdecl; //()V
    {class} function PDFToBitmap(afile: JFile; width: Integer): TJavaObjectArray<JBitmap>; cdecl; //(Ljava/io/File;I)[Landroid/graphics/Bitmap;
    {class} function drawEscPDF(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function drawTscPDF(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function drawTscPDFLib(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function addBytes(data1: TJavaArray<Byte>; data2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //([B[B)[B

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/PDFUtils')]
  JPDFUtils = interface(JObject)
  ['{4617B3B4-5365-4135-AD44-F7E99DB634C4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDFUtils = class(TJavaGenericImport<JPDFUtilsClass, JPDFUtils>) end;

  JPicFromPrintUtilsClass = interface(JObjectClass)
  ['{EFF8AAC6-B31F-4C11-B2C4-B95F8307A8F4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPicFromPrintUtils; cdecl; //()V
    {class} function draw2PxPoint(bit: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function pic2PxPoint(bitmap: JBitmap; printWidth: Integer): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;I)[B
    {class} function pic8PxPoint(bitmap: JBitmap; printWidth: Integer): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;I)[B
    {class} function px2Byte(x: Integer; y: Integer; bit: JBitmap): Byte; cdecl; //(IILandroid/graphics/Bitmap;)B
    {class} function compressPic(bitmapOrg: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function compressBitmap(bitmapOrg: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function changePointPx1(arry: TJavaArray<Byte>): Integer; cdecl; //([B)I

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/PicFromPrintUtils')]
  JPicFromPrintUtils = interface(JObject)
  ['{22B33CD0-0328-4F08-A53C-EFD730A790B0}']
    { Property Methods }

    { methods }
    function changePointPx(arry: TJavaArray<Byte>): Byte; cdecl; //([B)B
    function getPicPx(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B

    { Property }
  end;

  TJPicFromPrintUtils = class(TJavaGenericImport<JPicFromPrintUtilsClass, JPicFromPrintUtils>) end;

  JSDKUtilsClass = interface(JObjectClass)
  ['{C370A4B3-CF91-404D-BBF8-40EF2F3EAB5A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSDKUtils; cdecl; //()V
//    {class} function checkUsbDevicePidVid(dev: JUsbDevice): Boolean; cdecl; //(Landroid/hardware/usb/UsbDevice;)Z
//    {class} function convertVectorByteToBytes(data: JVector): TJavaArray<Byte>; cdecl; //(Ljava/util/Vector;)[B
    {class} function getListByteArray(bytes: TJavaArray<Byte>; counts: Integer): JList; cdecl; //([BI)Ljava/util/List;
    {class} function subBytes(src: TJavaArray<Byte>; abegin: Integer; count: Integer): TJavaArray<Byte>; cdecl; //([BII)[B
    {class} function addBytes(data1: TJavaArray<Byte>; data2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //([B[B)[B
    {class} function checkPairCode(pairCode: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    {class} function checkIP(addr: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    {class} function bytesToHexString(src: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/SDKUtils')]
  JSDKUtils = interface(JObject)
  ['{599523A7-BFEB-42F3-9D3C-38362ED52525}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSDKUtils = class(TJavaGenericImport<JSDKUtilsClass, JSDKUtils>) end;

  JSerialPortControlClass = interface(JObjectClass)
  ['{B4BF8778-8AC4-40CE-A512-24F8D34C252B}']
    { static Property Methods }

    { static Methods }
    {class} function init(device: JFile; baudrate: Integer; flags: Integer): JSerialPortControl; cdecl; //(Ljava/io/File;II)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/SerialPortControl')]
  JSerialPortControl = interface(JObject)
  ['{CC24B927-C210-4366-8020-9D6CEFB87A72}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl; //()Ljava/io/InputStream;
    function getOutputStream: JOutputStream; cdecl; //()Ljava/io/OutputStream;
    procedure close; cdecl; //()V

    { Property }
  end;

  TJSerialPortControl = class(TJavaGenericImport<JSerialPortControlClass, JSerialPortControl>) end;

  JSerialPortFinder_DriverClass = interface(JObjectClass)
  ['{D4051EDD-D1E1-4C3A-A704-289103880E54}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JSerialPortFinder; name: JString; root: JString): JSerialPortFinder_Driver; cdecl; //(Lcom/gprinter/utils/SerialPortFinder;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/SerialPortFinder$Driver')]
  JSerialPortFinder_Driver = interface(JObject)
  ['{7DA0C66F-364B-4152-B646-712C8AF541B0}']
    { Property Methods }

    { methods }
//    function getDevices: JVector; cdecl; //()Ljava/util/Vector;
    function getName: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSerialPortFinder_Driver = class(TJavaGenericImport<JSerialPortFinder_DriverClass, JSerialPortFinder_Driver>) end;

  JSerialPortFinderClass = interface(JObjectClass)
  ['{4D69A50B-51FE-4829-BA3B-40F3AE900747}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerialPortFinder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/SerialPortFinder')]
  JSerialPortFinder = interface(JObject)
  ['{878B1B59-E49A-44FF-8A37-55A40F71B965}']
    { Property Methods }

    { methods }
    function getAllDevices: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getAllDevicesPath: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;

    { Property }
  end;

  TJSerialPortFinder = class(TJavaGenericImport<JSerialPortFinderClass, JSerialPortFinder>) end;

  JUIThreadManagerClass = interface(JObjectClass)
  ['{CA58CB57-28EA-4C9C-ABCA-04B8F34D2154}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUIThreadManager; cdecl; //()V
    {class} procedure onUIThread(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    {class} procedure onNewThread(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    {class} procedure onThreadPool(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/UIThreadManager')]
  JUIThreadManager = interface(JObject)
  ['{2F74FF1C-D279-4412-80F0-949AC1037E92}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUIThreadManager = class(TJavaGenericImport<JUIThreadManagerClass, JUIThreadManager>) end;

  JWordUtilsClass = interface(JObjectClass)
  ['{EFD6ECF2-0133-4E92-96AD-6F5DF6E08E45}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWordUtils; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/WordUtils')]
  JWordUtils = interface(JObject)
  ['{A329D4E4-1063-4C6F-A832-00BFC9A18DE3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWordUtils = class(TJavaGenericImport<JWordUtilsClass, JWordUtils>) end;

  JZLibUtilsClass = interface(JObjectClass)
  ['{129E8229-15E3-46E3-AC4C-D6DF40427E10}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZLibUtils; cdecl; //()V
    {class} function zLib(bContent: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //([B)[B
    {class} function zLib(bContent: TJavaArray<Byte>; level: Integer): TJavaArray<Byte>; cdecl; overload; //([BI)[B

    { static Property }
  end;

  [JavaSignature('com/gprinter/utils/ZLibUtils')]
  JZLibUtils = interface(JObject)
  ['{7FA36EA8-D10D-4646-8039-D1CCB06AA27C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJZLibUtils = class(TJavaGenericImport<JZLibUtilsClass, JZLibUtils>) end;

//  JBase64_InputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{29D1A661-53B8-4375-B65C-FBD96DA8C897}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(var1: JInputStream): JBase64_InputStream; cdecl; overload; //(Ljava/io/InputStream;)V
//    {class} function init(var1: JInputStream; var2: Integer): JBase64_InputStream; cdecl; overload; //(Ljava/io/InputStream;I)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gprinter/zb/Base64$InputStream')]
//  JBase64_InputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{1D58493B-EC30-48DA-A4B3-A30D1FE41E5C}']
//    { Property Methods }
//
//    { methods }
//    function read: Integer; cdecl; overload; //()I
//    function read(var1: TJavaArray<Byte>; var2: Integer; var3: Integer): Integer; cdecl; overload; //([BII)I
//
//    { Property }
//  end;
//
//  TJBase64_InputStream = class(TJavaGenericImport<JBase64_InputStreamClass, JBase64_InputStream>) end;

  JBase64_OutputStreamClass = interface(JFilterOutputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterOutputStream
  ['{03F6AA22-923C-49A9-A6B5-9233B17CAAEE}']
    { static Property Methods }

    { static Methods }
    {class} function init(var1: JOutputStream): JBase64_OutputStream; cdecl; overload; //(Ljava/io/OutputStream;)V
    {class} function init(var1: JOutputStream; var2: Integer): JBase64_OutputStream; cdecl; overload; //(Ljava/io/OutputStream;I)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/Base64$OutputStream')]
  JBase64_OutputStream = interface(JFilterOutputStream) // or JObject // SuperSignature: java/io/FilterOutputStream
  ['{EAA40080-D299-4863-A8FE-1B82EC5F3810}']
    { Property Methods }

    { methods }
    procedure write(var1: Integer); cdecl; overload; //(I)V
    procedure write(var1: TJavaArray<Byte>; var2: Integer; var3: Integer); cdecl; overload; //([BII)V
    procedure flushBase64; cdecl; //()V
    procedure close; cdecl; //()V
    procedure suspendEncoding; cdecl; //()V
    procedure resumeEncoding; cdecl; //()V

    { Property }
  end;

  TJBase64_OutputStream = class(TJavaGenericImport<JBase64_OutputStreamClass, JBase64_OutputStream>) end;

  JBase64Class = interface(JObjectClass)
  ['{0D114048-76E8-413D-B81F-A97010DEED5A}']
    { static Property Methods }
    {class} function _GetNO_OPTIONS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetENCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDECODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetGZIP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDONT_BREAK_LINES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function encodeObject(var0: JSerializable): JString; cdecl; overload; //(Ljava/io/Serializable;)Ljava/lang/String;
    {class} function encodeObject(var0: JSerializable; var1: Integer): JString; cdecl; overload; //(Ljava/io/Serializable;I)Ljava/lang/String;
    {class} function encodeBytes(var0: TJavaArray<Byte>): JString; cdecl; overload; //([B)Ljava/lang/String;
    {class} function encodeBytes(var0: TJavaArray<Byte>; var1: Integer): JString; cdecl; overload; //([BI)Ljava/lang/String;
    {class} function encodeBytes(var0: TJavaArray<Byte>; var1: Integer; var2: Integer): JString; cdecl; overload; //([BII)Ljava/lang/String;
    {class} function encodeBytes(var0: TJavaArray<Byte>; var1: Integer; var2: Integer; var3: Integer): JString; cdecl; overload; //([BIII)Ljava/lang/String;
    {class} function decode(var0: TJavaArray<Byte>; var1: Integer; var2: Integer): TJavaArray<Byte>; cdecl; overload; //([BII)[B
    {class} function decode(var0: JString): TJavaArray<Byte>; cdecl; overload; //(Ljava/lang/String;)[B
    {class} function decode(var0: JString; var1: Boolean): TJavaArray<Byte>; cdecl; overload; //(Ljava/lang/String;Z)[B
    {class} function decodeToObject(var0: JString): JObject; cdecl; //(Ljava/lang/String;)Ljava/lang/Object;
    {class} function encodeToFile(var0: TJavaArray<Byte>; var1: JString): Boolean; cdecl; //([BLjava/lang/String;)Z
    {class} function decodeToFile(var0: JString; var1: JString): Boolean; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Z
    {class} function decodeFromFile(var0: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} function encodeFromFile(var0: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
    {class} property NO_OPTIONS: Integer read _GetNO_OPTIONS;
    {class} property ENCODE: Integer read _GetENCODE;
    {class} property DECODE: Integer read _GetDECODE;
    {class} property GZIP: Integer read _GetGZIP;
    {class} property DONT_BREAK_LINES: Integer read _GetDONT_BREAK_LINES;
  end;

  [JavaSignature('com/gprinter/zb/Base64')]
  JBase64 = interface(JObject)
  ['{E4C13B2F-C9AE-471F-B17A-62E8EC05664B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBase64 = class(TJavaGenericImport<JBase64Class, JBase64>) end;

  JCompressedBitmapOutputStreamAClass = interface(JOutputStreamClass) // or JObjectClass // SuperSignature: java/io/OutputStream
  ['{3DC9FCC9-4546-456C-80D4-69B4DE0C7047}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCompressedBitmapOutputStreamA; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/CompressedBitmapOutputStreamA')]
  JCompressedBitmapOutputStreamA = interface(JOutputStream) // or JObject // SuperSignature: java/io/OutputStream
  ['{FA2C43B6-C15E-4491-A659-830E9A534F66}']
    { Property Methods }

    { methods }
    procedure write(var1: Integer); cdecl; //(I)V
    procedure close; cdecl; //()V
    procedure flush; cdecl; //()V

    { Property }
  end;

  TJCompressedBitmapOutputStreamA = class(TJavaGenericImport<JCompressedBitmapOutputStreamAClass, JCompressedBitmapOutputStreamA>) end;

  JCompressedBitmapOutputStreamZplClass = interface(JCompressedBitmapOutputStreamAClass) // or JObjectClass // SuperSignature: com/gprinter/zb/CompressedBitmapOutputStreamA
  ['{90428CDE-5BED-4B51-BA3B-E07AA7D2DA4B}']
    { static Property Methods }

    { static Methods }
    {class} function init(var1: JOutputStream): JCompressedBitmapOutputStreamZpl; cdecl; //(Ljava/io/OutputStream;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/CompressedBitmapOutputStreamZpl')]
  JCompressedBitmapOutputStreamZpl = interface(JCompressedBitmapOutputStreamA) // or JObject // SuperSignature: com/gprinter/zb/CompressedBitmapOutputStreamA
  ['{45580C23-A890-4823-9718-064602166124}']
    { Property Methods }

    { methods }
    procedure write(var1: TJavaArray<Byte>); cdecl; //([B)V
    procedure flush; cdecl; //()V

    { Property }
  end;

  TJCompressedBitmapOutputStreamZpl = class(TJavaGenericImport<JCompressedBitmapOutputStreamZplClass, JCompressedBitmapOutputStreamZpl>) end;

//  JCustomGZIPInputStreamClass = interface(JInflaterInputStreamClass) // or JObjectClass // SuperSignature: java/util/zip/InflaterInputStream
//  ['{E341EFD9-8F86-4264-8A33-87E72B2C71A6}']
//    { static Property Methods }
//    {class} function _GetGZIP_MAGIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//
//    { static Methods }
//    {class} function init(var1: JInputStream; var2: Integer): JCustomGZIPInputStream; cdecl; overload; //(Ljava/io/InputStream;I)V
//    {class} function init(var1: JInputStream): JCustomGZIPInputStream; cdecl; overload; //(Ljava/io/InputStream;)V
//
//    { static Property }
//    {class} property GZIP_MAGIC: Integer read _GetGZIP_MAGIC;
//  end;
//
//  [JavaSignature('com/gprinter/zb/CustomGZIPInputStream')]
//  JCustomGZIPInputStream = interface(JInflaterInputStream) // or JObject // SuperSignature: java/util/zip/InflaterInputStream
//  ['{06981FA3-4768-4C3B-94AD-B01E9A730005}']
//    { Property Methods }
//
//    { methods }
//    function read(var1: TJavaArray<Byte>; var2: Integer; var3: Integer): Integer; cdecl; //([BII)I
//    procedure close; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJCustomGZIPInputStream = class(TJavaGenericImport<JCustomGZIPInputStreamClass, JCustomGZIPInputStream>) end;

  JDitheredImageProviderClass = interface(JObjectClass)
  ['{557CF156-4A54-43C7-964C-389F60133241}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDitheredImageProvider; cdecl; //()V
    {class} procedure getDitheredImage(Image: JZebraImageInternal; var1: JOutputStream); cdecl; //(Lcom/gprinter/zb/ZebraImageInternal;Ljava/io/OutputStream;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/DitheredImageProvider')]
  JDitheredImageProvider = interface(JObject)
  ['{219CB018-CC29-4936-95B9-B635E34CD81F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDitheredImageProvider = class(TJavaGenericImport<JDitheredImageProviderClass, JDitheredImageProvider>) end;

  JDithererClass = interface(JObjectClass)
  ['{51B2830F-2905-4B87-B2B0-DE8D3B33B549}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDitherer; cdecl; //()V
    {class} procedure writeDitheredContents(var0: JInputStream; var1: JOutputStream); cdecl; //(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    {class} function getZebraSpecificPngHeader(var0: Integer; var1: Integer): TJavaArray<Integer>; cdecl; //(II)[I
    {class} function getPixelWidthFromWidth(var0: Integer): Integer; cdecl; //(I)I

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/Ditherer')]
  JDitherer = interface(JObject)
  ['{B081390E-B911-4A6C-B20E-F385B478529B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDitherer = class(TJavaGenericImport<JDithererClass, JDitherer>) end;

  JNaughtyBitOutputStreamClass = interface(JOutputStreamClass) // or JObjectClass // SuperSignature: java/io/OutputStream
  ['{72613FFA-037D-4072-AEB0-95109609980C}']
    { static Property Methods }

    { static Methods }
    {class} function init(var1: JOutputStream): JNaughtyBitOutputStream; cdecl; //(Ljava/io/OutputStream;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/NaughtyBitOutputStream')]
  JNaughtyBitOutputStream = interface(JOutputStream) // or JObject // SuperSignature: java/io/OutputStream
  ['{26816C4F-F0E8-4591-BFE0-9EFA056B0B07}']
    { Property Methods }

    { methods }
    procedure write(var1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJNaughtyBitOutputStream = class(TJavaGenericImport<JNaughtyBitOutputStreamClass, JNaughtyBitOutputStream>) end;

  JReflectionUtilClass = interface(JObjectClass)
  ['{B59A1F38-64D7-47B0-AEF8-78390A775ADC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReflectionUtil; cdecl; //()V
    {class} function getClassesInPackage(var0: JString): JSet; cdecl; //(Ljava/lang/String;)Ljava/util/Set;
    {class} function getClassesInPackageExtending(var0: JString; var1: Jlang_Class): JSet; cdecl; //(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/Set;
    {class} function invokeZebraImageFactory_getImage(var0: JString): JZebraImageI; cdecl; overload; //(Ljava/lang/String;)Lcom/gprinter/zb/ZebraImageI;
    {class} function invokeZebraImageFactory_getImage(var0: JInputStream): JZebraImageI; cdecl; overload; //(Ljava/io/InputStream;)Lcom/gprinter/zb/ZebraImageI;

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ReflectionUtil')]
  JReflectionUtil = interface(JObject)
  ['{E5C93FB7-EEAF-4C38-8233-5FD000F3CE90}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReflectionUtil = class(TJavaGenericImport<JReflectionUtilClass, JReflectionUtil>) end;

  JZBUtilClass = interface(JObjectClass)
  ['{EEC64D98-2150-4EA1-9EA9-B585CB5B3225}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZBUtil; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZBUtil')]
  JZBUtil = interface(JObject)
  ['{8A7D4836-0538-4BBA-91B0-6ED1E925A5D0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJZBUtil = class(TJavaGenericImport<JZBUtilClass, JZBUtil>) end;

  JZebraImageAndroidClass = interface(JObjectClass)
  ['{D4A8EBE2-35E5-4F02-9119-CA00CE2DFA82}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmap: JBitmap): JZebraImageAndroid; cdecl; overload; //(Landroid/graphics/Bitmap;)V
    {class} function init(var1: JString): JZebraImageAndroid; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(var1: JInputStream): JZebraImageAndroid; cdecl; overload; //(Ljava/io/InputStream;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZebraImageAndroid')]
  JZebraImageAndroid = interface(JObject)
  ['{8564ACE6-B8DD-402F-87A0-4D7FF272F789}']
    { Property Methods }

    { methods }
    function getRow(var1: Integer): TJavaArray<Integer>; cdecl; //(I)[I
    function getHeight: Integer; cdecl; //()I
    function getWidth: Integer; cdecl; //()I
    function scaleImage(var1: Integer; var2: Integer): Boolean; cdecl; //(II)Z
    function getDitheredB64EncodedPng: TJavaArray<Byte>; cdecl; //()[B
    procedure writeDitheredPng(var1: JOutputStream); cdecl; //(Ljava/io/OutputStream;)V

    { Property }
  end;

  TJZebraImageAndroid = class(TJavaGenericImport<JZebraImageAndroidClass, JZebraImageAndroid>) end;

  JZebraImageIClass = interface(JObjectClass)
  ['{994D24DC-FFAC-4909-BEAB-D5CEF35DD122}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZebraImageI')]
  JZebraImageI = interface(IJavaInstance)
  ['{08E726CB-0C7E-4E6A-A72B-73503A419F8D}']
    { Property Methods }

    { methods }
    function getHeight: Integer; cdecl; //()I
    function getWidth: Integer; cdecl; //()I

    { Property }
  end;

  TJZebraImageI = class(TJavaGenericImport<JZebraImageIClass, JZebraImageI>) end;

  JZebraImageInternalClass = interface(JObjectClass)
  ['{E7477D69-6921-490F-AB23-350A5689A618}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZebraImageInternal')]
  JZebraImageInternal = interface(IJavaInstance)
  ['{A9F1E0D1-9346-4069-A483-5CB523CCE7E7}']
    { Property Methods }

    { methods }
    function getRow(P1: Integer): TJavaArray<Integer>; cdecl; //(I)[I
    function scaleImage(P1: Integer; P2: Integer): Boolean; cdecl; //(II)Z
    function getDitheredB64EncodedPng: TJavaArray<Byte>; cdecl; //()[B
    procedure writeDitheredPng(P1: JOutputStream); cdecl; //(Ljava/io/OutputStream;)V

    { Property }
  end;

  TJZebraImageInternal = class(TJavaGenericImport<JZebraImageInternalClass, JZebraImageInternal>) end;

  JZPLUtilities_FileObjectDetailsClass = interface(JObjectClass)
  ['{C8CC6469-47B9-4432-85DB-33129CAA30C9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZPLUtilities_FileObjectDetails; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZPLUtilities$FileObjectDetails')]
  JZPLUtilities_FileObjectDetails = interface(JObject)
  ['{3FF80920-A6ED-4916-ADD7-C76ACAB28A00}']
    { Property Methods }
    function _Getaccess: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setaccess(aaccess: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getstorage: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setstorage(astorage: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getsize: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    procedure _Setsize(asize: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V
    function _Getfree: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    procedure _Setfree(afree: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V

    { methods }

    { Property }
    property access: JString read _Getaccess write _Setaccess;
    property storage: JString read _Getstorage write _Setstorage;
    property size: Int64 read _Getsize write _Setsize;
    property free: Int64 read _Getfree write _Setfree;
  end;

  TJZPLUtilities_FileObjectDetails = class(TJavaGenericImport<JZPLUtilities_FileObjectDetailsClass, JZPLUtilities_FileObjectDetails>) end;

  JZPLUtilities_InternalCharacterFilteringOutputStreamClass = interface(JFilterOutputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterOutputStream
  ['{DCF88D12-CDF0-4584-BC53-90F1D3594432}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JZPLUtilities; var2: JOutputStream): JZPLUtilities_InternalCharacterFilteringOutputStream; cdecl; //(Lcom/gprinter/zb/ZPLUtilities;Ljava/io/OutputStream;)V

    { static Property }
  end;

  [JavaSignature('com/gprinter/zb/ZPLUtilities$InternalCharacterFilteringOutputStream')]
  JZPLUtilities_InternalCharacterFilteringOutputStream = interface(JFilterOutputStream) // or JObject // SuperSignature: java/io/FilterOutputStream
  ['{38662622-8F08-4519-8C0D-95EE324F5204}']
    { Property Methods }

    { methods }
    procedure write(var1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJZPLUtilities_InternalCharacterFilteringOutputStream = class(TJavaGenericImport<JZPLUtilities_InternalCharacterFilteringOutputStreamClass, JZPLUtilities_InternalCharacterFilteringOutputStream>) end;

  JZPLUtilitiesClass = interface(JObjectClass)
  ['{DE334E7C-0F5C-4FE8-A4A9-BB334AA960CD}']
    { static Property Methods }
    {class} function _GetZPL_INTERNAL_FORMAT_PREFIX_CHAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZPL_INTERNAL_COMMAND_PREFIX_CHAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZPL_INTERNAL_DELIMITER_CHAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZPL_INTERNAL_FORMAT_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetZPL_INTERNAL_COMMAND_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetZPL_INTERNAL_DELIMITER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_INFO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_CONFIG_LABEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_DIRECTORY_LABEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_NETWORK_CONFIG_LABEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_CALIBRATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_RESET: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_RESET_NETWORK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_RESTORE_DEFAULTS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_GET_SUPER_HOST_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPRINTER_GET_STORAGE_INFO_COMMAND: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFILE_DRIVE_INFO_SETTING_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFILE_DRIVE_LISTING_SETTING_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JZPLUtilities; cdecl; //()V
    {class} function decorateWithCommandPrefix(var0: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function decorateWithFormatPrefix(var0: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function replaceAllWithInternalDelimeter(var0: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function replaceAllWithInternalCharacters(var0: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function replaceInternalCharactersWithReadableCharacters(var0: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function replaceInternalCharactersWithReadableCharacters(var0: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //([B)[B
    {class} function getDpmm(var0: JString): Integer; cdecl; //(Ljava/lang/String;)I
    {class} function filterFileList(var0: TJavaObjectArray<JString>; var1: JString): TJavaObjectArray<JString>; cdecl; //([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    {class} function getDYPrefix(var0: Char; var1: JString; var2: Char; var3: JString; var4: Integer; var5: JString): JString; cdecl; //(CLjava/lang/String;CLjava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    {class} function isValidZplFirmware(var0: JString): Boolean; cdecl; //(Ljava/lang/String;)Z

    { static Property }
    {class} property ZPL_INTERNAL_FORMAT_PREFIX_CHAR: Integer read _GetZPL_INTERNAL_FORMAT_PREFIX_CHAR;
    {class} property ZPL_INTERNAL_COMMAND_PREFIX_CHAR: Integer read _GetZPL_INTERNAL_COMMAND_PREFIX_CHAR;
    {class} property ZPL_INTERNAL_DELIMITER_CHAR: Integer read _GetZPL_INTERNAL_DELIMITER_CHAR;
    {class} property ZPL_INTERNAL_FORMAT_PREFIX: JString read _GetZPL_INTERNAL_FORMAT_PREFIX;
    {class} property ZPL_INTERNAL_COMMAND_PREFIX: JString read _GetZPL_INTERNAL_COMMAND_PREFIX;
    {class} property ZPL_INTERNAL_DELIMITER: JString read _GetZPL_INTERNAL_DELIMITER;
    {class} property PRINTER_INFO: JString read _GetPRINTER_INFO;
    {class} property PRINTER_STATUS: JString read _GetPRINTER_STATUS;
    {class} property PRINTER_CONFIG_LABEL: JString read _GetPRINTER_CONFIG_LABEL;
    {class} property PRINTER_DIRECTORY_LABEL: JString read _GetPRINTER_DIRECTORY_LABEL;
    {class} property PRINTER_NETWORK_CONFIG_LABEL: JString read _GetPRINTER_NETWORK_CONFIG_LABEL;
    {class} property PRINTER_CALIBRATE: JString read _GetPRINTER_CALIBRATE;
    {class} property PRINTER_RESET: JString read _GetPRINTER_RESET;
    {class} property PRINTER_RESET_NETWORK: JString read _GetPRINTER_RESET_NETWORK;
    {class} property PRINTER_RESTORE_DEFAULTS: JString read _GetPRINTER_RESTORE_DEFAULTS;
    {class} property PRINTER_GET_SUPER_HOST_STATUS: JString read _GetPRINTER_GET_SUPER_HOST_STATUS;
    {class} property PRINTER_GET_STORAGE_INFO_COMMAND: JString read _GetPRINTER_GET_STORAGE_INFO_COMMAND;
    {class} property FILE_DRIVE_INFO_SETTING_NAME: JString read _GetFILE_DRIVE_INFO_SETTING_NAME;
    {class} property FILE_DRIVE_LISTING_SETTING_NAME: JString read _GetFILE_DRIVE_LISTING_SETTING_NAME;
  end;

  [JavaSignature('com/gprinter/zb/ZPLUtilities')]
  JZPLUtilities = interface(JObject)
  ['{8A09EE74-AF56-4A65-B2DE-E887DE45CA47}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJZPLUtilities = class(TJavaGenericImport<JZPLUtilitiesClass, JZPLUtilities>) end;

  JAdler32Class = interface(JObjectClass)
  ['{AB807E51-B8C6-4BCE-8395-77837E1C0B6C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAdler32; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Adler32')]
  JAdler32 = interface(JObject)
  ['{0CD9B53B-CFD9-4A51-A456-3F2751709455}']
    { Property Methods }

    { methods }
    procedure reset(init: Int64); cdecl; overload; //(J)V
    procedure reset; cdecl; overload; //()V
    function getValue: Int64; cdecl; //()J
    procedure update(buf: TJavaArray<Byte>; index: Integer; len: Integer); cdecl; //([BII)V
    function copy: JAdler32; cdecl; overload; //()Lcom/jcraft/jzlib/Adler32;
//    function copy: JChecksum; cdecl; overload; //()Lcom/jcraft/jzlib/Checksum;

    { Property }
  end;

  TJAdler32 = class(TJavaGenericImport<JAdler32Class, JAdler32>) end;

  JChecksumClass = interface(JObjectClass)
  ['{B8FB2EBA-9B28-4A85-91EA-8CF52F871A6A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Checksum')]
  JChecksum = interface(IJavaInstance)
  ['{2BD871D1-444D-41AF-8F55-2AF5C85996BB}']
    { Property Methods }

    { methods }
    procedure update(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; //([BII)V
    procedure reset; cdecl; overload; //()V
    procedure reset(P1: Int64); cdecl; overload; //(J)V
    function getValue: Int64; cdecl; //()J
    function copy: JChecksum; cdecl; //()Lcom/jcraft/jzlib/Checksum;

    { Property }
  end;

  TJChecksum = class(TJavaGenericImport<JChecksumClass, JChecksum>) end;

  JCRC32Class = interface(JObjectClass)
  ['{75FEAC21-1F83-4C68-A569-D124F106EC1F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCRC32; cdecl; //()V
    {class} function getCRC32Table: TJavaArray<Integer>; cdecl; //()[I

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/CRC32')]
  JCRC32 = interface(JObject)
  ['{F6C5228F-E304-4873-BF41-CAEC4AB0F744}']
    { Property Methods }

    { methods }
    procedure update(buf: TJavaArray<Byte>; index: Integer; len: Integer); cdecl; //([BII)V
    procedure reset; cdecl; overload; //()V
    procedure reset(vv: Int64); cdecl; overload; //(J)V
    function getValue: Int64; cdecl; //()J
    function copy: JCRC32; cdecl; overload; //()Lcom/jcraft/jzlib/CRC32;
//    function copy: JChecksum; cdecl; overload; //()Lcom/jcraft/jzlib/Checksum;

    { Property }
  end;

  TJCRC32 = class(TJavaGenericImport<JCRC32Class, JCRC32>) end;

  JDeflate_ConfigClass = interface(JObjectClass)
  ['{FC281C38-8460-4375-B3E4-4FFD3C22F51E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Deflate$Config')]
  JDeflate_Config = interface(JObject)
  ['{A479F6A4-B9FB-43F8-AB5A-0B3C49B54525}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDeflate_Config = class(TJavaGenericImport<JDeflate_ConfigClass, JDeflate_Config>) end;

  JDeflateClass = interface(JObjectClass)
  ['{B23DC0DE-57A6-4D99-BE96-A0CBD9225EFF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Deflate')]
  JDeflate = interface(JObject)
  ['{D559A0B8-FF67-4582-8C7B-EF04F5CD20A8}']
    { Property Methods }

    { methods }
    function clone: JObject; cdecl; //()Ljava/lang/Object;

    { Property }
  end;

  TJDeflate = class(TJavaGenericImport<JDeflateClass, JDeflate>) end;

//  JDeflaterClass = interface(JZStreamClass) // or JObjectClass // SuperSignature: com/jcraft/jzlib/ZStream
//  ['{6CEFEA90-DC45-4269-B34B-6514E56A7ED0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDeflater; cdecl; overload; //()V
//    {class} function init(level: Integer): JDeflater; cdecl; overload; //(I)V
//    {class} function init(level: Integer; nowrap: Boolean): JDeflater; cdecl; overload; //(IZ)V
//    {class} function init(level: Integer; bits: Integer): JDeflater; cdecl; overload; //(II)V
//    {class} function init(level: Integer; bits: Integer; nowrap: Boolean): JDeflater; cdecl; overload; //(IIZ)V
//    {class} function init(level: Integer; bits: Integer; memlevel: Integer; wrapperType: JJZlib_WrapperType): JDeflater; cdecl; overload; //(IIILcom/jcraft/jzlib/JZlib$WrapperType;)V
//    {class} function init(level: Integer; bits: Integer; memlevel: Integer): JDeflater; cdecl; overload; //(III)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/jcraft/jzlib/Deflater')]
//  JDeflater = interface(JZStream) // or JObject // SuperSignature: com/jcraft/jzlib/ZStream
//  ['{AF2CD85B-BE44-4A39-A524-DC0F4CF62FE1}']
//    { Property Methods }
//
//    { methods }
//    function init(level: Integer): Integer; cdecl; overload; //(I)I
//    function init(level: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IZ)I
//    function init(level: Integer; bits: Integer): Integer; cdecl; overload; //(II)I
//    function init(level: Integer; bits: Integer; memlevel: Integer; wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(IIILcom/jcraft/jzlib/JZlib$WrapperType;)I
//    function init(level: Integer; bits: Integer; memlevel: Integer): Integer; cdecl; overload; //(III)I
//    function init(level: Integer; bits: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IIZ)I
//    function deflate(flush: Integer): Integer; cdecl; //(I)I
//    function &end: Integer; cdecl; //()I
//    function params(level: Integer; strategy: Integer): Integer; cdecl; //(II)I
//    function setDictionary(dictionary: TJavaArray<Byte>; dictLength: Integer): Integer; cdecl; //([BI)I
//    function finished: Boolean; cdecl; //()Z
//    function copy(src: JDeflater): Integer; cdecl; //(Lcom/jcraft/jzlib/Deflater;)I
//
//    { Property }
//  end;
//
//  TJDeflater = class(TJavaGenericImport<JDeflaterClass, JDeflater>) end;

  JDeflaterOutputStreamClass = interface(JFilterOutputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterOutputStream
  ['{68B31F29-5C80-4345-8130-4AC19D395A5F}']
    { static Property Methods }

    { static Methods }
    {class} function init(aout: JOutputStream): JDeflaterOutputStream; cdecl; overload; //(Ljava/io/OutputStream;)V
//    {class} function init(aout: JOutputStream; def: JDeflater): JDeflaterOutputStream; cdecl; overload; //(Ljava/io/OutputStream;Lcom/jcraft/jzlib/Deflater;)V
//    {class} function init(aout: JOutputStream; deflater: JDeflater; size: Integer): JDeflaterOutputStream; cdecl; overload; //(Ljava/io/OutputStream;Lcom/jcraft/jzlib/Deflater;I)V
//    {class} function init(aout: JOutputStream; deflater: JDeflater; size: Integer; close_out: Boolean): JDeflaterOutputStream; cdecl; overload; //(Ljava/io/OutputStream;Lcom/jcraft/jzlib/Deflater;IZ)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/DeflaterOutputStream')]
  JDeflaterOutputStream = interface(JFilterOutputStream) // or JObject // SuperSignature: java/io/FilterOutputStream
  ['{50A0715B-86DD-4232-861B-E2551CFE0CA8}']
    { Property Methods }

    { methods }
    procedure write(b: Integer); cdecl; overload; //(I)V
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload; //([BII)V
    procedure finish; cdecl; //()V
    procedure close; cdecl; //()V
    procedure flush; cdecl; //()V
    function getTotalIn: Int64; cdecl; //()J
    function getTotalOut: Int64; cdecl; //()J
    procedure setSyncFlush(syncFlush: Boolean); cdecl; //(Z)V
    function getSyncFlush: Boolean; cdecl; //()Z
//    function getDeflater: JDeflater; cdecl; //()Lcom/jcraft/jzlib/Deflater;

    { Property }
  end;

  TJDeflaterOutputStream = class(TJavaGenericImport<JDeflaterOutputStreamClass, JDeflaterOutputStream>) end;

  JGZIPExceptionClass = interface(JIOExceptionClass) // or JObjectClass // SuperSignature: java/io/IOException
  ['{8B4C5449-935F-4A97-BD40-4223887D2049}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGZIPException; cdecl; overload; //()V
    {class} function init(s: JString): JGZIPException; cdecl; overload; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/GZIPException')]
  JGZIPException = interface(JIOException) // or JObject // SuperSignature: java/io/IOException
  ['{828F286A-4491-432E-9A49-6582A12C7A02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGZIPException = class(TJavaGenericImport<JGZIPExceptionClass, JGZIPException>) end;

  JGZIPHeaderClass = interface(JObjectClass)
  ['{543C6685-A2A6-4180-966F-FC11F9B444DB}']
    { static Property Methods }
    {class} function _GetOS_MSDOS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_AMIGA: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_VMS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_UNIX: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_ATARI: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_OS2: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_MACOS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_TOPS20: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_WIN32: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_VMCMS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_ZSYSTEM: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_CPM: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_QDOS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_RISCOS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetOS_UNKNOWN: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B

    { static Methods }
    {class} function init: JGZIPHeader; cdecl; //()V

    { static Property }
    {class} property OS_MSDOS: Byte read _GetOS_MSDOS;
    {class} property OS_AMIGA: Byte read _GetOS_AMIGA;
    {class} property OS_VMS: Byte read _GetOS_VMS;
    {class} property OS_UNIX: Byte read _GetOS_UNIX;
    {class} property OS_ATARI: Byte read _GetOS_ATARI;
    {class} property OS_OS2: Byte read _GetOS_OS2;
    {class} property OS_MACOS: Byte read _GetOS_MACOS;
    {class} property OS_TOPS20: Byte read _GetOS_TOPS20;
    {class} property OS_WIN32: Byte read _GetOS_WIN32;
    {class} property OS_VMCMS: Byte read _GetOS_VMCMS;
    {class} property OS_ZSYSTEM: Byte read _GetOS_ZSYSTEM;
    {class} property OS_CPM: Byte read _GetOS_CPM;
    {class} property OS_QDOS: Byte read _GetOS_QDOS;
    {class} property OS_RISCOS: Byte read _GetOS_RISCOS;
    {class} property OS_UNKNOWN: Byte read _GetOS_UNKNOWN;
  end;

  [JavaSignature('com/jcraft/jzlib/GZIPHeader')]
  JGZIPHeader = interface(JObject)
  ['{B3E2FA5B-764A-4DAC-99B4-C79BBF72FB5F}']
    { Property Methods }

    { methods }
    procedure setModifiedTime(mtime: Int64); cdecl; //(J)V
    function getModifiedTime: Int64; cdecl; //()J
    procedure setOS(os: Integer); cdecl; //(I)V
    function getOS: Integer; cdecl; //()I
    procedure setName(name: JString); cdecl; //(Ljava/lang/String;)V
    function getName: JString; cdecl; //()Ljava/lang/String;
    procedure setComment(comment: JString); cdecl; //(Ljava/lang/String;)V
    function getComment: JString; cdecl; //()Ljava/lang/String;
    procedure setCRC(crc: Int64); cdecl; //(J)V
    function getCRC: Int64; cdecl; //()J
    function clone: JObject; cdecl; //()Ljava/lang/Object;

    { Property }
  end;

  TJGZIPHeader = class(TJavaGenericImport<JGZIPHeaderClass, JGZIPHeader>) end;

//  JGZIPInputStreamClass = interface(JInflaterInputStreamClass) // or JObjectClass // SuperSignature: com/jcraft/jzlib/InflaterInputStream
//  ['{AA6EE745-F8D0-4A77-B1D1-3020B13428CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream): JGZIPInputStream; cdecl; overload; //(Ljava/io/InputStream;)V
//    {class} function init(ain: JInputStream; size: Integer; close_in: Boolean): JGZIPInputStream; cdecl; overload; //(Ljava/io/InputStream;IZ)V
//    {class} function init(ain: JInputStream; inflater: JInflater; size: Integer; close_in: Boolean): JGZIPInputStream; cdecl; overload; //(Ljava/io/InputStream;Lcom/jcraft/jzlib/Inflater;IZ)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/jcraft/jzlib/GZIPInputStream')]
//  JGZIPInputStream = interface(JInflaterInputStream) // or JObject // SuperSignature: com/jcraft/jzlib/InflaterInputStream
//  ['{A3214F0A-D00A-4090-B75A-A03B6C7D7B63}']
//    { Property Methods }
//
//    { methods }
//    function getModifiedtime: Int64; cdecl; //()J
//    function getOS: Integer; cdecl; //()I
//    function getName: JString; cdecl; //()Ljava/lang/String;
//    function getComment: JString; cdecl; //()Ljava/lang/String;
//    function getCRC: Int64; cdecl; //()J
//    procedure readHeader; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJGZIPInputStream = class(TJavaGenericImport<JGZIPInputStreamClass, JGZIPInputStream>) end;

  JGZIPOutputStreamClass = interface(JDeflaterOutputStreamClass) // or JObjectClass // SuperSignature: com/jcraft/jzlib/DeflaterOutputStream
  ['{80F641CE-623E-423D-882E-F66511CA844C}']
    { static Property Methods }

    { static Methods }
    {class} function init(aout: JOutputStream): JGZIPOutputStream; cdecl; overload; //(Ljava/io/OutputStream;)V
    {class} function init(aout: JOutputStream; size: Integer): JGZIPOutputStream; cdecl; overload; //(Ljava/io/OutputStream;I)V
    {class} function init(aout: JOutputStream; size: Integer; close_out: Boolean): JGZIPOutputStream; cdecl; overload; //(Ljava/io/OutputStream;IZ)V
//    {class} function init(aout: JOutputStream; deflater: JDeflater; size: Integer; close_out: Boolean): JGZIPOutputStream; cdecl; overload; //(Ljava/io/OutputStream;Lcom/jcraft/jzlib/Deflater;IZ)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/GZIPOutputStream')]
  JGZIPOutputStream = interface(JDeflaterOutputStream) // or JObject // SuperSignature: com/jcraft/jzlib/DeflaterOutputStream
  ['{1AA04B99-F6F1-4015-955B-6C8E7FACFEF9}']
    { Property Methods }

    { methods }
    procedure setModifiedTime(mtime: Int64); cdecl; //(J)V
    procedure setOS(os: Integer); cdecl; //(I)V
    procedure setName(name: JString); cdecl; //(Ljava/lang/String;)V
    procedure setComment(comment: JString); cdecl; //(Ljava/lang/String;)V
    function getCRC: Int64; cdecl; //()J

    { Property }
  end;

  TJGZIPOutputStream = class(TJavaGenericImport<JGZIPOutputStreamClass, JGZIPOutputStream>) end;

  JInfBlocksClass = interface(JObjectClass)
  ['{781001A3-249F-4601-8B64-A43AE21A01E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/InfBlocks')]
  JInfBlocks = interface(JObject)
  ['{552B1FFB-37F2-405B-81FA-A3C484ECD86B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInfBlocks = class(TJavaGenericImport<JInfBlocksClass, JInfBlocks>) end;

  JInfCodesClass = interface(JObjectClass)
  ['{348FDE9C-C115-441D-B694-9B4E2CAA4CCB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/InfCodes')]
  JInfCodes = interface(JObject)
  ['{AE0FB9B5-838D-4C5C-8E27-409641CCBB43}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInfCodes = class(TJavaGenericImport<JInfCodesClass, JInfCodes>) end;

  JInflate_ReturnClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{D0A3DED9-98E8-460F-AE23-38FEF201807D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Inflate$Return')]
  JInflate_Return = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{3DC92036-B235-482A-9166-8088FBF740D4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInflate_Return = class(TJavaGenericImport<JInflate_ReturnClass, JInflate_Return>) end;

  JInflateClass = interface(JObjectClass)
  ['{0D2324B4-3A73-48FC-8BEA-ABA99DBC7DBE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Inflate')]
  JInflate = interface(JObject)
  ['{6E4D2AD0-C626-46DF-8AB3-604ECAC62140}']
    { Property Methods }

    { methods }
    function getGZIPHeader: JGZIPHeader; cdecl; //()Lcom/jcraft/jzlib/GZIPHeader;

    { Property }
  end;

  TJInflate = class(TJavaGenericImport<JInflateClass, JInflate>) end;

//  JInflaterClass = interface(JZStreamClass) // or JObjectClass // SuperSignature: com/jcraft/jzlib/ZStream
//  ['{F433FDA6-96DD-453E-B702-D6E00840D911}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JInflater; cdecl; overload; //()V
//    {class} function init(wrapperType: JJZlib_WrapperType): JInflater; cdecl; overload; //(Lcom/jcraft/jzlib/JZlib$WrapperType;)V
//    {class} function init(w: Integer; wrapperType: JJZlib_WrapperType): JInflater; cdecl; overload; //(ILcom/jcraft/jzlib/JZlib$WrapperType;)V
//    {class} function init(w: Integer): JInflater; cdecl; overload; //(I)V
//    {class} function init(nowrap: Boolean): JInflater; cdecl; overload; //(Z)V
//    {class} function init(w: Integer; nowrap: Boolean): JInflater; cdecl; overload; //(IZ)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/jcraft/jzlib/Inflater')]
//  JInflater = interface(JZStream) // or JObject // SuperSignature: com/jcraft/jzlib/ZStream
//  ['{68226B0F-8760-45FD-8AEB-5F8585AE3455}']
//    { Property Methods }
//
//    { methods }
//    function init: Integer; cdecl; overload; //()I
//    function init(wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(Lcom/jcraft/jzlib/JZlib$WrapperType;)I
//    function init(w: Integer; wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(ILcom/jcraft/jzlib/JZlib$WrapperType;)I
//    function init(nowrap: Boolean): Integer; cdecl; overload; //(Z)I
//    function init(w: Integer): Integer; cdecl; overload; //(I)I
//    function init(w: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IZ)I
//    function inflate(f: Integer): Integer; cdecl; //(I)I
//    function &end: Integer; cdecl; //()I
//    function sync: Integer; cdecl; //()I
//    function syncPoint: Integer; cdecl; //()I
//    function setDictionary(dictionary: TJavaArray<Byte>; dictLength: Integer): Integer; cdecl; //([BI)I
//    function finished: Boolean; cdecl; //()Z
//
//    { Property }
//  end;
//
//  TJInflater = class(TJavaGenericImport<JInflaterClass, JInflater>) end;
//
//  JInflaterInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{2F60A38D-2D8E-4A7E-802E-5C6BC01F5BD6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream): JInflaterInputStream; cdecl; overload; //(Ljava/io/InputStream;)V
//    {class} function init(ain: JInputStream; nowrap: Boolean): JInflaterInputStream; cdecl; overload; //(Ljava/io/InputStream;Z)V
//    {class} function init(ain: JInputStream; inflater: JInflater): JInflaterInputStream; cdecl; overload; //(Ljava/io/InputStream;Lcom/jcraft/jzlib/Inflater;)V
//    {class} function init(ain: JInputStream; inflater: JInflater; size: Integer): JInflaterInputStream; cdecl; overload; //(Ljava/io/InputStream;Lcom/jcraft/jzlib/Inflater;I)V
//    {class} function init(ain: JInputStream; inflater: JInflater; size: Integer; close_in: Boolean): JInflaterInputStream; cdecl; overload; //(Ljava/io/InputStream;Lcom/jcraft/jzlib/Inflater;IZ)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/jcraft/jzlib/InflaterInputStream')]
//  JInflaterInputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{D0BE6357-404D-4EF8-B12B-92B22EE78A85}']
//    { Property Methods }
//
//    { methods }
//    function read: Integer; cdecl; overload; //()I
//    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload; //([BII)I
//    function available: Integer; cdecl; //()I
//    function skip(n: Int64): Int64; cdecl; //(J)J
//    procedure close; cdecl; //()V
//    function markSupported: Boolean; cdecl; //()Z
//    procedure mark(readlimit: Integer); cdecl; //(I)V
//    procedure reset; cdecl; //()V
//    function getTotalIn: Int64; cdecl; //()J
//    function getTotalOut: Int64; cdecl; //()J
//    function getAvailIn: TJavaArray<Byte>; cdecl; //()[B
//    procedure readHeader; cdecl; //()V
//    function getInflater: JInflater; cdecl; //()Lcom/jcraft/jzlib/Inflater;
//
//    { Property }
//  end;
//
//  TJInflaterInputStream = class(TJavaGenericImport<JInflaterInputStreamClass, JInflaterInputStream>) end;

  JInfTreeClass = interface(JObjectClass)
  ['{DDC67D77-D6FA-4113-99AA-93C2D24BCD5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/InfTree')]
  JInfTree = interface(JObject)
  ['{2745F2EF-D7F7-413B-86CF-F753A97D5462}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInfTree = class(TJavaGenericImport<JInfTreeClass, JInfTree>) end;

  JJZlib_WrapperTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{3F0D2291-3BEE-4968-BE97-F1E20E69CFBD}']
    { static Property Methods }
    {class} function _GetNONE: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetZLIB: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetGZIP: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetANY: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;

    { static Methods }
    {class} function values: TJavaObjectArray<JJZlib_WrapperType>; cdecl; //()[Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function valueOf(P1: JString): JJZlib_WrapperType; cdecl; //(Ljava/lang/String;)Lcom/jcraft/jzlib/JZlib$WrapperType;

    { static Property }
    {class} property NONE: JJZlib_WrapperType read _GetNONE;
    {class} property ZLIB: JJZlib_WrapperType read _GetZLIB;
    {class} property GZIP: JJZlib_WrapperType read _GetGZIP;
    {class} property ANY: JJZlib_WrapperType read _GetANY;
  end;

  [JavaSignature('com/jcraft/jzlib/JZlib$WrapperType')]
  JJZlib_WrapperType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{D4AB0819-C9A1-41BD-99F5-DEDC3B0EBC8E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJZlib_WrapperType = class(TJavaGenericImport<JJZlib_WrapperTypeClass, JJZlib_WrapperType>) end;

  JJZlibClass = interface(JObjectClass)
  ['{FCC42E55-CE23-4B3F-8BAF-8D016DF742DC}']
    { static Property Methods }
    {class} function _GetMAX_WBITS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEF_WBITS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetW_NONE: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetW_ZLIB: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetW_GZIP: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetW_ANY: JJZlib_WrapperType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/jcraft/jzlib/JZlib$WrapperType;
    {class} function _GetZ_NO_COMPRESSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_BEST_SPEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_BEST_COMPRESSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_DEFAULT_COMPRESSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_FILTERED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_HUFFMAN_ONLY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_DEFAULT_STRATEGY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_NO_FLUSH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_PARTIAL_FLUSH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_SYNC_FLUSH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_FULL_FLUSH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_FINISH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_OK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_STREAM_END: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_NEED_DICT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_ERRNO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_STREAM_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_DATA_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_MEM_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_BUF_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_VERSION_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetZ_BINARY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetZ_ASCII: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetZ_UNKNOWN: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B

    { static Methods }
    {class} function init: JJZlib; cdecl; //()V
    {class} function version: JString; cdecl; //()Ljava/lang/String;
    {class} function adler32_combine(adler1: Int64; adler2: Int64; P3: Int64): Int64; cdecl; //(JJJ)J
    {class} function crc32_combine(crc1: Int64; crc2: Int64; P3: Int64): Int64; cdecl; //(JJJ)J

    { static Property }
    {class} property MAX_WBITS: Integer read _GetMAX_WBITS;
    {class} property DEF_WBITS: Integer read _GetDEF_WBITS;
    {class} property W_NONE: JJZlib_WrapperType read _GetW_NONE;
    {class} property W_ZLIB: JJZlib_WrapperType read _GetW_ZLIB;
    {class} property W_GZIP: JJZlib_WrapperType read _GetW_GZIP;
    {class} property W_ANY: JJZlib_WrapperType read _GetW_ANY;
    {class} property Z_NO_COMPRESSION: Integer read _GetZ_NO_COMPRESSION;
    {class} property Z_BEST_SPEED: Integer read _GetZ_BEST_SPEED;
    {class} property Z_BEST_COMPRESSION: Integer read _GetZ_BEST_COMPRESSION;
    {class} property Z_DEFAULT_COMPRESSION: Integer read _GetZ_DEFAULT_COMPRESSION;
    {class} property Z_FILTERED: Integer read _GetZ_FILTERED;
    {class} property Z_HUFFMAN_ONLY: Integer read _GetZ_HUFFMAN_ONLY;
    {class} property Z_DEFAULT_STRATEGY: Integer read _GetZ_DEFAULT_STRATEGY;
    {class} property Z_NO_FLUSH: Integer read _GetZ_NO_FLUSH;
    {class} property Z_PARTIAL_FLUSH: Integer read _GetZ_PARTIAL_FLUSH;
    {class} property Z_SYNC_FLUSH: Integer read _GetZ_SYNC_FLUSH;
    {class} property Z_FULL_FLUSH: Integer read _GetZ_FULL_FLUSH;
    {class} property Z_FINISH: Integer read _GetZ_FINISH;
    {class} property Z_OK: Integer read _GetZ_OK;
    {class} property Z_STREAM_END: Integer read _GetZ_STREAM_END;
    {class} property Z_NEED_DICT: Integer read _GetZ_NEED_DICT;
    {class} property Z_ERRNO: Integer read _GetZ_ERRNO;
    {class} property Z_STREAM_ERROR: Integer read _GetZ_STREAM_ERROR;
    {class} property Z_DATA_ERROR: Integer read _GetZ_DATA_ERROR;
    {class} property Z_MEM_ERROR: Integer read _GetZ_MEM_ERROR;
    {class} property Z_BUF_ERROR: Integer read _GetZ_BUF_ERROR;
    {class} property Z_VERSION_ERROR: Integer read _GetZ_VERSION_ERROR;
    {class} property Z_BINARY: Byte read _GetZ_BINARY;
    {class} property Z_ASCII: Byte read _GetZ_ASCII;
    {class} property Z_UNKNOWN: Byte read _GetZ_UNKNOWN;
  end;

  [JavaSignature('com/jcraft/jzlib/JZlib')]
  JJZlib = interface(JObject)
  ['{2FB4111B-6E11-4C41-90F9-FF8967C816E0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJZlib = class(TJavaGenericImport<JJZlibClass, JJZlib>) end;

  JStaticTreeClass = interface(JObjectClass)
  ['{894FA7DA-0FF4-4049-BA7C-49999FCD05F3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/StaticTree')]
  JStaticTree = interface(JObject)
  ['{CEE3D722-3F58-478F-AA23-8BA53853DC68}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStaticTree = class(TJavaGenericImport<JStaticTreeClass, JStaticTree>) end;

  JTreeClass = interface(JObjectClass)
  ['{1D3A0079-0DEB-414C-83A0-38A6AD6E702E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/Tree')]
  JTree = interface(JObject)
  ['{CAC0A6F3-A9E1-4636-8A47-F813EC0E8B00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTree = class(TJavaGenericImport<JTreeClass, JTree>) end;

//  JZInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{8DD18E39-B393-454A-AAB9-B0BE9A4C6F39}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream): JZInputStream; cdecl; overload; //(Ljava/io/InputStream;)V
//    {class} function init(ain: JInputStream; nowrap: Boolean): JZInputStream; cdecl; overload; //(Ljava/io/InputStream;Z)V
//    {class} function init(ain: JInputStream; level: Integer): JZInputStream; cdecl; overload; //(Ljava/io/InputStream;I)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/jcraft/jzlib/ZInputStream')]
//  JZInputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{064A0525-B634-4540-8F9F-585B4A94380B}']
//    { Property Methods }
//
//    { methods }
//    function read: Integer; cdecl; overload; //()I
//    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload; //([BII)I
//    function skip(n: Int64): Int64; cdecl; //(J)J
//    function getFlushMode: Integer; cdecl; //()I
//    procedure setFlushMode(flush: Integer); cdecl; //(I)V
//    function getTotalIn: Int64; cdecl; //()J
//    function getTotalOut: Int64; cdecl; //()J
//    procedure close; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJZInputStream = class(TJavaGenericImport<JZInputStreamClass, JZInputStream>) end;

  JZOutputStreamClass = interface(JFilterOutputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterOutputStream
  ['{E378EDE6-C213-4FA1-9066-BE68FB39A8D9}']
    { static Property Methods }

    { static Methods }
    {class} function init(aout: JOutputStream): JZOutputStream; cdecl; overload; //(Ljava/io/OutputStream;)V
    {class} function init(aout: JOutputStream; level: Integer): JZOutputStream; cdecl; overload; //(Ljava/io/OutputStream;I)V
    {class} function init(aout: JOutputStream; level: Integer; nowrap: Boolean): JZOutputStream; cdecl; overload; //(Ljava/io/OutputStream;IZ)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/ZOutputStream')]
  JZOutputStream = interface(JFilterOutputStream) // or JObject // SuperSignature: java/io/FilterOutputStream
  ['{9A6C33A9-7F01-4D05-A44E-EFF9600E9FF2}']
    { Property Methods }

    { methods }
    procedure write(b: Integer); cdecl; overload; //(I)V
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload; //([BII)V
    function getFlushMode: Integer; cdecl; //()I
    procedure setFlushMode(flush: Integer); cdecl; //(I)V
    procedure finish; cdecl; //()V
    procedure &end; cdecl; //()V
    procedure close; cdecl; //()V
    function getTotalIn: Int64; cdecl; //()J
    function getTotalOut: Int64; cdecl; //()J
    procedure flush; cdecl; //()V

    { Property }
  end;

  TJZOutputStream = class(TJavaGenericImport<JZOutputStreamClass, JZOutputStream>) end;

  JZStreamClass = interface(JObjectClass)
  ['{FB165C65-E970-40E4-9E82-A5C034098314}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZStream; cdecl; overload; //()V
    {class} function init(adler: JChecksum): JZStream; cdecl; overload; //(Lcom/jcraft/jzlib/Checksum;)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/ZStream')]
  JZStream = interface(JObject)
  ['{33AB8EC5-419D-4025-8A35-82483C411FD9}']
    { Property Methods }
    function _Getnext_in: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _Setnext_in(anext_in: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V
    function _Getnext_in_index: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setnext_in_index(anext_in_index: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getavail_in: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setavail_in(aavail_in: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Gettotal_in: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    procedure _Settotal_in(atotal_in: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V
    function _Getnext_out: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _Setnext_out(anext_out: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V
    function _Getnext_out_index: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setnext_out_index(anext_out_index: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getavail_out: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setavail_out(aavail_out: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Gettotal_out: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    procedure _Settotal_out(atotal_out: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(J)V
    function _Getmsg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setmsg(amsg: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function inflateInit: Integer; cdecl; overload; //()I
    function inflateInit(nowrap: Boolean): Integer; cdecl; overload; //(Z)I
    function inflateInit(w: Integer): Integer; cdecl; overload; //(I)I
    function inflateInit(wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(Lcom/jcraft/jzlib/JZlib$WrapperType;)I
    function inflateInit(w: Integer; wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(ILcom/jcraft/jzlib/JZlib$WrapperType;)I
    function inflateInit(w: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IZ)I
    function inflate(f: Integer): Integer; cdecl; //(I)I
    function inflateEnd: Integer; cdecl; //()I
    function inflateSync: Integer; cdecl; //()I
    function inflateSyncPoint: Integer; cdecl; //()I
    function inflateSetDictionary(dictionary: TJavaArray<Byte>; dictLength: Integer): Integer; cdecl; //([BI)I
    function inflateFinished: Boolean; cdecl; //()Z
    function deflateInit(level: Integer): Integer; cdecl; overload; //(I)I
    function deflateInit(level: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IZ)I
    function deflateInit(level: Integer; bits: Integer): Integer; cdecl; overload; //(II)I
    function deflateInit(level: Integer; bits: Integer; memlevel: Integer; wrapperType: JJZlib_WrapperType): Integer; cdecl; overload; //(IIILcom/jcraft/jzlib/JZlib$WrapperType;)I
    function deflateInit(level: Integer; bits: Integer; memlevel: Integer): Integer; cdecl; overload; //(III)I
    function deflateInit(level: Integer; bits: Integer; nowrap: Boolean): Integer; cdecl; overload; //(IIZ)I
    function deflate(flush: Integer): Integer; cdecl; //(I)I
    function deflateEnd: Integer; cdecl; //()I
    function deflateParams(level: Integer; strategy: Integer): Integer; cdecl; //(II)I
    function deflateSetDictionary(dictionary: TJavaArray<Byte>; dictLength: Integer): Integer; cdecl; //([BI)I
    function getAdler: Int64; cdecl; //()J
    procedure free; cdecl; //()V
    procedure setOutput(buf: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure setOutput(buf: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload; //([BII)V
    procedure setInput(buf: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure setInput(buf: TJavaArray<Byte>; append: Boolean); cdecl; overload; //([BZ)V
    procedure setInput(buf: TJavaArray<Byte>; off: Integer; len: Integer; append: Boolean); cdecl; overload; //([BIIZ)V
    function getNextIn: TJavaArray<Byte>; cdecl; //()[B
    procedure setNextIn(next_in: TJavaArray<Byte>); cdecl; //([B)V
    function getNextInIndex: Integer; cdecl; //()I
    procedure setNextInIndex(next_in_index: Integer); cdecl; //(I)V
    function getAvailIn: Integer; cdecl; //()I
    procedure setAvailIn(avail_in: Integer); cdecl; //(I)V
    function getNextOut: TJavaArray<Byte>; cdecl; //()[B
    procedure setNextOut(next_out: TJavaArray<Byte>); cdecl; //([B)V
    function getNextOutIndex: Integer; cdecl; //()I
    procedure setNextOutIndex(next_out_index: Integer); cdecl; //(I)V
    function getAvailOut: Integer; cdecl; //()I
    procedure setAvailOut(avail_out: Integer); cdecl; //(I)V
    function getTotalOut: Int64; cdecl; //()J
    function getTotalIn: Int64; cdecl; //()J
    function getMessage: JString; cdecl; //()Ljava/lang/String;
    function &end: Integer; cdecl; //()I
    function finished: Boolean; cdecl; //()Z

    { Property }
    property next_in: TJavaArray<Byte> read _Getnext_in write _Setnext_in;
    property next_in_index: Integer read _Getnext_in_index write _Setnext_in_index;
    property avail_in: Integer read _Getavail_in write _Setavail_in;
    property total_in: Int64 read _Gettotal_in write _Settotal_in;
    property next_out: TJavaArray<Byte> read _Getnext_out write _Setnext_out;
    property next_out_index: Integer read _Getnext_out_index write _Setnext_out_index;
    property avail_out: Integer read _Getavail_out write _Setavail_out;
    property total_out: Int64 read _Gettotal_out write _Settotal_out;
    property msg: JString read _Getmsg write _Setmsg;
  end;

  TJZStream = class(TJavaGenericImport<JZStreamClass, JZStream>) end;

  JZStreamExceptionClass = interface(JIOExceptionClass) // or JObjectClass // SuperSignature: java/io/IOException
  ['{1CBE602E-AF68-40FB-8700-27382FDFCA1E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JZStreamException; cdecl; overload; //()V
    {class} function init(s: JString): JZStreamException; cdecl; overload; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/jcraft/jzlib/ZStreamException')]
  JZStreamException = interface(JIOException) // or JObject // SuperSignature: java/io/IOException
  ['{80BAD99B-1183-49C3-B225-53AAC2124D80}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJZStreamException = class(TJavaGenericImport<JZStreamExceptionClass, JZStreamException>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPrinterDevices_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JPrinterDevices_1));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPrinterDevices_Build',
//    TypeInfo(Androidapi.JNI.SDKLib.JPrinterDevices_Build));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPrinterDevices',
//    TypeInfo(Androidapi.JNI.SDKLib.JPrinterDevices));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_1));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_ALIGNMENT',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_ALIGNMENT));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_BARCODERATIO',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_BARCODERATIO));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_BOLD',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_BOLD));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_COMMAND',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_COMMAND));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_COUNTRY',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_COUNTRY));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_CPCLBARCODETYPE',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_CPCLBARCODETYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_CPCLSPEED',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_CPCLSPEED));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_TEXTFONT',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_TEXTFONT));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand_TEXT_FONT',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand_TEXT_FONT));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCpclCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JCpclCommand));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_CHARACTER_SET',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_CHARACTER_SET));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_CODEPAGE',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_CODEPAGE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_ENABLE',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_ENABLE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_FONT',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_FONT));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_HEIGHT_ZOOM',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_HEIGHT_ZOOM));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_HRI_POSITION',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_HRI_POSITION));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_JUSTIFICATION',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_JUSTIFICATION));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_STATUS',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_STATUS));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_UNDERLINE_MODE',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_UNDERLINE_MODE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand_WIDTH_ZOOM',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand_WIDTH_ZOOM));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEscCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JEscCommand));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGsCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JGsCommand));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_BARCODETYPE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_BARCODETYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_BITMAP_MODE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_BITMAP_MODE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_CODEPAGE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_CODEPAGE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_DENSITY',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_DENSITY));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_DIRECTION',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_DIRECTION));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_EEC',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_EEC));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_ENABLE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_ENABLE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_FONTMUL',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_FONTMUL));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_FONTTYPE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_FONTTYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_FOOT',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_FOOT));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_MIRROR',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_MIRROR));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_READABEL',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_READABEL));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_RESPONSE_MODE',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_RESPONSE_MODE));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_ROTATION',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_ROTATION));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_Shape',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_Shape));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand_SPEED',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand_SPEED));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLabelCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JLabelCommand));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Code128Mode',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Code128Mode));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_CodeMark',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_CodeMark));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_EC',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_EC));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Font',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Font));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Identifier',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Identifier));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Mode',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Mode));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Rotation',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Rotation));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_Scale',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_Scale));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand_StartCharacter',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand_StartCharacter));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLCommand));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_3));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_4',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_4));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_5',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_5));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_6',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_6));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_7',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_7));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_2_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_2_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback_3));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback',
//    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort_BleGattCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBleBlueToothPort',
//    TypeInfo(Androidapi.JNI.SDKLib.JBleBlueToothPort));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_3));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_4',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_4));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_5',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_5));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_6',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_6));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_7',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_7));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_IoReader_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_IoReader_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_IoReader_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_IoReader_2));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort_IoReader',
//    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort_IoReader));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBluetoothPort',
//    TypeInfo(Androidapi.JNI.SDKLib.JBluetoothPort));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_3));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_4',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_4));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_5',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_5));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_6',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_6));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_7',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_7));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_8',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_8));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_IoReader_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_IoReader_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_IoReader_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_IoReader_2));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_IoReader',
//    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_IoReader));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_PingReader_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_PingReader_1));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort_PingReader',
//    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort_PingReader));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JEthernetPort',
//    TypeInfo(Androidapi.JNI.SDKLib.JEthernetPort));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPortManager',
//    TypeInfo(Androidapi.JNI.SDKLib.JPortManager));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_3));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_4',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_4));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_5',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_5));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_IoReader_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_IoReader_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_IoReader_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_IoReader_2));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort_IoReader',
//    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort_IoReader));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPort',
//    TypeInfo(Androidapi.JNI.SDKLib.JSerialPort));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_1_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_1_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_1_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_1_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_2));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_3',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_3));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_4',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_4));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_5',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_5));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_6',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_6));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_IoReader_1',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_IoReader_1));
////  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_IoReader_2',
////    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_IoReader_2));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort_IoReader',
//    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort_IoReader));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUsbPort',
//    TypeInfo(Androidapi.JNI.SDKLib.JUsbPort));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBuildConfig',
//    TypeInfo(Androidapi.JNI.SDKLib.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBitmapUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JBitmapUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBMPConverter_RGBTriple',
//    TypeInfo(Androidapi.JNI.SDKLib.JBMPConverter_RGBTriple));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBMPConverter',
//    TypeInfo(Androidapi.JNI.SDKLib.JBMPConverter));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBMPConverterUtil_RGBTriple',
//    TypeInfo(Androidapi.JNI.SDKLib.JBMPConverterUtil_RGBTriple));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBMPConverterUtil',
//    TypeInfo(Androidapi.JNI.SDKLib.JBMPConverterUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCallbackListener',
//    TypeInfo(Androidapi.JNI.SDKLib.JCallbackListener));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCommand',
//    TypeInfo(Androidapi.JNI.SDKLib.JCommand));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JConnMethod',
//    TypeInfo(Androidapi.JNI.SDKLib.JConnMethod));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGpUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JGpUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JHexUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JHexUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JLogUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JLogUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JMenu58Utils',
//    TypeInfo(Androidapi.JNI.SDKLib.JMenu58Utils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JMenu80Utils',
//    TypeInfo(Androidapi.JNI.SDKLib.JMenu80Utils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPDFUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JPDFUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JPicFromPrintUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JPicFromPrintUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSDKUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JSDKUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPortControl',
//    TypeInfo(Androidapi.JNI.SDKLib.JSerialPortControl));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPortFinder_Driver',
//    TypeInfo(Androidapi.JNI.SDKLib.JSerialPortFinder_Driver));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JSerialPortFinder',
//    TypeInfo(Androidapi.JNI.SDKLib.JSerialPortFinder));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JUIThreadManager',
//    TypeInfo(Androidapi.JNI.SDKLib.JUIThreadManager));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JWordUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JWordUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZLibUtils',
//    TypeInfo(Androidapi.JNI.SDKLib.JZLibUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBase64_InputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JBase64_InputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBase64_OutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JBase64_OutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JBase64',
//    TypeInfo(Androidapi.JNI.SDKLib.JBase64));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCompressedBitmapOutputStreamA',
//    TypeInfo(Androidapi.JNI.SDKLib.JCompressedBitmapOutputStreamA));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCompressedBitmapOutputStreamZpl',
//    TypeInfo(Androidapi.JNI.SDKLib.JCompressedBitmapOutputStreamZpl));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCustomGZIPInputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JCustomGZIPInputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDitheredImageProvider',
//    TypeInfo(Androidapi.JNI.SDKLib.JDitheredImageProvider));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDitherer',
//    TypeInfo(Androidapi.JNI.SDKLib.JDitherer));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JNaughtyBitOutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JNaughtyBitOutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JReflectionUtil',
//    TypeInfo(Androidapi.JNI.SDKLib.JReflectionUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZBUtil',
//    TypeInfo(Androidapi.JNI.SDKLib.JZBUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZebraImageAndroid',
//    TypeInfo(Androidapi.JNI.SDKLib.JZebraImageAndroid));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZebraImageI',
//    TypeInfo(Androidapi.JNI.SDKLib.JZebraImageI));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZebraImageInternal',
//    TypeInfo(Androidapi.JNI.SDKLib.JZebraImageInternal));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLUtilities_FileObjectDetails',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLUtilities_FileObjectDetails));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLUtilities_InternalCharacterFilteringOutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLUtilities_InternalCharacterFilteringOutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZPLUtilities',
//    TypeInfo(Androidapi.JNI.SDKLib.JZPLUtilities));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JAdler32',
//    TypeInfo(Androidapi.JNI.SDKLib.JAdler32));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JChecksum',
//    TypeInfo(Androidapi.JNI.SDKLib.JChecksum));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JCRC32',
//    TypeInfo(Androidapi.JNI.SDKLib.JCRC32));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDeflate_Config',
//    TypeInfo(Androidapi.JNI.SDKLib.JDeflate_Config));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDeflate',
//    TypeInfo(Androidapi.JNI.SDKLib.JDeflate));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDeflater',
//    TypeInfo(Androidapi.JNI.SDKLib.JDeflater));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JDeflaterOutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JDeflaterOutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGZIPException',
//    TypeInfo(Androidapi.JNI.SDKLib.JGZIPException));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGZIPHeader',
//    TypeInfo(Androidapi.JNI.SDKLib.JGZIPHeader));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGZIPInputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JGZIPInputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JGZIPOutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JGZIPOutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInfBlocks',
//    TypeInfo(Androidapi.JNI.SDKLib.JInfBlocks));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInfCodes',
//    TypeInfo(Androidapi.JNI.SDKLib.JInfCodes));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInflate_Return',
//    TypeInfo(Androidapi.JNI.SDKLib.JInflate_Return));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInflate',
//    TypeInfo(Androidapi.JNI.SDKLib.JInflate));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInflater',
//    TypeInfo(Androidapi.JNI.SDKLib.JInflater));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInflaterInputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JInflaterInputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JInfTree',
//    TypeInfo(Androidapi.JNI.SDKLib.JInfTree));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JJZlib_WrapperType',
//    TypeInfo(Androidapi.JNI.SDKLib.JJZlib_WrapperType));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JJZlib',
//    TypeInfo(Androidapi.JNI.SDKLib.JJZlib));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JStaticTree',
//    TypeInfo(Androidapi.JNI.SDKLib.JStaticTree));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JTree',
//    TypeInfo(Androidapi.JNI.SDKLib.JTree));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZInputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JZInputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZOutputStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JZOutputStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZStream',
//    TypeInfo(Androidapi.JNI.SDKLib.JZStream));
//  TRegTypes.RegisterType('Androidapi.JNI.SDKLib.JZStreamException',
//    TypeInfo(Androidapi.JNI.SDKLib.JZStreamException));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
