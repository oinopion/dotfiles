# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/oinopion/.zshrc'

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''

zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
    dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
    hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
    mailman mailnull mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=20000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export HOSTNAME=`hostname -s`

#export PYTHONWARNINGS="default"
export JAVA_HOME='/usr/lib/jvm/java-6-sun'

export PATH="$HOME/.local/apache/bin:$PATH"
export PATH="$HOME/.local/mysql/bin:$PATH"
export PATH="$HOME/.local/php/bin:$PATH"
export PATH="$HOME/.local/rabbitmq/sbin:$PATH"
export PATH="$HOME/.local/redis/bin:$PATH"
export PATH="$HOME/.local/mongodb/bin:$PATH"



export LANG="en_DK.UTF-8"
export LANGUAGE="en_DK:en"

export LDFLAGS='-m64'
export CFLAGS='-m64 -O2'

# PROMPT explination:
# $=' needed for colors
# %{\e[1;32m%} sets our first color. 32 is the color, changed as needed
# always end with color 00 so the CL is normal
# %n: username, %m: hostname, %1~: display the pwd (if $HOME then ~) one level
# %(!.#.$): if (su_priv) then # else $
#PROMPT=$'%(!.%{\e[1;31m%}.%{\e[1;32m%})%n%{\e[1;00m%}@%{\e[1;34m%}%m%{\e[1;00m%}:%{\e[1;30m%}%2~%{\e[1;00m%}%(!.#.$) '
PROMPT=$'%(!.%{\e[1;31m%}.%{\e[1;32m%})%n%{\e[1;00m%}@%{\e[1;34m%}%m%{\e[1;00m%}%(!.#.$) '

# RPROMPT (shows up at the end of a line)
# if (exit code wasn't bad) then else display the exit code
#RPROMPT='%(?..Exit Code: %?)'
RPROMPT=$'%(?..[%?]) %{\e[1;30m%}%~%{\e[1;00m%}'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh" 


# Run this before displaying the prompt
function precmd()
{
       # Put fun stuff in the title bar. But not if in the console
       case "$TERM" in
       xterm*|rxvt*)
               echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
               ;;
       *)
               ;;
       esac
}

# Run this before executing a command
function preexec()
{
       # Put fun stuff in the title bar. But not if in the console
       case "$TERM" in
       xterm*|rxvt*)
               echo -ne "\033]0;$1 on $USER@$HOSTNAME\007"
               ;;
       *)
               ;;
       esac
}


if [ -f ~/.alias ]; then
    . ~/.alias
fi


function activate_virtualenv() {
    PROJECT_ROOT=$PWD
    if [ -f "$PROJECT_ROOT/.venv" ]; then
        ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
    else
        return 0;
    fi
    if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
        if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
            workon "$ENV_NAME"
        fi
    fi
    return 0;
}

function venv_cd() {
    cd "$@" && activate_virtualenv
}

alias cd="venv_cd"

activate_virtualenv
