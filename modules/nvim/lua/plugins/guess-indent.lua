return {
  {
    'guess-indent.nvim',
    for_cat = 'general',
    event = 'DeferredUIEnter',
    after = function()
      require('guess-indent').setup {}
    end,
  },
}
