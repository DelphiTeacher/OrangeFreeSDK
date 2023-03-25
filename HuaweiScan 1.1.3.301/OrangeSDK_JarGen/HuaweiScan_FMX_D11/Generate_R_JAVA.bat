del "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\Android\D11\Release\R_JAVA_HuaweiScan_FMX_D11-dexed.jar"
@echo off
cd C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\
C:

setlocal

set JarOutName=R_JAVA_HuaweiScan_FMX_D11.jar

set JDKDir=C:\Program Files\Eclipse Adoptium\jdk-11.0.15.10-hotspot

set ANDROID=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937

set ANDROID_PLATFORM=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\platforms\android-32

set ANDROID_BT=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\build-tools\32.0.0\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\src\com\huawei\hms\ml\camera\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\src\com\huawei\hms\framework\common\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\src\com\huawei\hms\framework\network\grs\R.java

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\src\com\huawei\hms\scankit\R.java

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\OrangeSDK_JarGen\HuaweiScan_FMX_D11\output\classes" .
"%ANDROID_BT%\dx" --dex --output C:\OrangeFreeSDK\HuaweiScan 1.1.3.301\Android\D11\Release\R_JAVA_HuaweiScan_FMX_D11-dexed.jar R_JAVA_HuaweiScan_FMX_D11.jar



endlocal








