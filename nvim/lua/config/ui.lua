-- [[
-- UI settings
-- ]]

-- Disable statusline
vim.o.laststatus = 0

-- Colorscheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g['tokyonight_style'] = 'night'
vim.g['tokyonight_transparent'] = 1
vim.cmd('silent! colorscheme tokyonight-night')

-- Resize window splits when terminal is resized
vim.cmd('autocmd VimResized * :wincmd =')

