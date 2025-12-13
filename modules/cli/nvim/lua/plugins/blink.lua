return {
    {
      "blink.cmp",
      event = "DeferredUIEnter",
      -- before = function()
      --   LZN.trigger_load('lazydev.nvim')
      -- end,
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
      end
    }
}
