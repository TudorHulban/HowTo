# MX Linux

Create shell for the commands:

```sh
vi ~/.bash_aliases
# or
touch ~/.bash_aliases
```

See commands with `alias`.

```sh
alias ba='git branch -a'
alias bb='git branch'
alias bs='git status'

alias dclean='docker rm -f `docker ps --no-trunc -aq` && docker images -q |xargs docker rmi -f'
alias dprune='docker system prune -a --volumes'
alias glo='git log --pretty=format:"%h - %an, %ar : %s" -10'

alias mvmp4='find -name *.mp4 -exec mv {} . \;'
alias mvsrt='find -name *.srt -exec mv {} . \;'
alias mvvtt='find -name *.vtt -exec mv {} . \;'

alias box='cd ~/ram && git clone git@github.com:TudorHulban/sandbox.git && cd sandbox'

alias r2='cd ~/ram && rm -rf *'
alias ra='cd ~/ram'
alias sec='gosec -no-fail ./... 2>&1 | tee ~/ram/sast-gosec.log'
```

For root aliases should go in `~/.bashrc`.

## Redhat based distros

Aliases should go in `~/.bashrc`.

```sh
echo "alias vi='vim'" | tee -a ~/.bashrc
echo "alias l='ls -la'" | tee -a ~/.bashrc
```

## Mac OS

Switch to `bash`:

```sh
chsh -s /bin/bash
# verify
echo $0
```

Refer bash settings:

```sh
touch ~/.bash_profile
# add
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```
