{
  self',
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixtop";
  environment.systemPackages = [ self'.packages.davinci-resolve-studio ];
}
