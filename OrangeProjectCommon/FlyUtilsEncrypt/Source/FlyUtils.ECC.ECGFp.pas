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
(*　　修改：爱吃猪头肉 & Flying Wang 2015-11-04　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)
//注意，所有 String ，内容都应该是 ASCII 。否则后果自负。

Unit FlyUtils.ECC.ECGFp;

{$H+}

Interface

Uses FlyUtils.ECC.FGInt, math;

Type
   TECPoint = Record
      XCoordinate, YCoordinate : TFGInt;
      Infinity : Boolean;
   End;
   TOrderList = Record
      order1 : TFGInt;
      order2 : TFGInt;
      order3 : TFGInt;
      order4 : TFGInt;
      order5 : TFGInt;
      order6 : TFGInt;
   End;


Const
   primes : Array[1..1228] Of integer =
      (3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
      131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
      257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389,
      397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541,
      547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677,
      683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839,
      853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997, 1009,
      1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, 1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123,
      1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223, 1229, 1231, 1237, 1249, 1259, 1277, 1279,
      1283, 1289, 1291, 1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, 1381, 1399, 1409, 1423, 1427, 1429,
      1433, 1439, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, 1523, 1531, 1543, 1549, 1553,
      1559, 1567, 1571, 1579, 1583, 1597, 1601, 1607, 1609, 1613, 1619, 1621, 1627, 1637, 1657, 1663, 1667, 1669, 1693,
      1697, 1699, 1709, 1721, 1723, 1733, 1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811, 1823, 1831, 1847,
      1861, 1867, 1871, 1873, 1877, 1879, 1889, 1901, 1907, 1913, 1931, 1933, 1949, 1951, 1973, 1979, 1987, 1993, 1997,
      1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053, 2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111, 2113, 2129, 2131,
      2137, 2141, 2143, 2153, 2161, 2179, 2203, 2207, 2213, 2221, 2237, 2239, 2243, 2251, 2267, 2269, 2273, 2281, 2287,
      2293, 2297, 2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357, 2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411, 2417,
      2423, 2437, 2441, 2447, 2459, 2467, 2473, 2477, 2503, 2521, 2531, 2539, 2543, 2549, 2551, 2557, 2579, 2591, 2593,
      2609, 2617, 2621, 2633, 2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687, 2689, 2693, 2699, 2707, 2711, 2713, 2719,
      2729, 2731, 2741, 2749, 2753, 2767, 2777, 2789, 2791, 2797, 2801, 2803, 2819, 2833, 2837, 2843, 2851, 2857, 2861,
      2879, 2887, 2897, 2903, 2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999, 3001, 3011, 3019, 3023, 3037,
      3041, 3049, 3061, 3067, 3079, 3083, 3089, 3109, 3119, 3121, 3137, 3163, 3167, 3169, 3181, 3187, 3191, 3203, 3209,
      3217, 3221, 3229, 3251, 3253, 3257, 3259, 3271, 3299, 3301, 3307, 3313, 3319, 3323, 3329, 3331, 3343, 3347, 3359,
      3361, 3371, 3373, 3389, 3391, 3407, 3413, 3433, 3449, 3457, 3461, 3463, 3467, 3469, 3491, 3499, 3511, 3517, 3527,
      3529, 3533, 3539, 3541, 3547, 3557, 3559, 3571, 3581, 3583, 3593, 3607, 3613, 3617, 3623, 3631, 3637, 3643, 3659,
      3671, 3673, 3677, 3691, 3697, 3701, 3709, 3719, 3727, 3733, 3739, 3761, 3767, 3769, 3779, 3793, 3797, 3803, 3821,
      3823, 3833, 3847, 3851, 3853, 3863, 3877, 3881, 3889, 3907, 3911, 3917, 3919, 3923, 3929, 3931, 3943, 3947, 3967,
      3989, 4001, 4003, 4007, 4013, 4019, 4021, 4027, 4049, 4051, 4057, 4073, 4079, 4091, 4093, 4099, 4111, 4127, 4129,
      4133, 4139, 4153, 4157, 4159, 4177, 4201, 4211, 4217, 4219, 4229, 4231, 4241, 4243, 4253, 4259, 4261, 4271, 4273,
      4283, 4289, 4297, 4327, 4337, 4339, 4349, 4357, 4363, 4373, 4391, 4397, 4409, 4421, 4423, 4441, 4447, 4451, 4457,
      4463, 4481, 4483, 4493, 4507, 4513, 4517, 4519, 4523, 4547, 4549, 4561, 4567, 4583, 4591, 4597, 4603, 4621, 4637,
      4639, 4643, 4649, 4651, 4657, 4663, 4673, 4679, 4691, 4703, 4721, 4723, 4729, 4733, 4751, 4759, 4783, 4787, 4789,
      4793, 4799, 4801, 4813, 4817, 4831, 4861, 4871, 4877, 4889, 4903, 4909, 4919, 4931, 4933, 4937, 4943, 4951, 4957,
      4967, 4969, 4973, 4987, 4993, 4999, 5003, 5009, 5011, 5021, 5023, 5039, 5051, 5059, 5077, 5081, 5087, 5099, 5101,
      5107, 5113, 5119, 5147, 5153, 5167, 5171, 5179, 5189, 5197, 5209, 5227, 5231, 5233, 5237, 5261, 5273, 5279, 5281,
      5297, 5303, 5309, 5323, 5333, 5347, 5351, 5381, 5387, 5393, 5399, 5407, 5413, 5417, 5419, 5431, 5437, 5441, 5443,
      5449, 5471, 5477, 5479, 5483, 5501, 5503, 5507, 5519, 5521, 5527, 5531, 5557, 5563, 5569, 5573, 5581, 5591, 5623,
      5639, 5641, 5647, 5651, 5653, 5657, 5659, 5669, 5683, 5689, 5693, 5701, 5711, 5717, 5737, 5741, 5743, 5749, 5779,
      5783, 5791, 5801, 5807, 5813, 5821, 5827, 5839, 5843, 5849, 5851, 5857, 5861, 5867, 5869, 5879, 5881, 5897, 5903,
      5923, 5927, 5939, 5953, 5981, 5987, 6007, 6011, 6029, 6037, 6043, 6047, 6053, 6067, 6073, 6079, 6089, 6091, 6101,
      6113, 6121, 6131, 6133, 6143, 6151, 6163, 6173, 6197, 6199, 6203, 6211, 6217, 6221, 6229, 6247, 6257, 6263, 6269,
      6271, 6277, 6287, 6299, 6301, 6311, 6317, 6323, 6329, 6337, 6343, 6353, 6359, 6361, 6367, 6373, 6379, 6389, 6397,
      6421, 6427, 6449, 6451, 6469, 6473, 6481, 6491, 6521, 6529, 6547, 6551, 6553, 6563, 6569, 6571, 6577, 6581, 6599,
      6607, 6619, 6637, 6653, 6659, 6661, 6673, 6679, 6689, 6691, 6701, 6703, 6709, 6719, 6733, 6737, 6761, 6763, 6779,
      6781, 6791, 6793, 6803, 6823, 6827, 6829, 6833, 6841, 6857, 6863, 6869, 6871, 6883, 6899, 6907, 6911, 6917, 6947,
      6949, 6959, 6961, 6967, 6971, 6977, 6983, 6991, 6997, 7001, 7013, 7019, 7027, 7039, 7043, 7057, 7069, 7079, 7103,
      7109, 7121, 7127, 7129, 7151, 7159, 7177, 7187, 7193, 7207, 7211, 7213, 7219, 7229, 7237, 7243, 7247, 7253, 7283,
      7297, 7307, 7309, 7321, 7331, 7333, 7349, 7351, 7369, 7393, 7411, 7417, 7433, 7451, 7457, 7459, 7477, 7481, 7487,
      7489, 7499, 7507, 7517, 7523, 7529, 7537, 7541, 7547, 7549, 7559, 7561, 7573, 7577, 7583, 7589, 7591, 7603, 7607,
      7621, 7639, 7643, 7649, 7669, 7673, 7681, 7687, 7691, 7699, 7703, 7717, 7723, 7727, 7741, 7753, 7757, 7759, 7789,
      7793, 7817, 7823, 7829, 7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901, 7907, 7919, 7927, 7933, 7937, 7949, 7951,
      7963, 7993, 8009, 8011, 8017, 8039, 8053, 8059, 8069, 8081, 8087, 8089, 8093, 8101, 8111, 8117, 8123, 8147, 8161,
      8167, 8171, 8179, 8191, 8209, 8219, 8221, 8231, 8233, 8237, 8243, 8263, 8269, 8273, 8287, 8291, 8293, 8297, 8311,
      8317, 8329, 8353, 8363, 8369, 8377, 8387, 8389, 8419, 8423, 8429, 8431, 8443, 8447, 8461, 8467, 8501, 8513, 8521,
      8527, 8537, 8539, 8543, 8563, 8573, 8581, 8597, 8599, 8609, 8623, 8627, 8629, 8641, 8647, 8663, 8669, 8677, 8681,
      8689, 8693, 8699, 8707, 8713, 8719, 8731, 8737, 8741, 8747, 8753, 8761, 8779, 8783, 8803, 8807, 8819, 8821, 8831,
      8837, 8839, 8849, 8861, 8863, 8867, 8887, 8893, 8923, 8929, 8933, 8941, 8951, 8963, 8969, 8971, 8999, 9001, 9007,
      9011, 9013, 9029, 9041, 9043, 9049, 9059, 9067, 9091, 9103, 9109, 9127, 9133, 9137, 9151, 9157, 9161, 9173, 9181,
      9187, 9199, 9203, 9209, 9221, 9227, 9239, 9241, 9257, 9277, 9281, 9283, 9293, 9311, 9319, 9323, 9337, 9341, 9343,
      9349, 9371, 9377, 9391, 9397, 9403, 9413, 9419, 9421, 9431, 9433, 9437, 9439, 9461, 9463, 9467, 9473, 9479, 9491,
      9497, 9511, 9521, 9533, 9539, 9547, 9551, 9587, 9601, 9613, 9619, 9623, 9629, 9631, 9643, 9649, 9661, 9677, 9679,
      9689, 9697, 9719, 9721, 9733, 9739, 9743, 9749, 9767, 9769, 9781, 9787, 9791, 9803, 9811, 9817, 9829, 9833, 9839,
      9851, 9857, 9859, 9871, 9883, 9887, 9901, 9907, 9923, 9929, 9931, 9941, 9949, 9967, 9973);


