set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mrk21/yaml-vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'racer-rust/vim-racer'
Plugin 'valloric/youcompleteme'
Plugin 'wagnerf42/vim-clippy'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

set nocompatible
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set switchbuf=useopen,usetab,newtab
set wildmode=list:longest
set path+=**

syntax on
filetype plugin indent on

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

map <F8> :mksession! vimsesh <cr> :wqa <cr>
map <F9> :make!<cr>

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

