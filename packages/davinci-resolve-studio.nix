{
  stdenv,
  lib,
  cacert,
  curl,
  runCommandLocal,
  unzip,
  appimageTools,
  addDriverRunpath,
  dbus,
  libGLU,
  xkeyboard-config,
  libxcb-util,
  libxcb-wm,
  libxcb-render-util,
  libxcb-keysyms,
  libxcb-image,
  libxxf86vm,
  libxt,
  libxtst,
  libxrender,
  libxrandr,
  libxi,
  libxinerama,
  libxfixes,
  libxext,
  libxdamage,
  libxcursor,
  libxcomposite,
  libx11,
  libsm,
  libice,
  libxcb,
  buildFHSEnv,
  bash,
  writeText,
  writeShellScript,
  ocl-icd,
  xkeyboard_config,
  glib,
  libarchive,
  libxcrypt,
  python3,
  aprutil,
  makeDesktopItem,
  copyDesktopItems,
  jq,

  common-updater-scripts,
  writeShellApplication,
}:

# Davinci Resolve Studio Cracked.
# Based off this thread: https://www.reddit.com/r/LinuxCrackSupport/comments/1nfqhld/davinci_resolve_studio_202_fix_linux_crack_guide/
# Keep up to date with nixpkgs upstream https://github.com/NixOS/nixpkgs/blob/dfe0a400bbb39c1e378844230d8319601b52115a/pkgs/by-name/da/davinci-resolve/package.nix

