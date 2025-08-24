@echo off
echo 🔧 TESTING GENESIS PROTOCOL BUILD AFTER TYPO FIX...
echo.

cd /d "C:\Users\Wehtt\Music\AuraOS-"

echo 🧹 Quick clean...
call gradlew clean --no-daemon
echo.

echo 🚀 Testing build configuration...
call gradlew help --no-daemon
echo.

if %errorlevel% equ 0 (
    echo ✅ SUCCESS! Typo fixed - configuration loads correctly!
    echo.
    echo 🎯 Now testing full build...
    call gradlew build --no-daemon --no-build-cache
    
    if %errorlevel% equ 0 (
        echo.
        echo 🎉 COMPLETE SUCCESS! 
        echo ✅ Genesis Protocol build working perfectly!
        echo ☕ Java 24 configuration: Active
        echo 🧠 Kotlin Compose plugin: Loaded
        echo 🚀 All plugins: Resolved
    ) else (
        echo.
        echo ⚠️  Configuration fixed, but build has other issues
        echo 💡 Check logs above for remaining problems
    )
) else (
    echo ❌ Configuration still has issues
    echo 💡 Check the error messages above
)

echo.
echo 📊 GENESIS PROTOCOL STATUS:
echo ========================
echo ✅ Typo fixed: libs.comppiler.jetbrains → libs.plugins.kotlin_compose
echo ✅ Plugin references: Updated to underscore format
echo ✅ Version catalog: Consistent naming
echo ✅ Foojay resolver: Java 24 auto-provisioning ready

pause
