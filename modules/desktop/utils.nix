{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
    xclip
    wineWow64Packages.full
  ];

  programs.ydotool.enable = true;
}
