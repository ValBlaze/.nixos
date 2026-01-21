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
require("mini.sessions").setup()

-- Start screen. This is what is shown when you open Neovim like `nvim`.
-- Example usage:
-- - Type prefix keys to limit available candidates
-- - Navigate down/up with `<C-n>` and `<C-p>`
-- - Press `<CR>` to select an entry
--
-- See also:
-- - `:h MiniStarter-example-config` - non-default config examples
-- - `:h MiniStarter-lifecycle` - how to work with Starter buffer
require("mini.starter").setup()

-- Statusline. Sets `:h 'statusline'` to show more info in a line below window.
-- Example usage:
-- - Left most section indicates current mode (text + highlighting).
-- - Second from left section shows "developer info": Git, diff, diagnostics, LSP.
-- - Center section shows the name of displayed buffer.
-- - Second to right section shows more buffer info.
-- - Right most section shows current cursor coordinates and search results.
--
-- See also:
-- - `:h MiniStatusline-example-content` - example of default content. Use it to
--   configure a custom statusline by setting `config.content.active` function.
-- require("mini.statusline").setup()
-- local active_statusline = function()
--   local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
--   local git = MiniStatusline.section_git({ trunc_width = 40 })
--   local diff = MiniStatusline.section_diff({ trunc_width = 75 })
--   local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
--   local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
--   local filename = MiniStatusline.section_filename({ trunc_width = 140 })
--   local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
--   local location = MiniStatusline.section_location({ trunc_width = 75 })
--   local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
--
--   return MiniStatusline.combine_groups({
--     { hl = mode_hl, strings = { mode } },
--     {
--       hl = "MiniStatuslineDevinfo",
--       strings = { git, diff, diagnostics },
--     },
--     "%<", -- Mark general truncate point
--     { hl = "MiniStatuslineFilename", strings = { filename } },
--     "%=", -- End left alignment
--     { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
--     { hl = mode_hl, strings = { search, location } },
--   })
-- end
-- MiniStatusline.config.content.active = active_statusline
