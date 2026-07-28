{
  pkgs,
  ...
}:

{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri.override {
    libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
      version = "0.3.0";
      src = pkgs.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "emersion";
        repo = "libdisplay-info";
        rev = finalAttrs.version;
        sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
      };
    });
  };

  programs.dms-shell = {
    enable = true;

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = false; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
    enableClipboardPaste = false; # Pasting from the clipboard history (wtype)
  };

  services.displayManager.dms-greeter = {
    enable = false;
    compositor.name = "niri";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    jq # used in config.kdl
  ];

  hjem.users.valblaze = {
    xdg.config.files."niri".source = "/home/valblaze/.nixos/modules/desktop/niri";
  };
}
