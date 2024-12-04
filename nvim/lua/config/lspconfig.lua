-- [[
-- LSP Configuration
-- ]]

-- Diagnostic
vim.diagnostic.config({
	virtual_text = true
})

local lspconfig = require('lspconfig')
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
-- lspconfig.lua_ls.setup {}
lspconfig.lua_ls.setup {
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				}
			}
		}
	}

}

-- Bash
lspconfig.bashls.setup {}

-- Elixir
local elixirls_path = vim.fn.glob('~/.asdf/installs/elixir-ls/0.23.0/language_server.sh')

lspconfig.elixirls.setup {
	cmd = { elixirls_path },
	capabilities = lsp_capabilities
}

-- Gleam
lspconfig.gleam.setup {}

-- Python
lspconfig.ruff.setup {
	-- capabilities = lsp_capabilities,
	on_attach = function(client)
		if client.name == 'ruff' then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end
}

lspconfig.pyright.setup {
	capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities),
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { '*' },
			},
		},
	}
}

-- Ruby / rubocop
lspconfig.rubocop.setup {}
lspconfig.ruby_lsp.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist)
vim.keymap.set('n', '<space>d', ':Trouble diagnostics toggle filter.buf=0<cr>')
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- [[
-- LSPsaga
-- ]]

require('lspsaga').setup {
	lightbulb = {
		sign = false
	}
}

vim.keymap.set('n', '<f4>', ':Lspsaga term_toggle<cr>')

vim.keymap.set('n', '[d', ':Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', ']d', ':Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', 'gD', ':Lspsaga peek_type_definition<cr>')
vim.keymap.set('n', 'gd', ':Lspsaga peek_definition<cr>')
vim.keymap.set({ 'n', 'v' }, 'K', ':Lspsaga hover_doc<cr>')
vim.keymap.set('n', '<space>ca', ':Lspsaga code_action<cr>')
