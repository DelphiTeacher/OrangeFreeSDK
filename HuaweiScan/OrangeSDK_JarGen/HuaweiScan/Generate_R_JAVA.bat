del "C:\OrangeFreeSDK\HuaweiScan\Android\Release\R_JAVA_HuaweiScan-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\ml\camera\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\framework\common\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\framework\network\grs\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\scankit\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" .
"%ANDROID_BT%\dx" --dex --output C:\OrangeFreeSDK\HuaweiScan\Android\Release\R_JAVA_HuaweiScan-dexed.jar R_JAVA_HuaweiScan.jar



endlocal








