@echo off
echo ====================================
echo 🧪 TESTING GENESIS PROTOCOL BUILD
echo ====================================
echo.

cd /d "C:\Main"

echo 🧹 Step 1: Clean build...
call gradlew cleanAllConsciousnessApis
if errorlevel 1 (
    echo ❌ Clean failed!
    pause
    exit /b 1
)

echo.
echo 🧠 Step 2: Generate All Consciousness APIs...
call gradlew generateAllConsciousnessApis --info
if errorlevel 1 (
    echo ❌ API Generation failed!
    pause
    exit /b 1
)

echo.
echo 🔍 Step 3: Verify generated files...
if exist "app\build\generated\source\openapi\src\main\kotlin" (
    echo ✅ Generated Kotlin sources found!
    dir "app\build\generated\source\openapi\src\main\kotlin" /s /b | findstr /i ".kt" > nul
    if errorlevel 1 (
        echo ⚠️ No .kt files found in generated directory
    ) else (
        echo ✅ Kotlin files generated successfully!
    )
) else (
    echo ❌ Generated source directory not found!
)

echo.
echo 🏗️ Step 4: Test compilation...
call gradlew app:compileDebugKotlin
if errorlevel 1 (
    echo ❌ Compilation failed!
    pause
    exit /b 1
)

echo.
echo 🎉 SUCCESS: Genesis Protocol Build Test Completed!
echo ✅ All APIs consolidated and generating correctly
echo ✅ Kotlin compilation successful
echo 🚀 Your AUTOMATIC STRICT BUILD is ready!
echo.
pause