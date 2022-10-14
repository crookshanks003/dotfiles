local M = {}

local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

M.default_bindings = function()

	--leader--
	vim.api.nvim_set_keymap('n','<Space>', '<NOP>', {silent = true})
	vim.g.mapleader=' '

	--defaults--
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

	--QuickfixList
	map('n','<C-j>', ':cn <CR>', {noremap=true})
	map('n','<C-k>', ':cp <CR>', {noremap=true})
	map('n','<M-j>', ':lnext <CR>', {noremap=true})
	map('n','<M-k>', ':lprev <CR>', {noremap=true})
	map('n','<C-q>', ':lua require"keybindings".toggle_Qf_list()<CR>', {noremap=true})

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
	map('n', '<leader>b', ":BufferPick<CR>", {noremap=true})

	map('n', '<C-x>', ':BufferClose<CR>', {noremap=true})
	map('n', '<leader><tab>', ':BufferPrevious<CR>', {noremap=true, silent=true})
	map('n', '<tab>', ':BufferNext<CR>', {noremap=true, silent=true})
	map('n', '<M-h>', ':BufferMovePrevious<CR>', {noremap=true, silent=true})
	map('n', '<M-l>', ' :BufferMoveNext<CR>', {noremap=true, silent=true})

	--terminal
	map("t", "<Esc>", "<C-\\><C-n>", {noremap=true})

	--formatter
	map('n','<leader>=', '<cmd>Format<CR>', {noremap=true})

	--fugitive
	map('n', '<leader>gs', ":vertical G<CR> :vertical resize 30<CR>", {noremap=true})
	map("n", '<leader>gb', ":Git blame<CR>", {noremap=true})
	map("n", '<leader>gl', ":0Gclog<CR>", {noremap=true})
	map('n', '<leader>g2', ":diffget //2 <CR>", {noremap=true})
	map('n', '<leader>g3', ":diffget //3 <CR>", {noremap=true})
	map('n', '<leader>gd', ":Gvdiffsplit<CR>")
end

--Gitsigns
M.gitsigns_binding = function()
	local gs = package.loaded.gitsigns
	map('n', '<leader>gn', function()
      if vim.wo.diff then return '<leader>gn' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>gp', function()
      if vim.wo.diff then return '<leader>gp' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

	map({'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map({'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
end

--LSP
M.lsp_bindings = function()
	map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true })
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true})
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true})
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true})
	map('n','<A-CR>','<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap=true})
	map('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>', {noremap=true})
	map('n','gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap=true})
	map('n','gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap=true})
	map('n', '<leader>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', {noremap=true})
	map('n', 'gi', vim.lsp.buf.implementation, {noremap=true})
	map('n', '<C-k>', vim.lsp.buf.signature_help, {noremap=true})
	map('n', '<space>D', vim.lsp.buf.type_definition, {noremap=true})
end

--Go
M.go_bindings = function ()
	M.lsp_bindings()
	map('n', '<leader>tf', '<cmd>GoTestFunc<CR>', { noremap=true, silent=true })
	map('n', '<leader>tt', '<cmd>GoTest<CR>', { noremap=true, silent=true })
	map('n', '<leader>tp', '<cmd>GoTestPkg<CR>', { noremap=true, silent=true })
	map('n', '<leader>ta', '<cmd>GoAddTest<CR>', { noremap=true, silent=true })
	map('n', '<leader>tr', '<cmd>GoTest -n<CR>', { noremap=true, silent=true })
	map('n', '<M-r>', '<cmd>GoRename<CR>', { noremap=true, silent=true })
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

_G.qf_g = 1

M.toggle_Qf_list = function()
	if qf_g ~= 0 then
		_G.qf_g = 0
		vim.cmd("cclose")
	else
		_G.qf_g = 1
		vim.cmd("copen")
	end
end

return M
