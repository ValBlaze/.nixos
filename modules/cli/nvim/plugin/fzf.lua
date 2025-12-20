local fzf = require("fzf-lua")
fzf.setup({
  winopts = {
    preview = {
      default = "bat",
      layout = "horizontal",
    },
  },
})

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map("n", "<leader><space>", fzf.buffers, "[ ] Find Buffers")
map("n", "<leader>sf", fzf.files, "[S]earch [F]iles")
map("n", "<leader>sg", fzf.live_grep, "[S]earch by [G]rep")
map("n", "<leader>sh", fzf.help_tags, "[S]earch [H]elp")
map("n", "<leader>sd", fzf.diagnostics_document, "[S]earch [D]iagnostics")
map("n", "<leader>sr", fzf.resume, "[S]earch [R]esume")
map("n", "<leader>sp", fzf.profiles, "[S]earch Picker [P]rofiles")
map("n", "<leader>s:", fzf.command_history, "[S]earch [:] Command History")
