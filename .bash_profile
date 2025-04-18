# system
alias l='ls -laghFG'
alias rmd='rm -rf'

# git
alias pl='git pull'
alias st='git status'
alias br='git branch'

# node
alias ni='npm install'
alias nu='npm uninstall'
alias ns='npm start'
alias nr='rm -rf node_modules'
nri() { nr && ni; }
nrs() { nr && ni && ns; }

# start in the folder where your code is located
# cd /c/code