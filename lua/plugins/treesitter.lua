-- lua/plugins/treesitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Enable treesitter highlighting for all filetypes with a parser
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(ev)
          local ok = pcall(vim.treesitter.start)
          if not ok then
            -- No parser for this filetype, fall back to regex highlighting
            vim.bo[ev.buf].syntax = 'on'
          end
        end,
      })
    end,
  },
}
