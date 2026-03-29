{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    bibata-cursors
    kdePackages.breeze
    adwaita-icon-theme
  ];
}
