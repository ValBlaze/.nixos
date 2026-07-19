vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("basedpyright")
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("mesonlsp")
