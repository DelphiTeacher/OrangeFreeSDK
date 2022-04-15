// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

unit iOSApi.FBSDKGraphErrorRecoveryProcessor;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSApi.FBSDKConstants,
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
	PFBSDKGraphErrorRecoveryProcessorDelegate=Pointer;//PFBSDKGraphErrorRecoveryProcessorDelegate=Pointer of FBSDKGraphErrorRecoveryProcessorDelegate; ILocalObject(FBSDKGraphErrorRecoveryProcessorDelegate).GetObjectID

	
	
	
	
	
	{*
	  Defines a delegate for `FBSDKGraphErrorRecoveryProcessor`.
	 }
	FBSDKGraphErrorRecoveryProcessorDelegate=interface(IObjectiveC)
		['{BCA61DBD-CCB9-49F6-8424-F9C72D145386}']
		
		{*
		  Indicates the error recovery has been attempted.
		 - Parameter processor: the processor instance.
		 - Parameter didRecover: YES if the recovery was successful.
		 - Parameter error: the error that that was attempted to be recovered from.
		 }
		[MethodName('processorDidAttemptRecovery:didRecover:error:')]
		{-} procedure processorDidAttemptRecoverydidRecovererror(processor:FBSDKGraphErrorRecoveryProcessor{*};didRecover:Boolean;error:NSError{*});cdecl;
		
		//@optional
		{*
		  Indicates the processor is about to process the error.
		 - Parameter processor: the processor instance.
		 - Parameter error: the error is about to be processed.
		
		 return NO if the processor should not process the error. For example,
		 if you want to prevent alerts of localized messages but otherwise perform retries and recoveries,
		 you could return NO for errors where userInfo[FBSDKGraphRequestErrorCategoryKey] equal to FBSDKGraphRequestErrorCategoryOther
		 }
		[MethodName('processorWillProcessError:error:')]
		{-} function processorWillProcessErrorerror(processor:FBSDKGraphErrorRecoveryProcessor{*};error:NSError{*}):Boolean;cdecl;
		
	end;
	
	TOnprocessorDidAttemptRecoverydidRecovererror=procedure(processor:FBSDKGraphErrorRecoveryProcessor{*};didRecover:Boolean;error:NSError{*}) of object;
	TOnprocessorWillProcessErrorerror=function(processor:FBSDKGraphErrorRecoveryProcessor{*};error:NSError{*}):Boolean of object;
	
	TFBSDKGraphErrorRecoveryProcessorDelegate=class(TOCLocal,FBSDKGraphErrorRecoveryProcessorDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnprocessorDidAttemptRecoverydidRecovererror:TOnprocessorDidAttemptRecoverydidRecovererror;
		OnprocessorWillProcessErrorerror:TOnprocessorWillProcessErrorerror;
	
		
		{*
		  Indicates the error recovery has been attempted.
		 - Parameter processor: the processor instance.
		 - Parameter didRecover: YES if the recovery was successful.
		 - Parameter error: the error that that was attempted to be recovered from.
		 }
		[MethodName('processorDidAttemptRecovery:didRecover:error:')]
		{-} procedure processorDidAttemptRecoverydidRecovererror(processor:FBSDKGraphErrorRecoveryProcessor{*};didRecover:Boolean;error:NSError{*});cdecl;
		
		//@optional
		{*
		  Indicates the processor is about to process the error.
		 - Parameter processor: the processor instance.
		 - Parameter error: the error is about to be processed.
		
		 return NO if the processor should not process the error. For example,
		 if you want to prevent alerts of localized messages but otherwise perform retries and recoveries,
		 you could return NO for errors where userInfo[FBSDKGraphRequestErrorCategoryKey] equal to FBSDKGraphRequestErrorCategoryOther
		 }
		[MethodName('processorWillProcessError:error:')]
		{-} function processorWillProcessErrorerror(processor:FBSDKGraphErrorRecoveryProcessor{*};error:NSError{*}):Boolean;cdecl;
		
	end;
	
	
	{*
	  Defines a type that can process Facebook NSErrors with best practices.
	
	 Facebook NSErrors can contain FBSDKErrorRecoveryAttempting instances to recover from errors, or
	 localized messages to present to the user. This class will process the instances as follows:
	
	 1. If the error is temporary as indicated by FBSDKGraphRequestErrorCategoryKey, assume the recovery succeeded and
	 notify the delegate.
	 2. If a FBSDKErrorRecoveryAttempting instance is available, display an alert (dispatched to main thread)
	 with the recovery options and call the instance's [ attemptRecoveryFromError:optionIndex:...].
	 3. If a FBSDKErrorRecoveryAttempting is not available, check the userInfo for FBSDKLocalizedErrorDescriptionKey
	 and present that in an alert (dispatched to main thread).
	
	 By default, FBSDKGraphRequests use this type to process errors and retry the request upon a successful
	 recovery.
	
	 Note that Facebook recovery attempters can present UI or even cause app switches (such as to login). Any such
	 work is dispatched to the main thread (therefore your request handlers may then run on the main thread).
	
	 Login recovery requires FBSDKLoginKit. Login will use FBSDKLoginBehaviorNative and will prompt the user
	 for all permissions last granted. If any are declined on the new request, the recovery is not successful but
	 the `[FBSDKAccessToken currentAccessToken]` might still have been updated.
	 .
	 }
	FBSDKGraphErrorRecoveryProcessor=interface(NSObject)//
	['{932D01EE-E85B-4EA0-AF77-105D3C4E8606}']
		
		{*
		  Gets the delegate. Note this is a strong reference, and is nil'ed out after recovery is complete.
		 }
		function id<FBSDKGraphErrorRecoveryProcessorDelegate>delegate:;cdecl;
		procedure setId<FBSDKGraphErrorRecoveryProcessorDelegate>delegate(id<FBSDKGraphErrorRecoveryProcessorDelegate>delegate:);cdecl;
		
		{*
		  Attempts to process the error, return YES if the error can be processed.
		 - Parameter error: the error to process.
		 - Parameter request: the related request that may be reissued.
		 - Parameter delegate: the delegate that will be retained until recovery is complete.
		 }
		[MethodName('processError:request:delegate:')]
		{-} function processErrorrequestdelegate(error:NSError{*};request:FBSDKGraphRequest{*};delegate:PFBSDKGraphErrorRecoveryProcessorDelegate{id<FBSDKGraphErrorRecoveryProcessorDelegate>}):Boolean;cdecl;
		
		{*
		  The callback for FBSDKErrorRecoveryAttempting
		 - Parameter didRecover: if the recovery succeeded
		 - Parameter contextInfo: unused
		 }
		[MethodName('didPresentErrorWithRecovery:contextInfo:')]
		{-} procedure didPresentErrorWithRecoverycontextInfo(didRecover:Boolean;contextInfo:void{*});cdecl;
		
	end;
	
	FBSDKGraphErrorRecoveryProcessorClass=interface(NSObjectClass)//
	['{19BC1E4C-6352-45CF-8399-14E34D2FA03F}']
	end;
	
	TFBSDKGraphErrorRecoveryProcessor=class(TOCGenericImport<FBSDKGraphErrorRecoveryProcessorClass,FBSDKGraphErrorRecoveryProcessor>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

{ TFBSDKGraphErrorRecoveryProcessorDelegate }

constructor TFBSDKGraphErrorRecoveryProcessorDelegate.Create;
begin
	Inherited Create;
end;

destructor TFBSDKGraphErrorRecoveryProcessorDelegate.Destroy;
begin
	Inherited;
end;

procedure  TFBSDKGraphErrorRecoveryProcessorDelegate.processorDidAttemptRecoverydidRecovererror(processor:FBSDKGraphErrorRecoveryProcessor{*};didRecover:Boolean;error:NSError{*});
begin
	if Assigned(OnprocessorDidAttemptRecoverydidRecovererror) then
	begin
		OnprocessorDidAttemptRecoverydidRecovererror(processor,didRecover,error);
	end;
end;

function  TFBSDKGraphErrorRecoveryProcessorDelegate.processorWillProcessErrorerror(processor:FBSDKGraphErrorRecoveryProcessor{*};error:NSError{*}):Boolean;
begin
	if Assigned(OnprocessorWillProcessErrorerror) then
	begin
		Result:=OnprocessorWillProcessErrorerror(processor,error);
	end;
end;



{$ENDIF}

end.

