{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./discord
    ./firefox.nix
    ./kde.nix
    ./niri
    ./gnome.nix
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    zed-editor
    prismlauncher
  ];
}
