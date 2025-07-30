return {
	{ dir = "~/.vim" },
	"tpope/vim-eunuch",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	"tpope/vim-endwise",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader><cr>",
				"<cmd>FzfLua git_files<cr>",
				desc = "FZF files tracked in git"
			},
			{
				"<leader>g",
				"<cmd>FzfLua git_diff<cr>",
				desc = "FZF modified files tracked"
			},
			{
				"<leader>f",
				"<cmd>FzfLua files<cr>",
				desc = "FZF current project files"
			},
			{
				"<leader>c",
				"<cmd>FzfLua colorschemes<cr>",
				desc = "FZF files tracked in git"
			},
			{
				"<cr>",
				"<cmd>FzfLua buffers<cr>",
				desc = "FZF buffers"
			},
		}
	},
	-- Git support
	"tpope/vim-fugitive",
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require('toggleterm').setup {
				size = function(term)
					if term.direction == 'horizontal' then
						return 15
					elseif term.direction == 'vertical' then
						return vim.o.columns * 0.3
					end
				end,
				direction = 'vertical',
				open_mapping = [[<f1>]]
			}
		end,
		keys = {
			{
				"<f2>",
				"<cmd>:ToggleTerm direction=horizontal<cr>"
			}
		}
	}
}
