{ config, ... }:

{
  hjem.users.valblaze = {
    rum = {
      programs.kitty = {
        enable = true;
        integrations.zsh.enable = true;
      };
    };
    files.".config/kitty.conf".source = "/home/valblaze/.nixos/modules/gui/kitty.conf";
  };

  environment.shellAliases = {
    ssh = "kitty +kitten ssh";
  };
}
