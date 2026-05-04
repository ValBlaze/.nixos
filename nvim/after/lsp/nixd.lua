---@type vim.lsp.Config
return {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import (builtins.getFlake "/home/valblaze/.nixos").inputs.nixpkgs { }',
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/home/valblaze/.nixos").nixosConfigurations."nixos-laptop".options',
        },
      },
      diagnostic = {
        suppress = { "sema-extra-with", "sema-unused-def-lambda-noarg-formal" },
      },
    },
  },
}
