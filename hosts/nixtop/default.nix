{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ../imports.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixtop";

  environment.systemPackages = [
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.davinci-resolve-studio
  ];
}
