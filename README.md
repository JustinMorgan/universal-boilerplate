# Universal Boilerplate

Have you ever created a Git commit, pushed it, maybe even deployed it, and then realized it was missing some changes because you forgot to run `git add` first? How many times have you had to google a command because you couldn't remember which flags you're supposed to use? Well, I got tired of doing that. 

This repo contains tools and boilerplate designed to be useful on any project, featuring convenient shell shortcuts and extensive Git macros for convenience and safety.

# Table of contents

- [Quick setup](#quick-setup)
- [Using the boilerplate gitconfig](#using-the-boilerplate-gitconfig)
  - [Checking current Git state](#checking-current-git-state)
  - [Branching](#branching)
  - [Syncing changes](#syncing-changes)
  - [Committing](#committing)
  - [Turning back the clock](#turning-back-the-clock)
  - [Fixing mistakes](#fixing-mistakes)
- [Using the boilerplate shell profile](#using-the-boilerplate-shell-profile)
- [Using the boilerplate shell prompt](#using-the-boilerplate-shell-prompt)
- [Using the gitignore suite](#using-the-gitignore-suite)

# Quick Setup

All steps after the first are optional. Pick and choose as you like.

1.  **Clone this repo** to a local folder.
2.  **Import .gitconfig:** Add the following to the top of your personal `.gitconfig` in your home folder (`~/.gitconfig` or `$HOME/.gitconfig`). If you don't have this file, create it.

        [include]
            path = "<path/to/universal-boilerplate>/git-tools/.gitconfig"

3.  **Set up the command-line shortcuts:** For Unix-style shells like Bash, source `alias.sh` in your personal shell profile (`~/.bash_profile` or `~/.zshrc`).

        source <path/to/universal-boilerplate>/terminal-shortcuts/alias.sh

    Customizing a Windows terminal (CMD or PowerShell) is tricky. The easiest way is to find the Windows shortcut that runs CMD from your Start menu, click "Open File Location," and copy the actual shortcut file. Right click your copy and open its properties. On the Shortcut tab is a field called Target with the actual Windows command that runs your terminal. You'll want to change that command so it runs `alias.cmd` on startup.

        C:\Windows\System32\cmd.exe /k "<path\to\universal-boilerplate>\terminal-shortcuts\alias.cmd"

4.  **Improve your shell prompt:** Source `bash-prompt.sh` or `zsh-prompt.sh` in your personal shell profile as described above:

        source <path/to/universal-boilerplate>/shell-prompt/bash-prompt.sh

5.  **Create a .gitignore:** This one is different in that it's not already built for you. You'll want to manually create a .gitignore file according to your own setup, but you can get the code from the **git-tools/gitignore** folder. See below for more info.

# Using the boilerplate gitconfig (git-tools/.gitconfig)

The **.gitconfig** file is the primary feature here. It has an extensive set of aliases/macros designed to make Git more convenient, organize typical commands into workflows, provide constant visibility for your Git state, and protect you from easy mistakes. Typical usage is to include this file at the top of your personal .gitconfig. If you don't like any of the macros here, you can override them after the include.

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

# Using the command-line shortcuts (terminal-shortcuts/ folder)

Like .gitconfig, the two alias scripts are all about convenience. They set up shortcuts for common commands. Setup is described above. `alias.sh` should work fine in Bash or ZSH. `alias.cmd` should work for CMD, but it's untested in PowerShell.

# Improving your shell prompt (shell-prompt/ folder)

This will give you a nice, compact shell prompt with syntax-highlighted info about your current Git branch and the active Node version. Setup is described above. Source bash-prompt.sh for Bash or zsh-prompt.sh for ZSH.

For now, this isn't implemented for the Windows command line.

# Using the gitignore suite (git-tools/gitignore/ folder)

The **gitignore** folder (forked from https://github.com/github/gitignore) has a suite of .gitignore templates for different platforms, languages, IDEs, etc. You should find the ones that match your setup and combine them. For example, if you have an Angular app written in TypeScript that runs on Node and you work in Visual Studio Code, merge `Typescript.gitignore`, `Angular.gitignore`, `Node.gitignore`, and `VisualStudioCode.gitignore` into one .gitignore file on the root of your project. This is simpler than it sounds. You can clean up duplicate rules if you want, but it shouldn't matter.

.gitignore doesn't support `include` statements like .gitconfig, so you'll want to build one manually whenever you create a new project. Of course, you could script it or use [gitattribute filter drivers](https://git-scm.com/docs/gitattributes#_filter), but that's definitely overkill for most people. 
