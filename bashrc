# directory shortcut
alias be='cd /Users/kson/Documents/edge/rhombus/meta/be'
alias eb='cd /Users/kson/Documents/edge/rhombus/meta/cmn/edge-base'

# typescript
alias t='typings'

# bash
alias ll='ls -alG'

# docker
alias dops='docker ps'
alias dc='docker-compose'
alias docl='docker-container-list'
alias doil='docker-image-list'
alias dosa='docker stop $(docker ps -q)'
alias dorm='docker rm $(docker ps -qa --filter="status=exited")'
alias dormi='docker images -qf dangling=true | xargs docker rmi'
alias dora='docker rm -f $(docker ps -qa)'
alias dorv='docker volume rm $(docker volume ls -qf dangling=true)'
alias dost='docker stats $(docker ps --format {{.Names}})'
alias doec='docker exec -it'
alias dorn='docker run -ti --rm'
alias dce='dc -f dce.yml'

# docker run
alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias http='docker run -it --rm --net=host clue/httpie'
alias redis='docker run -it --rm --net=host redis redis-cli'
alias mvn='docker run -it --rm -v $PWD:/root -w /root maven mvn'
alias mongo='dorn --net=host mongo mongo'
alias s3='dorn --env-file=/Users/kson/.aws/envvars -v $PWD:/mac -w /mac xueshanf/awscli aws s3'
alias aws='dorn --env-file=/Users/kson/.aws/envvars -v $PWD:/mac -w /mac xueshanf/awscli aws'


# islands
function ver() {
    grep "version" $@/package.json | grep -Eo '"[0-9]+.*"' | grep -Eo '[^"]+'
}

# open
function swarm() {
    open http://apseo-swm-nfs.aaa.ad.ea.com/files/rhombus/meta.dl/meta/be/$@
}
function betago() {
    open http://apseo-swm-fo4.aaa.ad.ea.com/files/euclid/dev/server/game/$@
}
alias marked='open -a "Marked 2"'

# ----

set P4CONFIG=.p4config

#export EDITOR=emacs
#export P4EDITOR=emacs
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
