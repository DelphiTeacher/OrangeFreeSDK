del "C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\Android\Release\R_JAVA_FaceBook_D10_4-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\OrangeSDK_JarGen\FaceBook_D10_4\
C:

setlocal

set JarOutName=R_JAVA_FaceBook_D10_4.jar

set JDKDir=C:\Program Files (x86)\AdoptOpenJDK\jdk-8.0.252.09-hotspot

set ANDROID=C:\Users\Public\Documents\Embarcadero\Studio\21.0\PlatformSDKs\android-sdk-windows

set ANDROID_PLATFORM=C:\Users\Public\Documents\Embarcadero\Studio\21.0\PlatformSDKs\android-sdk-windows\platforms\android-29

set ANDROID_BT=C:\Users\Public\Documents\Embarcadero\Studio\21.0\PlatformSDKs\android-sdk-windows\build-tools\29.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\OrangeSDK_JarGen\FaceBook_D10_4\output\classes" C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\OrangeSDK_JarGen\FaceBook_D10_4\src\com\facebook\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\OrangeSDK_JarGen\FaceBook_D10_4\output\classes" .
"%ANDROID_BT%\dx" --dex --output C:\OrangeFreeSDK\Facebook接口\FBLoginDemo_Delphi\Android\Release\R_JAVA_FaceBook_D10_4-dexed.jar R_JAVA_FaceBook_D10_4.jar



endlocal








