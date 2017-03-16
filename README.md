# Universal Boilerplate
Some basic necessities for any project, including my go-to .gitconfig and a collection of .gitignore files for various platforms. 

# Setup

## Quick setup

1. Find the `.gitconfig` file in the root of this project. If you're on Linux/UNIX, you'll have to show hidden files to find it.
2. Find the appropriate `.gitignore` file for your platform and/or IDE. The one for Node.js (with Cloud9 IDE) is already in the 
project root. If that's not what you need, look in the `gitignore/` and `gitignore/global/` folders for many others. Replace the 
default `.gitignore` with the one for your environment.
3. Copy `.gitconfig` and `.gitignore` into the root of your development project. Alternatively, copy them into your home folder to 
affect your global Git settings.

## Even quicker setup (Node.js only)

Simply clone this repo, delete the `.git/` folder and everything but `.gitconfig` and `.gitignore`, and use it as the root of your 
new development project.

# Usage

The most important part of this repo is the `.gitconfig`, file which contains a bunch of macros to make Git more convenient and safer. 
Apart from being shorter to type, they're designed to encapsulate parts of your workflow so you don't have to worry about forgetting a 
step or breaking a team convention. All are documented in the `[alias]` section of the `.gitconfig` file, but here are the most common 
and useful ones:

### Status checks

    #$> git ss  # See current commit status, current branch, and last commit (good way to generally get your bearings)
    
### Branching

    #$> git new new_branch   # Create a new branch and switch to it
    #$> git go other_branch  # Switch to an existing branch
    
### Syncing and merging

    #$> git pl                # Pull latest from origin (simple alias for `git pull`)
    #$> git ps                # Push changes to origin (simple alias for `git push`)
    #$> git mnf other_branch  # Merge, but create a merge commit even if fast-forwarding is possible
    
### Committing changes

    #$> git com "I did a thing"  # Add all untracked files, commit everything with the given message (echoing mode)
    #$> git save                 # Quicksave: Create a commit with a default message (you can also specify one)
                                    
Both `com` and `save` automatically run `git add --all`, so you don't have to worry about forgetting to add your changes. `save` can be used 
in place of `git stash`, but it has the advantage of preserving a trail in the Git log. This is especially useful for the `uncommit` and 
`undo` macros below.
    
### Turning back the clock

    #$> git uncommit  # Reopen the last commit, but don't undo the changes
    
This won't erase any of your file changes, but it will make it as though you never committed them. You can rewrite the commit message, add
changes, or move to a different branch and redo the commit.

    #$> git undo      # If there are uncommitted changes: Dump all uncommitted changes.
                      # If there are no uncommitted changes: Dump the last commit and roll back to the previous one.
    
Both `uncommit` and `undo` automatically create a quicksave with the `save` macro, so it's safe to make mistakes with them. Even though it 
looks like you threw away all uncommitted changes or erased the last commit, they're still reachable as a "detached" commit. If you change 
your mind, all you have to do is find the hash of the quicksave commit (there are ways of doing this).

### Amending un-pushed commits (potentially risky, see below)

    #$> git reword "New message"  # Enter a new commit message for the most recent commit
    #$> git amend                 # Add all changes (including untracked files), then add current changes to last commit
    
NOTE: Both of these macros use the `git commit --amend` command to alter an existing commit. Do **NOT** `amend` or `reword` commits you've 
already pushed to a remote! This will cause your Git histories to diverge, which will inevitably lead to problems.

