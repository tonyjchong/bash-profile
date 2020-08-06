export KOPS_STATE_STORE=
#export KOPS_STATE_STORE=
export KOPS_FEATURE_FLAGS=EnableExternalCloudController
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
#export AWS_PROFILE=
export KOPS_CLUSTER_NAME=
#export KOPS_CLUSTER_NAME=

# Colors
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



# Aliases
alias docs='cd ~/Documents'
alias gh='cd ~/Documents/github'
alias ngh='cd ~/Documents/notmyGithub'
alias lx='ls -ltha'
alias python=/usr/local/bin/python3
alias kiali='while true; do kubectl -n monitoring port-forward svc/kiali 20001:20001; done'
alias jaeger='while true; do kubectl --namespace monitoring port-forward svc/jaeger-query 16686; done'
alias prom='while true; do kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090; done'
alias am='while true; do kubectl --namespace monitoring port-forward svc/alertmanager-main 9093; done'
alias grafana='while true; do kubectl --namespace monitoring port-forward svc/grafana 3000; done'
alias argo='while true; do kubectl port-forward svc/argocd-server -n argocd 8080:443; done'
alias mkp='minikube ip && kubectl -n istio-system get service istio-ingressgateway -o jsonpath={.spec.ports[?(@.name==\"http2\")].nodePort}'
alias sshsandbox01='sudo ssh -A  -L  443:10.1.120.84:443 admin@jumpman01.sandbox01.lamdax-sandbox.com -N'
# Kubernetes stuff
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
        echo "(${CONTEXT})"
    fi
}


# Git stuff
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# Prompt
export PS1="$BASH_REDBOLD\t ${BASH_BLUE}\u@\h ${BASH_PURPLE}branch:\$(parse_git_branch) ${BASH_YELLOW}kube-context:\$(__kube_ps1)\n${BASH_WHITEBOLD}\w${BASH_RESETCOLOR}$ "
PATH="/usr/local/opt/curl/bin:~/istio-1.6.0/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:~/flutter/bin/:$PATH"

export PATH

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
