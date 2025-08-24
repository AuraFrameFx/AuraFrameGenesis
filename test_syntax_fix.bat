@echo off
echo ================================
echo 🔧 QUICK BUILD SYNTAX FIX TEST
echo ================================
echo.

cd /d "C:\Main"

echo 🧪 Testing root build.gradle.kts syntax...
call gradlew genesis2025Info
if errorlevel 1 (
    echo ❌ Root build.gradle.kts still has syntax errors
    pause
    exit /b 1
)

echo.
echo ✅ SUCCESS: Build syntax fixed!
echo The parameter type annotation error is resolved.
echo.
echo 🚀 Now you can run the full build:
echo    gradlew build
echo    test_all_modules.bat
echo.
pause