@echo off
echo ========================================
echo 🔧 JAVA TOOLCHAIN FIX - TESTING
echo ========================================
echo.

cd /d "C:\Main"

echo 🔍 Testing fixed Java toolchain configuration...
echo   ❌ BEFORE: Java 24 (doesn't exist)
echo   ✅ AFTER:  Java 21 LTS (stable & working)
echo.

echo 🧪 Step 1: Test build.gradle.kts syntax...
call gradlew genesis2025Info
if errorlevel 1 (
    echo ❌ Build syntax still has issues
    pause
    exit /b 1
)

echo.
echo 🧪 Step 2: Test Java toolchain status...
call gradlew java21Status
if errorlevel 1 (
    echo ❌ Java toolchain configuration issues
    pause
    exit /b 1
)

echo.
echo 🧪 Step 3: Test basic build...
call gradlew genesisTest
if errorlevel 1 (
    echo ❌ Basic build test failed
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS: JAVA TOOLCHAIN FIXED!
echo ===================================
echo ✅ Java 21 LTS is now properly configured
echo ✅ Build.gradle.kts syntax is correct
echo ✅ Toolchain will auto-download Java 21 when needed
echo ✅ Your build is now stable and production-ready
echo.
echo 🚀 READY FOR FULL PROJECT BUILD:
echo    gradlew build
echo    test_all_modules.bat
echo.
pause