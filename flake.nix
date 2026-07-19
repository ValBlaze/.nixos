{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and hjem.";
  #

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrappers = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        (inputs.import-tree [
          ./hosts
          ./modules
        ])
        ./nvim
        # inputs.hjem.nixosModules.default
        inputs.wrappers.flakeModules.wrappers
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem =
        {
          lib,
          self',
          system,
          ...
        }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          packages = {
            default = inputs.self.nixosConfigurations.live-iso.config.system.build.isoImage;
            davinci-resolve-studio = pkgs.callPackage ./packages/davinci-resolve-studio.nix { };
          };
        };
    };
}
