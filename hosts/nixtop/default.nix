{
  inputs,
  self,
  pkgs,
  ...
}:

{
  flake.nixosConfigurations.nixtop = {
    modules = [
      ./hardware-configuration.nix
    ];

    networking.hostName = "nixtop";
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
    ];
  };
}
