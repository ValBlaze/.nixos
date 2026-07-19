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

      settings.config_directory = "/home/valblaze/.nixos/modules/dev/nvim"; # impure

      specs = {
        general = {
          data = with pkgs.vimPlugins; [
            nvim-lspconfig
            blink-cmp
            conform-nvim
            nvim-lint

            which-key-nvim
            lualine-nvim
            fidget-nvim

            mini-nvim
            snacks-nvim

            nvim-treesitter.withAllGrammars
            colorful-menu-nvim

            oil-nvim
            cord-nvim

            grug-far-nvim
          ];

          extraPackages = with pkgs; [
            ripgrep
            fzf
            fd
            universal-ctags
            wl-clipboard
          ];
        };

        diagnostics = with pkgs.vimPlugins; [
          trouble-nvim
          tiny-inline-diagnostic-nvim
          todo-comments-nvim
        ];

        snippets = with pkgs.vimPlugins; [
          luasnip
          friendly-snippets
        ];

        colorschemes = with pkgs.vimPlugins; [
          catppuccin-nvim
          onedarkpro-nvim
          palenight-vim
        ];

        lua = {
          data = with pkgs.vimPlugins; [
            lazydev-nvim
          ];
          extraPackages = with pkgs; [
            lua-language-server # language-server
            stylua # formatter
          ];
        };

        nix = {
          data = null;
          extraPackages = with pkgs; [
            nixd # language-server
            nixfmt # formatter
          ];
        };

        rust = {
          data = null;
          extraPackages = with pkgs; [
            rust-analyzer # language-server
            rustfmt # formatter
            clippy # linter
          ];
        };

        c = {
          data = null;
          extraPackages = with pkgs; [
            clang-tools
            cmake-language-server
            cmake-format
            cmake-lint
            mesonlsp
          ];
        };

        python = {
          data = null;
          extraPackages = with pkgs; [
            basedpyright # language-server
            ruff # formatter & linter
          ];
        };

        typescript = {
          data = null;
          extraPackages = with pkgs; [
            eslint_d # linter
          ];
        };

        shell = {
          data = null;
          extraPackages = with pkgs; [
            bash-language-server # language-server
            shfmt # formatter
            shellcheck # linter
          ];
        };
      };

      specMods = {
        options.extraPackages = lib.mkOption {
          type = lib.types.listOf wlib.types.stringable;
          default = [ ];
          description = "an extraPackages spec field to put packages to suffix to the PATH";
        };
      };

      runtimePkgs = config.specCollect (acc: v: acc ++ (v.extraPackages or [ ])) [ ];
    };
}
