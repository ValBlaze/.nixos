{
  config,
  lib,
  pkgs,
  self',
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (self'.packages.davinci-resolve-studio)
    pkgsRocm.ffmpeg-full
    yt-dlp
  ];
}
