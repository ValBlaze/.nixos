-- For all options see `:help option-list`

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

-- General --
vim.o.confirm = true
vim.o.mouse = "a"
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250 -- Long CursorHold timeout is annoying

-- UI --
vim.o.breakindent = true
vim.o.inccommand = "split"
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showbreak = " ↳ "
vim.o.showmode = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.winborder = "solid"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editing --
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.formatoptions = "rqnl1j" -- Improve comment editing
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.spelloptions = "camel" -- Treat camelCase word parts as separate words
vim.o.virtualedit = "block"

vim.o.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
