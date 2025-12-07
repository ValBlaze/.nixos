{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    equibop
  ];

  hjem.users.valblaze.file = {
    ".config/equibop/settings/settings.json" = {
      generator = lib.generators.toJSON {};
      value = {
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
      };
    };
  };
}
