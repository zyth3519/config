function Run(cmd) abort
    let l:path = expand('%:p:h')
    let l:fileName = expand('%:t:r')
    let l:fullFileName = expand('%')
    let l:pathFullFileName = l:path . "/" . l:fullFileName
    let l:pathFileName = l:path . "/" . l:fileName

    let l:buferName = "[buffer] " . l:fullFileName

    " 如果运行后的缓冲区存在删除缓冲区
    if bufexists(l:buferName) == 1
        execute("bdelete " . l:buferName)
    endif

    call term_start($HOME . "/.vim/shell/" . a:cmd ." " . l:pathFullFileName . " " . l:pathFileName . " " . l:path,
            \ {"term_rows":10, "term_name":l:buferName})

    " 定时器每隔500毫秒检查命令是否完成
    call timer_start(100, 'Move', {'repeat': -1})
    let s:bufId = bufnr(l:buferName)
endfunction

function Move(timer)
    if term_getstatus(s:bufId)  == "finished"
        wincmd k
        call timer_stop(a:timer)
    endif
endfunction

autocmd FileType c command Run :call Run("runC")
autocmd FileType python command Run :call Run("runPy")
