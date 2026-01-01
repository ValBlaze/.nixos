{ pkgs, ... }:

{
  imports = [
    ./bat
    ./zsh.nix
    ./fastfetch.nix
    ./cava.nix
    ./nh.nix
    ./git.nix
  ];

  programs.ydotool.enable = true;
  environment.systemPackages = with pkgs; [
    zip
    unzip
  ];
}
