{ inputs, config, pkgs, ... }: {
  imports = [
  ];

  hjem.users.valblaze = {
    user = "valblaze";
    directory = "/home/valblaze";
  };
  
  hjem.linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
}

