{ config, pkgs, ... }:

{
  home-manager.users.valblaze = {
    home.file."~/.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    };
  };
}
