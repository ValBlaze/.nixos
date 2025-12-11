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
            default = { "lsp", "path", "snippets" }
          },

          fuzzy = { implementation = "lua" },

          signature = { enabled = true },
        })
      end
    }
}
