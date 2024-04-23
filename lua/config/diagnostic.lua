vim.diagnostic.config({
	virtual_text = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#392B2B", fg = "#c4746e" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "#39382B", fg = "#c4b28a" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "", fg = "#c4b28a" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "", fg = "#c4746e" })
-- vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "#2B3934", fg = "#68AD99" })

vim.api.nvim_set_hl(0, "lualine_c_diagnostics_error_normal", { fg = "#c4746e", bg = "#282727" })
vim.api.nvim_set_hl(0, "lualine_c_diagnostics_warn_normal", { fg = "#c4b28a", bg = "#282727"})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { bg = "#392B2B" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { bg = "#39382B" })
vim.api.nvim_set_hl(0, "NotfyWARNBorder", { bg = "none" })


vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "#8ba4b0", fg = "#181616", bold = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#343E43" })
