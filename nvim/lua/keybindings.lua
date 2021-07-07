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
    map('n','<leader>m', ':bnext <CR>')
    map('n','<leader>n', ':bprev <CR>')
    map('n', '<M-m>', ':cn<CR>')
    map('n', '<M-n>', ':cp<CR>')
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


    --NvimTree
    map('n', '<C-t>', ':NvimTreeToggle<CR>')
    map('n', '<C-f>', ':NvimTreeFindFile<CR>')


    --Tab Completion
    map('i', "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
    map('i', "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

    --Telescope
    map('n', '<leader>fd', "<cmd>Telescope find_files cwd=~/dotfiles prompt_title=Dotfiles<CR>")
    map('n', '<C-p>', "<cmd>Telescope git_files<CR>")
    map('n', '<M-S-p>', "<cmd>Telescope find_files<CR>")
    map('n', '<C-b>', "<cmd>Telescope buffers<CR>")
end


--LSP
M.lsp_bindings = function()
    map('n','gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','<F5>','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n','g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    -- map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()')
end

return M
