{ inputs, config, pkgs, ... }: {

  hjem = {
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;

    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];

    users.valblaze = {
      user = "valblaze";
      directory = "/home/valblaze";
    };
    clobberByDefault = true;
  };
}

