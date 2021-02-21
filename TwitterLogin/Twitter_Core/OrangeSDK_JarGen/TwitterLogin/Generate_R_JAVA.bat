del "C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\Android\Release\R_JAVA_TwitterLogin-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\OrangeSDK_JarGen\TwitterLogin\
C:

setlocal

set JarOutName=R_JAVA_TwitterLogin.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\OrangeSDK_JarGen\TwitterLogin\output\classes" C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\OrangeSDK_JarGen\TwitterLogin\src\com\twitter\sdk\android\core\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\OrangeSDK_JarGen\TwitterLogin\output\classes" .
"%ANDROID_BT%\dx" --dex --output C:\OrangeFreeSDK\TwitterLogin\Twitter_Core\Android\Release\R_JAVA_TwitterLogin-dexed.jar R_JAVA_TwitterLogin.jar



endlocal








