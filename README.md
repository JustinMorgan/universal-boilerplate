# Universal Boilerplate

Some basic necessities for any project, featuring convenient shell shortcuts and extensive Git macros for convenience and safety.

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

1.  Clone this repo to a local folder.
2.  Import .gitconfig: Add the following to the top of your personal .gitconfig in your home folder (~/ or $HOME/). If you don't have this file, create it.

        [include]
            path = "<path/to/universal-boilerplate>/.gitconfig"

3.  Import shell macros: Import shell-macros.sh into your personal shell profile. This will be `~/.bash_profile` for Bash and `~/.zshrc` for ZSH.

        source <path/to/universal-boilerplate>/shell-macros.sh

4.  Import bash-prompt.sh or zsh-prompt.sh into your personal shell profile as described above:

        source <path/to/universal-boilerplate>/bash-prompt.sh

5.  Create a .gitignore: You'll probably want to manually create a .gitignore file whenever you start a new project, but you can get the code from the **gitignore** folder. See below for more info.

# Using the boilerplate gitconfig

The **.gitconfig** file in the root is the primary feature here. It sets up extensive macros designed to make Git more convenient, organize typical commands into workflows, provide constant visibility for your Git state, and protect you from easy mistakes like using the wrong flag or forgetting to run `git add` before committing.

Intended usage is to include this at the top of your personal .gitconfig, followed by any more personalization or overrides you want.

There's extensive documentation inside the file, so read it for more information. Here are some examples you'll probably use a lot:

### Checking current Git state

    #$> git ss

This shows your current Git status, current branch, and a one-line summary of the last commit. It's a good way to get your bearings.

### Branching

    #$> git new new_branch_name      # Create a new branch and switch to it
    #$> git co existing_branch_name  # Switch to an existing branch

### Syncing changes

    #$> git pl   # Simple alias for `git pull`
    #$> git ps   # Simple alias for `git push`
    #$> git psu  # Push, but also set the upstream branch automatically
                 # (equivalent to `git push --set-upstream <current_branch_name>`)

### Committing

    #$> git cm "I did a thing"   # Add all untracked files, commit everything with the given message, and display the resulting state
    #$> git save                 # Quicksave: Create a commit with a default message. You can always change it later.

Both of these automatically run `git add --all`, so you don't ever have to push a commit and then realize you still have unstaged changes or untracked files.

### Turning back the clock

    #$> git uncommit

This keeps your changes, but it will be as if you never committed them. You can rewrite the commit message, add more changes, or move to a different branch and redo the commit.

    #$> git undo

If there are uncommitted changes, this will drop them. If there are no uncommitted changes, it rolls back to the previous commit. The key here is that it automatically quicksaves to a "detached" commit, so unlike `git reset --hard`, you have an emergency parachute if you make a mistake. Even though it looks like you threw out your changes or erased the last commit, they're still reachable. You can locate and restore them via the reflog.

### Fixing mistakes

    #$> git reword "New message"

This simply lets you change the commit message for the previous commit. **Do not use if you've already pushed the commit!**

    #$> git amend

Forgot a piece of code? Committed and then realized you didn't save a file? This will add all current changes to the previous commit. Like `cm` and `save`, it automatically runs `add` first so you know all your changes will be included. **Do not use if you've already pushed the commit!**

# Using the boilerplate shell macros

Like .gitconfig, shell-macros.sh is all about convenience macros. Just source it in your personal shell profile as described above. It should work fine in Bash or ZSH.

# Using the boilerplate shell prompt

This will give you nice, compact shell prompt with syntax-highlighted info about your current Git branch and the active Node version. Setup is described above. Source bash-prompt.sh for Bash or zsh-prompt.sh for ZSH.

# Using the gitignore suite

The **gitignore** folder (forked from https://github.com/github/gitignore) has a suite of .gitignore templates for different platforms, languages, IDEs, etc. Use these as a guide to combine all the rules that match your situation into one file that covers all your bases. For example, if you have a TypeScript/Angular app that runs on Node and you work in Visual Studio Code, combine Typescript.gitignore, Angular.gitignore, Node.gitignore, and VisualStudioCode.gitignore into one .gitignore file on the root of your project.

.gitignore doesn't support `include` statements like .gitconfig, so you'll want to build one manually whenever you create a new project. Certainly you could script it or use [gitattribute filter drivers](https://git-scm.com/docs/gitattributes#_filter), but that's probably overkill. Just look through the gitignore folder for the file(s) that match your platform, language, development environment, etc. and combine their contents. You can clean up duplicate rules if you want, but it shouldn't matter.
