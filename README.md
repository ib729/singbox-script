# 233boy's sing-box Script

## Introduction

The best sing-box one-click installation & management script now in English.

## Features

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

## Design Philosophy

Design philosophy: **High efficiency, ultra-fast, extremely easy to use**

The script is based on the author's own usage needs, designed with **running multiple configurations simultaneously** as the core concept

It has been specially optimized for the four common functions: add, change, view, and delete

You only need one command to complete operations such as add, change, view, delete, etc.

For example, adding a configuration takes less than 1 second! Instant completion! Other operations are the same!

The script's parameters are very efficient and super easy to use, please master the use of parameters

## Quick Start

## Documentation

- https://github.com/ib729/singbox-script/blob/main/docs/sing-box-script-en.md
- https://github.com/ib729/singbox-script/blob/main/docs/sing-box-dns-en.md
- https://github.com/ib729/singbox-script/blob/main/docs/sing-box-direct-en.md
- https://github.com/ib729/singbox-script/blob/main/docs/sing-box-caddy-auto-tls-en.md

### Installation

Execute this command to install (English version):

```bash
bash <(wget -qO- -o- https://github.com/ib729/singbox-script/raw/main/install.sh)
```

Or use the original Chinese version:

```bash
bash <(wget -qO- -o- https://github.com/ib729/singbox-script/raw/main/install.sh)
```

**Installation Options:**
- `-f <path>` - Custom sing-box file path
- `-l` - Local installation (use current directory)
- `-p <proxy>` - Use proxy for download (e.g., `-p http://127.0.0.1:2333`)
- `-v <version>` - Custom sing-box version (e.g., `-v v1.8.13`)
- `-h` - Show help

### Basic Usage

After installation, use `sing-box` or `sb` to access the management interface:

```bash
sing-box          # Interactive menu
sing-box help     # Show help
```

**Common Commands:**

```bash
# Add configuration
sing-box add reality           # Add VLESS-REALITY (default)
sing-box add hysteria2         # Add Hysteria2
sing-box add trojan            # Add Trojan

# View configuration
sing-box info [name]           # View specific config
sing-box qr [name]             # Show QR code
sing-box url [name]            # Show URL

# Modify configuration
sing-box change [name] port 8443           # Change port
sing-box change [name] uuid auto           # Auto-generate new UUID
sing-box change [name] path /newpath       # Change path

# Management
sing-box status                # Check status
sing-box start                 # Start service
sing-box stop                  # Stop service
sing-box restart               # Restart service
sing-box update                # Update script
```

## Help

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
```

Use `del` and `ddel` with caution. These options delete configurations directly without confirmation.

## Links

- **Repository:** https://github.com/ib729/singbox-script
- **Official sing-box:** https://sing-box.sagernet.org/

## Acknowledgements

- [233boy](https://github.com/233boy) 
- [Ivan Belousov](https://github.com/ib729) 
