{ pkgs, ... }:

{
  programs.ydotool.enable = true;
  environment.systemPackages = with pkgs; [
    zip
    unzip
    brightnessctl
  ];
}
