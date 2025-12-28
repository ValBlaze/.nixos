{ pkgs, ... }:

{
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    require("config")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nixd")
    vim.lsp.enable("rust-analyzer")
    vim.lsp.enable("basedpyright")
  '';

  providers = {
    python3.enable = true;
    nodeJs.enable = true;
  };

  extraLuaPackages = p: [ p.jsregexp ];

  extraBinPath = with pkgs; [
    # dependencies
    ripgrep
    fd
    bat
    universal-ctags

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer

    # nix
    nixd
    nix-doc
    nixfmt

    # python
    basedpyright
    ruff
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
      nvim-lspconfig
      blink-cmp
      conform-nvim
      lazydev-nvim
      luasnip
      # TODO: look at telescope-manix
      catppuccin-nvim
      todo-comments-nvim
      noice-nvim
      snacks-nvim
      fzf-lua
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}
