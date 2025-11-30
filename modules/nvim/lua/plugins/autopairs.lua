return {
  {
    'nvim-autopairs',
    for_cat = 'general',
    event = 'InsertEnter',
    after = function(plugin)
      require('nvim-autopairs').setup()
    end,
  },
}
