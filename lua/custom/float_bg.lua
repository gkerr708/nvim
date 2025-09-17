-- custom/float_bg.lua
vim.opt.termguicolors = true

local groups = { "NormalFloat", "FloatBorder", "LazyNormal", "Pmenu" }

local function clear()
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "NONE" })  -- or: { link = "Normal" }
  end
end

-- apply now (if colorscheme already loaded) and re-apply after any colorscheme change
pcall(clear)
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = function() vim.schedule(clear) end,
})
