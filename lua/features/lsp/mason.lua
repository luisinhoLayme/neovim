local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local langs = require "features.lsp.servers"
local lspconfig = require "lspconfig"

mason.setup()

local mason_servers = {}

for server, _ in pairs(langs) do
  local cmd = lspconfig[server].document_config.default_config.cmd[1]
  if vim.fn.executable(cmd) == 0 then
    table.insert(mason_servers, server)
  end
end

mason_lspconfig.setup {
  ensure_installed = mason_servers,
}