Procedure ECPointToECPointString(ECPoint : TECPoint; Prime : TFGInt; Compression : boolean; Var ECPointString : String);
Procedure ECPointStringToECPoint(ECPointString : String; Prime, a, b : TFGInt; Var ECPoint : TECPoint);
Procedure ECPointCopy(P : TECPoint; Var Copied : TECPoint);
Procedure ECPointDestroy(Var P : TECPoint);
Procedure ECDoublePoint(P : TECPoint; Prime, a : TFGInt; Var Doubled : TECPoint);
Procedure ECAddPoints(P, Q : TECPoint; Prime, a : TFGInt; Var Sum : TECPoint);
Procedure ECPointKMultiple(P : TECPoint; Prime, a, k : TFGInt; Var Multiple : TECPoint);
Procedure ECPointInverse(P : TECPoint; Prime : TFGInt; Var Inverse : TECPoint);
Procedure ECInbedStringOnEC(InString : String; Prime, a, b : TFGInt; Var P : TECPoint; Var DidItWork : Boolean);
Procedure ECExtractInbeddedString(P : TECPoint; Var InBeddedString : String);
Procedure ECPrimeSearch(Var GInt : TFGInt; nrRMtests : byte);
Procedure ECFindNextPointOnEC(Var Prime, a, b : TFGInt; Var P : TECPoint);
Procedure ConstructCurveWithCMD(D : byte; Var a0, b0 : TFGInt);
Procedure IsCMD(Var D, p, W, V : TFGInt; Var IsCMD : boolean);
Procedure FindNextCMCandidate(Var p : TFGInt; Var D : byte; Var Found : boolean);
Procedure FindOrders(Var p : TFGInt; Var D : byte; Var Orders : TOrderList; Var Found : boolean);
Procedure IsNearlyPrime(Var n : TFGInt; leastsize : Integer; Var k, r : TFGInt; Var INP : boolean);
Procedure ConstructCurveAndPointWithGoodORder(Var p, k, r : TFGInt; D : byte; Var a, b : TFGInt; Var G : TECPoint);
Procedure ConstructCurveAndPoint(Var p : TFGINt; leastsize : Integer; Var a, b, k, r : TFGInt; Var G : TECPoint; Var DidItWork : boolean);
Procedure FindPrimeGoodCurveAndPoint(Var p, a, b, k, r : TFGInt; leastsize : Integer; Var G : TECPoint);
Procedure IsECSuperSingular(p, a, b : TFGInt; Var SS : boolean);


