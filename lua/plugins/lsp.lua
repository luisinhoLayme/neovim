local values = require('config.values')

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
    "mfussenegger/nvim-lint"
	},
	event = "VeryLazy",
	config = function()
		require("features.lsp")
    if values.linter then
      require('lint').linters_by_ft = {
        typescript = {'eslint_d',},
        javascript = {'eslint_d',},
        javascriptreact = {'eslint_d',},
        typescriptreact = {'eslint_d',}
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
	end,
}
