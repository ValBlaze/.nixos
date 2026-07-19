{
  inputs,
  self,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.nixtop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./hardware-configuration.nix
    ];

    networking.hostName = "nixtop";
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
    ];
  };
}
