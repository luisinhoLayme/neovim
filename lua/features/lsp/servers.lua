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
		filetypes = { "blade", "html", "javascriptreact", "typescriptreact", "svelte" },
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
