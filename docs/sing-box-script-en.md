# Best sing-box One-Click Install Script

Source repository:
https://github.com/ib729/singbox-script

Date: 2024-05-22 18:13

Best sing-box one-click install and management script. Automatically creates the REALITY protocol; supports TUIC, Trojan, Hysteria2, and all common protocols.

## Features

- Fast installation
- Extremely easy to use
- Zero learning cost
- Automated TLS
- Simplified workflows
- Compatible with sing-box commands
- Powerful quick parameters
- Supports all common protocols
- One-click add VLESS-REALITY (default)
- One-click add TUIC
- One-click add Trojan
- One-click add Hysteria2
- One-click add Shadowsocks 2022
- One-click add VMess-(TCP/HTTP/QUIC)
- One-click add VMess-(WS/H2/HTTPUpgrade)-TLS
- One-click add VLESS-(WS/H2/HTTPUpgrade)-TLS
- One-click add Trojan-(WS/H2/HTTPUpgrade)-TLS
- One-click enable BBR
- One-click change camouflage website
- One-click change (port/UUID/password/domain/path/encryption/SNI/etc)
- And more

## Design Philosophy

Design philosophy: high efficiency, super fast, extremely easy to use.

This script is based on the author's own usage needs, with multi-config concurrent running as the core design.

It is also optimized for the four most common functions: add, change, view, delete.

You only need a single command to add, change, view, or delete configurations.

For example, adding a configuration takes less than 1 second in most cases.

The parameters are highly efficient and easy to use. Please learn them. Read on and you will see how smooth the workflow can be.

## Supported Protocol List

TUIC
Trojan
Hysteria2
VMess-WS
VMess-TCP
VMess-HTTP
VMess-QUIC
Shadowsocks
VMess-H2-TLS
VMess-WS-TLS
VLESS-H2-TLS
VLESS-WS-TLS
Trojan-H2-TLS
Trojan-WS-TLS
VMess-HTTPUpgrade-TLS
VLESS-HTTPUpgrade-TLS
Trojan-HTTPUpgrade-TLS
VLESS-REALITY
VLESS-HTTP2-REALITY
Socks

## Provider Recommendation

If you only need a simple proxy for general use, you can buy a provider and skip self-hosting.

Recommendation: Just My Socks
https://on.affpass.com/go/jms

Just My Socks is a Shadowsocks and V2Ray service provided by BandwagonHost. It is a non-mainland vendor, so there is less risk of IP blocks or sudden shutdowns.

Purchase guide:
https://bwgjms.com/post/how-to-buy-justmysocks/

## Setup Tutorial

If you are a beginner, see:
https://github.com/ib729/singbox-script/blob/main/docs/sing-box-script-en.md#install

## Install

Supported systems: Ubuntu, Debian, CentOS. Ubuntu 22 is recommended. Use CentOS with caution; the script may not run correctly.

Run:

```bash
bash <(wget -qO- -o- https://github.com/ib729/singbox-script/raw/main/install.sh)
```

If you need a specific sing-box version, add `-v ver` to the install command.

To see install help, add `-h` to the install command.

## After Installation

If the install command finishes without errors, you will see output similar to the original screenshot.

The script prints timestamps to help with installation time feedback.

In most cases, installation finishes within 15 seconds, and can be as fast as 1 second in ideal conditions.

If it takes more than 15 seconds, consider a better VPS. The original author recommends BandwagonHost VPS.

For convenience, the script automatically creates a VLESS-REALITY configuration after installation.

You can copy the URL into your client (e.g., v2rayN) to test.

If it does not work, try adding an SS config to test again:

```bash
sing-box add ss auto auto aes-256-gcm
```

## Management Panel

After installation, run `sing-box` or `sb` to open the management panel.

If you do not want to run any action, press Enter to exit.

For convenience, the script creates `sb` as a shortcut for `sing-box`.

## Cannot Use (Troubleshooting)

Most failures fall into two categories:

1) Port is not reachable
2) Client core is incompatible or too old

If your VPS has an external firewall, make sure the port is open.

Test port connectivity:
https://tcp.ping.pe/

Enter your VPS IP and port in the form `ip:port`, for example `1.1.1.1:443`, then click Go or press Enter.

If it shows successful, the port is reachable. If it shows failed, the port is blocked.

Tip: use `sb ip` to view your VPS IP.

Disable firewall:

```
systemctl stop firewalld; systemctl disable firewalld; ufw disable
```

