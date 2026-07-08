{
  config,
  lib,
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pkgsRocm.ffmpeg-full
    yt-dlp
  ];
}
