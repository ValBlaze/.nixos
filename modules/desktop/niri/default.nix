{ inputs, pkgs, ... }:

{
  programs.niri.enable = true;
  programs.dms-shell.enable = true;
  programs.dsearch.enable = true;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/valblaze";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    qt6Packages.qt6ct
    dgop
  ];

  hjem.users.valblaze = {
    files.".config/niri".source = "/home/valblaze/.nixos/modules/desktop/niri/";
  };
}
