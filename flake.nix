{
  description = "ValBlaze's NixOS environment.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    import-tree.url = "github:denful/import-tree";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wrappers = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tree-sitter-comment = {
      url = "github:OXY2DEV/tree-sitter-comment";
      flake = false;
    };
  };

  outputs =
    inputs@{ nixpkgs, wrappers, ... }:
    let
      inherit (nixpkgs) lib;
      systems = [
        # TODO: explore systems flake as an alternative
        "x86_64-linux"
      ];
      forAllSystems =
        f:
        lib.genAttrs systems (
          system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
          }
        );
    in
    {
      nixosConfigurations = {
        nixtop = lib.nixosSystem {
          modules = [ ./hosts/nixtop ];
          specialArgs = { inherit inputs; };
        };
        lapnix = lib.nixosSystem {
          modules = [ ./hosts/lapnix ];
          specialArgs = { inherit inputs; };
        };
      };

      packages = forAllSystems (
        { pkgs }: {
          neovim = wrappers.lib.evalPackage (
            {
              config,
              lib,
              wlib,
              pkgs,
              ...
            }:
            let
              tree-sitter-comment = pkgs.vimUtils.buildVimPlugin {
                name = "tree-sitter-comment";
                version = "custom";
                src = inputs.self.tree-sitter-comment;
              };
              allGrammars = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
              filteredGrammars = builtins.filter (p: p.pname != "tree-sitter-comment") allGrammars;
            in
            {
              pkgs = wrappers.inputs.nixpkgs.legacyPackages.x86_64-linux;
              imports = [ wlib.wrapperModules.neovim ];

              settings.config_directory = "/home/valblaze/.nixos/nvim"; # impure

              specs = {
                general = {
                  data = with pkgs.vimPlugins; [
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

                    oil-nvim
                    cord-nvim
                    grug-far-nvim
                    guess-indent-nvim
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
            }
          );
          davinci-resolve-studio = pkgs.callPackage ./packages/davinci-resolve-studio.nix { };
        }
      );
    };
}
