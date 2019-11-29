function Run(cmd) abort

let l:path = expand('%:p:h')
let l:fileName = expand('%:t:r')
let l:fullFileName = expand('%')

let l:pathFullFileName = l:path . "/" . l:fullFileName
let l:pathFileName = l:path . "/out/" . l:fileName

" 如果运行后的缓冲区存在删除缓冲区
if bufexists(l:pathFileName) == 1
execute("bdelete " . l:pathFileName)
endif

" 因为当前文件的缓冲区名字是l:pathFullFileName所以用l:pathFileName设置缓冲区名
call term_start($HOME . "/.vim/shell/" . a:cmd ." " . l:pathFullFileName . " " . l:pathFileName,
        \ {"term_rows":10, "term_name":l:pathFileName})

"定时器每隔500毫秒检查命令时候完成
call timer_start(500, 'Move', {'repeat': -1})
let s:bufId = bufnr(l:pathFileName)

endfunction

function Move(timer)
if term_getstatus(s:bufId)  == "finished"
wincmd k
call timer_stop(a:timer)
endif
endfunction

autocmd FileType c command Run :call Run("runC")
autocmd FileType python command Run :call Run("runPy")
