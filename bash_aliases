# bash
alias ll='ls -alG'
alias wb='whalebrew'

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

