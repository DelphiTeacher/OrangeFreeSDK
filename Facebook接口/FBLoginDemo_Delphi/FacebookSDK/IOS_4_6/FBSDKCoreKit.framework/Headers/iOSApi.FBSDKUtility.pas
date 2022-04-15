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

unit iOSApi.FBSDKUtility;

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

	
	{*
	  Class to contain common utility methods.
	 }
	FBSDKUtility=interface(NSObject)//
	['{4C25494B-599C-4641-8325-DCEAD307B80D}']
		
		{*
		  Parses a query string into a dictionary.
		 - Parameter queryString: The query string value.
		 - Returns: A dictionary with the key/value pairs.
		 }
		
		{*
		  Constructs a query string from a dictionary.
		 - Parameter dictionary: The dictionary with key/value pairs for the query string.
		 - Parameter errorRef: If an error occurs, upon return contains an NSError object that describes the problem.
		 - Returns: Query string representation of the parameters.
		 }
		
		{*
		  Decodes a value from an URL.
		 - Parameter value: The value to decode.
		 - Returns: The decoded value.
		 }
		
		{*
		  Encodes a value for an URL.
		 - Parameter value: The value to encode.
		 - Returns: The encoded value.
		 }
		
	end;
	
	FBSDKUtilityClass=interface(NSObjectClass)//
	['{E9EF5349-1687-444D-9C03-5090C3257814}']
		{+} function dictionaryWithQueryString(queryString:NSString{*}):PNSDictionary{*};cdecl;
		[MethodName('queryStringWithDictionary:error:')]
		{+} function queryStringWithDictionaryerror(dictionary:PNSDictionary{*};errorRef:NSError *__autoreleasing{*}):NSString{*};cdecl;
		{+} function URLDecode(value:NSString{*}):NSString{*};cdecl;
		{+} function URLEncode(value:NSString{*}):NSString{*};cdecl;
	end;
	
	TFBSDKUtility=class(TOCGenericImport<FBSDKUtilityClass,FBSDKUtility>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

