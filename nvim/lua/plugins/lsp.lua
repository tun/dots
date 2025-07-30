return {
	"neovim/nvim-lspconfig",
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup {
				lightbulb = {
					sign = false
				}
			}
		end,
		keys = {
			{ "<f4>",      ":Lspsaga term_toggle<cr>" },
			{ "[d",        ":Lspsaga diagnostic_jump_prev<cr>" },
			{ "]d",        ":Lspsaga diagnostic_jump_next<cr>" },
			{ "gD",        ":Lspsaga peek_type_definition<cr>" },
			{ "gd",        ":Lspsaga peek_definition<cr>" },
			{ "K",         ":Lspsaga hover_doc<cr>" },
			{ "<space>ca", ":Lspsaga code_action<cr>" },
		}

	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	"soulis-1256/eagle.nvim",
}
