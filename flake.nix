{
  description = "ValBlaze's NixOS environment.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mnw.url = "github:Gerg-L/mnw";
    tree-sitter-comment = {
      url = "github:OXY2DEV/tree-sitter-comment";
      flake = false;
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      systems = [
        # TODO: explore systems flake as an alternative
        "x86_64-linux"
      ];
      forAllSystems =
        f:
        lib.genAttrs systems (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        );
    in
    {
      nixosConfigurations = {
        nixtop = lib.nixosSystem {
          modules = [
            ./hosts/nixtop
          ];
          specialArgs = { inherit inputs; };
        };
        lapnix = lib.nixosSystem {
          modules = [
            ./hosts/lapnix
          ];
          specialArgs = { inherit inputs; };
        };
      };

      packages = forAllSystems (
        { pkgs }: {
          neovim = inputs.mnw.lib.wrap { inherit inputs pkgs; } ./nvim;
          davinci-resolve-studio = pkgs.callPackage ./packages/davinci-resolve-studio.nix { };
        }
      );
    };
}
