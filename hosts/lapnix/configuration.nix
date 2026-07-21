{
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  _module.args = { inherit inputs; };
  networking.hostName = "lapnix";
}
