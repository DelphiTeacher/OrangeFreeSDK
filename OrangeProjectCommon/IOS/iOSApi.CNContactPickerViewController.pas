//
//  CNContactPickerViewController.h
//  ContactsUI
//
//  Copyright (c) 2015 Apple, Inc. All rights reserved.
//

unit iOSApi.CNContactPickerViewController;

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
	PCNContactPickerDelegate=Pointer;//PCNContactPickerDelegate=Pointer of CNContactPickerDelegate; ILocalObject(CNContactPickerDelegate).GetObjectID


//  CNContact=Pointer;
  CNContactProperty=Pointer;

	
	//@protocol CNContactPickerDelegate;
	
	
	
	{!
	 * @abstract    The CNContactPickerViewController allows the user to select one or multiple contacts or properties.
	 * @discussion  The entire list of contacts will be presented to the user.
	 *              The picker supports both single selection and multi-selection.
	 *              The app does not need access to the user¡¯s contacts and the user will
	 *              not be prompted for access. It will only have access to the final selection of the user.
	 *              Changing the predicates only takes effect before the view is presented.
	 }
	
	//NS_CLASS_AVAILABLE_IOS(9_0)
	
	CNContactPickerViewController=interface(UIViewController)//
	['{F2F73BBE-8DD6-41C0-B502-E2BE0F4A4118}']
		
		
		{!
		 * @abstract    The CNContact property keys to display in the contact detail card.
		 * @discussion  If not set all properties are displayed.
		 }
		
		function displayedPropertyKeys:NSArray{<NSString*>}{*};cdecl;
		procedure setDisplayedPropertyKeys(displayedPropertyKeys:NSArray{<NSString*>}{*});cdecl;
		
		
		{!
		 * @abstract    The delegate to be notified when the user selects a contact or property.
		 }
		
		function delegate:PCNContactPickerDelegate{id<CNContactPickerDelegate>};cdecl;
		procedure setDelegate(delegate:PCNContactPickerDelegate{id<CNContactPickerDelegate>});cdecl;
		
		
		{!
		 * @abstract    The predicate to determine if a contact is selectable in the list.
		 * @discussion  If not set all contacts are selectable.
		 }
		
		function predicateForEnablingContact:NSPredicate{*};cdecl;// e.g. emailAddresses.@count > 0
		procedure setPredicateForEnablingContact(predicateForEnablingContact:NSPredicate{*});cdecl;// e.g. emailAddresses.@count > 0
		
		
		{!
		 * @abstract    The predicate to control the selection of a contact.
		 * @discussion  It determines whether a selected contact should be returned (predicate evaluates to TRUE)
		 *              or if the contact detail card should be displayed (evaluates to FALSE).
		 *              If not set the picker displays the contact detail card when the contact is selected.
		 }
		
		function predicateForSelectionOfContact:NSPredicate{*};cdecl;// e.g. emailAddresses.@count == 1
		procedure setPredicateForSelectionOfContact(predicateForSelectionOfContact:NSPredicate{*});cdecl;// e.g. emailAddresses.@count == 1
		
		
		{!
		 * @abstract    The predicate to control the selection of a property.
		 * @discussion  It determines whether a selected property should be returned (predicate evaluates to TRUE)
		 *              or if the default action for the property should be performed (predicate evaluates to FALSE).
		 *              If not set the picker returns the first selected property.
		 *              The predicate is evaluated on the CNContactProperty that is being selected.
		 }
		
		function predicateForSelectionOfProperty:NSPredicate{*};cdecl;// e.g. (key == 'emailAddresses') AND (value LIKE '*@apple.com')
		procedure setPredicateForSelectionOfProperty(predicateForSelectionOfProperty:NSPredicate{*});cdecl;// e.g. (key == 'emailAddresses') AND (value LIKE '*@apple.com')
		
		
	end;
	
	CNContactPickerViewControllerClass=interface(UIViewControllerClass)//
	['{2CF69DDD-2244-4438-938C-3BAC889075D8}']
	end;
	
	TCNContactPickerViewController=class(TOCGenericImport<CNContactPickerViewControllerClass,CNContactPickerViewController>)
	end;
	
	
	//NS_AVAILABLE_IOS(9_0)
	
	CNContactPickerDelegate=interface(IObjectiveC)
		['{41A362AF-8D16-468E-BD23-1792E6AC4C01}']
		
		//@optional
		
		{!
		 * @abstract    Invoked when the picker is closed.
		 * @discussion  The picker will be dismissed automatically after a contact or property is picked.
		 }
		{-} procedure contactPickerDidCancel(picker:CNContactPickerViewController{*});cdecl;
		
		{!
		 * @abstract    Singular delegate methods.
		 * @discussion  These delegate methods will be invoked when the user selects a single contact or property.
		 }
		[MethodName('contactPicker:didSelectContact:')]
		{-} procedure contactPickerdidSelectContact(picker:CNContactPickerViewController{*};contact:CNContact{*});cdecl;
		[MethodName('contactPicker:didSelectContactProperty:')]
		{-} procedure contactPickerdidSelectContactProperty(picker:CNContactPickerViewController{*};contactProperty:CNContactProperty{*});cdecl;
		
		{!
		 * @abstract    Plural delegate methods.
		 * @discussion  These delegate methods will be invoked when the user is done selecting multiple contacts or properties.
		 *              Implementing one of these methods will configure the picker for multi-selection.
		 }
		[MethodName('contactPicker:didSelectContacts:')]
		{-} procedure contactPickerdidSelectContacts(picker:CNContactPickerViewController{*};contacts:NSArray{<CNContact*>}{*});cdecl;
		[MethodName('contactPicker:didSelectContactProperties:')]
		{-} procedure contactPickerdidSelectContactProperties(picker:CNContactPickerViewController{*};contactProperties:NSArray{<CNContactProperty*>}{*});cdecl;
		
	end;
	
	TOncontactPickerDidCancel=procedure(picker:CNContactPickerViewController{*}) of object;
	TOncontactPickerdidSelectContact=procedure(picker:CNContactPickerViewController{*};contact:CNContact{*}) of object;
	TOncontactPickerdidSelectContactProperty=procedure(picker:CNContactPickerViewController{*};contactProperty:CNContactProperty{*}) of object;
	TOncontactPickerdidSelectContacts=procedure(picker:CNContactPickerViewController{*};contacts:NSArray{<CNContact*>}{*}) of object;
	TOncontactPickerdidSelectContactProperties=procedure(picker:CNContactPickerViewController{*};contactProperties:NSArray{<CNContactProperty*>}{*}) of object;
	
	TCNContactPickerDelegate=class(TOCLocal,CNContactPickerDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OncontactPickerDidCancel:TOncontactPickerDidCancel;
		OncontactPickerdidSelectContact:TOncontactPickerdidSelectContact;
		OncontactPickerdidSelectContactProperty:TOncontactPickerdidSelectContactProperty;
		OncontactPickerdidSelectContacts:TOncontactPickerdidSelectContacts;
		OncontactPickerdidSelectContactProperties:TOncontactPickerdidSelectContactProperties;
	
		
		//@optional
		
		{!
		 * @abstract    Invoked when the picker is closed.
		 * @discussion  The picker will be dismissed automatically after a contact or property is picked.
		 }
		{-} procedure contactPickerDidCancel(picker:CNContactPickerViewController{*});cdecl;
		
		{!
		 * @abstract    Singular delegate methods.
		 * @discussion  These delegate methods will be invoked when the user selects a single contact or property.
		 }
		[MethodName('contactPicker:didSelectContact:')]
		{-} procedure contactPickerdidSelectContact(picker:CNContactPickerViewController{*};contact:CNContact{*});cdecl;
		[MethodName('contactPicker:didSelectContactProperty:')]
		{-} procedure contactPickerdidSelectContactProperty(picker:CNContactPickerViewController{*};contactProperty:CNContactProperty{*});cdecl;
		
		{!
		 * @abstract    Plural delegate methods.
		 * @discussion  These delegate methods will be invoked when the user is done selecting multiple contacts or properties.
		 *              Implementing one of these methods will configure the picker for multi-selection.
		 }
		[MethodName('contactPicker:didSelectContacts:')]
		{-} procedure contactPickerdidSelectContacts(picker:CNContactPickerViewController{*};contacts:NSArray{<CNContact*>}{*});cdecl;
		[MethodName('contactPicker:didSelectContactProperties:')]
		{-} procedure contactPickerdidSelectContactProperties(picker:CNContactPickerViewController{*};contactProperties:NSArray{<CNContactProperty*>}{*});cdecl;

	end;



{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactPickerViewController_FakeLoader : CNContactPickerViewController; cdecl; external libContactsUI name 'OBJC_CLASS_$_CNContactPickerViewController';
{$O+}

{ TCNContactPickerDelegate }

constructor TCNContactPickerDelegate.Create;
begin
	Inherited Create;
end;

destructor TCNContactPickerDelegate.Destroy;
begin
	Inherited;
end;

procedure  TCNContactPickerDelegate.contactPickerDidCancel(picker:CNContactPickerViewController{*});
begin
  FMX.Types.Log.d('OrangeUI TCNContactPickerDelegate.contactPickerDidCancel');
	if Assigned(OncontactPickerDidCancel) then
	begin
		OncontactPickerDidCancel(picker);
	end;

  picker.dismissViewControllerAnimated(False,nil);
end;

procedure  TCNContactPickerDelegate.contactPickerdidSelectContact(picker:CNContactPickerViewController{*};contact:CNContact{*});
begin
  FMX.Types.Log.d('OrangeUI TCNContactPickerDelegate.contactPickerdidSelectContact');
	if Assigned(OncontactPickerdidSelectContact) then
	begin
		OncontactPickerdidSelectContact(picker,contact);
	end;
  picker.dismissViewControllerAnimated(False,nil);
end;

procedure  TCNContactPickerDelegate.contactPickerdidSelectContactProperty(picker:CNContactPickerViewController{*};contactProperty:CNContactProperty{*});
begin
  FMX.Types.Log.d('OrangeUI TCNContactPickerDelegate.contactPickerdidSelectContactProperty');
	if Assigned(OncontactPickerdidSelectContactProperty) then
	begin
		OncontactPickerdidSelectContactProperty(picker,contactProperty);
	end;
  picker.dismissViewControllerAnimated(False,nil);
end;

procedure  TCNContactPickerDelegate.contactPickerdidSelectContacts(picker:CNContactPickerViewController{*};contacts:NSArray{<CNContact*>}{*});
begin
  FMX.Types.Log.d('OrangeUI TCNContactPickerDelegate.contactPickerdidSelectContacts');
	if Assigned(OncontactPickerdidSelectContacts) then
	begin
		OncontactPickerdidSelectContacts(picker,contacts);
	end;
  picker.dismissViewControllerAnimated(False,nil);
end;

procedure  TCNContactPickerDelegate.contactPickerdidSelectContactProperties(picker:CNContactPickerViewController{*};contactProperties:NSArray{<CNContactProperty*>}{*});
begin
  FMX.Types.Log.d('OrangeUI TCNContactPickerDelegate.contactPickerdidSelectContactProperties');
	if Assigned(OncontactPickerdidSelectContactProperties) then
	begin
		OncontactPickerdidSelectContactProperties(picker,contactProperties);
	end;
end;



{$ENDIF}

end.

