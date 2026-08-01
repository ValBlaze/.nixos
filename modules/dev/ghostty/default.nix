{
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."ghostty".source = "/home/valblaze/.nixos/modules/dev/ghostty";
  };

  environment.systemPackages = with pkgs; [
    ghostty
  ];
}
