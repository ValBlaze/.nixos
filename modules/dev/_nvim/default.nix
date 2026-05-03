{
  inputs,
  pkgs,
  ...
}:

{
  neovim = pkgs.neovim-unwrapped;
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
    wl-clipboard

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer
    rustfmt
    clippy
    cargo
    rustc

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
    cmake-language-server
    cmake-format
    cmake-lint
    mesonlsp
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      plenary-nvim # telescope/todo-comments
      mini-nvim
      which-key-nvim
      friendly-snippets
      vim-repeat # used by leap
      nvim-lspconfig
      blink-cmp
      conform-nvim
      nvim-lint
      lazydev-nvim
      luasnip
      catppuccin-nvim
      onedarkpro-nvim
      palenight-vim
      todo-comments-nvim
      snacks-nvim
      lualine-nvim
      nui-nvim # used by noice
      noice-nvim
      nvim-treesitter.withAllGrammars
      cmake-tools-nvim
      fidget-nvim
      trouble-nvim
      tiny-inline-diagnostic-nvim
      colorful-menu-nvim
      oil-nvim
      colorizer
    ];

    dev.config = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/modules/dev/nvim";
    };
  };
}
