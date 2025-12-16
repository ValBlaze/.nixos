{ pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require('config')

    LZN = require('lz.n')
    LZN.register_handler(require("handlers.which-key"))
    LZN.load('plugins')

    vim.lsp.enable('lua_ls')
    vim.lsp.enable('nixd')
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
      nui-nvim
      friendly-snippets
      colorful-menu-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
    ];

    opt = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      lazydev-nvim
      luasnip
      telescope-nvim
      # TODO: look at telescope-manix
      catppuccin-nvim
      which-key-nvim
      todo-comments-nvim
      leap-nvim
      noice-nvim
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}

