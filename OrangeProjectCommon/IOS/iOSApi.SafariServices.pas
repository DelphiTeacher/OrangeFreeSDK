unit iOSApi.SafariServices;

interface

{$IFDEF IOS}
uses
//	iOSapi.TWTRSession,
//	iOSapi.TWTRSessionStore,
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
  libSafariServices = '/System/Library/Frameworks/SafariServices.framework/SafariServices';


type
  SFSafariViewController=interface(NSObject)
    ['{0DBB98A5-0E04-4AFA-A3F7-77CFFA34D235}']
  end;

	SFSafariViewControllerClass=interface(NSObjectClass)
    ['{4E07C28B-5F1A-4BD4-8128-B0260B697C62}']
	end;

	TSFSafariViewController=class(TOCGenericImport<SFSafariViewControllerClass,SFSafariViewController>)
	end;


{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function SFSafariViewController_FakeLoader : SFSafariViewController; cdecl; external libSafariServices name 'OBJC_CLASS_$_SFSafariViewController';
{$O+}

{$ENDIF}


end.
