local data = vim.fn.stdpath('data')
local lsp_lua = data.."/lspinstall/lua/sumneko-lua/extension/server"
local lsp_binary = lsp_lua.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {lsp_binary, "-E", lsp_lua .. "/main.lua"},
    on_attach= require'completion'.on_attach,
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


