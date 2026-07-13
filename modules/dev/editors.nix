{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    zed-editor
    nil
    nixd
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
