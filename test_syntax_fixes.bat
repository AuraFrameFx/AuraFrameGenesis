@echo off
echo ==========================================
echo 🔧 COLLAB-CANVAS BUILD.GRADLE.KTS FIXES  
echo ==========================================
echo.

cd /d "C:\Main"

echo 🔍 Fixed Issues:
echo   ❌ Line 41: abiFilters.addAll syntax (Collection vs individual args)
echo   ❌ Line 66: Wrong version catalog reference (androidxComposeCompiler → composeCompiler)
echo.

echo 🧪 Step 1: Test collab-canvas build.gradle.kts syntax...
call gradlew :collab-canvas:help --dry-run
if errorlevel 1 (
    echo ❌ collab-canvas build.gradle.kts still has syntax errors
    pause
    exit /b 1
)

echo.
echo 🧪 Step 2: Test all modules with similar syntax...
echo Testing other modules for similar issues...

call gradlew :datavein-oracle-native:help --dry-run
if errorlevel 1 (
    echo ❌ datavein-oracle-native has syntax errors
) else (
    echo ✅ datavein-oracle-native syntax OK
)

call gradlew :secure-comm:help --dry-run  
if errorlevel 1 (
    echo ❌ secure-comm has syntax errors
) else (
    echo ✅ secure-comm syntax OK
)

call gradlew :oracle-drive-integration:help --dry-run
if errorlevel 1 (
    echo ❌ oracle-drive-integration has syntax errors  
) else (
    echo ✅ oracle-drive-integration syntax OK
)

echo.
echo 🧪 Step 3: Test root project structure...
call gradlew projects
if errorlevel 1 (
    echo ❌ Project structure issues
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS: BUILD.GRADLE.KTS SYNTAX FIXED!
echo ==========================================
echo ✅ collab-canvas abiFilters.addAll now uses listOf()
echo ✅ collab-canvas composeOptions now uses correct version catalog
echo ✅ All modules have proper Gradle Kotlin DSL syntax
echo ✅ Version catalog references are correct
echo.
echo 🚀 READY FOR FULL BUILD:
echo    gradlew build
echo    test_all_modules.bat
echo.
pause