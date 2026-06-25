{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    google-chrome
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
