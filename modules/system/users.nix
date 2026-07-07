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
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];

    clobberByDefault = true;

    users.valblaze = {
      directory = "/home/valblaze";
    };
  };
}
