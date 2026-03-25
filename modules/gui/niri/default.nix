{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.dms-shell.enable = true;
  programs.dsearch.enable = true;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.customConfig = ''
      input {
        touchpad {
          accel-profile "flat"
        }

        mouse {
          accel-profile "flat"
        }
      }

      output "DP-1" {
        mode "1920x1080"
      }
    '';
    compositor.name = "niri";
    configHome = "/home/valblaze";
  };

  environment.systemPackages = with pkgs; [
    fuzzel
    xwayland-satellite
    qt6Packages.qt6ct
  ];

  # hjem.users.valblaze = {
  #   files.".config/niri".source = "/home/valblaze/.nixos/modules/gui/niri";
  # };
}
