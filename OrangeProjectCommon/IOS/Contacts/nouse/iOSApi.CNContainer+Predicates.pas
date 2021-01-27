//
//  CNContainer+Predicates.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContainer+Predicates;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContainer,
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

	
	
	
	
	{!
	 * @abstract The predicates to match containers against.
	 *
	 * @discussion Can only use these predicates with CNContactStore.
	 }
	CNContainer=interface()//Predicates
	['{914E5CB3-DD27-45FA-99C9-222DB1B69A6A}']
		
		
		{! @discussion If the identifier is for a unified contact then the fetch will return an empty array. To fetch the containers of a unified contact, first fetch the linked contacts then fetch the container of each linked contact. }
		
		
	end;
	
	CNContainerClass=interface(Class)//Predicates
	['{BCC673FE-4F2A-4673-A89E-3945D55342E3}']
		{+} function predicateForContainersWithIdentifiers(identifiers:NSArray<NSString*>{*}):NSPredicate{*};cdecl;
		{+} function predicateForContainerOfContactWithIdentifier(contactIdentifier:NSString{*}):NSPredicate{*};cdecl;
		{+} function predicateForContainerOfGroupWithIdentifier(groupIdentifier:NSString{*}):NSPredicate{*};cdecl;
	end;
	
	TCNContainer=class(TOCGenericImport<CNContainerClass,CNContainer>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContainer_FakeLoader : CNContainer; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContainer';
{$O+}


{$ENDIF}

end.

