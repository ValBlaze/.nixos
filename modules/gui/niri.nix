{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.dms-shell.enable = true;

  environment.systemPackages = with pkgs; [
    fuzzel
    xwayland-satellite
    qt6Packages.qt6ct
  ];
}
