unit iOSApi.TWTRSessionStore;

interface

{$IFDEF IOS}
uses
  iOSApi.TWTRAuthConfig,
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
	PClass=Pointer;//PClass=Pointer of Class; ILocalObject(Class).GetObjectID
	PTWTRAuthSession=Pointer;//PTWTRAuthSession=Pointer of TWTRAuthSession; ILocalObject(TWTRAuthSession).GetObjectID

	//
	//  TWTRSessionStore.h
	//  TwitterCore
	//
	//  Copyright (c) 2015 Twitter Inc. All rights reserved.
	//
	
	
	
	
	//@protocol TWTRAuthSession;
	//@protocol TWTRAPIServiceConfig;
	//@protocol TWTRErrorLogger;
	
	
	
	//#pragma mark - TWTRSessionRefreshingStore Protocol
	
	{*
	 *  Completion block called when a session refresh succeeds or fails.
	 *
	 *  @param refreshedSession The refreshed session
	 *  @param error            Error that will be non nil if the refresh request failed
	 }
//	(^TWTRSessionStoreRefreshCompletion)(id _Nullable refreshedSession, NSError *_Nullable error)=void;
  TWTRSessionStoreRefreshCompletion=Pointer;

	{*
	 *  Protocol for session stores that can refresh expired sessions.
	 }
	TWTRSessionRefreshingStore=interface(IObjectiveC)
		['{BB1C35D3-8E46-4EB5-BADE-2C0BFCB77D59}']
		
		{*
		 *  Refresh an expired session.
		 *
		 *  @param sessionClass The class of the session
		 *  @param sessionID    ID of the session wherever applicable e.g. `userID` if it's a user session.
		 *  @param completion   The completion block to call when the refresh request succeeds or fails.
		 }
		[MethodName('refreshSessionClass:sessionID:completion:')]
		{-} procedure refreshSessionClasssessionIDcompletion(sessionClass:PClass;sessionID:{nullable} NSString{*};completion:TWTRSessionStoreRefreshCompletion);cdecl;

		{*
		 *  Determines whether the given session has expired.
		 *
		 *  @param session  The session to check for expiration
		 *  @param response API request response to check for expiration
		 *
		 *  @return Whether the session has expired.
		 }
		[MethodName('isExpiredSession:response:')]
		{-} function isExpiredSessionresponse(session:id;response:NSHTTPURLResponse{*}):Boolean;cdecl;
		
		{*
		 *  Determines whether the given session has expired based on a given error.
		 *
		 *  @param session  The session to check for expiration
		 *  @param error API request error to check for expiration
		 *
		 *  @return Whether the session has expired.
		 }
		[MethodName('isExpiredSession:error:')]
		{-} function isExpiredSessionerror(session:id;error:NSError{*}):Boolean;cdecl;
		
	end;
	
	TOnrefreshSessionClasssessionIDcompletion=procedure(sessionClass:PClass;sessionID:{nullable} NSString{*};completion:TWTRSessionStoreRefreshCompletion) of object;
	TOnisExpiredSessionresponse=function(session:id;response:NSHTTPURLResponse{*}):Boolean of object;
	TOnisExpiredSessionerror=function(session:id;error:NSError{*}):Boolean of object;
	
	TTWTRSessionRefreshingStore=class(TOCLocal,TWTRSessionRefreshingStore)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnrefreshSessionClasssessionIDcompletion:TOnrefreshSessionClasssessionIDcompletion;
		OnisExpiredSessionresponse:TOnisExpiredSessionresponse;
		OnisExpiredSessionerror:TOnisExpiredSessionerror;
	
		
		{*
		 *  Refresh an expired session.
		 *
		 *  @param sessionClass The class of the session
		 *  @param sessionID    ID of the session wherever applicable e.g. `userID` if it's a user session.
		 *  @param completion   The completion block to call when the refresh request succeeds or fails.
		 }
		[MethodName('refreshSessionClass:sessionID:completion:')]
		{-} procedure refreshSessionClasssessionIDcompletion(sessionClass:PClass;sessionID:{nullable} NSString{*};completion:TWTRSessionStoreRefreshCompletion);cdecl;
		
		{*
		 *  Determines whether the given session has expired.
		 *
		 *  @param session  The session to check for expiration
		 *  @param response API request response to check for expiration
		 *
		 *  @return Whether the session has expired.
		 }
		[MethodName('isExpiredSession:response:')]
		{-} function isExpiredSessionresponse(session:id;response:NSHTTPURLResponse{*}):Boolean;cdecl;
		
		{*
		 *  Determines whether the given session has expired based on a given error.
		 *
		 *  @param session  The session to check for expiration
		 *  @param error API request error to check for expiration
		 *
		 *  @return Whether the session has expired.
		 }
		[MethodName('isExpiredSession:error:')]
		{-} function isExpiredSessionerror(session:id;error:NSError{*}):Boolean;cdecl;
		
	end;
	
	
	//#pragma mark - TWTRUserSessionStore Protocol
	
	{*
	 *  Completion block called when a user session saved to the session store or fails.
	 *
	 *  @param session The saved session
	 *  @param error   Error that will be non nil if the save request fails.
	 }
