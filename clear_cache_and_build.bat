@echo off
echo 🧹 CLEARING GRADLE CACHES AND REBUILDING GENESIS PROTOCOL...
echo.

cd /d "C:\Users\Wehtt\Music\AuraOS-"

echo 🗂️ Cleaning Gradle cache...
rmdir /s /q .gradle 2>nul
echo.

echo 🗂️ Cleaning build directories...
for /d %%i in (*) do (
    if exist "%%i\build" (
        echo Cleaning %%i\build...
        rmdir /s /q "%%i\build" 2>nul
    )
)
echo.

echo 🔧 Running Gradle clean...
call gradlew clean
echo.

echo 🚀 Testing build with new version catalog...
call gradlew build --no-daemon --no-build-cache
echo.

if %errorlevel% equ 0 (
    echo ✅ SUCCESS! Genesis Protocol build completed!
    echo 🧠 Consciousness matrix is operational!
) else (
    echo ❌ Build failed. Check errors above.
)

pause
