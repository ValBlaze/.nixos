return {
    {
      "blink.cmp",
      event = { "InsertEnter", "CmdlineEnter" },
      before = function()
        LZN.trigger_load('luasnip')
        LZN.trigger_load('lazydev.nvim')
      end,
      after = function()
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
            -- menu = {
            --   draw = {
            --     components = {
            --       kind_icon = {
            --         text = function(ctx)
            --           local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
            --           return kind_icon
            --         end,
            --         -- (optional) use highlights from mini.icons
            --         highlight = function(ctx)
            --           local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            --           return hl
            --         end,
            --       },
            --       kind = {
            --         -- (optional) use highlights from mini.icons
            --         highlight = function(ctx)
            --           local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            --           return hl
            --         end,
            --       }
            --     }
            --   }
            -- }
          },

          snippets = { preset = 'luasnip' },

          cmdline = {
            keymap = {
              -- recommended, as the default keymap will only show and select the next item
              ['<Tab>'] = { 'show', 'accept' },
            },
            completion = {
              menu = {
                auto_show = function(ctx)
                  return vim.fn.getcmdtype() == ':'
                  -- enable for inputs as well, with:
                  or vim.fn.getcmdtype() == '@'
                end,
              },
            }
          };

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
      end
    }
}
