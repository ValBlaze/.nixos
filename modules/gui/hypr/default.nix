{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    hyprpicker
    grimblast
    slurp
  ];

  hjem.users.valblaze = {
    files.".config/hypr".source = "/home/valblaze/.nixos/modules/gui/hypr";
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ ];
    config = {
      common.default = [ "*" ];
    };
  };

  hardware.graphics.enable = true;
}
