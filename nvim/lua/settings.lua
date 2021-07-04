--colorscheme--
vim.cmd 'colorscheme gruvbox'
vim.cmd 'au VimEnter * hi Normal guibg=NONE ctermbg=NONE'


--helper--
local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
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
opt('o', 'undofile', true)
opt('o', 'scrolloff', 8)
opt('o', 'sidescrolloff', 4 )
opt('o', 'showmode', false)
opt('o', 'colorcolumn', '100')
opt('o', 'cursorline', true)


--autocmds
-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])
