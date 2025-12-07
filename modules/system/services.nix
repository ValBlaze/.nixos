{ config, pkgs, ... }:

{
  services.getty.autologinUser = "valblaze";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.openssh.enable = true;
}
