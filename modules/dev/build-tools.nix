{
  inputs,
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (self'.packages.neovim)
    rustc
    cargo
    rustfmt
    clippy
    clang
  ];
}
