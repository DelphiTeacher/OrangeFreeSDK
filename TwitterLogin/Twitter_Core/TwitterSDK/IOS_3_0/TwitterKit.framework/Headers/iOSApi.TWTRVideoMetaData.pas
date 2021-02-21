//
//  TWTRVideoMetaData.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRVideoMetaData;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRJSONConvertible,
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	
	
	
	
	TWTRVideoMetaDataVariant=interface(NSObject)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{167BF004-0A10-47A1-A698-81BC2DF91B98}']
		
		{*
		 * The bitrate of the entitity
		 }
		function bitrate:NSInteger;cdecl;
		procedure setBitrate(bitrate:NSInteger);cdecl;
		
		{*
		 * The content type of the video entity.
		 }
		function contentType:NSString{*};cdecl;
		procedure setContentType(contentType:NSString{*});cdecl;
		
		{*
		 * The URL for the entity.
		 }
		function URL:NSURL{*};cdecl;
		procedure setURL(URL:NSURL{*});cdecl;
		
	end;
	
	TWTRVideoMetaDataVariantClass=interface(NSObjectClass)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{E650FB5D-3979-4F87-9A52-C39C9FF3238A}']
	end;
	
	TTWTRVideoMetaDataVariant=class(TOCGenericImport<TWTRVideoMetaDataVariantClass,TWTRVideoMetaDataVariant>)
	end;
	
	TWTRVideoMetaData=interface(NSObject)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{C5BB6C6E-A3BE-4503-A5A3-7BD24CC03EE6}']
		
		{*
		 * The URL of the video if the video is an mp4. This value is provided as a convenience
		 * method but user's should query the `variants` property to have finer grained control
		 * over which video they play.
		 }
		function videoURL:NSURL{*};cdecl;
		procedure setVideoURL(videoURL:NSURL{*});cdecl;
		
		{*
		 * Returns the array of variants.
		 }
		function variants:NSArray{*};cdecl;
		procedure setVariants(variants:NSArray{*});cdecl;
		
		{*
		 * The video's aspect ratio.
		 }
		function aspectRatio:CGFloat;cdecl;
		procedure setAspectRatio(aspectRatio:CGFloat);cdecl;
		
		{*
		 * The video's duration in seconds.
		 }
		function duration:NSTimeInterval;cdecl;
		procedure setDuration(duration:NSTimeInterval);cdecl;
		
	end;
	
	TWTRVideoMetaDataClass=interface(NSObjectClass)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{29F72B18-5C0A-4BD3-A439-93D765EE9C95}']
	end;
	
	TTWTRVideoMetaData=class(TOCGenericImport<TWTRVideoMetaDataClass,TWTRVideoMetaData>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

