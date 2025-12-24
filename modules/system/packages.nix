{
  inputs,
  pkgs,
  self',
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    gcc
    dig
    wofi
    gh
    wl-clipboard
    libnotify
    chromium
    bibata-cursors
    (self'.packages.neovimDev)
  ];

  programs.git.enable = true;
}
