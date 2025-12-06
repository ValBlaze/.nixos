{
  description = "ValBlaze's NixOS environment featuring flake-parts, easy-hosts, and home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    hjem.url = "github:feel-co/hjem";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.easy-hosts.flakeModule
      ];

      systems = [ "x86_64-linux" ];

      easy-hosts = {
        path = ./hosts;
        autoConstruct = true;

        onlySystem = "x86_64-nixos";

        shared.modules = [
    	  inputs.hjem.nixosModules.default
	      inputs.mnw.nixosModules.default
	      ./modules/cli
          ./modules/gui
          ./modules/system
        ];
      };
    };
}
