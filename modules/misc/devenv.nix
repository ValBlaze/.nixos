{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		devenv
	];

	cachix.pull = [ "nix-community" ];
}
