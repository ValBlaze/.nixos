{
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    gcc
    dig
    gh
    wl-clipboard
    libnotify
    chromium
    bibata-cursors
    (self'.packages.neovimDev)
  ];

  services.flatpak.enable = true;
}
