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

vim.o.conceallevel = 2
vim.o.cmdheight = 0
vim.o.foldlevelstart = 99
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes" -- Reduce flicker
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.virtualedit = "block"
vim.o.winborder = "single"
vim.opt.shortmess:append("sI") -- disable nvim intro
