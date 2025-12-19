{ pkgs, ... }:

{
  neovim = pkgs.neovim-nightly;
  initLua = ''
    require('config')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('nixd')
  '';

  providers = {
    python3.enable = true;
    nodeJs.enable = true;
  };

  extraLuaPackages = p: [ p.jsregexp ];

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
      plenary-nvim # telescope/todo-comments
      oil-nvim
      mini-nvim
      which-key-nvim
      nui-nvim
      friendly-snippets
      repeat # used by leap
      # nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      conform-nvim
      lazydev-nvim
      luasnip
      telescope-nvim
      # TODO: look at telescope-manix
      catppuccin-nvim
      todo-comments-nvim
      noice-nvim
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}