//	(^TWTRSessionStoreSaveCompletion)(id<TWTRAuthSession> _Nullable session, NSError *_Nullable error)=void;
  TWTRSessionStoreSaveCompletion=Pointer;
	{*
	 *  Completion block called when fetching all stored user sessions completes or fails.
	 *
	 *  @param sessions All stored user sessions or empty array if there are no user sessions found.
	 }
//	(^TWTRSessionStoreBatchFetchCompletion)(NSArray *sessions)=void;
	TWTRSessionStoreBatchFetchCompletion=Pointer;
	{*
	 *  Completion block to call when the session is deleted or fails.
	 *
	 *  @param session The deleted session or nil if none was found for the user.
	 }
//	(^TWTRSessionStoreDeleteCompletion)(id<TWTRAuthSession> _Nullable session)=void;
	TWTRSessionStoreDeleteCompletion=Pointer;
	{*
	 *  Protocol for session store that manages user sessions.
	 }
	TWTRUserSessionStore=interface(IObjectiveC)
		['{F6B875BF-46F7-43AC-9376-8FDA337DDB2E}']
		
		{*
		 *  Saves the existing session to the store after validations.
		 *
		 *  @param session    The user session to save
		 *  @param completion Completion block to call when the save request succeeds or fails
		 }
		[MethodName('saveSession:completion:')]
		{-} procedure saveSessioncompletion(session:PTWTRAuthSession{id<TWTRAuthSession>};completion:TWTRSessionStoreSaveCompletion);cdecl;
		
		{*
		 *  Fetches the user session for for the given auth tokens and saves it to the store after validations.
		 *
		 *  @param authToken       The existing authToken to use for authentication.
		 *  @param authTokenSecret The existing authTokenSecret to use for authentication.
		 *  @param completion      Completion block to call when the save request succeeds or fails
		 }
		[MethodName('saveSessionWithAuthToken:authTokenSecret:completion:')]
		{-} procedure saveSessionWithAuthTokenauthTokenSecretcompletion(authToken:NSString{*};authTokenSecret:NSString{*};completion:TWTRSessionStoreSaveCompletion);cdecl;
		
		{*
		 *  Checks to see if the user is logged in and has a saved session.
		 *
		 *  @param userID   The user ID to fetch session for.
		 }
		{-} function sessionForUserID(userID:NSString{*}):{nullable} id{<TWTRAuthSession>};cdecl;

		{*
		 *  Retrieve all logged in user sessions in ascending order of last saved date
		 *
		 *  @note This is a blocking call.
		 }
		{-} function existingUserSessions:NSArray{*};cdecl;
		
		{-} function hasLoggedInUsers:Boolean;cdecl;
		
		{*
		 *  Retrieves the last logged in user session.
		 *
		 *  @return The last logged in user session.
		 }
		{-} function session:{nullable} id{<TWTRAuthSession>};cdecl;
		
		{*
		 *  Deletes the local Twitter user session from this app. This will not remove the system Twitter account nor make a network request to invalidate the session.
		 *
		 *  @param userID ID of the user to log out
		 }
		{-} procedure logOutUserID(userID:NSString{*});cdecl;
		
	end;
	
	TOnsaveSessioncompletion=procedure(session:PTWTRAuthSession{id<TWTRAuthSession>};completion:TWTRSessionStoreSaveCompletion) of object;
	TOnsaveSessionWithAuthTokenauthTokenSecretcompletion=procedure(authToken:NSString{*};authTokenSecret:NSString{*};completion:TWTRSessionStoreSaveCompletion) of object;
	TOnsessionForUserID=function(userID:NSString{*}):{nullable} id{<TWTRAuthSession>} of object;
	TOnexistingUserSessions=function():NSArray{*} of object;
	TOnhasLoggedInUsers=function():Boolean of object;
	TOnsession=function():{nullable} id{<TWTRAuthSession>} of object;
	TOnlogOutUserID=procedure(userID:NSString{*}) of object;
	
	TTWTRUserSessionStore=class(TOCLocal,TWTRUserSessionStore)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnsaveSessioncompletion:TOnsaveSessioncompletion;
		OnsaveSessionWithAuthTokenauthTokenSecretcompletion:TOnsaveSessionWithAuthTokenauthTokenSecretcompletion;
		OnsessionForUserID:TOnsessionForUserID;
		OnexistingUserSessions:TOnexistingUserSessions;
		OnhasLoggedInUsers:TOnhasLoggedInUsers;
		Onsession:TOnsession;
		OnlogOutUserID:TOnlogOutUserID;
	
		
		{*
		 *  Saves the existing session to the store after validations.
		 *
		 *  @param session    The user session to save
		 *  @param completion Completion block to call when the save request succeeds or fails
		 }
		[MethodName('saveSession:completion:')]
		{-} procedure saveSessioncompletion(session:PTWTRAuthSession{id<TWTRAuthSession>};completion:TWTRSessionStoreSaveCompletion);cdecl;
		
		{*
		 *  Fetches the user session for for the given auth tokens and saves it to the store after validations.
		 *
		 *  @param authToken       The existing authToken to use for authentication.
		 *  @param authTokenSecret The existing authTokenSecret to use for authentication.
		 *  @param completion      Completion block to call when the save request succeeds or fails
		 }
		[MethodName('saveSessionWithAuthToken:authTokenSecret:completion:')]
		{-} procedure saveSessionWithAuthTokenauthTokenSecretcompletion(authToken:NSString{*};authTokenSecret:NSString{*};completion:TWTRSessionStoreSaveCompletion);cdecl;
		
		{*
		 *  Checks to see if the user is logged in and has a saved session.
		 *
		 *  @param userID   The user ID to fetch session for.
		 }
		{-} function sessionForUserID(userID:NSString{*}):{nullable} id{<TWTRAuthSession>};cdecl;
		
		{*
		 *  Retrieve all logged in user sessions in ascending order of last saved date
		 *
		 *  @note This is a blocking call.
		 }
		{-} function existingUserSessions:NSArray{*};cdecl;
		
		{-} function hasLoggedInUsers:Boolean;cdecl;
		
		{*
		 *  Retrieves the last logged in user session.
		 *
		 *  @return The last logged in user session.
		 }
		{-} function session:{nullable} id{<TWTRAuthSession>};cdecl;
		
		{*
		 *  Deletes the local Twitter user session from this app. This will not remove the system Twitter account nor make a network request to invalidate the session.
		 *
		 *  @param userID ID of the user to log out
		 }
		{-} procedure logOutUserID(userID:NSString{*});cdecl;
		
	end;
	
	
	//#pragma mark - TWTRGuestSessionStore Protocol
	
	{*
	 *  Completion block called when retrieving a guest session succeeds or fails.
	 *
	 *  @param guestSession The retrieved guest session
	 *  @param error        Error that will be non nil if the save request fails.
	 }
