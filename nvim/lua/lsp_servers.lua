local nvim_lsp = require'lspconfig'
local lsp_config = require"lsp_config"
local data = vim.fn.stdpath('data')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


--lua
local lua_dir = data.."/language-servers/lua-language-server"
local lua_binary = lua_dir.."/bin/lua-language-server"

nvim_lsp.sumneko_lua.setup {
	cmd = {lua_binary, "-E", lua_dir .. "/main.lua"},
	capabilities = cmp_capabilities,
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
	capabilities = cmp_capabilities,
	init_options = {
		formatting = false,
	}
}

--cpp
nvim_lsp.clangd.setup{
	on_attach = lsp_config.on_attach_common,
	capabilities = cmp_capabilities,
	init_options = {
		formatting = false,
	}
}

--html
nvim_lsp.html.setup{
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		}
	},
	capabilities = cmp_capabilities,
	on_attach = lsp_config.on_attach_common
}

--css
nvim_lsp.cssls.setup{
	capabilities = cmp_capabilities,
	on_attach = lsp_config.on_attach_common
}
-- nvim_lsp.tailwindcss.setup{}

--go, rust, python, json
local servers = {"rust_analyzer", "pyright", "jsonls", "solc"}
for _, lsp in pairs(servers) do
	nvim_lsp[lsp].setup {
		capabilities = cmp_capabilities,
		on_attach = lsp_config.on_attach_common,
	}
end
