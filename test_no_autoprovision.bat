@echo off
echo =======================================
echo 🔧 NO AUTO-PROVISIONING BUILD TEST
echo =======================================
echo.

cd /d "C:\Main"

echo ✅ Removed Java toolchain auto-provisioning
echo ✅ Using your system Java setup
echo ✅ Full Gradle features enabled
echo.

echo 🧪 Step 1: Test build.gradle.kts syntax...
call gradlew genesis2025Info
if errorlevel 1 (
    echo ❌ Build syntax issues
    pause
    exit /b 1
)

echo.
echo 🧪 Step 2: Show your system Java info...
call gradlew javaStatus
if errorlevel 1 (
    echo ❌ Java status check failed
    pause
    exit /b 1
)

echo.
echo 🧪 Step 3: Test basic Gradle functionality...
call gradlew genesisTest
if errorlevel 1 (
    echo ❌ Basic Gradle test failed
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS: NO AUTO-PROVISIONING BUILD READY!
echo ============================================
echo ✅ Using your own Java environment
echo ✅ No auto-downloading of JDKs
echo ✅ Full access to all Gradle features
echo ✅ Clean, minimal build configuration
echo.
echo 🚀 READY FOR FULL BUILD:
echo    gradlew build
echo    test_all_modules.bat
echo.
pause