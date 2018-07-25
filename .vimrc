set nocompatible
set number
set guifont=Monaco:h13         
syntax on   "开启语法高亮"
set fileformat=unix "设置以unix的格式保存文件"
set showmatch   "显示匹配的括号"
set incsearch
set hlsearch        "高亮搜索项"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出显示当前行"
set cursorcolumn        "突出显示当前列"
set foldmethod=indent "设置折叠"
set foldlevel=99
set encoding=utf-8


nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"==============================================
au BufNewFile,BufRead *.py
\set  tabstop=4
\set  softtabstop=4
\set  shiftwidth=4
\set  textwidth=79
\set  expandtab
\set  autoindent
\set  fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
\set tabstop=2
\set softtabstop=2
\set shiftwidth=2
"==============================================
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
call plug#end()
"==============================================
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

map <F3> :TagbarToggle<CR>

"主题
colorscheme gruvbox
set background=dark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_python_binary_path = 'python'

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>"转到定义 \g"

autocmd Filetype java nmap <F5> :w<cr>:set makeprg=javac\ %<cr>:set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#<cr>:make!<cr>:copen<cr>
autocmd Filetype java nmap <F6> :set makeprg=java\ %<<cr>:set errorformat=%#<cr>:make!<cr>:copen<cr>

autocmd Filetype python set makeprg=python\ %
autocmd Filetype python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd Filetype python nmap <F5> :w<cr>:make!<Return>:copen<Return>
