set nocompatible
set number
set guioptions-=r
set guioptions-=L
set guioptions-=b
set fileformat=unix 
set showmatch  
set fenc=utf-8
set backspace=2
set matchtime=5
set incsearch
set hlsearch
set noexpandtab
set whichwrap+=<,>,h,l
set autoread
set splitbelow

set tabstop=4   
set softtabstop=4 
set shiftwidth=4  
set textwidth=79 
set expandtab
set autoindent  
set fileformat=unix

filetype plugin on

let mapleader = ";"
let g:airline_powerline_fonts = 1

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"===================================================================
if has("gui_running")
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme="sol"
    colorscheme gruvbox
    set background=dark

    set cursorline
    set cursorcolumn
    set lines=25 columns=100

    set guifont=YaHei_Consolas_Hybrid:h12
else
    let g:airline_disable_statusline = 1
endif

"=======================mapping===================================
nmap j <c-w><c-j>
nmap k <c-w><c-k>
nmap l <c-w><c-l>
nmap h <c-w><c-h>

nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 :tablast<cr>