Implementation



// Convert a point (ECPoint) on an EC y^2 = x^3 + a*x + b over GF(Prime)
// to a string (ECPointString)

Procedure ECPointToECPointString(ECPoint : TECPoint; Prime : TFGInt; Compression : boolean; Var ECPointString : String);
Var
   l : Integer;
   temp : String;
Begin
   If ECPoint.infinity Then
   Begin
      ECPointString := chr(0);
      exit;
   End;
   FGIntToBase256String(Prime, temp);
   l := length(temp);
   FGIntToBase256String(ECPoint.XCoordinate, ECPointString);
   While length(ECPointString) < l Do ECPointString := chr(0) + ECPointString;
   If Compression Then
   Begin
      ECPointString := chr((ECPoint.YCoordinate.Number[1] Mod 2) + 2) + ECPointString;
   End
   Else
   Begin
      FGIntToBase256String(ECPoint.YCoordinate, temp);
      While length(temp) < l Do temp := chr(0) + temp;
      ECPointString := chr(4) + ECPointString + temp;
   End
End;

// Does the opposite from the procedure above, ECPointString MUST be
// created by the above procedure

Procedure ECPointStringToECPoint(ECPointString : String; Prime, a, b : TFGInt; Var ECPoint : TECPoint);
Var
   temp : String;
   temp1, temp2, temp3 : TFGInt;
   l : Integer;
Begin
   If ECPointString = chr(0) Then
   Begin
      ECPoint.Infinity := true;
      Base2StringToFGInt('0', ECPoint.XCoordinate);
      Base2StringToFGInt('0', ECPoint.YCoordinate);
   End
   Else
   Begin
      ECPoint.Infinity := false;
      FGIntToBase256String(Prime, temp);
      l := length(temp);
      If ECPointString[Low(string)] = chr(4) Then
      Begin
         Delete(ECPointString, 1, 1);
         temp := copy(ECPointString, 1, l);
         Base256StringToFGInt(temp, ECPoint.XCoordinate);
         temp := copy(ECPointString, l + 1, l);
         Base256StringToFGInt(temp, ECPoint.YCoordinate);
      End
      Else
      Begin
         temp := copy(ECPointString, 2, l);
         Base256StringToFGInt(temp, ECPoint.XCoordinate);
         FGIntSquareMod(ECPoint.XCoordinate, Prime, temp1);
         FGIntMulMod(temp1, ECPoint.XCoordinate, Prime, temp2);
         FGIntDestroy(temp1);
         FGIntMulMod(ECPoint.XCoordinate, a, Prime, temp1);
         FGIntAddMod(temp1, temp2, Prime, temp3);
         FGIntDestroy(temp1);
         FGIntDestroy(temp2);
         FGIntAddMod(temp3, b, Prime, temp1);
         FGIntDestroy(temp3);
         FGIntSquareRootModP(temp1, Prime, temp2);
         FGIntDestroy(temp1);
         If ((temp2.Number[1] Mod 2) + 2) = ord(ECPointString[Low(string)]) Then
         Begin
            FGIntCopy(temp2, ECPoint.YCoordinate);
            FGIntDestroy(temp2);
         End
         Else
         Begin
            FGIntCopy(Prime, ECPoint.YCoordinate);
            FGIntSubBis(ECPoint.YCoordinate, temp2);
            FGIntDestroy(temp2);
         End
      End;
   End
End;

// Make a copy of an ECPoint
// Copied := P

Procedure ECPointCopy(P : TECPoint; Var Copied : TECPoint);
Begin
   Copied.Infinity := P.Infinity;
   FGIntCopy(P.XCoordinate, Copied.XCoordinate);
   FGIntCopy(P.YCoordinate, Copied.YCoordinate);
End;

// Free the memory used by an ECPoint

Procedure ECPointDestroy(Var P : TECPoint);
Begin
   FGIntDestroy(P.XCoordinate);
   FGIntDestroy(P.YCoordinate);
End;

// Double a Point P on an Elliptic Curve y^2 = x^3 + a*x + b, over the
// finite prime field with "Prime" elements
// 2 * P = Doubled

Procedure ECDoublePoint(P : TECPoint; Prime, a : TFGInt; Var Doubled : TECPoint);
Var
   temp1, temp2, temp3, zero : TFGInt;
