# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Safely remove
function saferm
{
    if [ $# -gt 1 ] && [[ "$1" =~ -(rf|fr) ]] && shift; then
        local phrase=''

        if [ $# -eq 1 ]; then
            phrase+='This '
            if [ -d "$1" ]; then
                phrase+='directory'
            else
                phrase+='file'
            fi
        else
            local -i fileq=0 dirq=0

            phrase+='These '
            for elem in "$@"; do
                if [ -d "$elem" ]; then
                    ((dirq++))
                else
                    ((fileq++))
                fi
            done
            if [ $fileq -gt 1 -a $dirq -eq 0 ]; then
                phrase+='files'
            elif [ $fileq -eq 0 -a $dirq -gt 1 ]; then
                phrase+='directories'
            elif [ $fileq -gt 1 -a $dirq -gt 1 ]; then
                phrase+='files and directories'
            elif [ $fileq -eq 1 -a $dirq -eq 1 ]; then
                phrase+='file and directory'
            elif [ $fileq -gt 1 -a $dirq -eq 1 ]; then
                phrase+='files and directory'
            elif [ $fileq -eq 1 -a $dirq -gt 1 ]; then
                phrase+='file and directories'
            fi
        fi
        echo -n "$phrase will be removed: "

        for elem in "$@"; do
            if [ -e "$elem" ]; then
                echo -n "$elem "
            fi
        done

        echo
        read -p 'Confirm your decision (y/[n]): ' answer
        if [[ "$answer" =~ ^[Yy] ]]; then
            command rm -rf "$@"
        fi
    else
        command rm -i "$@"
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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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

export RANGER_LOAD_DEFAULT_RC=false
export VISUAL=vim
export EDITOR=vim
export LS_COLORS='*.7z=01;31:*.a=00;33:*.aac=00;36:*.ace=01;31:*.alz=01;31:*.arc=01;31:*.arj=01;31:*.asf=01;35:*.au=00;36:*.avi=01;35:bd=40;33;01:*.bmp=01;35:*.bz=01;31:*.bz2=01;31:ca=30;41:*.cab=01;31:cd=40;33;01:*.cgm=01;35:*.cpio=01;31:*.deb=01;31:di=01;34:*.dl=01;35:do=01;35:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.emf=01;35:*.esd=01;31:ex=01;32:*.flac=00;36:*.flc=01;35:*.fli=01;35:*.flv=01;35:*.gif=01;35:*.gl=01;35:*.gz=01;31:*.jar=01;31:*.jpeg=01;35:*.jpg=01;35:*.lha=01;31:ln=01;36:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.m2v=01;35:*.m4a=00;36:*.m4v=01;35:mh=00:mi=00:*.mid=00;36:*.midi=00;36:*.mjpeg=01;35:*.mjpg=01;35:*.mka=00;36:*.mkv=01;35:*.mng=01;35:*.mov=01;35:*.mp3=00;36:*.mp4=01;35:*.mp4v=01;35:*.mpc=00;36:*.mpeg=01;35:*.mpg=01;35:*.nuv=01;35:*.oga=00;36:*.ogg=00;36:*.ogm=01;35:*.ogv=01;35:*.ogx=01;35:*.opus=00;36:or=40;31;01:ow=34;42:*.pbm=01;35:*.pcx=01;35:*.pgm=01;35:pi=40;33:*.png=01;35:*.ppm=01;35:*.qt=01;35:*.ra=00;36:*.rar=01;31:*.rm=01;35:*.rmvb=01;35:*.rpm=01;31:rs=0:*.rz=01;31:*.sar=01;31:sg=30;43:so=01;35:*.spx=00;36:st=37;44:su=37;41:*.svg=01;35:*.svgz=01;35:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tga=01;35:*.tgz=01;31:*.tif=01;35:*.tiff=01;35:*.tlz=01;31:tw=30;42:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.vob=01;35:*.war=01;31:*.wav=00;36:*.webm=01;35:*.webp=01;35:*.wim=01;31:*.wmv=01;35:*.xbm=01;35:*.xcf=01;35:*.xpm=01;35:*.xspf=00;36:*.xwd=01;35:*.xz=01;31:*.yuv=01;35:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:'
export C_INCLUDE_PATH="$HOME/local/SFML/include:$HOME/local/CSFML/include:$HOME/local/TGUI/include:$HOME/local/CTGUI/include"
export LIBRARY_PATH="$HOME/local/SFML/lib:$HOME/local/CSFML/lib:$HOME/local/TGUI/lib:$HOME/local/CTGUI/lib"
export LD_LIBRARY_PATH=$LIBRARY_PATH

stty -ixon
