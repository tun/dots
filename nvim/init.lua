--[[
-- Neovim config
--]]

if vim.loader then
  vim.loader.enable()
end

vim.g.maplocalleader = " "

require("config")

vim.opt.exrc = true
