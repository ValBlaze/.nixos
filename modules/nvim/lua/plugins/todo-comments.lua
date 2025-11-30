-- Highlight todo, notes, etc in comments
return {
  'todo-comments.nvim',
  event = 'DeferredUIEnter',
  after = function(plugin)
    require('todo-comments').setup { signs = false }
  end,
}
