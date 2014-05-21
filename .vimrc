set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch

match ErrorMsg '\s\+$'

function! TrimWhiteSpace()
     %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre *.py,*.c,*.h,*.cpp,*.cpp :call TrimWhiteSpace()
autocmd FileAppendPre *.py,*.c,*.h,*.cpp,*.cpp :call TrimWhiteSpace()
autocmd FilterWritePre *.py,*.c,*.h,*.cpp,*.cpp :call TrimWhiteSpace()
autocmd BufWritePre *.py,*.c,*.h,*.cpp,*.cpp :call TrimWhiteSpace()

