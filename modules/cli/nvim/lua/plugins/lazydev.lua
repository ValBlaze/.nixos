-- NOTE: This must be initiallized globally on startup because it's a blink source
return {
  "lazydev.nvim",
  after = function(_)
    require('lazydev').setup({
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    })
  end
}