//	(^TWTRSessionGuestLogInCompletion)(TWTRGuestSession *_Nullable guestSession, NSError *_Nullable error)=void;
	TWTRSessionGuestLogInCompletion=Pointer;
	{*
	 *  Protocol for session stores that can manage guest sessions.
	 }
	TWTRGuestSessionStore=interface(IObjectiveC)
		['{83981C37-DF78-4233-A307-1E4E75F6E51C}']
		
		{*
		 *  Log in as a guest user and return the guest session. This can be used when the user is not a Twitter user.
		 *
		 *  @param completion Completion block to call when the authentication succeeds or fails.
		 *
		 *  @warning This method assumes your application, as indicated by the `consumerKey` and `consumerSecret` in the `authConfig`, has been whitelisted for guest authentication.
		 }
		{-} procedure fetchGuestSessionWithCompletion(completion:TWTRSessionGuestLogInCompletion);cdecl;
		
	end;
	
	TOnfetchGuestSessionWithCompletion=procedure(completion:TWTRSessionGuestLogInCompletion) of object;
	
	TTWTRGuestSessionStore=class(TOCLocal,TWTRGuestSessionStore)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnfetchGuestSessionWithCompletion:TOnfetchGuestSessionWithCompletion;
	
		
		{*
		 *  Log in as a guest user and return the guest session. This can be used when the user is not a Twitter user.
		 *
		 *  @param completion Completion block to call when the authentication succeeds or fails.
		 *
		 *  @warning This method assumes your application, as indicated by the `consumerKey` and `consumerSecret` in the `authConfig`, has been whitelisted for guest authentication.
		 }
		{-} procedure fetchGuestSessionWithCompletion(completion:TWTRSessionGuestLogInCompletion);cdecl;
		
	end;
	
	
	//#pragma mark - Composite TWTRSessionStore Protocol
	
	{*
	 *  Convenience composite protocol of a store that handles user, guest, and refreshable sessions.
	 }
	TWTRSessionStore=interface(IObjectiveC)
		['{647F88CF-C12F-4E6D-ABCF-F89C8B7BAA63}']
		
		{*
		 *  Returns the store's auth config.
		 }
		function authConfig:TWTRAuthConfig{*};cdecl;
		procedure setAuthConfig(authConfig:TWTRAuthConfig{*});cdecl;
		
	end;
	
	TOnauthConfig=function():TWTRAuthConfig{*} of object;
	TOnsetauthConfig=procedure(authConfig:TWTRAuthConfig{*}) of object;
	
	TTWTRSessionStore=class(TOCLocal,TWTRSessionStore)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnauthConfig:TOnauthConfig;
		OnsetauthConfig:TOnsetauthConfig;
	
		
		{*
		 *  Returns the store's auth config.
		 }
		function authConfig:TWTRAuthConfig{*};cdecl;
		procedure setAuthConfig(authConfig:TWTRAuthConfig{*});cdecl;
		
	end;
	
	
	//#pragma mark - Concrete Session Store Class
	
	{*
	 *  Concrete implementation of <TWTRSessionStore>. This session store supports fetching and storage of
	 *  user and guest sessions. In addition, the session store also supports refreshing of such sessions when they expire.
	 *
	 *  @warning Instances of the session manager at the same path are not synchronized. The session store
	 *  will simply choose the latest version in the case of conflicts.
	 }
