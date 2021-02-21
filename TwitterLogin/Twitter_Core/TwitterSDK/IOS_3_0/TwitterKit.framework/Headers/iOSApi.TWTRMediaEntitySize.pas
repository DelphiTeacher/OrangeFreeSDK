//
//  TWTRMediaEntitySize.h
//  TwitterKit
//
//  Copyright (c) 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRMediaEntitySize;

interface

{$IFDEF IOS}
uses
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
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	
	
	TWTRMediaEntitySizeResizingMode_=(
	//(NSUInteger, TWTRMediaEntitySizeResizingMode) {
	    TWTRMediaEntitySizeResizingModeFit,
	    TWTRMediaEntitySizeResizingModeCrop//,
	);
	TWTRMediaEntitySizeResizingMode=Integer;
	
	{FOUNDATION_EXPORT} function NSStringFromTWTRMediaEntitySizeResizingMode(resizingMode:WTRMediaEntitySizeResizingMod):NSString{*};cdecl;
	{FOUNDATION_EXPORT} function TWTRMediaEntitySizeResizingModeFromString(resizingModeString:SStrin{*}):TWTRMediaEntitySizeResizingMode;cdecl;
	
	TWTRMediaEntitySize=interface(NSObject)//<NSCoding>
	['{EFA21C13-9E3F-4BFD-BDDA-509AEE6B61B3}']
		
		{*
		 * The name of the size. 'large', 'medium', etc.
		 }
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
		{*
		 * Resize mode of the image size e.g. Fit, Crop.
		 }
		function resizingMode:TWTRMediaEntitySizeResizingMode;cdecl;
		procedure setResizingMode(resizingMode:TWTRMediaEntitySizeResizingMode);cdecl;
		
		{*
		 * The actual size.
		 }
		function size:CGSize;cdecl;
		procedure setSize(size:CGSize);cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRMediaEntitySize;cdecl;
		
		{*
		 *  Designated initializer.
		 *
		 *  @param name         The name of the size. If nil will default to the empty string.
		 *  @param resizingMode The resizing mode of this entity size.
		 *  @param size         The size of the entity.
		 }
		[MethodName('initWithName:resizingMode:size:')]
		{-} function initWithNameresizingModesize(name:NSString{*};resizingMode:TWTRMediaEntitySizeResizingMode;size:CGSize):TWTRMediaEntitySize;cdecl;
		
		{-} function isEqualToMediaEntitySize(otherSize:TWTRMediaEntitySize{*}):Boolean;cdecl;
		
		{*
		 *  Returns a dictionary of valid `TWTRMediaEntitySize` instances from the Twitter API response for media sizes.
		 *
		 *  @param dictionary A parsed dictionary of media sizes from the Twitter API response
		 *
		 *  @return Dictionary of parsed `TWTRMediaEntitySize` instances keyed by size name.
		 }
		
	end;
	
	TWTRMediaEntitySizeClass=interface(NSObjectClass)//<NSCoding>
	['{1B55E3A7-7D8A-46E2-9D1C-4A26AE586564}']
		{+} function mediaEntitySizesWithJSONDictionary(dictionary:PNSDictionary{*}):PNSDictionary{*};cdecl;
	end;
	
	TTWTRMediaEntitySize=class(TOCGenericImport<TWTRMediaEntitySizeClass,TWTRMediaEntitySize>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}
{FOUNDATION_EXPORT} function NSStringFromTWTRMediaEntitySizeResizingMode(resizingMode:WTRMediaEntitySizeResizingMod):NSString{*};cdecl;external {$I BaiduMapDylibName.inc} name _PU + 'NSStringFromTWTRMediaEntitySizeResizingMode'
{FOUNDATION_EXPORT} function TWTRMediaEntitySizeResizingModeFromString(resizingModeString:SStrin{*}):TWTRMediaEntitySizeResizingMode;cdecl;external {$I BaiduMapDylibName.inc} name _PU + 'TWTRMediaEntitySizeResizingModeFromString'


{$ENDIF}

end.

