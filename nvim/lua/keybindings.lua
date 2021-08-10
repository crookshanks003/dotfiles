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
	map("", "H", "^", {noremap=false})
	map("", "L", "$", {noremap=false})
	map('n', '<leader>b', ":buffers<CR> :buffer ", {noremap=true})
	map('n', 'Y', 'y$', {noremap=true})
	map('n', '<C-x>', ':bd<CR>', {noremap=true})
	map('v' ,'<C-r>', '"hy:lua require"keybindings".search_replace()<CR>', {noremap=true })

	--NvimTree
	map('n', '<C-t>', ':NvimTreeToggle<CR>', {noremap=true})

	--Telescope
	map('n', '<leader>fd', "<cmd>Telescope find_files cwd=~/dotfiles prompt_title=Dotfiles<CR>", {noremap=true})
	map('n', '<C-p>', "<cmd>Telescope git_files<CR>", {noremap=true})
	map('n', '<M-S-p>', "<cmd>Telescope find_files<CR>", {noremap=true})
	map('n', '<C-b>', "<cmd>Telescope buffers<CR>", {noremap=true})
	map('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})
	map('n', '<C-f>', ":Telescope grep_string search=", {noremap=true})

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
		elseif vim.fn['vsnip#available'](1) == 1 then
			return t "<Plug>(vsnip-expand-or-jump)"
		elseif check_back_space() then
			return t "<Tab>"
		else
			return vim.fn['compe#complete']()
		end
	end
	_G.s_tab_complete = function()
		if vim.fn.pumvisible() == 1 then
			return t "<C-p>"
		elseif vim.fn['vsnip#jumpable'](-1) == 1 then
			return t "<Plug>(vsnip-jump-prev)"
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
	map('n','<C-j>', ':cn <CR>', {noremap=true})
	map('n','<C-k>', ':cp <CR>', {noremap=true})
	map('n','<M-j>', ':lnext <CR>', {noremap=true})
	map('n','<M-k>', ':lprev <CR>', {noremap=true})
	map('n','<C-q>', ':lua require"keybindings".toggle_Qf_list(1)<CR>', {noremap=true})

	--Buffers
	map('n', '<A-1>', ':BufferGoto 1<CR>', {noremap=true, silent=true})
	map('n', '<A-2>', ':BufferGoto 2<CR>', {noremap=true, silent=true})
	map('n', '<A-3>', ':BufferGoto 3<CR>', {noremap=true, silent=true})
	map('n', '<A-4>', ':BufferGoto 4<CR>', {noremap=true, silent=true})
	map('n', '<A-5>', ':BufferGoto 5<CR>', {noremap=true, silent=true})
	map('n', '<A-6>', ':BufferGoto 6<CR>', {noremap=true, silent=true})
	map('n', '<A-7>', ':BufferGoto 7<CR>', {noremap=true, silent=true})
	map('n', '<A-8>', ':BufferGoto 8<CR>', {noremap=true, silent=true})
	map('n', '<A-9>', ':BufferGoto 9<CR>', {noremap=true, silent=true})
	map('n', '<A-0>', ':BufferLast<CR>', {noremap=true, silent=true})

	--terminal
	map("t", "<Esc>", "<C-\\><C-n>", {noremap=true})

	--formatter
	map('n','<leader>=', '<cmd>Format<CR>', {noremap=true})

	--fugitive
	map('n', '<leader>gs', ":vertical G<CR> :vertical resize 30<CR>", {noremap=true})
	map('n', '<leader>gf', ":diffget //2 <CR>", {noremap=true})
	map('n', '<leader>gh', ":diffget //3 <CR>", {noremap=true})

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

M.search_replace = function()
	local select = vim.fn.getreg("h")
	vim.fn.inputsave()
	local input = vim.fn.input("Replace "..select.." with: ")
	vim.fn.inputrestore()
	if input == "" then
		return
	end
	vim.cmd("%s/"..select.."/"..input.."/gc")
end

_G.qf_g = 0

M.toggle_Qf_list = function(global)
	if global == 1 then
		if qf_g ~= 0 then
			_G.qf_g = 0
			vim.cmd("cclose")
		else
			_G.qf_g = 1
			vim.cmd("copen")
		end
	end
end

return M
