{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  home-manager.users.valblaze = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        nrs = "git add ~/.nixos && git commit -m 'gen' ~/.nixos && git push && sudo nixos-rebuild switch --flake ~/.nixos";
        ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
        cd = "z";
        ls = "eza";
        l = "eza -al";
      };
    };

    programs.starship.enable = true;
    programs.zoxide.enable = true;
    programs.eza.enable = true;
    programs.fzf.enable = true;
    programs.nix-search-tv.enable = true;
  };
}
