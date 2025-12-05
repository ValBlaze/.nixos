{ inputs, config, pkgs, ... }: {

  hjem.users.valblaze = {
    user = "valblaze";
    directory = "/home/valblaze";
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
  };
}

