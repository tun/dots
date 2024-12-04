--[[
-- Snippy config
]]--

local snippy = require('snippy')
snippy.setup({
    mappings = {
      i = {
        ['<Tab>'] = 'expand_or_advance',
        ['<S-Tab>'] = 'previous',
      },
    },
  })

-- Insert mode snippy completion mapping - '<Control-s>'
vim.keymap.set("i", "<C-s>", function()
  require('snippy').complete()
end, { silent = true })
