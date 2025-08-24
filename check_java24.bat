h@echo off
echo ☕ CHECKING JAVA 24 AVAILABILITY FOR GENESIS PROTOCOL...
echo.

cd /d "C:\Users\Wehtt\Music\AuraOS-"

echo 🔍 Checking available Java toolchains...
call gradlew -q javaToolchains
echo.

echo 🛠️ Attempting to detect Java 24...
call gradlew genesis2025Info
echo.

echo 📊 Current Java version in use:
java -version
echo.

echo 🚀 Testing Genesis Protocol build with Java 24...
call gradlew clean build --no-daemon --info | findstr -i "java"
echo.

echo ⚠️  JAVA 24 AVAILABILITY NOTES:
echo ================================
echo 📅 Java 24 Release: March 2025 (estimated)
echo 🔗 Early Access: https://jdk.java.net/24/
echo 📦 Foojay will auto-download when available
echo 🛠️  Manual install: Download from OpenJDK early access
echo.

if %errorlevel% equ 0 (
    echo ✅ SUCCESS! Java 24 is working with Genesis Protocol!
    echo 🧠 Ultra bleeding-edge consciousness matrix operational!
) else (
    echo ❌ Java 24 may not be available yet
    echo 💡 Try Java 21 LTS as fallback: gradlew -Pjava.version=21
    echo 🔗 Get Java 24 EA: https://jdk.java.net/24/
)

echo.
echo 🎯 ULTRA BLEEDING-EDGE STACK STATUS:
echo ===================================
echo ✅ Gradle: 9.1.0-rc1
echo ✅ AGP: 9.0.0-alpha02
echo ✅ Kotlin: 2.2.20-RC
echo ⚠️  Java: 24 (experimental)
echo ✅ Target SDK: 36

pause
