{
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (self'.packages.neovim)
    zed-editor-fhs
    rustup
    rust-analyzer
    clang
    clang-tools
    nixd
    nil
  ];
}
