{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.neovim)
    zed-editor
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
