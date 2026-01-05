get_latest_version() {
    case $1 in
    core)
        name=$is_core_name
        url="https://api.github.com/repos/${is_core_repo}/releases/latest?v=$RANDOM"
        ;;
    sh)
        name="$is_core_name script"
        latest_ver=main
        return
        ;;
    caddy)
        name="Caddy"
        url="https://api.github.com/repos/$is_caddy_repo/releases/latest?v=$RANDOM"
        ;;
    esac
    latest_ver=$(_wget -qO- $url | grep tag_name | grep -E -o 'v([0-9.]+)')
    [[ ! $latest_ver ]] && {
        err "Failed to get latest version of ${name}"
    }
    unset name url
}
download() {
    latest_ver=$2
    [[ ! $latest_ver ]] && get_latest_version $1
    # tmp dir
    tmpdir=$(mktemp -u)
    [[ ! $tmpdir ]] && {
        tmpdir=/tmp/tmp-$RANDOM
    }
    mkdir -p $tmpdir
    case $1 in
    core)
        name=$is_core_name
        tmpfile=$tmpdir/$is_core.tar.gz
        link="https://github.com/${is_core_repo}/releases/download/${latest_ver}/${is_core}-${latest_ver:1}-linux-${is_arch}.tar.gz"
        download_file
        tar zxf $tmpfile --strip-components 1 -C $is_core_dir/bin
        chmod +x $is_core_bin
        ;;
    sh)
        name="$is_core_name script"
        tmpfile=$tmpdir/sh.tar.gz
        link="https://github.com/${is_sh_repo}/archive/refs/heads/main.tar.gz"
        download_file
        is_sh_unpack_dir=$tmpdir/sh-unpack
        mkdir -p $is_sh_unpack_dir
        tar zxf $tmpfile -C $is_sh_unpack_dir || err "\nFailed to extract ${name}\n"
        is_sh_root_dir=
        if type -P find >/dev/null 2>&1; then
            is_sh_detect_core=$(find "$is_sh_unpack_dir" -type f -path "*/src/core.sh" -print -quit 2>/dev/null)
            [[ $is_sh_detect_core ]] && is_sh_root_dir=${is_sh_detect_core%/src/core.sh}
        fi
        if [[ ! $is_sh_root_dir ]]; then
            is_sh_root_dir=$(find "$is_sh_unpack_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | head -n1)
        fi
        [[ ! $is_sh_root_dir ]] && err "\nFailed to extract ${name}\n"
        cp -rf $is_sh_root_dir/. $is_sh_dir
        chmod +x $is_sh_bin ${is_sh_bin/$is_core/sb}
        ;;
    caddy)
        name="Caddy"
        tmpfile=$tmpdir/caddy.tar.gz
        # https://github.com/caddyserver/caddy/releases/download/v2.6.4/caddy_2.6.4_linux_amd64.tar.gz
        link="https://github.com/${is_caddy_repo}/releases/download/${latest_ver}/caddy_${latest_ver:1}_linux_${is_arch}.tar.gz"
        download_file
        tar zxf $tmpfile -C $tmpdir
        cp -f $tmpdir/caddy $is_caddy_bin
        chmod +x $is_caddy_bin
        ;;
    esac
    rm -rf $tmpdir
    unset latest_ver
}
download_file() {
    if ! _wget -t 5 -c $link -O $tmpfile; then
        rm -rf $tmpdir
        err "\nFailed to download ${name}\n"
    fi
}
