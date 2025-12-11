{ inputs, pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')
    LZN = require('lz.n')
    LZN.load('lazy')
  '';

  extraBinPath = with pkgs; [
    lua-language-server
    stylua
    ripgrep # telescope dep
    fd # telescope dep
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      plenary-nvim # telescope dep
      oil-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      blink-cmp
      lazydev-nvim
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

