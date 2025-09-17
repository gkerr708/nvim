-- custom/float_bg.lua
vim.opt.termguicolors = true

local border_color = "#89b4fa"

local groups = { "NormalFloat", "FloatBorder", "LazyNormal", "Pmenu" }

local function clear()
  -- Transparent background for floating windows and popup menus
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "NONE" })  -- or: { link = "Normal" }
  end

  --- Borders for LSP windows
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_color, bg = "NONE" })

  -- transparent float titles
  vim.api.nvim_set_hl(0, "FloatTitle",  { bg = "NONE", fg = border_color })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = border_color })
  vim.api.nvim_set_hl(0, "FloatTitle",  { bg = "NONE", fg = border_color, bold = true })

end

-- apply now (if colorscheme already loaded) and re-apply after any colorscheme change
pcall(clear)
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function() vim.schedule(clear) end,
})
