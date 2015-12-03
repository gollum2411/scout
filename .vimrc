set nocompatible
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set switchbuf=useopen,usetab,newtab
set wildmode=longest,list,full
set wildmenu
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

nnoremap gr :grep! '\b<cword>\b' **/* <CR>

map <F9> :make!<cr>
map <F8> :make! all local_test DEBUG=1<cr>
map <F7> :make! DEBUG=1 HOST_TEST=1<cr>

map <C-h> :FSSplitRight <CR>

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

