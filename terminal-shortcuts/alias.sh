####### CONVENIENCE SHORTCUTS FOR BASH-STYLE SHELLS #########
# Usage: Source this in your shell profile (~/.bash_profile or ~/.zshrc)

# system
alias l='ls -laghFG'
alias rmd='rm -rf'

# git (requires the boilerplate .gitconfig)
alias pl='git pl'
alias st='git st'
alias sh='git sh'
alias br='git br'

# node (requires node.js)
alias ni='npm install'
alias nu='npm uninstall'
alias ns='npm start'
alias nr='rm -rf node_modules'
nri() { nr && ni; }
nrs() { nr && ni && ns; }