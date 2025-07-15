####### CONVENIENCE SHORTCUTS FOR BASH-STYLE SHELLS #########
# Usage: Source this in your shell profile (~/.bash_profile or ~/.zshrc)

# system
alias l='ls -laghFG'
alias rmd='rm -rf'

# git
alias pl='git pull'
alias st='git status'
alias sh='git show --oneline --decorate=short -s'
alias br='git branch'

# node
alias ni='npm install'
alias nu='npm uninstall'
alias ns='npm start'
alias nr='rm -rf node_modules'
nri() { nr && ni; }
nrs() { nr && ni && ns; }