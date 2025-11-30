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
    pkgs.kitty
    pkgs.dig
    pkgs.wofi
    pkgs.bat
    self'.packages.nvim
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  hardware.graphics.enable = true;

  system.stateVersion = "25.05"; # Do not change!
}
