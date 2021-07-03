--helper--
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--leader--
map('n','<Space>', '<NOP>', {silent = true})
vim.g.mapleader=' '

--mappings--
map('n','<leader>m', ':bnext <CR>')
map('n','<leader>n', ':bprev <CR>')

map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>v', ':wincmd v<CR>')
map('n', '<leader>m', ':bnext<CR>')
map('n', '<leader>n', ':bprev<CR>')
map('v','<leader>y','"+y')
map('n', '<leader>p', '"_dP')
map('v', '<leader>y', '"+y')
map('n', '<leader>+', ':res +5<CR>')
map('n', '<leader>-', ':res -5<CR>')
map('n', '+', ':vertical resize +5<CR>')
map('n', '-', ':vertical resize -5<CR>')
--nmap <C-m> gcc
--vmap <C-m> gc
map('v', '<leader>d', '"_d')


--NvimTree
map('n', '<C-t>', ':NvimTreeToggle<CR>')
map('n', '<C-f>', ':NvimTreeFindFile<CR>')

