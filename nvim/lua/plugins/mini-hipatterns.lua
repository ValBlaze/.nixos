local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	-- Highlight hex color strings (`#rrggbb`) using that color
	hex_color = hipatterns.gen_highlighter.hex_color(),
})
