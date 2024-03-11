
require("telescope").setup({
	defaults = {
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { " " },
		},
	},
})
-- -                        '─',
-- -                        '│',
-- -                        '─',
-- -                        '│',
-- -                        '┌',
-- -                        '┐',
-- -                        ' ┘',
-- -                        '└',
require("features.telescope.mapings")

require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("themes")
