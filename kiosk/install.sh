#!/bin/sh
# Infinity Radio: make the Pi open the radio screen by itself after it starts.
#
# Writes ONE small file in your own settings folder:
#   ~/.config/autostart/infinity-radio.desktop
# That file tells the desktop to run kiosk/start.sh when you log in.
# Needs no administrator rights. Undo with:  sh ~/radio/kiosk/uninstall.sh

DIR="$(cd "$(dirname "$0")/.." && pwd)"
AUTO="$HOME/.config/autostart"
FILE="$AUTO/infinity-radio.desktop"

mkdir -p "$AUTO"
cat > "$FILE" <<EOF
[Desktop Entry]
Type=Application
Name=Infinity Radio
Comment=Open the radio screen full-screen
Exec=sh "$DIR/kiosk/start.sh"
Terminal=false
EOF

echo "Installed: $FILE"
echo "Radio folder: $DIR"
echo "Browser: $(command -v chromium || command -v chromium-browser || echo NOT FOUND)"
echo "--- desktop startup list (for Claude) ---"
cat /etc/xdg/labwc/autostart 2>/dev/null || echo "(no /etc/xdg/labwc/autostart)"
echo "--- end ---"
echo "Next: restart the Pi. To leave the radio screen press Alt+F4."
