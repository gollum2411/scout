set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim,~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mrk21/yaml-vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'racer-rust/vim-racer'
Plugin 'valloric/youcompleteme'
Plugin 'wagnerf42/vim-clippy'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rhysd/vim-clang-format'
Plugin 'hashivim/vim-terraform'
Plugin 'tell-k/vim-autopep8'
Plugin 'preservim/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
" Plugin 'ervandew/supertab'
Plugin 'preservim/tagbar'

" Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_toolchain_root = '~/.rustup/toolchains/nightly-2021-11-16-x86_64-unknown-linux-gnu/'
let g:go_fmt_autosave = 1

" instructs deoplete to use omni
" completion for Go files.
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

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
set noincsearch

" Relative line number stuff...
:set number relativenumber
:set nu rnu

syntax on
filetype plugin indent on

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

match ErrorMsg '\s\+$'

function! TrimWhiteSpace()
     %s/\s\+$//e
endfunction

"Set more eye-friendly colors
" highlight Normal
let g:colorscheme_switcher_define_mappings = 0
colorscheme tender
hi StatusLine ctermfg=black ctermbg=cyan
hi StatusLineNC ctermfg=118 ctermbg=244
hi TabLineSel ctermbg=97
set laststatus=2

hi ExtraWhitespace ctermfg=red ctermbg=red
match ExtraWhitespace /\s\+$/

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre *.tsx,*.ts,*.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java,*.go,*.yaml,.yml :call TrimWhiteSpace()
autocmd FileAppendPre *.tsx,*.ts,*.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java,*.go,*.yaml,.yml :call TrimWhiteSpace()
autocmd FilterWritePre *.tsx,*.ts,*.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java,*.go,*.yaml,.yml :call TrimWhiteSpace()
autocmd BufWritePre *.tsx,*.ts,*.py,*.c,*.h,*.cpp,*.hpp,*.mk,*.java,*.go,*.yaml,.yml :call TrimWhiteSpace()

nnoremap <C-f> :Files <cr>
nnoremap <C-k> :Rg <c-r><c-w> <cr>

nnoremap <F8> :mksession! vimsesh <cr> :wa <cr> :qa <cr>
nnoremap <F9> :make!<cr>

"<<Ctrl-l> to remove last-search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

let g:autopep8_ignore="E226,E24,W6,E402"
let g:autopep8_disable_show_diff=1
"autocmd BufWritePost *.py Autopep8
au FileType python setlocal formatprg=autopep8\ -

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=["~/ultisnips"]

command TB :TagbarToggle
