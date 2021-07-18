local M = {}

M.default_bindings = function()
    --leader--
    vim.api.nvim_set_keymap('n','<Space>', '<NOP>', {silent = true})
    vim.g.mapleader=' '

    --defaults--
    vim.api.nvim_set_keymap('n', '<leader>m', ':bn<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>n', ':bp<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap=true})
    vim.api.nvim_set_keymap('v','<leader>y','"+y', {noremap=true})
    vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', {noremap=true})
    vim.api.nvim_set_keymap('v', '<leader>d', '"_d', {noremap=true})
    vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>+', ':res +5<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>-', ':res -5<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '+', ':vertical resize +5<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '-', ':vertical resize -5<CR>', {noremap=true})
    vim.api.nvim_set_keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", {noremap=true})
    vim.api.nvim_set_keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", {noremap=true})
    vim.api.nvim_set_keymap("n", "H", "^", {noremap=false})
    vim.api.nvim_set_keymap("n", "L", "$", {noremap=false})
    vim.api.nvim_set_keymap('n', '<leader>b', ":buffers<CR> :buffer ", {noremap=true})
	vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap=true})

    --NvimTree
    vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', {noremap=true})

    --Telescope
    vim.api.nvim_set_keymap('n', '<leader>fd', "<cmd>Telescope find_files cwd=~/dotfiles prompt_title=Dotfiles<CR>", {noremap=true})
    vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>Telescope git_files<CR>", {noremap=true})
    vim.api.nvim_set_keymap('n', '<M-S-p>', "<cmd>Telescope find_files<CR>", {noremap=true})
    vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>Telescope buffers<CR>", {noremap=true})
    vim.api.nvim_set_keymap('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})

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
        elseif check_back_space() then
            return t "<Tab>"
        else
            return vim.fn['compe#complete']()
        end
    end
    _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-p>"
        else
            return t "<S-Tab>"
        end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {noremap=true,expr = true})
    vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", {noremap=true,silent=true, expr=true})
    vim.api.nvim_set_keymap('i', '<C-Space>', "compe#complete()", {noremap=true,silent=true, expr=true})
    vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", {noremap=true, silent=true, expr=true})

    --QuickfixList
    --TODO: Add a toggle option
    vim.api.nvim_set_keymap('n','<C-j>', ':cn <CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','<C-k>', ':cp <CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','<M-j>', ':lnext <CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','<M-k>', ':lprev <CR>', {noremap=true})

    --harpoon
    vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "<M-t>", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", {noremap=true})

    --terminal
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap=true})

    --formatter
    vim.api.nvim_set_keymap('n','<leader>=', '<cmd>Format<CR>', {noremap=true})

end


--LSP
M.lsp_bindings = function()
    vim.api.nvim_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','<M-i>','<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n','gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap=true})
    vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap=true})
end

return M
