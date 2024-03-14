local lsp_attach = require "features.lsp.attach"

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default = function()
  return {
    capabilities = capabilities,
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
end


return {
  ["emmet_language_server"] = function()
    return {
      capabilities = capabilities,
      on_attach = lsp_attach,
      flags = lsp_flags,
      filetypes = { "css", "eruby", "html", "htmldjango", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "vue" },
    }
  end,
  -- ["biome"] = default,
  ["html"] = default,
  ["cssls"] = function()
    return {
      capabilities = capabilities,
      on_attach = lsp_attach,
      flags = lsp_flags,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = 'ignore'
          }
        }
      }
    }
  end,
  ["jsonls"] = default,
  ["lua_ls"] = function()
    return {
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
          }
        },
      },
    }
  end,
  ["marksman"] = default,
  ["pyright"] = function ()
    return {
      capabilities = capabilities,
      on_attach = lsp_attach,
      flags = lsp_flags,
    }
  end,
  -- ["volar"] = default,
  -- ["svelte"] = default,
  ["tailwindcss"] = function()
    return {
      capabilities = capabilities,
      on_attach = lsp_attach,
      flags = lsp_flags,
      filetypes = { "blade", "html", "javascriptreact", "typescriptreact", "svelte" },
    }
  end,
  ["tsserver"] = function()
    return {
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
    }
  end,
}
