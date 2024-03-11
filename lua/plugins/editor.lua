return {
	-- neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				popup_border_style = "rounded", --rounded
				window = {
					position = "right",
					width = 30,
				},
				default_component_configs = {
					indent = {},
				},
			})
		end,
	},
	--web-tools
	--{
	--	"ray-x/web-tools.nvim",
	--	config = function()
	--		require("web-tools").setup({
	--			keymaps = {
	--				rename = nil, -- by default use same setup of lspconfig
	--				repeat_rename = ".", -- . to repeat
	--			},
	--		})
	--	end,
	--},

	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<leader><leader>t", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
			-- { "<leader><leader>tw", "<cmd>Trouble workspace_diagnostics<cr>",
			-- desc = "Trouble toggle workspace" }
		},
		config = function()
			require("trouble").setup({})
		end,
	},
	-- indent hlchunk
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = "❯",
					},
					style = "#6C865A",
				},
				line_num = {
					enable = false,
				},
				indent = {
					chars = { "▏" }, -- ▏ │ │, "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/

					-- style = {
					-- 	"#3B3A3C",
					-- },
				},
			})
		end,
	},
	-- fzf
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5", -- or , branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"andrew-george/telescope-themes",
		},
		config = function()
			require("features.telescope")
		end,
	},
	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" }, -- ┆
				},
			})
		end,
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	-- optional for icon support
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		{ "junegunn/fzf", build = "./install --bin" },
	-- 	},
	-- 	config = function()
	-- 		-- calling `setup` is optional for customization
	-- 		require("fzf-lua").setup({ "fzf-vim" }) -- max-perf = desactiva icons
	-- 	end,
	-- }
}
