{
  inputs,
  pkgs,
  ...
}:
{
  users.users.valblaze = {
    isNormalUser = true;
    description = "valblaze";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "ydotool"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.valblaze = {
      user = "valblaze";
      directory = "/home/valblaze";
    };
    clobberByDefault = true;
  };
}
