-- [[
-- UI settings
-- ]]

-- Disable statusline
vim.o.laststatus = 0
--
-- Diagnostic
vim.diagnostic.config({
	virtual_text = false
})
--
-- Fold
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 2
--
-- Resize window splits when terminal is resized
vim.cmd('autocmd VimResized * :wincmd =')
--
-- Colorscheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('silent! colorscheme spaceduck')
