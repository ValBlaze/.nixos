{ input, lib, pkgs, ... }: {
  hjem.users.valblaze = {
    files.".config/nvim".source = ./nvim;
  };
}

