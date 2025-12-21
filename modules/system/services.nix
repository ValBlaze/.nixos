{ config, pkgs, ... }:

{
  services.getty.autologinUser = "valblaze";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.openssh.enable = true;
  services.upower.enable = true;
  hardware.bluetooth.enable = true;
}
