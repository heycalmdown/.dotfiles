# bash
#alias ll='ls -alG'

# modern commands
alias ll='exa -al --icons'
alias cat=bat

# Git
alias merged='here=$(git branch --show-current); git switch main; git branch -D $here; git pull'
alias pr='BRANCH=$(git branch --show-current); gp --set-upstream origin $BRANCH; gh pr create --base main --head $BRANCH --fill --web'

alias thmerged='here=$(git branch --show-current); git switch thailand; git branch -D $here; git pull'
alias thpr='BRANCH=$(git branch --show-current); gp --set-upstream origin $BRANCH; gh pr create --base thailand --head $BRANCH --fill --web'

# Plugo APIs
alias od='curl https://faas.plugo.town/helper/orders/by-days | npx json-console-table'
alias od5='curl https://faas.plugo.town/helper/orders/by-days\?d=5 | npx json-console-table'
alias oo='curl https://faas.plugo.town/helper/open-orders | npx json-console-table'
alias oo1='curl https://faas.plugo.town/helper/open-orders\?d=1 | npx json-console-table'
alias oo-1='curl https://faas.plugo.town/helper/open-orders\?d=-1 | npx json-console-table'
alias om='curl https://faas.plugo.town/helper/orders/by-min | npx json-console-table'
alias om-1='curl https://faas.plugo.town/helper/orders/by-min\?d=-1 | npx json-console-table'
alias om1='curl https://faas.plugo.town/helper/orders/by-min\?d=1 | npx json-console-table'
alias o10m='curl https://faas.plugo.town/helper/orders/by-min\?m=10 | npx json-console-table'
alias o10m-1='curl https://faas.plugo.town/helper/orders/by-min\?m=10\&d=-1 | npx json-console-table'

# docker
alias dops='docker ps'
alias dc='docker-compose'
alias dm='docker-machine'
alias docl='docker-container-list'
alias doil='docker-image-list'
alias dosa='docker stop $(docker ps -q)'
alias dorm='docker rm $(docker ps -qa --filter="status=exited")'
alias dormi='docker images -qf dangling=true | xargs docker rmi'
alias dora='docker rm -f $(docker ps -qa)'
alias dorv='docker volume rm $(docker volume ls -qf dangling=true)'
alias dost='docker stats $(docker ps --format {{.Names}})'
alias doec='docker exec -it'
alias dorn='docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock'
alias dce='dc -f dce.yml'

alias dsrm='docker stack rm'
alias dsdp='docker stack deploy --with-registry-auth -c docker-compose.yml'
alias dsr='docker service'

# functions
function dolog_first {
  KEYWORD=$1
  FIRST=`docker ps | grep $KEYWORD | awk '{ print $1 }' | head -1`
  docker logs -f $FIRST
}

function doec_first {
  KEYWORD=$1
  FIRST=`docker ps | grep $KEYWORD | awk '{ print $1 }' | head -1`
  doec $FIRST bash
}

function sample_env {
  export RABBITMQ_HOST=amqp://island:devenv@localhost
  export REDIS_HOST=localhost
  export REDIS_AUTH=devenv
  export CONSUL_HOST=localhost
}
