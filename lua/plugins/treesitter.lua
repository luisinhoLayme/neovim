return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
    { "m-demare/hlargs.nvim",
      enabled = true,
      config = function()
        require('hlargs').setup{
          color = '#7daea3'
        }
      end
    }
  },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				-- "css",
				-- "go",
				-- "gomod",
				"html",
        "python",
				"latex",
        "prisma",
				"commonlisp",
				"regex",
				"javascript",
				"json",
				"lua",
				"tsx",
				"markdown",
				"markdown_inline",
				-- "nix",
				-- "org",
				-- "php",
				-- "phpdoc",
				-- "rust",
				-- "sql",
				-- "svelte",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = { "org" },
        additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
        disable= {"html", "astro"}
			},
			autotag = {
				enable = true,
				-- filetypes = { "html" , "xml" },
			},
		})
	end,
}
