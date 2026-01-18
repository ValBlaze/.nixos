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
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
})
require("mini.misc").setup()
MiniMisc.setup_termbg_sync()

require("mini.sessions").setup({ autoread = true })
