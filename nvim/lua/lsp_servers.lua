local nvim_lsp = require'lspconfig'
local lsp_config = require"lsp_config"
local data = vim.fn.stdpath('data')


--lua
local lua_dir = data.."/language-servers/sumneko-lua/"
local lua_binary = lua_dir.."/bin/Linux/lua-language-server"

nvim_lsp.sumneko_lua.setup {
    cmd = {lua_binary, "-E", lua_dir .. "/main.lua"},
    on_attach= lsp_config.on_attach_common,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
}


--tsserver
nvim_lsp.tsserver.setup{
    on_attach = lsp_config.on_attach_common
}


--pyright
nvim_lsp.pyright.setup{
    on_attach = lsp_config.on_attach_common
}


--cpp
nvim_lsp.clangd.setup{
    on_attach = lsp_config.on_attach_common
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
