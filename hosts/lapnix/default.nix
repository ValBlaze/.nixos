{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    (inputs.import-tree ../../modules)
    inputs.hjem.nixosModules.default
  ];

  networking.hostName = "lapnix";
}