After disabling, test the port again. If it is still blocked, you likely have an external firewall. The port must be reachable for it to work.

If the port is reachable, add an SS config to test the core:

```
sb add ss auto auto aes-256-gcm
```

By default, the sing-box core is the latest version. If your client cannot connect, your client core may be too old.

Try different clients (v2rayN, v2rayNG, etc). Try enabling VMessAEAD. Some clients require `alterid` to be 0.

Update your client core so it matches the server version.

## Quick Start

The script simplifies the most common tasks: add, change, view, delete. Use the examples below to get started.

Add configuration:

- `sb add` -> add a config
- `sb add reality` -> add a VLESS-REALITY config
- `sb add reality 443 auto dl.google.com` -> same, with port 443 and SNI dl.google.com
- `sb add hy` -> add a Hysteria2 config
- `sb add ss` -> add a Shadowsocks 2022 config
- `sb add tcp` -> add a VMess-TCP config

Note: when using `sb add`, only TLS-related protocols require a domain; others can be automated.

For more add parameters, see the add section below.

Change configuration:

- `sb change` -> change a config
- `sb change reality` -> change a REALITY config
- `sb change reality sni 1.1.1.1` -> change REALITY SNI to 1.1.1.1 (also `sb sni reality 1.1.1.1`)
- `sb change tcp` -> change a TCP config
- `sb change tcp port auto` -> change TCP port, auto-generate (also `sb port tcp auto`)

For more change parameters, see the change section below.

View configuration:

- `sb info` -> view a config
- `sb info REALITY` -> view REALITY config
- `sb info tcp` -> view TCP config

Delete configuration:

- `sb del` -> delete a config
- `sb del REALITY` -> delete REALITY config
- `sb del tcp` -> delete TCP config

Be careful with delete.

When only one config matches, it is selected automatically. Otherwise, a list is shown and you must choose one.

## add

The `add` parameter adds a configuration. Use `auto` for optional parameters to let the script fill them automatically.

Usage:

```
sb add [protocol] [args... | auto]
```

Examples:

- `sb add`
- `sb add h2`
- `sb add ws`
- `sb add ss`
- `sb add hy`
- `sb add tcp`
- `sb add tuic`
- `sb add reality`

Note: when optional parameters are omitted, they default to `auto`. TLS protocols still require a domain.

For example, `sb add tcp` equals `sb add tcp auto auto auto`.

### Add VLESS-REALITY

Optional parameters: port, UUID, SNI

Usage:

```
sb add reality [port] [uuid] [sni]
```

Examples:

- `sb add reality`
- `sb add reality 443 auto dl.google.com`

Note: `reality` can be shortened to `r`.

### Add VLESS-HTTP2-REALITY

Optional parameters: port, UUID, SNI

Usage:

```
sb add rh2 [port] [uuid] [sni]
```

Examples:

- `sb add rh2`
- `sb add rh2 443 auto dl.google.com`

### Add TUIC

Optional parameters: port, UUID

Usage:

```
sb add tuic [port] [uuid]
```

Examples:

- `sb add tuic`
- `sb add tuic 443`

### Add Trojan

Optional parameters: port, password

Usage:

```
sb add trojan [port] [password]
```

Examples:

- `sb add trojan`
- `sb add trojan 443`

### Add Hysteria2

Optional parameters: port, password

Usage:

```
sb add hy [port] [password]
```

Examples:

- `sb add hy`
- `sb add hy 443`

### Add Shadowsocks 2022

Optional parameters: port, password, method

Usage:

```
sb add ss [port] [password] [method]
```

Examples:

- `sb add ss`
- `sb add ss 443`
- `sb add ss 443 auto 2022-blake3-aes-128-gcm`
- `sb add ss 233 233boy aes-128-gcm`

If you need a valid SS2022 password, generate one with:

```
sb ss2022
```

### Add Socks

Optional parameters: port, username, password

Usage:

```
sb add socks [port] [username] [password]
```

Examples:

- `sb add socks`
- `sb add socks 233 233boy 233boy.com`

### Add VMess-(WS/TCP/HTTP/QUIC)

Optional parameters: port, UUID

Usage:

```
sb add [ws | tcp | http | quic] [port] [uuid]
```

Examples:

- `sb add ws` -> VMess-WS
- `sb add tcp` -> VMess-TCP
- `sb add http` -> VMess-HTTP
- `sb add quic` -> VMess-QUIC
- `sb add tcp 233 auto` -> port 233, auto UUID

