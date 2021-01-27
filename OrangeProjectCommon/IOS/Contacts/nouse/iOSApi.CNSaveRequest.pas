//
//  CNSaveRequest.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNSaveRequest;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
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
	 * @abstract Specifies the changes to save.
	 *
	 * @discussion Create a new save request for each save execution on the contact store. Can have many changes batched into one save request. Do not access objects in the save request when it is executing.  A save request only applies the changes to the objects. If there are overlapping changes with multiple, concurrent CNSaveRequests then the last saved change wins.
	 *
	 * If adding an object (contact, group, container) and it is already in the contact store then the executing save request will fail to add that object and will return the error CNErrorCodeInsertedRecordAlreadyExists with CNErrorUserInfoAffectedRecordsKey value as an array containing that object.
	 *
	 * If updating/deleting an object (contact, group, container) and it is not in the contact store then the executing save request will fail to update/delete that object and will return the error CNErrorCodeRecordDoesNotExist with CNErrorUserInfoAffectedRecordsKey value as an array containing that object.
	 *
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	
	CNSaveRequest=interface(NSObject)//
	['{382F609E-DDA2-4B31-BF7D-8CC1677DFAFD}']
		
		{!
		 * @abstract Add a new contact to the contact store.
		 *
		 * @discussion The contact may be modified by the executing save request. If the contact was previously specified to be deleted in the save request that will no longer occur.
		 *
		 * @param contact The new contact to add.
		 * @param identifier The container identifier to add the new contact to. Set to nil for the default container.
		 }
		[MethodName('addContact:toContainerWithIdentifier:')]
		{-} procedure addContacttoContainerWithIdentifier(contact:CNMutableContact{*};identifier:{nullable} NSString{*});cdecl;
		
		{!
		 * @abstract Update an existing contact in the contact store.
		 *
		 * @discussion The contact must already exist in the contact store. The contact may be modified by the executing save request.
		 }
		{-} procedure updateContact(contact:CNMutableContact{*});cdecl;
		
		{!
		 * @abstract Delete a contact from the contact store.
		 *
		 * @discussion If the contact was previously specified to be added in the save request that will no longer occur.
		 }
		{-} procedure deleteContact(contact:CNMutableContact{*});cdecl;
		
		{!
		 * @abstract Add a new group to the contact store.
		 *
		 * @discussion If the group was previously specified to be deleted in the save request that will no longer occur.
		 *
		 * @param group The new group to add.
		 * @param identifier The container identifier to add the new group to. Set to nil for the default container.
		 }
		[MethodName('addGroup:toContainerWithIdentifier:')]
		{-} procedure addGrouptoContainerWithIdentifier(group:CNMutableGroup{*};identifier:{nullable} NSString{*});cdecl;
		
		{!
		 * @abstract Update an existing group in the contact store.
		 *
		 * @discussion The group must already exist in the contact store.
		 }
		{-} procedure updateGroup(group:CNMutableGroup{*});cdecl;
		
		{!
		 * @abstract Delete a group from the contact store.
		 *
		 * @discussion The contacts in the group are not deleted. If the group was previously specified to be added in the save request that will no longer occur.
		 }
		{-} procedure deleteGroup(group:CNMutableGroup{*});cdecl;
		
		{!
		 * @abstract Add a new subgroup to a group.
		 *
		 * @discussion If the subgroup was previously specified to be deleted in the save request that will no longer occur.
		 *
		 * @param subgroup The new group to add.
		 * @param group The group to add the subgroup to.
		 }
		[MethodName('addSubgroup:toGroup:')]
		{-} procedure addSubgrouptoGroup(subgroup:CNGroup{*};group:CNGroup{*});cdecl;
		
		{!
		 * @abstract Remove a subgroup from a group.
		 *
		 * @discussion The contacts in the subgroup's membership are not affected. If the subgroup was previously specified to be added in the save request that will no longer occur.
		 *
		 * @param subgroup The new group to add.
		 * @param group The group to add the subgroup to.
		 }
		[MethodName('removeSubgroup:fromGroup:')]
		{-} procedure removeSubgroupfromGroup(subgroup:CNGroup{*};group:CNGroup{*});cdecl;
		
		{!
		 * @abstract Add a new member to a group.
		 *
		 * @discussion If the membership was previously specified to be deleted in the save request that will no longer occur.
		 *
		 * @param contact The new member to add to the group.
		 * @param group The group to add the member to.
		 }
		[MethodName('addMember:toGroup:')]
		{-} procedure addMembertoGroup(contact:CNContact{*};group:CNGroup{*});cdecl;
		
		{!
		 * @abstract Remove a member from a group.
		 *
		 * @discussion The contact is not deleted. It is only removed as a member of the group. If the membership was previously specified to be added in the save request that will no longer occur.
		 *
		 * @param contact The member to remove from the group.
		 * @param group The group to remove the member from.
		 }
		[MethodName('removeMember:fromGroup:')]
		{-} procedure removeMemberfromGroup(contact:CNContact{*};group:CNGroup{*});cdecl;
		
	end;
	
	CNSaveRequestClass=interface(NSObjectClass)//
	['{22CEEBC6-F7BF-419B-AE1C-976F511EB99A}']
	end;
	
	TCNSaveRequest=class(TOCGenericImport<CNSaveRequestClass,CNSaveRequest>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNSaveRequest_FakeLoader : CNSaveRequest; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNSaveRequest';
{$O+}


{$ENDIF}

end.

