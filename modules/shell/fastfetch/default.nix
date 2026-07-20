{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
  ];

  hjem.users.valblaze = {
    xdg.config.files."fastfetch".source = "/home/valblaze/.nixos/modules/shell/fastfetch";
  };
}
