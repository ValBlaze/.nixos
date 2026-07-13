{
  inputs,
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    clang
  ];
}
