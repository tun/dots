-- [[
-- Plugins
-- ]]

require('paq') {
	{ 'savq/paq-nvim',                   branch = 'dev' },
	'ibhagwan/fzf-lua',
	'm4xshen/autoclose.nvim',
	'tpope/vim-sleuth',
	'tpope/vim-surround',
	'tpope/vim-eunuch',
	'shellRaining/hlchunk.nvim',
	--
	-- File Explorer
	'nvim-tree/nvim-web-devicons',
	'nvim-tree/nvim-tree.lua',
	--
	-- Snippets
	'dcampos/nvim-snippy',
	'dcampos/cmp-snippy',
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
	'soulis-1256/eagle.nvim',
	--
	-- Completion
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	--
	-- Git support
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	--
	-- Terminal
	'akinsho/toggleterm.nvim',
	--
	-- Colorschemes
	{ 'challenger-deep-theme/vim', as = 'challenger-deep' },
	{ 'pineapplegiant/spaceduck',  branch = 'dev' },
}

-- [[
-- Initialize zero or minimal config plugins
-- ]]
require('autoclose').setup {}
require('eagle').setup {
	mouse_mode = true,
	keyboard_mode = true
}

require('fzf-lua').setup {
	'fzf-vim'
}

require('hlchunk').setup {
	chunk = {
		enable = true
	},
	indent = {
		enable = true
	},
	line_num = {
		enable = true
	}
}

require('trouble').setup {}

-- [[
-- Load legacy vim runtimepath
-- ]]
vim.opt.runtimepath:append('~/.vim')
