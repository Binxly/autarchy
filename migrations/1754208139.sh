echo "Ensure screensaver doesn't start while the computer is locked"

if ! grep -q "pidof hyprlock || autarchy-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  autarchy-refresh-hypridle
fi
