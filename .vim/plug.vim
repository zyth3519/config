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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'
Plug 'yianwillis/vimcdoc'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'easymotion/vim-easymotion'
call plug#end()
"=======================
"       插件设置
"=======================
let NERDTreeChDirMode=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$',]
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='│'
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

autocmd Filetype python set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ag_working_path_mode="r"

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|idea)$',
            \ 'file': '\v\.(exe|so|dll|class|)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

au BufWrite * :Autoformat

map <F2> :NERDTreeToggle<cr>

map <F3> :TagbarToggle<CR>

map <F8> :Autoformat<CR>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
