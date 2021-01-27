unit iOSApi.Social;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRSession,
	iOSapi.TWTRSessionStore,
	iOSapi.UIKit,
//	iOSApi.TWTRAPIClient,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;


const
  libSocial = '/System/Library/Frameworks/Social.framework/Social';


type
  SLRequest=interface(NSObject)
    ['{0DBB98A5-0E04-4AFA-A3F7-77CFFA34D235}']
  end;

	SLRequestClass=interface(NSObjectClass)
    ['{4E07C28B-5F1A-4BD4-8128-B0260B697C62}']
	end;

	TSLRequest=class(TOCGenericImport<SLRequestClass,SLRequest>)
	end;


{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function SLRequest_FakeLoader : SLRequest; cdecl; external libSocial name 'OBJC_CLASS_$_SLRequest';
{$O+}

{$ENDIF}


end.
