{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pkgsRocm.ffmpeg-full
    yt-dlp
  ];
}
