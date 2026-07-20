{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pywalfox-native
    chromium
  ];

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    policies = {
      DisableTelemetry = true;
    };
  };
}
