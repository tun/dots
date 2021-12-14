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

require "paq" {
  "savq/paq-nvim";
  "junegunn/fzf";
  "junegunn/fzf.vim";
  "vimwiki/vimwiki";
  "jiangmiao/auto-pairs";
  "mattn/emmet-vim";
  "dcampos/nvim-snippy";
  "honza/vim-snippets";
  "tpope/vim-commentary";
  "tpope/vim-surround";
  -- Language support
  "sheerun/vim-polyglot";
  "mcfiredrill/vim-liquidsoap";
  "slashmili/alchemist.vim";
  "tpope/vim-endwise";
  "dense-analysis/ale";
  -- Git support
  "tpope/vim-fugitive";
  "mhinz/vim-signify";
  -- Colorschemes
  {"challenger-deep-theme/vim", as="challenger-deep"};
  "ghifarit53/tokyonight-vim";
  "pineapplegiant/spaceduck";

}

local snippy = require("snippy")
snippy.setup({
    mappings = {
      is = {
        ["<Tab>"] = "expand_or_advance",
        ["<S-Tab>"] = "previous",
      },
      nx = {
        ["<leader>x"] = "cut_text",
      },
    },
  })


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
