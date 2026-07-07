{
  pkgs,
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
    amdgpu.opencl.enable = true;
    bluetooth.enable = true;
    wooting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    clinfo
    lshw
    mission-center
    distrobox
    gnome-boxes
  ];

  virtualisation = {
    libvirtd.enable = true;
    docker.enable = false;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
