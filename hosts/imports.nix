{
  inputs,
  import-tree,
  home-manager,
  ...
}:

{
  imports = [
    (import-tree ../modules)
    inputs.hjem.nixosModules.default
    home-manager.nixosModules.home-manager
  ];
}
