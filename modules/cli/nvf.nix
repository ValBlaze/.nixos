{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;

    options = {
      shiftwidth = 4;
      tabstop = 4;
    };

    lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;

      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    # This section does not include a comprehensive list of available language modules.
    # To list all available language module options, please visit the nvf manual.
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      nix.enable = true;
      markdown.enable = true;
      assembly.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      sql.enable = true;
      csharp.enable = true;
      java.enable = true;
      kotlin.enable = true;
      ts.enable = true;
      ruby.enable = true;
      go.enable = true;
      lua.enable = true;
      haskell.enable = false;
      zig.enable = true;
      python.enable = true;
      rust.enable = true;
      tailwind.enable = true;
      svelte.enable = true;
      nim.enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      cellular-automaton.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      rainbow-delimiters.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
      transparent = true;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts = {
        keymap.preset = "default";
      };
    };

    snippets.luasnip.enable = true;

    hideSearchHighlight = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    };

    minimap = {
      codewindow.enable = true;
    };

    dashboard = {
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    undoFile.enable = true;

    utility = {
      ccc.enable = true;
      diffview-nvim.enable = true;
      icon-picker.enable = true;
      surround.enable = true;
      leetcode-nvim.enable = true;
      multicursors.enable = true;
      smart-splits.enable = true;
      sleuth.enable = true;
      undotree.enable = true;
      nvim-biscuits.enable = true;
      nix-develop.enable = true;

      motion = {
        leap.enable = false;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = false;
      };
    };

    notes = {
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      nvim-ufo.enable = false;
      colorizer.enable = true;
      illuminate.enable = true;
      noice = {
        enable = false;
        setupOpts = {
          presets.command_palette = false;
        };
      };
      breadcrumbs = {
        enable = false;
        navbuddy.enable = false;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = true;
    };
  };
}
