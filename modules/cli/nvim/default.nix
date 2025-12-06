{ input, lib, pkgs, ... }: {
  hjem.users.valblaze = {
    files.".config/nvim".source = "/home/valblaze/.nixos/modules/cli/nvim";
  };
}

