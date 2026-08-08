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

        extraEntries = ''
          /Windows 11
            protocol: efi
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
        # WARNING: Rebooting doesn't automatically select latest NixOS generation
        # extraConfig = ''
        #   remember_last_entry: yes
        # '';

        style.wallpapers = [ ../../assets/wallpapers/limine-splash.png ];
      };

      efi.canTouchEfiVariables = true;
    };

    zswap.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
