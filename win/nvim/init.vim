"
" init.vim by Andrija Cicovic
"

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim'
call plug#end()

syntax on

filetype plugin indent on

colorscheme gruvbox

set fileencoding=utf-8
set fileformat=unix
set noerrorbells
set laststatus=2
set showtabline=2
set noshowmode
set number relativenumber
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nowrap
set cursorline
set incsearch
set nohlsearch
set hidden
set noequalalways
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set foldmethod=indent
set foldlevel=4
set backspace=indent,eol,start
set showbreak=↪\ 
set listchars=tab:→\ ,trail:•,space:·,eol:↲
set updatetime=100
set nobackup
set nowritebackup
set signcolumn=yes

let mapleader=" "
nnoremap <CR> o<Esc>k
nnoremap <leader>] :ls<CR>:buffer<Space>
nnoremap <leader>w :set list!<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "_dP
nnoremap <leader>s :Startify<CR>
nnoremap <Left> :silent tabprevious<CR>
nnoremap <Right> :silent tabnext<CR>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' [+]' : ''
    return filename . modified
endfunction

function! TrimTrailingWhitespace()
    execute '%s/\s\+$//e'
endfunction

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['readonly', 'filename']],
\   'right': [['lineinfo'], ['filetype'], ['buff', 'filefmt', 'fileencoding']]
\ },
\ 'component': {
\   'filename': '%{LightlineFilename()}',
\   'buff': '%n',
\   'filetype': '%{LightlineFiletype()}',
\   'filefmt': '%{LightlineFileformat()}'
\ },
\ 'separator': {'left': "\uE0B0", 'right': "\uE0B2"},
\ 'subseparator': {'left': "\uE0B1", 'right': "\uE0B3"},
\ }
let g:lightline.colorscheme = 'Tomorrow'

let g:rustfmt_autosave=1
let g:rustfmt_emit_files=1
let g:rustfmt_fail_silently=0

inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()

inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <C-Space> coc#refresh()
