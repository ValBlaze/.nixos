{
  imports = [
    ./bat
    ./zsh.nix
    ./fastfetch.nix
    ./cava.nix
    ./nh.nix
  ];

  programs.ydotool.enable = true;
}
