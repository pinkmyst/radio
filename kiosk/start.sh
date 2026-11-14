#!/bin/sh
# Infinity Radio: start the radio screen full-screen on the Pi.
#
# 1. Hands out the radio's files to this Pi only (127.0.0.1), never to the network.
# 2. Opens Chromium full-screen (kiosk) on the radio page, with its own separate
#    browser profile so it does not mix with normal browsing.
# 3. When Chromium closes (Alt+F4), stops the file server again.
#
# Needs no administrator rights and installs nothing.

DIR="$(cd "$(dirname "$0")/.." && pwd)"
PORT=8080
BASE="http://127.0.0.1:$PORT"
PAGE="$BASE/radio-3d-head-tracking.html?kiosk=1"
PROFILE="$HOME/.config/infinity-radio-kiosk"

up() { curl -s -o /dev/null --max-time 2 "$BASE/radio-3d-head-tracking.html"; }

SERVER_PID=""
if ! up; then
  python3 -m http.server "$PORT" --bind 127.0.0.1 --directory "$DIR" >/dev/null 2>&1 &
  SERVER_PID=$!
fi
trap '[ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null' EXIT INT TERM

# Wait up to 20 seconds for the files to be available.
i=0
while ! up; do
  i=$((i + 1))
  [ "$i" -ge 40 ] && { echo "Radio files did not become available on $BASE" >&2; exit 1; }
  sleep 0.5
done

BROWSER="$(command -v chromium || command -v chromium-browser)"
[ -z "$BROWSER" ] && { echo "Chromium was not found" >&2; exit 1; }

"$BROWSER" \
  --kiosk \
  --no-first-run \
  --noerrdialogs \
  --disable-session-crashed-bubble \
  --autoplay-policy=no-user-gesture-required \
  --password-store=basic \
  --user-data-dir="$PROFILE" \
  "$PAGE"
