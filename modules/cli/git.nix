{ config, pkgs, ... }:

{
  home-manager.users.valblaze = {
    programs.git = {
      enable = true;
      settings = {
        user.name = "Val Blaze";
        user.email = "valblazeyt@gmail.com";
      };
    };

    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
  };
}
