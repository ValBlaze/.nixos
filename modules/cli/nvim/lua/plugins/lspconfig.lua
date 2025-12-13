return {
  "nvim-lspconfig",
  event = "DeferredUIEnter",
  -- before = function()
  --   LZN.trigger_load('blink.cmp')
  -- end,
  after = function()
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.enable('lua_ls')
  end
}
