{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    (inputs.import-tree ../../modules)
    inputs.hjem.nixosModules.default
  ];

  networking.hostName = "nixtop";

  environment.systemPackages = [
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
  ];
}
