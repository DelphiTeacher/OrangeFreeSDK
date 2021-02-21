//
//  TWTRConstants.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRConstants;

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

	
	
	
	{*
	 * The NSError domain of errors surfaced by the Twitter SDK.
	 }
	
	
	{*
	 *  Error codes surfaced by the Twitter SDK.
	 }
	TWTRErrorCode_=(
	//(NSInteger, TWTRErrorCode) {
	//    /**
	//     *  Unknown error.
	//     */
	    TWTRErrorCodeUnknown = -1,
	//    /**
	//     *  Authentication has not been set up yet. You must call -[Twitter logInWithCompletion:] or -[Twitter logInGuestWithCompletion:]
	//     */
	    TWTRErrorCodeNoAuthentication = 0,
	//    /**
	//     *  Twitter has not been initialized yet. Call +[Fabric with:@[TwitterKit]] or -[Twitter startWithConsumerKey:consumerSecret:].
	//     */
	    TWTRErrorCodeNotInitialized = 1,
	//    /**
	//     *  User has declined to grant permission to information such as their email address.
	//     */
	    TWTRErrorCodeUserDeclinedPermission = 2,
	//    /**
	//     *  User has granted permission to their email address but no address is associated with their account.
	//     */
	    TWTRErrorCodeUserHasNoEmailAddress = 3,
	//    /**
	//     *  A resource has been requested by ID, but that ID was not found.
	//     */
	    TWTRErrorCodeInvalidResourceID = 4,
	//    /**
	//     *  A request has been issued for an invalid URL.
	//     */
	    TWTRErrorCodeInvalidURL = 5,
	//    /**
	//     *  Type mismatch in parsing JSON from the Twitter API.
	//     */
	    TWTRErrorCodeMismatchedJSONType = 6,
	//    /**
	//     *  Fail to save to keychain.
	//     */
	    TWTRErrorCodeKeychainSerializationFailure = 7,
	//    /**
	//     *  Fail to save to disk.
	//     */
	    TWTRErrorCodeDiskSerializationError = 8,
	//    /**
	//     *  Error authenticating with the webview.
	//     */
	    TWTRErrorCodeWebViewError = 9,
	//    /**
	//     *  A required parameter is missing.
	//     */
	    TWTRErrorCodeMissingParameter = 10
	);
	TWTRErrorCode=Integer;
	
	{*
	 *  The NSError domain of errors surfaced by the Twitter SDK during the login operation.
	 }
	
	
	{*
	 *  Error codes surfaced by the Twitter SDK with the `TWTRLogInErrorDomain` error domain.
	 }
	TWTRLogInErrorCode_=(
	//(NSInteger, TWTRLogInErrorCode) {
	//    /**
	//     * Unknown error.
	//     */
	    TWTRLogInErrorCodeUnknown = -1,
	//    /**
	//     * User denied login.
	//     */
	    TWTRLogInErrorCodeDenied = 0,
	//    /**
	//     * User canceled login.
	//     */
	    TWTRLogInErrorCodeCancelled = 1,
	//    /**
	//     * No Twitter account found.
	//     */
	    TWTRLogInErrorCodeNoAccounts = 2,
	//    /**
	//     * Reverse auth with linked account failed.
	//     */
	    TWTRLogInErrorCodeReverseAuthFailed = 3,
	//    /**
	//     *  Refreshing session tokens failed.
	//     */
	    TWTRLogInErrorCodeCannotRefreshSession = 4,
	//    /**
	//     *  No such session or session is not tracked
	//     *  in the associated session store.
	//     */
	    TWTRLogInErrorCodeSessionNotFound = 5,
	//    /**
	//     * The login request failed.
	//     */
	    TWTRLogInErrorCodeFailed = 6,
	//    /**
	//     * The system account credentials are no longer valid and the
	//     * user will need to update their credentials in the Settings app.
	//     */
	    TWTRLogInErrorCodeSystemAccountCredentialsInvalid = 7,
	//    /**
	//     *  There was no Twitter iOS app installed to attemp
	//     *  the Mobile SSO flow.
	//     */
	    TWTRLoginErrorNoTwitterApp = 8//,
	);
	TWTRLogInErrorCode=Integer;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

