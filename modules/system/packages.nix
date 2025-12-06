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
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.mnw.enable = true;

  hardware.graphics.enable = true;
}
