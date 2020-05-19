#export KOPS_STATE_STORE=
export KOPS_FEATURE_FLAGS=
#export AWS_ACCESS_KEY_ID=
#export AWS_SECRET_ACCESS_KEY=
#export AWS_PROFILE=
#export NAME=sandbox01.k8s.local

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


export BASH_BLACK="\[\033[0;30m\]"
export BASH_BLACKBOLD="\[\033[1;30m\]"
export BASH_RED="\[\033[0;31m\]"
export BASH_REDBOLD="\[\033[1;31m\]"
export BASH_GREEN="\[\033[0;32m\]"
export BASH_GREENBOLD="\[\033[1;32m\]"
export BASH_YELLOW="\[\033[0;33m\]"
export BASH_YELLOWBOLD="\[\033[1;33m\]"
export BASH_BLUE="\[\033[0;34m\]"
export BASH_BLUEBOLD="\[\033[1;34m\]"
export BASH_PURPLE="\[\033[0;35m\]"
export BASH_PURPLEBOLD="\[\033[1;35m\]"
export BASH_CYAN="\[\033[0;36m\]"
export BASH_CYANBOLD="\[\033[1;36m\]"
export BASH_WHITE="\[\033[0;37m\]"
export BASH_WHITEBOLD="\[\033[1;37m\]"
export BASH_RESETCOLOR="\[\e[00m\]"


source <(kubectl completion bash)
source <(kops completion bash)
if [ -f $(brew --prefix)/etc/bash_completion ]; then 
. $(brew --prefix)/etc/bash_completion
fi

__kube_ps1()
{
    # Get current context
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")

    if [ -n "$CONTEXT" ]; then
        echo "(k8s: ${CONTEXT})"
    fi
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="$BASH_REDBOLD\t ${BASH_BLUE}\u@\h ${BASH_PURPLE}branch:\$(parse_git_branch) ${BASH_YELLOW}kube-context:\$(__kube_ps1)\n${BASH_WHITEBOLD}./\W${BASH_RESETCOLOR}$ "
PATH="/usr/local/opt/curl/bin:/Users/tonychong/istio-1.5.4/bin:$PATH"
