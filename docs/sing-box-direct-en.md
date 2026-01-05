# sing-box Script Direct (Relay) Guide

Source repository:
https://github.com/ib729/singbox-script

Date: 2024-05-22 18:13

Using the sing-box script for relaying traffic is simple. This guide uses Direct to forward traffic between servers.

## Preface

This is for users who want a relay. The setup is very simple.

Assume you have two VPS servers, A and B. You want A to forward traffic to B.

Common use case: connections from your region to A are good, then A forwards to B, and B does the final outbound.

Another case: B can unlock certain services but direct connections are poor or blocked, so A acts as a front relay.

Limitation: this only forwards TCP or UDP. TLS traffic is not supported.

## Prerequisite

You must already have the sing-box script installed.

## Flow

First do this, then that, then this again. Easy, right?

## Add a Config on B

On server B, add a sing-box config. Example:

```
sing-box add tcp 233
```

This creates a VMess-TCP config with port 233.

If you already have a config, you can skip creating a new one. Just record B's IP and the port you want to forward to.

## door

Usage:

```
sing-box add door [port] [remote-addr] [remote-port]
```

On server A, run:

```
sing-box add door
```

Then enter B's IP and port. The script will generate a port for A if you do not specify one. To set a custom port, use:

```
sing-box add door <port>
```

## Test

Take the configuration from B and change the address and port to A's IP and the Dokodemo-door port.

Example: if you imported the URL in v2rayN, edit the address/port to point to A. Test and confirm it works.

## One-Click Example

Quickly add a relay config:

```
sing-box add door 233 b.example.com 443
```

Explanation: add a Direct config on port 233, forward to `b.example.com:443`.

You can use a domain name for the target address.

## If You Are Clever

You can also use this as a jump host for other tasks.

For example, forward DNS to 1.1.1.1:

```
sing-box add door 53 1.1.1.1 53
```

Then your port 53 acts as a DNS forwarder. Use your imagination.

## End

That is all. Simple.
