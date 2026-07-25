{
  inputs,
  ...
}:

{
  imports = [
    (inputs.import-tree ../modules)
    inputs.hjem.nixosModules.default
    # home-manager.nixosModules.home-manager
    # {
    #   home-manager.useGlobalPkgs = true;
    #   home-manager.useUserPackages = true;
    #   home-manager.extraSpecialArgs = { inherit inputs; };
    #   home-manager.users.valblaze = ../modules/system/home.nix;
    # }
  ];
}
