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

  services.displayManager.ly.enable = false;
}
