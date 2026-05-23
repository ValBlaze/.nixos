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

  programs.virt-manager.enable = false;

  virtualisation = {
    libvirtd.enable = false;
    docker.enable = true;
  };
}
