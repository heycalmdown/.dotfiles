# bash
#alias ll='ls -alG'
alias inet='ifconfig | grep inet\ '

# modern commands
alias ll='exa -al --icons'
alias cat=bat

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

# whalelike
alias xhyve='docker run --rm -it --privileged --pid=host walkerlee/nsenter -t 1 -m -u -i -n sh'

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
