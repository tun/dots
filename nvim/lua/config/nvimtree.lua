-- [[
-- NvimTree config
-- ]]

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  disable_netrw = true,
  view = {
    width = 25,
    side = "right",
  },
  filters = {
    dotfiles = true,
    exclude = {
      '.github',
      '.gitignore',
      '.nvim.lua'
    }
  },
}

local keymap = vim.keymap

keymap.set('n', '<f3>', ':NvimTreeFindFileToggle<cr>', {})
