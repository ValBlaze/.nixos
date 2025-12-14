{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    nix-search-tv
    fzf
    pkgs.bat
    pkgs.bat-extras.core
    eza
  ];

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

      # To use batpipe, eval the output of this command in your shell init script.
      LESSOPEN="|/nix/store/4ygcpcvlzwrxpykp4171zaf07rdj5q33-batpipe-2024.08.24-unstable-2025-02-22/bin/.batpipe-wrapped %s";
      export LESSOPEN;
      unset LESSCLOSE;

      # The following will enable colors when using batpipe with less:
      LESS="$LESS -R";
      BATPIPE="color";
      export LESS;
      export BATPIPE;
    '';
  };

  environment.shellAliases = {
    nrs = "/home/valblaze/.nixos/modules/scripts/rebuild.sh";
    ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
    l = "eza -al";
    ls = "eza";
    lt = "eza -laT";
    tree = "eza -T";
    cat = "bat";
    diff = "batdiff";
    grep = "batgrep";
    man = "batman";
    watch = "batwatch";
  };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;
  programs.yazi.enable = true;
}