### Add VMess-(WS/H2/HTTPUpgrade)-TLS

Optional parameters: domain, UUID, path

Usage:

```
sb add [wss | h2 | hu] [host] [uuid] [/path]
```

Examples:

- `sb add wss` -> VMess-WS-TLS
- `sb add h2` -> VMess-H2-TLS
- `sb add hu` -> VMess-HTTPUpgrade-TLS
- `sb add wss 233boy.com` -> domain 233boy.com
- `sb add h2 233boy.com auto /h2`
- `sb add hu 233boy.com auto /mypath`

### Add VLESS-(WS/H2/HTTPUpgrade)-TLS

Optional parameters: domain, UUID, path

Usage:

```
sb add [vws | vh2 | vhu] [host] [uuid] [/path]
```

Examples:

- `sb add vws` -> VLESS-WS-TLS
- `sb add vh2` -> VLESS-H2-TLS
- `sb add vhu` -> VLESS-HTTPUpgrade-TLS
- `sb add vws 233boy.com` -> domain 233boy.com
- `sb add vh2 233boy.com auto /h2`
- `sb add vhu 233boy.com auto /HTTPUpgrade`

### Add Trojan-(WS/H2/HTTPUpgrade)-TLS

Optional parameters: domain, UUID, path

Usage:

```
sb add [tws | th2 | thu] [host] [uuid] [/path]
```

Examples:

- `sb add tws` -> Trojan-WS-TLS
- `sb add th2` -> Trojan-H2-TLS
- `sb add thu` -> Trojan-HTTPUpgrade-TLS
- `sb add tws 233boy.com` -> domain 233boy.com
- `sb add th2 233boy.com auto /h2`
- `sb add thu 233boy.com auto /HTTPUpgrade`

You can also use full protocol names. For example, `sb add Hysteria2` equals `sb add hy`. `sb add Shadowsocks` equals `sb add ss`.

In most cases, you only need the protocol. Examples: `sb add tcp`, `sb add hy`, `sb add tuic`.

## no-auto-tls

`no-auto-tls` is the same as `add`, but disables automatic TLS configuration. It can be used for TLS protocols.

Usage:

```
sb no-auto-tls [protocol] [args... | auto]
```

Examples:

- `sb no-auto-tls`
- `sb no-auto-tls wss`
- `sb no-auto-tls vh2 233boy.com`
- `sb no-auto-tls vhu 233boy.com`

Use this if you want to configure TLS manually (e.g., with NGINX).

Help:
https://github.com/ib729/singbox-script/blob/main/docs/sing-box-script-en.md#no-auto-tls

## [name]

When you have many configurations, use `[name]` to match and quickly select a config for change, view, or delete.

We recommend using port or domain to match.

If only one config matches, it is selected automatically. Otherwise, a list is shown and you must choose one.

## change

`change` modifies a configuration.

Usage:

```
sb change [name] [option] [args... | auto]
```

Options:

| Option | Parameters | Purpose | auto |
| --- | --- | --- | --- |
| full | [...] | change multiple parameters | other |
| id | [uuid] | change UUID | yes |
| host | [domain] | change domain | - |
| port | [port] | change port | yes |
| path | [/path] | change path | yes |
| passwd | [password] | change password | yes |
| key | [private key] [public key] | change keys | yes |
| method | [method] | change encryption method | yes |
| sni | [domain] | change serverName | yes |
| new | [...] | change protocol | other |
| web | [domain] | change camouflage website | - |

If `auto` is supported, you can set the parameter to `auto` to auto-generate values. If `auto` is listed as other, see the `add` section for parameter rules. `full` is similar to `sb add current-protocol [...]`. `new` is similar to `sb add [...]`.

Examples:

- `sb change` -> change a config
- `sb change tcp` -> change a TCP config
- `sb change tcp port 233` -> change TCP port to 233
- `sb change tcp port auto` -> change TCP port and auto-generate
- `sb change tuic id auto` -> change TUIC UUID and auto-generate
- `sb change tls host 233boy.com` -> change TLS domain
- `sb change tls web example.com` -> change TLS camouflage site
- `sb change reality sni 1.1.1.1` -> change REALITY SNI

You can also use the option directly:

```
sb [option] [name] [...]
```

Examples:

