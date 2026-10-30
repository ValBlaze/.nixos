{
  pkgs,
  ...
}:

{
  programs.niri.enable = true;
  programs.dux-shell.enable = false;

  services.displayManager.dms-greeter = {
    enable = false;
    compositor.name = "niri";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    jq # used in config.kdl
    xdotool # used to kill xwayland-satellite windows
  ];

  hjem.users.valblaze = {
    xdg.config.files."niri".source = "/home/valblaze/.nixos/modules/desktop/niri";
  };
}
