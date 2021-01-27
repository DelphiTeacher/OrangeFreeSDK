//
//  CNContactFetchRequest.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactFetchRequest;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContact,
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
	 * @abstract Specifies the search criteria to fetch contacts.
	 *
	 * @discussion Used with [CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]. Can combine any of these options to create a contact fetch request.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactFetchRequest=interface(NSObject)//<NSSecureCoding>
	['{CD6090D7-4A71-455D-87F9-1CA5C0CFC5E4}']
		
		{-} function init NS_UNAVAILABLE:CNContactFetchRequest;cdecl;
		
		{!
		 *  @param      keysToFetch
		 *              The properties to fetch for the returned contacts.
		 *
		 *  @discussion Only fetch the properties that will be used.
		 }
		{-} function initWithKeysToFetch(keysToFetch:NSArray <id<CNKeyDescriptor>>{*}):CNContactFetchRequest;cdecl;
		
		{!
		 * @abstract The predicate to match contacts against.
		 *
		 * @discussion Use only predicates from CNContact+Predicates.h. Compound predicates are not supported. Set to nil to match all contacts.
		 }
		function predicate:NSPredicate{*};cdecl;
		procedure setPredicate(predicate:NSPredicate{*});cdecl;
		
		{!
		 * @abstract The properties to fetch in the returned contacts.
		 *
		 * @discussion Should only fetch the properties that will be used. Can combine contact keys and contact key descriptors.
		 }
		function keysToFetch:NSArray<id<CNKeyDescriptor>>{*};cdecl;
		procedure setKeysToFetch(keysToFetch:NSArray<id<CNKeyDescriptor>>{*});cdecl;
		
		{!
		 * @abstract To return mutable contacts.
		 *
		 * @discussion If YES returns CNMutableContact objects, otherwise returns CNContact objects. Default is NO.
		 }
		function mutableObjects:Boolean;cdecl;
		procedure setMutableObjects(mutableObjects:Boolean);cdecl;
		
		{!
		 * @abstract To return linked contacts as unified contacts.
		 *
		 * @discussion If YES returns unified contacts, otherwise returns individual contacts. Default is YES.
		 *
		 * @note A unified contact is the aggregation of properties from a set of linked individual contacts. If an individual contact is not linked then the unified contact is simply that individual contact.
		 }
		function unifyResults:Boolean;cdecl;
		procedure setUnifyResults(unifyResults:Boolean);cdecl;
		
		{!
		 * @abstract To return contacts in a specific sort order.
		 *
		 * @discussion Default is CNContactSortOrderNone.
		 }
		function sortOrder:CNContactSortOrder;cdecl;
		procedure setSortOrder(sortOrder:CNContactSortOrder);cdecl;
		
	end;
	
	CNContactFetchRequestClass=interface(NSObjectClass)//<NSSecureCoding>
	['{C293DF2D-E1E8-4CE9-83B0-874D5557B937}']
		{+} function new  NS_UNAVAILABLE:CNContactFetchRequest;cdecl;
	end;
	
	TCNContactFetchRequest=class(TOCGenericImport<CNContactFetchRequestClass,CNContactFetchRequest>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactFetchRequest_FakeLoader : CNContactFetchRequest; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactFetchRequest';
{$O+}


{$ENDIF}

end.

