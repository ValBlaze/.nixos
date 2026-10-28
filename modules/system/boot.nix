{
  pkgs,
  ...
}:

{
  system.activationScripts.windows-boot-script = {
    text = ''
      mkdir -p /boot/efi/edk2-uefi-shell
      cat << 'EOF' > /boot/efi/edk2-uefi-shell/winboot.nsh
      echo -off
      for %d in fs0 fs1 fs2 fs3 fs4 fs5 fs6 fs7 fs8 fs9 fsa fsb fsc fsd fse fsf
        if exist %d:\EFI\Microsoft\Boot\bootmgfw.efi then
          %d:\EFI\Microsoft\Boot\bootmgfw.efi
          goto END
        endif
      endfor
      echo "Windows Boot Manager not found."
      pause
      :END
      EOF
    '';
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;

        # higher number corresponds to higher number of columns and rows
        consoleMode = "max";

        extraEntries."windows.conf" = ''
          title Windows 11
          efi /efi/edk2-uefi-shell/Shell.efi
          # -noinitrow -nostartup flags stop the shell from running its default timers
          options -no-map -no-setfs -nomap -v -nodefault -nostartup -sf winboot.nsh
        '';
      };

      timeout = 0; # in systemd-boot, hold space to open boot menu

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
    efibootmgr
  ];
}
