//
//  TWTRMoPubAdConfiguration.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRMoPubAdConfiguration;

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
	 *  Bridging class for configuring how to load your MoPub ad unit.
	 }
	TWTRMoPubAdConfiguration=interface(NSObject)//
	['{A7BBE737-A1D6-48BF-97FB-606E44B875FA}']
		
		{*
		 *  Ad unit ID of the MoPub ad.
		 }
		function adUnitID:NSString{*};cdecl;
		procedure setAdUnitID(adUnitID:NSString{*});cdecl;
		
		{*
		 *  Keywords specified in comma-separated key-value pairs to provide
		 *  better targetting of the ads. e.g. "marital:single,age:24"
		 *  @see https://github.com/mopub/mopub-ios-sdk/blob/master/MoPubSDK/Native%20Ads/MPNativeAdRequestTargeting.h
		 }
		function keywords:NSString{*};cdecl;
		procedure setKeywords(keywords:NSString{*});cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRMoPubAdConfiguration;cdecl;
		
		{*
		 *  Initializes a new MoPub ad configuration.
		 *
		 *  @param adUnitID The ad unit ID as configured in the MoPub dashboard
		 *  @param keywords Keywords for better ad targeting
		 *
		 *  @return Fully initialized ad configuration.
		 }
		[MethodName('initWithAdUnitID:keywords:')]
		{-} function initWithAdUnitIDkeywords(adUnitID:NSString{*};keywords:{nullable} NSString{*}):TWTRMoPubAdConfiguration;cdecl;
		
	end;
	
	TWTRMoPubAdConfigurationClass=interface(NSObjectClass)//
	['{0FE9272D-12F8-43B4-B7FA-75F50CC3E6C4}']
	end;
	
	TTWTRMoPubAdConfiguration=class(TOCGenericImport<TWTRMoPubAdConfigurationClass,TWTRMoPubAdConfiguration>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

