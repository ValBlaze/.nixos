{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.gwenview

    # actually gnome but who cares
    glib
  ];
}
