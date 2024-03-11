local g = vim.g                       -- global variables
local cmd = vim.cmd                   -- execute Vim commands
local values = require('config.theme')

-- local opt = vim.opt

-- opt.termguicolors = true      -- enable 24-bit RGB colors
 -- let g:gruvbox_material_colors_override = {'bg0': ['#181818', '234'], 'bg2': ['#202020', '235']}
cmd [[
 let g:gruvbox_material_colors_override = {'bg0': ['#202020', '234'], 'bg2': ['#282828', '235'] }
]]

 g.gruvbox_material_background = values.theme.variant
 g.gruvbox_material_better_performance = 1
 g.gruvbox_material_foreground = 'material'  --"`'material'`, `'mix'`, `'original'`
 g.gruvbox_material_enable_bold = 1 --"function name bold `1`
 g.gruvbox_material_enable_italic = 1
 g.gruvbox_material_disable_italic_comment = 0
 g.gruvbox_material_transparent_background = 0 --"default `0` `1`bg `2`bg & status
 g.gruvbox_material_visual = 'reverse' --"Available values:   `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'reverse'`
g.gruvbox_material_menu_selection_background = 'orange' --  `'grey'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
 g.gruvbox_material_ui_contrast = 'high' --" high, low
 g.gruvbox_material_diagnostic_text_highlight = 1
 g.gruvbox_material_diagnostic_virtual_text = 'colored'
 g.gruvbox_material_current_word = 'grey background' --" `grey background`, `underline` `italic` `bold`
-- g.gruvbox_material_sign_column_background = 'none' -- `'none'`, `'grey'`
g.gruvbox_material_spell_foreground = 'colored' -- `'none'`, `'colored'`
