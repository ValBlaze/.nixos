{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      set fish_key_bindings fish_vi_key_bindings
    '';

    loginShellInit = ''
      direnv hook fish | source
    '';
  };

  environment.shellAliases = {
    ns = "${lib.getExe pkgs.nix-search-tv} print | ${lib.getExe pkgs.fzf} --preview '${lib.getExe pkgs.nix-search-tv} preview {}' --scheme history";
    l = "${lib.getExe pkgs.eza} -al";
    ls = "${lib.getExe pkgs.eza}";
    lt = "${lib.getExe pkgs.eza} -laT";
    tree = "${lib.getExe pkgs.eza} -T";
  };

  programs.zoxide = {
    enable = true;
    flags = [
      "--cmd cd"
    ];
  };

  programs.starship.enable = true;
}
