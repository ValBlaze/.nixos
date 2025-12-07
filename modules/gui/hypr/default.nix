{ config, pkgs, ... }:

{
  hjem.users.valblaze = {
    files.".config/hypr".source = "/home/valblaze/.nixos/modules/gui/hypr";
  };

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    swww
    hyprpicker
    hyprshot
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  hardware.graphics.enable = true;
}
