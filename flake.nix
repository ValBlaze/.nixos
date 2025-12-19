{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    hjem = {
      url = "github:feel-co/hjem";
    };
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
      ];

      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, self', ... }:
        {
          packages = {
            default = inputs.self.nixosConfigurations.live-iso.config.system.build.isoImage;
            neovim = inputs.mnw.lib.wrap {
              inherit inputs pkgs;
            } ./modules/cli/nvim;
            neovimDev = self'.packages.neovim.devMode;
          };
        };

      easy-hosts = {
        path = ./hosts;
        autoConstruct = true;

        perClass = class: {
          modules = inputs.nixpkgs.lib.optionals (class == "nixos") [
            inputs.hjem.nixosModules.default
            inputs.mnw.nixosModules.default
            ./modules/cli
            ./modules/gui
            ./modules/system
          ];
        };
      };
    };
}
