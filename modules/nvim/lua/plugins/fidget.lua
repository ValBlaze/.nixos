return {
  {
    'fidget.nvim',
    for_cat = 'general',
    event = 'DeferredUIEnter',
    -- keys = "",
    after = function(plugin)
      require('fidget').setup {}
    end,
  },
}
