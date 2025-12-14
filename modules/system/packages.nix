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
    pkgs.bat
    pkgs.bat-extras.batdiff
    pkgs.bat-extras.batgrep
    pkgs.bat-extras.batman
    pkgs.bat-extras.batpipe
    pkgs.bat-extras.batwatch
    pkgs.bat-extras.core
    pkgs.bat-extras.prettybat
    pkgs.gh
    pkgs.wl-clipboard
    self'.packages.neovimDev
  ];

  programs.firefox.enable = true;
  programs.git.enable = true;
}
