{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."kitty".source = "/home/valblaze/.nixos/modules/desktop/kitty";
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.shellAliases = {
    ssh = "kitten ssh";
  };
}
