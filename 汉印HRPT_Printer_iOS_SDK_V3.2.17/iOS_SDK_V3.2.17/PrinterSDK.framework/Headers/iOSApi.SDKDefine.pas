unit iOSApi.SDKDefine;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	////#ifndef PublicDefine_h
	
	
	
	////#endif /* PublicDefine_h */
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}



{$ENDIF}

end.

