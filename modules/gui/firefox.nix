{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar= "newtab"; # alternatives: "always" or "never"
      DisplayMenuBar = "default-off";
      SearchBar = "unified"; # alternative: seperate
    };
  };
}
