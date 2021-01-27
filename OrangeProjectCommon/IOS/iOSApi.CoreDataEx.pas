unit iOSApi.CoreDataEx;

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
  libCoreDataEx = '/System/Library/Frameworks/CoreData.framework/CoreData';


type
  NSManagedObjectContext=interface(NSObject)
    ['{0DBB98A5-0E04-4AFA-A3F7-77CFFA34D235}']
  end;

	NSManagedObjectContextClass=interface(NSObjectClass)
    ['{4E07C28B-5F1A-4BD4-8128-B0260B697C62}']
	end;

	TNSManagedObjectContext=class(TOCGenericImport<NSManagedObjectContextClass,NSManagedObjectContext>)
	end;


{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function NSManagedObjectContext_FakeLoader : NSManagedObjectContext; cdecl; external libCoreDataEx name 'OBJC_CLASS_$_NSManagedObjectContext';
{$O+}

{$ENDIF}


end.