Begin
   If P.Infinity Then
   Begin
      ECPointCopy(P, Doubled);
      exit;
   End;
   Base2StringToFGInt('0', zero);
   If FGIntCompareAbs(P.YCoordinate, zero) = Eq Then
   Begin
      Doubled.Infinity := true;
      FGIntCopy(zero, Doubled.XCoordinate);
      FGIntCopy(zero, Doubled.YCoordinate);
      FGIntDestroy(zero);
      exit;
   End;
   FGIntDestroy(zero);
   Doubled.Infinity := false;
   FGIntSquareMod(P.XCoordinate, Prime, temp1);
   FGIntAddMod(temp1, temp1, Prime, temp2);
   FGIntAddMod(temp2, temp1, Prime, temp3);
   FGIntDestroy(temp1);
   FGIntDestroy(temp2);
   FGIntAddMod(temp3, a, Prime, temp2);
   FGIntDestroy(temp3);
   FGIntAddMod(P.YCoordinate, P.YCoordinate, Prime, temp1);
   FGIntModInv(temp1, Prime, temp3);
   FGIntDestroy(temp1);
   FGIntMulMod(temp3, temp2, Prime, temp1);
   FGIntDestroy(temp2);
   FGIntDestroy(temp3);
   FGIntAddmod(P.XCoordinate, P.XCoordinate, Prime, temp2);
   FGIntSquareMod(temp1, Prime, temp3);
   FGIntChangeSign(temp2);
   FGIntAddMod(temp3, temp2, Prime, Doubled.XCoordinate);
   FGIntDestroy(temp2);
   FGIntDestroy(temp3);
   FGIntCopy(Doubled.XCoordinate, temp2);
   FGIntChangeSign(temp2);
   FGIntAddMod(P.XCoordinate, temp2, Prime, temp3);
   FGIntDestroy(temp2);
   FGIntMulMod(temp3, temp1, Prime, temp2);
   FGIntDestroy(temp1);
   FGIntDestroy(temp3);
   FGIntCopy(P.YCoordinate, temp1);
   FGIntChangeSign(temp1);
   FGIntAddMod(temp2, temp1, Prime, Doubled.YCoordinate);
   FGIntDestroy(temp1);
   FGIntDestroy(temp2);
End;

// Add 2 Points, P and Q, on an Elliptic Curve y^2 = x^3 + a*x + b, over the
// finite prime field with "Prime" elements
// Q + P = Sum

Procedure ECAddPoints(P, Q : TECPoint; Prime, a : TFGInt; Var Sum : TECPoint);
Var
   temp1, temp2, temp3, temp4 : TFGInt;
Begin
   If P.Infinity Then
   Begin
      ECPointCopy(Q, Sum);
      exit;
   End;
   If Q.Infinity Then
   Begin
      ECPointCopy(P, Sum);
      exit;
   End;
   If FGIntCompareAbs(P.XCoordinate, Q.XCoordinate) = Eq Then
   Begin
      If (FGIntCompareAbs(P.YCoordinate, Q.YCoordinate) = Eq) Then
      Begin
         ECDoublePoint(P, Prime, a, Sum);
         Exit;
      End;
      Base2StringToFGInt('0', Sum.XCoordinate);
      Base2StringToFGInt('0', Sum.YCoordinate);
      Sum.Infinity := true;
   End
   Else
   Begin
      FGIntCopy(P.YCoordinate, temp2);
      FGIntChangeSign(temp2);
      FGIntAddMod(Q.YCoordinate, temp2, Prime, temp3);
      FGIntDestroy(temp2);
      FGIntCopy(P.XCoordinate, temp2);
      FGIntChangeSign(temp2);
      FGIntAddMod(Q.XCoordinate, temp2, Prime, temp1);
      FGIntDestroy(temp2);
      FGIntModInv(temp1, Prime, temp2);
      FGIntDestroy(temp1);
      FGIntMulMod(temp3, temp2, Prime, temp1);
      FGIntSquareMod(temp1, Prime, temp4);
      FGIntDestroy(temp2);
      FGIntDestroy(temp3);
      FGIntCopy(P.XCoordinate, temp2);
      FGIntChangeSign(temp2);
      FGIntAddMod(temp4, temp2, Prime, temp3);
      FGIntDestroy(temp2);
      FGIntCopy(Q.XCoordinate, temp2);
      FGIntChangeSign(temp2);
      FGIntAddMod(temp3, temp2, Prime, Sum.XCoordinate);
      FGIntDestroy(temp2);
      FGIntDestroy(temp3);
      FGIntDestroy(temp4);
      FGIntCopy(Sum.XCoordinate, temp2);
      FGIntChangeSign(temp2);
      FGIntAddMod(P.XCoordinate, temp2, Prime, temp3);
      FGIntDestroy(temp2);
      FGIntMulMod(temp1, temp3, Prime, temp2);
      FGIntDestroy(temp1);
      FGIntDestroy(temp3);
      FGIntCopy(P.YCoordinate, temp3);
      FGIntChangeSign(temp3);
      FGIntAddMod(temp2, temp3, Prime, Sum.YCoordinate);
      FGIntDestroy(temp2);
      FGIntDestroy(temp3);
      Sum.Infinity := False;
   End
End;

// Compute the k-multiple of a point P on an Elliptic Curve
// y^2 = x^3 + a*x + b, over the finite prime field with "Prime" elements
// k * P = Multiple

Procedure ECPointKMultiple(P : TECPoint; Prime, a, k : TFGInt; Var Multiple : TECPoint);
Var
   temp : String;
   i : Integer;
   temp1 : TECPoint;
Begin
   FGIntToBase2String(k, temp);
   Multiple.Infinity := True;
   Base2StringToFGInt('0', Multiple.XCoordinate);
   Base2StringToFGInt('0', Multiple.YCoordinate);
   For i := 1 To Length(temp) Do
   Begin
      If temp[Low(string) - 1 + i] = '1' Then
      Begin
         ECAddPoints(Multiple, P, Prime, a, temp1);
         ECPointDestroy(Multiple);
         ECPointCopy(temp1, Multiple);
         ECPointDestroy(temp1);
      End;
      If i < Length(temp) Then
      Begin
         ECDoublePoint(Multiple, Prime, a, temp1);
         ECPointDestroy(Multiple);
         ECPointCopy(temp1, Multiple);
         ECPointDestroy(temp1);
      End;
   End;