- `sb id` -> change UUID
- `sb port` -> change port
- `sb port tcp 233` -> change TCP port to 233
- `sb id tcp` -> change TCP UUID
- `sb id tcp auto` -> change TCP UUID, auto-generate
- `sb host tls 233boy.com` -> change TLS domain
- `sb web tls example.com` -> change TLS camouflage site
- `sb sni reality 1.1.1.1` -> change REALITY SNI

Most users can simply use `sb change`.

## info

`info` shows configuration details.

Usage:

```
sb info [name]
```

Examples:

- `sb info`
- `sb info tcp`
- `sb info tuic`
- `sb info tls`

## import

`import` imports configurations from the author's xray/v2ray scripts for unified management.

Usage:

```
sb import
```

Only configs created by the author's xray/v2ray scripts can be imported, and only some configs are supported. Imported configs will no longer be visible or managed in the original scripts.

## url

`url` generates the URL link for a configuration.

Usage:

```
sb url [name]
```

Examples:

- `sb url`
- `sb url tcp`
- `sb url hy`
- `sb url tls`

## qr

`qr` generates the QR code for a configuration.

Usage:

```
sb qr [name]
```

Examples:

- `sb qr`
- `sb qr tcp`
- `sb qr hy`
- `sb qr tls`

## del

`del` deletes a configuration.

Usage:

```
sb del [name]
```

Examples:

- `sb del`
- `sb del tcp`
- `sb del tuic`
- `sb del tls`

Use with caution.

## ddel

`ddel` deletes multiple configurations.

Usage:

```
sb ddel [name...]
```

Examples:

- `sb ddel`
- `sb ddel tcp tuic` -> delete one TCP and one TUIC config

Note: a `[name]` only deletes when it matches exactly one config.

Use with caution.

## gen

`gen` is like `add`, but only returns JSON and does not create a configuration.

Usage:

```
sb gen [protocol] [args... | auto]
```

Examples:

- `sb gen ss`
- `sb gen tcp`
- `sb gen hy2`
- `sb gen tuic`
- `sb gen reality 2333`
- `sb gen vws 233boy.com`

## bbr

Enable BBR optimization.

Usage:

```
sb bbr
```

## bin

`bin` runs sing-box core commands directly and is compatible with all sing-box commands.

Usage:

```
sb bin [...]
```

Example:

```
sb bin help
```

Default compatible commands:

```
check | completion | format | generate | geoip | geosite | merge | rule-set | run | tools
```

Example:

```
sb generate uuid
```

## fix-config.json

Fixes `config.json`.

Usage:

```
sb fix-config.json
```

## update

Update components.

Usage:

```
sb update [core | sh | caddy] [ver]
```

Examples:

- `sb update` -> update core
- `sb update core` -> update core
- `sb update core v1.8.13` -> update core to v1.8.13
- `sb update sh` -> update script
- `sb update caddy` -> update Caddy

## log

View or set runtime log level.

Usage:

```
sb log [trace | debug | info | warn | error | fatal | panic | none | del]
```

Examples:

- `sb log` -> view logs
- `sb log [level]` -> set log level

To avoid large log files, use `sb log del` to delete log files, or `sb log none` to disable logging.

## status

Show running status.

Usage:

```
sb status
```

## start, stop, restart

Manage sing-box start/stop/restart.

Usage:

```
sb [start | stop | restart] [caddy]
```

Examples:

- `sb restart` -> restart sing-box
- `sb restart caddy` -> restart Caddy

## reinstall

Reinstall the script.

Usage:

```
sb reinstall
```

## uninstall

Uninstall the script.

Usage:

```
sb uninstall
```

## Set DNS

See:
https://github.com/ib729/singbox-script/blob/main/docs/sing-box-dns-en.md

## Direct (Relay)

If you want to forward traffic from machine A to machine B, see:
https://github.com/ib729/singbox-script/blob/main/docs/sing-box-direct-en.md

## Help

Other options are documented in the help output.

Usage:

```
sb help
```

## Directory

All script files are stored under `/etc/sing-box`.

- Script: `/etc/sing-box/sh`
- Core: `/etc/sing-box/bin`
- Configs: `/etc/sing-box/conf`

The layout is designed to allow one-command removal.

## Reminder

If you add a TLS-based config, set a camouflage website. Use:

```
sb web tls
```

## Camouflage Website

A camouflage website is a reverse proxy so that visiting your domain shows content from the camouflage site.

## Automatic TLS

Help:
https://github.com/ib729/singbox-script/blob/main/docs/sing-box-caddy-auto-tls-en.md
