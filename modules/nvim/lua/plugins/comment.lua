return {
  {
    'comment.nvim',
    for_cat = 'general',
    event = 'DeferredUIEnter',
    after = function(plugin)
      require('Comment').setup()
    end,
  },
}
