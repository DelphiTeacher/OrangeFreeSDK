unit iOSApi.CFNetwork;

interface

{$IFDEF IOS}
uses
  Macapi.CoreFoundation, Posix.SysSocket, Macapi.Dispatch;

const
  libCFNetwork = '/System/Library/Frameworks/CFNetwork.framework/CFNetwork';


function kCFStreamErrorDomainMach: Int32; cdecl;
  external libCFNetwork name _PU + 'kCFStreamErrorDomainMach';
function kCFStreamErrorDomainSystemConfiguration:Int32 cdecl;
  external libCFNetwork name _PU + 'kCFStreamErrorDomainSystemConfiguration';
function kCFStreamErrorDomainNetDB:Int32; cdecl;
  external libCFNetwork name _PU + 'kCFStreamErrorDomainNetDB';
function kCFStreamErrorDomainNetServices: Int32; cdecl;
  external libCFNetwork name _PU + 'kCFStreamErrorDomainNetServices';
function kCFStreamPropertySSLSettings:CFStringRef; cdecl;
  external libCFNetwork name _PU + 'kCFStreamPropertySSLSettings';

{$ENDIF}

implementation



end.
