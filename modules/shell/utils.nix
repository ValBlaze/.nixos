{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    dig
    gh
    zip
    unzip
    nix-search-tv
    fd
    ripgrep
    eza
  ];

  programs.ydotool.enable = true;
}
