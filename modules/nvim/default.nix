{ pkgs, inputs, ... }:

let
  inherit (inputs.nixCats) utils;
  luaPath = ./.;

  categoryDefinitions =
    {
      pkgs,
      settings,
      categories,
      extra,
      name,
      mkPlugin,
      ...
    }@packageDef:
    {
      # to define and use a new category, simply add a new list to a set here,
      # and later, you will include categoryname = true; in the set you
      # provide when you build the package using this builder function.
      # see :help nixCats.flake.outputs.packageDefinitions for info on that section.

      # lspsAndRuntimeDeps:
      # this section is for dependencies that should be available
      # at RUN TIME for plugins. Will be available to PATH within neovim terminal
      # this includes LSPs
      lspsAndRuntimeDeps = {
        general = with pkgs; [
          universal-ctags
          ripgrep
          fd
        ];

        lua = with pkgs; [
          lua-language-server
          stylua
        ];

        nix = with pkgs; [
          nix-doc
          nixd
          nixfmt
        ];
      };

      # This is for plugins that will load at startup without using packadd:
      startupPlugins = {
        general = with pkgs.vimPlugins; [
          lze
          lzextras
          plenary-nvim
          oil-nvim
          nvim-web-devicons
          mini-icons
          catppuccin-nvim
          nvim-notify
        ];
      };

      # not loaded automatically at startup.
      # use with packadd and an autocommand in config to achieve lazy loading
      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          nvim-lspconfig
          nvim-lint
          conform-nvim
          lazydev-nvim
          which-key-nvim
          comment-nvim
          todo-comments-nvim
          nvim-autopairs
          fidget-nvim
          vim-startuptime
          mini-nvim
          gitsigns-nvim
          vim-fugitive
          vim-rhubarb
          indent-blankline-nvim
          guess-indent-nvim
          noice-nvim
          inc-rename-nvim
        ];

        blink = with pkgs.vimPlugins; [
          luasnip
          cmp-cmdline
          blink-cmp
          blink-compat
          colorful-menu-nvim
        ];

        treesitter = with pkgs.vimPlugins; [
          nvim-treesitter-textobjects
          nvim-treesitter.withAllGrammars
        ];

        telescope = with pkgs.vimPlugins; [
          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          telescope-nvim
        ];
      };

      # shared libraries to be added to LD_LIBRARY_PATH
      # variable available to nvim runtime
      sharedLibraries = {
        general = with pkgs; [
          # libgit2
        ];
      };
    };

  packageDefinitions = {
    nvim =
      { pkgs, name, ... }:
      {
        settings = {
          suffix-path = true;
          suffix-LD = true;

          wrapRc = true;
          configDirName = "nvim";
          hosts.python3.enable = true;
          hosts.node.enable = true;
        };

        categories = {
          general = true;
          blink = true;
          treesitter = true;
          telescope = true;
          lua = true;
          nix = true;
        };

        extra = {
          nixpkgs = ''import ${pkgs.path} {}'';
          nixos_options = ''
            (builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options
          '';
        };
      };
  };
  defaultPackageName = "nvim";
in
{
  perSystem =
    { pkgs, self', ... }:
    let
      nixCatsBuilder = utils.baseBuilder luaPath { inherit pkgs; } categoryDefinitions packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
    in
    {
      packages = utils.mkAllWithDefault defaultPackage;

      devShells.default = pkgs.mkShell {
        name = defaultPackageName;
        packages = [ defaultPackage ];
      };
    };
}
