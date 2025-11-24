-- local gruvbox = require('features.ui.gruvbox')

local values = {
  -- available themes:

  -- theme 1
  -- gruvbox-material
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- theme 1
  -- fox
  -- variant values: nightfox, duskfox, nordfox, terafox, carbonfox

  -- everforest
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- everforest-nvim
  -- variant values: 'hard', 'medium'(default), 'soft'

  -- kanagawa
  -- variant values: 'wave', 'dragon'

  theme = {
    name = 'everforest',
    variant = 'hard',
    transparent = false
  },

  lualine = {
    -- auto, kanagawa, gruvbox-material ...
    theme = 'kanagawa',
    transparent = 0 -- 1 or 0
  },

  syntax = {
    pug = false,
    jinja = true,
    astro = false
  },

  servers = {
    emmet_language_server = true,
    html = true,
    cssls = true,
    jsonls = true,
    prismals = true,
    lua_ls = true,
    marksman = false,
    pyright = false,
    pylsp = true,
    tailwindcss = true,
    tsserver = false,
    ts_ls = false,
    volar = true,
    vue_ls = false,
    vtsls = false,
    angularls = true,
    svelte = false
  },

  lint = false
}

return values
