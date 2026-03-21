{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./hypr
    ./discord
    ./noctalia.nix
    ./prismlauncher.nix
    ./firefox.nix
    ./kde.nix
    ./niri
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];
}
