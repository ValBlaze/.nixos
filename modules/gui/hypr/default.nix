{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    swww
    hyprpicker
    hyprshot
  ];

  hjem.users.valblaze = {
    files.".config/hypr".source = "/home/valblaze/.nixos/modules/gui/hypr";
  };

  programs.hyprland = {
    enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  hardware.graphics.enable = true;
}
