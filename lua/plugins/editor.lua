return {
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
	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					tailwind = true,
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				},
			})
		end,
	},

	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("v", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
  -- rainbow-delimiters
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup").setup({
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					commonlisp = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					latex = "rainbow-blocks",
				},
				highlight = {
					-- "RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
				blacklist = { "c", "cpp" },
			})
		end,
	}
}