End;


// compute the inverse of an ECPoint P on an Elliptic curve over
// the finite field GF(Prime), P + Q = O, where O is the point
// at infnity

Procedure ECPointInverse(P : TECPoint; Prime : TFGInt; Var Inverse : TECPoint);
Begin
   If P.Infinity Then
   Begin
      ECPointCopy(P, Inverse);
      exit;
   End;
   Inverse.Infinity := false;
   FGIntCopy(P.XCoordinate, Inverse.XCoordinate);
   FGIntCopy(Prime, Inverse.YCoordinate);
   FGIntSubBis(Inverse.YCoordinate, P.YCoordinate);
End;


// Inbed a string, InString, on an Elliptic Curve, y^2 = x^3 + a*x + b,
// (length(InString) + 2)*8 must be less than the size of Prime in bits

Procedure ECInbedStringOnEC(InString : String; Prime, a, b : TFGInt; Var P : TECPoint; Var DidItWork : Boolean);
Var
   temp : String;
   pad : byte;
   i, L : integer;
   one, limit, counter, temp1, temp2, temp3, YSquare : TFGInt;
Begin
   DidItWork := false;
   FGIntToBase256String(Prime, temp);
   If length(temp) < (length(InString) + 3) Then exit;
   pad := min(255, length(temp) - length(InString) - 2);
   Base2StringToFGInt('1', one);
   Base2StringToFGInt('1', limit);
   temp := chr(pad) + InString;
   For i := 1 To pad Do temp := temp + chr(0);
   Base256StringToFGInt(temp, P.XCoordinate);
   temp := '1';
   For i := 1 To pad Do temp := temp + '00000000';
   Base2StringToFGInt(temp, Limit);
   Base2StringToFGInt('0', counter);
   While (Not DidItWork) And (FGIntCompareAbs(counter, Limit) = St) Do
   Begin
      FGIntAddBis(counter, one);
      FGIntSquareMod(P.XCoordinate, Prime, temp1);
      FGIntMulMod(P.XCoordinate, temp1, Prime, temp2);
      FGIntDestroy(temp1);
      FGIntMulMod(a, P.XCoordinate, Prime, temp1);
      FGIntAddMod(temp1, temp2, Prime, temp3);
      FGIntDestroy(temp1);
      FGIntDestroy(temp2);
      FGIntAddMod(temp3, b, Prime, YSquare);
      FGIntDestroy(temp3);
      FGIntLegendreSymbol(YSquare, Prime, L);
      If L = 1 Then DidItWork := true
      Else
      Begin
         FGIntAddBis(P.XCoordinate, one);
         FGIntDestroy(YSquare);
      End;
   End;
   If DidItWork Then
   Begin
      FGIntSquareRootModP(YSquare, Prime, P.YCoordinate);
      FGIntDestroy(YSquare);
      P.Infinity := false;
   End;
   FGIntDestroy(counter);
   FGIntDestroy(Limit);
   FGIntDestroy(one);
End;


// Extract an inbedded string which is inbedded with the procedure above

Procedure ECExtractInbeddedString(P : TECPoint; Var InBeddedString : String);
Var
   b : byte;
Begin
   FGIntToBase256String(P.XCoordinate, InBeddedString);
   b := ord(InBeddedString[Low(string)]);
   delete(InBeddedString, 1, 1);
   delete(InBeddedString, Length(InBeddedString) - b + 1, b);
End;


// Find a prime using a standard method but with nrRMtests Rabin-Miller tests

Procedure ECPrimeSearch(Var GInt : TFGInt; nrRMtests : byte);
Var
   two : TFGInt;
   ok : Boolean;
Begin
   If (GInt.Number[1] Mod 2) = 0 Then GInt.Number[1] := GInt.Number[1] + 1;
   Base10StringToFGInt('2', two);
   ok := false;
   While Not ok Do
   Begin
      FGIntAddBis(GInt, two);
      FGIntPrimeTest(GInt, nrRMtests, ok);
   End;
   FGIntDestroy(two);
End;


// Find a (next) point on the EC by incrementing the X coordinate

Procedure ECFindNextPointOnEC(Var Prime, a, b : TFGInt; Var P : TECPoint);
Var
   L : integer;
   one, temp1, temp2, temp3, YSquare : TFGInt;
   DidItWork : boolean;
Begin
   DidItWork := false;
   FGIntDestroy(P.YCoordinate);
   Base2StringToFGInt('1', one);
   While (Not DidItWork) Do
   Begin
      FGIntAddBis(P.XCoordinate, one);
      FGIntSquareMod(P.XCoordinate, Prime, temp1);
      FGIntMulMod(P.XCoordinate, temp1, Prime, temp2);
      FGIntDestroy(temp1);
      FGIntMulMod(a, P.XCoordinate, Prime, temp1);
      FGIntAddMod(temp1, temp2, Prime, temp3);
      FGIntDestroy(temp1);
      FGIntDestroy(temp2);
      FGIntAddMod(temp3, b, Prime, YSquare);
      FGIntDestroy(temp3);
      FGIntLegendreSymbol(YSquare, Prime, L);
      If L = 1 Then DidItWork := true Else FGIntDestroy(YSquare);
   End;
   FGIntSquareRootModP(YSquare, Prime, P.YCoordinate);
   FGIntDestroy(YSquare);
   P.Infinity := false;
   FGIntDestroy(one);
End;


// Construct an EC with the Complex Multiplication Discriminant D (P1363A)

