{
  inputs,
  ...
}:

{
  imports = [
    ../imports.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "lapnix";
}
