local M = {}
local map = vim.api.nvim_set_keymap

M.default_bindings = function()

	--leader--
	vim.api.nvim_set_keymap('n','<Space>', '<NOP>', {silent = true})
	vim.g.mapleader=' '

	--defaults--
	map('n', '<leader>m', ':bn<CR>', {noremap=true})
	map('n', '<leader>n', ':bp<CR>', {noremap=true})
	map('n', '<leader>h', '<C-w>h', {noremap=true})
	map('n', '<leader>l', '<C-w>l', {noremap=true})
	map('n', '<leader>j', '<C-w>j', {noremap=true})
	map('n', '<leader>k', '<C-w>k', {noremap=true})
	map('v','<leader>y','"+y', {noremap=true})
	map('v', '<leader>p', '"_dP', {noremap=true})
	map('v', '<leader>d', '"_d', {noremap=true})
	map('v', '<leader>y', '"+y', {noremap=true})
	map('n', '<leader>+', ':vertical resize +5<CR>', {noremap=true})
	map('n', '<leader>-', ':vertical resize -5<CR>', {noremap=true})
	map("x", "<M-j>", ":move '>+1<CR>gv-gv", {noremap=true})
	map("x", "<M-k>", ":move '<-2<CR>gv-gv", {noremap=true})
	map("n", "H", "^", {noremap=false})
	map("n", "L", "$", {noremap=false})
	map('n', '<leader>b', ":buffers<CR> :buffer ", {noremap=true})
	map('n', 'Y', 'y$', {noremap=true})
	map('v' ,'<leader>r', '"hy:%s/<C-r>h/<C-r>p/gc', {noremap=true })

	--NvimTree
	map('n', '<C-t>', ':NvimTreeToggle<CR>', {noremap=true})

	--Telescope
	map('n', '<leader>fd', "<cmd>Telescope find_files cwd=~/dotfiles prompt_title=Dotfiles<CR>", {noremap=true})
	map('n', '<C-p>', "<cmd>Telescope git_files<CR>", {noremap=true})
	map('n', '<M-S-p>', "<cmd>Telescope find_files<CR>", {noremap=true})
	map('n', '<C-b>', "<cmd>Telescope buffers<CR>", {noremap=true})
	map('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})
	map('n', '<leader>fp', ":Telescope grep_string search=", {noremap=true})

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

	map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
	map("i", "<S-Tab>", "v:lua.s_tab_complete()", {noremap=true,expr = true})
	map('i', '<CR>', "compe#confirm('<CR>')", {noremap=true,silent=true, expr=true})
	map('i', '<C-Space>', "compe#complete()", {noremap=true,silent=true, expr=true})
	map('i', '<C-e>', "compe#close('<C-e>')", {noremap=true, silent=true, expr=true})

	--QuickfixList
	--TODO: Add a toggle option
	map('n','<C-j>', ':cn <CR>', {noremap=true})
	map('n','<C-k>', ':cp <CR>', {noremap=true})
	map('n','<M-j>', ':lnext <CR>', {noremap=true})
	map('n','<M-k>', ':lprev <CR>', {noremap=true})

	--harpoon
	map("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap=true})
	map("n", "<M-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})
	map("n", "<M-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", {noremap=true})
	map("n", "<M-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", {noremap=true})
	map("n", "<M-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", {noremap=true})
	map("n", "<M-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", {noremap=true})
	map("n", "<M-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", {noremap=true})
	map("n", "<M-t>", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", {noremap=true})

	--terminal
	map("t", "<Esc>", "<C-\\><C-n>", {noremap=true})

	--formatter
	map('n','<leader>=', '<cmd>Format<CR>', {noremap=true})

	--fugitive
	map('n', '<leader>gs', ":vertical G<CR> :vertical resize 30<CR>", {noremap=true})
	map('n', '<leader>gf', ":diffget //2 <CR>", {noremap=true})
	map('n', '<leader>gj', ":diffget //3 <CR>", {noremap=true})

end


--LSP
M.lsp_bindings = function()
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true})
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true})
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true})
	map('n','<M-i>','<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap=true})
	map('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>', {noremap=true})
	map('n','gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap=true})
	map('n','gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap=true})
	map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap=true})
end

return M
