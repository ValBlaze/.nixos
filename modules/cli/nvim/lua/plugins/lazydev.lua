return {
  "lazydev.nvim",
  ft = 'lua',
  after = function(_)
    require('lazydev').setup({
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    })
  end
}
