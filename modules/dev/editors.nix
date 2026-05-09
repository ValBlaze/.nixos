{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    helix
    zed-editor
    nil
    nixd
  ];
}
