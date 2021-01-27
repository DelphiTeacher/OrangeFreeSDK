{**********************************************************}
{                                                          }
{           CodeGear Delphi Runtime Library                }
{                                                          }
{ Delphi-Objective-C Bridge                                }
{ Interfaces for Cocoa framework CoreLocation              }
{                                                          }
{ Copyright (c) 2008-2010, Apple Inc. All rights reserved. }
{                                                          }
{ Translator: Embarcadero Technologies, Inc.               }
{   Copyright(c) 2012-2015 Embarcadero Technologies, Inc.  }
{                                                          }
{**********************************************************}

unit iOSapi.AddressBook;

interface

  {$IFDEF IOS}
uses
  Macapi.ObjectiveC, Macapi.ObjCRuntime, iOSapi.CocoaTypes, iOSapi.Foundation;

const
  libAddressBook = '/System/Library/Frameworks/AddressBook.framework/AddressBook';

  {$ENDIF}

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}
uses
  Posix.Dlfcn;

var
  CLModule: THandle;
{$ENDIF IOS}



{$IF defined(IOS) and NOT defined(CPUARM)}
initialization
  CLModule := dlopen(MarshaledAString(libAddressBook), RTLD_LAZY);

finalization
  dlclose(CLModule);
{$ENDIF IOS}

end.
