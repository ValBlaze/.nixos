{ inputs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  nix.settings.download-buffer-size = 524288000;
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Do not change!
}
