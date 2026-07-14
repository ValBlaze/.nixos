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
    lua-language-server
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
