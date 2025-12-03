{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
        inputs.home-manager.flakeModules.home-manager
      ];

      systems = [ "x86_64-linux" ];

      easy-hosts = {
        path = ./hosts;
        autoConstruct = true;

        onlySystem = "x86_64-nixos";

        shared.modules = [
          inputs.home-manager.nixosModules.home-manager
          ./modules/base
          ./modules/extra
        ];
      };
    };
}
