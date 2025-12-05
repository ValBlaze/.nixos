{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.hjem.nixosModules.default
  ];

  hjem.users.valblaze = {
    user = "valblaze";
    directory = "/home/valblaze";
  };
}

