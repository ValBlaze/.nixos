{
  inputs,
  pkgs,
  ...
}:

let
  tree-sitter-comment-queries = pkgs.vimUtils.toVimPlugin (
    pkgs.runCommandLocal "tree-sitter-comment-queries"
      {
        passthru = {
          language = "comment";
          isTreesitterQuery = true;
        };
      }
      ''
        mkdir -p "$out/queries/comment"
        cp -r ${inputs.tree-sitter-comment}/queries/* "$out/queries/comment"
      ''
  );

  tree-sitter-comment =
    (pkgs.tree-sitter.buildGrammar {
      language = "comment";
      version = "custom";
      src = inputs.tree-sitter-comment;
    }).overrideAttrs
      (old: {
        passthru = (old.passthru or { }) // {
          associatedQuery = tree-sitter-comment-queries;
        };
      });

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
      markview-nvim
      todo-comments-nvim

      oil-nvim
      cord-nvim
      grug-far-nvim
      guess-indent-nvim

      lazydev-nvim
      luasnip
      friendly-snippets

      catppuccin-nvim
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
