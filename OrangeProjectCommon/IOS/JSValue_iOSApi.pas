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






unit JSValue_iOSApi;

interface

{$IFDEF IOS}
uses
//	iOSapi.CGGeometry,
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
	PNSDictionary=Pointer;//PNSDictionary=^NSDictionary;
  JSContext=Pointer;
  _Class=Pointer;
  int32_t=Int32;
  uint32_t=UInt32;
  _NSObject=Pointer;
  JSValueRef=Pointer;

	{!
	@interface
	@discussion A JSValue is a reference to a value within the JavaScript object space of a
	 JSVirtualMachine. All instances of JSValue originate from a JSContext and
	 hold a strong reference to this JSContext. As long as any value associated with
	 a particular JSContext is retained, that JSContext will remain alive.
	 Where an instance method is invoked upon a JSValue, and this returns another
	 JSValue, the returned JSValue will originate from the same JSContext as the
	 JSValue on which the method was invoked.

	 All JavaScript values are associated with a particular JSVirtualMachine
	 (the associated JSVirtualMachine is available indirectly via the context
	 property). An instance of JSValue may only be passed as an argument to
	 methods on instances of JSValue and JSContext that belong to the same
	 JSVirtualMachine - passing a JSValue to a method on an object originating
	 from a different JSVirtualMachine will result in an Objective-C exception
	 being raised.
	}
	//NS_CLASS_AVAILABLE(10_9, 7_0)
	JSValue=interface(NSObject)//
	['{E79F121A-4C47-46FD-A870-D6343EC77506}']

		{!
		@property
		@abstract The JSContext that this value originates from.
		}
		function context:JSContext{*};cdecl;
		procedure setContext(context:JSContext{*});cdecl;

		{!
		@methodgroup Creating JavaScript Values
		}
		{!
		@method
		@abstract Create a JSValue by converting an Objective-C object.
		@discussion The resulting JSValue retains the provided Objective-C object.
		@param value The Objective-C object to be converted.
		@result The new JSValue.
		}

		{!
		@method
		@abstract Create a JavaScript value from a BOOL primitive.
		@param value
		@param context The JSContext in which the resulting JSValue will be created.
		@result The new JSValue representing the equivalent boolean value.
		}

		{!
		@method
		@abstract Create a JavaScript value from a double primitive.
		@param value
		@param context The JSContext in which the resulting JSValue will be created.
		@result The new JSValue representing the equivalent boolean value.
		}

		{!
		@method
		@abstract Create a JavaScript value from an <code>int32_t</code> primitive.
		@param value
		@param context The JSContext in which the resulting JSValue will be created.
		@result The new JSValue representing the equivalent boolean value.
		}

		{!
		@method
		@abstract Create a JavaScript value from a <code>uint32_t</code> primitive.
		@param value
		@param context The JSContext in which the resulting JSValue will be created.
		@result The new JSValue representing the equivalent boolean value.
		}

		{!
		@method
		@abstract Create a new, empty JavaScript object.
		@param context The JSContext in which the resulting object will be created.
		@result The new JavaScript object.
		}

		{!
		@method
		@abstract Create a new, empty JavaScript array.
		@param context The JSContext in which the resulting array will be created.
		@result The new JavaScript array.
		}

		{!
		@method
		@abstract Create a new JavaScript regular expression object.
		@param pattern The regular expression pattern.
		@param flags The regular expression flags.
		@param context The JSContext in which the resulting regular expression object will be created.
		@result The new JavaScript regular expression object.
		}

		{!
		@method
		@abstract Create a new JavaScript error object.
		@param message The error message.
		@param context The JSContext in which the resulting error object will be created.
		@result The new JavaScript error object.
		}

		{!
		@method
		@abstract Create the JavaScript value <code>null</code>.
		@param context The JSContext to which the resulting JSValue belongs.
		@result The JSValue representing the JavaScript value <code>null</code>.
		}

		{!
		@method
		@abstract Create the JavaScript value <code>undefined</code>.
		@param context The JSContext to which the resulting JSValue belongs.
		@result The JSValue representing the JavaScript value <code>undefined</code>.
		}

		{!
		@methodgroup Converting to Objective-C Types
		@discussion When converting between JavaScript values and Objective-C objects a copy is
		 performed. Values of types listed below are copied to the corresponding
		 types on conversion in each direction. For NSDictionaries, entries in the
		 dictionary that are keyed by strings are copied onto a JavaScript object.
		 For dictionaries and arrays, conversion is recursive, with the same object
		 conversion being applied to all entries in the collection.

		<pre>
		@textblock
		   Objective-C type  |   JavaScript type
		 --------------------+---------------------
		         nil         |     undefined
		        NSNull       |        null
		       NSString      |       string
		       NSNumber      |   number, boolean
		     NSDictionary    |   Object object
		       NSArray       |    Array object
		        NSDate       |     Date object
		       NSBlock (1)   |   Function object (1)
		          id (2)     |   Wrapper object (2)
		        Class (3)    | Constructor object (3)
		@/textblock
		</pre>

		 (1) Instances of NSBlock with supported arguments types will be presented to
		 JavaScript as a callable Function object. For more information on supported
		 argument types see JSExport.h. If a JavaScript Function originating from an
		 Objective-C block is converted back to an Objective-C object the block will
		 be returned. All other JavaScript functions will be converted in the same
		 manner as a JavaScript object of type Object.

		 (2) For Objective-C instances that do not derive from the set of types listed
		 above, a wrapper object to provide a retaining handle to the Objective-C
		 instance from JavaScript. For more information on these wrapper objects, see
		 JSExport.h. When a JavaScript wrapper object is converted back to Objective-C
		 the Objective-C instance being retained by the wrapper is returned.

		 (3) For Objective-C Class objects a constructor object containing exported
		 class methods will be returned. See JSExport.h for more information on
		 constructor objects.

		 For all methods taking arguments of type id, arguments will be converted
		 into a JavaScript value according to the above conversion.
		}
		{!
		@method
		@abstract Convert this JSValue to an Objective-C object.
		@discussion The JSValue is converted to an Objective-C object according
		 to the conversion rules specified above.
		@result The Objective-C representation of this JSValue.
		}
		{-} function toObject:id;cdecl;

		{!
		@method
		@abstract Convert a JSValue to an Objective-C object of a specific class.
		@discussion The JSValue is converted to an Objective-C object of the specified Class.
		 If the result is not of the specified Class then <code>nil</code> will be returned.
		@result An Objective-C object of the specified Class or <code>nil</code>.
		}
		{-} function toObjectOfClass(expectedClass:_Class):id;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a boolean.
		@discussion The JSValue is converted to a boolean according to the rules specified
		 by the JavaScript language.
		@result The boolean result of the conversion.
		}
		{-} function toBool:Boolean;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a double.
		@discussion The JSValue is converted to a number according to the rules specified
		 by the JavaScript language.
		@result The double result of the conversion.
		}
		{-} function toDouble:double;cdecl;

		{!
		@method
		@abstract Convert a JSValue to an <code>int32_t</code>.
		@discussion The JSValue is converted to an integer according to the rules specified
		 by the JavaScript language.
		@result The <code>int32_t</code> result of the conversion.
		}
		{-} function toInt32:int32_t;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a <code>uint32_t</code>.
		@discussion The JSValue is converted to an integer according to the rules specified
		 by the JavaScript language.
		@result The <code>uint32_t</code> result of the conversion.
		}
		{-} function toUInt32:uint32_t;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a NSNumber.
		@discussion If the JSValue represents a boolean, a NSNumber value of YES or NO
		 will be returned. For all other types the value will be converted to a number according
		 to the rules specified by the JavaScript language.
		@result The NSNumber result of the conversion.
		}
		{-} function toNumber:NSNumber{*};cdecl;

		{!
		@method
		@abstract Convert a JSValue to a NSString.
		@discussion The JSValue is converted to a string according to the rules specified
		 by the JavaScript language.
		@result The NSString containing the result of the conversion.
		}
		{-} function toString:NSString{*};cdecl;

		{!
		@method
		@abstract Convert a JSValue to a NSDate.
		@discussion The value is converted to a number representing a time interval
		 since 1970 which is then used to create a new NSDate instance.
		@result The NSDate created using the converted time interval.
		}
		{-} function toDate:NSDate{*};cdecl;

		{!
		@method
		@abstract Convert a JSValue to a NSArray.
		@discussion If the value is <code>null</code> or <code>undefined</code> then <code>nil</code> is returned.
		 If the value is not an object then a JavaScript TypeError will be thrown.
		 The property <code>length</code> is read from the object, converted to an unsigned
		 integer, and an NSArray of this size is allocated. Properties corresponding
		 to indicies within the array bounds will be copied to the array, with
		 JSValues converted to equivalent Objective-C objects as specified.
		@result The NSArray containing the recursively converted contents of the
		 converted JavaScript array.
		}
		{-} function toArray:NSArray{*};cdecl;

		{!
		@method
		@abstract Convert a JSValue to a NSDictionary.
		@discussion If the value is <code>null</code> or <code>undefined</code> then <code>nil</code> is returned.
		 If the value is not an object then a JavaScript TypeError will be thrown.
		 All enumerable properties of the object are copied to the dictionary, with
		 JSValues converted to equivalent Objective-C objects as specified.
		@result The NSDictionary containing the recursively converted contents of
		 the converted JavaScript object.
		}
		{-} function toDictionary:PNSDictionary{*};cdecl;

		{!
		@methodgroup Accessing Properties
		}
		{!
		@method
		@abstract Access a property of a JSValue.
		@result The JSValue for the requested property or the JSValue <code>undefined</code>
		 if the property does not exist.
		}
		{-} function valueForProperty(_property:NSString{*}):JSValue{*};cdecl;

		{!
		@method
		@abstract Set a property on a JSValue.
		}
		[MethodName('setValue:forProperty:')]
		{-} procedure setValueforProperty(value:id;_property:NSString{*});cdecl;

		{!
		@method
		@abstract Delete a property from a JSValue.
		@result YES if deletion is successful, NO otherwise.
		}
		{-} function deleteProperty(_property:NSString{*}):Boolean;cdecl;

		{!
		@method
		@abstract Check if a JSValue has a property.
		@discussion This method has the same function as the JavaScript operator <code>in</code>.
		@result Returns YES if property is present on the value.
		}
		{-} function hasProperty(_property:NSString{*}):Boolean;cdecl;

		{!
		@method
		@abstract Define properties with custom descriptors on JSValues.
		@discussion This method may be used to create a data or accessor property on an object.
		 This method operates in accordance with the Object.defineProperty method in the
		 JavaScript language.
		}
		[MethodName('defineProperty:descriptor:')]
		{-} procedure definePropertydescriptor(_property:NSString{*};descriptor:id);cdecl;

		{!
		@method
		@abstract Access an indexed (numerical) property on a JSValue.
		@result The JSValue for the property at the specified index.
		 Returns the JavaScript value <code>undefined</code> if no property exists at that index.
		}
		{-} function valueAtIndex(index:NSUInteger):JSValue{*};cdecl;

		{!
		@method
		@abstract Set an indexed (numerical) property on a JSValue.
		@discussion For JSValues that are JavaScript arrays, indices greater than
		 UINT_MAX - 1 will not affect the length of the array.
		}
		[MethodName('setValue:atIndex:')]
		{-} procedure setValueatIndex(value:id;index:NSUInteger);cdecl;

		{!
		@methodgroup Checking JavaScript Types
		}
		{!
		@method
		@abstract Check if a JSValue corresponds to the JavaScript value <code>undefined</code>.
		}
		function isUndefined:Boolean;cdecl;
		procedure setIsUndefined(isUndefined:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue corresponds to the JavaScript value <code>null</code>.
		}
		function isNull:Boolean;cdecl;
		procedure setIsNull(isNull:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is a boolean.
		}
		function isBoolean:Boolean;cdecl;
		procedure setIsBoolean(isBoolean:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is a number.
		@discussion In JavaScript, there is no differentiation between types of numbers.
		 Semantically all numbers behave like doubles except in special cases like bit
		 operations.
		}
		function isNumber:Boolean;cdecl;
		procedure setIsNumber(isNumber:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is a string.
		}
		function isString:Boolean;cdecl;
		procedure setIsString(isString:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is an object.
		}
		function isObject:Boolean;cdecl;
		procedure setIsObject(isObject:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is an array.
		}
		function isArray {NS_AVAILABLE(10_11, 9_0)}:Boolean;cdecl;
		procedure setIsArray {NS_AVAILABLE(10_11, 9_0)}(isArray {NS_AVAILABLE(10_11, 9_0)}:Boolean);cdecl;

		{!
		@method
		@abstract Check if a JSValue is a date.
		}
		function isDate {NS_AVAILABLE(10_11, 9_0)}:Boolean;cdecl;
		procedure setIsDate {NS_AVAILABLE(10_11, 9_0)}(isDate {NS_AVAILABLE(10_11, 9_0)}:Boolean);cdecl;

		{!
		@method
		@abstract Compare two JSValues using JavaScript's <code>===</code> operator.
		}
		{-} function isEqualToObject(value:id):Boolean;cdecl;

		{!
		@method
		@abstract Compare two JSValues using JavaScript's <code>==</code> operator.
		}
		{-} function isEqualWithTypeCoercionToObject(value:id):Boolean;cdecl;

		{!
		@method
		@abstract Check if a JSValue is an instance of another object.
		@discussion This method has the same function as the JavaScript operator <code>instanceof</code>.
		 If an object other than a JSValue is passed, it will first be converted according to
		 the aforementioned rules.
		}
		{-} function isInstanceOf(value:id):Boolean;cdecl;

		{!
		@methodgroup Calling Functions and Constructors
		}
		{!
		@method
		@abstract Invoke a JSValue as a function.
		@discussion In JavaScript, if a function doesn't explicitly return a value then it
		 implicitly returns the JavaScript value <code>undefined</code>.
		@param arguments The arguments to pass to the function.
		@result The return value of the function call.
		}
		{-} function callWithArguments(arguments:NSArray{*}):JSValue{*};cdecl;

		{!
		@method
		@abstract Invoke a JSValue as a constructor.
		@discussion This is equivalent to using the <code>new</code> syntax in JavaScript.
		@param arguments The arguments to pass to the constructor.
		@result The return value of the constructor call.
		}
		{-} function constructWithArguments(arguments:NSArray{*}):JSValue{*};cdecl;

		{!
		@method
		@abstract Invoke a method on a JSValue.
		@discussion Accesses the property named <code>method</code> from this value and
		 calls the resulting value as a function, passing this JSValue as the <code>this</code>
		 value along with the specified arguments.
		@param method The name of the method to be invoked.
		@param arguments The arguments to pass to the method.
		@result The return value of the method call.
		}
		[MethodName('invokeMethod:withArguments:')]
		{-} function invokeMethodwithArguments(method:NSString{*};arguments:NSArray{*}):JSValue{*};cdecl;













		{!
		@method
		@abstract Create a JSValue from a CGPoint.
		@result A newly allocated JavaScript object containing properties
		 named <code>x</code> and <code>y</code>, with values from the CGPoint.
		}

		{!
		@method
		@abstract Create a JSValue from a NSRange.
		@result A newly allocated JavaScript object containing properties
		 named <code>location</code> and <code>length</code>, with values from the NSRange.
		}

		{!
		@method
		@abstract
		Create a JSValue from a CGRect.
		@result A newly allocated JavaScript object containing properties
		 named <code>x</code>, <code>y</code>, <code>width</code>, and <code>height</code>, with values from the CGRect.
		}

		{!
		@method
		@abstract Create a JSValue from a CGSize.
		@result A newly allocated JavaScript object containing properties
		 named <code>width</code> and <code>height</code>, with values from the CGSize.
		}

		{!
		@method
		@abstract Convert a JSValue to a CGPoint.
		@discussion Reads the properties named <code>x</code> and <code>y</code> from
		 this JSValue, and converts the results to double.
		@result The new CGPoint.
		}
		{-} function toPoint:CGPoint;cdecl;

		{!
		@method
		@abstract Convert a JSValue to an NSRange.
		@discussion Reads the properties named <code>location</code> and
		 <code>length</code> from this JSValue and converts the results to double.
		@result The new NSRange.
		}
		{-} function toRange:NSRange;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a CGRect.
		@discussion Reads the properties named <code>x</code>, <code>y</code>,
		 <code>width</code>, and <code>height</code> from this JSValue and converts the results to double.
		@result The new CGRect.
		}
		{-} function toRect:CGRect;cdecl;

		{!
		@method
		@abstract Convert a JSValue to a CGSize.
		@discussion Reads the properties named <code>width</code> and
		 <code>height</code> from this JSValue and converts the results to double.
		@result The new CGSize.
		}
		{-} function toSize:CGSize;cdecl;






		{-} function objectForKeyedSubscript(key:id):JSValue{*};cdecl;
		{-} function objectAtIndexedSubscript(index:NSUInteger):JSValue{*};cdecl;
		[MethodName('setObject:forKeyedSubscript:')]
		{-} procedure setObjectforKeyedSubscript(_object:id;key:_NSObject{ <NSCopying>}{*});cdecl;
		[MethodName('setObject:atIndexedSubscript:')]
		{-} procedure setObjectatIndexedSubscript(_object:id;index:NSUInteger);cdecl;






		{!
		@method
		@abstract Creates a JSValue, wrapping its C API counterpart.
		@param value
		@param context
		@result The Objective-C API equivalent of the specified JSValueRef.
		}

		{!
		@property
		@abstract Returns the C API counterpart wrapped by a JSContext.
		@result The C API equivalent of this JSValue.
		}
		function JSValueRef:JSValueRef;cdecl;
		procedure setJSValueRef(JSValueRef:JSValueRef);cdecl;
	end;

	JSValueClass=interface(NSObjectClass)//
	['{4477E49A-D9B6-41E2-B98B-C3E49B0A735C}']
		[MethodName('valueWithObject:inContext:')]
		{+} function valueWithObjectinContext(value:id;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithBool:inContext:')]
		{+} function valueWithBoolinContext(value:Boolean;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithDouble:inContext:')]
		{+} function valueWithDoubleinContext(value:double;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithInt32:inContext:')]
		{+} function valueWithInt32inContext(value:int32_t;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithUInt32:inContext:')]
		{+} function valueWithUInt32inContext(value:uint32_t;context:JSContext{*}):JSValue{*};cdecl;
		{+} function valueWithNewObjectInContext(context:JSContext{*}):JSValue{*};cdecl;
		{+} function valueWithNewArrayInContext(context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithNewRegularExpressionFromPattern:flags:inContext:')]
		{+} function valueWithNewRegularExpressionFromPatternflagsinContext(pattern:NSString{*};flags:NSString{*};context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithNewErrorFromMessage:inContext:')]
		{+} function valueWithNewErrorFromMessageinContext(message:NSString{*};context:JSContext{*}):JSValue{*};cdecl;
		{+} function valueWithNullInContext(context:JSContext{*}):JSValue{*};cdecl;
		{+} function valueWithUndefinedInContext(context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithPoint:inContext:')]
		{+} function valueWithPointinContext(point:CGPoint;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithRange:inContext:')]
		{+} function valueWithRangeinContext(range:NSRange;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithRect:inContext:')]
		{+} function valueWithRectinContext(rect:CGRect;context:JSContext{*}):JSValue{*};cdecl;
		[MethodName('valueWithSize:inContext:')]
		{+} function valueWithSizeinContext(size:CGSize;context:JSContext{*}):JSValue{*};cdecl;



		[MethodName('valueWithJSValueRef:inContext:')]
		{+} function valueWithJSValueRefinContext(value:JSValueRef;context:JSContext{*}):JSValue{*};cdecl;
	end;

	TJSValue=class(TOCGenericImport<JSValueClass,JSValue>)
	end;

//	{!
//	@category
//	@discussion Objective-C methods exported to JavaScript may have argument and/or return
//	 values of struct types, provided that conversion to and from the struct is
//	 supported by JSValue. Support is provided for any types where JSValue
//	 contains both a class method <code>valueWith<Type>:inContext:</code>, and and instance
//	 method <code>to<Type></code>- where the string <code><Type></code> in these selector names match,
//	 with the first argument to the former being of the same struct type as the
//	 return type of the latter.
//	 Support is provided for structs of type CGPoint, NSRange, CGRect and CGSize.
//	}
//	JSValue=interface()//StructSupport
//	['{467942FD-7DDC-4245-B13B-26FF0F90239C}']
//
//		{!
//		@method
//		@abstract Create a JSValue from a CGPoint.
//		@result A newly allocated JavaScript object containing properties
//		 named <code>x</code> and <code>y</code>, with values from the CGPoint.
//		}
//
//		{!
//		@method
//		@abstract Create a JSValue from a NSRange.
//		@result A newly allocated JavaScript object containing properties
//		 named <code>location</code> and <code>length</code>, with values from the NSRange.
//		}
//
//		{!
//		@method
//		@abstract
//		Create a JSValue from a CGRect.
//		@result A newly allocated JavaScript object containing properties
//		 named <code>x</code>, <code>y</code>, <code>width</code>, and <code>height</code>, with values from the CGRect.
//		}
//
//		{!
//		@method
//		@abstract Create a JSValue from a CGSize.
//		@result A newly allocated JavaScript object containing properties
//		 named <code>width</code> and <code>height</code>, with values from the CGSize.
//		}
//
//		{!
//		@method
//		@abstract Convert a JSValue to a CGPoint.
//		@discussion Reads the properties named <code>x</code> and <code>y</code> from
//		 this JSValue, and converts the results to double.
//		@result The new CGPoint.
//		}
//		{-} function toPoint:CGPoint;cdecl;
//
//		{!
//		@method
//		@abstract Convert a JSValue to an NSRange.
//		@discussion Reads the properties named <code>location</code> and
//		 <code>length</code> from this JSValue and converts the results to double.
//		@result The new NSRange.
//		}
//		{-} function toRange:NSRange;cdecl;
//
//		{!
//		@method
//		@abstract Convert a JSValue to a CGRect.
//		@discussion Reads the properties named <code>x</code>, <code>y</code>,
//		 <code>width</code>, and <code>height</code> from this JSValue and converts the results to double.
//		@result The new CGRect.
//		}
//		{-} function toRect:CGRect;cdecl;
//
//		{!
//		@method
//		@abstract Convert a JSValue to a CGSize.
//		@discussion Reads the properties named <code>width</code> and
//		 <code>height</code> from this JSValue and converts the results to double.
//		@result The new CGSize.
//		}
//		{-} function toSize:CGSize;cdecl;
//
//	end;
//
//	JSValueClass=interface(Class)//StructSupport
//	['{F1021CA3-5C67-4507-8B22-09FAD2BDBBDE}']
//		[MethodName('valueWithPoint:inContext:')]
//		{+} function valueWithPointinContext(point:CGPoint;context:JSContext{*}):JSValue{*};cdecl;
//		[MethodName('valueWithRange:inContext:')]
//		{+} function valueWithRangeinContext(range:NSRange;context:JSContext{*}):JSValue{*};cdecl;
//		[MethodName('valueWithRect:inContext:')]
//		{+} function valueWithRectinContext(rect:CGRect;context:JSContext{*}):JSValue{*};cdecl;
//		[MethodName('valueWithSize:inContext:')]
//		{+} function valueWithSizeinContext(size:CGSize;context:JSContext{*}):JSValue{*};cdecl;
//	end;
//
//	TJSValue=class(TOCGenericImport<JSValueClass,JSValue>)
//	end;
//
	{!
	@category
	@discussion Instances of JSValue implement the following methods in order to enable
	 support for subscript access by key and index, for example:

	@textblock
	    JSValue *objectA, *objectB;
	    JSValue *v1 = object[@"X"]; // Get value for property "X" from 'object'.
	    JSValue *v2 = object[42];   // Get value for index 42 from 'object'.
	    object[@"Y"] = v1;          // Assign 'v1' to property "Y" of 'object'.
	    object[101] = v2;           // Assign 'v2' to index 101 of 'object'.
	@/textblock

	 An object key passed as a subscript will be converted to a JavaScript value,
	 and then the value converted to a string used as a property name.
	}
//	JSValue=interface()//SubscriptSupport
//	['{54461494-206C-4E7D-A9E8-C469EB31288F}']
//
//		{-} function objectForKeyedSubscript(key:id):JSValue{*};cdecl;
//		{-} function objectAtIndexedSubscript(index:NSUInteger):JSValue{*};cdecl;
//		[MethodName('setObject:forKeyedSubscript:')]
//		{-} procedure setObjectforKeyedSubscript(object:id;key:NSObject <NSCopying>{*});cdecl;
//		[MethodName('setObject:atIndexedSubscript:')]
//		{-} procedure setObjectatIndexedSubscript(object:id;index:NSUInteger);cdecl;
//
//	end;
//
//	JSValueClass=interface(Class)//SubscriptSupport
//	['{F0AEF729-BBCF-461C-9860-F7F033420DAB}']
//	end;
//
//	TJSValue=class(TOCGenericImport<JSValueClass,JSValue>)
//	end;
//
//	{!
//	@category
//	@discussion  These functions are for bridging between the C API and the Objective-C API.
//	}
//	JSValue=interface()//JSValueRefSupport
//	['{8BBE4531-9334-453E-A86F-D87F8430AADF}']
//
//		{!
//		@method
//		@abstract Creates a JSValue, wrapping its C API counterpart.
//		@param value
//		@param context
//		@result The Objective-C API equivalent of the specified JSValueRef.
//		}
//
//		{!
//		@property
//		@abstract Returns the C API counterpart wrapped by a JSContext.
//		@result The C API equivalent of this JSValue.
//		}
//		function JSValueRef:JSValueRef;cdecl;
//		procedure setJSValueRef(JSValueRef:JSValueRef);cdecl;
//	end;
//
//	JSValueClass=interface(Class)//JSValueRefSupport
//	['{D85CEC1F-5F7A-45C3-A8AE-5CB5CEB9F14D}']
//		[MethodName('valueWithJSValueRef:inContext:')]
//		{+} function valueWithJSValueRefinContext(value:JSValueRef;context:JSContext{*}):JSValue{*};cdecl;
//	end;
//
//	TJSValue=class(TOCGenericImport<JSValueClass,JSValue>)
//	end;
//
//
//


	{!
	@group Property Descriptor Constants
	@discussion These keys may assist in creating a property descriptor for use with the
	 defineProperty method on JSValue.
	 Property descriptors must fit one of three descriptions:

	 Data Descriptor:
	  - A descriptor containing one or both of the keys <code>value</code> and <code>writable</code>,
	    and optionally containing one or both of the keys <code>enumerable</code> and
	    <code>configurable</code>. A data descriptor may not contain either the <code>get</code> or
	    <code>set</code> key.
	    A data descriptor may be used to create or modify the attributes of a
	    data property on an object (replacing any existing accessor property).

	 Accessor Descriptor:
	  - A descriptor containing one or both of the keys <code>get</code> and <code>set</code>, and
	    optionally containing one or both of the keys <code>enumerable</code> and
	    <code>configurable</code>. An accessor descriptor may not contain either the <code>value</code>
	    or <code>writable</code> key.
	    An accessor descriptor may be used to create or modify the attributes of
	    an accessor property on an object (replacing any existing data property).

	 Generic Descriptor:
	  - A descriptor containing one or both of the keys <code>enumerable</code> and
	    <code>configurable</code>. A generic descriptor may not contain any of the keys
	    <code>value</code>, <code>writable</code>, <code>get</code>, or <code>set</code>.
	    A generic descriptor may be used to modify the attributes of an existing
	    data or accessor property, or to create a new data property.
	}
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorWritableKey=;
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorEnumerableKey=;
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorConfigurableKey=;
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorValueKey=;
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorGetKey=;
//	{!
//	@const
//	}
//	{JS_EXPORT extern NSString *}JSPropertyDescriptorSetKey=;
//







{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function JSValue_FakeLoader : JSValue; cdecl; external '/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore' name 'OBJC_CLASS_$_JSValue';
{$O+}


{$ENDIF}

end.


