{
  inputs,
  pkgs,
  ...
}:
# FIXME: make this work
let
  tree-sitter-comment = pkgs.tree-sitter.buildGrammar {
    language = "tree-sitter-comment";
    version = "custom";
    src = inputs.tree-sitter-comment;
  };
  allGrammars = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
  filteredGrammars = builtins.filter (p: p.pname != "tree-sitter-comment") allGrammars;
in
{
  enable = true;

  initLua = ''
    -- Enable faster startup by caching compiled Lua modules
    vim.loader.enable()

    require("config")
    require("plugins")

    -- Pre-Bundled Packages
    vim.cmd("packadd! nohlsearch")
    vim.cmd("packadd! nvim.undotree")
  '';

  plugins = {
    dev.myconfig = {
      pure = ./.;
      impure = "/home/valblaze/.nixos/nvim";
    };
    start = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (_: filteredGrammars ++ [ tree-sitter-comment ]))
      nvim-lspconfig
      blink-cmp
      conform-nvim
      nvim-lint

      which-key-nvim
      lualine-nvim
      fidget-nvim

      mini-nvim
      snacks-nvim

      colorful-menu-nvim
      render-markdown-nvim
      todo-comments-nvim

      oil-nvim
      cord-nvim
      grug-far-nvim
      guess-indent-nvim

      lazydev-nvim
      luasnip
      friendly-snippets

      catppuccin-nvim
      onedarkpro-nvim
      palenight-vim
    ];
  };
  extraBinPath = with pkgs; [
    universal-ctags
    ripgrep
    fzf
    fd

    lua-language-server
    stylua # formatter

    nixd # language-server
    nixfmt

    rust-analyzer # language-server
    rustfmt
    clippy # linter

    clang-tools
    cmake-language-server
    cmake-format
    cmake-lint
    mesonlsp

    basedpyright # language-server
    ruff # formatter & linter

    eslint_d

    bash-language-server
    fish-lsp
    shfmt
    shellcheck # linter
  ];
}
