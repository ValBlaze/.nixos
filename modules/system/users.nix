{ config, pkgs, ... }:
{
  users.users.valblaze = {
    isNormalUser = true;
    description = "valblaze";
    extraGroups = [
      "networkmanager"
      "wheel"
      "ydotool"
    ];
    shell = pkgs.zsh;
  };
}
