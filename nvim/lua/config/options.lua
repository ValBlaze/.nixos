-- For all options see `:help option-list`.
-- Options may be overwritten by Neovim's built-in filetype-plugins.

-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used).
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.confirm = true
vim.o.undofile = true
vim.o.timeoutlen = 300
vim.o.updatetime = 250 -- Long CursorHold timeout is annoying

vim.o.tabstop = 4 -- NOTE: May be overwritten by Neovim's built-in filetype-plugins
vim.o.shiftwidth = 0
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.showbreak = " ↳ "

vim.o.ignorecase = true
vim.o.infercase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

vim.o.cmdheight = 0
vim.o.foldlevelstart = 99
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.number = true
vim.o.numberwidth = 3
vim.o.signcolumn = "yes:1" -- Reduce flicker
vim.o.list = true
vim.opt.listchars = { tab = "› ", trail = "·", nbsp = "␣" }
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.virtualedit = "block"
vim.o.winborder = "none"
vim.opt.shortmess:append("sI") -- disable nvim intro

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"
	vim.g.neovide_padding_top = 8
	vim.g.neovide_padding_bottom = 8
	vim.g.neovide_padding_right = 8
	vim.g.neovide_padding_left = 8
end
