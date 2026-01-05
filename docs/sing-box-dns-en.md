# sing-box Script DNS Settings

Source repository:
https://github.com/ib729/singbox-script

Date: 2024-05-22 18:13

The sing-box script can configure DNS quickly. It supports one-click DNS-over-HTTPS (DoH) with encryption, blocking adult sites, or custom DNS.

## Preface

DNS is the beginning of network access. If you cannot reach websites, your DNS might be broken (this section focuses on server-side DNS, not client DNS).

By default, DNS queries use UDP port 53. These queries are unencrypted, so a VPS provider or network operator can see which domains you query. If you care about privacy, using DNS-over-HTTPS (DoH) is recommended.

The sing-box script supports DNS via IP and DNS via DoH (HTTP/3), and it also allows custom DNS.

## Set DNS

Run:

```
sing-box dns
```

Then choose a DNS option.

`set` allows custom DNS.

`none` disables DNS configuration.

## Google

- Set Google DNS: `sing-box dns 88`
- Set Google DNS DoH: `sing-box dns gg`

## Cloudflare

- Set Cloudflare DNS: `sing-box dns 11`
- Set Cloudflare DNS DoH: `sing-box dns cf`

## nosex

- Set Cloudflare Family DNS DoH: `sing-box dns nosex`

Note: this blocks adult sites.

## set

- Custom DNS using 9.9.9.9: `sing-box dns set 9.9.9.9`
- Custom DoH using AdGuard: `sing-box dns set https://dns.adguard-dns.com/dns-query`

You can run `sing-box dns set` and enter a value, or pass the value directly, like `sing-box dns set 1.1.1.1`.

## none

If you run into problems, reset DNS with:

```
sing-box dns none
```

This also tells sing-box to use the system DNS.

## End

In practice, remembering `sing-box dns nosex` is enough for most users.

Also, avoid accidentally setting domestic DNS if you are using this for external routing.
