echo "Update Waybar for new Autarchy menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  autarchy-refresh-waybar
fi
