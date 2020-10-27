"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\src" -S "C:\OrangeFreeSDK\电子称重\Android\Release\TestEScale\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\电子称重\Android\Release\TestEScale\AndroidManifest.xml"




del "C:\OrangeFreeSDK\电子称重\Android\Release\TestEScale\..\R_JAVA_TestEScale-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\
C:

setlocal

set JarOutName=R_JAVA_TestEScale.jar

set JDKDir=H:\AndroidPlatformSDKs_D10_4_1\AdoptOpenJDK\jdk-8.0.242.08-hotspot

set ANDROID=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461

set ANDROID_PLATFORM=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\

set ANDROID_BT=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\output\classes" C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\src\com\embarcadero\TestEScale\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\output\classes" .



endlocal








"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\src" -S "C:\OrangeFreeSDK\电子称重\Android\Release\TestEScale\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\电子称重\EScaleSDK\tsscale_aar\AndroidManifest.xml"




del "C:\OrangeFreeSDK\电子称重\EScaleSDK\tsscale_aar\..\R_JAVA_TestEScale-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\
C:

setlocal

set JarOutName=R_JAVA_TestEScale.jar

set JDKDir=H:\AndroidPlatformSDKs_D10_4_1\AdoptOpenJDK\jdk-8.0.242.08-hotspot

set ANDROID=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461

set ANDROID_PLATFORM=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\

set ANDROID_BT=H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\output\classes" C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\src\com\tscale\tsscale\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\电子称重\OrangeSDK_JarGen\TestEScale\output\classes" .



endlocal








pause
