{
  inputs,
  ...
}:

{
  imports = [
    (inputs.import-tree ../modules)
    inputs.hjem.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];
}
