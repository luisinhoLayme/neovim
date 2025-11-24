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


-- servers.vue_ls = {
-- 	autoload = has_enabled.vue_ls,
-- 	config = {
-- 		capabilities = capabilities,
-- 		on_attach = lsp_attach,
-- 		flags = lsp_flags,
-- 		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
-- 		-- root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
-- 		settings = {
-- 			vue = {
-- 				-- Generalmente se usa el modo Hybrid (por defecto) o false, si usas ts_ls
-- 				hybridMode = false, -- Asegura que ts_ls tome el control del TS
-- 			}
-- 		}
-- 	},
-- }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  -- location = vue_language_server_path,
	location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
  languages = { 'vue' },
  configNamespace = 'typescript',
}


-- servers.tsserver = {
-- 	autoload = has_enabled.tsserver,
-- 	config = {
-- 		capabilities = capabilities,
-- 		flags = lsp_flags,
-- 		filetypes = {
-- 			"typescript",
-- 			"typescriptreact",
-- 			"typescript.tsx",
-- 			"javascript",
-- 			"javascriptreact",
-- 			"javascript.jsx",
-- 			"vue",
-- 		},
-- 		init_options = {
-- 			plugins = {
-- 				vue_plugin,
-- 			},
-- 		},
-- 		-- root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
-- 		settings = {
--
-- 			javascript = {
-- 				inlayHints = {
-- 					includeInlayEnumMemberValueHints = true,
-- 					includeInlayFunctionLikeReturnTypeHints = true,
-- 					includeInlayFunctionParameterTypeHints = true,
-- 					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
-- 					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
-- 					includeInlayPropertyDeclarationTypeHints = true,
-- 					includeInlayVariableTypeHints = false,
-- 				},
-- 			},
--
-- 			typescript = {
-- 				inlayHints = {
-- 					includeInlayEnumMemberValueHints = true,
-- 					includeInlayFunctionLikeReturnTypeHints = true,
-- 					includeInlayFunctionParameterTypeHints = true,
-- 					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
-- 					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
-- 					includeInlayPropertyDeclarationTypeHints = true,
-- 					includeInlayVariableTypeHints = false,
-- 				},
-- 			},
-- 		},
-- 	},
-- }

-- servers.vtsls = {
-- 	autoload = has_enabled.vtsls,
-- 	config = {
-- 		capabilities = capabilities,
-- 		on_attach = lsp_attach,
-- 		flags = lsp_flags,
-- 		settings = {
-- 			vtsls = {
-- 				tsserver = {
-- 					globalPlugins = {
-- 						vue_plugin,
-- 					},
-- 				},
-- 			},
-- 		},
-- 		filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- 	}
-- }
-- local project_library_path = vim.fn.getcwd() .. "node_modules/typescript/lib" --"/path/to/project/lib"
servers.angularls = {
	autoload = has_enabled.angularls,
  config = {
    capabilities = capabilities,
    -- cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path},
    on_attach = lsp_attach,
		-- filetypes = { "typescript", "ts", "html" },
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular", "angular.html", "jinja.html" },
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

local project_bin = '/home/boy_4/.local/share/pnpm/global/5/node_modules/@vue/language-server/node_modules/.bin/vue-language-server'
local ts_bin = '/home/boy_4/.local/share/pnpm/global/5/node_modules/typescript/lib/'

servers.volar = {
	autoload = has_enabled.volar,
	config = {
    -- cmd = { project_bin, "--stdio" },
		capabilities = capabilities,
		on_attach = lsp_attach,
		flags = lsp_flags,
		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		init_options = {
			vue = {
				hybridMode = false,
			},
			-- typescript = {
			-- 	-- tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
   --      tsdk = ts_bin
			-- },
		},
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
