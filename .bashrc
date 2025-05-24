#
# ~/.bashrc
#

export SSH_AUTH_SOCK=/run/user/1000/gcr/ssh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shurtu-gal/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shurtu-gal/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shurtu-gal/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shurtu-gal/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_BASH_SETUP_PATH=/home/shurtu-gal/.cache/@asyncapi/cli/autocomplete/bash_setup && test -f $ASYNCAPI_AC_BASH_SETUP_PATH && source $ASYNCAPI_AC_BASH_SETUP_PATH; # asyncapi autocomplete setup


