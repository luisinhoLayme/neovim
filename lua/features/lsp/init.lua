-- LSP configuration
require("features.lsp.mason")

local lspconfig = require("lspconfig")
local langs = require("features.lsp.langs")


for server, setup in pairs(langs) do
	lspconfig[server].setup(setup())
end

-- lspconfig.biome.setup{}
require("features.lsp.none-ls")
