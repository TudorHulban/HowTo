## MX Linux
Create shell for the commands:
```bash
vi ~/.bash_aliases
# or
touch ~/.bash_aliases
```
See commands with `alias`.
```sh
alias ba='git branch -a'
alias bb='git branch'
alias dclean='docker rm -f `docker ps --no-trunc -aq` && docker images -q |xargs docker rmi -f'
alias depl='cd ~/ram && git clone git@github.com:TudorHulban/Deploy2020.git'
alias dprune='docker system prune -a --volumes'
alias glo='git log --pretty=format:"%h - %an, %ar : %s" -10'

alias mvmp4='find -name *.mp4 -exec mv {} . \;'
alias mvsrt='find -name *.srt -exec mv {} . \;'
alias r2='rm -rf *'
alias ra='cd ~/ram'
alias sec='gosec -no-fail ./... 2>&1 | tee ~/ram/sast-gosec.log'
alias wp='cd ~/ram && git clone git@github.com:TudorHulban/WP.git && cd WP'
```
For root aliases should go in `~/.bashrc`.

## CentOS
Aliases should go in `~/.bashrc`.
