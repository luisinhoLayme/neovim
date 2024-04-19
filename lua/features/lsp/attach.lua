local tw_highlight = require("tailwind-highlight")

return function(client, bufnr)
  -- keymaps for lsp
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Help information of symbol under the cursor" })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "LSP Rename symbol under cursor" })
  vim.keymap.set("n", "<leader>vo", ":LspRestart<cr>", { noremap = true, desc = "LSP Restart Server" })

  vim.keymap.set("n", "<leader>vf", function()
    return vim.lsp.buf.format {
      async = true,
      filter = function(cli)
        return cli.name ~= "lua_ls"
      end,
    }
  end, { buffer = 0, desc = "LSP format file" })


  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end

	-- client.server_capabilities.semanticTokensProvider = nil

	-- require("tailwindcss-colors").buf_attach(bufnr)
	tw_highlight.setup(client, bufnr, {
		single_column = false,
		mode = "background",
		debounce = 200,
	})
end
