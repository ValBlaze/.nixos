{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    rum = {
      programs.kitty = {
        enable = true;
        integrations.zsh.enable = true;
      };
    };
    files.".config/kitty/kitty.conf".source = "/home/valblaze/.nixos/modules/desktop/kitty/kitty.conf";
  };

  environment.shellAliases = {
    ssh = "kitty +kitten ssh";
  };
}
