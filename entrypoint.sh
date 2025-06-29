#!/bin/sh

# Ensure /run/kea exists at runtime
mkdir -p /run/kea
chmod 755 /run/kea

# Start Kea DHCPv6
exec /usr/sbin/kea-dhcp6 -c /etc/kea/kea.conf

