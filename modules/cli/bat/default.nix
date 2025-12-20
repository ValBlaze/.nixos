{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = [
      pkgs.bat-extras.core
    ];
    settings = {
      theme = "Catppuccin Macchiatto";
    };
  };

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
