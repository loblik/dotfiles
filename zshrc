# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

PATH=$PATH:~/bin/

export EDITOR=vim

setopt autocd
unsetopt LIST_BEEP

zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_CACHE=1
source /home/z003kbct/hacks/zsh-git-prompt/zshrc.sh

compinit

# some keybinding
#bindkey -v

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}" end-of-line
bindkey "${key[Delete]}" delete
bindkey "${key[Insert]}" overwrite-mode

# aliases
alias la='ls -al'
alias ll='ls -l'
alias ls='ls -h --color=auto'
alias lt='ls -lrt'

alias cal='cal -3'
alias ncmpc='ncmpc -c'
alias less='less -N'
alias gdb='gdb -q'
alias ifs='echo -n "$IFS" | od -c'
alias sterm='screen /dev/ttyUSB0 115200'
alias rm='rm -vI'
alias feh='feh --image-bg black --scale-down'
alias sprunge='curl -H "Expect:" -F "sprunge=<-" http://sprunge.us'
alias blank='xset dpms force off'

alias -g i3c='~/.config/i3/config'

alias jp='python -mjson.tool'

alias nmc='nmtui-connect'
alias nme='nmtui-edit'

alias gu='git status --untracked=no'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git status'

alias sub='OpenSubtitlesDownload.py -l cze'
alias sube='OpenSubtitlesDownload.py'
alias f='find . -iname'

# prompt setting
PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}$(git_super_status)
> '
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"

# print the bell when long running command finishes
zmodload zsh/datetime
zmodload zsh/regex

COMMAND_NOTIFY_TIMEOUT=2
COMMAND_EXEC_TIME=$EPOCHSECONDS
COMMAND_NAME=

COMMAND_IGNORE_PATTERN="mplayer*"

preexec () {
    COMMAND_EXEC_TIME=$EPOCHSECONDS
    COMMAND_NAME="$1"
    # print -Pn "\e]2;$1\r"
}

precmd() {
    # print -Pn "\e]2;zsh\a"
    if [[ "$COMMAND_NAME" -regex-match "$COMMAND_IGNORE_PATTERN" ]]; then
        return
    fi

    if [[ $(($EPOCHSECONDS - $COMMAND_EXEC_TIME)) -gt $COMMAND_NOTIFY_TIMEOUT ]];then
        print -n "\a"
    fi
}

# sprunge nopaste
xsprunge(){
    xclip -o | curl -H "Expect:" -F 'sprunge=<-' http://sprunge.us
}

# get public IP address
pubip() {
    wget -q -O - http://checkip.dyndns.org/ | sed 's/.*Current IP Address: //; s/<\/.*//'
}

# stardict wrapper
d() {
    s="$@"
    o=
    kbm=`setxkbmap -query | sed -n '/layout:/s/.*\(..\)$/\1/p'`
    #kbm="us"
    if [[ $kbm == "us" ]]; then
    chars=(é - ě š č ř ž ý á í)
    for i in $(seq 0 $((${#s} - 1))); do
        c="${s:$i:1}"
        if [[ $c =~ "[2-90]" ]]; then
            o=${o}${chars[$((c+1))]}
        else
            o=${o}${c}
        fi
    done
    fi
    echo "$o"
    sdcv $o
}

# ssh wrapper
ssh() {
    ssh-add -l > /dev/null
    if [ $? -ne 0 ]; then
        ssh-add
    fi
    /usr/bin/ssh $@
}

# colored grep
clize() {
    grep --color -E "`echo "$@" | sed 's/ /|/g'`|$"
}

# keyboard settings
kbs() {
    # setup layouts
    setxkbmap -option "grp:alt_shift_toggle" "us,cz"
    # load custom map (has to be after setxkbmap)
    xmodmap ~/.xmodmap
}

alias xs=' i3lock -t -i .wallpaper; systemctl suspend'
alias xo='i3-msg exit'
alias wt='curl -s wttr.in/brno | head -7'
