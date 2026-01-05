show_help() {
    case $1 in
    api | x25519 | tls | run | uuid | version)
        $is_core_bin help $1 ${@:2}
        ;;
    *)
        [[ $1 ]] && warn "Unknown option '$1'"
        msg "$is_core_name script by $author"
        msg "Usage: $is_core [options]... [args]... "
        msg
        help_info=(
            "Basic:"
            "   v, version                                      Show current version"
            "   ip                                              Return current host IP"
            "   pbk                                             Equivalent to $is_core generate reality-keypair"
            "   get-port                                        Return an available port"
            "   ss2022                                          Return a password for Shadowsocks 2022\n"
            "General:"
            "   a, add [protocol] [args... | auto]              Add configuration"
            "   c, change [name] [option] [args... | auto]      Change configuration"
            "   d, del [name]                                   Delete configuration**"
            "   i, info [name]                                  View configuration"
            "   qr [name]                                       QR code information"
            "   url [name]                                      URL information"
            "   log                                             View logs"
            # "   logerr                                          View error logs\n"
            "Change:"
            # "   dp, dynamicport [name] [start | auto] [end]     Change dynamic port"
            "   full [name] [...]                               Change multiple parameters"
            "   id [name] [uuid | auto]                         Change UUID"
            "   host [name] [domain]                            Change domain"
            "   port [name] [port | auto]                       Change port"
            "   path [name] [path | auto]                       Change path"
            "   passwd [name] [password | auto]                 Change password"
            "   key [name] [Private key | auto] [Public key]    Change keys"
            # "   type [name] [type | auto]                       Change camouflage type"
            "   method [name] [method | auto]                   Change encryption method"
            "   sni [name] [ip | domain]                        Change serverName"
            # "   seed [name] [seed | auto]                       Change mKCP seed"
            "   new [name] [...]                                Change protocol"
            "   web [name] [domain]                             Change camouflage website\n"
            "Advanced:"
            "   dns [...]                                       Set DNS"
            "   dd, ddel [name...]                              Delete multiple configurations**"
            "   fix [name]                                      Fix a configuration"
            "   fix-all                                         Fix all configurations"
            "   fix-caddyfile                                   Fix Caddyfile"
            "   fix-config.json                                 Fix config.json"
            "   import                                          Import xray/v2ray script configuration\n"
            "Management:"
            "   un, uninstall                                   Uninstall"
            "   u, update [core | sh | caddy] [ver]             Update"
            "   U, update.sh                                    Update script"
            "   s, status                                       Running status"
            "   start, stop, restart [caddy]                    Start, stop, restart"
            "   t, test                                         Test run"
            "   reinstall                                       Reinstall script\n"
            "Testing:"
            # "   client, genc [name]                             Show client JSON for reference only"
            "   debug [name]                                    Show debug information for reference only"
            "   gen [...]                                       Equivalent to add, but only shows JSON content without creating files, for testing"
            "   no-auto-tls [...]                               Equivalent to add, but disables auto TLS configuration, usable for *TLS related protocols"
            # "   xapi [...]                                      Equivalent to $is_core api, but API backend uses currently running $is_core_name service\n"
            "Other:"
            "   bbr                                             Enable BBR if supported"
            "   bin [...]                                       Run $is_core_name commands, e.g., $is_core bin help"
            "   [...] [...]                                     Compatible with most $is_core_name commands, e.g., $is_core_name generate uuid"
            "   h, help                                         Show this help screen\n"
        )
        for v in "${help_info[@]}"; do
            msg "$v"
        done
        msg "Use del, ddel with caution. These options delete configurations directly without confirmation"
        msg "Report issues) $(msg_ul https://github.com/${is_sh_repo}/issues) "
        msg "Documentation) $(msg_ul https://github.com/ib729/singbox-script/blob/main/docs/sing-box-script-en.md)"
        ;;

    esac
}

about() {
    unset c n m s b
    msg
    msg "Website: $(msg_ul https://github.com/ib729/singbox-script)"
    msg "Channel: $(msg_ul https://github.com/ib729/singbox-script)"
    msg "Group: $(msg_ul https://github.com/ib729/singbox-script)"
    msg "Github: $(msg_ul https://github.com/${is_sh_repo})"
    msg "Twitter: $(msg_ul https://github.com/ib729)"
    msg "$is_core_name site: $(msg_ul https://sing-box.sagernet.org/)"
    msg "$is_core_name core: $(msg_ul https://github.com/${is_core_repo})"
    msg
}
