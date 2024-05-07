## Backup all brew packages

Create a Brewfile with `brew bundle dump` prompt
It will create a Brewfile in your current directory with such format:

<img src="https://github.com/DrPalmeritta/BLOGS/blob/main/.screenshots/brewfile-example.png?raw=true" width="500">

Store the file somewhere safe (flash drive for instance)

## Reroll on other machine

Once the instanse ready to run:

Install Homebrew with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`<br />
from original [Brew](https://brew.sh/) source

Copy the Brewfile back to the new instance

Run `brew bundle install --file /path/to/Brewfile`

It will trigger the Brew on the new instance  🎉
