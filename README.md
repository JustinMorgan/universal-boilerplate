# Universal Boilerplate

Have you ever created a Git commit, pushed it, maybe even deployed it, and then realized it was missing some changes because you forgot to run `git add` first? How many times have you had to google a command because you couldn't remember which flags you're supposed to use? Well, I got tired of doing that. 

This repo contains tools and boilerplate designed to be useful on any project, featuring convenient shell shortcuts and extensive Git macros for convenience and safety.

# Table of contents

- [Quick setup](#quick-setup)
- [Using the boilerplate gitconfig](#using-the-boilerplate-gitconfig)
  - [A few common macros you'll use a lot](#a-few-common-macros-youll-use-a-lot)
- [Using the command-line shortcuts](#using-the-command-line-shortcuts)
- [Improving your shell prompt](#improving-your-shell-prompt)
- [Using the gitignore suite](#using-the-gitignore-suite)

# Quick Setup

All steps after the first are optional. Pick and choose as you like.

1.  **Clone this repo** to your machine.
2.  **Import .gitconfig:** Add the following to the top of your personal global `.gitconfig` (`~/.gitconfig` or `$HOME/.gitconfig`). If you don't have this file, create it.

        [include]
            path = "<path/to/universal-boilerplate>/git-tools/.gitconfig"

3.  **Set up the command-line shortcuts:** For Unix-style shells like Bash, source `shortcuts.sh` in your personal shell profile (`~/.bash_profile` or `~/.zshrc`).

        source <path/to/universal-boilerplate>/shortcuts/shortcuts.sh

    Customizing a Windows command line (CMD or PowerShell) is trickier. If you open the Windows Terminal app and press `Ctrl-,`, it should open the settings. Find your preferred terminal program under Profiles and edit the command line that runs it. For CMD, the profile is named "Command Prompt" and the command should be something like:

        %SystemRoot%\System32\cmd.exe /k "<path\to\universal-boilerplate>\shortcuts\shortcuts.cmd"

4.  **Improve your shell prompt:** Source `bash-prompt.sh` or `zsh-prompt.sh` in your personal shell profile as described above:

        source <path/to/universal-boilerplate>/prompt/bash-prompt.sh

5.  **Create a .gitignore:** This one is different in that it's not pre-built. You'll want to manually create a .gitignore file according to your own setup, but you can get the code from the `git-tools/gitignore` folder. See below for more info.

# Using the boilerplate gitconfig

The `git-tools/.gitconfig` file is the primary feature here. It has an extensive set of aliases/macros designed to make Git more convenient, organize typical commands into workflows, provide constant visibility for your Git state, and protect you from easy mistakes. Typical usage is to include this file at the top of your personal .gitconfig. If you don't like any of the macros here, you can override them after the include.

The `cm`, `cmv`, and related commands deserve special attention. They include `add`, `commit`, and displaying the result into a convenient, safer workflow. They'll save typing, but most of all they'll keep you aware of your repo's state and make sure you never forget to add your changes. You shouldn't ever need to use `commit` (or its shortcut `ci`) unless you're doing something specific.

There's extensive documentation inside the file, so read it for more information.

### A few common macros you'll use a lot:

    #$> git ss                       # Show your current branch, the last commit, and current status
    #$> git cm "I did a thing"       # Add all changes, create a commit, and display the resulting state
    #$> git save                     # Quicksave: Instantly make a commit with a default message
    #$> git new new_branch_name      # Create a new branch and switch to it
    #$> git co existing_branch_name  # Switch to an existing branch
    #$> git pl                       # Simple alias for `git pull`
    #$> git ps                       # Simple alias for `git push`
    #$> git psu                      # Push, but also set the upstream branch automatically (use this
                                     # whenever you first push a new branch to origin)

# Using the command-line shortcuts

Like .gitconfig, the two scripts in the `shortcuts/` folder are all about convenience. They set up shortcuts for common commands. [Setup is described above.](#quick-setup) `shortcuts.sh` should work fine in Bash or ZSH. `shortcuts.cmd` should work for CMD. A Powershell version is coming.

# Improving your shell prompt

This will give you a nice, compact shell prompt with syntax-highlighted info about your current Git branch and the active Node version. [Setup for Bash and ZSH is described above.](#quick-setup) For now, this isn't implemented for the Windows terminal.

# Using the gitignore suite

The **gitignore** folder (forked from https://github.com/github/gitignore) has a suite of .gitignore templates for different platforms, languages, IDEs, etc. You should find the ones that match your setup and combine them. For example, if you have an Angular app written in TypeScript that runs on Node and you work in Visual Studio Code, merge `Typescript.gitignore`, `Angular.gitignore`, `Node.gitignore`, and `VisualStudioCode.gitignore` into one .gitignore file on the root of your project. This is simpler than it sounds. You can clean up duplicate rules if you want, but it shouldn't matter.

.gitignore syntax doesn't support `include` statements like .gitconfig, so you'll want to build one manually whenever you create a new project. Of course, you could script it or use [gitattribute filter drivers](https://git-scm.com/docs/gitattributes#_filter), but that's overkill for most people. 
