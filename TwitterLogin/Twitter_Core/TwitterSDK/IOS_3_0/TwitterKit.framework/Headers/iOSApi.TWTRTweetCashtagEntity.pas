//
//  TWTRTweetCashtagEntity.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetCashtagEntity;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRJSONConvertible,
	iOSApi.TWTRTweetEntity,
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

	
	
	
	{*
	 * A Tweet entity which represents a Cashtag like '$twtr'
	 }
	TWTRTweetCashtagEntity=interface(TWTRTweetEntity)//<NSCoding, TWTRJSONConvertible>
	['{71449C42-5CBA-44D6-A3EE-DDB0B5BCCD8F}']
		
		{*
		 * The text represented by this entity.
		 * @note This entity does not include the '$'.
		 }
		function text:NSString{*};cdecl;
		procedure setText(text:NSString{*});cdecl;
		
	end;
	
	TWTRTweetCashtagEntityClass=interface(TWTRTweetEntityClass)//<NSCoding, TWTRJSONConvertible>
	['{87300957-192F-4600-9CAC-7F7192688B9E}']
	end;
	
	TTWTRTweetCashtagEntity=class(TOCGenericImport<TWTRTweetCashtagEntityClass,TWTRTweetCashtagEntity>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

