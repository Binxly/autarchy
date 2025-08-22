echo "Allow updating of timezone by right-clicking on the clock (or running autarchy-cmd-tzupdate)"
if ! command -v tzupdate &>/dev/null; then
  bash ~/.local/share/autarchy/install/config/timezones.sh
  autarchy-refresh-waybar
fi
