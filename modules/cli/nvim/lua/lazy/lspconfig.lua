return {
  "nvim-lspconfig",
  event = "DeferredUIEnter",
  before = function()
    LZN.trigger_load("blink.cmp")
  end,
}
