{ inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      download-buffer-size = 524288000;
      substituters = [
        "https://neovim-nightly.cachix.org"
      ];
      trusted-public-keys = [
        "neovim-nightly.cachix.org-1:feIoInHRevVEplgdZvQDjhp11kYASYCE2NGY9hNrwxY="
      ];
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05"; # Do not change!
}
