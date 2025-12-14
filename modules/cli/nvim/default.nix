{ pkgs, lib, config, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')

    vim.g.startuptime_event_width = 0
    vim.g.startuptime_tries = 10
    vim.g.startuptime_exe_path = "${lib.getBin config.programs.mnw.finalPackage}";

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
      oil-nvim
      mini-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      lazydev-nvim
      telescope-nvim
      nvim-autopairs
      catppuccin-nvim
      which-key-nvim
      todo-comments-nvim
      fidget-nvim
      vim-startuptime
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

