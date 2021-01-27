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

unit iOSapi.AudioToolBox;

interface
  {$IFDEF IOS}

uses
  Posix.StdDef,
  Macapi.CoreFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreAudio,
  iOSapi.CoreVideo,
  iOSapi.CoreGraphics;


const
  libAudioToolBox = '/System/Library/Frameworks/AudioToolBox.framework/AudioToolBox.dylib';

type
  AudioQueueRef=Pointer;
  AudioQueuePropertyID=UInt32;


function AudioQueueGetProperty(inAQ: AudioQueueRef;
                              inID: AudioQueuePropertyID;
                              var outData:Pointer;
                              var ioDataSize:UInt32
                              ): OSStatus; cdecl;
  external libAudioToolBox name _PU + 'AudioQueueGetProperty';

{$ENDIF}

implementation


end.
