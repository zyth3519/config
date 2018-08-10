"=======================
"       基础设置
"=======================
set nocompatible
set number
syntax on
set fileformat=unix
set showmatch   "显示匹配的括号"
set incsearch
set hlsearch        "高亮搜索项"
set whichwrap+=<,>,h,l
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set foldmethod=indent "设置折叠"
set foldlevel=99
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set autoread
set splitbelow
set equalalways!
set eadirection=hor

set  tabstop=4
set  softtabstop=4
set  shiftwidth=4
set  textwidth=79
set  expandtab
set  autoindent     "自动缩进"
set shiftround

let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

let mapleader = "\<Space>"
source ~/.vim/plug.vim
autocmd Filetype java source ~/.vim/java.vim
"=======================
"       按键设置
"=======================
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>
nmap <c-h> <c-w><c-h>

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

autocmd Filetype python nmap <leader>rp :w<cr>:cexpr system("python " . expand("%")) <cr>:copen<cr>
