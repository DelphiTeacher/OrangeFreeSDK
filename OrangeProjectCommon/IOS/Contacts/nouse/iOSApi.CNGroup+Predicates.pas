//
//  CNGroup+Predicates.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNGroup+Predicates;

interface

{$IFDEF IOS}
uses
	iOSapi.CNGroup,
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
	 * @abstract The predicates to match groups against.
	 *
	 * @discussion Can only use these predicates with CNContactStore.
	 }
	CNGroup=interface()//Predicates
	['{F8357DE0-3665-44AF-88A2-0053746BD4DD}']
		
		
		
		
	end;
	
	CNGroupClass=interface(Class)//Predicates
	['{D2F07B9E-F91A-4FF9-B525-0A9AE8597184}']
		{+} function predicateForGroupsWithIdentifiers(identifiers:NSArray<NSString*>{*}):NSPredicate{*};cdecl;
		{+} function predicateForSubgroupsInGroupWithIdentifier(parentGroupIdentifier:NSString{*}):NSPredicate{*};cdecl;
		{+} function predicateForGroupsInContainerWithIdentifier(containerIdentifier:NSString{*}):NSPredicate{*};cdecl;
	end;
	
	TCNGroup=class(TOCGenericImport<CNGroupClass,CNGroup>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNGroup_FakeLoader : CNGroup; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNGroup';
{$O+}


{$ENDIF}

end.

