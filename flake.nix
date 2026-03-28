{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    hjem.follows = "hjem-rum/hjem";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    inputs@{ flake-parts, nixpkgs, ... }:
    let
      ignoreModules = [
        ./modules/dev/nvim
      ];
      files = nixpkgs.lib.filesystem.listFilesRecursive ./modules;
      isIgnored = n:
        nixpkgs.lib.any (p: nixpkgs.lib.strings.hasPrefix (toString p) (toString n)) ignoreModules;
    in
    let
      importModules = nixpkgs.lib.filter (n: nixpkgs.lib.strings.hasSuffix ".nix" n && !isIgnored n) files;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
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
            } ./modules/dev/nvim;
            neovimDev = self'.packages.neovim.devMode;
          };
        };

      easy-hosts = {
        path = ./hosts;
        autoConstruct = true;

        perClass = class: {
          modules = inputs.nixpkgs.lib.optionals (class == "nixos") [
            inputs.hjem.nixosModules.default
          ] ++ importModules;
        };
      };
    };
}
