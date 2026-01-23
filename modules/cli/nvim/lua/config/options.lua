-- For all options see `:help option-list`

-- General ==================
vim.o.confirm = true
vim.o.mouse = "a"
vim.o.switchbuf = "usetab"
vim.o.undofile = true

-- UI =======================
vim.o.breakindent = true
vim.o.breakindentopt = "shift:1"
-- vim.o.colorcolumn = "+1"
vim.o.linebreak = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.shortmess = "CFOSWaco"
vim.o.showmode = false
vim.o.signcolumn = "yes" -- less flicker
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.winborder = "rounded"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editing ==================
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
