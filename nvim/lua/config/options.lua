-- For all options see `:help option-list`

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.o.confirm = true
vim.o.cursorbind = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.linebreak = true
vim.o.list = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.scrolloff = 4
vim.o.shiftwidth = 4 -- common indent width
vim.o.showmode = false -- already in status line
vim.o.signcolumn = "yes" -- avoid flicker
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300 -- default is too long
vim.o.undofile = true
vim.o.updatetime = 250 -- affects nohlsearch plugin
vim.o.virtualedit = "block"
vim.o.winborder = "solid"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
