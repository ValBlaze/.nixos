{ config, pkgs, ... }:

{
  hjem.users.valblaze = {
    files.".config/hypr".source = "/home/valblaze/.nixos/modules/gui/hypr";
    rum.desktops.hyprland.enable = true;
  };


  environment.systemPackages = with pkgs; [
    hyprpaper
  ];
}
