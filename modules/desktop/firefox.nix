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
    };
  };
}
