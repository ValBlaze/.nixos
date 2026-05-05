{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    devenv
    cachix
  ];

  programs.direnv.enable = true;
}
