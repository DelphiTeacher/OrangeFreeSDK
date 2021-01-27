{License, info, etc
 ------------------
This implementation is made by me, Walied Othman, to contact me
mail to rainwolf@submanifold.be or triade@submanifold.be ,
always mention wether it 's about the FGInt or about the 6xs, 
preferably in the subject line.
This source code is free, but only to other free software, 
it's a two-way street, if you use this code in an application from which 
you won't make any money of (e.g. software for the good of mankind) 
then go right ahead, I won't stop you, I do demand acknowledgement for 
my work.  However, if you're using this code in a commercial application, 
an application from which you'll make money, then yes, I charge a 
license-fee, as described in the license agreement for commercial use, see 
the textfile in this zip-file.
If you 're going to use these implementations, let me know, so I ca, put a link 
on my page if desired, I 'm always curious as to see where the spawn of my 
mind ends up in.  If any algorithm is patented in your country, you should
acquire a license before using this software.  Modified versions of this
software must contain an acknowledgement of the original author (=me).

This implementation is available at 
http://www.submanifold.be

copyright 2000, Walied Othman
This header may not be removed.}

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　俐個�紺�郭幎遊扉 & Flying Wang 2015-11-04　　 *)
(*　　　　　　貧中議井幡蕗苧萩音勣卞茅。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　鋤峭窟下欺廓宥利徒。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

Unit FlyUtils.ECC.ECElGamal;

{$H+}

Interface

Uses FlyUtils.ECC.FGInt, FlyUtils.ECC.ECGFp, math,
  FlyUtils.CnXXX.Common,
  System.SysUtils;

Procedure ECElGamalEncrypt(M : String; P, a, b, k : TFGInt; g, y : TECPoint; Compression : boolean; Var E : String;
  MEncoding: TEncoding = nil;
  MCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
Procedure ECElGamalDecrypt(E : String; P, a, b, x : TFGInt; Var D : String;
  DEncoding: TEncoding = nil;
  DCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);

Implementation


// Encrypt a string M using ECElGamal defined on an elliptic curve
// y^2 = x^3 + a*x + b over GF(p), where 4*a^3 + 27*b^2 mod p doesn 't
// equal zero, g is the base point on the curve and y = x * g
// If you want the output to be compressed, set the parameter Compressed to
// true and false else.  The output is a string E

Procedure ECElGamalEncrypt(M : String; P, a, b, k : TFGInt; g, y : TECPoint; Compression : boolean; Var E : String;
  MEncoding: TEncoding = nil;
  MCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
Var
   t, c : Integer;
   temp, temp1, temp2 : String;
   ok : boolean;
   ECtemp1, ECtemp2, ECtemp3, ECtemp4 : TECPoint;
   FGtemp, k1, kt : TFGInt;
   MBytes: TBytes;
  Count,
  WhileCount,
  ProcMin, ProcMax, CurrDone: UInt64;
  Cancel: Boolean;
Begin
   FGIntToBase256String(P, temp);
   t := length(temp) - 3;
  if MCRLFMode <> rlNoChange then
  begin
    M := ChangCRLFType(M, MCRLFMode);
  end;
   if MEncoding <> nil then
   begin
     MBytes := MEncoding.GetBytes(M);
   end
   else
   begin
     MBytes := TEncoding.UTF8.GetBytes(M);
   end;
   temp := TEncoding.ANSI.GetString(MBytes);
  Count := Length(temp);
  ProcMin := 0;
  ProcMax := Count;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
   E := '';
   FGIntCopy(k, k1);
   FGIntRandom1(k1, kt);
   WhileCount := 0;
   While temp <> '' Do
   Begin
      c := 0;
      ok := false;
      While Not ok Do
      Begin
         temp1 := copy(temp, 1, min((t - c), length(temp)));
         ECInbedStringOnEC(temp1, p, a, b, ECtemp1, ok);
         If ok Then break;
         ECPointDestroy(ECtemp1);
         c := c + 1;
      End;
      delete(temp, 1, min((t - c), length(temp)));
      ECPointkMultiple(y, P, a, k1, ECtemp2);
      ECPointkMultiple(g, P, a, k1, ECtemp3);
      ECAddPoints(ECtemp1, ECtemp2, P, a, ECtemp4);
      ECPointDestroy(ECtemp2);
      ECPointDestroy(ECtemp1);
      ECPointToECPointString(ECtemp4, P, Compression, temp1);
      ECPointToECPointString(ECtemp3, P, Compression, temp2);
      E := E + temp1 + temp2;
      ECPointDestroy(ECtemp3);
      ECPointDestroy(ECtemp4);
      If temp <> '' Then
      Begin
         FGIntRandom1(kt, FGtemp);
         FGIntDestroy(kt);
         FGIntCopy(FGtemp, kt);
         FGIntDestroy(FGtemp);
         FGIntMontgomeryModExp(k1, kt, p, FGtemp);
         FGIntDestroy(k1);
         FGIntCopy(FGtemp, k1);
         FGIntDestroy(FGtemp);
      End;
      CurrDone := Count - Length(temp);
      inc(WhileCount);
      if WhileCount mod 3 = 1 then
      begin
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
        if Assigned(ProcessProc) then
          ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
        if Cancel then exit;
      end;
   End;
   FGIntDestroy(k1);
   FGIntDestroy(kt);
  CurrDone := Count;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
End;

// Decrypt a string E using ECElGamal defined on an elliptic curve
// y^2 = x^3 + a*x + b over GF(p), where 4*a^3 + 27*b^2 mod p doesn 't
// equal zero, x is your private parameter as defined above
// The output is a string D

Procedure ECElGamalDecrypt(E : String; P, a, b, x : TFGInt; Var D : String;
  DEncoding: TEncoding = nil;
  DCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
Var
   t, i : Integer;
   temp, temp1 : String;
   ECtemp1, ECtemp2, ECtemp3, ECtemp4 : TECPoint;
   DBytes: TBytes;
  Count,
  WhileCount,
  ProcMin, ProcMax, CurrDone: UInt64;
  Cancel: Boolean;
Begin
   FGIntToBase256String(P, temp);
   t := length(temp);
   temp := E;
  Count := Length(temp);
  ProcMin := 0;
  ProcMax := Count;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
   D := '';
   i := length(temp);
   WhileCount :=0;
   While temp <> '' Do
   Begin
      If temp[Low(string)] = chr(0) Then i := 1;
      If temp[Low(string)] = chr(4) Then i := 2 * t + 1;
      If (temp[Low(string)] = chr(2)) Or (temp[Low(string)] = chr(3)) Then i := t + 1;
      temp1 := copy(temp, 1, i);
      delete(temp, 1, i);
      ECPointStringToECPoint(temp1, p, a, b, ECtemp1);
      If temp[Low(string)] = chr(0) Then i := 1;
      If temp[Low(string)] = chr(4) Then i := 2 * t + 1;
      If (temp[Low(string)] = chr(2)) Or (temp[Low(string)] = chr(3)) Then i := t + 1;
      temp1 := copy(temp, 1, i);
      delete(temp, 1, i);
      ECPointStringToECPoint(temp1, p, a, b, ECtemp2);

      ECPointkMultiple(ECtemp2, P, a, x, ECtemp3);
      ECPointDestroy(ECtemp2);
      ECPointInverse(ECtemp3, P, ECtemp2);
      ECAddPoints(ECtemp1, ECtemp2, P, a, ECtemp4);
      ECPointDestroy(ECtemp2);
      ECPointDestroy(ECtemp1);
      ECExtractInbeddedString(ECtemp4, temp1);
      D := D + temp1;
      ECPointDestroy(ECtemp3);
      ECPointDestroy(ECtemp4);
      CurrDone := Count - Length(temp);
      inc(WhileCount);
      if WhileCount mod 3 = 1 then
      begin
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
        if Assigned(ProcessProc) then
          ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
        if Cancel then exit;
      end;
   End;
   DBytes := TEncoding.ANSI.GetBytes(D);
   if DEncoding <> nil then
   begin
     D := DEncoding.GetString(DBytes);
   end
   else
   begin
     D := TEncoding.UTF8.GetString(DBytes);
   end;
  if DCRLFMode <> rlNoChange then
  begin
    D := ChangCRLFType(D, DCRLFMode);
  end;
  CurrDone := Count;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
End;

End.
