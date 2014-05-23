# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch 
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gollum2411/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Lines by gollum2411 
echo "          *******************************************************"
echo "          *                                                     *"
echo '          *   "If I have seen further than others it is         *'
echo '          *    because I stood on the shoulders of giants"      *'
echo "          *                                 -Isaac Newton       *"
echo "          *                                                     *"
echo "          *******************************************************"

alias pingg='ping google.com'
cd /home/gollum2411
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

alias gits='git status'
alias gitl='git log'
alias gitsubup='git submodule update'
alias gitrembranch='git branch -D $1'

alias git-submodified='gits | grep modified | cut -d ":" -f2 | cut -d "(" -f1'

#End lines by rjacobus

