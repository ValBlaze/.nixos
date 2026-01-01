{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixlap";

  # Necessary to make Noctalia's power-profile and battery feature available
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
