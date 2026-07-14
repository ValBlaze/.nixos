require("blink.cmp").setup({
	signature = { enabled = true },
	snippets = { preset = "luasnip" },

	cmdline = {
		keymap = { preset = "inherit" }, -- Seems like a more reasonable default
		completion = { menu = { auto_show = true } },
	},

	keymap = {
		-- Unbound by default
		["<C-b>"] = { "scroll_signature_up", "fallback" },
		["<C-f>"] = { "scroll_signature_down", "fallback" },
	},

	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		keyword = { range = "full" },
		menu = {
			draw = {
				-- We don't need label_description now because label and label_description are already combined together in label by colorful-menu.nvim.
				columns = { { "kind_icon" }, { "label", gap = 1 } },

				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},

	-- Blink's default sources: { 'lsp', 'path', 'snippets', 'buffer' }
	-- Use :BlinkCmp status to view which source providers are enabled.
	sources = {
		per_filetype = {
			lua = {
				inherit_defaults = true,
				"lazydev",
			},
		},

		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- Prefer lazydev over lua_ls when both provide the same completion
				score_offset = 100,
			},
		},
	},
})
