---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
  keymap = {
    -- :help ins-completion
    preset = "default",
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      draw = {
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },

  snippets = { preset = "luasnip" },

  cmdline = {
    keymap = {
      -- recommended, as the default keymap will only show and select the next item
      ["<Tab>"] = { "show", "accept" },
    },
    completion = {
      menu = {
        ---@diagnostic disable-next-line: unused-local
        auto_show = function(ctx)
          return vim.fn.getcmdtype() == ":"
            -- enable for inputs as well, with:
            or vim.fn.getcmdtype() == "@"
        end,
      },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer", "lazydev" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },

  signature = { enabled = true },
})
