{
  inputs,
  pkgs,
  self',
  ...
}:
{
  environment.systemPackages = [
    pkgs.wget
    pkgs.gcc
    pkgs.dig
    pkgs.wofi
    pkgs.gh
    pkgs.wl-clipboard
    self'.packages.neovimDev
  ];

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlays.default
  ];

  programs.firefox.enable = true;
  programs.git.enable = true;
}