Procedure ConstructCurveWithCMD(D : byte; Var a0, b0 : TFGInt);
Begin
   Case D Of
      1 : Begin
            Base2StringToFGInt('1', a0);
            Base2StringToFGInt('0', b0);
         End;
      2 : Begin
            Base10StringToFGInt('-30', a0);
            Base10StringToFGInt('56', b0);
         End;
      3 : Begin
            Base2StringToFGInt('0', a0);
            Base2StringToFGInt('1', b0);
         End;
      7 : Begin
            Base10StringToFGInt('-35', a0);
            Base10StringToFGInt('98', b0);
         End;
      11 : Begin
            Base10StringToFGInt('-264', a0);
            Base10StringToFGInt('1694', b0);
         End;
      19 : Begin
            Base10StringToFGInt('-152', a0);
            Base10StringToFGInt('722', b0);
         End;
      43 : Begin
            Base10StringToFGInt('-3440', a0);
            Base10StringToFGInt('77658', b0);
         End;
      67 : Begin
            Base10StringToFGInt('-29480', a0);
            Base10StringToFGInt('1948226', b0);
         End;
      163 : Begin
            Base10StringToFGInt('-8697680', a0);
            Base10StringToFGInt('9873093538', b0);
         End;
   End;
End;


// Test wether D is a CM Discriminant or not (P1363A)
// If so compute W and if necessary V so that 4*p = W^2 + D*V^2

Procedure IsCMD(Var D, p, W, V : TFGInt; Var IsCMD : boolean);
Var
   temp, tempd, temp1, temp2, A, B, C, U1, U2, S11, S12, S21, S22 : TFGInt;
   l : integer;
Begin
   FGIntSub(p, D, temp);
   FGIntLegendreSymbol(temp, p, l);
   IsCMD := false;
   If l = -1 Then
   Begin
      FGIntDestroy(temp);
      exit;
   End;
   FGIntSquareRootModP(temp, p, B);
   FGIntDestroy(temp);
   FGIntCopy(p, A);
   FGIntSquare(B, temp);
   FGIntAdd(temp, D, C);
   FGIntDestroy(temp);
   FGIntDiv(C, p, temp);
   FGIntDestroy(C);
   FGIntCopy(temp, C);
   FGIntDestroy(temp);
   FGIntCopy(A, S11);
   FGIntCopy(B, S12);
   FGIntCopy(B, S21);
   FGIntCopy(C, S22);
   Base2StringToFGInt('1', U1);
   Base2StringToFGInt('0', U2);
   FGIntAdd(B, B, temp);
   While (FGIntCompareAbs(temp, A) = Lt) Or (FGIntCompareAbs(A, C) = Lt) Do
   Begin
      FGIntAdd(temp, C, temp1);
      FGIntAdd(C, C, temp2);
      FGIntDiv(temp1, temp2, tempd);
      FGIntDestroy(temp);
      FGIntDestroy(temp1);
      FGIntDestroy(temp2);
      FGIntMul(tempd, U1, temp1);
      FGIntAdd(temp1, U2, temp2);
      FGIntDestroy(temp1);
      FGIntDestroy(U2);
      FGIntChangeSign(U1);
      FGIntCopy(U1, U2);
      FGIntDestroy(U1);
      FGIntCopy(temp2, U1);
      FGIntDestroy(temp2);
      FGIntDestroy(S11);
      FGIntCopy(C, S11);
      FGIntMul(tempd, C, temp1);
      FGIntSub(temp1, B, temp2);
      FGIntDestroy(temp1);
      FGIntDestroy(S12);
      FGIntDestroy(S21);
      FGIntCopy(temp2, S12);
      FGIntCopy(temp2, S21);
      FGIntDestroy(temp2);
      FGIntMul(tempd, S12, temp2);
      FGIntMul(B, tempd, temp1);
      FGIntSub(temp2, temp1, temp);
      FGIntDestroy(temp2);
      FGIntDestroy(temp1);
      FGIntDestroy(S22);
      FGIntAdd(A, temp, S22);
      FGIntDestroy(temp);
      FGIntDestroy(A);
      FGIntDestroy(B);
      FGIntDestroy(C);
      FGIntCopy(S11, A);
      FGIntCopy(S21, B);
      FGIntCopy(S22, C);
      FGIntAdd(B, B, temp);
      FGIntDestroy(tempd);
   End;
   FGIntDestroy(temp);
   FGIntDestroy(S11);
   FGIntDestroy(S22);
   FGIntDestroy(S21);
   FGIntDestroy(S12);
   If D.Number[0] = 1 Then
      If D.Number[1] = 11 Then
         If A.Sign = positive Then
            If A.Number[0] = 1 Then
               If A.Number[1] = 3 Then
               Begin
                  FGIntCopy(U2, temp);
                  FGIntDestroy(U2);
                  FGIntCopy(U1, U2);
                  FGIntDestroy(U1);
                  FGIntCopy(temp, U1);
                  FGIntDestroy(temp);
                  FGIntChangeSign(U2);
                  FGIntChangeSign(B);
                  FGIntCopy(A, temp);
                  FGIntDestroy(A);
                  FGIntCopy(C, A);
                  FGIntDestroy(C);
                  FGIntCopy(temp, C);
                  FGIntDestroy(temp);
               End;
   Base2StringToFGInt('1', temp1);
   FGIntCopy(temp1, temp2);
   temp2.Number[1] := 3;
   If (FGIntCompareAbs(D, temp1) = Eq) Or (FGIntCompareAbs(D, temp2) = Eq) Then
   Begin
      IsCMD := true;
      FGIntAdd(U1, U1, W);
      FGIntAdd(U2, U2, V);
   End
   Else If (FGIntCompareAbs(A, temp1) = Eq) Then
   Begin
      IsCMD := true;
      FGIntAdd(U1, U1, W);
   End;
   FGIntAddBis(temp1, temp2);
   FGIntDestroy(temp2);
   If (FGIntCompareAbs(A, temp1) = Eq) Then
   Begin
      IsCMD := true;
      FGIntMulByIntBis(U1, 4);
      FGIntMul(B, U2, temp2);
      FGIntAdd(temp2, U1, W);
      FGIntDestroy(temp2);
   End;
   FGIntDestroy(temp1);
   FGIntDestroy(U1);
   FGIntDestroy(U2);
   FGIntDestroy(A);
   FGIntDestroy(B);
   FGIntDestroy(C);
