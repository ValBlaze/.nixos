{
  pkgs,
  ...
}:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      inter
      merriweather
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        sansSerif = [ "Inter Variable" ];
        serif = [ "Merriweather" ];
      };

      # Subpixel order. The overwhelming majority of displays are rgb in their normal orientation. Select vrgb for mounting such a display 90 degrees clockwise from its normal orientation or vbgr for mounting 90 degrees counter-clockwise. Select bgr in the unlikely event of mounting 180 degrees from the normal orientation. Reverse these directions in the improbable event that the display’s native subpixel order is bgr.
      subpixel.rgba = "rgb";
    };
  };
}
