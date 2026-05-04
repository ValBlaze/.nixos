{
  self,
  inputs,
  pkgs,
  lib,
  ...
}:

{
  programs.niri.enable = true;
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
    qt6Packages.qt6ct
  ];

  hjem.users.valblaze = {
    files.".config/niri".source = "/home/valblaze/.nixos/modules/desktop/niri";
  };

}
