{
  config,
  pkgs,
  self',
  ...
}:
{
  environment.systemPackages = [
    pkgs.wget
    pkgs.gcc
    pkgs.clang
    pkgs.clang-tools
    pkgs.dig
    pkgs.wofi
    pkgs.bat
    pkgs.neovim
    pkgs.npins
    self'.packages.default
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  hardware.graphics.enable = true;
}
