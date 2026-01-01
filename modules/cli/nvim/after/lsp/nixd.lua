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
        -- For flake-parts options.
        -- Firstly read the docs here to enable "debugging", exposing declarations for nixd.
        -- https://flake.parts/debug
        flake_parts = {
          expr = '(builtins.getFlake "/home/valblaze/.nixos").debug.options',
        },
        -- For a `perSystem` flake-parts option:
        perSystem = {
          expr = '(builtins.getFlake "/home/valblaze/.nixos").currentSystem.options',
        },
      },
    },
  },
}
