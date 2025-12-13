{ inputs, pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')
    LZN = require('lz.n')
    LZN.load('plugins')
  '';

  extraBinPath = with pkgs; [
    ripgrep # telescope dep
    fd # telescope dep
    lua-language-server
    stylua
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      plenary-nvim # telescope dep
      oil-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      lazydev-nvim
      telescope-nvim
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

