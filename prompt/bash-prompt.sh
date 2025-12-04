# Sets up a custom, color-coded prompt in bash with Git information.

# color selectors
MAGENTA="\e[35m"
BROWN_YELLOW="\e[33m"
CYAN="\e[36m"
RESET_COLOR="\e[0m"

# Whenever a new shell opens, show the current Node version in purple
if command -v node &> /dev/null; then
    echo -e "${MAGENTA}Node $(\node -v)${RESET_COLOR}"
fi

PS1='\[\e]0;$PWD\007\]'    # set window title
PS1="$PS1"'\n'             # new line
PS1="$PS1${BROWN_YELLOW}"  # set color
PS1="$PS1"'\w'             # current working directory

if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1${CYAN}"        # set color
        PS1="$PS1"'`__git_ps1`'  # show current git branch
    fi
fi

PS1="$PS1${RESET_COLOR}"       # reset to default color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: $