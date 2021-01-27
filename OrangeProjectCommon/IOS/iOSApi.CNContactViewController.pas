//
//  CNContactViewController.h
//  ContactsUI
//
//  Copyright (c) 2015 Apple, Inc. All rights reserved.
//

unit iOSApi.CNContactViewController;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSapi.CNContact,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;
const
  libContactsUI = '/System/Library/Frameworks/ContactsUI.framework/ContactsUI';

type
	//declare pointer
	id=Pointer;
	PCNContactViewControllerDelegate=Pointer;//PCNContactViewControllerDelegate=Pointer of CNContactViewControllerDelegate; ILocalObject(CNContactViewControllerDelegate).GetObjectID
	PCNKeyDescriptor=Pointer;//PCNKeyDescriptor=Pointer of CNKeyDescriptor; ILocalObject(CNKeyDescriptor).GetObjectID

//  CNContact=Pointer;
  CNContactProperty=Pointer;
  CNContactStore=Pointer;

  CNContainer=Pointer;
  CNGroup=Pointer;


	//@protocol CNContactViewControllerDelegate;
	
	
	{!
	 * @abstract    The @c CNContactViewController is used to display a contact.
	 * @discussion  This class can display a new contact, unknown contact or existing contact.
	 *              You must use one of the class factory methods.
	 }
	
	//NS_CLASS_AVAILABLE_IOS(9_0)
	CNContactViewController=interface(UIViewController)//
	['{AFB85768-4148-4D25-BC9F-8F8B1E8ED082}']
		
		{!
		 * @abstract    Descriptor for all keys that must be fetched on a contact before setting it on the view controller.
		 * @discussion  If you want to display an existing contact in a @c CNContactViewController,
		 *              this descriptor must have been included in the @c keysToFetch property of the
		 *              @c CNContactFetchRequest. (A newly created @c CNMutableContact may be used safely.)
		 }
		
		{!
		 * @abstract    Initializes a contact view controller for a known contact.
		 * @discussion  Use this view controller for a contact that has been fetched
		 *              from the user¡¯s contacts database.
		 *              Allows editing of the contact by default.
		 * @note        All keys of the given contact must be fetched.
		 * @see         contactStore
		 * @see         allowsEditing
		 }
		
		{!
		 * @abstract    Initializes a contact view controller for an unknown contact.
		 * @discussion  Use this view controller for a populated contact not fetched from the user¡¯s contacts.
		 *              Such a contact might be obtained by parsing a vCard or setting properties on a newly
		 *              created @c CNMutableContact.
		 *              This controller does not allow editing, but by default does allow actions
		 *              for adding the contact to the contacts database.
		 * @see         contactStore
		 }
		
		{!
		 * @abstract     Initializes a contact view controller for creating a new contact.
		 * @discussion   Use this view controller with a contact to be added to the user's contacts.
		 * @note         The given contact should be a newly initialized contact and
		 *               not one fetched from the user's contacts.
		 }
		
		{!
		 * @abstract     The contact being displayed.
		 }
		function contact:CNContact{*};cdecl;
		procedure setContact(contact:CNContact{*});cdecl;
		
		{!
		 * @abstract     The @c CNContact property keys to display.
		 * @discussion   If @c nil, all properties are displayed. (The property is @c nil by default.)
		 * @note         All properties are visible when editing the contact.
		 }
		function displayedPropertyKeys:NSArray{*};cdecl;
		procedure setDisplayedPropertyKeys(displayedPropertyKeys:NSArray{*});cdecl;
		
		{!
		 * @abstract    The delegate to be notified.
		 }
		function delegate:PCNContactViewControllerDelegate{id<CNContactViewControllerDelegate>};cdecl;
		procedure setDelegate(delegate:PCNContactViewControllerDelegate{id<CNContactViewControllerDelegate>});cdecl;
		
		{!
		 * @abstract    The @c CNContactStore where the contact was fetched from or will be saved to.
		 * @discussion  If @c contactStore is not set, actions for adding the contact to the
		 *              user's contacts are disabled. This does not affect the ability to edit
		 *              the contact.
		 *
		 *              If the user edits the contact and the editing is committed, the contact
		 *              will be updated in the user's contacts database or added to the user's
		 *              contacts database if not already present.
		 *
		 *              To prevent editing of a known contact, set @c allowsEditing to @c NO.
		 * @see         allowsEditing
		 }
		function contactStore:CNContactStore{*};cdecl;
		procedure setContactStore(contactStore:CNContactStore{*});cdecl;
		
		{!
		 * @abstract    A @c CNGroup where the new contact will be assigned membership.
		 * @discussion  If not set the contact is added only to the default @c CNContainer with no group membership.
		 * @note        When set to a group not in the default container, the container
		 *              property must also be set to the container of parentGroup.
		 }
		function parentGroup:CNGroup{*};cdecl;
		procedure setParentGroup(parentGroup:CNGroup{*});cdecl;
		
		{!
		 * @abstract    A @c CNContainer where the new contact will be created.
		 * @discussion  If not set the contact is added to the default container.
		 }
		function parentContainer:CNContainer{*};cdecl;
		procedure setParentContainer(parentContainer:CNContainer{*});cdecl;
		
		{!
		 * @abstract    The name to use if the contact has no display name.
		 }
		function alternateName:NSString{*};cdecl;
		procedure setAlternateName(alternateName:NSString{*});cdecl;
		
		{!
		 * @abstract    The message to display under the name.
		 }
		[MethodName('message:')]
		function _message:NSString{*};cdecl;
		procedure setMessage(_message:NSString{*});cdecl;
		
		{!
		 * @abstract    Customization of the card.
		 }
		function allowsEditing:Boolean;cdecl;// YES by default
		procedure setAllowsEditing(allowsEditing:Boolean);cdecl;// YES by default
		function allowsActions:Boolean;cdecl;// YES by default
		procedure setAllowsActions(allowsActions:Boolean);cdecl;// YES by default
		function shouldShowLinkedContacts:Boolean;cdecl;// NO by default
		procedure setShouldShowLinkedContacts(shouldShowLinkedContacts:Boolean);cdecl;// NO by default
		
		{!
		 * @abstract    Highlight a property.
		 * @discussion  Indicates whether to highlight a certain property value for the contact.
		 *              If a single value property key is specified, identifier will be ignored.
		 }
		[MethodName('highlightPropertyWithKey:identifier:')]
		{-} procedure highlightPropertyWithKeyidentifier(key:NSString{*};identifier:{nullable} NSString{*});cdecl;
		
	end;
	
	CNContactViewControllerClass=interface(UIViewControllerClass)//
	['{4F037DA6-22B3-4A58-A06D-271B198C2395}']
		{+} function descriptorForRequiredKeys:PCNKeyDescriptor{id<CNKeyDescriptor>};cdecl;
		{+} function viewControllerForContact(contact:CNContact{*}):CNContactViewController;cdecl;
		{+} function viewControllerForUnknownContact(contact:CNContact{*}):CNContactViewController;cdecl;
		{+} function viewControllerForNewContact(contact:{nullable} CNContact{*}):CNContactViewController;cdecl;
	end;
	
	TCNContactViewController=class(TOCGenericImport<CNContactViewControllerClass,CNContactViewController>)
	end;
	
	
	//NS_AVAILABLE_IOS(9_0)
	CNContactViewControllerDelegate=interface(IObjectiveC)
		['{9B559470-3FE3-4959-AA5A-B05C1593CAC0}']
		//@optional
		
		{!
		 * @abstract    Called when the user selects a single property.
		 * @discussion  Return @c NO if you do not want anything to be done or if you are handling the actions yourself.
		 * @return      @c YES if you want the default action performed for the property otherwise return @c NO.
		 }
		[MethodName('contactViewController:shouldPerformDefaultActionForContactProperty:')]
		{-} function contactViewControllershouldPerformDefaultActionForContactProperty(viewController:CNContactViewController{*};_property:CNContactProperty{*}):Boolean;cdecl;
		
		{!
		 * @abstract    Called when the view has completed.
		 * @discussion  If creating a new contact, the new contact added to the contacts list will be passed.
		 *              If adding to an existing contact, the existing contact will be passed.
		 * @note        It is up to the delegate to dismiss the view controller.
		 }
		[MethodName('contactViewController:didCompleteWithContact:')]
		{-} procedure contactViewControllerdidCompleteWithContact(viewController:CNContactViewController{*};contact:{nullable} CNContact{*});cdecl;
		
	end;
	
	TOncontactViewControllershouldPerformDefaultActionForContactProperty=function(viewController:CNContactViewController{*};_property:CNContactProperty{*}):Boolean of object;
	TOncontactViewControllerdidCompleteWithContact=procedure(viewController:CNContactViewController{*};contact:{nullable} CNContact{*}) of object;
	
	TCNContactViewControllerDelegate=class(TOCLocal,CNContactViewControllerDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OncontactViewControllershouldPerformDefaultActionForContactProperty:TOncontactViewControllershouldPerformDefaultActionForContactProperty;
		OncontactViewControllerdidCompleteWithContact:TOncontactViewControllerdidCompleteWithContact;
	
		//@optional
		
		{!
		 * @abstract    Called when the user selects a single property.
		 * @discussion  Return @c NO if you do not want anything to be done or if you are handling the actions yourself.
		 * @return      @c YES if you want the default action performed for the property otherwise return @c NO.
		 }
		[MethodName('contactViewController:shouldPerformDefaultActionForContactProperty:')]
		{-} function contactViewControllershouldPerformDefaultActionForContactProperty(viewController:CNContactViewController{*};_property:CNContactProperty{*}):Boolean;cdecl;
		
		{!
		 * @abstract    Called when the view has completed.
		 * @discussion  If creating a new contact, the new contact added to the contacts list will be passed.
		 *              If adding to an existing contact, the existing contact will be passed.
		 * @note        It is up to the delegate to dismiss the view controller.
		 }
		[MethodName('contactViewController:didCompleteWithContact:')]
		{-} procedure contactViewControllerdidCompleteWithContact(viewController:CNContactViewController{*};contact:{nullable} CNContact{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactViewController_FakeLoader : CNContactViewController; cdecl; external libContactsUI name 'OBJC_CLASS_$_CNContactViewController';
{$O+}

{ TCNContactViewControllerDelegate }

constructor TCNContactViewControllerDelegate.Create;
begin
	Inherited Create;
end;

destructor TCNContactViewControllerDelegate.Destroy;
begin
	Inherited;
end;

function  TCNContactViewControllerDelegate.contactViewControllershouldPerformDefaultActionForContactProperty(viewController:CNContactViewController{*};_property:CNContactProperty{*}):Boolean;
begin
	if Assigned(OncontactViewControllershouldPerformDefaultActionForContactProperty) then
	begin
		Result:=OncontactViewControllershouldPerformDefaultActionForContactProperty(viewController,_property);
	end;
end;

procedure  TCNContactViewControllerDelegate.contactViewControllerdidCompleteWithContact(viewController:CNContactViewController{*};contact:{nullable} CNContact{*});
begin
	if Assigned(OncontactViewControllerdidCompleteWithContact) then
	begin
		OncontactViewControllerdidCompleteWithContact(viewController,contact);
	end;
end;



{$ENDIF}

end.

