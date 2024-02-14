--[[
-- Gitsigns config
--]]

require('gitsigns').setup {
	signcolumn              = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl                   = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
	current_line_blame      = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
}
