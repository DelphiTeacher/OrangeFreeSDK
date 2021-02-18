del "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\Android\Release\R_JAVA_TestDVMediaSelector-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\
C:

setlocal

set JarOutName=R_JAVA_TestDVMediaSelector.jar

set JDKDir=C:\PlatformSDKs_10_2_3\AdoptOpenJDK\jdk-8.0.242.08-hotspot

set ANDROID=C:\PlatformSDKs_10_2_3\android_sdk_windows

set ANDROID_PLATFORM=C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\

set ANDROID_BT=C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\coordinatorlayout\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\compat\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\mediacompat\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\v7\appcompat\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\v7\recyclerview\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\cn\bingoogolapple\qrcode\core\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\cn\bingoogolapple\qrcode\zbar\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\src\com\devil\library\media\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .
"%ANDROID_BT%\dx" --dex --output C:\OrangeFreeSDK\AndroidÕº∆¨ ”∆µ—°‘Ò∆˜DVMediaSelector_V1_0_0\Android\Release\R_JAVA_TestDVMediaSelector-dexed.jar R_JAVA_TestDVMediaSelector.jar



endlocal








