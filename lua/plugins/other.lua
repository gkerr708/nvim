-- lua/plugins/other.lua
return {
  { 'folke/which-key.nvim', opts = {} },

  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },

  { 'numToStr/Comment.nvim', opts = {} },

}
