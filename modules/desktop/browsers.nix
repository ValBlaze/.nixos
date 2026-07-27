{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    pywalfox-native
  ];
}
