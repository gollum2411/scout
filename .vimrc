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
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

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
set cursorline

" Relative line number stuff...
:set number relativenumber
:set nu rnu

syntax on
filetype plugin indent on

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

match ErrorMsg '\s\+$'

function! TrimWhiteSpace()
     %s/\s\+$//e
endfunction

"Set more eye-friendly colors
" highlight Normal
colorscheme deus
hi StatusLine ctermfg=black ctermbg=cyan
hi StatusLineNC ctermfg=118 ctermbg=244
hi TabLineSel ctermbg=97
set laststatus=2

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java :call TrimWhiteSpace()
autocmd FileAppendPre *.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java :call TrimWhiteSpace()
autocmd FilterWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java :call TrimWhiteSpace()
autocmd BufWritePre *.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java :call TrimWhiteSpace()

nnoremap <C-f> :Files <cr>
nnoremap <C-k> :Rg <c-r><c-w> <cr>

map <F8> :mksession! vimsesh <cr> :wqa <cr>
map <F9> :make!<cr>

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

