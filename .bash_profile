#
# ~/.bashrc
#

# ------------------------------------------------------------------------------
# 1. GENERAL STUFF
# ------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set PATH
# ------------------------------------------------------------------------------
export PATH="$PATH:/usr/local/bin:usr/local/sbin:$HOME/bin"

# Define some env variables
# ------------------------------------------------------------------------------
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR='vim'

# Customize prompt "user@host:~/Desktop/something (master)(minikube) $ "
# ------------------------------------------------------------------------------
function __prompt_command() {
    PS1=""

	local prompt_user="\[\033[36m\]\u\[\033[0m\]"
	local prompt_host="\[\033[33m\]\h\[\033[0m\]"
	local prompt_cwd="\[\033[34m\]\w\[\033[0m\]"
    # basic information (user@host:path)
    PS1+="$prompt_user@$prompt_host:$prompt_cwd"

	# git context 
	local prompt_git="\[\033[32m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[0m\]"
	PS1+="$prompt_git"

	# kubectl context
	local prompt_kubectl=""
	if [ -n "$PROMPT_KUBECTL_ENABLED" ]; then
		local prompt_kubectl_context
		local prompt_kubectl_color
		prompt_kubectl_context="$(kubectl config current-context)"
		if [ -n "$(echo $prompt_kubectl_context | grep staging)" ]; then
			prompt_kubectl_color="33m"
		elif [ -n "$(echo $prompt_kubectl_context | grep production)" ]; then
			prompt_kubectl_color="31m"
		else
			prompt_kubectl_color="36m"
		fi
		prompt_kubectl="\[\033[$prompt_kubectl_color\]($prompt_kubectl_context)\[\033[0m\]"
	fi

	PS1+="$prompt_kubectl"

	# prompt $ or # for root
	local prompt_bang="\[\033[0m\] \\\$ \[\033[0m\]"
	PS1+="$prompt_bang"
}
PROMPT_COMMAND=__prompt_command

# ------------------------------------------------------------------------------
# 2. Improve Terminal
# ------------------------------------------------------------------------------

export CLICOLOR=1
# default colors for ls
#export LSCOLORS=ExFxBxDxCxegedabagacad
# solarized colors for ls
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# vim as default editor
export GREP_OPTIONS='--color=auto'

# Aliases
# ------------------------------------------------------------------------------

case "$(uname -s)" in 
    Darwin)
        alias ls='ls -G'
        ;;
    Linux)
        alias ls='ls --color=auto'
        ;;
esac

# aliases of new commands
alias toggle_kubectl_prompt='if [ -z "$PROMPT_KUBECTL_ENABLED" ]; then PROMPT_KUBECTL_ENABLED="TRUE"; else unset PROMPT_KUBECTL_ENABLED; fi'
alias markdown='function _display_markdown() { cat $1 | pandoc -f markdown_github | browser; }; _display_markdown'
alias grepIp='grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"'

# ITERM 2 
# ------------------------------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# ------------------------------------------------------------------------------
# 3. History Customization
# ------------------------------------------------------------------------------

# avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# history size and file location
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTFILE=$HOME/.bash_history

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'; '}history -a; history -c; history -r"

#######################
# GCLOUD Installation #
#######################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vasco/bin/google-cloud-sdk/path.bash.inc' ]; then source '/Users/vasco/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vasco/bin/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/vasco/bin/google-cloud-sdk/completion.bash.inc'; fi

####################
# BASH COMPLETIONS #
####################

# brew bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Kubectl bash completion
source ~/bin/bash_completion/kubectl.bash_completion

# minikube bash completion
source ~/bin/bash_completion/minikube.bash_completion

########################
# RANDOM USELESS STUFF #
########################
## Personal and useless stuff
# check if it's monday and give motivation
case "$(date +%u)" in
    1) echo 'Hang on, be brave, get a coffee and start coding!'
        ;;
esac

