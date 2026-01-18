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

-- local statusline = require("mini.statusline")
-- statusline.setup({
--   -- Content of statusline as functions which return statusline string. See
--   -- `:h statusline` and code of default contents (used instead of `nil`).
--   content = {
--     -- Content for active window
--     active = nil,
--     -- Content for inactive window(s)
--     inactive = nil,
--   },
--
--   -- Whether to use icons by default
--   use_icons = true,
-- })
--
-- ---@diagnostic disable-next-line: duplicate-set-field
-- statusline.section_location = function()
--   return "%2l:%-2v"
-- end

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
})
