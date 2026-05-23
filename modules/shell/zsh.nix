{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    loginShellInit = ''
      export FZF_DEFAULT_OPTS=" \
      --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
      --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
      --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
      --color=selected-bg:#494D64 \
      --color=border:#6E738D,label:#CAD3F5"

      eval "$(direnv hook zsh)"
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
