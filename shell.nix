{
  pkgs ? import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { 
    config.android_sdk.accept_license = true;
  } ,
  config ? pkgs.config
}:
let
  # Declaration of versions for everything. This is useful since these
  # versions may be used in multiple places in this Nix expression.
  android = {
    versions = {
      tools = "26.1.1";
      platformTools = "31.0.3";
      buildTools = "30.0.3";
      ndk = [
        "22.1.7171670"
        "21.3.6528147" # LTS NDK
      ];
      cmake = "3.18.1";
      emulator = "30.9.0";
    };

    platforms = ["23" "24" "25" "26" "27" "28" "29" "30"];
    abis = ["armeabi-v7a" "arm64-v8a"];
    extras = ["extras;google;gcm"];
  };

  androidEnvNixpkgs = fetchTarball {
    name = "androidenv";
    url = "https://github.com/NixOS/nixpkgs/archive/433236f6156b8ff2af09295064e4e08bbe96235c.tar.gz";
    sha256 = "1j3xw46p339zhpky94nalsc0xwdy6lfapimsd1m5f9lgxjqwjb06";
  };

  androidEnv = pkgs.callPackage "${androidEnvNixpkgs}/pkgs/development/mobile/androidenv" {
    inherit config pkgs;
    licenseAccepted = true;
  };

  androidComposition = androidEnv.composeAndroidPackages {
    toolsVersion = android.versions.tools;
    platformToolsVersion = android.versions.platformTools;
    buildToolsVersions = [android.versions.buildTools];
    platformVersions = android.platforms;
    abiVersions = android.abis;

    includeSources = true;
    includeSystemImages = true;
    includeEmulator = true;
    emulatorVersion = android.versions.emulator;

    includeNDK = true;
    ndkVersions = android.versions.ndk;
    cmakeVersions = [android.versions.cmake];

    useGoogleAPIs = true;
    includeExtras = android.extras;

    # If you want to use a custom repo JSON:
    # repoJson = ../repo.json;

    # If you want to use custom repo XMLs:
    /*repoXmls = {
      packages = [ ../xml/repository2-1.xml ];
      images = [
        ../xml/android-sys-img2-1.xml
        ../xml/android-tv-sys-img2-1.xml
        ../xml/android-wear-sys-img2-1.xml
        ../xml/android-wear-cn-sys-img2-1.xml
        ../xml/google_apis-sys-img2-1.xml
        ../xml/google_apis_playstore-sys-img2-1.xml
      ];
      addons = [ ../xml/addon2-1.xml ];
    };*/

    # Accepting more licenses declaratively:
    extraLicenses = [
      # Already accepted for you with the global accept_license = true or
      # licenseAccepted = true on androidenv.
      # "android-sdk-license"

      # These aren't, but are useful for more uncommon setups.
      "android-sdk-preview-license"
      "android-googletv-license"
      "android-sdk-arm-dbt-license"
      "google-gdk-license"
      "intel-android-extra-license"
      "intel-android-sysimage-license"
      "mips-android-sysimage-license"
    ];
  };

  androidSdk = androidComposition.androidsdk;
  platformTools = androidComposition.platform-tools;
  jdk = pkgs.jdk8;
in pkgs.mkShell {
  buildInputs = with pkgs; [
    # from pkgs
    flutter
    jdk
    niv
    #from ./nix/*
    androidSdk
    android-studio
    platformTools
    ];

  ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
  JAVA_HOME = pkgs.jdk;
  ANDROID_AVD_HOME = (toString ./.) + "/.android/avd";
}