End;


// Speaks for itself (P1363A)

Procedure FindNextCMCandidate(Var p : TFGInt; Var D : byte; Var Found : boolean);
Const
   candidates1 : Array[0..9] Of byte = (9, 1, 2, 3, 7, 11, 19, 43, 67, 163);
   candidates3 : Array[0..8] Of byte = (8, 2, 3, 7, 11, 19, 43, 67, 163);
   candidates5 : Array[0..8] Of byte = (8, 1, 3, 7, 11, 19, 43, 67, 163);
   candidates7 : Array[0..7] Of byte = (7, 3, 7, 11, 19, 43, 67, 163);
Var
   i : integer;
Begin
   Found := false;
   Case (p.Number[1] Mod 8) Of
      1 : For i := 1 To candidates1[0] Do If candidates1[i] > D Then
            Begin
               D := candidates1[i];
               Found := true;
               break;
            End;
      3 : For i := 1 To candidates3[0] Do If candidates3[i] > D Then
            Begin
               D := candidates3[i];
               Found := true;
               break;
            End;
      5 : For i := 1 To candidates5[0] Do If candidates5[i] > D Then
            Begin
               D := candidates5[i];
               Found := true;
               break;
            End;
      7 : For i := 1 To candidates7[0] Do If candidates7[i] > D Then
            Begin
               D := candidates7[i];
               Found := true;
               break;
            End;
   End;
End;


// Given a prime p, a CMD D, find possible orders for a curve with CMD D,
// Found = false if no orders are found

Procedure FindOrders(Var p : TFGInt; Var D : byte; Var Orders : TOrderList; Var Found : boolean);
Var
   DGInt, temp, W, V : TFGInt;
   l : integer;
Begin
   Found := false;
   D := 0;
   While Not Found Do
   Begin
      FindNextCMCandidate(p, D, Found);
      If Not Found Then exit;
      Base256StringToFGInt(chr(D), DGInt);
      FGIntChangeSign(DGInt);
      FGIntLegendreSymbol(DGInt, p, l);
      FGIntChangeSign(DGInt);
      If l = -1 Then Found := false Else
      Begin
         If D > 2 Then FGIntLegendreSymbol(p, DGInt, l) Else l := 1;
         If l = -1 Then Found := false Else
         Begin
            IsCMD(DGInt, p, W, V, Found);
            If Found Then
            Begin
               FGIntCopy(p, Orders.Order1);
               Base2StringToFGInt('1', temp);
               FGIntAddBis(Orders.Order1, temp);
               FGIntCopy(Orders.Order1, Orders.Order2);
               FGIntDestroy(temp);
               If (D = 1) Then
               Begin
                  FGIntCopy(Orders.Order1, Orders.Order3);
                  FGIntCopy(Orders.Order1, Orders.Order4);
                  FGIntAddBis(Orders.Order3, V);
                  FGIntSubBis(Orders.Order4, V);
                  FGIntDestroy(V);
               End;
               If (D = 3) Then
               Begin
                  FGIntCopy(Orders.Order1, Orders.Order3);
                  FGIntCopy(Orders.Order1, Orders.Order4);
                  FGIntCopy(Orders.Order1, Orders.Order5);
                  FGIntCopy(Orders.Order1, Orders.Order6);
                  FGIntMulByIntBis(V, 3);
                  FGIntAdd(W, V, temp);
                  FGIntShiftRight(temp);
                  FGIntAddBis(Orders.Order3, temp);
                  FGIntSubBis(Orders.Order4, temp);
                  FGIntDestroy(temp);
                  FGIntSub(W, V, temp);
                  FGIntShiftRight(temp);
                  FGIntSubBis(Orders.Order5, temp);
                  FGIntAddBis(Orders.Order6, temp);
                  FGIntDestroy(temp);
                  FGIntDestroy(V);
               End;
               FGIntAddBis(Orders.Order1, W);
               FGIntSubBis(Orders.Order2, W);
               FGIntDestroy(W);
            End;
         End;
      End;
      FGIntDestroy(DGInt);
   End;
End;


// check if n has a prime factor r of at least leastsize bits, n = k*r
// INP = false if no large primefactor is found

Procedure IsNearlyPrime(Var n : TFGInt; leastsize : Integer; Var k, r : TFGInt; Var INP : boolean);
Var
   i : integer;
   m : FixedUInt;
   S : String;
   nTests : byte;
Begin
   FGIntCopy(n, r);
   While (r.Number[1] Mod 2) = 0 Do FGIntShiftRight(r);
   For i := 1 To 1228 Do
   Begin
      FGIntModByInt(r, primes[i], m);
      While m = 0 Do
      Begin
         FGIntDivByIntBis(r, primes[i], m);
         FGIntModByInt(r, primes[i], m);
      End;
   End;
   FGIntToBase2String(r, S);
   If length(S) < leastsize Then
   Begin
      INP := false;
      FGIntDestroy(r);
   End
   Else
   Begin
      nTests := 4;
      If length(S) < 460 Then nTests := 7;
      If length(S) < 300 Then nTests := 13;
      If length(S) < 260 Then nTests := 19;
      If length(S) < 200 Then nTests := 29;
      If length(S) < 160 Then nTests := 37;
      FGIntRabinMiller(r, nTests, INP);
      If INP Then FGIntDiv(n, r, k) Else FGIntDestroy(r);
   End;
End;


// Given a prime p, k, r and CMD D, find a curve of order k*r and a point G of order r
// a, b are provided by the procedure ConstructCurveWithCMD

Procedure ConstructCurveAndPointWithGoodORder(Var p, k, r : TFGInt; D : byte; Var a, b : TFGInt; Var G : TECPoint);
Var
   one, tempa, tempb, x, temp, tempx : TFGInt;
   DidItWork : boolean;
   tempG : TECPoint;
