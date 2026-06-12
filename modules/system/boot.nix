{
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      limine = {
        enable = true;
        secureBoot.enable = true;
        secureBoot.autoEnrollKeys.enable = true;
        extraEntries = ''
          /Windows
            protocol: efi
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
        extraConfig = ''
          remember_last_entry: yes
        '';
        style.wallpapers = [ ../../assets/wallpapers/limine-splash.png ];
      };

      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
