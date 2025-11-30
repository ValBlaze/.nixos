return {
  {
    'inc-rename.nvim',
    for_cat = 'general',
    event = 'DeferredUIEnter',
    after = function(plugin)
      require('inc_rename').setup {}
    end,
  },
}
