{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withEquicord = true;
    })
  ];

  # hjem.users.valblaze.files = {
  #   ".nixos/modules/gui/discord/".source = "/home/valblaze/.nixos/modules/gui/hypr";
  # };
}
