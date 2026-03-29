{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    chromium
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
