{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nautilus
    gnome-disk-utility
    gnome-calculator
    gnome-clocks
    # gnome-tweaks
    # gnomeExtensions.paperwm
  ];

  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;
}
