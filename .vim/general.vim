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
set cursorline
set cursorcolumn

syntax on   
filetype plugin on

au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2

let mapleader = ";"
let g:airline_powerline_fonts = 1
