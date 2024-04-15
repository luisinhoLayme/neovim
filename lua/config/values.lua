
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

  -- catppuccin

  theme = {
    name = 'gruvbox-material',
    variant = 'hard',
    transparent = true
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
    lua_ls = true,
    marksman = false,
    pyright = false,
    pylsp = true,
    tailwindcss = true,
    tsserver = true,
    volar = false,
    svelte = false
  },

  lint = false
}

return values
