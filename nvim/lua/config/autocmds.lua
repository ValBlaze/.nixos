-- See `:h lua-guide-autocommands`

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
-- vim.api.nvim_create_autocmd("FileType", {
-- 	desc = "Proper 'formatoptions'",
-- 	callback = function()
-- 		vim.cmd("setlocal formatoptions-=c formatoptions-=o")
-- 	end,
-- })
