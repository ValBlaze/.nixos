{
  inputs,
  ...
}:

{
  flake.nixosConfigurations.lapnix = {
    modules = [
      ./hardware-configuration.nix
    ];

    networking.hostName = "lapnix";
  };
}
