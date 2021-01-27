{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Internal.ExcUtils;

{
 This unit contains exception handling utility code that is used solely in the
 internal implementation of exception handling in the RTL.
}

{$IFDEF CPUARM32}
{$IFDEF IOS}
{$D-} // Disable generate a debug information on SjLj exception system.
{$ENDIF IOS}
{$ENDIF CPUARM32}

interface

uses
   System.SysUtils, System.SysConst;

{ If defined, we enable O/S hardware exception handling support on POSIX platforms
  that support it. }
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  {$DEFINE ENABLE_SIGNAL_HANDLING}
{$ENDIF LINUX or MACOS or ANDROID}

type
  TExceptType = (etDivByZero, etRangeError, etIntOverflow, etInvalidOp, etZeroDivide, etOverflow, etUnderflow,
    etInvalidCast, etAccessViolation, etPrivilege, etControlC, etStackOverflow, etVariantError, etAssertionFailed,
    etExternalException, etIntfCastError, etSafeCallException, etMonitorLockException, etNoMonitorSupportException
{$IF defined(LINUX) or defined(MACOS) or Defined(ANDROID)}
    , etQuit
{$ENDIF LINUX or MACOS}
{$IFDEF POSIX}
    , etCodesetConversion
{$ENDIF POSIX}
    , etNotImplemented, etObjectDisposed
    );
  TExceptRec = record
    EClass: TExceptType;
    EIdent: string;
  end;

const
  ExceptTypes: array[TExceptType] of ExceptClass = (
    EDivByZero,
    ERangeError,
    EIntOverflow,
    EInvalidOp,
    EZeroDivide,
    EOverflow,
    EUnderflow,
    EInvalidCast,
    EAccessViolation,
    EPrivilege,
    EControlC,
{$WARN SYMBOL_DEPRECATED OFF}
    EStackOverflow,
{$WARN SYMBOL_DEPRECATED DEFAULT}
    EVariantError,
    EAssertionFailed,
    EExternalException,
    EIntfCastError,
    ESafecallException,
    EMonitorLockException,
    ENoMonitorSupportException
{$IF defined(LINUX) or defined(MACOS) or Defined(ANDROID)}
    ,
    EQuit
{$ENDIF LINUX or MACOS}
{$IFDEF POSIX}
    ,
    ECodesetConversion
{$ENDIF POSIX}
    ,
    ENotImplemented,
    EObjectDisposed
  );
  // by using another indirection, the linker can actually eliminate all exception support if exceptions are not
  // referenced by the applicaiton.
  ExceptMap: array[Ord(reDivByZero)..Ord(High(TRuntimeError))] of TExceptRec = (
    (EClass: etDivByZero; EIdent: SDivByZero),
    (EClass: etRangeError; EIdent: SRangeError),
    (EClass: etIntOverflow; EIdent: SIntOverflow),
    (EClass: etInvalidOp; EIdent: SInvalidOp),
    (EClass: etZeroDivide; EIdent: SZeroDivide),
    (EClass: etOverflow; EIdent: SOverflow),
    (EClass: etUnderflow; EIdent: SUnderflow),
    (EClass: etInvalidCast; EIdent: SInvalidCast),
    (EClass: etAccessViolation; EIdent: SAccessViolationNoArg),
    (EClass: etPrivilege; EIdent: SPrivilege),
    (EClass: etControlC; EIdent: SControlC),
    (EClass: etStackOverflow; EIdent: SStackOverflow),
    (EClass: etVariantError; EIdent: SInvalidVarCast),
    (EClass: etVariantError; EIdent: SInvalidVarOp),
    (EClass: etVariantError; EIdent: SDispatchError),
    (EClass: etVariantError; EIdent: SVarArrayCreate),
    (EClass: etVariantError; EIdent: SVarInvalid),
    (EClass: etVariantError; EIdent: SVarArrayBounds),
    (EClass: etAssertionFailed; EIdent: SAssertionFailed),
    (EClass: etExternalException; EIdent: SExternalException),
    (EClass: etIntfCastError; EIdent: SIntfCastError),
    (EClass: etSafecallException; EIdent: SSafecallException),
    (EClass: etMonitorLockException; EIdent: SMonitorLockException),
    (EClass: etNoMonitorSupportException; EIdent: SNoMonitorSupportException)
  {$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
    ,
    (EClass: etQuit; EIdent: SQuit)
  {$ENDIF LINUX or MACOS or ANDROID}
  {$IFDEF POSIX}
    ,
    (EClass: etCodesetConversion; EIdent: SCodesetConversionError)
  {$ENDIF POSIX}
    ,
    (EClass: etNotImplemented; EIdent: SNotImplemented),
    (EClass: etObjectDisposed; EIdent: SObjectDisposed)
    );

{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
function GetExceptionObject(ExceptionAddress: NativeUInt; AccessAddress: NativeUInt; ErrorCode: LongWord): Exception;
{$ENDIF LINUX or MACOS}

{$IFDEF ENABLE_SIGNAL_HANDLING}
{   InquireSignal is used to determine the state of an OS signal handler.
    Pass it one of the RTL_SIG* constants, and it will return a TSignalState
    which will tell you if the signal has been hooked, not hooked, or overriden
    by some other module.  You can use this function to determine if some other
    module has hijacked your signal handlers, should you wish to reinstall your
    own. This is a risky proposition under Linux, and is only recommended as a
    last resort.  Do not pass RTL_SIGDEFAULT to this function.
}
function InquireSignal(RtlSigNum: Integer): TSignalState;

{ AbandonSignalHandler tells the RTL to leave a signal handler
    in place, even if we believe that we hooked it at startup time.

    Once you have called AbandonSignalHandler with a specific signal number,
    neither UnhookSignal nor the RTL will restore any previous signal handler
    under any condition.
}
procedure AbandonSignalHandler(RtlSigNum: Integer);

{ HookSignal is used to hook individual signals, or an RTL-defined default
    set of signals.  It does not test whether a signal has already been
    hooked, so it should be used in conjunction with InquireSignal.  It is
    exposed to enable users to hook signals in standalone libraries, or in the
    event that an external module hijacks the RTL installed signal handlers.
    Pass RTL_SIGDEFAULT if you want to hook all the signals that the RTL
    normally hooks at startup time.
}
procedure HookSignal(RtlSigNum: Integer);

{ UnhookSignal is used to remove signal handlers installed by HookSignal.
    It can remove individual signal handlers, or the RTL-defined default set
    of signals.  If OnlyIfHooked is True, then we will only unhook the signal
    if the signal handler has been hooked, and has not since been overriden by
    some foreign handler.
}
procedure UnhookSignal(RtlSigNum: Integer; OnlyIfHooked: Boolean = True);

{ HookOSExceptions is used internally by thread support.  DON'T call this
  function yourself. }
procedure HookOSExceptions;

procedure UnhookOSExceptions;

{ MapSignal is used internally as well.  It maps a signal and associated
  context to an internal value that represents the type of Exception
  class to raise. }
{$IF Defined(LINUX64) and Defined(CPUX64)}
function MapSignal(SigNum, Code: Integer; Context: IntPtr): LongWord;
{$ELSEIF Defined(LINUX) or Defined(ANDROID)}
function MapSignal(SigNum: Integer; Context: IntPtr): LongWord;
{$ELSEIF Defined(MACOS)}
function MapSignal(SigNum: Integer): LongWord;
{$ENDIF !MACOS}

{ SignalConverter is used internally to properly reinit the FPU and properly
  raise an external OS exception object.  DON'T call this function yourself. }
procedure SignalConverter(ExceptionEIP: NativeUInt; FaultAddr: NativeUInt; ErrorCode: NativeUInt);
{$ENDIF ENABLE_SIGNAL_HANDLING}

{$IFDEF CPUARM32}
function CalcThumbInstructionSize(const InstPtr: UInt32): UInt32;
{$ENDIF CPUARM32}

implementation
{$IFDEF POSIX}
uses
{$IFDEF MACOS}
  System.Internal.MachExceptions,
{$ENDIF MACOS}
{$IFDEF ANDROID}
  Androidapi.Jni,
{$ENDIF ANDROID}
  Posix.Base,
  Posix.Signal,
  Posix.Stdlib,
  Posix.Unistd,
  Posix.Pthread;

function TlsGetValue(Key: Integer): Pointer; cdecl;
  external libpthread name _PU + 'pthread_getspecific';

{$ENDIF}

{$IFDEF PIC}
{ Do not remove export or the begin block. }
{$IFDEF ANDROID}
{$ELSE}
{$IFDEF CPUX86}
function GetGOT: Pointer;
begin
  asm
        MOV     Result,EBX
  end;
end;
{$ENDIF CPUX86}
{$ENDIF ANDROID}
{$ENDIF PIC}

{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}

function GetExceptionObject(ExceptionAddress: NativeUInt; AccessAddress: NativeUInt; ErrorCode: LongWord): Exception;
begin
  case (ErrorCode and $ff) of
    3..10, 12..21, 25:
      begin
        Result := ExceptTypes[ExceptMap[ErrorCode and $ff].EClass].Create(ExceptMap[ErrorCode and $ff].EIdent);
      end;
    11:
      Result := EAccessViolation.CreateFmt(SAccessViolationArg2, [Pointer(ExceptionAddress), Pointer(AccessAddress)]);
  else
//    Result := EExternalException.CreateFmt(SExternalException, [P.ExceptionCode]);
{ Not quite right - we need the original trap code, but that's lost }
    Result := EExternalException.CreateFmt(SExternalException, [ErrorCode and $ff]);
  end;

  EExternal(Result).ExceptionAddress := ExceptionAddress;
  EExternal(Result).AccessAddress := AccessAddress;
  EExternal(Result).SignalNumber := ErrorCode shr 16;
end;

{$ENDIF LINUX or MACOS or ANDROID}

{$IFDEF ENABLE_SIGNAL_HANDLING}
{$IF Defined(LINUX) and not Defined(CPUARM)}
{$IFDEF DEBUG}
{
  Used for debugging the signal handlers.
}
procedure DumpContext(SigNum: Integer; context : Psigcontext_t);
{$IFDEF CPUX86}
var
   Buff: array[0..128] of char;
{$ENDIF CPUX86}
begin
{$IFDEF CPUX86}
   StrFmt(Buff, 'Context for signal: %d', [SigNum]);
   Writeln(Buff);
   StrFmt(Buff, 'CS = %04X  DS = %04X  ES = %04X  FS = %04X  GS = %04X  SS = %04X',
          [context^.cs, context^.ds, context^.es, context^.fs, context^.gs, context^.ss]);
   WriteLn(Buff);
   StrFmt(Buff, 'EAX = %08X  EBX = %08X  ECX = %08X  EDX = %08X',
          [context^.eax, context^.ebx, context^.ecx, context^.edx]);
   WriteLn(Buff);
   StrFmt(Buff, 'EDI = %08X  ESI = %08X  EBP = %08X  ESP = %08X',
          [context^.edi, context^.esi, context^.ebp, context^.esp]);
   WriteLn(Buff);
   StrFmt(Buff, 'EIP = %08X  EFLAGS = %08X  ESP(signal) = %08X  CR2 = %08X',
          [context^.eip, context^.eflags, context^.esp_at_signal, context^.cr2]);
   WriteLn(Buff);
   StrFmt(Buff, 'trapno = %d, err = %08x', [context^.trapno, context^.err]);
   WriteLn(Buff);
{$ENDIF CPUX86}
end;
{$ENDIF DEBUG}
{$ENDIF LINUX}

{
  RaiseSignalException is called from SignalConverter, once we've made things look
  like there's a legitimate stack frame above us.  Now we will just create
  an exception object, and raise it via a software raise.
}
procedure RaiseSignalException(ExceptionEIP: LongWord; FaultAddr: LongWord; ErrorCode: LongWord);
begin
  raise GetExceptionObject(ExceptionEIP, FaultAddr, ErrorCode);
end;

{
  SignalConverter is where we come when a signal is raised that we want to convert
  to an exception.  This function stands the best chance of being called with a
  useable stack frame behind it for the purpose of stack unwinding.  We can't
  guarantee that, though.  The stack was modified by the baseline signal handler
  to make it look as though we were called by the faulting instruction.  That way
  the unwinder stands a chance of being able to clean things up.
}
procedure SignalConverter(ExceptionEIP: NativeUInt; FaultAddr: NativeUInt; ErrorCode: NativeUInt);
{$IFDEF CPUX86}
{$IFDEF ASSEMBLER}
asm
        {
          Here's the tricky part.  We arrived here directly by virtue of our
          signal handler tweaking the execution context with our address.  That
          means there's no return address on the stack.  The unwinder needs to
          have a return address so that it can unwind past this function when
          we raise the Delphi exception.  We will use the faulting instruction
          pointer as a fake return address.  Because of the fencepost conditions
          in the Delphi unwinder, we need to have an address that is strictly
          greater than the actual faulting instruction, so we increment that
          address by one.  This may be in the middle of an instruction, but we
          don't care, because we will never be returning to that address.
          Finally, the way that we get this address onto the stack is important.
          The compiler will generate unwind information for SignalConverter that
          will attempt to undo any stack modifications that are made by this
          function when unwinding past it.  In this particular case, we don't want
          that to happen, so we use some assembly language tricks to get around
          the compiler noticing the stack modification.
        }
        MOV EBX, ESP      // Get the current stack pointer
        SUB EBX, 4        // Effectively decrement the stack by 4
        MOV ESP, EBX      //   by doing a move to ESP with a register value
        MOV [ESP], EAX    // Store the instruction pointer into the new stack loc
        INC [ESP]         // Increment by one to keep the unwinder happy

        { Reset the FPU, or things can go south down the line from here }
        FNINIT
        FWAIT
{$IFDEF IOS} // iOS/Simulator. iOS imply PIC
        PUSH    EAX
        PUSH    ECX
        PUSH    EAX // scratch buffer for FLDCW & LDMXCSR

        CALL    GetGOT
        MOV     EAX, [EAX].offset Default8087CW
        MOV     EAX, [EAX]
        OR      EAX, $03F // Mask all exceptions
        MOV     [ESP], EAX
        FLDCW   [ESP]

        CALL    GetGOT
        MOV     EAX, [EAX].offset DefaultMXCSR
        MOV     EAX, [EAX]
        OR      EAX, $1F80 // Mask all exceptions
        MOV     [ESP], EAX
        LDMXCSR [ESP]

        POP     EAX
        POP     ECX
        POP     EAX
{$ELSE !IOS}
 {$IFDEF PIC}
        PUSH    EAX
        PUSH    ECX
        CALL    GetGOT
        MOV     EAX, [EAX].offset Default8087CW
        FLDCW   [EAX]
        POP     ECX
        POP     EAX
 {$ELSE !PIC}
        FLDCW   Default8087CW
 {$ENDIF !PIC}
{$ENDIF IOS}
        PUSH    EBP
        MOV     EBP, ESP
{$IFDEF ALIGN_STACK}
        {
          On the Mac, we have to align the stack before we make this call.
          Note: Please see above for details on why ESP is modified in this way.
        }
        MOV EBX, ESP      // Get the current stack pointer
        SUB EBX, 15       // align to 16 byte boundary
        AND EBX, $FFFFFFF0
        MOV ESP, EBX      // and reset ESP to the 16 byte aligned value
{$ENDIF ALIGN_STACK}
        CALL    RaiseSignalException
end;
{$ENDIF ASSEMBLER}
{$ENDIF CPUX86}

{$IF defined(MACOS) and Defined(CPUX64)}
begin
  raise GetExceptionObject(ExceptionEIP, FaultAddr, ErrorCode) at Pointer(ExceptionEIP);
end;
exports SignalConverter;
{$ENDIF MACOS/64}

{$IF defined(LINUX) and (Defined(CPUX86) or Defined(CPUX64))}
begin
  raise GetExceptionObject(ExceptionEIP, FaultAddr, ErrorCode) at Pointer(ExceptionEIP);
end;
exports SignalConverter;
{$ENDIF LINUX/Intel}
{$IF defined(CPUARM)}
begin
  raise GetExceptionObject(ExceptionEIP, FaultAddr, ErrorCode) at Pointer(ExceptionEIP);
end;
{$ENDIF CPUARM }

{
  Under Linux, we crawl out from underneath the OS signal handler before
  we attempt to do anything with the signal.  This is because the stack
  has a bunch of OS frames on there that we cannot possibly unwind from.
  So we use this routine to accomplish the dispatch, and then another
  routine to handle the language level of the exception handling.
}

function AreOSExceptionsBlocked: Boolean;
begin
  Result := False;
end;
procedure BlockOSExceptions;
begin
end;

{$IFDEF CPUARM32}
function CalcThumbInstructionSize(const InstPtr: UInt32): UInt32;
var
  FirstWord: Word;
begin
  FirstWOrd := PWord(InstPtr)^;
  case FirstWord of
  $E8..$EF, // 0b11101
  $F0..$F7, // 0b11110
  $F8..$ff: // 0b11111
    Result := 4; // 32bit (4bytes) instruction
  else
    Result := 2; // 16bit (2bytes) instruction
  end;
end;
{$ENDIF CPUARM32}

{$IFDEF ANDROID}
const
  librtlhelper = 'librtlhelper.a';

procedure  _Unwind_RaiseException2; cdecl; // we need *naked* procedure. (exception_object, IP,SP,LR,FP: Pointer): Cardinal; cdecl;
    external librtlhelper name '_Unwind_RaiseException2';
{$ENDIF ANDROID}


procedure SignalDispatcher(SigNum: Integer; SigInfo: Psiginfo_t; UContext: Pointer); cdecl;
{$IFDEF ANDROID}
var
  UserContext: Pucontext_t;
{$ENDIF ANDROID}
{$IFDEF MACOS}
var
  mcontext: Pmcontext_t;
{$ENDIF MACOS}
{$IFDEF LINUX}
{$IF defined(CPUX86) or defined(CPUX64)}
var
  mcontext: Pmcontext_t;
{$ENDIF CPUX86 or CPUX64}
{$ENDIF LINUX}
{$IFDEF CPUARM32}
{$IF defined(ANDROID) or defined(MACOS)}
var
  NextInst: UIntPtr;
{$ENDIF ANDROID or MACOS}
{$ENDIF CPUARM32}
begin
{$IF defined(LINUX) and defined(DEBUG)}
//  DumpContext(SigNum, @context);
{$ENDIF LINUX and DEBUG}
  {
    Some of the ways that we get here can lead us to big trouble.  For
    example, if the signal is SIGINT or SIGQUIT, these will commonly be raised
    to all threads in the process if the user generated them from the
    keyboard.  This is handled well by the Delphi threads, but if a non-Delphi
    thread lets one of these get by unhandled, terrible things will happen.
    So we look for that case, and eat SIGINT and SIGQUIT that have been issued
    on threads that are not Delphi threads.  If the signal is a SIGSEGV, or
    other fatal sort of signal, and the thread that we're running on is not
    a Delphi thread, then we are completely without options.  We have no
    recovery means, and we have to take the app down hard, right away.
  }
  if TlsGetValue(TlsIndex) = nil then
  begin
    if (SigNum = SIGINT) or (SigNum = SIGQUIT) then
      Exit;
    RunError(232);
  end;

  {
    If we are processing another exception right now, we definitely do not
    want to be dispatching any exceptions that are async, like SIGINT and
    SIGQUIT.  So we have check to see if OS signals are blocked.  If they are,
    we have to eat this signal right now.
  }
  if AreOSExceptionsBlocked and ((SigNum = SIGINT) or (SigNum = SIGQUIT)) then
    Exit;

  {
    If someone wants to delay the handling of SIGINT or SIGQUIT until such
    time as it's safe to handle it, they set DeferUserInterrupts to True.
    Then we just set a global variable saying that a SIGINT or SIGQUIT was
    issued.  It is the responsibility of some other body of code at this
    point to poll for changes to SIG(INT/QUIT)Issued
  }
  if DeferUserInterrupts then
  begin
    if SigNum = SIGINT then
    begin
      SIGINTIssued := True;
      Exit;
    end;
    if SigNum = SIGQUIT then
    begin
      SIGQUITIssued := True;
      Exit;
    end;
  end;

  BlockOSExceptions;

{$IFDEF ANDROID}
 {$IFDEF CPUARM32}
  UserContext := Pucontext_t(UContext);
  if DeferSegmentationViolation and (SigNum = SIGSEGV) then
  begin
    SIGSEGVIssued := True;
    SIGSEGVFaultInstPtr := UserContext.uc_mcontext.arm_pc;
    SIGSEGVFaultAddrPtr := UserContext.uc_mcontext.fault_address;

    NextInst := UserContext.uc_mcontext.arm_pc;
    if (UserContext.uc_mcontext.arm_cpsr and $20) = 0 then // $20 is Thumb execution state bit
      NextInst := NextInst + 4 // ARM mode.
    else
      NextInst := NextInst + CalcThumbInstructionSize(NextInst);
  end
  else
  begin
    if IsLeafFunction(UserContext.uc_mcontext.arm_pc) then
    begin
      UserContext.uc_mcontext.arm_r0 := AllocateExceptionFrame(
        GetExceptionObject(UserContext.uc_mcontext.arm_pc, UserContext.uc_mcontext.fault_address, MapSignal(SigNum, IntPtr(UContext))),
        UserContext.uc_mcontext.arm_pc);
      UserContext.uc_mcontext.arm_r1 := NativeUInt(UserContext.uc_mcontext.arm_pc); // IP
      UserContext.uc_mcontext.arm_r2 := NativeUInt(UserContext.uc_mcontext.arm_sp); // SP
      UserContext.uc_mcontext.arm_r3 := NativeUInt(UserContext.uc_mcontext.arm_lr); // LR
      UserContext.uc_mcontext.arm_r4 := NativeUInt(UserContext.uc_mcontext.arm_r7); // FR
      NextInst := UIntPtr(@_Unwind_RaiseException2);
    end
    else
    begin
      UserContext.uc_mcontext.arm_r0 := UserContext.uc_mcontext.arm_pc;
      UserContext.uc_mcontext.arm_r1 := UserContext.uc_mcontext.fault_address;
      UserContext.uc_mcontext.arm_r2 := MapSignal(SigNum, IntPtr(UContext));

      UserContext.uc_mcontext.arm_lr := (UserContext.uc_mcontext.arm_pc and (not $3)); // 00 is ARM / 01 is Thumb
      if (UserContext.uc_mcontext.arm_cpsr and $20) <> 0 then // $20 is Thumb execution state bit
        UserContext.uc_mcontext.arm_lr := UserContext.uc_mcontext.arm_lr or $1;
      NextInst := UIntPtr(@SignalConverter);
    end;
  end;
  UserContext.uc_mcontext.arm_pc := NextInst;
 {$ENDIF CPUARM32}
 {$IFDEF CPUARM64}
                                                                                
{$MESSAGE ERROR 'Not implemented yet'}
 {$ENDIF CPUARM64}
{$ENDIF ANDROID}
{$IFDEF MACOS}
 {$IF defined(CPUX86)}
  mcontext := Pucontext_t(UContext)^.uc_mcontext;
  mcontext^.__ss.__eax := mcontext^.__ss.__eip;
  mcontext^.__ss.__edx := mcontext^.__es.__faultvaddr;
  mcontext^.__ss.__ecx := MapSignal(SigNum);
  mcontext^.__ss.__eip := UIntPtr(@SignalConverter);
 {$ENDIF CPUX86}
 {$IF defined(CPUX64)}
                                                                                   
  mcontext := Pucontext_t(UContext)^.uc_mcontext;
  mcontext^.__ss.__rsp := mcontext^.__ss.__rsp - SizeOf(Pointer);
//  UIntPtr(mcontext^.__ss.__rsp)^ := mcontext^.__ss.__rip;
  mcontext^.__ss.__rsp := mcontext^.__ss.__rip;                                       
  mcontext^.__ss.__rdi := mcontext^.__ss.__rip;
  mcontext^.__ss.__rsi := mcontext^.__es.__faultvaddr;
  mcontext^.__ss.__rdx := MapSignal(SigNum);
  mcontext^.__ss.__rip := UIntPtr(@SignalConverter);
 {$ENDIF CPUX64}
 {$IF defined(CPUARM32)}
  mcontext := Pucontext_t(UContext)^.uc_mcontext;
  if DeferSegmentationViolation and (SigNum = SIGSEGV) then
  begin
    SIGSEGVIssued := True;
    SIGSEGVFaultInstPtr := mcontext^.__ss.__pc;
    SIGSEGVFaultAddrPtr := mcontext^.__es.__far;

    NextInst := mcontext^.__ss.__pc;
    if (mcontext^.__ss.__cpsr and $20) = 0 then // $20 is Thumb execution state bit
      NextInst := NextInst + 4 // ARM mode.
    else
      NextInst := NextInst + CalcThumbInstructionSize(NextInst);
    mcontext^.__ss.__pc := NextInst;
  end
  else
  begin
    mcontext^.__ss.__r[0] := mcontext^.__ss.__pc;
    mcontext^.__ss.__r[1] := mcontext^.__es.__far;
    mcontext^.__ss.__r[2] := MapSignal(SigNum);
    mcontext^.__ss.__pc := UIntPtr(@SignalConverter);
  end;
 {$ENDIF CPUARM32}
 {$IF defined(CPUARM64)}
  mcontext := Pucontext_t(UContext)^.uc_mcontext;
  if DeferSegmentationViolation and (SigNum = SIGSEGV) then
  begin
    SIGSEGVIssued := True;
    SIGSEGVFaultInstPtr := mcontext^.__ss.__pc;
    SIGSEGVFaultAddrPtr := mcontext^.__es.__far;
    mcontext^.__ss.__pc := mcontext^.__ss.__pc + 4;
  end
  else
  begin
    mcontext^.__ss.__x[0] := mcontext^.__ss.__pc;
    mcontext^.__ss.__x[1] := mcontext^.__es.__far;
    mcontext^.__ss.__x[2] := MapSignal(SigNum);
    mcontext^.__ss.__pc := UIntPtr(@SignalConverter);
  end;
 {$ENDIF CPUARM64}
{$ENDIF MACOS}
{$IFDEF LINUX}
 {$IFDEF CPUX86}
  mcontext := @Pucontext_t(UContext)^.uc_mcontext;
  begin
    mcontext^.gregs[REG_ESP] := mcontext^.gregs[REG_ESP] - SizeOf(Pointer);
    Pgreg_t(mcontext^.gregs[REG_ESP])^ := mcontext^.gregs[REG_EIP];
    mcontext^.gregs[REG_EAX] := mcontext^.gregs[REG_EIP];
    mcontext^.gregs[REG_EDX] := greg_t(siginfo._sifields._sigfault.si_addr);
    mcontext^.gregs[REG_ECX] := MapSignal(SigNum, IntPtr(@mcontext^.gregs));
    mcontext^.gregs[REG_EIP] := LongWord(@SignalConverter);
  end;
 {$ENDIF CPUX86}
 {$IFDEF CPUX64}
  mcontext := @Pucontext_t(UContext)^.uc_mcontext;
  begin
    mcontext^.gregs[REG_RSP] := mcontext^.gregs[REG_RSP] - SizeOf(Pointer);
    Pgreg_t(mcontext^.gregs[REG_RSP])^ := mcontext^.gregs[REG_RIP];
    mcontext^.gregs[REG_RDI] := mcontext^.gregs[REG_RIP];
    mcontext^.gregs[REG_RSI] := greg_t(siginfo._sifields._sigfault.si_addr);
    mcontext^.gregs[REG_RDX] := MapSignal(SigNum, siginfo.si_code, IntPtr(@mcontext^.gregs));
    mcontext^.gregs[REG_RIP] := greg_t(@SignalConverter);
  end;
 {$ENDIF CPUX64}
{$ENDIF LINUX}
end;

type
  TSignalMap = record
    SigNum: Integer;
    OldAction: sigaction_t;
    Abandon: Boolean;
    Hooked: Boolean;
  end;

var
  Signals: array [0..RTL_SIGLAST] of TSignalMap =
     ((SigNum: SIGINT;),
{$IF DEFINED(LINUX) OR DEFINED(ANDROID)}
      (SigNum: SIGFPE;),
      (SigNum: SIGSEGV;),
      (SigNum: SIGILL;),
      (SigNum: SIGBUS;),
{$ENDIF DEFINED(LINUX) OR DEFINED(ANDROID)}
      (SigNum: SIGQUIT;) );

function InquireSignal(RtlSigNum: Integer): TSignalState;
var
  Action: sigaction_t;
begin
  if sigaction(Signals[RtlSigNum].SigNum, nil, @Action) = -1 then
    raise Exception.CreateRes(@SSigactionFailed);
{$IF defined(MACOS)}
  if (@Action.__sigaction_handler.sa_sigaction <> @SignalDispatcher) then
{$ELSE}
  if (@Action._u.sa_sigaction <> @SignalDispatcher) then
{$ENDIF}
  begin
    if Signals[RtlSigNum].Hooked then
      Result := ssOverridden
    else
      Result := ssNotHooked;
  end
  else
    Result := ssHooked;
end;

procedure AbandonSignalHandler(RtlSigNum: Integer);
var
  I: Integer;
begin
  if RtlSigNum = RTL_SIGDEFAULT then
  begin
    for I := 0 to RTL_SIGLAST do
      AbandonSignalHandler(I);
    Exit;
  end;
  Signals[RtlSigNum].Abandon := True;
end;

procedure HookSignal(RtlSigNum: Integer);
var
  Action: sigaction_t;
  I: Integer;
begin
  if RtlSigNum = RTL_SIGDEFAULT then
  begin
    for I := 0 to RTL_SIGLAST do
      HookSignal(I);
    Exit;
  end;

  FillChar(Action, SizeOf(Action), 0);
{$IF defined(MACOS)}
  Action.__sigaction_handler.sa_sigaction := @SignalDispatcher;
{$ELSE}
  Action._u.sa_sigaction := @SignalDispatcher;
{$ENDIF}
  Action.sa_flags := SA_SIGINFO;
  sigaddset(Action.sa_mask, SIGINT);
  sigaddset(Action.sa_mask, SIGQUIT);
  if sigaction(Signals[RtlSigNum].SigNum, @Action, @Signals[RtlSigNum].OldAction) = -1 then
    raise Exception.CreateRes(@SSigactionFailed);
  Signals[RtlSigNum].Hooked := True;
end;

procedure UnhookSignal(RtlSigNum: Integer; OnlyIfHooked: Boolean);
var
  I: Integer;
begin
  if RtlSigNum = RTL_SIGDEFAULT then
  begin
    for I := 0 to RTL_SIGLAST do
      UnhookSignal(I, OnlyIfHooked);
    Exit;
  end;
  if not Signals[RtlSigNum].Abandon then
  begin
    if OnlyIfHooked and (InquireSignal(RtlSigNum) <> ssHooked) then
      Exit;
    if sigaction(Signals[RtlSigNum].SigNum, @Signals[RtlSigNum].OldAction, Nil) = -1 then
      raise Exception.CreateRes(@SSigactionFailed);
    Signals[RtlSigNum].Hooked := False;
  end;
end;

procedure UnhookOSExceptions;
begin
{$WARN SYMBOL_DEPRECATED OFF}
  if not Assigned(HookOSExceptionsProc) then
    UnhookSignal(RTL_SIGDEFAULT, True);
{$WARN SYMBOL_DEPRECATED DEFAULT}
end;

procedure HookOSExceptions;
begin
{$WARN SYMBOL_DEPRECATED OFF}
  if Assigned(HookOSExceptionsProc) then
    HookOSExceptionsProc
  else
{$WARN SYMBOL_DEPRECATED DEFAULT}
  begin
{$IFDEF MACOS}
    if getenv('NO_DELPHI_MACH_EXCEPTIONS') = nil then
      MachExceptionsInit;
{$ENDIF MACOS}
    HookSignal(RTL_SIGDEFAULT);
  end;
end;

{$IF Defined(LINUX64) and Defined(CPUX64)}
function MapSignal(SigNum, Code: Integer; Context: IntPtr): LongWord;
{$ELSEIF Defined(LINUX) or Defined(ANDROID)}
function MapSignal(SigNum: Integer; Context: IntPtr): LongWord;
{$ELSE}
{$IF Defined(MACOS)}
function MapSignal(SigNum: Integer): LongWord;
{$ELSE}
  {$MESSAGE ERROR 'Not yet implemented this platform'}
{$ENDIF !MACOS or !ANDROID}
{$ENDIF}
var
  Err: TRuntimeError;
begin
  case SigNum of
    SIGINT:       { Control-C }
      Err := System.reControlBreak;
    SIGQUIT:       { Quit key (Control-\) }
      Err := System.reQuit;
{$IF Defined(LINUX) or Defined(ANDROID)}
    SIGFPE:       { Floating Point Error }
{$IF Defined(LINUX64) and Defined(CPUX64)}
      Err := MapFPE(Context, Code);
{$ELSE}
      Err := MapFPE(Context);
{$ENDIF}
    SIGSEGV:      { Segmentation Violation }
      Err := MapFault(Context);
    SIGILL:       { Illegal Instruction }
      Err := MapFault(Context);
    SIGBUS:       { Bus Error }
     Err := MapFault(Context);
{$ENDIF}
  else
    Err := System.reExternalException;
  end;
  Result := LongWord(Err) or (LongWord(SigNum) shl 16);
end;

procedure PropagateSignals;
var
  Exc: TObject;
begin
  {
    If there is a current exception pending, then we're shutting down because
    it went unhandled.  If that exception is the result of a signal, then we
    need to propagate that back out to the world as a real signal death.  See
    the discussion at http://www2.cons.org/cracauer/sigint.html for more info.
  }
  Exc := ExceptObject;
  if (Exc <> nil) and (Exc is EExternal) then
     kill(getpid, EExternal(Exc).SignalNumber);
end;
{$ENDIF ENABLE_SIGNAL_HANDLING}

{$IFDEF ANDROID}
procedure DoRaiseJNIExceptionCallBack(const JNIExceptionClassName: string; const Msg: string);
begin
  raise EJNIException.CreateWithClassName(JNIExceptionClassName, Msg);
end;
{$ENDIF}

initialization
{$IFDEF ENABLE_SIGNAL_HANDLING}
  ExitProcessProc := PropagateSignals;
{$ENDIF ENABLE_SIGNAL_HANDLING}
{$IFDEF ANDROID}
  Androidapi.Jni.DoRaiseJNIException := DoRaiseJNIExceptionCallBack;
{$ENDIF}
end.
