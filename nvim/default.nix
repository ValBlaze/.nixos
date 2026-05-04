{
  flake.wrappers.neovim =
    {
      pkgs,
      config,
      wlib,
      lib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.neovim ];

      settings.config_directory = "/home/valblaze/.nixos/nvim";

      specs.general = {
        data = with pkgs.vimPlugins; [
          nvim-lspconfig
          blink-cmp
          conform-nvim
          nvim-lint
          plenary-nvim
          which-key-nvim
          lualine-nvim
          fidget-nvim
          mini-nvim
          snacks-nvim
          nvim-treesitter.withAllGrammars
          colorful-menu-nvim
          colorizer
          oil-nvim
          cord-nvim
        ];

        extraPackages = with pkgs; [
          ripgrep
          fzf
          fd
          universal-ctags
          wl-clipboard
        ];
      };

      specs.diagnostics = with pkgs.vimPlugins; [
        trouble-nvim
        tiny-inline-diagnostic-nvim
        todo-comments-nvim
      ];

      specs.snippets = with pkgs.vimPlugins; [
        luasnip
        friendly-snippets
      ];

      specs.colorschemes = with pkgs.vimPlugins; [
        catppuccin-nvim
        onedarkpro-nvim
        palenight-vim
      ];

      specs.lua = {
        data = with pkgs.vimPlugins; [
          lazydev-nvim
        ];
        extraPackages = with pkgs; [
          lua-language-server # language-server
          stylua # formatter
        ];
      };

      specs.nix = {
        data = null;
        extraPackages = with pkgs; [
          nixd # language-server
          nixfmt # formatter
        ];
      };

      specs.rust = {
        data = null;
        extraPackages = with pkgs; [
          rust-analyzer # language-server
          rustfmt # formatter
          clippy # linter
        ];
      };

      specs.c = {
        data = with pkgs.vimPlugins; [
          cmake-tools-nvim
        ];
        extraPackages = with pkgs; [
          clang-tools
          cmake-language-server
          cmake-format
          cmake-lint
          mesonlsp
        ];
      };

      specs.python = {
        data = null;
        extraPackages = with pkgs; [
          basedpyright # language-server
          ruff # formatter & linter
        ];
      };

      specs.typescript = {
        data = null;
        extraPackages = with pkgs; [
          eslint_d # linter
        ];
      };

      specs.shell = {
        data = null;
        extraPackages = with pkgs; [
          bash-language-server # language-server
          shfmt # formatter
          shellcheck # linter
        ];
      };

      specMods = {
        options.extraPackages = lib.mkOption {
          type = lib.types.listOf wlib.types.stringable;
          default = [ ];
          description = "an extraPackages spec field to put packages to suffix to the PATH";
        };
      };

      extraPackages = config.specCollect (acc: v: acc ++ (v.extraPackages or [ ])) [ ];
    };
}
