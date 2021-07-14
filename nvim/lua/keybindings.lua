local M = {}

--helper--
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.default_bindings = function()
    --leader--
    map('n','<Space>', '<NOP>', {silent = true})
    vim.g.mapleader=' '


    --defaults--
    map('n', '<leader>m', ':bn<CR>')
    map('n', '<leader>n', ':bp<CR>')
    map('n', '<leader>h', '<C-w>h')
    map('n', '<leader>l', '<C-w>l')
    map('n', '<leader>j', '<C-w>j')
    map('n', '<leader>k', '<C-w>k')
    map('n', '<leader>v', ':wincmd v<CR>')
    map('v','<leader>y','"+y')
    map('v', '<leader>p', '"_dP')
    map('v', '<leader>y', '"+y')
    map('n', '<leader>+', ':res +5<CR>')
    map('n', '<leader>-', ':res -5<CR>')
    map('n', '+', ':vertical resize +5<CR>')
    map('n', '-', ':vertical resize -5<CR>')
    map("x", "<M-j>", ":move '>+1<CR>gv-gv")
    map("x", "<M-k>", ":move '<-2<CR>gv-gv")
    map("n", "H", "^")
    map("n", "L", "$")
    map('v', '<leader>d', '"_d')
    map('n', '<leader>b', ":buffers<CR> :buffer ")


    --NvimTree
    map('n', '<C-t>', ':NvimTreeToggle<CR>')
    map('n', '<C-f>', ':NvimTreeFindFile<CR>')


    --Telescope
    map('n', '<leader>fd', "<cmd>Telescope find_files cwd=~/dotfiles prompt_title=Dotfiles<CR>")
    map('n', '<C-p>', "<cmd>Telescope git_files<CR>")
    map('n', '<M-S-p>', "<cmd>Telescope find_files<CR>")
    map('n', '<C-b>', "<cmd>Telescope buffers<CR>")
    map('n', '<C-h>', "<cmd>Telescope oldfiles<CR>")


    --nvim-compe
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end
    _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-n>"
        -- elseif vim.fn['vsnip#available'](1) == 1 then
        --     return t "<Plug>(vsnip-expand-or-jump)"
        elseif check_back_space() then
            return t "<Tab>"
        else
            return vim.fn['compe#complete']()
        end
    end
    _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-p>"
        -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        --     return t "<Plug>(vsnip-jump-prev)"
        else
            -- If <S-Tab> is not working in your terminal, change it to <C-h>
            return t "<S-Tab>"
        end
    end

    map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    map('i', '<CR>', "compe#confirm('<CR>')", {silent=true, expr=true})
    map('i', '<C-Space>', "compe#complete()", {silent=true, expr=true})
    map('i', '<C-e>', "compe#close('<C-e>')", {silent=true, expr=true})
    map('i', '<C-f>', "compe#scroll({'delta': +4})", {silent=true, expr=true})
    map('i', '<C-d>', "compe#scroll({'delta': -4})", {silent=true, expr=true})


    --QuickfixList
    --TODO: Add a toggle option
    map('n','<C-j>', ':cn <CR>')
    map('n','<C-k>', ':cp <CR>')
    map('n','<M-j>', ':lnext <CR>')
    map('n','<M-k>', ':lprev <CR>')

end


--LSP
M.lsp_bindings = function()
    map('n','gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','<M-i>','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n','gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
end

return M
