{
  ...
}:

{
  systemd.paths.nixos-rebuild-watcher = {
    pathConfig = {
      PathModified = "$NH_FLAKE";
    };
    wantedBy = [ "multi-user.target" ];
  };

  systemd.services.nixos-rebuild-watcher = {
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    script = ''
      nh os switch
      notify-send NixOS Rebuild Complete!
    '';
  };
}
