#!/bin/bash
echo "CREATED BY ANESTUS UDUME FROM BENTECH SECURITY"
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <ip-address-range> <port-range>"
    exit 1
fi

for ip in $(seq -f "$1.%g" 1 254); do
    for port in $(seq "$2"); do
        (echo >/dev/tcp/"$ip"/"$port") >/dev/null 2>&1 && echo "Host $ip is up and port $port is open"
    done
done
