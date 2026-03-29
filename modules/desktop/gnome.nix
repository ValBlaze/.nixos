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
  ];
}