let
  davinci = (
    stdenv.mkDerivation rec {
      pname = "davinci-resolve-studio";
      version = "21.0.1";

      nativeBuildInputs = [
        appimageTools.appimage-exec
        addDriverRunpath
        copyDesktopItems
        unzip
      ];

      buildInputs = [
        libGLU
        libxxf86vm
      ];

      # Automatically complete Black Magic form to fetch latest zip
      src =
        runCommandLocal "${pname}-src.zip"
          rec {
            outputHashMode = "recursive";
            outputHashAlgo = "sha256";
            outputHash = "sha256-8JN3ptd8jcacxHihZHXuhdkyambUsnFIj+AruvpztKI="; # update with new releases

            impureEnvVars = lib.fetchers.proxyImpureEnvVars;

            nativeBuildInputs = [
              curl
              jq
            ];

            # ENV VARS
            SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

            # Get linux.downloadId from HTTP response on https://www.blackmagicdesign.com/products/davinciresolve
            REFERID = "263d62f31cbb49e0868005059abcb0c9";
            DOWNLOADSURL = "https://www.blackmagicdesign.com/api/support/us/downloads.json";
            SITEURL = "https://www.blackmagicdesign.com/api/register/us/download";
            PRODUCT = "DaVinci Resolve Studio";
            VERSION = version;

            USERAGENT = builtins.concatStringsSep " " [
              "User-Agent: Mozilla/5.0 (X11; Linux ${stdenv.hostPlatform.linuxArch})"
              "AppleWebKit/537.36 (KHTML, like Gecko)"
              "Chrome/77.0.3865.75"
              "Safari/537.36"
            ];

            REQJSON = builtins.toJSON {
              "firstname" = "NixOS";
              "lastname" = "Linux";
              "email" = "someone@nixos.org";
              "phone" = "+31 71 452 5670";
              "country" = "nl";
              "street" = "-";
              "state" = "Province of Utrecht";
              "city" = "Utrecht";
              "product" = PRODUCT;
            };

          }
          ''
            DOWNLOADID=$(
              curl --silent --compressed "$DOWNLOADSURL" \
                | jq --raw-output '.downloads[] | .urls.Linux?[]? | select(.downloadTitle | test("^'"$PRODUCT $VERSION"'( Update)?$")) | .downloadId'
            )
            echo "downloadid is $DOWNLOADID"
            test -n "$DOWNLOADID"
            RESOLVEURL=$(curl \
              --silent \
              --header 'Host: www.blackmagicdesign.com' \
              --header 'Accept: application/json, text/plain, */*' \
              --header 'Origin: https://www.blackmagicdesign.com' \
              --header "$USERAGENT" \
              --header 'Content-Type: application/json;charset=UTF-8' \
              --header "Referer: https://www.blackmagicdesign.com/support/download/$REFERID/Linux" \
              --header 'Accept-Encoding: gzip, deflate, br' \
              --header 'Accept-Language: en-US,en;q=0.9' \
              --header 'Authority: www.blackmagicdesign.com' \
              --header 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294' \
              --data-ascii "$REQJSON" \
              --compressed \
              "$SITEURL/$DOWNLOADID")
            echo "resolveurl is $RESOLVEURL"

            curl \
              --retry 3 --retry-delay 3 \
              --header "Upgrade-Insecure-Requests: 1" \
              --header "$USERAGENT" \
              --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" \
              --header "Accept-Language: en-US,en;q=0.9" \
              --compressed \
              "$RESOLVEURL" \
              > $out
          '';

      # The unpack phase won't generate a directory
      sourceRoot = ".";

      installPhase =
        let
          appimageName = "DaVinci_Resolve_Studio_${version}_Linux.run";
        in
        ''
          runHook preInstall

          export HOME=$PWD/home
          mkdir -p $HOME

          mkdir -p $out
          test -e ${lib.escapeShellArg appimageName}
          appimage-exec.sh -x $out ${lib.escapeShellArg appimageName}

          mkdir -p $out/{"Apple Immersive/Calibration",configs,DolbyVision,easyDCP,Extras,Fairlight,GPUCache,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}

          # Install udev rules for Blackmagic hardware (color panels, Speed Editor, Editor Keyboard)
          mkdir -p $out/lib/udev/rules.d
          cp $out/share/etc/udev/rules.d/99-BlackmagicDevices.rules $out/lib/udev/rules.d/
          cp $out/share/etc/udev/rules.d/99-ResolveKeyboardHID.rules $out/lib/udev/rules.d/
          # Generate catch-all rules for Blackmagic Design vendor ID (096e)
          # USB device access (color panels, general hardware)
          echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' \
            > $out/lib/udev/rules.d/99-DavinciPanel.rules
          # hidraw access (Speed Editor jog wheel, Editor Keyboard, future HID devices)
          echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="096e", MODE="0666"' \
            >> $out/lib/udev/rules.d/99-DavinciPanel.rules

          # Verify all three rules files are present
          test -f $out/lib/udev/rules.d/99-BlackmagicDevices.rules
          test -f $out/lib/udev/rules.d/99-ResolveKeyboardHID.rules
          test -f $out/lib/udev/rules.d/99-DavinciPanel.rules
          runHook postInstall
        '';

      dontStrip = true;

      postFixup = ''
        for program in $out/bin/*; do
          isELF "$program" || continue
          addDriverRunpath "$program"
        done

        for program in $out/libs/*; do
          isELF "$program" || continue
          if [[ "$program" != *"libcudnn_cnn_infer"* ]];then
            echo $program
            addDriverRunpath "$program"
          fi
        done
        ln -s $out/libs/libcrypto.so.1.1 $out/libs/libcrypt.so.1
      '';

      desktopItems = [
        (makeDesktopItem {
          name = "davinci-resolve-studio";
          desktopName = "Davinci Resolve Studio";
          genericName = "Video Editor";
          exec = "davinci-resolve-studio";
          icon = "davinci-resolve-studio";
          comment = "Professional video editing, color, effects and audio post-processing";
          categories = [
            "AudioVideo"
            "AudioVideoEditing"
            "Video"
            "Graphics"
          ];
          startupWMClass = "resolve";
        })
        (makeDesktopItem {
          name = "blackmagicraw-player";
          desktopName = "Blackmagic RAW Player";
          exec = "blackmagicraw-player %f";
          icon = "blackmagicraw-player";
          mimeTypes = [
            "application/x-braw-clip"
            "application/x-braw-sidecar"
          ];
          categories = [
            "Video"
            "AudioVideo"
          ];
        })
        (makeDesktopItem {
          name = "blackmagicraw-speedtest";
          desktopName = "Blackmagic RAW Speed Test";
          exec = "blackmagicraw-speedtest";
          icon = "blackmagicraw-speedtest";
          categories = [
            "Video"
            "AudioVideo"
          ];
        })
        (makeDesktopItem {
          name = "davinci-control-panels-setup";
          desktopName = "DaVinci Control Panels Setup";
          exec = "davinci-control-panels-setup";
          icon = "davinci-control-panels-setup";
          categories = [ "Settings" ];
        })
        (makeDesktopItem {
          name = "davinci-fairlight-studio-utility";
          desktopName = "Fairlight Studio Utility";
          exec = "davinci-fairlight-studio-utility";
          icon = "davinci-resolve-studio";
          categories = [
            "AudioVideo"
            "Audio"
          ];
        })
        (makeDesktopItem {
          name = "davinci-remote-monitor";
          desktopName = "DaVinci Remote Monitor";
          exec = "davinci-remote-monitor";
          icon = "davinci-remote-monitor";
          comment = "DaVinci Remote Monitor";
          categories = [
            "AudioVideo"
            "Video"
          ];
        })
      ];
    }
  );
in
buildFHSEnv {
  inherit (davinci) pname version;

  targetPkgs =
    pkgs: with pkgs; [
      alsa-lib
      aprutil
      bzip2
      davinci
      dbus
      expat
      fontconfig
      freetype
      glib
      libGL
      libGLU
      libarchive
      libcap
      librsvg
      libtool
      libuuid
      libxcrypt # provides libcrypt.so.1
      libxkbcommon
      nspr
      ocl-icd
      opencl-headers
      python3
      python3.pkgs.numpy
      libdrm # libdrm.so.2 needed by bundled Qt6 WebEngine (Control Panels Setup)
      libxkbfile # libxkbfile.so.1 needed by bundled Qt6 WebEngine (Control Panels Setup)
      krb5 # libgssapi_krb5.so.2 needed by bundled Qt6 (Control Panels Setup, Fairlight Studio Utility)
      nss # libsmime3.so needed by bundled Qt6 (Control Panels Setup)
      libxcb-cursor # libxcb-cursor.so needed by Qt6 xcb platform plugin (Fairlight Studio Utility)
      udev
      xdg-utils # xdg-open needed to open URLs
      libice
      libsm
      libx11
      libxcomposite
      libxcursor
      libxdamage
      libxext
      libxfixes
      libxi
      libxinerama
      libxrandr
      libxrender
      libxt
      libxtst
      libxxf86vm
      libxcb
      libxcb-util
      libxcb-image
      libxcb-keysyms
      libxcb-render-util
      libxcb-wm
      xkeyboard-config
      zlib
    ];

  extraPreBwrapCmds = ''
    mkdir -p ~/.local/share/DaVinciResolve/license || exit 1
    mkdir -p ~/.local/share/DaVinciResolve/Extras || exit 1
  '';

  extraBwrapArgs = [
    ''--bind "$HOME"/.local/share/DaVinciResolve/license ${davinci}/.license''
    ''--bind "$HOME"/.local/share/DaVinciResolve/Extras ${davinci}/Extras''
  ];

  runScript = "${bash}/bin/bash ${writeText "davinci-wrapper" ''
    export QT_QPA_PLATFORM=xcb
    export QT_XKB_CONFIG_ROOT="${xkeyboard_config}/share/X11/xkb"
    export QT_PLUGIN_PATH="${davinci}/libs/plugins:$QT_PLUGIN_PATH"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib32:${davinci}/libs
    if [ $# -gt 0 ]; then
      exec "$@"
    else
      exec ${davinci}/bin/resolve
    fi
  ''}";

  extraInstallCommands =
    let
      execName = "davinci-resolve-studio";
      # Each wrapper re-enters the FHS environment and execs a different binary
      mkWrapper =
        name: bin:
        writeShellScript name ''
          exec "$(dirname "$0")/${execName}" ${bin} "$@"
        '';
      wrappers = {
        "blackmagicraw-player" = "${davinci}/BlackmagicRAWPlayer/BlackmagicRAWPlayer";
        "blackmagicraw-speedtest" = "${davinci}/BlackmagicRAWSpeedTest/BlackmagicRAWSpeedTest";
        "davinci-control-panels-setup" =
          ''"${davinci}/DaVinci Control Panels Setup/DaVinci Control Panels Setup"'';
        "davinci-fairlight-studio-utility" =
          ''"${davinci}/Fairlight Studio Utility/Fairlight Studio Utility"'';
        "davinci-remote-monitor" = ''"${davinci}/bin/DaVinci Remote Monitor"'';
      };
    in
    ''
      # Desktop files
      mkdir -p $out/share/applications
      ln -s ${davinci}/share/applications/*.desktop $out/share/applications/

      # Icons
      mkdir -p $out/share/icons/hicolor/{128x128,256x256}/apps
      ln -s ${davinci}/graphics/DV_Resolve.png $out/share/icons/hicolor/128x128/apps/davinci-resolve-studio.png
      ln -s ${davinci}/graphics/DV_Panels.png $out/share/icons/hicolor/128x128/apps/davinci-control-panels-setup.png
      ln -s ${davinci}/graphics/Remote_Monitoring.png $out/share/icons/hicolor/128x128/apps/davinci-remote-monitor.png
      ln -s ${davinci}/graphics/blackmagicraw-player_256x256_apps.png $out/share/icons/hicolor/256x256/apps/blackmagicraw-player.png
      ln -s ${davinci}/graphics/blackmagicraw-speedtest_256x256_apps.png $out/share/icons/hicolor/256x256/apps/blackmagicraw-speedtest.png

      # Wrapper scripts for additional programs
      ${lib.concatStringsSep "\n" (
        lib.mapAttrsToList (name: bin: ''
          ln -s ${mkWrapper name bin} $out/bin/${name}
        '') wrappers
      )}

      # MIME type definitions for .drp, .braw, etc.
      mkdir -p $out/share/mime/packages
      ln -s ${davinci}/share/resolve.xml $out/share/mime/packages/
      ln -s ${davinci}/share/blackmagicraw.xml $out/share/mime/packages/

      # Expose udev rules so NixOS can aggregate them from environment.systemPackages
      mkdir -p $out/lib/udev/rules.d
      ln -s ${davinci}/lib/udev/rules.d/99-BlackmagicDevices.rules $out/lib/udev/rules.d/
      ln -s ${davinci}/lib/udev/rules.d/99-ResolveKeyboardHID.rules $out/lib/udev/rules.d/
      ln -s ${davinci}/lib/udev/rules.d/99-DavinciPanel.rules $out/lib/udev/rules.d/
    '';

  passthru = {
    inherit davinci;
  };

  meta = {
    description = "Professional video editing, color, effects and audio post-processing";
    homepage = "https://www.blackmagicdesign.com/products/davinciresolve";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    mainProgram = "davinci-resolve-studio";
  };
}
