{ inputs, pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')
    LZN = require('lz.n')
    LZN.load('plugins')
  '';

  extraBinPath = with pkgs; [
    # dependencies
    ripgrep # telescope
    fd # telescope
    universal-ctags # nix-doc

    # lua
    lua-language-server
    stylua

    # nix
    nixd
    nix-doc
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
      nvim-autopairs
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

