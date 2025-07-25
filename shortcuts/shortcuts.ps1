####### CONVENIENCE SHORTCUTS FOR POWERSHELL #########
# See README for installation

# system
New-Alias l Get-ChildItem
Function rmd { 
    param ($Target)
    Remove-Item -Path $Target -Recurse
}

# git (requires Git)
Function br { git branch }
Function pl { git pull }
Function ps { git push }
Function st { git status }
Function sts { git status -s }
Function sh { git show --oneline --decorate=short -s }
Function ss { git ss }    # requires the boilerplate .gitconfig
Function psu { git psu }  # requires the boilerplate .gitconfig

# node (requires node.js)
if ($null -ne (Get-Command node -ErrorAction SilentlyContinue)) {
    Function i { npm install }       # we can't use "ni" because it's already in use
    Function nu { npm uninstall }
    Function ns { npm start }
    Function nr { rmd node_modules } # delete the node_modules folder in the current location
    Function nri { nr; i }           # wipe out node_modules, then run a fresh npm install
    Function nrs { nr; i; ns }       # wipe out node_modules, run npm install, then start your app
}

Write-Output "Boilerplate PowerShell shortcuts added`n"
