{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.hjem.nixosModules.default
    (inputs.import-tree ../../modules)
  ];

  networking.hostName = "nixtop";

  environment.systemPackages = [
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
  ];
}
