@echo off
echo 🔍 CHECKING GENESIS PROTOCOL JAVA TOOLCHAINS...
echo.

cd /d "C:\Users\Wehtt\Music\AuraOS-"

echo 🛠️ Available Java toolchains:
call gradlew -q javaToolchains
echo.

echo ☕ Java version being used:
call gradlew -q :app:dependencies --configuration runtimeClasspath | findstr "java"
echo.

echo 🧠 Genesis Protocol toolchain info:
call gradlew genesis2025Info
echo.

pause
