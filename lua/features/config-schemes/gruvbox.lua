local values = require('config.values')

vim.cmd([[
      autocmd InsertEnter * highlight  CursorLine guibg=#2C2830
      autocmd InsertLeave * highlight  CursorLine guibg=#202D2A
    ]])

require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = false,
	italic = {
		strings = false,
		comments = true,
		operators = true,
		folds = false,
	},
	strikethrough = true,
	invert_selection = true,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {
		dark0 = "#181818",
		dark1 = "#181818",
		dark2 = "#282A2A", --popup
		-- dark3 = "#928474", -- num left

		light0 = "#d4be98", --
		light1 = "#bdae93", --
		bright_red = "#ea6962", --
		bright_green = "#a9b665", --#AA99BB
		bright_yellow = "#d8a657", --
		bright_blue = "#7daea3", --
		bright_purple = "#d3869b", --
		bright_aqua = "#8ec07c", --
		bright_orange = "#e78a4e", --

		neutral_red = "#ea6962", --
		-- gray = "#928374",
	},
	overrides = {
		SignColumn = { bg = "#1b1b1b" },
		CursorLine = { bg = "#202D2A" },
	},
	dim_inactive = true,
	transparent_mode = values.theme.transparent, -- ...
})
