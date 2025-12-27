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

  services.flatpak.enable = true;
}
