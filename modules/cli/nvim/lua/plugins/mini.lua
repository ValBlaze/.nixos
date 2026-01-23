-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()

require("mini.git").setup()
require("mini.diff").setup()

require("mini.cursorword").setup()

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
})
require("mini.misc").setup()
MiniMisc.setup_auto_root()
MiniMisc.setup_restore_cursor()
-- MiniMisc.setup_termbg_sync()

-- Session management. A thin wrapper around `:h mksession` that consistently
-- manages session files. Example usage:
-- - `<Leader>sn` - start new session
-- - `<Leader>sr` - read previously started session
-- - `<Leader>sd` - delete previously started session
-- require("mini.sessions").setup()
--
-- local miniclue = require("mini.clue")
-- miniclue.setup({
--   triggers = {
--     -- Leader triggers
--     { mode = { "n", "x" }, keys = "<Leader>" },
--
--     -- `[` and `]` keys
--     { mode = "n", keys = "[" },
--     { mode = "n", keys = "]" },
--
--     -- Built-in completion
--     { mode = "i", keys = "<C-x>" },
--
--     -- `g` key
--     { mode = { "n", "x" }, keys = "g" },
--
--     -- Marks
--     { mode = { "n", "x" }, keys = "'" },
--     { mode = { "n", "x" }, keys = "`" },
--
--     -- Registers
--     { mode = { "n", "x" }, keys = '"' },
--     { mode = { "i", "c" }, keys = "<C-r>" },
--
--     -- Window commands
--     { mode = "n", keys = "<C-w>" },
--
--     -- `z` key
--     { mode = { "n", "x" }, keys = "z" },
--   },
--
--   clues = {
--     -- Enhance this by adding descriptions for <Leader> mapping groups
--     miniclue.gen_clues.square_brackets(),
--     miniclue.gen_clues.builtin_completion(),
--     miniclue.gen_clues.g(),
--     miniclue.gen_clues.marks(),
--     miniclue.gen_clues.registers(),
--     miniclue.gen_clues.windows(),
--     miniclue.gen_clues.z(),
--   },
-- })
