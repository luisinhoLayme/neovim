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
    -- Ejemplo para configurar el filetype (puedes agregarlo a tu configuración de Treesitter o a un plugin de Angular)
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = { "*.html", "*.html" },
        callback = function()
            -- 1. Asignar un filetype específico
            vim.bo.filetype = "angular.html"
            -- 2. Asegurar que Treesitter use el parser 'angular' para este buffer
            -- Esto a veces es necesario en configuraciones manuales si el paso 1 no es suficiente
            require('nvim-treesitter').start(nil, "angular")
        end,
    })
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
      additional_languages = function(filetype)
          if filetype == 'angular.html' then
              return { 'angular' } -- Usa el parser de 'angular'
          end
      end,
    })
	end,
}
