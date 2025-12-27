{ pkgs, ... }:

{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };
  programs.gamescope.enable = true;

  programs.steam = {
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
    extest.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    gamescopeSession.enable = true;
    protontricks.enable = true;
  };

  hardware.wooting.enable = true;

  # environment.systemPackages = with pkgs; [
  #   wootility
  # ];
}
