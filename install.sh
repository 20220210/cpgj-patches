#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"
cat payload/part-*.b64 | tr -d '\r\n' | base64 -d > resin-dual-p2c-r6.tar.gz
echo "0965b4d94df0e9d0d73b3009cbbfd1cd122df541c5646fcc9bf027a5bdf4e58c  resin-dual-p2c-r6.tar.gz" | sha256sum -c -
rm -rf resin-dual-p2c-r6
mkdir resin-dual-p2c-r6
tar -xzf resin-dual-p2c-r6.tar.gz -C resin-dual-p2c-r6 --strip-components=1
cd resin-dual-p2c-r6
exec bash deploy.sh
