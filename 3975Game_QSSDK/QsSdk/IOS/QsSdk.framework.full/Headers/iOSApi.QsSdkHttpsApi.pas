
unit iOSApi.QsSdkHttpsApi;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import "QsSdkDef.h"
	iOSApi.QsSdkDef,
	//#import "QsSdkHttpResponse.h"
	iOSApi.QsSdkHttpResponse,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	
	TQsSdkRequestSuccessEvent=procedure (response:QsSdkHttpResponse) of object;
	//typedef void (^QsSdkRequestSuccess)(QsSdkHttpResponse*);
  QsSdkRequestSuccess=TQsSdkRequestSuccessEvent;

	//typedef void (^QsSdkRequestSuccess)(QsSdkHttpResponse*);
	TQsSdkRequestErrorEvent=procedure (error:NSString) of object;
	//typedef void (^QsSdkRequestError)(NSString*);
  QsSdkRequestError=TQsSdkRequestErrorEvent;

	//typedef void (^QsSdkRequestError)(NSString*);
	
	//@interface QsSdkHttpsApi : NSObject
	//@interface QsSdkHttpsApi : NSObject
	QsSdkHttpsApi=interface(NSObject)//
	['{73012BB7-9E8E-4EF7-B748-2DA07A4789A9}']
		
		
		//-(NSString *)getQsSdkPayUrl;
		function getQsSdkPayUrl:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkUserCenter1Url;
		function getQsSdkUserCenter1Url:NSString;cdecl;
		
		
		//-(void)doQsSdkGetInitConfigRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkGetInitConfigRequest:success:failed:')]
		procedure doQsSdkGetInitConfigRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkGetRandomAccountRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkGetRandomAccountRequest:success:failed:')]
		procedure doQsSdkGetRandomAccountRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkGetPicCodeRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkGetPicCodeRequest:success:failed:')]
		procedure doQsSdkGetPicCodeRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkGetPhoneCodeRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkGetPhoneCodeRequest:success:failed:')]
		procedure doQsSdkGetPhoneCodeRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkRegisterRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkRegisterRequest:success:failed:')]
		procedure doQsSdkRegisterRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkLoginRequest:success:failed:')]
		procedure doQsSdkLoginRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkLogoutRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkLogoutRequest:success:failed:')]
		procedure doQsSdkLogoutRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkTokenLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkTokenLoginRequest:success:failed:')]
		procedure doQsSdkTokenLoginRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkPhoneLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkPhoneLoginRequest:success:failed:')]
		procedure doQsSdkPhoneLoginRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		////Íü¼ÇÃÜÂë
		//-(void)doQsSdkForgetPwdRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkForgetPwdRequest:success:failed:')]
		procedure doQsSdkForgetPwdRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkRoleUploadRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkRoleUploadRequest:success:failed:')]
		procedure doQsSdkRoleUploadRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkSmrzRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkSmrzRequest:success:failed:')]
		procedure doQsSdkSmrzRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkChildUserRegisterRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkChildUserRegisterRequest:success:failed:')]
		procedure doQsSdkChildUserRegisterRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkChildUserLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkChildUserLoginRequest:success:failed:')]
		procedure doQsSdkChildUserLoginRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkGetChildUserListRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkGetChildUserListRequest:success:failed:')]
		procedure doQsSdkGetChildUserListRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkCreateOrderRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkCreateOrderRequest:success:failed:')]
		procedure doQsSdkCreateOrderRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkQueryOrderRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkQueryOrderRequest:success:failed:')]
		procedure doQsSdkQueryOrderRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkIapVerifyRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkIapVerifyRequest:success:failed:')]
		procedure doQsSdkIapVerifyRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkSendActiveRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkSendActiveRequest:success:failed:')]
		procedure doQsSdkSendActiveRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkSendHeartRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkSendHeartRequest:success:failed:')]
		procedure doQsSdkSendHeartRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkQuerySmrzRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkQuerySmrzRequest:success:failed:')]
		procedure doQsSdkQuerySmrzRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//-(void)doQsSdkChannelLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;
		[MethodName('doQsSdkChannelLoginRequest:success:failed:')]
		procedure doQsSdkChannelLoginRequestsuccessfailed(params:NSMutableDictionary;success:QsSdkRequestSuccess;failed:QsSdkRequestError);cdecl;
		
		
		//- (void)doQsSdkPostAction:(NSString *)Path
		              //Params:(NSMutableDictionary *)Params
		             //Success:(QsSdkRequestSuccess)Success
		               //Error:(QsSdkRequestError)Error
		                 //Msg:(NSString *)Msg
		               //showLoading:(BOOL)showLoading
		                   //timeOut:(int)time;
		 //- (void)doQsSdkPostAction:(NSString *)Path               Params:(NSMutableDictionary *)Params              Success:(QsSdkRequestSuccess)Success                Error:(QsSdkRequestError)Error                  Msg:(NSString *)Msg                showLoading:(BOOL)showLoading                    timeOut:(int)time;
		[MethodName('doQsSdkPostAction:Params:Success:Error:Msg:showLoading:timeOut:')]
		procedure doQsSdkPostActionParamsSuccessErrorMsgshowLoadingtimeOut(Path:NSString;Params:NSMutableDictionary;Success:QsSdkRequestSuccess;Error:QsSdkRequestError;Msg:NSString;showLoading:Boolean;time:Integer);cdecl;
		
		
		
	end;
	
	QsSdkHttpsApiClass=interface(NSObjectClass)//
	['{3BB43F7D-017B-499E-8CBD-D787846869AE}']
		//+(QsSdkHttpsApi*)insQsSdk;
		function insQsSdk:QsSdkHttpsApi;cdecl;
		
	end;
	
	TQsSdkHttpsApi=class(TOCGenericImport<QsSdkHttpsApiClass,QsSdkHttpsApi>)
	end;
	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkHttpsApi_FakeLoader : QsSdkHttpsApi; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkHttpsApi';
{$O+}



{$ENDIF}

end.

