{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."kitty".source = "/home/valblaze/.nixos/modules/dev/kitty";
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.shellAliases = {
    ssh = "kitten ssh";
  };
}
