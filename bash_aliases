eval $(thefuck --alias)

# bash
alias ll='ls -alG'
alias wb='whalebrew'
alias shit='fuck'

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

# docker run
alias dockviz="dorn nate/dockviz"
alias http='docker run -it --rm --net=host clue/httpie'
alias redis='docker run -it --rm --net=host redis redis-cli'
alias mvn='docker run -it --rm -v $PWD:/root -w /root maven mvn'
alias mongo='dorn --net=host mongo mongo'
alias s3='dorn --env-file=/Users/kson/.aws/envvars -v $PWD:/mac -w /mac xueshanf/awscli aws s3'
alias aws='dorn --env-file=/Users/kson/.aws/envvars -v $PWD:/mac -w /mac xueshanf/awscli aws'

# loadtest
alias sba="./sphd_betago_aws.py act_betago_aws_config_loadtest.yml"
alias eco='eval $(dm env act-consul-000)'
alias erp='eval $(dm env act-redis-predixy-000)'
alias ega='eval $(dm env act-gateway-000)'
alias eg2='eval $(dm env act-gateway-001)'
alias epu='eval $(dm env act-push-000)'
alias ep2='eval $(dm env act-push-001)'
alias ecs='eval $(dm env act-common-swarm-000)'

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
