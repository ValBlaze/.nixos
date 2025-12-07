{ config, pkgs, ... }:

{
  hjem.users.valblaze.files = {
    ".local/bin/nrs" = {
      source = "/home/valblaze/.nixos/modules/scripts/nrs/nrs.sh";
      executable = true;
    };
  };
}
