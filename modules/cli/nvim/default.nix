{ pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')
    LZN = require('lz.n')
    LZN.register_handler(require("handlers.which-key"))
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
    nixfmt
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      plenary-nvim # telescope/todo-comments
      which-key-nvim
      oil-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      lazydev-nvim
      telescope-nvim
      nvim-autopairs
      catppuccin-nvim
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

