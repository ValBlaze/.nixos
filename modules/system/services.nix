{ config, pkgs, ... }:

{
  services.getty.autologinUser = "valblaze";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.openssh.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  hardware.bluetooth.enable = true;

  # Flatpak
  services.flatpak.enable = true;
  environment.variables.XDG_DATA_DIRS = ''
    /var/lib/flatpak/exports/share
    :/home/valblaze/.local/share/flatpak/exports/share
    :$XDG_DATA_DIRS"
  '';
}
