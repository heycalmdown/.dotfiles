source ~/.dotfiles/bash_aliases
source ~/.dotfiles/bash_exports

if [ -r ~/.ksonrc ]; then
	source ~/.ksonrc
fi

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

source ~/.dotfiles/bash-git-prompt/gitprompt.sh
if [ -d ~/.dotfiles/bashrc.d ]; then
    for i in ~/.dotfiles/bashrc.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f ".nvmrc" ]; then
  nvm use > /dev/null
else
  nvm use default > /dev/null
fi
