return {
	"brenoprata10/nvim-highlight-colors",
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true
				},
				indent = {
					enable = true
				},
				line_num = {
					enable = true
				}
			})
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
				signcolumn              = true,
				numhl                   = true,
				linehl                  = false,
				word_diff               = false,
				current_line_blame      = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "right_align", -- "eol" | "overlay" | "right_align"
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
			}
		end
	},
	-- Syntax
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "OXY2DEV/markview.nvim" },
		lazy = false,
	},
	--
	-- Colorschemes
	{ "challenger-deep-theme/vim", name = "challenger-deep" },
	{ "pineapplegiant/spaceduck",  branch = "dev" },
	"folke/tokyonight.nvim",
	"tiagovla/tokyodark.nvim",
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	"rebelot/kanagawa.nvim",
	"Shatur/neovim-ayu",
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"maxmx03/fluoromachine.nvim",
		config = function()
			require("fluoromachine").setup {
				glow = true,
				theme = "retrowave"
			}
		end
	},
	"nyoom-engineering/oxocarbon.nvim",
	"metalelf0/black-metal-theme-neovim", -- bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
}
