{
  inputs,
  ...
}:

{
  flake.nixosConfigurations.lapnix = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ({ ... }: {
        imports = [
          ./hardware-configuration.nix
        ];

        networking.hostName = "lapnix";
      })
    ];
  };
}
