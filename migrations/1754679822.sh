echo "Lock 1password on screen lock"

if ! grep -q "autarchy-lock-screen" ~/.config/hypr/hypridle.conf; then
  autarchy-refresh-hypridle
fi
