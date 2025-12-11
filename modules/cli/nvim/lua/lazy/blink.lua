return {
    {
      "blink.cmp",
      event = "DeferredUIEnter",
      after = function()
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
            default = { "lsp", "path", "snippets", "buffer" }
          },

          fuzzy = { implementation = "prefer_rust_with_warning" },

          signature = { enabled = true },
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
        capabilities = vim.tbl_deep_extend('force', capabilities, {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        })
      end
    }
}
