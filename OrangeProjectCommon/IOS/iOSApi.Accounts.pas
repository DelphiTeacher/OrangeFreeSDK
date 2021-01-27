unit iOSApi.Accounts;

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
  libAccounts = '/System/Library/Frameworks/Accounts.framework/Accounts';


type
  ACAccount=interface(NSObject)
    ['{0DBB98A5-0E04-4AFA-A3F7-77CFFA34D235}']
  end;

	ACAccountClass=interface(NSObjectClass)
    ['{4E07C28B-5F1A-4BD4-8128-B0260B697C62}']
	end;

	TACAccount=class(TOCGenericImport<ACAccountClass,ACAccount>)
	end;


{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function ACAccount_FakeLoader : ACAccount; cdecl; external libAccounts name 'OBJC_CLASS_$_ACAccount';
{$O+}

{$ENDIF}


end.
