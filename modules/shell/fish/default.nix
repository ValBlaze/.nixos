{
  config,
  lib,
  pkgs,
  ...
}:

{
  hjem.users.valblaze = {
    xdg.config.files."fish".source = ./.;
  };

  programs.fish = {
    enable = true;

    loginShellInit = ''
      direnv hook fish | source
    '';
  };

  environment.shellAliases =
    let
      nix-search-tv = lib.getExe pkgs.nix-search-tv;
      fzf = lib.getExe pkgs.fzf;
      eza = lib.getExe pkgs.eza;
    in
    {
      ns = "${nix-search-tv} print | ${fzf} --preview '${nix-search-tv} preview {}' --scheme history";
      l = "${eza} -al";
      ls = "${eza}";
      lt = "${eza} -laT";
      tree = "${eza} -T";
    };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;
}