//	TWTRSessionStore=interface(NSObject)//<TWTRSessionStore>
//	['{01C6C2B4-0BF4-402D-ADDD-41CC20FD2DC5}']
//
//		{-} function init NS_UNAVAILABLE:TWTRSessionStore;cdecl;
//
//		{*
//		 * Provides a mechanism for reloading the session store. This method will force the session store
//		 * to find any sessions that may have been saved by another session store or application that is
//		 * using the same keychain access groups.
//		 *
//		 * Most applications will not need to call this method. You may need to call this method if you are
//		 * using multiple stores within your application and you need to synchronize when one writes to the
//		 * store. The more likely case for needing to call this method is if you are sharing credentials
//		 * between applications. In this situation you will want to call this method when the application
//		 * comes back to the foreground.
//		 *
//		 * This method does not need to be called when the store is created because this process happens
//		 * by default at time of instantiation.
//		 *
//		 * You should avoid calling this method if you do not have a specific reason to do so, like the reasons
//		 * mentioned above as this method does cause disk I/O and multiple calls can cause performance problems.
//		 }
//		{-} procedure reloadSessionStore;cdecl;
//
//	end;
//
//	TWTRSessionStoreClass=interface(NSObjectClass)//<TWTRSessionStore>
//	['{85E93C3A-707B-41AA-BA10-CC5A754B5950}']
//	end;
//
//	TTWTRSessionStore=class(TOCGenericImport<TWTRSessionStoreClass,TWTRSessionStore>)
//	end;

	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRSessionRefreshingStore }

constructor TTWTRSessionRefreshingStore.Create;
begin
	Inherited Create;
end;

destructor TTWTRSessionRefreshingStore.Destroy;
begin
	Inherited;
