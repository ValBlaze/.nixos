{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cava
  ];

  hjem.users.valblaze = {
    xdg.config.files."cava".source = "/home/valblaze/.nixos/modules/shell/cava";
  };
}
