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

let mapleader=";"
"=======================
"       插件管理
"=======================
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'valloric/YouCompleteMe'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'
call plug#end()
"=======================
"       插件设置
"=======================
let nerdtreechdirmode=1
"显示书签"
let nerdtreeshowbookmarks=1
"设置忽略文件类型"
let nerdtreeignore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let nerdtreewinsize=25

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


"主题
colorscheme gruvbox
set background=dark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"YCM
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_python_binary_path = 'python'
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>"转到定义 \g"
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

autocmd Filetype python set makeprg=python\ %
autocmd Filetype python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
nmap <F5> :w<cr>:make!<Return>:copen<Return>

"java-JavaComplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

au BufWrite * :Autoformat
"=======================
"       按键设置
"=======================
nmap <Left> <Nop>
nmap <Right> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

nmap <space> za "折叠
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

map <F2> :NERDTreeToggle<cr>

map <F3> :TagbarToggle<CR>

map <F6> :Autoformat<CR>


"java-JavaComplete2按键
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)"生成toString方法"
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)"生成equals和hashCode方法"
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)"生成构造器"
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)"生成默认构造器"

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)"插入模式下生成Set方法"
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)"插入模式下生成Set方法"
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)"插入模式下生成Set方法"

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)"可视化模式下生成Set方法"
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter) "可视化模式下生成Get方法"
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)"可视化模式下生成Set和Get方法"

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)"生成类"
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)"根据模板生成类"