Begin
   Base2StringToFGInt('1', one);
   FGIntCopy(one, x);
   DidItWork := false;
   While Not DidItWork Do
   Begin
      If D = 1 Then
      Begin
         Base2StringToFGInt('0', tempb);
         FGIntMulMod(a, x, p, tempa);
      End;
      If D = 3 Then
      Begin
         Base2StringToFGInt('0', tempa);
         FGIntMulMod(b, x, p, tempb);
      End;
      If (D <> 1) And (D <> 3) Then
      Begin
         FGIntSquareMod(x, p, temp);
         FGIntMulMod(temp, a, p, tempa);
         FGIntMulMod(temp, b, p, tempx);
         FGIntMulMod(tempx, x, p, tempb);
         FGIntDestroy(temp);
         FGIntDestroy(tempx);
      End;
      FGIntCopy(one, tempG.XCoordinate);
      FGIntCopy(one, tempG.YCoordinate);
      tempG.Infinity := false;
      ECFindNextPointOnEC(p, tempa, tempb, tempG);
      ECPointKMultiple(tempG, p, tempa, k, G);
      While G.Infinity Do
      Begin
         ECFindNextPointOnEC(p, tempa, tempb, tempG);
         ECPointDestroy(G);
         ECPointKMultiple(tempG, p, tempa, k, G);
      End;
      ECpointDestroy(tempG);
      ECPointKMultiple(G, p, tempa, r, tempG);
      If tempG.Infinity Then
      Begin
         DidItwork := true;
         FGIntDestroy(a);
         FGIntCopy(tempa, a);
         FGIntDestroy(b);
         FGIntCopy(tempb, b);
      End
      Else
      Begin
         DidItWork := false;
         ECPointDestroy(G);
      End;
      FGIntDestroy(tempa);
      FGIntDestroy(tempb);
      ECPointDestroy(tempG);
      FGIntAddBis(x, one);
   End;
   FGIntDestroy(one);
   FGIntDestroy(x);
End;


// the name says it all (P1363A)
// provide a prime p and a leastsize Integer for the least number of bits of the point order

Procedure ConstructCurveAndPoint(Var p : TFGINt; leastsize : Integer; Var a, b, k, r : TFGInt; Var G : TECPoint; Var DidItWork : boolean);
Var
   Orders : TOrderList;
   D : byte;
Begin
   FindOrders(p, D, Orders, DidItWork);
   If Not DidItWork Then exit;
   If DidItWork Then
   Begin
      IsNearlyPrime(Orders.Order1, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   If (Not DidItWork) Then
   Begin
      IsNearlyPrime(Orders.Order2, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   If (Not DidItWork) And ((D = 3) Or (D = 1)) Then
   Begin
      IsNearlyPrime(Orders.Order3, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   If (Not DidItWork) And ((D = 3) Or (D = 1)) Then
   Begin
      IsNearlyPrime(Orders.Order4, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   If (Not DidItWork) And (D = 3) Then
   Begin
      IsNearlyPrime(Orders.Order5, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   If (Not DidItWork) And (D = 3) Then
   Begin
      IsNearlyPrime(Orders.Order6, leastsize, k, r, DidItWork);
      If DidItWork Then
      Begin
         ConstructCurveWithCMD(D, a, b);
         ConstructCurveAndPointWithGoodORder(p, k, r, D, a, b, G);
      End;
   End;
   FGIntDestroy(Orders.Order1);
   FGIntDestroy(Orders.Order2);
   If (D = 1) Or (D = 3) Then
   Begin
      FGIntDestroy(Orders.Order3);
      FGIntDestroy(Orders.Order4);
   End;
   If (D = 3) Then
   Begin
      FGIntDestroy(Orders.Order5);
      FGIntDestroy(Orders.Order6);
   End;
End;


// All you need to provide is a GInt p and a Integer leastsize which is the least
// size in bits of the basepoint order, the procedure will output a prime p, curve parameters
// a, b, k, r, and a point G such that y^2 = x^3 + a*x + b is an elliptic curve over
// GF(p) of order k*r and the point G on the EC has order r and the bitsize of r is > leastsize

Procedure FindPrimeGoodCurveAndPoint(Var p, a, b, k, r : TFGInt; leastsize : Integer; Var G : TECPoint);
Var
   DidItWork : boolean;
   n : byte;
   S : String;
Begin
   FGIntToBase2String(p, S);
   n := 4;
   If length(S) < 460 Then n := 7;
   If length(S) < 300 Then n := 13;
   If length(S) < 260 Then n := 19;
   If length(S) < 200 Then n := 29;
   If length(S) < 160 Then n := 37;
   DidItWork := false;
   While Not DidItWork Do
   Begin
      ECPrimeSearch(p, n);
      ConstructCurveAndPoint(p, leastsize, a, b, k, r, G, DidItWork);
   End;
End;


// check wether the EC y^2 = x^3 + a*x + b over GF(p) isn 't supersingular
// SS=true of the EC is supersingular

Procedure IsECSuperSingular(p, a, b : TFGInt; Var SS : boolean);
Var
   zero, temp1, temp2, temp3 : TFGInt;
Begin
   Base2StringToFGInt('0', zero);
   FGIntSquareMod(a, p, temp1);
   FGIntMulMod(temp1, a, p, temp2);
   FGIntDestroy(temp1);
   FGIntMulByIntBis(temp2, 4);
   FGIntSquareMod(b, p, temp1);
   FGIntMulByIntBis(temp1, 27);
   FGIntAddMod(temp1, temp2, p, temp3);
   If FGIntCompareAbs(temp3, zero) = Eq Then SS := true Else SS := false;
   FGIntDestroy(temp1);
   FGIntDestroy(temp2);
   FGIntDestroy(temp3);
End;

End.
