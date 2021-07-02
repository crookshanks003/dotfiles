--colorscheme--
vim.cmd 'colorscheme gruvbox'
vim.cmd('hi Normal guibg=NONE')


--helper--
local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local indent=4


--opts--
opt('o', 'tabstop', indent)
opt('o', 'softtabstop', indent)
opt('o', 'shiftwidth', indent)
opt('o', 'expandtab', true)
opt('o', 'smartindent', true)
opt('o', 'swapfile', false)
opt('o', 'number', true)
opt('o', 'relativenumber', true)
opt('o', 'wrap', false)
opt('o', 'hlsearch', false)
opt('o', 'incsearch', true)
opt('o', 'hidden', true)
opt('o', 'errorbells', false)
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'backup', false)
opt('o', 'undodir', './undodir')
opt('o', 'undofile', true)
opt('o', 'scrolloff', 8)
opt('o', 'sidescrolloff', 4 )
opt('o', 'showmode', false)
opt('o', 'background', 'dark')
opt('o', 'colorcolumn', '100')

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

