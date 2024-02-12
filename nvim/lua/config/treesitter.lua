require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"elixir",
		"erlang",
		"lua",
		"python"
	},
	sync_install     = true,
	auto_install     = true,
	ignore_install   = {},
	highlight        = {
		enable = true,
		additional_vim_regex_highlighting = true,
		use_languagetree = true
	},
	indent           = {
		enable = true
	},
	matchup          = {
		enable = true
	}
}
