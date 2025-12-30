{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
			merriweather
    ];

		fontconfig.defaultFonts = {
			emoji = [ "Noto Color Emoji" ];
			monospace = [ "JetBrainsMono Nerd Font Mono" ];
			sansSerif = [ "Inter Variable" ];
			serif = [ "Merriweather" ];
		};
  };
}
