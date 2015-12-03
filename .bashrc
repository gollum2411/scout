# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
cd /home/mic/
alias ls='ls --color=auto'

alias c='xclip -selection clip-board | xclip -o -selection clip-board'
alias v='xclip -o -selection clip-board'
alias micsmc='sudo /opt/intel/mic/bin/micsmc'
alias squishrunner='/opt/squish-4.2.2-qt48x-linux64/bin/squishrunner'
alias uncrustify='/usr/local/bin/uncrustify'

PATH=~/bin:$PATH

alias gits='git status'
alias gitl='git log'

alias git-submodified='gits | grep modified | cut -d ":" -f2 | cut -d "(" -f1'
alias byebye-mpss='pushd /tmp ; sudo yum remove -y "*mpss*" ; popd'

#Aliases for conjure
alias conjure='ssh git@mic-git.pdx.intel.com conjure'

alias prepyoctopath="PATH=/usr/share/mpss/test/micmgmt-ft/usr/bin:/usr/share/mpss/test/micmgmt-ut/usr/bin:$PATH"

#End lines by rjacobus

