
return{
  'nvim-tree/nvim-web-devicons',
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",   -- latte | frappe | macchiato | mocha
        transparent_background = true,
        integrations = {
          lualine = true,
          nvimtree = true,
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
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local nvimtree = require("nvim-tree")
      require("nvim-web-devicons").setup { default = true }
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
      vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
      nvimtree.setup({
		git = {
		  enable = true,
		  ignore = false,
		  show_on_dirs = true,
		  timeout = 500,
		},
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = false,
              git = true,
            },
            glyphs = {
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
            },
          },
        },
		filters = {
  		  dotfiles = false,    -- show dotfiles
  		  git_ignored = false, -- show git-ignored files
  		},
      })
    end,
  },
}
