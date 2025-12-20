{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    bat-extras.core
  ];

  environment.shellAliases = {
    cat = "bat";
    diff = "batdiff";
    grep = "batgrep";
    man = "batman";
    watch = "batwatch";
  };

  hjem.users.valblaze = {
    files.".config/bat".source = "/home/valblaze/.nixos/modules/cli/bat";
  };
}
