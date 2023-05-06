--[[
-- Neovim config
--]]

local paq_install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'

-- Install Paq and all defined packages at first run
if vim.fn.isdirectory(paq_install_path) == 0 then
  vim.api.nvim_command('!git clone https://github.com/savq/paq-nvim.git ' .. paq_install_path)
  vim.cmd 'packadd paq-nvim'
  require('plugins')
  vim.cmd 'PaqInstall'
else
  -- Load packages and its configurations
  require('plugins')
  require('config')
end

-- Load shared vim config
vim.opt.runtimepath:append('~/.vim')

-- [[
-- Loads .nvim.lua file
-- ]]
local nvimrc = vim.fn.glob('~/.nvim.lua')

if vim.fn.filereadable(nvimrc) == 1 then
  vim.cmd('luafile ' .. nvimrc)
end
