#!/usr/bin/env bash
iface="eth0" # or wlan0, whichever you use

# Read initial counters
rx0=$(</sys/class/net/$iface/statistics/rx_bytes)
tx0=$(</sys/class/net/$iface/statistics/tx_bytes)
sleep 1
rx1=$(</sys/class/net/$iface/statistics/rx_bytes)
tx1=$(</sys/class/net/$iface/statistics/tx_bytes)

# Calculate speeds
rx=$((rx1 - rx0))
tx=$((tx1 - tx0))

# Format as human-readable
down=$(numfmt --to=iec --suffix=B/s <<<"$rx")
up=$(numfmt --to=iec --suffix=B/s <<<"$tx")

# Print two lines separated by newline
printf "%s down\n%s up\n" "$down" "$up"
