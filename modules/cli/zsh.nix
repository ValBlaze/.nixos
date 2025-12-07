{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    nix-zsh-completions
  ];

  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake '/home/valblaze/.nixos'";
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
