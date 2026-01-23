{
  config,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    nix-search-tv
    fzf
    ripgrep
    eza
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellInit = ''
      # To use batpipe, eval the output of this command in your shell init script.
      LESSOPEN="|/nix/store/4ygcpcvlzwrxpykp4171zaf07rdj5q33-batpipe-2024.08.24-unstable-2025-02-22/bin/.batpipe-wrapped %s";
      export LESSOPEN;
      unset LESSCLOSE;

      # The following will enable colors when using batpipe with less:
      LESS="$LESS -R";
      BATPIPE="color";
      export LESS;
      export BATPIPE;

      export FZF_DEFAULT_OPTS=" \
      --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
      --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
      --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
      --color=selected-bg:#494D64 \
      --color=border:#6E738D,label:#CAD3F5"
    '';

    interactiveShellInit = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

    setOptions = [
      "AUTO_CD"
    ];
  };

  environment.shellAliases = {
    ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
    l = "eza -al";
    ls = "eza";
    lt = "eza -laT";
    tree = "eza -T";
  };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;
}