end;

procedure  TTWTRSessionRefreshingStore.refreshSessionClasssessionIDcompletion(sessionClass:PClass;sessionID:{nullable} NSString{*};completion:TWTRSessionStoreRefreshCompletion);
begin
	if Assigned(OnrefreshSessionClasssessionIDcompletion) then
	begin
		OnrefreshSessionClasssessionIDcompletion(sessionClass,sessionID,completion);
	end;
end;

function  TTWTRSessionRefreshingStore.isExpiredSessionresponse(session:id;response:NSHTTPURLResponse{*}):Boolean;
begin
	if Assigned(OnisExpiredSessionresponse) then
	begin
		Result:=OnisExpiredSessionresponse(session,response);
	end;
end;

function  TTWTRSessionRefreshingStore.isExpiredSessionerror(session:id;error:NSError{*}):Boolean;
begin
	if Assigned(OnisExpiredSessionerror) then
	begin
		Result:=OnisExpiredSessionerror(session,error);
	end;
end;


{ TTWTRUserSessionStore }

constructor TTWTRUserSessionStore.Create;
begin
	Inherited Create;
end;

destructor TTWTRUserSessionStore.Destroy;
begin
	Inherited;
end;

procedure  TTWTRUserSessionStore.saveSessioncompletion(session:PTWTRAuthSession{id<TWTRAuthSession>};completion:TWTRSessionStoreSaveCompletion);
begin
	if Assigned(OnsaveSessioncompletion) then
	begin
		OnsaveSessioncompletion(session,completion);
	end;
end;

procedure  TTWTRUserSessionStore.saveSessionWithAuthTokenauthTokenSecretcompletion(authToken:NSString{*};authTokenSecret:NSString{*};completion:TWTRSessionStoreSaveCompletion);
begin
	if Assigned(OnsaveSessionWithAuthTokenauthTokenSecretcompletion) then
	begin
		OnsaveSessionWithAuthTokenauthTokenSecretcompletion(authToken,authTokenSecret,completion);
	end;
end;

function  TTWTRUserSessionStore.sessionForUserID(userID:NSString{*}):{nullable} id{<TWTRAuthSession>};
begin
	if Assigned(OnsessionForUserID) then
	begin
		Result:=OnsessionForUserID(userID);
	end;
end;

function  TTWTRUserSessionStore.existingUserSessions():NSArray{*};
begin
	if Assigned(OnexistingUserSessions) then
	begin
		Result:=OnexistingUserSessions();
	end;
end;

function  TTWTRUserSessionStore.hasLoggedInUsers():Boolean;
begin
	if Assigned(OnhasLoggedInUsers) then
	begin
		Result:=OnhasLoggedInUsers();
	end;
end;

function  TTWTRUserSessionStore.session():{nullable} id{<TWTRAuthSession>};
begin
	if Assigned(Onsession) then
	begin
		Result:=Onsession();
	end;
end;

procedure  TTWTRUserSessionStore.logOutUserID(userID:NSString{*});
begin
	if Assigned(OnlogOutUserID) then
	begin
		OnlogOutUserID(userID);
	end;
end;


{ TTWTRGuestSessionStore }

constructor TTWTRGuestSessionStore.Create;
begin
	Inherited Create;
end;

destructor TTWTRGuestSessionStore.Destroy;
begin
	Inherited;
end;

procedure  TTWTRGuestSessionStore.fetchGuestSessionWithCompletion(completion:TWTRSessionGuestLogInCompletion);
begin
	if Assigned(OnfetchGuestSessionWithCompletion) then
	begin
		OnfetchGuestSessionWithCompletion(completion);
	end;
end;


{ TTWTRSessionStore }

constructor TTWTRSessionStore.Create;
begin
	Inherited Create;
end;

destructor TTWTRSessionStore.Destroy;
begin
	Inherited;
end;

procedure  TTWTRSessionStore.setauthConfig(authConfig:TWTRAuthConfig{*});
begin
	if Assigned(OnsetauthConfig) then
	begin
		OnsetauthConfig(authConfig);
	end;
end;

function  TTWTRSessionStore.authConfig():TWTRAuthConfig{*};
begin
	if Assigned(OnauthConfig) then
	begin
		Result:=OnauthConfig();
	end;
end;



{$ENDIF}

end.

