-- [[
-- UI settings
-- ]]

-- Disable statusline
vim.o.laststatus = 0

-- Fold
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99

-- Resize window splits when terminal is resized
vim.cmd('autocmd VimResized * :wincmd =')

-- Colorscheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd('silent! colorscheme spaceduck')
