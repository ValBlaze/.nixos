{ config, pkgs, ... }:

{
  hjem.users.valblaze.files = {
    ".config/hypr".source = "/home/valblaze/.nixos/modules/gui/hypr";
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
  ];
}
