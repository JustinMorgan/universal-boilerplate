####### CONVENIENCE SHORTCUTS FOR BASH-STYLE SHELLS #########
# Usage: Source this in your shell profile (~/.bash_profile or ~/.zshrc)

# system
alias l='ls -laghFG'
alias rmd='rm -rf'

# git (requires Git)
alias br='git branch'
alias pl='git pull'
alias ps='git push'
alias st='git status'
alias sts='git status -s'
alias sh='git show --oneline --decorate=short -s'
alias ss='git ss'    # requires the boilerplate .gitconfig
alias psu='git psu'  # requires the boilerplate .gitconfig

# node (requires node.js)
if which node > /dev/null
then
    alias ni='npm install'
    alias nu='npm uninstall'
    alias ns='npm start'    
    alias nr='rm -rf node_modules' # delete the node_modules folder in the current location    
    nri() { nr && ni; }            # wipe out node_modules, then run a fresh npm install    
    nrs() { nr && ni && ns; }      # wipe out node_modules, run npm install, then start your app
fi

echo Boilerplate shell shortcuts added