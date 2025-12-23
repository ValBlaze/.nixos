{
  inputs,
  pkgs,
  self',
  ...
}:
{
  environment.systemPackages = [
    pkgs.wget
    pkgs.gcc
    pkgs.dig
    pkgs.wofi
    pkgs.gh
    pkgs.wl-clipboard
    pkgs.libnotify
    self'.packages.neovimDev
  ];

  programs.git.enable = true;
}
