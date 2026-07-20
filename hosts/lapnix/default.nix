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

        _module.args = { inherit inputs; };
        networking.hostName = "lapnix";
      })
    ];
  };
}
