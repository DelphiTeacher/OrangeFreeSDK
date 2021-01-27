(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2014-08-04　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

unit Androidapi.JNI.StatFs;

interface

uses 
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type

  {Class forward declarations}
  JStatFs = interface;//android.os.StatFs

JStatFsClass = interface(JObjectClass)
['{04A59649-7C35-4BA3-BC4B-B4A2E0815EC9}']
  {Property Methods}
  {Methods}
  function init(path: JString): JStatFs; cdecl;
  {Properties}
end;

[JavaSignature('android/os/StatFs')]
JStatFs = interface(JObject)
['{04A3F7FE-0244-4E28-8225-D81FE33DAD87}']
  {Property Methods}
  {Methods}
  procedure restat(path: JString); cdecl;
  procedure finalize; cdecl;
  function getBlockSize: Integer; cdecl;
  function getBlockCount: Integer; cdecl;
  function getFreeBlocks: Integer; cdecl;
  function getAvailableBlocks: Integer; cdecl;
  {Properties}
end;
TJStatFs = class(TJavaGenericImport<JStatFsClass, JStatFs>) end;


implementation

begin

end.


