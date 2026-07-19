{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    adwaita-icon-theme
    # xcursor support
    xsettingsd
    xrdb
  ];
}
