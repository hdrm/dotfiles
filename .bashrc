#!/bin/bash

case $- in
    *i*)
        ;;
    *)
        return
        ;;
esac

HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000

shopt -s cdspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s globstar
shopt -s histappend
shopt -s nocaseglob

case "$TERM" in
    xterm-color)
        color_prompt=yes
        ;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ] ; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null ; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ] ; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ '
    PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\t\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput setaf 2)\]\u@\h\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput setaf 4)\]\w\[$(tput sgr0)\] \[$(tput setaf 7)\]\$? \$\[$(tput sgr0)\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi

unset color_prompt force_color_prompt

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
        ;;
    *)
        ;;
esac

if [ -x /usr/bin/dircolors ] ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hF --color=auto --group-directories-first'

    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'

    alias less='less -r'
    alias lsa='ls -Al'
    alias mount='mount | column -t'
fi

if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix ; then
    if [ -f /usr/share/bash-completion/bash_completion ] ; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ] ; then
        . /etc/bash_completion
    fi
fi

PATH=$PATH:$HOME/bin:$HOME/local/bin

export EDITOR=nano
export PAGER=less
