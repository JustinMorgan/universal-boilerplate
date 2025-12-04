# Universal Boilerplate

Have you ever created a Git commit, pushed it, maybe even deployed it, and then realized it was missing some changes because you forgot to run `git add` first? How many times have you had to google a command because you couldn't remember which flags you're supposed to use? Well, I got tired of doing that. 

This repo contains tools and boilerplate designed to be useful on any project, featuring convenient shell shortcuts and extensive Git macros for convenience and safety.

# Table of contents

- [Quick setup](#quick-setup)
  - [1. Clone this repo to your machine](#1-clone-this-repo-to-your-machine)
  - [2. Import .gitconfig](#2-import-gitconfig)
  - [3. Set up the command-line shortcuts](#3-set-up-the-command-line-shortcuts)
  - [4. Improve your shell prompt](#4-improve-your-shell-prompt)
  - [5. Create a .gitignore file](#5-create-a-gitignore-file)
- [Using the boilerplate gitconfig](#using-the-boilerplate-gitconfig)
  - [A few common macros you'll use a lot](#a-few-common-macros-youll-use-a-lot)
  - [Setting defaultBranch (optional)](#setting-defaultbranch-optional)
- [Using the command-line shortcuts](#using-the-command-line-shortcuts)
  - [Linux/MacOS/Git Bash/Other Unix-style shells](#linuxmacosgit-bashother-unix-style-shells)
  - [Windows command line (CMD)](#windows-command-line-cmd)
  - [PowerShell](#powershell)
- [Improving your shell prompt](#improving-your-shell-prompt)
- [Using the gitignore suite](#using-the-gitignore-suite)

# Quick Setup

All steps after the first are optional. 

### 1. Clone this repo to your machine

    git clone https://github.com/JustinMorgan/universal-boilerplate.git

### 2. Import .gitconfig

Add the following to the top of your personal global gitconfig file (`~/.gitconfig` or `%UserProfile%\.gitconfig`). If you don't have this file, create it.

    [include]
        path = "<path/to/universal-boilerplate>/git-tools/.gitconfig"

### 3. Set up the command-line shortcuts

- #### Linux/MacOS/Git Bash/Other Unix-style shells: 

    Source `shortcuts.sh` in your personal shell profile (`~/.bash_profile` or `~/.zshrc`):

        source <path/to/universal-boilerplate>/shortcuts/shortcuts.sh

- #### Windows command line (CMD):

    Customizing CMD is trickier: 
    1. Open a Windows Terminal. 
    2. At the top, where the tabs are, there should be a dropdown next to the "+" button that opens a new tab. Open it and click Settings. 
    3. On the left side of the settings window, you should see a "Profiles" section. Find the "Command Prompt" profile.
    4. Edit the "Command Line" string so you can start CMD with a custom command. The line you want is something like:

            %SystemRoot%\System32\cmd.exe /k "<path\to\universal-boilerplate>\shortcuts\shortcuts.cmd"

- #### PowerShell:

    Source `shortcuts.ps1` in your PowerShell profile. The simplest way to do this is the following (make sure you swap in the correct file path):

        if (!(Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }
        Add-Content -Path $PROFILE -Value "`n. <path\to\universal-boilerplate>\shortcuts\shortcuts.ps1"

    You may also need to enable local script execution:

        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

### 4. Improve your shell prompt

Source `bash-prompt.sh` or `zsh-prompt.sh` in your personal shell profile as described above:

    source <path/to/universal-boilerplate>/prompt/bash-prompt.sh

For now, custom prompts aren't implemented for CMD or PowerShell.

### 5. Create a .gitignore file

This one is different in that it's not pre-built. You'll want to manually create a .gitignore file according to your own setup, but you can get the code from the `git-tools/gitignore/` folder. [See below for details.](#using-the-gitignore-suite)

# Using the boilerplate gitconfig

<img width="560" height="398" alt="image" src="https://github.com/user-attachments/assets/501889b6-bd02-4cc9-b954-9f99f8cb900d" />

The `git-tools/.gitconfig` file is the main feature here. It has an extensive set of aliases/macros designed to make Git more convenient, organize common tasks into workflows, provide constant visibility for your Git state, and protect you from easy mistakes. Typical usage is to include this file at the top of your global .gitconfig. If you don't like any of the macros here, you can override them yourself.

The `cm`, `cmv`, and related commands deserve special attention. They encapsulate the process of adding your changes, committing them, and showing the result into a convenient, safer workflow you run in a single step. They'll save typing, but most of all they'll keep you aware of your repo's current state and make sure you never forget to add your changes. You shouldn't ever need the standard Git `commit` command (or its shortcut `ci`) unless you're doing something unusual.

There's extensive documentation in the file, so read it for more information.

### A few common macros you'll use a lot:

    #$> git ss                       # Show your current branch, the last commit, and current status
    #$> git cm "I did a thing"       # Add all changes, commit them, and display the resulting state
    #$> git save                     # Quicksave: Instantly add and commit with a default message
    #$> git new new_branch_name      # Create a new branch and switch to it
    #$> git co existing_branch_name  # Checkout an existing branch
    #$> git pl                       # Simple alias for `git pull`
    #$> git ps                       # Simple alias for `git push`
    #$> git psu                      # Push, but also set the upstream branch automatically (use this
                                     # whenever you first push a new branch to origin)

### Setting defaultBranch (optional)

A few of the more advanced macros reference your main/master branch; for example, `git upd` pulls the latest updates for the main branch, then merges those changes into your current working branch. By default, the main branch is called `master`, but not everyone uses that. 

All such macros allow you to specify a main branch name; for example, `git upd int` will pull the latest from `int` instead of `master`. If `int` is your main branch, `git upd int` will work fine. 

If you want to save even more typing and just type `git upd`, then you need to configure Git to use `int` instead of `master`. This can be done in your global `~/.gitconfig` file or a local `.gitconfig` inside your project. Just add the following lines:

    [init]
        defaultBranch = <your main branch name>

# Using the command-line shortcuts

<img width="511" height="267" alt="image" src="https://github.com/user-attachments/assets/6c2e2b8c-fcfc-4627-81ba-c05ec7e6ebd1" />

Like .gitconfig, the shortcut scripts are all about making the command line easy and convenient. They set up aliases for common commands and workflows. There's some extra functionality for Node developers, but anyone who uses Git should benefit. Other platforms are coming.

[Setup is described above.](#3-set-up-the-command-line-shortcuts)

# Improving your shell prompt

<img width="504" height="216" alt="image" src="https://github.com/user-attachments/assets/8d311afd-9526-431c-947e-cb4d8599d105" />

This will give you a nice, compact shell prompt with syntax-highlighted info about your current Git branch and the active Node version, if any.

[Setup for Bash and ZSH is described above.](#4-improve-your-shell-prompt) For now, custom prompts aren't implemented for CMD or PowerShell.

# Using the gitignore suite

The **gitignore** folder (forked from https://github.com/github/gitignore) has a suite of .gitignore templates for different platforms, languages, IDEs, etc. You should find the ones that match your setup and combine them. For example, if you have an Angular app written in TypeScript that runs on Node and you work in Visual Studio Code, merge `Typescript.gitignore`, `Angular.gitignore`, `Node.gitignore`, and `VisualStudioCode.gitignore` into one .gitignore file on the root of your project. This is simpler than it sounds. You can clean up duplicate rules if you want, but it shouldn't matter.

.gitignore syntax doesn't support `include` statements like .gitconfig, so you'll want to build one manually whenever you create a new project. Of course, you could script it or use [gitattribute filter drivers](https://git-scm.com/docs/gitattributes#_filter), but that's overkill for most people. 
