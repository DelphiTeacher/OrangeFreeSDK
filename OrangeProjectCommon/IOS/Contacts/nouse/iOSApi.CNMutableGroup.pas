//
//  CNMutableGroup.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNMutableGroup;

interface

{$IFDEF IOS}
uses
	iOSapi.CNGroup,
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

	
	
	
	
	{!
	 * @abstract A mutable value object representing a group.
	 *
	 * @discussion CNMutableGroup is not thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNMutableGroup=interface(CNGroup)//
	['{D79DD032-58E7-46C3-9A6D-597BFD5C7E0F}']
		
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
	end;
	
	CNMutableGroupClass=interface(CNGroupClass)//
	['{6505FF69-227D-4518-9EC6-0E589D8D0B75}']
	end;
	
	TCNMutableGroup=class(TOCGenericImport<CNMutableGroupClass,CNMutableGroup>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNMutableGroup_FakeLoader : CNMutableGroup; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNMutableGroup';
{$O+}


{$ENDIF}

end.

