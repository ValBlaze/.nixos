{
  config,
  pkgs,
  lib,
  ...
}:

{
  systemd.user.services.nixos-rebuild-watch = {
    wantedBy = [ "default.target" ];
    serviceConfig.Type = "exec";

    path = with pkgs; [
      watchexec
      coreutils
    ];

    script = ''
      watchexec -w /home/valblaze/.nixos -e nix --postpone --notify -- systemctl start nixos-rebuild
    '';
  };

  systemd.services.nixos-rebuild = {
    serviceConfig.Type = "oneshot";

    script = ''
      ${config.system.build.nixos-rebuild}/bin/nixos-rebuild switch --flake path:/home/valblaze/.nixos
    '';
  };
}
