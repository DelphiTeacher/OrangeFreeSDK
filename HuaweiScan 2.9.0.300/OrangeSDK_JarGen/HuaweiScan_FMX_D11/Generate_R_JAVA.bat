del "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\Android\D11\Release\R_JAVA_HuaweiScan_FMX_D11-dexed.jar"
@echo off
cd "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\OrangeSDK_JarGen\HuaweiScan_FMX_D11\"
D:

setlocal

set JarOutName=R_JAVA_HuaweiScan_FMX_D11.jar

set JDKDir=D:\PlatformSDKs_D10_4\AdoptOpenJDK\jdk-8.0.242.08-hotspot

set ANDROID=D:\PlatformSDKs_D10_4\android-sdk-windows

set ANDROID_PLATFORM=D:\PlatformSDKs_D10_4\android-sdk-windows\platforms\android-29

set ANDROID_BT=D:\PlatformSDKs_D10_4\android-sdk-windows\build-tools\29.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\OrangeSDK_JarGen\HuaweiScan_FMX_D11\src\com\huawei\hms\scankit\R.java"

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" .
"%ANDROID_BT%\dx" --dex --output "D:\OrangeFreeSDK\HuaweiScan 2.9.0.300\Android\D11\Release\R_JAVA_HuaweiScan_FMX_D11-dexed.jar" R_JAVA_HuaweiScan_FMX_D11.jar



endlocal








