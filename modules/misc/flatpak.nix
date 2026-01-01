{
  # Flatpak
  services.flatpak.enable = true;

  # FIX: Error on build
  # environment.variables.XDG_DATA_DIRS = ''
  #   /var/lib/flatpak/exports/share
  #   :/home/valblaze/.local/share/flatpak/exports/share
  #   :$XDG_DATA_DIRS"
  # '';
}
