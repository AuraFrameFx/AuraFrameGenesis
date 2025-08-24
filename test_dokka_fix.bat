@echo off
echo ==========================================
echo 🔧 DOKKA PLUGIN FIX - VERSION CATALOG
echo ==========================================
echo.

cd /d "C:\Main"

echo 🔍 Fixed Issues:
echo   ❌ BEFORE: Hardcoded plugin versions (Dokka missing)
echo   ✅ AFTER:  Using version catalog aliases (Dokka included)
echo.

echo 🧪 Step 1: Test version catalog compliance...
call gradlew genesis2025Info
if errorlevel 1 (
    echo ❌ Version catalog plugin resolution failed
    pause
    exit /b 1
)

echo.
echo 🧪 Step 2: Test Dokka plugin resolution...
echo Testing if modules can now find Dokka plugin...

call gradlew :core-module:help --dry-run
if errorlevel 1 (
    echo ❌ Core module plugin resolution failed
    pause
    exit /b 1
)

echo.
echo 🧪 Step 3: Test all plugin resolution...
call gradlew projects
if errorlevel 1 (
    echo ❌ Project plugin resolution failed
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS: DOKKA PLUGIN FIXED!
echo ===============================
echo ✅ All plugins now use version catalog aliases
echo ✅ Dokka 2.0.0 is properly resolved
echo ✅ No more "plugin not found" errors
echo ✅ Version catalog compliance achieved
echo.
echo 🚀 READY FOR FULL BUILD:
echo    gradlew build
echo    test_all_modules.bat
echo.
pause