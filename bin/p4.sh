    if ((options[option] || {}).constructor !== p4option.type) return;
rce completion by Frank Cusack <frank@google.com>

_p4()
{
    local cur prev words cword
    _init_completion || return

    local p4commands p4filetypes

    # rename isn't really a command
    p4commands="$( p4 help commands 2>/dev/null | awk 'NF>3 {print $1}' )"
    p4filetypes="ctext cxtext ktext kxtext ltext tempobj ubinary \
        uresource uxbinary xbinary xltext xtempobj xtext \
        text binary resource"

    if [ $cword -eq 1 ]; then
        COMPREPLY=( $( compgen -W "$p4commands" -- "$cur" ) )
    elif [ $cword -eq 2 ]; then
        case $prev in
            help)
                COMPREPLY=( $( compgen -W "simple commands \
                    environment filetypes jobview revisions \
                    usage views $p4commands" -- "$cur" ) )
                ;;
            admin)
                COMPREPLY=( $( compgen -W "checkpoint stop" -- "$cur" ) )
                ;;
            *)
                ;;
        esac
    elif [ $cword -gt 2 ]; then
        case $prev in
            -t)
                case ${words[$cword-2]} in
                    add|edit|reopen)
                        COMPREPLY=( $( compgen -W "$p4filetypes" -- "$cur") )
                        ;;
                    *)
                        ;;
                esac
                ;;
            *)
                ;;
        esac
    fi

    return 0
} &&
complete -F _p4 -o default p4 g4

# Local variables:
# mode: shell-script
# sh-basic-offset: 4
# sh-indent-comment: t
# indent-tabs-mode: nil
# End:
# ex: ts=4 sw=4 et filetype=sh

