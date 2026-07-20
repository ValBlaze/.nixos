{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      # grab all bat-extras
      batdiff
      batgrep
      batman
      batpipe
      batwatch
      prettybat
    ];
    settings = {
      theme = "'Catppuccin Macchiato'";
    };
  };

  environment.shellAliases = {
    cat = "bat";
    diff = "batdiff";
    # grep = "batgrep";
    man = "batman";
    watch = "batwatch";
  };

  hjem.users.valblaze = {
    xdg.config.files."bat".source = "/home/valblaze/.nixos/modules/shell/bat";
  };
}
