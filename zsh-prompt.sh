######## WORK IN PROGRESS ########

NODE_VERSION=$(\node -v)

echo "\033[36mNode $NODE_VERSION\033[0m"

# GIT_PROMPT_LOCATION=${GIT_PROMPT_LOCATION:-"~/git-prompt.sh"}

# if [[ -e $GIT_PROMPT_LOCATION ]]; then
#   echo $GIT_PROMPT_LOCATION
#   source $GIT_PROMPT_LOCATION
# fi
source ~/.git-prompt.sh

setopt PROMPT_SUBST
PS1=$'\n'

if typeset -f __git_ps1 >/dev/null 2>&1; then
  PS1="$PS1"'%F{90}`__git_ps1`%f '
fi

PS1="$PS1"'%F{33}%~%f $ '
RPROMPT="%F{111}[%D{%f/%m}|%@]"
