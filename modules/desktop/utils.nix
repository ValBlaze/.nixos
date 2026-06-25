{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
    xclip
  ];

  programs.ydotool.enable = true;
}
