setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

function Java()
    ccl
    let s:line = getline(search("package","nb",getline("0$")))
    if s:line != ''
        let s:currentClassName = split(split(s:line," ")[1],";")[0].".".expand("%:t:r")
    else
        let s:currentClassName = expand("%:t:r")
    endif
    if bufexists("java") == 1
        bunload java
    endif
    if filewritable("out") == 2
        call term_start("java -cp out/ " . s:currentClassName, {"term_name":"java", "term_rows":10} )
    else
        call term_start("java " . s:currentClassName, {"term_name":"java", "term_rows":10} )
    endif
endfunc

function Javac()
    w
    if filewritable("out") == 2
        if filewritable("src") == 2
            let g:job=job_start('javac -cp src/ ' . expand("%") . " -d out/",
                        \{'out_io':'file','out_name':$HOME . "/.cache/vim/javac",
                        \'err_io':'out','out_msg':0})
        endif
    else
        let g:job=job_start('javac ' . expand("%"),
                    \{'out_io':'file','out_name':$HOME . "/.cache/vim/javac",
                    \'err_io':'out','out_msg':0})
        call job_stop(g:job)
    endif
endfunction

function Run()
    call Javac()
    while job_status(g:job) != "dead"
    endwhile

    let s:information=readfile($HOME . "/.cache/vim/javac")

    if s:information == []
        call Java()
    else
        if strcharpart(s:information[0],0,1) == '注'
            call Java()
        else
            if bufexists("java") == 1
                bdelete java
            endif
            cg ~/.cache/vim/javac
            cw
        endif
    endif
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

nmap <leader>r :call Run()<cr>
