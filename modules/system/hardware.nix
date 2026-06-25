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
    distrobox
  ];

  programs.virt-manager.enable = false;

  virtualisation = {
    libvirtd.enable = false;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
