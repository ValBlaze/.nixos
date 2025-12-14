{
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
    self'.packages.neovimDev
  ];

  programs.firefox.enable = true;
  programs.git.enable = true;
}
