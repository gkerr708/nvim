-- lua/plugins/treesitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
<<<<<<< HEAD
    branch = 'master',
||||||| 0edc77e
=======
    lazy = false,
>>>>>>> refs/remotes/origin/main
    build = ':TSUpdate',
<<<<<<< HEAD
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html',
        'lua', 'luadoc', 'markdown', 'markdown_inline', 'query',
        'vim', 'vimdoc', 'yaml', 'json', 'javascript', 'typescript',
        'css', 'scss', 'tsx', 'python', 'go', 'rust', 'r', 'rnoweb', 'yaml'},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
||||||| 0edc77e
    main = 'nvim-treesitter', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html',
        'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 
        'vim', 'vimdoc', 'yaml', 'json', 'javascript', 'typescript', 
        'css', 'scss', 'tsx', 'python', 'go', 'rust', 'r', 'rnoweb', 'latex', 'yaml' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
=======
    config = function()
      require('nvim-treesitter').setup()
>>>>>>> refs/remotes/origin/main

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
