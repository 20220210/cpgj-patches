#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"
TMP="resin-dual-p2c-r6.tar.gz.tmp"
cat > "$TMP.b64" <<'PAYLOAD'
H4sIAAAAAAAAA+xae1Mbx5bP3/oUfcndEJMrpBnNjCSnnFoMckxdDCzI9yaVzaJ59IDKQqMrCdvcOFXC...REPLACE...
PAYLOAD
base64 -d "$TMP.b64" > "$TMP"
rm -f "$TMP.b64"
echo "0965b4d94df0e9d0d73b3009cbbfd1cd122df541c5646fcc9bf027a5bdf4e58c  $TMP" | sha256sum -c -
mv -f "$TMP" resin-dual-p2c-r6.tar.gz
rm -rf resin-dual-p2c-r6
mkdir resin-dual-p2c-r6
tar -xzf resin-dual-p2c-r6.tar.gz -C resin-dual-p2c-r6 --strip-components=1
cd resin-dual-p2c-r6
exec bash deploy.sh
