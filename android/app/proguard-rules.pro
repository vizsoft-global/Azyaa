# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.bouncycastle.jce.provider.BouncyCastleProvider
-dontwarn org.bouncycastle.pqc.jcajce.provider.BouncyCastlePQCProvider
-dontwarn com.fasterxml.jackson.core.**
-dontwarn com.fasterxml.jackson.databind.**
-dontwarn com.google.auto.value.**
-keep class org.xmlpull.v1.** { *; }




# branch
# Prevent ProGuard from removing Branch SDK classes
-keep class io.branch.** { *; }

# Required to collect Google Advertising ID (GAID) for attribution
-keep class com.google.android.gms.ads.identifier.** { *; }

# Optional: If you use Huawei AppGallery
-keep class com.huawei.hms.ads.identifier.** { *; }

# If you see warnings related to Firebase or Crashlytics shims during build
-dontwarn com.crashlytics.android.answers.shim.**
-dontwarn com.google.firebase.appindexing.**
