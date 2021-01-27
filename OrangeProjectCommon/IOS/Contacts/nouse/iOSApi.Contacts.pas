//
//  Contacts.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.Contacts;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContactStore,
	iOSapi.CNContactFetchRequest,
	iOSapi.CNSaveRequest,
	iOSapi.CNContact,
	iOSapi.CNContact+Predicates,
	iOSapi.CNMutableContact,
	iOSapi.CNContact+NSItemProvider,
	iOSapi.CNLabeledValue,
	iOSapi.CNPhoneNumber,
	iOSapi.CNPostalAddress,
	iOSapi.CNMutablePostalAddress,
	iOSapi.CNInstantMessageAddress,
	iOSapi.CNSocialProfile,
	iOSapi.CNContactRelation,
	iOSapi.CNGroup,
	iOSapi.CNGroup+Predicates,
	iOSapi.CNMutableGroup,
	iOSapi.CNContainer,
	iOSapi.CNContainer+Predicates,
	iOSapi.CNContactFormatter,
	iOSapi.CNPostalAddressFormatter,
	iOSapi.CNContactVCardSerialization,
	iOSapi.CNContactsUserDefaults,
	iOSapi.CNContactProperty,
	iOSapi.CNError,
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

	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}


{$ENDIF}

end.

