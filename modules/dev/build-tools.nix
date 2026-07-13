{
  inputs,
  pkgs,
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
