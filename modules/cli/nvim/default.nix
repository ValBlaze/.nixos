{ inputs, pkgs, ... }:

{
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  initLua = ''
    require("config")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nixd")
    vim.lsp.enable("rust-analyzer")
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("bashls")
  '';

  providers = {
    python3.enable = true;
    nodeJs.enable = true;
  };

  extraLuaPackages = p: [ p.jsregexp ];

  extraBinPath = with pkgs; [
    # dependencies
    ripgrep
    fzf
    fd
    bat
    universal-ctags

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer
    rustfmt

    # nix
    nixd
    nixfmt

    # python
    basedpyright
    ruff

    # shell
    shfmt
    shellcheck
    bash-language-server
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      plenary-nvim # telescope/todo-comments
      oil-nvim
      mini-nvim
      which-key-nvim
      friendly-snippets
      repeat # used by leap
      nvim-lspconfig
      blink-cmp
      conform-nvim
      lazydev-nvim
      luasnip
      catppuccin-nvim
      todo-comments-nvim
      fzf-lua
      snacks-nvim
      lualine-nvim
      nui-nvim # used by noice
      noice-nvim
      gitsigns-nvim
      nvim-autopairs
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}
