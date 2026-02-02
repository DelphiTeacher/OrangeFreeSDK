@echo off
setlocal

REM 切换到当前 bat 所在目录
cd /d %~dp0

REM 如果没有 gradle wrapper，就使用系统 gradle
REM 如果你有 gradlew.bat，可以把 gradle 换成 gradlew

echo ===============================
echo Download Huawei ScanPlus jars
echo ===============================

gradle -b download-huawei-scan.gradle copyDeps

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Gradle 执行失败，请检查环境
    pause
    exit /b 1
)

echo.
echo 下载完成，文件已保存到 libs 目录
pause
