{
  inputs,
  self,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.nixtop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ({ pkgs, ... }: {
        imports = [
          ./hardware-configuration.nix
          (inputs.import-tree ../../modules)
        ];

        networking.hostName = "nixtop";
        environment.systemPackages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
        ];
      })
    ];
  };
}
