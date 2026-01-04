{ inputs, pkgs, ... }:

{
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  initLua = ''
    require("config")
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
    universal-ctags

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer
    rustfmt
    clippy
    cargo

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

    # js/ts
    eslint_d

    # c/c++
    clang-tools
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
      nvim-lint
      lazydev-nvim
      luasnip
      catppuccin-nvim
      todo-comments-nvim
      fzf-lua
      snacks-nvim
      lualine-nvim
      nui-nvim # used by noice
      noice-nvim
      nvim-treesitter.withAllGrammars
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/cli/nvim";
    };
  };
}
