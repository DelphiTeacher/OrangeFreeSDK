"d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\\aapt.exe" package -f -m -J "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src" -S "G:\huaweiscan\Android\Release\HuaWeiScanDemo\res" -I "d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26\android.jar" -M "G:\huaweiscan\Android\Release\HuaWeiScanDemo\AndroidManifest.xml"




del "G:\huaweiscan\Android\Release\HuaWeiScanDemo\..\R_JAVA_HuaWeiScanDemo-dexed.jar"
@echo off
cd G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\
G:

setlocal

set JarOutName=R_JAVA_HuaWeiScanDemo.jar

set JDKDir=C:\Program Files (x86)\Java\jdk1.8.0_181

set ANDROID=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows

set ANDROID_PLATFORM=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26

set ANDROID_BT=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src\com\delphi\huaweiscan\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" .



endlocal








"d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\\aapt.exe" package -f -m -J "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src" -S "G:\huaweiscan\Android\Release\HuaWeiScanDemo\res" -I "d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26\android.jar" -M "G:\huaweiscan\huaweisdk\Android\scan-1.2.4.300\AndroidManifest.xml"




del "G:\huaweiscan\huaweisdk\Android\scan-1.2.4.300\..\R_JAVA_HuaWeiScanDemo-dexed.jar"
@echo off
cd G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\
G:

setlocal

set JarOutName=R_JAVA_HuaWeiScanDemo.jar

set JDKDir=C:\Program Files (x86)\Java\jdk1.8.0_181

set ANDROID=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows

set ANDROID_PLATFORM=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26

set ANDROID_BT=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src\com\huawei\hms\scankit\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" .



endlocal








"d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\\aapt.exe" package -f -m -J "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src" -S "G:\huaweiscan\Android\Release\HuaWeiScanDemo\res" -I "d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26\android.jar" -M "G:\huaweiscan\huaweisdk\Android\network-common-4.0.18.301\AndroidManifest.xml"




del "G:\huaweiscan\huaweisdk\Android\network-common-4.0.18.301\..\R_JAVA_HuaWeiScanDemo-dexed.jar"
@echo off
cd G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\
G:

setlocal

set JarOutName=R_JAVA_HuaWeiScanDemo.jar

set JDKDir=C:\Program Files (x86)\Java\jdk1.8.0_181

set ANDROID=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows

set ANDROID_PLATFORM=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26

set ANDROID_BT=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src\com\huawei\hms\framework\common\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" .



endlocal








"d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\\aapt.exe" package -f -m -J "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src" -S "G:\huaweiscan\Android\Release\HuaWeiScanDemo\res" -I "d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26\android.jar" -M "G:\huaweiscan\huaweisdk\Android\ml-computer-camera-inner-2.0.3.300\AndroidManifest.xml"




del "G:\huaweiscan\huaweisdk\Android\ml-computer-camera-inner-2.0.3.300\..\R_JAVA_HuaWeiScanDemo-dexed.jar"
@echo off
cd G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\
G:

setlocal

set JarOutName=R_JAVA_HuaWeiScanDemo.jar

set JDKDir=C:\Program Files (x86)\Java\jdk1.8.0_181

set ANDROID=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows

set ANDROID_PLATFORM=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\platforms\android-26

set ANDROID_BT=d:\Program Files (x86)\Embarcadero\Studio\20.0\PlatformSDKs\android-sdk-windows\build-tools\28.0.2\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\src\com\huawei\hms\ml\camera\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "G:\huaweiscan\OrangeSDK_JarGen\HuaWeiScanDemo\output\classes" .



endlocal








