{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cava
  ];

  hjem.users.valblaze = {
    xdg.config.files."cava".source = ./.;
  };
}
