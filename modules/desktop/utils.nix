{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
  ];

  programs.ydotool.enable = true;
}
