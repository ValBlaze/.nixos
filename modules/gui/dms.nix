{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dms-shell
  ];
}
