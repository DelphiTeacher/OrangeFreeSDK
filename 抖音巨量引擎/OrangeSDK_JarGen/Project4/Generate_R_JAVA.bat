del "C:\OrangeFreeSDK\巨量引擎\Android\Release\R_JAVA_Project4-dexed.jar"
@echo off
cd "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\"
C:

setlocal

set JarOutName=R_JAVA_Project4.jar

set JDKDir=C:\Program Files\Eclipse Adoptium\jdk-11.0.15.10-hotspot

set ANDROID=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937

set ANDROID_PLATFORM=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\platforms\android-29

set ANDROID_BT=C:\Users\Public\Documents\Embarcadero\Studio\22.0\CatalogRepository\AndroidSDK-2525-22.0.46141.0937\build-tools\29.0.2\

set DX_LIB=%ANDROID_BT%\lib

set PROJ_DIR=%CD%

set VERBOSE=0

mkdir output 2> nul

mkdir output\classes 2> nul

if x%VERBOSE% == x1 SET VERBOSE_FLAG=-verbose

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\com\bytedance\frameworks\encryptor\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\com\bytedance\applog\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\v7\appcompat\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\v7\recyclerview\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\compat\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\coordinatorlayout\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\mediacompat\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\constraint\R.java"

"%JDKDir%\bin\javac" %VERBOSE_FLAG% -g -source 1.6 -target 1.6 -encoding UTF-8 -Xlint:deprecation -cp  ""  -d "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\src\android\support\compat\R.java"

if x%VERBOSE% == x1 SET VERBOSE_FLAG=v

"%JDKDir%\bin\jar" c%VERBOSE_FLAG%f %JarOutName% -C "C:\OrangeFreeSDK\巨量引擎\OrangeSDK_JarGen\Project4\output\classes" .
"%ANDROID_BT%\dx" --dex --output "C:\OrangeFreeSDK\巨量引擎\Android\Release\R_JAVA_Project4-dexed.jar" R_JAVA_Project4.jar



endlocal








