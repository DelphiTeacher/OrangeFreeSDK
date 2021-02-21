//
//  TWTRAuthSession.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRAuthSession;

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
	 * The base session which all sessions must conform to.
	 }
	TWTRBaseSession=interface(IObjectiveC)
		['{CC76C6BB-A774-4EDC-A50B-9A46C50013C4}']
	end;
	
	
	TTWTRBaseSession=class(TOCLocal,TWTRBaseSession)
	public
		constructor Create;
		destructor Destroy;override;
	public
	
	end;
	
	
	{*
	 *  Encapsulates the authorization details of an OAuth Session.
	 }
	TWTRAuthSession=interface(IObjectiveC)
		['{82ACC754-6251-42FC-B659-3AE29F482418}']
		
		function authToken:NSString{*};cdecl;
		procedure setAuthToken(authToken:NSString{*});cdecl;
		function authTokenSecret:NSString{*};cdecl;
		procedure setAuthTokenSecret(authTokenSecret:NSString{*});cdecl;
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
	end;
	
	TOnauthToken=function():NSString{*} of object;
	TOnsetauthToken=procedure(authToken:NSString{*}) of object;
	TOnauthTokenSecret=function():NSString{*} of object;
	TOnsetauthTokenSecret=procedure(authTokenSecret:NSString{*}) of object;
	TOnuserID=function():NSString{*} of object;
	TOnsetuserID=procedure(userID:NSString{*}) of object;
	
	TTWTRAuthSession=class(TOCLocal,TWTRAuthSession)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnauthToken:TOnauthToken;
		OnsetauthToken:TOnsetauthToken;
		OnauthTokenSecret:TOnauthTokenSecret;
		OnsetauthTokenSecret:TOnsetauthTokenSecret;
		OnuserID:TOnuserID;
		OnsetuserID:TOnsetuserID;
	
		
		function authToken:NSString{*};cdecl;
		procedure setAuthToken(authToken:NSString{*});cdecl;
		function authTokenSecret:NSString{*};cdecl;
		procedure setAuthTokenSecret(authTokenSecret:NSString{*});cdecl;
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRBaseSession }

constructor TTWTRBaseSession.Create;
begin
	Inherited Create;
end;

destructor TTWTRBaseSession.Destroy;
begin
	Inherited;
end;


{ TTWTRAuthSession }

constructor TTWTRAuthSession.Create;
begin
	Inherited Create;
end;

destructor TTWTRAuthSession.Destroy;
begin
	Inherited;
end;

procedure  TTWTRAuthSession.setauthToken(authToken:NSString{*});
begin
	if Assigned(OnsetauthToken) then
	begin
		OnsetauthToken(authToken);
	end;
end;

function  TTWTRAuthSession.authToken():NSString{*};
begin
	if Assigned(OnauthToken) then
	begin
		Result:=OnauthToken();
	end;
end;

procedure  TTWTRAuthSession.setauthTokenSecret(authTokenSecret:NSString{*});
begin
	if Assigned(OnsetauthTokenSecret) then
	begin
		OnsetauthTokenSecret(authTokenSecret);
	end;
end;

function  TTWTRAuthSession.authTokenSecret():NSString{*};
begin
	if Assigned(OnauthTokenSecret) then
	begin
		Result:=OnauthTokenSecret();
	end;
end;

procedure  TTWTRAuthSession.setuserID(userID:NSString{*});
begin
	if Assigned(OnsetuserID) then
	begin
		OnsetuserID(userID);
	end;
end;

function  TTWTRAuthSession.userID():NSString{*};
begin
	if Assigned(OnuserID) then
	begin
		Result:=OnuserID();
	end;
end;



{$ENDIF}

end.

