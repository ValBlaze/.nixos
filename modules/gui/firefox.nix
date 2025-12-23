{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pywalfox-native
  ];

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
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "seperate";
    };
  };
}
