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
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;

  hardware.graphics.enable = true;
}
