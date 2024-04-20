return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
    local icon = require('features.ui.icons')
    local values = require('config.values')
    local colors = require('features.ui.colors')

    local kanagawa = function ()
      local kanagawa = require('lualine.themes.kanagawa')

      if values.lualine.theme == 'kanagawa' then
        kanagawa.insert.a.bg = colors.dragonPink
        kanagawa.normal.b.fg = colors.crystalBlue
        if values.theme.transparent then
          kanagawa.normal.c.bg = 'none'
          kanagawa.normal.b.bg = 'none'
          kanagawa.insert.b.bg = 'none'
        else
          kanagawa.normal.b.bg = colors.dragonBlack5
        end
      end
      return kanagawa
    end

		local colors = {
			fg1 = "#282828",
			color2 = "#504945",
			fg2 = "#ddc7a1",
			purple = "#BE94F9",
			color4 = "#a89984",
			blue = "#7daea3",
			green = "#a9b665",
			yellow = "#d8a657",
			color = "#d3869b",
			red = "#ea6962",
		}
		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				--┃│█          

				-- "", --  '' '' '' '' '' '' '▐'  '  '  ""
				-- '  '  '', '󰆣'    "☰ " "" " "  " "
				component_separators = { left = "⁝", right = "⁝" }, -- 
				section_separators = { left = "", right = "" },
				theme = values.lualine.theme == 'kanagawa' and kanagawa or values.lualine.theme,
        -- fmt = string.upper
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {{ "mode", icon = " " }},
				lualine_b = {{
          'filename',
          icon = icon.fs.File,
          -- separator = { right = '', color = "" },
          symbols = { modified = "󰆣" },
          color = { gui = 'bold' }
        }},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {{ "location", icon = icon.misc.Location }},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {'filename'},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- ins_left({
		-- 	"filename",
  --     -- "",
  --     icon = icon.fs.File,
		-- 	color = { fg = colors.yellow, bg = "#ffffff", gui = "bold" },
		-- 	symbols = {
		-- 		modified = "",
		-- 	},
		-- })

    -- ins_left { 'progress', padding = {left = 0, right = 1}, color = { fg = colors.fg, gui = 'bold' } }

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", hint = " ", warn = " ", info = " " },
		})

    -- ins_right {
    --   'fileformat',
		  -- symbols = {
		  --   unix = '', -- e712
		  --   dos = '',  -- e70f
		  --   mac = '',  -- e711
		  -- },
    --   fmt = string.upper,
    --   icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    --   color = { fg = colors.blue, gui = 'bold' },
    -- }
		ins_right {
		  'filetype',
		  icon_only = false,
      -- fmt = string.upper, -- I'm not sure why it's upper case either ;)
      color = { gui = 'italic' },
      -- padding = { left = 1, right = 0}, -- We don't need space before this
		}
		ins_right({
			"diff",
			symbols = { added = " ", modified = "  ", removed = " " },
			-- symbols = { added = ' ', modified = "󰝤 " | '柳 ', removed = ' ' },
		})

		ins_right({
			"branch",
			icon = icon.custom.Octoface .. ' ',
			color = { fg = colors.purple, gui = "bold" },
		})

		require("lualine").setup(config)
	end,
}






-- local default_sep_icons = {
--   default = { left = "", right = "" },
--   round = { left = "", right = "" },
--   block = { left = "█", right = "█" },
--   arrow = { left = "", right = "" },
-- }
--
--  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
--   local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
--   local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
--   local branch_name = "  " .. git_status.head
--
-- local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
--   round = { left = "", right = "" },
--   block = { left = "█", right = "█" },
-- local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }



