# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Safely remove
function saferm
{
    if [ $# -gt 1 ] && [[ $1 =~ -[rf][fr] ]] && shift; then
        local phrase=''

        if [ $# -eq 1 ]; then
            phrase+='This '
            if [ -f $1 ]; then
                phrase+='file'
            elif [ -d $1 ]; then
                phrase+='directory'
            fi
        else
            local -i fileq=0 dirq=0

            phrase+='These '
            for elem in "$@"; do
                if [ -f $elem ]; then
                    ((fileq++))
                elif [ -d $elem ]; then
                    ((dirq++))
                fi
            done
            if [ $fileq -gt 1 -a $dirq -eq 0 ]; then
                phrase+='files'
            elif [ $fileq -gt 1 -a $dirq -eq 1 ]; then
                phrase+='files and directory'
            elif [ $fileq -gt 1 -a $dirq -gt 1 ]; then
                phrase+='files and directories'
            elif [ $fileq -eq 0 -a $dirq -gt 1 ]; then
                phrase+='directories'
            fi
        fi
        echo -n "$phrase will be removed: "

        for elem in "$@"; do
            if [ -e $elem ]; then
                echo -n "$elem "
            fi
        done

        echo
        read -p 'Confirm your decision (y/[n]): ' answer
        if [[ $answer =~ ^[Yy] ]]; then
            command rm -rf $@
        fi
    else
        command rm -i $@
    fi
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1=$(echo '\[\033[38;5;8m\]['\
'\[$(tput sgr0)\]\[\033[38;5;7m\]\t'\
'\[$(tput sgr0)\]\[\033[38;5;8m\]]['\
'\[$(tput sgr0)\]\[\033[38;5;7m\]\w'\
'\[$(tput sgr0)\]\[\033[38;5;8m\]]'\
'\[$(tput sgr0)\]\[\033[38;5;7m\]'\
' \u: \[\033[0;39m\]')
else
    PS1='[\t][\w] \u: '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export C_INCLUDE_PATH=$HOME/local/include
export LIBRARY_PATH=$HOME/local/lib
export LD_LIBRARY_PATH=$HOME/local/lib
export RANGER_LOAD_DEFAULT_RC=false
export VISUAL=vim
export EDITOR=vim

# stdout color
#trap 'printf "\e[37m"' DEBUG

# Cursor
#printf '\033[5 q\r' # I-beam blink on
#printf '\033[6 q\r' # I-beam blink off
