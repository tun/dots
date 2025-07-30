--[[
-- TreeSitter config
--]]

require "nvim-treesitter.configs".setup {
	ensure_installed = {
		"bash",
		"elixir",
		"erlang",
		"go",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"ruby"
	},
	sync_install     = true,
	auto_install     = true,
	ignore_install   = {},
	highlight        = {
		enable = true,
		additional_vim_regex_highlighting = false,
		use_languagetree = true
	},
	indent           = {
		enable = true
	},
	matchup          = {
		enable = true
	}
}
