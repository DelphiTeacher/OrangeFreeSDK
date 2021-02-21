//
//  TWTRTweetHashtagEntity.h
//
//  Copyright (c) 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetHashtagEntity;

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
	 * A Tweet entity which represents a Hashtag like '#twitterkit'
	 }
	TWTRTweetHashtagEntity=interface(TWTRTweetEntity)//<NSCoding, TWTRJSONConvertible>
	['{384F8B0C-C402-49B8-81F6-C7926A054A56}']
		
		{*
		 * The text represented by this entity.
		 * @note This entity does not include the '#'.
		 }
		function text:NSString{*};cdecl;
		procedure setText(text:NSString{*});cdecl;
		
	end;
	
	TWTRTweetHashtagEntityClass=interface(TWTRTweetEntityClass)//<NSCoding, TWTRJSONConvertible>
	['{DFF61164-1A16-41AB-AFB5-5B1013EAD547}']
	end;
	
	TTWTRTweetHashtagEntity=class(TOCGenericImport<TWTRTweetHashtagEntityClass,TWTRTweetHashtagEntity>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

