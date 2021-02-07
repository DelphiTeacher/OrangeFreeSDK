"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Support_V4\coordinatorlayout-28.0.0_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\coordinatorlayout\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Support_V4\support-compat-28.0.0_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\compat\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Support_V4\support-media-compat-28.0.0_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\mediacompat\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Compat_V7\appcompat-v7-28.0.0_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\v7\appcompat\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Compat_V7\recyclerview-v7-28.0.0_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\android\support\v7\recyclerview\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\BGAQRCodeSDK\qrcodecore\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\cn\bingoogolapple\qrcode\core\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\BGAQRCodeSDK\zbar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\cn\bingoogolapple\qrcode\zbar\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








"C:\PlatformSDKs_10_2_3\android_sdk_windows\build-tools\29.0.3\aapt.exe" package -f -m -J "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src" -S "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\Android\Release\TestDVMediaSelector\res" -I "C:\PlatformSDKs_10_2_3\android_sdk_windows\platforms\android-29\\android.jar" -M "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\DVMediaSelectorSDK_V1_1_3\jetified-DVMediaSelector-1.1.3_aar\AndroidManifest.xml"
@echo off
cd C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\
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

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\src\com\devil\library\media\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector_V1_1_3\OrangeSDK_JarGen\TestDVMediaSelector\output\classes" .



endlocal








pause
