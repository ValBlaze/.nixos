{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    dig
    zip
    unzip
    nix-search-tv
    nix-melt
    fzf
    fd
    ripgrep
    eza
    xdg-ninja
    jq
  ];

  programs.ydotool.enable = true;
}
