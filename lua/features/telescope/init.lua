
require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
		layout_config = {
			horizontal = {
				prompt_position = "top",
      }
		},
		-- borderchars = {
		-- 	-- prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
		-- 	prompt = { " ", " ", "─", " ", "", "", " ", " " },
		-- 	results = { " " },
		-- 	preview = { " " },
		-- },
    file_ignore_patterns = { "node_modules", "venv" },
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
-- require("telescope").load_extension("themes")
