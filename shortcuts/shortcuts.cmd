@REM ####### CONVENIENCE SHORTCUTS FOR WINDOWS TERMINAL #########
@REM See README for installation

@echo off

@REM system
DOSKEY l=dir $*
DOSKEY rmd=rd /s /q $1

@REM git (requires Git)
DOSKEY br=git branch $*
DOSKEY pl=git pull $*
DOSKEY st=git status
DOSKEY sts=git status -s
DOSKEY sh=git show --oneline --decorate=short -s
DOSKEY ss=git ss     @REM requires the boilerplate .gitconfig

@REM node (requires node.js)
if exist "C:\Program Files\nodejs\nodevars.bat" (
    call "C:\Program Files\nodejs\nodevars.bat"
    DOSKEY ni=npm install $*
    DOSKEY nu=npm uninstall $*
    DOSKEY ns=npm start    
    DOSKEY nr=rd /s /q node_modules                                @REM delete the node_modules folder in the current location    
    DOSKEY nri=rd /s /q node_modules $t npm install                @REM wipe out node_modules, then run a fresh npm install    
    DOSKEY nrs=rd /s /q node_modules $t npm install $t npm start   @REM wipe out node_modules, run npm install, then start your app
)

echo Boilerplate CMD shortcuts added