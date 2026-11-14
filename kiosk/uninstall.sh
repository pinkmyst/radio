#!/bin/sh
# Infinity Radio: stop the radio screen from opening by itself.
# Removes the one file install.sh wrote. The radio's files stay where they are.

FILE="$HOME/.config/autostart/infinity-radio.desktop"
if [ -f "$FILE" ]; then
  rm "$FILE"
  echo "Removed: $FILE"
else
  echo "Nothing to remove (it was not installed)."
fi
