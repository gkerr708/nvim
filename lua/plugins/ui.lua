
return{
  'nvim-tree/nvim-web-devicons',
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",   -- latte | frappe | macchiato | mocha
        transparent_background = false,
        integrations = {
          lualine = true,
          nvimtree = false,
          telescope = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = "catppuccin",
        component_separators = "|",
        section_separators = "",
      },
    },
  },
  --{
  --  'folke/tokyonight.nvim',
  --  priority = 1000,
  --  config = function()
  --    require('tokyonight').setup({
  --      style = 'night',       -- 'storm' | 'night' | 'moon' | 'day'
  --      transparent = true,
  --      styles = {
  --        sidebars = 'transparent',
  --        floats = 'transparent',
  --      },
  --    })
  --    vim.cmd.colorscheme('tokyonight')
  --  end,
  --},
  --{
  --  'nvim-lualine/lualine.nvim',
  --  opts = {
  --    options = {
  --      icons_enabled = false,
  --      theme = 'tokyonight',
  --      component_separators = '|',
  --      section_separators = '',
  --    },
  --  },
  --},
  --{
  --  'navarasu/onedark.nvim',
  --  priority = 1000,
  --  config = function()
  --    require('onedark').setup {
  --      transparent = true,
  --    }
  --    require('onedark').load()
  --  end,
  --},
  --{
  --  'nvim-lualine/lualine.nvim',
  --  opts = {
  --    options = {
  --      icons_enabled = false,
  --      theme = 'onedark',
  --      component_separators = '|',
  --      section_separators = '',
  --    },
  --  },
  --},
}
