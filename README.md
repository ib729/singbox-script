# 233boy's sing-box Script

# Introduction

The best sing-box one-click installation & management script

# Features

- Quick installation
- Incredibly easy to use
- Zero learning curve
- Automated TLS
- Simplified workflows
- Compatible with sing-box commands
- Powerful shortcut parameters
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
- One-click change (port/UUID/password/domain/path/encryption method/SNI/etc...)
- And more...

# Design Philosophy

Design philosophy: **High efficiency, ultra-fast, extremely easy to use**

The script is based on the author's own usage needs, designed with **running multiple configurations simultaneously** as the core concept

It has been specially optimized for the four common functions: add, change, view, and delete

You only need one command to complete operations such as add, change, view, delete, etc.

For example, adding a configuration takes less than 1 second! Instant completion! Other operations are the same!

The script's parameters are very efficient and super easy to use, please master the use of parameters

# Documentation

Installation and usage: https://233boy.com/sing-box/sing-box-script/

# Help

Usage: `sing-box help`

```
sing-box script v1.0 by 233boy
Usage: sing-box [options]... [args]...

Basic:
   v, version                                      Show current version
   ip                                              Return current host IP
   pbk                                             Equivalent to sing-box generate reality-keypair
   get-port                                        Return an available port
   ss2022                                          Return a password for Shadowsocks 2022

General:
   a, add [protocol] [args... | auto]              Add configuration
   c, change [name] [option] [args... | auto]      Change configuration
   d, del [name]                                   Delete configuration**
   i, info [name]                                  View configuration
   qr [name]                                       QR code information
   url [name]                                      URL information
   log                                             View logs

Change:
   full [name] [...]                               Change multiple parameters
   id [name] [uuid | auto]                         Change UUID
   host [name] [domain]                            Change domain
   port [name] [port | auto]                       Change port
   path [name] [path | auto]                       Change path
   passwd [name] [password | auto]                 Change password
   key [name] [Private key | auto] [Public key]    Change keys
   method [name] [method | auto]                   Change encryption method
   sni [name] [ip | domain]                        Change serverName
   new [name] [...]                                Change protocol
   web [name] [domain]                             Change camouflage website

Advanced:
   dns [...]                                       Set DNS
   dd, ddel [name...]                              Delete multiple configurations**
   fix [name]                                      Fix a configuration
   fix-all                                         Fix all configurations
   fix-caddyfile                                   Fix Caddyfile
   fix-config.json                                 Fix config.json
   import                                          Import sing-box/v2ray script configuration

Management:
   un, uninstall                                   Uninstall
   u, update [core | sh | caddy] [ver]             Update
   U, update.sh                                    Update script
   s, status                                       Running status
   start, stop, restart [caddy]                    Start, stop, restart
   t, test                                         Test run
   reinstall                                       Reinstall script

Testing:
   debug [name]                                    Show some debug info, for reference only
   gen [...]                                       Equivalent to add, but only shows JSON content, doesn't create files, for testing
   no-auto-tls [...]                               Equivalent to add, but disables auto TLS configuration, usable for *TLS related protocols

Other:
   bbr                                             Enable BBR, if supported
   bin [...]                                       Run sing-box commands, e.g.: sing-box bin help
   [...] [...]                                     Compatible with most sing-box commands, e.g.: sing-box generate uuid
   h, help                                         Show this help screen

Use del, ddel with caution, these options will directly delete configurations; no confirmation required
Feedback) https://github.com/233boy/sing-box/issues
Documentation) https://233boy.com/sing-box/sing-box-script/
```
