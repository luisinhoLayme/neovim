local lsp_attach = require("features.lsp.attach")
local values = require("config.values")
local has_enabled = values.servers

local lsp_flags = {
	debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default = {
	capabilities = capabilities,
	on_attach = lsp_attach,
	flags = lsp_flags,
}

local servers = {}

servers.emmet_language_server = {
	autoload = has_enabled.emmet_language_server,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		filetypes = {
			"css",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"pug",
			"typescriptreact",
			"vue",
      "angular"
		},
	},
}

servers.html = {
	autoload = has_enabled.html,
	config = default,
}
servers.cssls = {
	autoload = has_enabled.cssls,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	},
}
servers.jsonls = {
	autoload = has_enabled.jsonls,
	config = default,
}
servers.prismals = {
	autoload = has_enabled.prismals,
	config = default,
}
servers.lua_ls = {
	autoload = has_enabled.lua_ls,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				-- workspace = {
				--   library = vim.api.nvim_get_runtime_file("", true),
				--   checkThirdParty = false,
				-- },
				telemetry = {
					enable = false,
				},
				hint = {
					enable = false,
				},
			},
		},
	},
}
servers.marksman = {
	autoload = has_enabled.marksman,
	config = default,
}
servers.volar = {
	autoload = has_enabled.volar,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		init_options = {
			vue = {
				hybridMode = false,
			},
			typescript = {
				-- Global install of typescript
				--tsdk = '~/.nvm/versions/node/v20.11.1/lib/node_modules/typescript',
				-- Current project version and what I will likely use
				tsdk = vim.fn.getcwd() .. "node_modules/typescript/lib",
			},
		},
	},
}
-- local project_library_path = "/path/to/project/lib"
servers.angularls = {
	autoload = has_enabled.angularls,
  config = {
    capabilities = capabilities,
    -- cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path},
    on_attach = lsp_attach,
		-- filetypes = { "typescript", "ts", "html" },
		flags = lsp_flags
  }
}
servers.pyright = {
	autoload = has_enabled.pyright,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
	},
}
servers.pylsp = {
	autoload = has_enabled.pylsp,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
	},
}
servers.tailwindcss = {
	autoload = has_enabled.tailwindcss,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		filetypes = { "blade", "html", "javascriptreact", "jade", "volar", "typescriptreact", "svelte", "pug", "vue" },
	},
}
servers.tsserver = {
	autoload = has_enabled.tsserver,
	config = {
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
}

return servers
