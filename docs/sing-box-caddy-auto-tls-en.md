# sing-box Script Automatic TLS (Caddy) Help

Source repository:
https://github.com/ib729/singbox-script

Date: 2024-05-22 18:13

The sing-box script uses Caddy to configure TLS automatically.

## Introduction

Caddy is excellent and very easy to use.

## Official Site

https://caddyserver.com/

## Directories

- Caddy config directory: `/etc/caddy`
- Custom config directory: `/etc/caddy/sites`
- sing-box auto TLS configs: `/etc/caddy/233boy`

## Change Auto TLS Config

Auto TLS configs are stored in `/etc/caddy/233boy`.

Each domain generates two files:

- `domain.conf`
- `domain.conf.add`

Do not edit `domain.conf` directly.

If you want to customize, edit `domain.conf.add`, then restart Caddy:

```
sing-box restart caddy
```

Note: if you change the camouflage website using the script, `domain.conf.add` will be reset.

## Reminder

Do not edit `/etc/caddy/Caddyfile` directly. If you want to add other Caddy sites, use the custom config directory.

## Custom Configs

Use `/etc/caddy/sites` for additional Caddy sites. Files must have the `.conf` extension.

This is for Caddy configs only, not for HTML or static site files.

## Certificates

Caddy automatically issues SSL certificates.

They are stored under:

```
/root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory
```

Inside this directory, find your domain and use the `.crt` and `.key` files.

## Other

If you do not want Caddy, use `no-auto-tls` and configure TLS manually. See:

https://github.com/ib729/singbox-script/blob/main/docs/sing-box-script-en.md#no-auto-tls
