# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch no_case_glob
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mic/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Lines by rjacobus
echo "          *******************************************************"
echo "          *                                                     *"
echo '          *   "If I have seen further than others it is         *'
echo '          *    because I stood on the shoulders of giants"      *'
echo "          *                                 -Isaac Newton       *"
echo "          *                                                     *"
echo "          *******************************************************"

alias pingg='ping google.com'
cd /home/mic
PROMPT="[%n@%m %1d]%# "

autoload -U colors && colors

#show in term whether normal or insert mode (vi)
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

whichpkg(){
    if [ -n "$1" ]; then
        rpm -qf $(which $1)
    else
        echo "Specify file" >&2
    fi
}

push_to_card(){
    scp -oStrictHostKeyChecking=no $2 root@mic${1}:/tmp
}

set_googleinstallroot()
{
    export CPPFLAGS=-I/opt/googlemock/usr/include/\ -I/opt/googletest/usr/include
    export LDFLAGS=-L/opt/googletest/usr/lib64/\ -L/opt/googlemock/usr/lib64
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v
bindkey '^R' history-incremental-search-backward

alias c='xclip -selection clip-board | xclip -o -selection clip-board'
alias v='xclip -o -selection clip-board'
alias squishrunner='/opt/squish-4.2.2-qt48x-linux64/bin/squishrunner'
alias uncrustify='/usr/local/bin/uncrustify'

setopt histignoredups

export PATH=/home/mic/bin:/usr/local/Trolltech/Qt/bin:$PATH

alias ls='ls --color=auto'
alias grep='grep --color'
alias egrep='egrep --color'
if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi

alias gits='git status'
alias gitl='git log'
alias gitsubup='git submodule update'
alias gitrembranch='git branch -D $1'

alias makerjacobus='make -f Roberto.mk'

alias git-submodified='gits | grep modified | cut -d ":" -f2 | cut -d "(" -f1'
alias byebye-mpss='pushd /tmp ; sudo yum remove -y "*mpss*" ; popd'

#Aliases for conjure
alias conjure='ssh git@mic-git.pdx.intel.com conjure'

alias prepyoctopath="PATH=/usr/share/mpss/test/micmgmt-ft/usr/bin:/usr/share/mpss/test/micmgmt-ut/:$PATH"

alias cleanall="./build -- $@ -c cleanall"
alias devshell="./build -- $1 -c devshell"

alias yocto-install='sudo yum install --noplugins --disablerepo="*" --enablerepo=yoctolocal'
alias yocto-remove='sudo yum remove --noplugins --disablerepo="*" --enablerepo=yoctolocal'
alias yocto-search='yum search --disablerepo="*" --enablerepo=yoctolocal --enablerepo=yoctoremote'

alias yocto-remote-install='sudo yum --disablerepo="*" --enablerepo=yoctoremote install'
alias yocto-remote-search='yum --disablerepo="*" --enablerepo=yoctoremote search'

alias gtest_filter="./$1 --gtest_filter='*$2*'"

alias g++11="g++ -std=c++0x -Wall"
alias pdb="python -m pdb"
#End lines by rjacobus

