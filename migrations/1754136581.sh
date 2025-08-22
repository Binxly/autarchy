echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "autarchy-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  autarchy-refresh-hypridle
  autarchy-refresh-hyprlock
fi
