//
//  TWTRCoreOAuthSigning.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRCoreOAuthSigning;

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
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	
	
	
	
	
	TWTRCoreOAuthSigning=interface(IObjectiveC)
		['{0D427B26-05CD-4DD2-A3AC-549741A6228C}']
		
		{*
		 *  @name OAuth Echo
		 }
		
		{*
		 *  OAuth Echo is a means to securely delegate OAuth authorization to a third party while interacting with an API.
		 *  For example, you may wish to verify a user's credentials from your app's server (the third party) rather than your app.
		 *  This method provides you with the OAuth signature to add to the third party's request to `URLString`, as well as the formed
		 *  URL with the query string to send that request to.
		 *  This is equivalent to calling `-URLRequestWithMethod:URL:parameters:error:` and getting the URL and the `Authorization` HTTP header out of the request.
		 *
		 *  @param method       Request method, GET, POST, PUT, DELETE, etc.
		 *  @param URLString    The full URL of the Twitter endpoint you plan to send a request to. E.g. https://api.twitter.com/1.1/account/verify_credentials.json
		 *  @param parameters   Request parameters.
		 *  @param error        Error in the `TWTRErrorDomain` domain. The code will be `TWTRErrorCodeInvalidURL` if the `URLString`'s host is not api.twitter.com
		 *
		 *  @return `nil` if there's an error or a missing required parameter, or a dictionary with the fully formed request URL under `TWTROAuthEchoRequestURLStringKey` (`NSString`), and the `Authorization` header in `TWTROAuthEchoAuthorizationHeaderKey` (`NSString`), to be used to sign the request.
		 *
		 *  @see More information about OAuth Echo: https://dev.twitter.com/oauth/echo
		 }
		[MethodName('OAuthEchoHeadersForRequestMethod:URLString:parameters:error:')]
		{-} function OAuthEchoHeadersForRequestMethodURLStringparameterserror(method:NSString{*};URLString:NSString{*};parameters:{nullable} NSDictionary{*};error:PNSError {**}):PNSDictionary{*};cdecl;
		
		{*
		 *  This method provides you with the OAuth signature, as well as the formed URL with the query string, to send a request to `verify_credentials`.
		 *
		 *  @return A dictionary with the fully formed Request URL under `TWTROAuthEchoRequestURLStringKey` (`NSString`), and the `Authorization` header in `TWTROAuthEchoAuthorizationHeaderKey` (`NSString`), to be used to sign the request.
		 *
		 *  @see More information about OAuth Echo: https://dev.twitter.com/oauth/echo
		 *  @see More information about Verify Credentials: https://dev.twitter.com/rest/reference/get/account/verify_credentials
		 }
		{-} function OAuthEchoHeadersToVerifyCredentials:PNSDictionary{*};cdecl;
		
	end;
	
	TOnOAuthEchoHeadersForRequestMethodURLStringparameterserror=function(method:NSString{*};URLString:NSString{*};parameters:{nullable} NSDictionary{*};error:PNSError {**}):PNSDictionary{*} of object;
	TOnOAuthEchoHeadersToVerifyCredentials=function():PNSDictionary{*} of object;
	
	TTWTRCoreOAuthSigning=class(TOCLocal,TWTRCoreOAuthSigning)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnOAuthEchoHeadersForRequestMethodURLStringparameterserror:TOnOAuthEchoHeadersForRequestMethodURLStringparameterserror;
		OnOAuthEchoHeadersToVerifyCredentials:TOnOAuthEchoHeadersToVerifyCredentials;
	
		
		{*
		 *  @name OAuth Echo
		 }
		
		{*
		 *  OAuth Echo is a means to securely delegate OAuth authorization to a third party while interacting with an API.
		 *  For example, you may wish to verify a user's credentials from your app's server (the third party) rather than your app.
		 *  This method provides you with the OAuth signature to add to the third party's request to `URLString`, as well as the formed
		 *  URL with the query string to send that request to.
		 *  This is equivalent to calling `-URLRequestWithMethod:URL:parameters:error:` and getting the URL and the `Authorization` HTTP header out of the request.
		 *
		 *  @param method       Request method, GET, POST, PUT, DELETE, etc.
		 *  @param URLString    The full URL of the Twitter endpoint you plan to send a request to. E.g. https://api.twitter.com/1.1/account/verify_credentials.json
		 *  @param parameters   Request parameters.
		 *  @param error        Error in the `TWTRErrorDomain` domain. The code will be `TWTRErrorCodeInvalidURL` if the `URLString`'s host is not api.twitter.com
		 *
		 *  @return `nil` if there's an error or a missing required parameter, or a dictionary with the fully formed request URL under `TWTROAuthEchoRequestURLStringKey` (`NSString`), and the `Authorization` header in `TWTROAuthEchoAuthorizationHeaderKey` (`NSString`), to be used to sign the request.
		 *
		 *  @see More information about OAuth Echo: https://dev.twitter.com/oauth/echo
		 }
		[MethodName('OAuthEchoHeadersForRequestMethod:URLString:parameters:error:')]
		{-} function OAuthEchoHeadersForRequestMethodURLStringparameterserror(method:NSString{*};URLString:NSString{*};parameters:{nullable} NSDictionary{*};error:PNSError {**}):PNSDictionary{*};cdecl;
		
		{*
		 *  This method provides you with the OAuth signature, as well as the formed URL with the query string, to send a request to `verify_credentials`.
		 *
		 *  @return A dictionary with the fully formed Request URL under `TWTROAuthEchoRequestURLStringKey` (`NSString`), and the `Authorization` header in `TWTROAuthEchoAuthorizationHeaderKey` (`NSString`), to be used to sign the request.
		 *
		 *  @see More information about OAuth Echo: https://dev.twitter.com/oauth/echo
		 *  @see More information about Verify Credentials: https://dev.twitter.com/rest/reference/get/account/verify_credentials
		 }
		{-} function OAuthEchoHeadersToVerifyCredentials:PNSDictionary{*};cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRCoreOAuthSigning }

constructor TTWTRCoreOAuthSigning.Create;
begin
	Inherited Create;
end;

destructor TTWTRCoreOAuthSigning.Destroy;
begin
	Inherited;
end;

function  TTWTRCoreOAuthSigning.OAuthEchoHeadersForRequestMethodURLStringparameterserror(method:NSString{*};URLString:NSString{*};parameters:{nullable} NSDictionary{*};error:PNSError {**}):PNSDictionary{*};
begin
	if Assigned(OnOAuthEchoHeadersForRequestMethodURLStringparameterserror) then
	begin
		Result:=OnOAuthEchoHeadersForRequestMethodURLStringparameterserror(method,URLString,parameters,error);
	end;
end;

function  TTWTRCoreOAuthSigning.OAuthEchoHeadersToVerifyCredentials():PNSDictionary{*};
begin
	if Assigned(OnOAuthEchoHeadersToVerifyCredentials) then
	begin
		Result:=OnOAuthEchoHeadersToVerifyCredentials();
	end;
end;



{$ENDIF}

end.

