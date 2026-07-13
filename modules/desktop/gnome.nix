{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nautilus
    seahorse
    gnome-calculator
    gnome-clocks
    gnome-tweaks
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
