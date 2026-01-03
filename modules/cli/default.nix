{ pkgs, ... }:

{
  imports = [
    ./bat
    ./zsh.nix
    ./fastfetch.nix
    ./cava.nix
    ./nh.nix
    ./git.nix
    ./devenv.nix
    ./direnv.nix
  ];

  programs.ydotool.enable = true;
  environment.systemPackages = with pkgs; [
    zip
    unzip
  ];
}
