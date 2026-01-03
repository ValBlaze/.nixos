{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
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
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config = {
      common.default = [ "hyprland" ];
    };
  };

  systemd.user.services."xdg-desktop-portal-hyprland" = {
    description = "Hyprland Portal Backend";
    after = [ "xdg-desktop-portal.service" ];

    serviceConfig = {
      ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/bin/hyprland-share-picker";
      Environment = "XDG_CURRENT_DESKTOP=Hyprland";
      Restart = "on-failure";
    };

    wantedBy = [ "default.target" ];
  };

  hardware.graphics.enable = true;
}
