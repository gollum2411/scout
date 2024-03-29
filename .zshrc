# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch interactivecomments
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rjacobus/.zshrc'

autoload -Uz compinit && compinit -i
# End of lines added by compinstall

echo "          *******************************************************"
echo "          *                                                     *"
echo '          *   "If I have seen further than others it is         *'
echo '          *    because I stood on the shoulders of giants"      *'
echo "          *                                 -Isaac Newton       *"
echo "          *                                                     *"
echo "          *******************************************************"

PROMPT="[%n@%m %1d]%# "

autoload -U colors && colors

#show in term whether normal or insert mode (vi)
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v
bindkey '^R' history-incremental-search-backward

alias c='xclip -selection clip-board | xclip -o -selection clip-board'
alias v='xclip -o -selection clip-board'

setopt histignoredups

alias ls='ls --color=auto'
alias jumpto='cd -P'

alias gits='git status'
alias gitl='git log'
alias gitsubup='git submodule update'
alias gitrembranch='git branch -D $1'

function gitrt() {
    git tag -d "$1" && git tag "$1"
}

alias git-submodified='gits | grep modified | cut -d ":" -f2 | cut -d "(" -f1'

export PATH=$PATH:/usr/local/go/bin:/home/rjacobus/bin:/home/rjacobus/go/bin
export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig/

[ -f ~/.cargo/env ] && source ~/.cargo/env

fpath=(~/.zsh/completion $fpath)

source ~/.zsh/antigen.zsh
antigen bundle hschne/fzf-git

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#End lines by rjacobus


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>>> Vagrant command completion (start)
fpath=(/tmp/.mount_vagran6svwB0/usr/gembundle/gems/vagrant-2.2.15/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
#
[ -f ~/.k8s_comp ] && source ~/.k8s_comp

EDITOR=vim
SUDO_EDITOR=vim

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function open_vim() {
    declare -a opts
    if [ -f "$(pwd)/vimrc" ]; then
        opts+=(-u "$(pwd)/vimrc")
    fi
    /usr/local/bin/vim "${opts[@]}" $@
}
alias vim=open_vim
