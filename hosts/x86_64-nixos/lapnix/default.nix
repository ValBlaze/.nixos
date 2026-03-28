{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "lapnix";

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
