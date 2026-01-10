{ pkgs, ... }:
{
  users.users.valblaze = {
    isNormalUser = true;
    description = "valblaze";
    extraGroups = [
      "networkmanager"
      "wheel"
      "ydotool"
      "input"
    ];
    shell = pkgs.zsh;
  };
}
