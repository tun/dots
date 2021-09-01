--[[
  Plugins
]]--

local fn = vim.fn

local paq_install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
local paq_plugins_path = fn.stdpath('data')..'/site/pack/paqs/start'

if fn.empty(fn.glob(paq_install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/savq/paq-nvim.git '..paq_install_path)
end

vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'
paq 'jiangmiao/auto-pairs' 
paq 'mattn/emmet-vim'
paq 'SirVer/ultisnips'
paq 'honza/vim-snippets'
paq 'tpope/vim-surround'
-- Language support
paq 'sheerun/vim-polyglot'
paq 'slashmili/alchemist.vim'
paq 'tpope/vim-endwise'
paq 'dense-analysis/ale'
-- Git support
paq 'tpope/vim-fugitive'
paq 'mhinz/vim-signify'
-- Colorschemes
paq {'challenger-deep-theme/vim', as="challenger-deep"}
paq 'ghifarit53/tokyonight-vim'
paq 'pineapplegiant/spaceduck'

if fn.empty(fn.glob(paq_plugins_path)) > 0 then
  vim.cmd 'PaqInstall'
end

vim.o.laststatus = 0 
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g['tokyonight_style'] = 'night'
vim.g['tokyonight_enable_italic'] = 1
vim.g['tokyonight_transparent_background'] = 1

vim.cmd("silent! colorscheme tokyonight")

vim.cmd('autocmd BufWritePost $MYVIMRC luafile $MYVIMRC')
vim.cmd('autocmd VimResized * :wincmd =')

vim.opt.runtimepath:append("~/.vim")
