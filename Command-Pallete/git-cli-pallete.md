# Git-cli command pallete

This page is a cheat sheet for GIT-CLI to improve interaction with git.

${{\color{orange}\Huge{\textsf{ Prompts }}}}\$

${{\color{MidnightBlue}\large{\textsf{ main: }}}}\$

`tag -l` - show verbose output about tags
`branch -a` - show verbose output about branches
`remote -v` - show verbose output about remotes

`git add -A && git commit -av` - commit all changes

`log --pretty=oneline -n 20 --graph --abbrev-commit` - View abbreviated SHA, description, and history graph of the latest 20 commits

`status -s` - view the current working tree status using the short format

`git pull; git submodule foreach git pull origin main` - pull in remote changes for the current repository and all its submodules

`clone --recursive` - clone a repository including all submodules


${{\color{MidnightBlue}\large{\textsf{ additional: }}}}\$

`git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat` - show the diff between the latest commit and the current state

`!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f` - switch to a branch, creating it if necessary

`commit --amend --reuse-message=HEAD` - amend the currently staged files to the latest commit

`!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f` - credit an author on the latest commit

`!r() { git rebase -i HEAD~$1; }; r` - interactive rebase with the given number of latest commits

`!f() { git branch -a --contains $1; }; f` - find branches containing commit

`!f() { git describe --always --contains $1; }; f` - find tags containing commit

`git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d` - remove branches that have already been merged with master

`shortlog --summary --numbered` - list contributors with number of commits

Merge GitHub pull request on top of the `main` branch:
```bash
!f() { \
if [ $(printf \"%s\" \"$1\" | grep '^[0-9]\\+$' > /dev/null; printf $?) -eq 0 ]; then \
    git fetch origin refs/pull/$1/head:pr/$1 && \
    git rebase main pr/$1 && \
    git checkout main && \
    git merge pr/$1 && \
    git branch -D pr/$1 && \
    git commit --amend -m \"$(git log -1 --pretty=%B)\n\nCloses #$1.\"; \
fi \
}; f"
```
