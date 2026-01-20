---@diagnostic disable: undefined-field
require("snacks")
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "snacks_picker_list", "snacks_picker_input" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    symbols = {
      unnamed = "[Scratch Buffer]",
      alternate_file = "#",
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", icon = "" } },
    lualine_c = {
      {
        "filename",
        path = 1,
        status = true,
      },
      "diagnostics",
    },
    lualine_x = {
      Snacks.profiler.status(),
			-- stylua: ignore
			{
				require("noice").api.status.message.get_hl,
        cond = require("noice").api.status.message.has,
			},
			-- stylua: ignore
			{
				require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = Snacks.util.color("Constant") },
			},
      "lsp_status",
    },
    lualine_y = { "diff", "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      "filename",
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        filetype_names = {
          oil = "Oil",
          snacks_picker_input = "Snacks Picker",
          snacks_picker_list = "Snacks Picker",
          fzf = "FZF",
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
      },
    },
    lualine_z = { { "tabs", symbols = { modified = "" } } },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = { "quickfix", "oil", "trouble", "man" },
})
