{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-laptop";

  # Necessary to make Noctalia's power-profile and battery feature available
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
