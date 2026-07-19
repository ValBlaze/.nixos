{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."kitty/kitty.conf".source = ./kitty.conf;
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.shellAliases = {
    ssh = "kitten ssh";
  };
}
