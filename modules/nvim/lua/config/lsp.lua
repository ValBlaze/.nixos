require('lze').load {
  {
    'nvim-lspconfig',
    for_cat = 'general',
    on_require = { 'lspconfig' },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,

    before = function(plugin)
      vim.lsp.config('*', {
        on_attach = function(client, bufnr)
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
          end

          local builtin = require 'telescope.builtin'

          nmap('<leader>grn', function()
            return ':IncRename '
          end, '[R]e[n]ame')
          nmap('<leader>gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction')
          nmap('grr', builtin.lsp_references, '[G]oto [R]eferences')
          nmap('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')
          nmap('grd', builtin.lsp_definitions, '[G]oto [D]efinition')
          nmap('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('gO', builtin.lsp_document_symbols, 'Open Document Symbols')
          nmap('gW', builtin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          nmap('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')
        end,
      })
    end,
  },
  {
    'lazydev.nvim',
    for_cat = 'general',
    cmd = { 'LazyDev' },
    ft = 'lua',
    after = function(_) -- yes, the underscore is necessary
      require('lazydev').setup {
        library = {
          { words = { 'nixCats' }, path = (nixCats.nixCatsPath or '') .. '/lua' },
        },
      }
    end,
  },
  {
    'lua_ls',
    enabled = true,
    lsp = {
      -- if you include a filetype, it doesnt call lspconfig for the list of filetypes (faster)
      filetypes = { 'lua' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          formatters = {
            ignoreComments = true,
          },
          signatureHelp = { enabled = true },
          diagnostics = {
            disable = { 'missing-fields' },
          },
          telemetry = { enabled = false },
        },
      },
    },
  },
  {
    'nixd',
    enabled = true,
    lsp = {
      filetypes = { 'nix' },
      settings = {
        nixd = {
          nixpkgs = {
            expr = nixCats.extra 'nixpkgs',
          },
          options = {
            nixos = {
              expr = nixCats.extra 'nixos_options',
            },
          },
          formatting = {
            command = { 'nixfmt' },
          },
          diagnostic = {
            suppress = {
              'sema-escaping-with',
            },
          },
        },
      },
    },
  },
}
