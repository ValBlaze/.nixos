{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    nix-search-tv
    fzf
  ];

  environment.shellAliases = {
    nrs = "/home/valblaze/.nixos/modules/scripts/rebuild.sh";
    ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
  };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;
  programs.yazi.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d "" cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }
    '';
  };
}
