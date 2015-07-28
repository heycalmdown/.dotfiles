alias ll='ls -alG'
export EDITOR=vim
set P4CONFIG=.p4config
export P4EDITOR=vim
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'

if [ -d ~/.dotfiles/bashrc.d ]; then
    for i in ~/.dotfiles/bashrc.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi

