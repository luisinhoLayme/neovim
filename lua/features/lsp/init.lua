-- LSP configuration
require("features.lsp.mason")

local lspconfig = require("lspconfig")
local langs = require("features.lsp.servers")

for name, srv in pairs(langs) do
  if srv.autoload then
    lspconfig[name].setup(srv.config)
  end
end

-- lspconfig.biome.setup{}
require("features.lsp.none-ls")
