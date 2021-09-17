local nvim_lsp = require'lspconfig'
local lsp_config = require"lsp_config"
local data = vim.fn.stdpath('data')


--lua
local lua_dir = data.."/language-servers/lua-language-server/"
local lua_binary = lua_dir.."/bin/Linux/lua-language-server"

nvim_lsp.sumneko_lua.setup {
	cmd = {lua_binary, "-E", lua_dir .. "/main.lua"},
	on_attach= lsp_config.on_attach_common,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				globals = {'vim'}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 1000,
				preloadFileSize = 130,
			}
		}
	}
}


--tsserver
nvim_lsp.tsserver.setup{
	on_attach = lsp_config.on_attach_common,
	init_options = {
		formatting = false,
	}
}

--jsonls
require'lspconfig'.jsonls.setup{
	on_attach = lsp_config.on_attach_common,
}


--pyright
nvim_lsp.pyright.setup{
	on_attach = lsp_config.on_attach_common
}


--cpp
nvim_lsp.clangd.setup{
	on_attach = lsp_config.on_attach_common,
	init_options = {
		formatting = false,
	}
}


--html
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup{
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		}
	},
	capabilities = capabilities,
	on_attach = lsp_config.on_attach_common
}


--css
require'lspconfig'.cssls.setup{
	capabilities = capabilities,
	on_attach = lsp_config.on_attach_common
}

--rust-analyzer
require'lspconfig'.rust_analyzer.setup{
	on_attach = lsp_config.on_attach_common
}
