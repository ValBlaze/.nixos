{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."kitty/kitty.conf".source = "/home/valblaze/.nixos/modules/desktop/kitty";
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.shellAliases = {
    ssh = "kitten ssh";
  };
}
