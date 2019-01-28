for file in split(glob('~/.vim/*.vim'), '\n')
    exe 'source' file
endfor
