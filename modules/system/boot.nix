{
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot.enable = true;
      timeout = 0;

      limine = {
        enable = false;
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
    };

    zswap.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
