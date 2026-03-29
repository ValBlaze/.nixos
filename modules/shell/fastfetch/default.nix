{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
  ];

  hjem.users.valblaze = {
    files.".config/fastfetch".source = "/home/valblaze/.nixos/modules/shell/fastfetch";
  };
}
