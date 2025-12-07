{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    nix-zsh-completions
    nix-search-tv
    fzf
  ];

  environment.shellAliases = {
    nrs = "/home/valblaze/.nixos/modules/scripts/rebuild.sh";
    ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };
  programs.starship.enable = true;
}
