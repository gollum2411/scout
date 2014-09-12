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

"Set more eye-friendly colors
highlight Normal ctermfg=grey ctermbg=black

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk :call TrimWhiteSpace()
autocmd FileAppendPre *.py,*.c,*.h,*.cpp,*.hpp,*.mk :call TrimWhiteSpace()
autocmd FilterWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk :call TrimWhiteSpace()
autocmd BufWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk :call TrimWhiteSpace()

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

