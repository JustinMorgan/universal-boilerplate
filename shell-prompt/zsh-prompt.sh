# Show current Node version upon opening the terminal
echo "\033[36mNode $(\node -v)\033[0m"

setopt PROMPT_SUBST
PS1=$'\n'
PS1="$PS1"'%F{33}%~%f'

# You may need to source git-prompt.sh to get access to the __git_ps1 function.
# See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh.
# source ~/.git-prompt.sh

if typeset -f __git_ps1 >/dev/null 2>&1; then
    PS1="$PS1"'%F{90}`__git_ps1`%f '
fi

PS1="$PS1"$'\n$ '
RPROMPT="%F{111}[%D{%f/%m}|%@]"
