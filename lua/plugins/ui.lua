return{
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'iceberg_dark',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },
  --{
  --  "catppuccin/nvim",
  --  name = "catppuccin",
  --  priority = 1000,
  --  config = function()
  --    require("catppuccin").setup({
  --      flavour = "macchiato",   -- latte | frappe | macchiato | mocha
  --      transparent_background = true,
  --      integrations = {
  --        lualine = true,
  --        nvimtree = false,
  --        telescope = true,
  --      },
  --    })
  --    vim.cmd.colorscheme("catppuccin")
  --  end,
  --},
  --{
  --  'folke/tokyonight.nvim',
  --  priority = 1000,
  --  config = function()
  --    require('tokyonight').setup({
  --      style = 'night',       -- 'storm' | 'night' | 'moon' | 'day'

  --      integrations = {
  --        lualine = true,
  --        nvimtree = false,
  --        telescope = true,
  --      },

  --      transparent = true,
  --      styles = {
  --        sidebars = 'transparent',
  --        floats = 'transparent',
  --      },
  --    })
  --    vim.cmd.colorscheme('tokyonight')
  --  end,
  --},
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        transparent = true,
      }
      require('onedark').load()
    end,
  },
}
