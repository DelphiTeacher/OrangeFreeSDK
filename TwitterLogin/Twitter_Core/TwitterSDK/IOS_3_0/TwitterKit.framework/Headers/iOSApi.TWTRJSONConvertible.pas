//
//  TWTRJSONConvertible.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRJSONConvertible;

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

	
	
	
	TWTRJSONConvertible=interface(IObjectiveC)
		['{9F123783-0B3E-4B87-B510-E5852D609BA6}']
		
		{*
		 * Initialize the receiver with its JSON object representation.
		 *
		 * @param dictionary the JSON object representing this object.
		 * @return the fully formed object or nil if the JSON is not valid.
		 }
		{-} function initWithJSONDictionary(dictionary:PNSDictionary{*}):{nullable} instancetype;cdecl;
		
	end;
	
	TOninitWithJSONDictionary=function(dictionary:PNSDictionary{*}):{nullable} instancetype of object;
	
	TTWTRJSONConvertible=class(TOCLocal,TWTRJSONConvertible)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OninitWithJSONDictionary:TOninitWithJSONDictionary;
	
		
		{*
		 * Initialize the receiver with its JSON object representation.
		 *
		 * @param dictionary the JSON object representing this object.
		 * @return the fully formed object or nil if the JSON is not valid.
		 }
		{-} function initWithJSONDictionary(dictionary:PNSDictionary{*}):{nullable} instancetype;cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRJSONConvertible }

constructor TTWTRJSONConvertible.Create;
begin
	Inherited Create;
end;

destructor TTWTRJSONConvertible.Destroy;
begin
	Inherited;
end;

function  TTWTRJSONConvertible.initWithJSONDictionary(dictionary:PNSDictionary{*}):{nullable} instancetype;
begin
	if Assigned(OninitWithJSONDictionary) then
	begin
		Result:=OninitWithJSONDictionary(dictionary);
	end;
end;



{$ENDIF}

end.

