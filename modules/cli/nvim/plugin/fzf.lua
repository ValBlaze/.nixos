local fzf = require("fzf-lua")

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map("n", "<leader>sh", fzf.help_tags, "[S]earch [H]elp")
map("n", "<leader>sk", fzf.keymaps, "[S]earch [K]eymaps")
map("n", "<leader>sf", fzf.files, "[S]earch [F]iles")
map("n", "<leader>ss", fzf.builtin, "[S]earch [S]elect Picker")
map("n", "<leader>sg", fzf.live_grep, "[S]earch by [G]rep")
map("n", "<leader>sd", fzf.diagnostics_document, "[S]earch [D]iagnostics")
map("n", "<leader>sr", fzf.resume, "[S]earch [R]esume")
map("n", "<leader>sz", fzf.zoxide, "[S]earch by [Z]oxide")
map("n", "<leader>s.", fzf.oldfiles, '[S]earch Recent Files ("." for repeat)')
map("n", "<leader>s:", fzf.command_history, '[S]earch Cmd History (":" for cmd)')
map("n", "<leader><space>", fzf.buffers, "[ ] Find Buffers")

fzf.register_ui_select()
fzf.setup({
  defaults = {
    cwd_prompt = false,
  },
  winopts = {
    preview = {
      layout = "flex",
      flip_columns = 80,
    },
  },
})
