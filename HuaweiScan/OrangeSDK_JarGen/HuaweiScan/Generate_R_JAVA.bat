"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src" -S "C:\OrangeFreeSDK\HuaweiScan\Android\Release\HuaweiScan\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\ml-computer-camera-inner-1.0.3.340_aar\AndroidManifest.xml"




del "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\ml-computer-camera-inner-1.0.3.340_aar\..\R_JAVA_HuaweiScan-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\ml\camera\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" .



endlocal








"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src" -S "C:\OrangeFreeSDK\HuaweiScan\Android\Release\HuaweiScan\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\network-common-4.0.2.300_aar\AndroidManifest.xml"




del "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\network-common-4.0.2.300_aar\..\R_JAVA_HuaweiScan-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\framework\common\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" .



endlocal








"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src" -S "C:\OrangeFreeSDK\HuaweiScan\Android\Release\HuaweiScan\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\network-grs-4.0.2.300_aar\AndroidManifest.xml"




del "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\network-grs-4.0.2.300_aar\..\R_JAVA_HuaweiScan-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\framework\network\grs\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" .



endlocal








"H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\build-tools\29.0.3\\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src" -S "C:\OrangeFreeSDK\HuaweiScan\Android\Release\HuaweiScan\res" -I "H:\AndroidPlatformSDKs_D10_4_1\AndroidSDK-2525-21.0.38860.1461\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\scan-1.1.3.301_aar\AndroidManifest.xml"




del "C:\OrangeFreeSDK\HuaweiScan\HuaweiSDK\Android\scan-1.1.3.301_aar\..\R_JAVA_HuaweiScan-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan.jar

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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\src\com\huawei\hms\scankit\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan\OrangeSDK_JarGen\HuaweiScan\output\classes" .



endlocal








pause
