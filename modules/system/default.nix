{
  pkgs,
  self',
  ...
}:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./fonts.nix
    ./users.nix
    ./variables.nix
    ./gaming.nix
    ./hardware.nix
  ];

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

  services.flatpak.enable = true;
}
