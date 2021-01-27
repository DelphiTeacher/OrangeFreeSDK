//
//  CNContactStore.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactStore;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.ContactsDefines,
	iOSapi.CNContact,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	
	
	
	{!
	 * @abstract The entities the user can grant access to.
	 }
	CNEntityType_=(
	//(NSInteger, CNEntityType)
	//    /*! The user's contacts. */
	//    CNEntityTypeContacts
	//}  NS_ENUM_AVAILABLE(10_11, 9_0);
	);
	CNEntityType=Integer;
	
	{!
	 * @abstract The authorization the user has given the application to access an entity type.
	 }
	CNAuthorizationStatus_=(
	//(NSInteger, CNAuthorizationStatus)
	//    /*! The user has not yet made a choice regarding whether the application may access contact data. */
	//    CNAuthorizationStatusNotDetermined = 0,
	//    /*! The application is not authorized to access contact data.
	//     *  The user cannot change this application¡¯s status, possibly due to active restrictions such as parental controls being in place. */
	    CNAuthorizationStatusRestricted,
	//    /*! The user explicitly denied access to contact data for the application. */
	//    CNAuthorizationStatusDenied,
	//    /*! The application is authorized to access contact data. */
	    CNAuthorizationStatusAuthorized
	);
	CNAuthorizationStatus=Integer;
	
	
	{!
	 * @abstract Provides methods to fetch and save contacts.
	 *
	 * @discussion The CNContactStore is a thread safe class that can fetch and save contacts, fetch and save groups, and fetch containers.
	 *
	 * @note Some good practices are:
	 * 1) Only fetch contact properties that will be used.
	 * 2) When fetching all contacts and caching the results, first fetch all contact identifiers only. Then fetch batches of detailed contacts by identifiers as you need them.
	 * 3) To aggregate several contact fetches collect a set of unique contact identifiers from the fetches. Then fetch batches of detailed contacts by identifiers.
	 * 4) When CNContactStoreDidChangeNotification is posted, if you cache any fetched contacts/groups/containers then they must be refetched and the old cached objects released.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactStore=interface(NSObject)//
	['{4B859C27-B472-4174-B16C-B8B1823506DB}']
		
		//#pragma mark - Privacy Access
		
		{!
		 * @abstract Indicates the current authorization status to access contact data.
		 *
		 * @discussion Based upon the access, the application could display or hide its UI elements that would access any Contacts API. This method is thread safe.
		 *
		 * @return Returns the authorization status for the given entityType.
		 }
		
		{!
		 * @abstract Request access to the user's contacts.
		 *
		 * @discussion Users are able to grant or deny access to contact data on a per-application basis. To request access to contact data, call requestAccessForEntityType:completionHandler:. This will not block the application while the user is being asked to grant or deny access. The user will only be prompted the first time access is requested; any subsequent CNContactStore calls will use the existing permissions. The completion handler is called on an arbitrary queue.
		 *
		 * @note Recommended to use CNContactStore instance methods in this completion handler instead of the UI main thread. This method is optional when CNContactStore is used on a background thread. If it is not used in that case, CNContactStore will block if the user is asked to grant or deny access.
		 *
		 * @param entityType Set to CNEntityTypeContacts.
		 * @param completionHandler This block is called upon completion. If the user grants access then granted is YES and error is nil. Otherwise granted is NO with an error. 
		 }
		[MethodName('requestAccessForEntityType:completionHandler:')]
		{-} procedure requestAccessForEntityTypecompletionHandler(entityType:CNEntityType;completionHandler:void (^)(BOOL granted, NSError *__{nullable} error));cdecl;
		
		
		//#pragma mark - Unified Contacts Helpers
		
		{!
		 * @abstract Fetch all unified contacts matching a given predicate.
		 *
		 * @discussion Use only predicates from CNContact+Predicates.h. Compound predicates are not supported. Due to unification the returned contacts may have a different identifier. 
		 *
		 * @note To fetch all contacts use enumerateContactsWithFetchRequest:error:usingBlock:.
		 *
		 * @param predicate The predicate to match against.
		 * @param keys The properties to fetch into the returned CNContact objects. Should only fetch the properties that will be used. Can combine contact keys and contact key descriptors.
		 * @param error If an error occurs, contains error information.
		 * @return An array of CNContact objects matching the predicate. If no matches are found, an empty array is returned. If an error occurs, nil is returned.
		 }
		[MethodName('unifiedContactsMatchingPredicate:keysToFetch:error:')]
		{-} function unifiedContactsMatchingPredicatekeysToFetcherror(predicate:NSPredicate{*};keys:NSArray<id<CNKeyDescriptor>>{*};error:NSError *__{nullable} *__{nullable}):{nullable} NSArray<CNContact*>{*};cdecl;
		
		{!
		 * @abstract Fetch a unified contact with a given identifier.
		 *
		 * @discussion Due to unification the returned contact may have a different identifier. To fetch a batch of contacts by identifiers use [CNContact predicateForContactsWithIdentifiers:].
		 *
		 * @param identifier The identifier of the contact to fetch.
		 * @param keys The properties to fetch into the returned CNContact object. Should only fetch the properties that will be used. Can combine contact keys and contact key descriptors.
		 * @param error If an error occurs, contains error information.
		 * @return The unified contact matching or linked to the identifier. If no contact with the given identifier is found, nil is returned and error is set to CNErrorCodeRecordDoesNotExist.
		 }
		[MethodName('unifiedContactWithIdentifier:keysToFetch:error:')]
		{-} function unifiedContactWithIdentifierkeysToFetcherror(identifier:NSString{*};keys:NSArray<id<CNKeyDescriptor>>{*};error:NSError *__{nullable} *__{nullable}):{nullable} CNContact{*};cdecl;
		
		{!
		 * @abstract Fetch the unified contact that is the "me" card.
		 *
		 * @discussion Fetches the contact that is represented in the user interface as "My Card".
		 *
		 * @param keys The properties to fetch into the returned CNContact object. Should only fetch the properties that will be used. Can combine contact keys and contact key descriptors.
		 * @param error If an error occurs, contains error information.
		 * @return The unified contact that is the "me" card. If no "me" card is set, nil is returned.
		 }
		[MethodName('unifiedMeContactWithKeysToFetch:error:')]
		{-} function unifiedMeContactWithKeysToFetcherror(keys:NSArray<id<CNKeyDescriptor>>{*};error:NSError *__{nullable} *__{nullable}):{nullable} CNContact{*};cdecl;
		
		
		//#pragma mark - Fetch and Save
		
		{!
		 * @abstract Enumerates all contacts matching a contact fetch request.
		 *
		 * @discussion This method will wait until the enumeration is finished. If there are no results the block is not called and YES is returned.
		 *
		 * @param fetchRequest The contact fetch request that specifies the search criteria.
		 * @param error If an error occurs, contains error information.
		 * @param block Called for each matching contact. Set *stop to YES to stop the enumeration.
		 * @return YES if successful, otherwise NO.
		 }
		[MethodName('enumerateContactsWithFetchRequest:error:usingBlock:')]
		{-} function enumerateContactsWithFetchRequesterrorusingBlock(fetchRequest:CNContactFetchRequest{*};error:NSError *__{nullable} *__{nullable};block:void (^)(CNContact *contact, BOOL *stop)):Boolean;cdecl;
		
		{!
		 * @abstract Fetch all groups matching a given predicate.
		 *
		 * @discussion Use only predicates from CNGroup+Predicates.h. Compound predicates are not supported.
		 *
		 * @param predicate The predicate to match against. Set to nil to match all groups.
		 * @param error If an error occurs, contains error information.
		 * @return An array of CNGroup objects matching the predicate. If no matches are found, an empty array is returned. If an error occurs, nil is returned.
		 }
		[MethodName('groupsMatchingPredicate:error:')]
		{-} function groupsMatchingPredicateerror(predicate:{nullable} NSPredicate{*};error:NSError *__{nullable} *__{nullable}):{nullable} NSArray<CNGroup*>{*};cdecl;
		
		{!
		 * @abstract Fetch all containers matching a given predicate.
		 *
		 * @discussion Use only predicates from CNContainer+Predicates.h. Compound predicates are not supported.
		 *
		 * @param predicate The predicate to match against. Set to nil to match all containers.
		 * @param error If an error occurs, contains error information.
		 * @return An array of CNContainer objects matching the predicate. If no matches are found, an empty array is returned. If an error occurs, nil is returned.
		 }
		[MethodName('containersMatchingPredicate:error:')]
		{-} function containersMatchingPredicateerror(predicate:{nullable} NSPredicate{*};error:NSError *__{nullable} *__{nullable}):{nullable} NSArray<CNContainer*>{*};cdecl;
		
		{!
		 * @abstract Executes a save request.
		 *
		 * @discussion Do not access objects when save request is executing. A save request with contacts may modify the contacts while executing. A save request only applies the changes to the objects. If there are overlapping changes with multiple, concurrent CNSaveRequests then the last saved change wins.
		 *
		 * @param saveRequest Save request to execute.
		 * @param error If an error occurs, contains error information.
		 * @return YES if successful, otherwise NO.
		 }
		[MethodName('executeSaveRequest:error:')]
		{-} function executeSaveRequesterror(saveRequest:CNSaveRequest{*};error:NSError *__{nullable} *__{nullable}):Boolean;cdecl;
		
		
		//#pragma mark - Miscellaneous
		
		{!
		 *  @abstract The identifier of the default container.
		 *
		 *  @discussion This identifier can be used to fetch the default container.
		 *
		 *  @return The identifier of the default container. If the caller lacks Contacts authorization or an error occurs, nil is returned.
		 }
		{-} function defaultContainerIdentifier:{nullable} NSString{*};cdecl;
		
	end;
	
	CNContactStoreClass=interface(NSObjectClass)//
	['{BE192FFA-D3A1-4B2A-BDEF-102775D3784D}']
		{+} function authorizationStatusForEntityType(entityType:CNEntityType):CNAuthorizationStatus;cdecl;
	end;
	
	TCNContactStore=class(TOCGenericImport<CNContactStoreClass,CNContactStore>)
	end;
	
	
	//#pragma mark - Constants
	
	{!
	 * @abstract Notification posted when changes occur in another CNContactStore.
	 }
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactStoreDidChangeNotification;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactStore_FakeLoader : CNContactStore; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactStore';
{$O+}


{$ENDIF}

end.

