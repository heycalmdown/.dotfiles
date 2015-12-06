alias ll='ls -alG'
alias bn='babel-node'
alias evdev='eval $(dm env dev)'
alias dm='docker-machine'
alias dc='docker-compose'
alias docl='docker-container-list'
alias doil='docker-image-list'
alias dora='docker rm -f $(docker ps -qa)'
alias dorm='docker rm $(docker ps -qa --filter="status=exited")'
alias dormi='docker images -qf dangling=true | xargs docker rmi'
alias dockviz="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

alias eg='open -a emacs'
alias vscode='open -a "Visual Studio Code" .'

set P4CONFIG=.p4config

export EDITOR=emacs
export P4EDITOR=emacs
export PATH=~/Documents/bin:~/.dotfiles/bin:$PATH
#export JAVA6_HOME=$(/usr/libexec/java_home -v 1.6)
#export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
#export JAVA_HOME=$JAVA6_HOME;

source ~/.dotfiles/bash-git-prompt/gitprompt.sh
if [ -d ~/.dotfiles/bashrc.d ]; then
    for i in ~/.dotfiles/bashrc.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi


export NVM_DIR="/Users/kson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
