{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.hjem.nixosModules.default
  ];

  config.hjem.users.valblaze = {
    user = "valblaze";
    directory = "/home/valblaze";
  };
}

