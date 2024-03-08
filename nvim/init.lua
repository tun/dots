--[[
-- Neovim config
--]]

if vim.loader then
  vim.loader.enable()
end

local paq_install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'

-- Install Paq and all defined packages at first run
if vim.fn.isdirectory(paq_install_path) == 0 then
  vim.api.nvim_command('!git clone https://github.com/savq/paq-nvim.git ' .. paq_install_path)
  vim.cmd('packadd paq-nvim')
  require('plugins')
  vim.cmd('PaqInstall')
else
  -- Load packages and its configurations
  require('plugins')
  require('config')
end

vim.opt.exrc = true
