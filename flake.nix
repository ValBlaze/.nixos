{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    inputs@{ flake-parts, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
        inputs.home-manager.flakeModules.home-manager
      ];

      debug = true;
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
            inputs.mnw.nixosModules.default
            ./modules/cli
            ./modules/gui
            ./modules/system

          ];
        };
      };

      flake = {
        homeConfigurations.valblaze = home-manager.lib.homeManagerConfiguration {
          modules = [
            {
              home.username = "valblaze";
              home.homeDirectory = "/home/valblaze";
              home.stateVersion = "25.11";
            }
          ];
        };
      };
    };
}
