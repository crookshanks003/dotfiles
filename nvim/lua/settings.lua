local indent=4

vim.cmd "set shortmess+=c"

--colorscheme--
vim.cmd 'colorscheme gruvbox'
vim.cmd 'au VimEnter * hi Normal guibg=NONE ctermbg=NONE'

--opts--
vim.o.completeopt = "menuone,noselect"
vim.o.tabstop= indent
vim.o.softtabstop= indent
vim.o.shiftwidth= indent
vim.o.expandtab= false
vim.o.smartindent= true
vim.o.swapfile= false
vim.o.nu= true
vim.o.relativenumber= true
vim.o.wrap= false
vim.o.hlsearch= false
vim.o.incsearch= true
vim.o.hidden= true
vim.o.errorbells= false
vim.o.ignorecase= false
vim.o.smartcase= true
vim.o.backup= false
vim.o.undofile= true
vim.o.scrolloff= 8
vim.o.sidescrolloff= 4
vim.o.showmode= false
vim.o.colorcolumn= '80'
vim.o.cursorline= true
vim.o.termguicolors= true
vim.opt.wildignore = "__pycache__"
vim.opt.wildignore = vim.opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
vim.opt.guicursor = "a:block"
vim.opt.mouse=""

-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])
-- highlight yanked
vim.cmd([[augroup highlight_yank
	autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=80 }
augroup END]])
-- filetype specific indents
vim.cmd([[
augroup FileTypeSpecificIndents
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
]])
