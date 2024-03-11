return {
	"neovim/nvim-lspconfig",
  enabled = true,
	dependencies = {
		{
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "nvimtools/none-ls.nvim",
        -- "jose-elias-alvarez/null-ls.nvim"
      },
		},
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
		},
    "folke/neodev.nvim",
		"williamboman/mason-lspconfig.nvim",
    'princejoogie/tailwind-highlight.nvim',
	},
	event = "VeryLazy",
	config = function()
		require("features.lsp")
	end,
}
