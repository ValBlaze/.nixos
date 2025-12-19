{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    equicord
  ];

  # hjem.users.valblaze.files = {
  #   ".nixos/modules/gui/discord/".source = "/home/valblaze/.nixos/modules/gui/hypr";
  # };
}
