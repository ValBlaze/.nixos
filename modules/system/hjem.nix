{ inputs, config, pkgs, ... }: {

  hjem = {
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;

    users.valblaze = {
      user = "valblaze";
      directory = "/home/valblaze";
    };
    clobberByDefault = true;
  };
}

