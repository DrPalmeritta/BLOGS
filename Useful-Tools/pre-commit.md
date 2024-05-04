## Installation

Before you can run hooks, you need to have the pre-commit package manager installed.

Using homebrew:

`brew install pre-commit`

`pre-commit --version` should show you what version you're using

## Add a pre-commit configuration

create a file named `.pre-commit-config.yaml` in the root of your project. Here you can see an example: [PRE-COMMIT-CONFIG](https://github.com/DrPalmeritta/palmeritta-helm-repo/blob/main/.pre-commit-config.yaml)

Pre-commit works for any programming language

## Install the git hook scripts

Run `pre-commit install` to set up the git hook scripts

Now pre-commit will run automatically on `git commit`!
