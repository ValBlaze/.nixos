{ pkgs, ... }: {
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  environment.systemPackages = [ pkgs.neovim ];
}
