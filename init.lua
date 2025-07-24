-- init.lua
vim = vim or {} 

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require("config.lazy")
require("settings")
require("key_mappings")
