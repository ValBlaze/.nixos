{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and hjem.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    hjem.follows = "hjem-rum/hjem";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      flake-parts,
      wrappers,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
        wrappers.flakeModules.wrappers
        ./nvim
      ];

      systems = inputs.nixpkgs.lib.platforms.all;

      perSystem =
        {
          pkgs,
          lib,
          self',
          ...
        }:
        {
          packages = {
            default = inputs.self.nixosConfigurations.live-iso.config.system.build.isoImage;
          };
        };

      easy-hosts = {
        path = ./hosts;
        autoConstruct = true;

        perClass = class: {
          modules = inputs.nixpkgs.lib.optionals (class == "nixos") [
            inputs.hjem.nixosModules.default
            (inputs.import-tree ./modules)
          ];
        };
      };
    };
}
