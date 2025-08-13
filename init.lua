-- init.lua
vim = vim or {} 

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


-- LSP compat shim for plugins still calling vim.lsp.buf_get_clients()
--@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf_get_clients = function(bufnr)
  return vim.lsp.get_clients({ bufnr = bufnr })
end

require("config.lazy")
require("settings")
require("key_mappings")
