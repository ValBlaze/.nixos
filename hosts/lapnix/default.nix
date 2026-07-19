{
  inputs,
  ...
}:

{
  flake.nixosConfigurations.lapnix = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./hardware-configuration.nix
    ];

    networking.hostName = "lapnix";
  };
}
