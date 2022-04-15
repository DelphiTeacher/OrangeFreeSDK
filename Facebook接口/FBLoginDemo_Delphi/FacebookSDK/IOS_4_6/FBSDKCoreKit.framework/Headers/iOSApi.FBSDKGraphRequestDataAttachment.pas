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

unit iOSApi.FBSDKGraphRequestDataAttachment;

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
	  A container class for data attachments so that additional metadata can be provided about the attachment.
	 }
	FBSDKGraphRequestDataAttachment=interface(NSObject)//
	['{B9E6076D-7163-4C09-AF72-3435E71AE02F}']
		
		{*
		  Initializes the receiver with the attachment data and metadata.
		 - Parameter data: The attachment data (retained, not copied)
		 - Parameter filename: The filename for the attachment
		 - Parameter contentType: The content type for the attachment
		 }
		[MethodName('initWithData:filename:contentType:')]
		{-} function initWithDatafilenamecontentType(data:NSData{*};filename:NSString{*};contentType:NSString{*}):FBSDKGraphRequestDataAttachment;cdecl;
		
		{*
		  The content type for the attachment.
		 }
		function contentType:NSString{*};cdecl;
		procedure setContentType(contentType:NSString{*});cdecl;
		
		{*
		  The attachment data.
		 }
		function data:NSData{*};cdecl;
		procedure setData(data:NSData{*});cdecl;
		
		{*
		  The filename for the attachment.
		 }
		function filename:NSString{*};cdecl;
		procedure setFilename(filename:NSString{*});cdecl;
		
	end;
	
	FBSDKGraphRequestDataAttachmentClass=interface(NSObjectClass)//
	['{BCA31C4F-5AF0-4EA7-8479-F6690F3B91B6}']
	end;
	
	TFBSDKGraphRequestDataAttachment=class(TOCGenericImport<FBSDKGraphRequestDataAttachmentClass,FBSDKGraphRequestDataAttachment>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

