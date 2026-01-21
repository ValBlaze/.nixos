-- local function project_path()
--   local buf = vim.api.nvim_get_current_buf()
--   local file = vim.api.nvim_buf_get_name(buf)
--   if file == "" then
--     return ""
--   end
--
--   local root
--   local symbol = ""
--
--   local clients = vim.lsp.get_clients({ bufnr = buf })
--   if #clients > 0 and clients[1].config.root_dir then
--     root = clients[1].config.root_dir
--     symbol = "󰒋 "
--   end
--
--   if not root then
--     local git = vim.fs.find(".git", {
--       path = vim.fs.dirname(file),
--       upward = true,
--     })[1]
--     if git then
--       root = vim.fs.dirname(git)
--       symbol = " "
--     end
--   end
--
--   if not root then
--     root = vim.fn.getcwd()
--     symbol = " "
--   end
--
--   local rel = vim.fn.fnamemodify(file, ":." .. root)
--   if rel == file then
--     return vim.fn.fnamemodify(file, ":t")
--   end
--
--   local root_name = vim.fn.fnamemodify(root, ":t")
--   return symbol .. root_name .. "/" .. rel
-- end

---@diagnostic disable: undefined-field
require("snacks")
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "snacks_picker_list", "snacks_picker_input" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", icon = "" } },
    lualine_c = { "diagnostics", { "filename", path = 1, shorting_target = 0 } },
    lualine_x = {
      Snacks.profiler.status(),
      "filetype",
    },
    lualine_y = { "diff", "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1, shorting_target = 0 } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { "tabs" },
    lualine_z = {},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = { "quickfix", "oil", "trouble", "man" },
})
