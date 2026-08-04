{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    adwaita-icon-theme
    qt6Packages.qt6ct
  ];

  # hjem.users.valblaze = {
  #   xdg.data.files."icons/default" = {
  #     source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors";
  #     type = "copy"; # Steam doesn't seem to follow symlinks
  #   };
  # };
}
