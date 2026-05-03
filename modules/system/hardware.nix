{
  ...
}:

{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    wooting.enable = true;
  };

  virtualisation.libvirtd.enable = false;
  programs.virt-manager.enable = false;
}
