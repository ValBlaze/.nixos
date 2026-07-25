{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.neovim.devMode)
    zed-editor
    nil
    nixd
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
