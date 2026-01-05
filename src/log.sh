is_log_level_list=(
    trace
    debug
    info
    warn
    error
    fatal
    panic
    none
    del
)
log_set() {
    if [[ $1 ]]; then
        for v in ${is_log_level_list[@]}; do
            [[ $(grep -E -i "^${1,,}$" <<<$v) ]] && is_log_level_use=$v && break
        done
        [[ ! $is_log_level_use ]] && {
            err "Cannot recognize log parameter: $@ \nUse $is_core log [${is_log_level_list[@]}] for configuration.\nNote: del parameter temporarily deletes log files; none parameter disables log generation."
        }
        case $is_log_level_use in
        del)
            rm -rf $is_log_dir/*.log
            msg "\n $(_green Log files temporarily deleted. To completely disable log generation use: $is_core log none)\n"
            ;;
        none)
            rm -rf $is_log_dir/*.log
            cat <<<$(jq '.log={"disabled":true}' $is_config_json) >$is_config_json
            ;;
        *)
            cat <<<$(jq '.log={output:"/var/log/'$is_core'/access.log",level:"'$is_log_level_use'","timestamp":true}' $is_config_json) >$is_config_json
            ;;
        esac

        manage restart &
        [[ $1 != 'del' ]] && msg "\nLog level updated to: $(_green $is_log_level_use)\n"
    else
        if [[ -f $is_log_dir/access.log ]]; then
            msg "\n Press $(_green Ctrl + C) to exit\n"
            tail -f $is_log_dir/access.log
        else
            err "Log file not found"
        fi
    fi
}