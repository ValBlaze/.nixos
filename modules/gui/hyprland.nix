{ config, pkgs, ... }: {
  home-manager.users.valblaze = {
    home.file = {
      ".config/hypr/hyprland.conf"
    };
  };
}
