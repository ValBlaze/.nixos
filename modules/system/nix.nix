{
  inputs,
  ...
}:

{
  nixpkgs.overlays = [
    (final: prev: {
      python314Packages = prev.python314Packages.overrideScope (
        pyFinal: pyPrev: {
          patool = pyPrev.patool.override {
            file = prev.file.overrideAttrs {
              # Work around too strict landlock hardening
              # https://bugs.astron.com/view.php?id=785
              postPatch = ''
                substituteInPlace src/landlock.c --replace-fail \
                  "LANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_READ_DIR" \
                  "LANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_READ_DIR | LANDLOCK_ACCESS_FS_EXECUTE"
              '';
            };
          };
        }
      );
    })
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      download-buffer-size = 524288000;
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
    # set $NIX_PATH env to flake input
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05"; # Do not change!
}
