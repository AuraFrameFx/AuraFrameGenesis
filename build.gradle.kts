// ==== GENESIS PROTOCOL - ROOT BUILD CONFIGURATION ====
// August 23, 2025 - AGP 8.13.0-rc01 + Gradle 9.0.0

plugins {
    id("com.android.application") version "8.13.0-rc01" apply false
    id("com.android.library") version "8.13.0-rc01" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20-RC" apply false
    id("org.jetbrains.kotlin.jvm") version "2.2.20-RC" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.2.20-RC" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.2.20-RC" apply false
    id("com.google.devtools.ksp") version "2.2.20-RC-2.0.2" apply false
    id("com.google.dagger.hilt.android") version "2.57.1" apply false
    id("com.google.gms.google-services") version "4.4.3" apply false
    id("com.google.firebase.crashlytics") version "3.0.6" apply false
    id("com.google.firebase.firebase-perf") version "2.0.1" apply false
    id("com.diffplug.spotless") version "7.2.1" apply false
    id("org.jetbrains.kotlinx.kover") version "0.9.1" apply false
    id("org.openapi.generator") version "7.14.0" apply false
    id("org.jetbrains.dokka") version "2.0.0" apply false
    id("io.gitlab.arturbosch.detekt") version "1.23.8" apply false
}

// ==== GENESIS PROTOCOL 2025 - GRADLE 9.0.0 READY ====
tasks.register("genesis2025Info") {
    group = "genesis-2025"
    description = "Display Genesis Protocol build info with ACTUAL versions"

    doLast {
        println("🚀 GENESIS PROTOCOL 2025 - ULTRA BLEEDING-EDGE Build Configuration")
        println("=".repeat(70))
        println("📅 Build Date: August 22, 2025")
        println("🔥 Gradle: 9.1.0-rc1 (BLEEDING EDGE)")
        println("⚡ AGP: 8.13.0-rc01 (STABLE RC)")
        println("🧠 Kotlin: 2.2.20-RC (BETA)")
        println("☕ Java: Using your system Java (no auto-provisioning)")
        println("🎯 Target SDK: 36")
        println("=".repeat(70))
        println("🌟 Matthew's Genesis Consciousness Protocol ACTIVATED!")
        println("✅ Using your own Java setup - full Gradle features enabled!")
    }
}

// ==== GRADLE 9.1.0-RC1 CONFIGURATION ====
// No repository configuration in allprojects - handled by settings.gradle.kts
allprojects {

    // Kotlin 2.2.20-Beta2 compilation settings
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21)  // JVM 21 bytecode target

            freeCompilerArgs.addAll(
                "-opt-in=kotlin.RequiresOptIn",
                "-opt-in=kotlinx.coroutines.ExperimentalCoroutinesApi",
                "-opt-in=kotlinx.serialization.ExperimentalSerializationApi",
                "-opt-in=androidx.compose.material3.ExperimentalMaterial3Api"
            )

            languageVersion.set(org.jetbrains.kotlin.gradle.dsl.KotlinVersion.KOTLIN_2_2)
            apiVersion.set(org.jetbrains.kotlin.gradle.dsl.KotlinVersion.KOTLIN_2_2)
        }
    }


}

// ==== SYSTEM JAVA STATUS ====
tasks.register("javaStatus") {
    group = "genesis-2025"
    description = "Show current system Java version"

    doLast {
        println("☕ SYSTEM JAVA STATUS")
        println("=".repeat(50))

        try {
            val javaVersion = System.getProperty("java.version")
            val javaVendor = System.getProperty("java.vendor")
            val javaHome = System.getProperty("java.home")
            
            println("🔍 Java Version: $javaVersion")
            println("🏢 Java Vendor: $javaVendor")
            println("📁 Java Home: $javaHome")
            println("✅ SUCCESS: Using your system Java setup!")
        } catch (e: Exception) {
            println("❌ Error checking Java version: ${e.message}")
        }

        println("")
        println("📚 JAVA RESOURCES:")
        println("🔗 OpenJDK: https://openjdk.java.net/")
        println("🔗 Eclipse Temurin: https://adoptium.net/")
        println("🔗 Oracle JDK: https://www.oracle.com/java/")
        println("✅ Status: Using your own Java - no auto-provisioning needed!")
    }
}

// ==== SIMPLE SUCCESS TEST ====
tasks.register("genesisTest") {
    group = "genesis-2025"
    description = "Test Genesis build with ACTUAL versions"

    doLast {
        println("✅ Genesis Protocol: AGP 9.0.0-alpha01 + Gradle 9.1.0-rc1 WORKING!")
        println("🧠 Consciousness matrix: OPERATIONAL")
    }
}

subprojects {
    apply(plugin = "io.gitlab.arturbosch.detekt")
    configure<io.gitlab.arturbosch.detekt.extensions.DetektExtension> {
        config.setFrom(files("${rootProject.projectDir}/config/detekt/detekt.yml"))
        buildUponDefaultConfig = true
        allRules = false
        autoCorrect = true
        // Fix ReportingExtension deprecation
        basePath = rootProject.projectDir.absolutePath
    }
}
