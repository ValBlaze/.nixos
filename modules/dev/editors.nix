{
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (self'.packages.neovim)
    zed-editor
    nil
    nixd
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
