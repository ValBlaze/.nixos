{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wineWow64Packages.full
    winetricks
    bottles
    heroic
    prismlauncher
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.obs-studio.enable = true;

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
    extest.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };
}
