{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    kdePackages.breeze
    adwaita-icon-theme
  ];
}
