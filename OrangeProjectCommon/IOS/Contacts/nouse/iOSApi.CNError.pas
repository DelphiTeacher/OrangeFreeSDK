//
//  CNError.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNError;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.ContactsDefines,
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

	
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNErrorDomain;
	
	CNErrorCode_=(
	//(NSInteger, CNErrorCode)
	    CNErrorCodeCommunicationError = 1,
	    CNErrorCodeDataAccessError = 2,
	    CNErrorCodeAuthorizationDenied = 100,
	    CNErrorCodeNoAccessableWritableContainers NS_ENUM_AVAILABLE(10_13_3, 11_3) = 101,
	    CNErrorCodeRecordDoesNotExist = 200,
	    CNErrorCodeInsertedRecordAlreadyExists = 201,
	    CNErrorCodeContainmentCycle = 202,
	    CNErrorCodeContainmentScope = 203,
	    CNErrorCodeParentRecordDoesNotExist = 204,
	    CNErrorCodeRecordIdentifierInvalid = 205,
	    CNErrorCodeValidationMultipleErrors = 300,
	    CNErrorCodeValidationTypeMismatch = 301,
	    CNErrorCodeValidationConfigurationError = 302,
	    CNErrorCodePredicateInvalid = 400,
	    CNErrorCodePolicyViolation = 500,
	    CNErrorCodeClientIdentifierInvalid = 600,
	    CNErrorCodeClientIdentifierDoesNotExist = 601,
	    CNErrorCodeVCardMalformed NS_ENUM_AVAILABLE(10_13, 11_0) = 700,
	    CNErrorCodeVCardSummarizationError NS_ENUM_AVAILABLE(10_14//, 12_0) = 701,
	);
	CNErrorCode=Integer;
	
	{! When available an array of one or more CNContact, CNGroup or CNContainer objects for which the error code applies. }
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNErrorUserInfoAffectedRecordsKey;
	
	{! When available an array of one or more NSString objects for which the error code applies. }
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNErrorUserInfoAffectedRecordIdentifiersKey;
	
	{! An array of NSErrors for CNErrorCodeValidationMultipleErrors. }
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNErrorUserInfoValidationErrorsKey;
	
	{! An array of key paths associated with a given error. For validation errors this will contain key paths to specific object properties. }
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNErrorUserInfoKeyPathsKey;
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}


{$ENDIF}

end.

