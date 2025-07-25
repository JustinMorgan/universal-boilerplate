@REM ####### CONVENIENCE SHORTCUTS FOR WINDOWS TERMINAL #########
@REM See README for installation

@echo off

@REM system
DOSKEY l=dir $*
DOSKEY rmd=rd /s /q $1

@REM git (requires the boilerplate .gitconfig)
DOSKEY br=git br $*
DOSKEY pl=git pl $*
DOSKEY ps=git ps $*
DOSKEY psu=git psu
DOSKEY sh=git sh
DOSKEY st=git st
DOSKEY sts=git sts

@REM node (requires node.js)
if exist "C:\Program Files\nodejs\nodevars.bat" (
    call "C:\Program Files\nodejs\nodevars.bat"
    DOSKEY ni=npm install $*
    DOSKEY nu=npm uninstall $*
    DOSKEY ns=npm start

    @REM delete the node_modules folder in the current location
    DOSKEY nr=rd /s /q node_modules

    @REM wipe out node_modules, then run a fresh npm install
    DOSKEY nri=rd /s /q node_modules $t npm install

    @REM wipe out node_modules, run npm install, then start your app
    DOSKEY nrs=rd /s /q node_modules $t npm install $t npm start
)

echo Boilerplate command-line shortcuts added.