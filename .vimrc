set nocompatible
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set switchbuf=useopen,usetab,newtab
syntax on
filetype plugin indent on

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

map <F9> :make!<cr>

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

