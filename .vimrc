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
Plug 'vim-scripts/indentpython.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'
Plug 'yianwillis/vimcdoc'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()
"=======================
"       插件设置
"=======================
let NERDTreeChDirMode=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$',]
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"主题
colorscheme gruvbox
set background=dark


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"YCM
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_python_binary_path = 'python'
set completeopt=menu,menuone
let g:ycm_confirm_extra_conf=0
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

autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd Filetype python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"java-JavaComplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

au BufWrite * :Autoformat

let g:ag_working_path_mode="r"

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|idea)$',
            \ 'file': '\v\.(exe|so|dll|class|)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

func! JavaRun()
    let s:line = getline(search("package","nb",getline("0$")))
    if s:line != ''
        let s:currentClassName = split(split(s:line," ")[1],";")[0].".".expand("%:t:r")
    else
        let s:currentClassName = expand("%:t:r")
    endif
    if bufexists("java") == 1
        bunload java
        call job_stop(g:job)
    endif

    let g:job = job_start("java -cp out/ ". s:currentClassName,
                \ {'out_io': 'buffer', 'out_name': "java","out_modifiable": 0,'out_msg':0})
    10sp java
endfunc

func! JavacRun()
    w
    if bufexists("java") == 1
        bunload java
    endif
    cexpr system("javac -cp src/ " . expand("%") . " -d out/")
    cw
endfunction
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

map <F2> :NERDTreeToggle<cr>

map <F3> :TagbarToggle<CR>

map <F8> :Autoformat<CR>


"java-JavaComplete2按键
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)"生成需要实现的方法"

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)"生成toString方法"
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)"生成equals和hashCode方法"
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor) "生成构造函数"
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor) "生成默认构造函数"

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

autocmd Filetype java nmap <leader>rs :call job_stop(job)<cr>
autocmd Filetype java nmap <leader>rr :call JavaRun()<cr>
autocmd Filetype java nmap <leader>rc :call JavacRun()<cr><cr>
autocmd Filetype python nmap <leader>rp :w<cr>:cexpr system("python " . expand("%")) <cr>:copen<cr>
