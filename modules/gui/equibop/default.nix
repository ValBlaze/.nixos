{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    equibop
  ];

  hjem.users.valblaze.files = {
    ".config/equibop/settings/settings.json" = {
      enable = false;
      generator = lib.generators.toJSON {};
      value = {
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
        themeLinks = [];
        eagerPatches = false;
        enabledThemes = [];
        enabledThemeLinks = [];
        themeNames = {};
        enableReactDevtools = false;
        frameless = false;
        transparent = false;
        winCtrQ = false;
        disableMinSize = false;
        winNativeTitleBar = false;
        plugins = {};
      };
    };
  };
}
