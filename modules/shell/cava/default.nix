{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cava
  ];

  hjem.users.valblaze = {
    files.".config/cava".source = "/home/valblaze/.nixos/modules/shell/cava";
  };
}
