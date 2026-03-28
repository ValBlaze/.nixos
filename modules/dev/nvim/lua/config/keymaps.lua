-- General Keymaps===========================
local function nmap_leader(lhs, rhs, desc)
  vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")

-- Map <C-e>, <C-y> to scroll in insert mode but lose the ability to copy text from the line above/below the cursor
vim.keymap.set("i", "<C-e>", "<C-x><C-e>")
vim.keymap.set("i", "<C-y>", "<C-x><C-y>")

vim.keymap.set("n", "<leader>r", "<Cmd>restart<CR>")
nmap_leader("r", "<Cmd>restart<CR>", "Restart Neovim")

vim.keymap.set(
  { "n", "v" },
  "<leader>y",
  '"+y',
  { desc = "Copy to system clipboard" }
)
vim.keymap.set(
  { "n", "v" },
  "<leader>p",
  '"+p',
  { desc = "Paste from system clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>Y",
  '"+Y',
  { desc = "Copy line to system clipboard" }
)

nmap_leader("ga", "<Cmd>Git diff --cached<CR>", "Added diff")
nmap_leader("gA", "<Cmd>Git diff --cached -- %<CR>", "Added diff buffer")
nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
nmap_leader("gd", "<Cmd>Git diff<CR>", "Diff")
nmap_leader("gD", "<Cmd>Git diff -- %<CR>", "Diff buffer")
nmap_leader("gl", "<Cmd>Git log<CR>", "Log")
nmap_leader("gL", "<Cmd>Git log<CR>", "Log buffer")
nmap_leader("go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle overlay")
nmap_leader("gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", "Show at cursor")

vim.keymap.set(
  "x",
  "gs",
  "<Cmd>lua MiniGit.show_at_cursor()<CR>",
  { desc = "Show at selection" }
)

-- local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'
-- nmap_leader("sd", '<Cmd>lua MiniSessions.select("delete")<CR>', "Delete")
-- nmap_leader("sn", "<Cmd>lua " .. session_new .. "<CR>", "New")
-- nmap_leader("sr", '<Cmd>lua MiniSessions.select("read")<CR>', "Read")
-- nmap_leader("sw", "<Cmd>lua MiniSessions.write()<CR>", "Write current")
