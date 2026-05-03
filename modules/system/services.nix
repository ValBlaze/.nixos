{
  ...
}:

{
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.gvfs.enable = true;

  services.earlyoom = {
    enable = true;
    enableNotifications = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
