del "C:\OrangeFreeSDK\腾讯优量汇广告\Android\Release\R_JAVA_TencentUnionAdSDK_FMX_D11-dexed.jar"
@echo off
cd "C:\OrangeFreeSDK\腾讯优量汇广告\OrangeSDK_JarGen\TencentUnionAdSDK_FMX_D11\"
C:

setlocal

set JarOutName=R_JAVA_TencentUnionAdSDK_FMX_D11.jar

set JDKDir=C:\Program Files\Eclipse Adoptium\jdk-11.0.15.10-hotspot

set ANDROID=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937

set ANDROID_PLATFORM=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\platforms\android-28

set ANDROID_BT=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\build-tools\28.0.3\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\腾讯优量汇广告\OrangeSDK_JarGen\TencentUnionAdSDK_FMX_D11\output\classes" "C:\OrangeFreeSDK\腾讯优量汇广告\OrangeSDK_JarGen\TencentUnionAdSDK_FMX_D11\src\com\qq\e\R.java"

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\腾讯优量汇广告\OrangeSDK_JarGen\TencentUnionAdSDK_FMX_D11\output\classes" .
"%ANDROID_BT%\dx" --dex --output "C:\OrangeFreeSDK\腾讯优量汇广告\Android\Release\R_JAVA_TencentUnionAdSDK_FMX_D11-dexed.jar" R_JAVA_TencentUnionAdSDK_FMX_D11.jar



endlocal








