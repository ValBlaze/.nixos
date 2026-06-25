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
        extraConfig = ''
          remember_last_entry: yes
        '';

        style.wallpapers = [ ../../assets/wallpapers/limine-splash.png ];
      };

      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
