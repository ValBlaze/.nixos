{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vencord
    (discord.override {
      withVencord = true;
    })
  ];

  # hjem.users.valblaze.files = {
  #   ".nixos/modules/gui/discord/".source = "/home/valblaze/.nixos/modules/gui/hypr";
  # };
}
