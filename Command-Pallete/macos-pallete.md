# MacOS command pallete

This page is cheat sheet for macOS terminal to optimize productivity.

${{\color{orange}\Huge{\textsf{ Aliases }}}}\$

${{\color{MidnightBlue}\large{\textsf{ easier navigation: }}}}\$

`alias ..="cd .."`

`alias ...="cd ../.."`

`alias ....="cd ../../.."`

`alias .....="cd ../../../.."`

`alias ~="cd ~"` - `cd` is probably faster to type though

`alias -- -="cd -"`

${{\color{MidnightBlue}\large{\textsf{ IP addresses: }}}}\$

`alias ip="dig +short myip.opendns.com @resolver1.opendns.com"`

`alias localip="ipconfig getifaddr en0"`

`alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"`

${{\color{MidnightBlue}\large{\textsf{ cleaning: }}}}\$

`alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"` - recursively delete `.DS_Store` files

`alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"` - kill all the tabs in Chrome to free up memory & [[C] explained](http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description)

`alias reload="exec $SHELL -l"` - reload the shell (i.e. invoke as a login shell)

${{\color{orange}\Huge{\textsf{ Network }}}}\$

`networkQuality -v` - speedtest due to terminal

`curl ipinfo.io` - useful to quickly summarize localhost's net info

`sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder` - terminal dns flush
