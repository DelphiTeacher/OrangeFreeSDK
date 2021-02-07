unit iOSApi.JSContext;

interface

{$IFDEF IOS}
uses
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

	{
	 * Copyright (C) 2013 Apple Inc. All rights reserved.
	 *
	 * Redistribution and use in source and binary forms, with or without
	 * modification, are permitted provided that the following conditions
	 * are met:
	 * 1. Redistributions of source code must retain the above copyright
	 *    notice, this list of conditions and the following disclaimer.
	 * 2. Redistributions in binary form must reproduce the above copyright
	 *    notice, this list of conditions and the following disclaimer in the
	 *    documentation and/or other materials provided with the distribution.
	 *
	 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
	 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
	 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
	 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	 }

	//#ifndef JSContext_h
	//#define JSContext_h

	//#include <JavaScriptCore/JavaScript.h>
	//#include <JavaScriptCore/WebKitAvailability.h>

	//#if JSC_OBJC_API_ENABLED



	{!
	@interface
	@discussion A JSContext is a JavaScript execution environment. All
	 JavaScript execution takes place within a context, and all JavaScript values
	 are tied to a context.
	}
	{} function 7_0) @interface JSContext : NSObject   @methodgroup Creating New JSContexts   @method @abstract Create a JSContext. @result The new context.  -(@method @abstract Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:nstancetype)init;@abstract Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:metho;Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:abstrac;a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:reat;JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:;in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:SContex;the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:;specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:h;virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:pecifie;machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:irtua;@param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:achine;virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:para;The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:irtualMachin;JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:h;in which the context will be created. @result The new context.  - (instancetype:SVirtualMachin;which the context will be created. @result The new context.  - (instancetype:;the context will be created. @result The new context.  - (instancetype:hic;context will be created. @result The new context.  - (instancetype:h;will be created. @result The new context.  - (instancetype:ontex;be created. @result The new context.  - (instancetype:il;created. @result The new context.  - (instancetype:;@result The new context.  - (instancetype:reated;The new context.  - (instancetype:resul;new context.  - (instancetype:h;context.  - (instancetype:e;- (instancetype:ontext;(instancetype:):NS_CLASS_AVAILABLE10_9,;cdecl;

	{!
	@methodgroup Callback Accessors
	}
	{!
	@method
	@abstract Get the JSContext that is currently executing.
	@discussion This method may be called from within an Objective-C block or method invoked
	 as a callback from JavaScript to retrieve the callback's context. Outside of
	 a callback from JavaScript this method will return nil.
	@result The currently executing JSContext or nil if there isn't one.
	}
	{+} function currentContext:JSContext{*};cdecl;

	{!
	@method
	@abstract Get the JavaScript function that is currently executing.
	@discussion This method may be called from within an Objective-C block or method invoked
	 as a callback from JavaScript to retrieve the callback's context. Outside of
	 a callback from JavaScript this method will return nil.
	@result The currently executing JavaScript function or nil if there isn't one.
	}
	{+} function currentCallee NS_AVAILABLE(10_10, 8_0):JSValue{*};cdecl;

	{!
	@method
	@abstract Get the <code>this</code> value of the currently executing method.
	@discussion This method may be called from within an Objective-C block or method invoked
	 as a callback from JavaScript to retrieve the callback's this value. Outside
	 of a callback from JavaScript this method will return nil.
	@result The current <code>this</code> value or nil if there isn't one.
	}
	{+} function currentThis:JSValue{*};cdecl;

	{!
	@method
	@abstract Get the arguments to the current callback.
	@discussion This method may be called from within an Objective-C block or method invoked
	 as a callback from JavaScript to retrieve the callback's arguments, objects
	 in the returned array are instances of JSValue. Outside of a callback from
	 JavaScript this method will return nil.
	@result An NSArray of the arguments nil if there is no current callback.
	}
	{+} function currentArguments:NSArray{*};cdecl;

	{!
	@functiongroup Global Properties
	}

	{!
	@property
	@abstract Get the global object of the context.
	@discussion This method retrieves the global object of the JavaScript execution context.
	 Instances of JSContext originating from WebKit will return a reference to the
	 WindowProxy object.
	@result The global object.
	}
	function globalObject:JSValue{*};cdecl;
	procedure setGlobalObject(globalObject:JSValue{*});cdecl;

	{!
	@property
	@discussion The <code>exception</code> property may be used to throw an exception to JavaScript.

	 Before a callback is made from JavaScript to an Objective-C block or method,
	 the prior value of the exception property will be preserved and the property
	 will be set to nil. After the callback has completed the new value of the
	 exception property will be read, and prior value restored. If the new value
	 of exception is not nil, the callback will result in that value being thrown.

	 This property may also be used to check for uncaught exceptions arising from
	 API function calls (since the default behaviour of <code>exceptionHandler</code> is to
	 assign an uncaught exception to this property).
	}
	function exception:JSValue{*};cdecl;
	procedure setException(exception:JSValue{*});cdecl;

	{!
	@property
	@discussion If a call to an API function results in an uncaught JavaScript exception, the
	 <code>exceptionHandler</code> block will be invoked. The default implementation for the
	 exception handler will store the exception to the exception property on
	 context. As a consequence the default behaviour is for uncaught exceptions
	 occurring within a callback from JavaScript to be rethrown upon return.
	 Setting this value to nil will cause all exceptions occurring
	 within a callback from JavaScript to be silently caught.
	}
	function context,:void(^exceptionHandler)(JSContext{*};cdecl;
	procedure setContext,(context,:void(^exceptionHandler)(JSContext{*});cdecl;

	{!
	@property
	@discussion All instances of JSContext are associated with a JSVirtualMachine.
	}
	function virtualMachine:JSVirtualMachine{*};cdecl;
	procedure setVirtualMachine(virtualMachine:JSVirtualMachine{*});cdecl;

	{!
	@property
	@discussion Name of the JSContext. Exposed when remote debugging the context.
	}
	function name:NSString{*};cdecl;
	procedure setName(name:NSString{*});cdecl;

	//@end

	{!
	@category
	@discussion Instances of JSContext implement the following methods in order to enable
	 support for subscript access by key and index, for example:

	@textblock
	    JSContext *context;
	    JSValue *v = context[@"X"]; // Get value for "X" from the global object.
	    context[@"Y"] = v;          // Assign 'v' to "Y" on the global object.
	@/textblock

	 An object key passed as a subscript will be converted to a JavaScript value,
	 and then the value converted to a string used to resolve a property of the
	 global object.
	}
	JSContext=interface()//SubscriptSupport
	['{F88EEE85-1810-48E4-A100-5D3DFC8DB4B8}']

		{!
		@method
		@abstract Get a particular property on the global object.
		@result The JSValue for the global object's property.
		}
		{-} function objectForKeyedSubscript(key:id):JSValue{*};cdecl;

		{!
		@method
		@abstract Set a particular property on the global object.
		}
		[MethodName('setObject:forKeyedSubscript:')]
		{-} procedure setObjectforKeyedSubscript(_object:id;key:NSObject <NSCopying>{*});cdecl;

	end;

	JSContextClass=interface(Class)//SubscriptSupport
	['{AFF7CCD7-842F-450F-96C3-688127BDF365}']
	end;

	TJSContext=class(TOCGenericImport<JSContextClass,JSContext>)
	end;

	{!
	@category
	@discussion These functions are for bridging between the C API and the Objective-C API.
	}
	JSContext=interface()//JSContextRefSupport
	['{45218D29-AE5E-4DDF-B40D-4A6461D185E0}']

		{!
		@method
		@abstract Create a JSContext, wrapping its C API counterpart.
		@result The JSContext equivalent of the provided JSGlobalContextRef.
		}

		{!
		@property
		@abstract Get the C API counterpart wrapped by a JSContext.
		@result The C API equivalent of this JSContext.
		}
		function JSGlobalContextRef:JSGlobalContextRef;cdecl;
		procedure setJSGlobalContextRef(JSGlobalContextRef:JSGlobalContextRef);cdecl;
	end;

	JSContextClass=interface(Class)//JSContextRefSupport
	['{8F9E2229-8254-412C-8918-308811B8A124}']
		{+} function contextWithJSGlobalContextRef(jsGlobalContextRef:JSGlobalContextRef):JSContext{*};cdecl;
	end;

	TJSContext=class(TOCGenericImport<JSContextClass,JSContext>)
	end;

	//#endif

	//#endif // JSContext_h
{$ENDIF}

implementation

{$IFDEF IOS}
{} function 7_0) @interface JSContext : NSObject   @methodgroup Creating New JSContexts   @method @abstract Create a JSContext. @result The new context.  -(@method @abstract Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:nstancetype)init;@abstract Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:metho;Create a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:abstrac;a JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:reat;JSContext in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:;in the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:SContex;the specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:;specified virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:h;virtual machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:pecifie;machine. @param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:irtua;@param virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:achine;virtualMachine The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:para;The JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:irtualMachin;JSVirtualMachine in which the context will be created. @result The new context.  - (instancetype:h;in which the context will be created. @result The new context.  - (instancetype:SVirtualMachin;which the context will be created. @result The new context.  - (instancetype:;the context will be created. @result The new context.  - (instancetype:hic;context will be created. @result The new context.  - (instancetype:h;will be created. @result The new context.  - (instancetype:ontex;be created. @result The new context.  - (instancetype:il;created. @result The new context.  - (instancetype:;@result The new context.  - (instancetype:reated;The new context.  - (instancetype:resul;new context.  - (instancetype:h;context.  - (instancetype:e;- (instancetype:ontext;(instancetype:):NS_CLASS_AVAILABLE10_9,;cdecl;external {$I FrameworkDylibPath_JavaScriptCore.inc} name _PU + '7_0) @interface JSContext : NSObject   @methodgroup Creating New JSContexts   @method @abstract Create a JSContext. @result The new context.  -'

{$O-}
function JSContext_FakeLoader : JSContext; cdecl; external {$I FrameworkDylibPath_JavaScriptCore.inc} name 'OBJC_CLASS_$_JSContext';
function JSContext_FakeLoader : JSContext; cdecl; external {$I FrameworkDylibPath_JavaScriptCore.inc} name 'OBJC_CLASS_$_JSContext';
{$O+}


{$ENDIF}

end.


