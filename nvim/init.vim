"Set
syntax on
set noerrorbells
set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set relativenumber
set nu
set nohlsearch
set hidden
set incsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set noshowmode
set scrolloff=8
set notimeout
set ttimeout
set guifont=menlo:h14
set nowrap

let mapleader = " "
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>m :bnext<CR>
nnoremap <leader>n :bprev<CR>
vnoremap <leader>y "+y
nnoremap  <leader>p "_dP
vnoremap <leader>c "+y
nnoremap <leader>+ :res +5<CR>
nnoremap <leader>- :res -5<CR>
nnoremap + :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>
nmap <C-m> gcc
vmap <C-m> gc
vnoremap <leader>d "_d


"Plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'tpope/vim-commentary'
call plug#end()

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE


"Coc
let g:coc_global_extensions=[
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-emmet',
  \ 'coc-clangd',
  \ 'coc-html-css-support',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
imap <C-l> <Plug>(coc-snippets-expand)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"



"NERDTree
autocmd StdinReadPre * let s:std_in=1
let NERDTreeWinSize = 25

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



"Ctrlp
"let g:ctrlp_use_caching=0
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', './node_modules']
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'Ctrlp'



"FZF
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <M-S-p> :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>rg :Rg<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"Emmet
let g:user_emmet_leader_key='!'



"airline
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_section_c_only_filename = 1
let g:airline_section_c = '%t'
let g:airline_section_z = ""



"Fugitive
nmap <leader>gc :Git commit<CR>
nmap <leader>gd :Gdiffsplit<CR>

"UltiSnips
let g:UltiSnipsExpandTrigger = "<nop>"
