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
    pkgs.kitty
    pkgs.wofi
    pkgs.bat
    pkgs.neovim
    pkgs.gh
    pkgs.ly
    pkgs.hyprland
  ];

  programs.firefox.enable = true;
  programs.git.enable = true;

  hardware.graphics.enable = true;
}
