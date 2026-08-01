{
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.neovim.devMode)
    neovide
    zed-editor-fhs
    nil
    nixd
    ghostty
  ];

  environment.shellAliases = {
    zed = "zeditor";
  };
}
