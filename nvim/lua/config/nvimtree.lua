--[[
-- NvimTree config
]]--

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  disable_netrw = true,
  view = {
    width = 35,
    side = "right",
  },
  filters = {
    dotfiles = true,
  },
}

local keymap = vim.keymap

keymap.set('n', '<Leader>t', ':NvimTreeToggle<cr>', {})
