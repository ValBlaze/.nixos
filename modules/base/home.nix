{ config, ... }:

{
  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.valblaze = {
      home.username = "valblaze";
      home.homeDirectory = "/home/valblaze";

      home.stateVersion = "25.05"; # Don't change!
      programs.home-manager.enable = true; # Allow home-manager to manage itself

      home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
