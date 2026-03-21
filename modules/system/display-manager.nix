{ pkgs, ... }:

{
  # services.greetd = {
  #   enable = true;
  #   useTextGreeter = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd startplasma-wayland";
  #       user = "greeter";
  #     };
  #   };
  # };

  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  # };
}
