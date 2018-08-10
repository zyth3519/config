call plug#begin('~/.vim/plugged')
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0

func! JavaRun()
    let s:line = getline(search("package","nb",getline("0$")))
    if s:line != ''
        let s:currentClassName = split(split(s:line," ")[1],";")[0].".".expand("%:t:r")
    else
        let s:currentClassName = expand("%:t:r")
    endif
    if bufexists("java") == 1
        bunload java
    endif
    call term_start("java -cp out/ " . s:currentClassName, {"term_name":"java", "term_rows":10} )
endfunc

func! JavacRun()
    w
    if bufexists("java") == 1
        bunload java
    endif
    cexpr system("javac -cp src/ " . expand("%") . " -d out/")
    cw
endfunction


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

nmap <leader>rr :call JavaRun()<cr>
nmap <leader>rc :call JavacRun()<cr><cr>
