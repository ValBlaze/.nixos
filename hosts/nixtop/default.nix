{
  inputs,
  ...
}:

{
  flake.nixosConfigurations.nixtop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      (
        {
          pkgs,
          ...
        }:
        {
          imports = [
            ./hardware-configuration.nix
            inputs.hjem.nixosModules.default
            (inputs.import-tree ../../modules)
          ];

          _module.args = { inherit inputs; };
          networking.hostName = "nixtop";

          environment.systemPackages = [
            inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
          ];
        }
      )
    ];
  };
}
