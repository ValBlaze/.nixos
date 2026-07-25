{
  inputs,
  pkgs,
  ...
}:
{
  users.users.valblaze = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input" # FIXME: find a more secure solution to input automation
      "ydotool"
    ];
  };

  hjem = {
    clobberByDefault = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.valblaze = {
    programs.home-manager.enable = true;
    home.stateVersion = "26.05";
  };
}
