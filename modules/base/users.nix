{ config, pkgs, ... }: {
  programs.zsh.enable = true;

  users.users.valblaze = {
    isNormalUser = true;
    description = "valblaze";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  services.getty.autologinUser = "valblaze";
}
