. ~/.dotfiles/bin/p4-completion.sh

function parse_p4_branch_dvcs () {
	P4INITROOT=`p4 set | grep P4INITROOT`
	if [ $? -eq 0 ]; then
		p4 switch 2> /dev/null | sed -e 's/\(.*\)/ (\1)/'
	fi
}

function parse_p4_branch () {
	#P4INITROOT=`p4 set | grep P4INITROOT`
	if [ $? -eq 0 ]; then
		p4 switch 2> /dev/null | sed -e 's/\(.*\)/ (\1)/'
	fi
}

function set_prompt_dvcs() {
	export PS1="\h:\W \u\[\e[1;34m\]\$(parse_p4_branch_dvcs)\[\e[0m\]\$ "
}


function set_prompt() {
	export PS1="\h:\W \u\[\e[1;34m\]\$(parse_p4_branch)\[\e[0m\]\$ "
}

function code () {
	VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

