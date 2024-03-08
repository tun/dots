-- [[
-- Plugins
-- ]]

require('paq') {
	{ 'savq/paq-nvim',                   branch = 'dev' },
	'junegunn/fzf',
	'junegunn/fzf.vim',
	'ibhagwan/fzf-lua',
	'jiangmiao/auto-pairs',
	'tpope/vim-commentary',
	'tpope/vim-sleuth',
	'tpope/vim-surround',
	'tpope/vim-eunuch',
	'lukas-reineke/indent-blankline.nvim',
	--
	-- File Explorer
	'kyazdani42/nvim-web-devicons',
	'kyazdani42/nvim-tree.lua',
	--
	-- Snippets
	'dcampos/nvim-snippy',
	'honza/vim-snippets',
	--
	-- Language support
	'andymass/vim-matchup',
	'tpope/vim-endwise',
	'sheerun/vim-polyglot',
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	--
	-- LSP
	'folke/trouble.nvim',
	'neovim/nvim-lspconfig',
	'nvimdev/lspsaga.nvim',
	--
	-- Git support
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	--
	-- Terminal
	'akinsho/toggleterm.nvim',
	--
	-- Colorschemes
	'akinsho/horizon.nvim',
	'maxmx03/fluoromachine.nvim',
	'tiagovla/tokyodark.nvim',
	{ 'challenger-deep-theme/vim', as = 'challenger-deep' },
	{ 'pineapplegiant/spaceduck',  branch = 'dev' },
}

-- [[
-- Initialize zero config plugins
-- ]]
require('ibl').setup {}

-- [[
-- Load legacy vim runtimepath
-- ]]
vim.opt.runtimepath:append('~/.vim')
