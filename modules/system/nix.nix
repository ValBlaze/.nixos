{
  inputs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "root"
        "valblaze"
      ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
  };

  system.stateVersion = "25.05"; # Do not change!
}
