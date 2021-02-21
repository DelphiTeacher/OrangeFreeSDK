//
//  TWTRTweetEntity.h
//
//  Copyright (c) 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetEntity;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.TWTRJSONConvertible,
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

	
	
	
	TWTRTweetEntity=interface(NSObject)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{2B12E845-8F7A-4C98-8BEB-C4E8E5003B2C}']
		
		{*
		 * The start index of the entity in code points.
		 }
		function startIndex:NSInteger;cdecl;
		procedure setStartIndex(startIndex:NSInteger);cdecl;
		
		{*
		 * The end index of the entity in code points.
		 }
		function endIndex:NSInteger;cdecl;
		procedure setEndIndex(endIndex:NSInteger);cdecl;
		
		{*
		 * Initializes the receiver with the given start index and end index.
		 }
		[MethodName('initWithStartIndex:endIndex:')]
		{-} function initWithStartIndexendIndex(startIndex:NSInteger;endIndex:NSInteger):TWTRTweetEntity;cdecl;
		
		{*
		 * Subclasses should override this method to provide an accessibility value
		 * which can be used inside of Tweets.
		 }
		{-} function accessibilityValue:NSString{*};cdecl;
		
	end;
	
	TWTRTweetEntityClass=interface(NSObjectClass)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{D6DB640A-E60E-405E-8EB5-2306F3B96497}']
	end;
	
	TTWTRTweetEntity=class(TOCGenericImport<TWTRTweetEntityClass,TWTRTweetEntity>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

